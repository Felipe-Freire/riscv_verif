"""
Ibex DV Regression Manager — Core Orchestration Engine

Handles the full regression lifecycle:
  Phase 1 (Sequential): Design compilation (comp_duv)
  Phase 2 (Sequential): Stimulus generation (gen)
  Phase 3 (Sequential): Assembly compilation (comp_asm)
  Phase 4 (Parallel):   Simulation execution (sim) via ThreadPoolExecutor
  Phase 5 (Sequential): Coverage merge and reporting (cov)
"""
import _sitebuiltins
import os
import subprocess
import logging
import sys
import glob
import re
import threading
import concurrent.futures
import random


class RegressionManager:
  def __init__(self, args, seed, proj_root):
    self.args = args
    self.seed = seed
    self.proj_root = os.path.abspath(proj_root)
    self.sim_dir = os.path.join(self.proj_root, "sim")
    self.simulator = getattr(args, 'simulator', 'questa')
    self.sim_timeout = getattr(args, 'sim_timeout', 600)
    self.max_workers = getattr(args, 'jobs', None) or max(1, (os.cpu_count() or 4) - 2)
    self.logger = self._setup_logger()
    self.metrics = {'gen': [], 'comp_asm': [], 'sim': []}
    # Lock for thread-safe metrics append during parallel simulation
    self._metrics_lock = threading.Lock()

  def _setup_logger(self):
    logger = logging.getLogger("RegressionManager")
    logger.setLevel(logging.INFO)

    log_dir = os.path.join(self.sim_dir, "out", "logs")
    os.makedirs(log_dir, exist_ok=True)

    fh = logging.FileHandler(os.path.join(log_dir, f"regression_run_{self.seed}.log"))
    ch = logging.StreamHandler()

    formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
    fh.setFormatter(formatter)
    ch.setFormatter(formatter)

    logger.addHandler(fh)
    logger.addHandler(ch)
    return logger

  # =========================================================================
  # Pillar 2: Deadlock-Safe Command Execution
  # =========================================================================

  def _log_to_file(self, text):
    """Write raw output to the log file handler only (bypasses console)."""
    for handler in self.logger.handlers:
      if isinstance(handler, logging.FileHandler):
        handler.stream.write(text)
        handler.stream.flush()  

  def run_cmd(self, cmd, stream=False, timeout=None):
    """
    Execute a shell command safely.

    Args:
        cmd:     Shell command string.
        stream:  If True, stream stdout to console in real-time (thread-safe reader).
                 If False, capture output silently and return it (subprocess.run).
        timeout: Timeout in seconds. None = no timeout.

    Returns:
        (return_code, output_string)
    """
    self.logger.info(f"[EXEC] {cmd}")

    if not stream:
      # --- Batch mode: simple, deadlock-proof ---
      try:
        result = subprocess.run(
          cmd, shell=True,
          stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
          text=True, timeout=timeout
        )
        self._log_to_file(result.stdout)
        return result.returncode, result.stdout
      except subprocess.TimeoutExpired:
        self.logger.error(f"[TIMEOUT] Command exceeded {timeout}s: {cmd}")
        return -1, f"TIMEOUT after {timeout}s"
    else:
      # --- Streaming mode: thread-based reader to prevent pipe deadlock ---
      process = subprocess.Popen(
        cmd, shell=True,
        stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
        text=True
      )
      output_lines = []

      def _reader():
        try:
          for line in process.stdout:
            output_lines.append(line)
            sys.stdout.write(line)
            sys.stdout.flush()
        except ValueError:
          pass  # Pipe closed

      reader_thread = threading.Thread(target=_reader, daemon=True)
      reader_thread.start()

      try:
        process.wait(timeout=timeout)
      except subprocess.TimeoutExpired:
        self.logger.error(f"[TIMEOUT] Simulation exceeded {timeout}s, killing process.")
        process.kill()
        process.wait()

      reader_thread.join(timeout=5)

      full_output = "".join(output_lines)
      self._log_to_file(full_output)
      return process.returncode, full_output

  # =========================================================================
  # Make Command Builder
  # =========================================================================

  def _make_cmd(self, target, **kwargs):
    """
    Build a make command that runs inside sim/ with absolute PROJ_ROOT.

    Example output:
      make -C /path/to/sim -f /path/to/scripts/Makefile comp_rtl PROJ_ROOT=/path/to ...
    """
    makefile = os.path.join(self.proj_root, "scripts", "Makefile")
    parts = [
      f"make -C {self.sim_dir} -f {makefile} {target}",
      f"PROJ_ROOT={self.proj_root}",
      f"SIMULATOR={self.simulator}",
    ]
    for key, value in kwargs.items():
      parts.append(f"{key}={value}")
    return " ".join(parts)

  # =========================================================================
  # Phase Implementations
  # =========================================================================

  def print_table_summary(self, phase_name, data_list):
    if not data_list:
      return
    self.logger.info(f"\n{'='*70}")
    self.logger.info(f"--- {phase_name.upper()} SUMMARY ---")

    header = " | ".join(f"{k:^20}" for k in data_list[0].keys())
    self.logger.info(header)
    self.logger.info("-" * len(header))
    for row in data_list:
      self.logger.info(" | ".join(f"{str(v):^20}" for v in row.values()))
    self.logger.info(f"{'='*70}\n")

  def run_gen(self, test_cfg):
    test_name = test_cfg.get('test')
    iterations = test_cfg.get('iterations', 1)
    isa = test_cfg.get('isa', 'rv32imc')
    self.update_seed()
    cmd = self._make_cmd("gen",
      TEST_NAME=test_name,
      ITERATIONS=iterations,
      ISA=isa,
      SEED=self.seed
    )
    self.logger.info(f"Generating {iterations} iterations for {test_name}")
    rc, out = self.run_cmd(cmd)
    success = (rc == 0)
    self.metrics['gen'].append({
      'Test': test_name,
      'Iterations': iterations,
      'Status': 'PASS' if success else 'FAIL'
    })
    return success

  def run_comp_rtl(self):
    self.logger.info("Compiling RTL Design")
    cmd = self._make_cmd("comp_rtl")
    rc, out = self.run_cmd(cmd)
    if rc != 0:
      self.logger.error("RTL Compilation Failed!")
      sys.exit(1)

  def run_comp_tb(self):
    self.logger.info("Compiling Verification Environment (TB and DPI)")
    cmd = self._make_cmd("comp_tb")
    rc, out = self.run_cmd(cmd)
    if rc != 0:
      self.logger.error("TB Compilation Failed!")
      sys.exit(1)

  def run_opt(self):
    self.logger.info("Optimizing Design Snapshot")
    cmd = self._make_cmd("opt")
    rc, out = self.run_cmd(cmd)
    if rc != 0:
      self.logger.error("Optimization Failed!")
      sys.exit(1)

  def extract_tohost(self, elf_file):
    """Dynamically extract the tohost address from an ELF file."""
    elf_abs = os.path.normpath(os.path.join(self.sim_dir, elf_file))
    rc, out = self.run_cmd(f"riscv32-unknown-elf-nm {elf_abs} | grep tohost")
    match = re.search(r'([0-9a-fA-F]+)\s+[A-Za-z]\s+tohost', out)
    if not match:
      self.logger.error(f"[TOHOST ERROR] Failed to extract from {elf_abs}. Output: {out.strip()}")
    return match.group(1) if match else None

  def run_comp_asm(self, asm_file, test_cfg):
    self.update_seed()
    base_test_name = os.path.splitext(os.path.basename(asm_file))[0]
    cmd = self._make_cmd("comp_asm",
      ASM_FILE=asm_file,
      TEST_NAME=base_test_name,
      SEED=self.seed
    )
    rc, out = self.run_cmd(cmd)
    success = (rc == 0)
    elf_file = asm_file.replace('.S', '.elf')
    tohost = self.extract_tohost(elf_file) if success else "N/A"
    self.metrics['comp_asm'].append({
      'File': base_test_name,
      'Tohost': str(tohost),
      'Status': 'PASS' if success else 'FAIL'
    })
    return success, tohost

  def run_sim(self, hex_file, tohost_addr, test_cfg, base_test_name):
    """
    Run a single simulation. Thread-safe — designed for parallel execution.
    Uses streaming mode for real-time output when running sequentially,
    batch mode when running in parallel.
    """
    self.update_seed()
    rtl_test = test_cfg.get('rtl_test', 'ibex_core_base_test')
    cmd = self._make_cmd("sim",
      TEST_NAME=base_test_name,
      TEST_RTL=rtl_test,
      HEX_FILE=hex_file,
      TOHOST_ADDR=tohost_addr,
      SEED=self.seed
    )

    # In parallel mode, use batch (no console streaming from N workers).
    # In sequential mode (1 worker), stream for real-time visibility.
    use_stream = (self.max_workers <= 1)
    rc, out = self.run_cmd(cmd, stream=use_stream, timeout=self.sim_timeout)
    if rc != 0:
      status = "ERROR/TIMEOUT"
    elif "TEST PASSED!" in out:
      status = "PASS"
    elif "TEST FAILED!" in out:
      status = "FAIL"
    else:
      status = "ERROR/UNKNOWN"

    with self._metrics_lock:
      self.metrics['sim'].append({'Test': base_test_name, 'Status': status})

    return status == "PASS"

  # =========================================================================
  # Pillar 3: Orchestration with Parallel Simulation
  # =========================================================================

  def execute_regression(self, tests_config):
    self.logger.info(f"Starting regression with Seed: {self.seed}")
    self.logger.info(f"Project root: {self.proj_root}")
    self.logger.info(f"Simulator: {self.simulator}")

    # ---- Phase 1: Design Compilation (Sequential) ----
    if 'comp_duv' in self.args.steps:
      self.run_comp_rtl()
      self.run_comp_tb()
      self.run_opt()

    # ---- Phase 2 & 3: Generation + Assembly Compilation (Sequential) ----
    # Collect simulation tasks for Phase 4.
    sim_tasks = []

    for test_cfg in tests_config:
      test_name = test_cfg.get('test')

      # Phase 2: Generate stimulus
      if 'gen' in self.args.steps:
        self.run_gen(test_cfg)

      # Locate generated .S files (path relative to project root)
      asm_pattern = os.path.join(self.proj_root, "out_tests", "asm_test", f"{test_name}_*.S")
      asm_files = glob.glob(asm_pattern)

      if not asm_files and ('comp_asm' in self.args.steps or 'sim' in self.args.steps):
        self.logger.warning(f"No .S files found for {test_name}. Skipping...")
        continue

      for asm in asm_files:
        base_test_name = os.path.splitext(os.path.basename(asm))[0]

        success = True
        tohost = "N/A"

        # Phase 3: Assembly compilation
        if 'comp_asm' in self.args.steps:
          # ASM_FILE passed to make must be relative to sim/ (make -C sim)
          asm_rel = os.path.relpath(asm, self.sim_dir)
          success, tohost = self.run_comp_asm(asm_rel, test_cfg)

        # Collect task for Phase 4
        if 'sim' in self.args.steps and success:
          if tohost == "N/A":
            elf_rel = os.path.relpath(asm.replace('.S', '.elf'), self.sim_dir)
            tohost = self.extract_tohost(elf_rel)

          if tohost:
            hex_rel = os.path.relpath(asm.replace('.S', '.hex'), self.sim_dir)
            sim_tasks.append((hex_rel, tohost, test_cfg, base_test_name))
          else:
            self.logger.error(f"Cannot simulate {base_test_name}: tohost not found.")

    # ---- Phase 4: Simulation (Parallel) ----
    if 'sim' in self.args.steps and sim_tasks:
      self.logger.info(f"\n{'='*70}")
      self.logger.info(f"Launching {len(sim_tasks)} simulation(s) with {self.max_workers} worker(s)")
      self.logger.info(f"Per-simulation timeout: {self.sim_timeout}s")
      self.logger.info(f"{'='*70}")

      with concurrent.futures.ThreadPoolExecutor(max_workers=self.max_workers) as executor:
        future_to_task = {
          executor.submit(self.run_sim, *task): task
          for task in sim_tasks
        }
        for future in concurrent.futures.as_completed(future_to_task):
          task = future_to_task[future]
          test_name = task[3]  # base_test_name
          try:
            passed = future.result()
            status = "PASS" if passed else "FAIL/ERROR"
            self.logger.info(f"  [DONE] {test_name}: {status}")
          except Exception as exc:
            self.logger.error(f"  [EXCEPTION] {test_name}: {exc}")

    # ---- Print Phase Summaries ----
    if 'gen' in self.args.steps:
      self.print_table_summary("Generation", self.metrics['gen'])
    if 'comp_asm' in self.args.steps:
      self.print_table_summary("Assembly Compilation", self.metrics['comp_asm'])
    if 'sim' in self.args.steps:
      self.print_table_summary("Simulation", self.metrics['sim'])
      passed = sum(1 for x in self.metrics['sim'] if x['Status'] == 'PASS')
      total = len(self.metrics['sim'])
      self.logger.info(f"FINAL REGRESSION SUMMARY: {passed}/{total} PASSED")

    # ---- Phase 5: Coverage (Sequential) ----
    if 'cov' in self.args.steps:
      self.run_cmd(self._make_cmd("cov_merge"))
      self.run_cmd(self._make_cmd("cov_report"))
      self.run_cmd(self._make_cmd("cov_export"))
      self.generate_tcc_report()

  # =========================================================================
  # TCC Report Generation
  # =========================================================================

  def generate_tcc_report(self):
    self.logger.info("Generating TCC Regression Report...")

    # Add scripts to sys.path to resolve imports cleanly
    scripts_dir = os.path.abspath(os.path.dirname(__file__))
    if scripts_dir not in sys.path:
      sys.path.append(scripts_dir)

    from log_analyzer import LogAnalyzer
    from coverage_analyzer import CoverageAnalyzer

    la = LogAnalyzer()
    ca = CoverageAnalyzer()

    # 1. Analyze Logs
    log_dir = os.path.join(self.sim_dir, "out", "logs")
    log_files = glob.glob(os.path.join(log_dir, "sim_*.log"))
    test_results = []
    for lf in log_files:
      test_results.append(la.analyze(lf))

    # 2. Analyze Coverage
    cov_txt = os.path.join(self.sim_dir, "out", "cov", "cov_details.txt")
    instances = ca.analyze(cov_txt)
    top_gaps = ca.get_top_gaps(instances, threshold=50.0, top_n=5)

    # 3. Write Markdown Report
    report_dir = os.path.join(self.sim_dir, "out")
    os.makedirs(report_dir, exist_ok=True)
    report_path = os.path.join(report_dir, "tcc_regression_report.md")

    with open(report_path, "w", encoding='utf-8') as f:
      f.write("# TCC Regression Report\n\n")

      f.write("## 1. Simulation Results\n")
      f.write("| Log File | Status | Reason | Matches | Mismatches | Interrupts | Illegal Instr |\n")
      f.write("|---|---|---|---|---|---|---|\n")
      for r in test_results:
        intr = 'Yes' if r.get('InterruptsRouted') else 'No'
        f.write(
          f"| {r.get('LogFile')} | {r.get('Status')} | {r.get('TerminationReason')} "
          f"| {r.get('ScoreboardMatches')} | {r.get('ScoreboardMismatches')} "
          f"| {intr} | {r.get('IllegalInstructions')} |\n"
        )

      f.write("\n## 2. Top Coverage Gaps\n")
      if not top_gaps:
        f.write("No major coverage gaps found below the threshold.\n")
      for gap in top_gaps:
        f.write(f"### `{gap['Path']}`\n")
        f.write(f"- **Expression Coverage**: {gap['ExprCov']}%\n")
        f.write(f"- **Condition Coverage**: {gap['CondCov']}%\n")
        f.write("\n#### Missing Details:\n")
        for detail in gap['Gaps'][:3]:
          f.write(f"- Expression: `{detail['Expression']}`\n")
          f.write(f"  - Hint: `{detail['Hint']}`\n")
        f.write("\n")

    self.logger.info(f"Report successfully generated at: {report_path}")

  def update_seed(self):
    self.seed = random.randint(1, 999999)
    self.logger.info(f"Updated seed to: {self.seed}")
