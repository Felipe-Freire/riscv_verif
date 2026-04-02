#!/usr/bin/env python3
import os
import argparse
import subprocess
import glob
import re
import sys
import yaml

GCC_CMD = "riscv32-unknown-elf-gcc"
OBJCOPY_CMD = "riscv32-unknown-elf-objcopy"
NM_CMD = "riscv32-unknown-elf-nm"
RISCVDV_RUN_CMD = "python3 vendor/riscv-dv/run.py"
GCC_FLAGS = (
  "-march=rv32imc_zicsr_zifencei -mabi=ilp32 -static -mcmodel=medany "
  "-fvisibility=hidden -nostdlib -nostartfiles -T link.ld "
  "-I vendor/riscv-dv/user_extension -I vendor/riscv-dv/target/rv32imc"
)

def run_cmd(cmd, cwd=None):
  """Runs a shell command and returns (return_code, output)."""
  print(f"[EXEC] {cmd}")
  result = subprocess.run(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, cwd=cwd)
  return result.returncode, result.stdout


def load_config(config_path):
  """Load and validate the YAML configuration file."""
  if not os.path.exists(config_path):
    print(f"CRITICAL ERROR: Configuration file '{config_path}' not found.")
    sys.exit(1)

  with open(config_path, 'r') as file:
    data = yaml.safe_load(file)

  if not isinstance(data, list):
    print("CRITICAL ERROR: YAML must contain a list of tests (starting with '- test: ...')")
    sys.exit(1)
  return data


def extract_tohost(elf_file):
  """Dynamically extract the tohost address from an existing ELF file."""
  if not os.path.exists(elf_file):
    return None

  code, out = run_cmd(f"{NM_CMD} {elf_file} | grep tohost")
  match = re.search(r'([0-9a-fA-F]+)\s+[A-Za-z]\s+tohost', out)
  return match.group(1) if match else None


def step_generate_asm(test_name, iterations, isa, out_dir, yaml_file):
  """Generate .S files using riscv-dv."""
  print(f"\n[GEN_ASM] Generating stimulus: {test_name} ({iterations} iter)...")
  cmd = (
    f"{RISCVDV_RUN_CMD} --target {isa} --test {test_name} "
    f"--iterations {iterations} --simulator questa -o {out_dir} "
    f"-tl {yaml_file} --steps gen"
  )

  code, out = run_cmd(cmd)
  if code != 0:
    print(f"[ERROR] Stimulus generation failed: {out}")
    return False
  return True


def step_compile_design():
  """Compile RTL (Ibex) and UVM environment (snapshot). Runs only once."""
  print("\n[COMP_DUV] COMPILING DESIGN AND UVM ENVIRONMENT ---")

  cmd = "make opt"
  code, out = run_cmd(cmd, cwd="sim")

  if code != 0:
    print(f"[ERROR] CRITICAL ERROR: Failed to compile design in QuestaSim.\n{out}")
    sys.exit(1)
  print("Design compiled successfully. Snapshot created.\n")


def step_compile_asm(asm_file):
  """Compile .S to .elf, convert to .hex, and extract tohost address. Returns (success, hex_file, tohost_addr)."""
  print(f"\n[COMP_ASM] Compiling: {os.path.basename(asm_file)} ---")
  basename = os.path.splitext(asm_file)[0]
  elf_file = f"{basename}.elf"
  hex_file = f"{basename}.hex"

  # 1. Montagem (Assembly -> ELF)
  code, out = run_cmd(f"{GCC_CMD} {GCC_FLAGS} {asm_file} -o {elf_file}")
  if code != 0: return False, None, None
  
  # 2. Extract to Verilog memory hex format
  code, out = run_cmd(f"{OBJCOPY_CMD} -O verilog {elf_file} {hex_file}")
  if code != 0: return False, None, None

  # 3. Reverse extraction of tohost address
  tohost_addr = extract_tohost(elf_file)
  if not tohost_addr:
    print(f"[INFO] 'tohost' address not found in ELF {elf_file}.")
    return False, hex_file, None

  return True, hex_file, tohost_addr


def step_simulate_test(hex_file, tohost_addr, test_name, test_rtl="ibex_core_base_test"):
  """Run simulation in QuestaSim using .hex and tohost address. Returns "PASS", "FAIL" or "ERROR/TIMEOUT"."""
  print(f"\n[SIM] Simulating: {os.path.basename(hex_file)} ---")
  abs_hex = os.path.abspath(hex_file)
  cmd = f"make run TEST_NAME={test_name} TEST_RTL={test_rtl} HEX_FILE={abs_hex} TOHOST_ADDR={tohost_addr}"
  
  code, out = run_cmd(cmd, cwd="sim")

  if code != 0:
    print(f"[ERROR] Simulation error:\n{out}")
    return "ERROR/TIMEOUT"
  else:
    if "TEST PASSED!" in out: return "PASS"
    elif "TEST FAILED!" in out: return "FAIL"
    else: return "ERROR/TIMEOUT"


def process_single_asm(asm_file: str, steps: list, rtl_test: str) -> tuple:
  """
  Process a single .S file (compilation and/or simulation).
  Returns a tuple: (success_boolean, tohost_addr, status_string)
  """
  base_test_name = os.path.splitext(os.path.basename(asm_file))[0]
  hex_file = asm_file.replace('.S', '.hex')
  elf_file = asm_file.replace('.S', '.elf')
  tohost_addr = "N/A"
  
  # 1. Assembly compilation
  if 'comp_asm' in steps:
    success, hex_file, tohost_addr_extracted = step_compile_asm(asm_file)
    if not success:
      return False, tohost_addr, "COMP_ERROR"
    tohost_addr = tohost_addr_extracted or "N/A"

  # 2. Simulation
  if 'sim' in steps:
    # Guard clauses: check dependencies before proceeding
    if not os.path.exists(hex_file) or not os.path.exists(elf_file):
      return False, tohost_addr, "MISSING_DEP"
    
    if tohost_addr == "N/A":
      tohost_addr = extract_tohost(elf_file)
      if not tohost_addr:
        return False, "N/A", "TOHOST_MISSING"
    
    # Run simulation
    status = step_simulate_test(hex_file, tohost_addr, base_test_name, rtl_test)
    return (status == "PASS"), tohost_addr, status

  return True, tohost_addr, "SKIPPED_SIM"


def run_test_suite(test_cfg: dict, steps: list, out_dir: str, config_path: str) -> tuple:
  """
  Orchestrate execution of one test block defined in YAML.
  Returns (tests_passed, tests_failed).
  """
  test_name = test_cfg.get('test', 'unknown_test')
  iterations = test_cfg.get('iterations', 1)
  isa = test_cfg.get('isa', 'rv32imc')
  rtl_test = test_cfg.get('rtl_test', 'ibex_core_base_test')
  
  passed, failed = 0, 0

  # 1. Stimulus generation
  if 'gen' in steps:
    if not step_generate_asm(test_name, iterations, isa, out_dir, config_path):
      print(f"{test_name:<45} | {'N/A':<10} | GEN_ERROR")
      return 0, iterations # Assume all iterations failed

  # 2. Locate generated files
  asm_pattern = os.path.join(out_dir, "asm_test", f"{test_name}_*.S")
  asm_files = glob.glob(asm_pattern)

  if not asm_files and ('comp_asm' in steps or 'sim' in steps):
    print(f"[ERROR] No .S files found for {test_name}. Skipping...")
    return 0, iterations

  # 3. Process each generated file (iterations)
  for asm in asm_files:
    base_test_name = os.path.splitext(os.path.basename(asm))[0]
    
    # Delegate compile/sim complexity to specialized function
    is_success, tohost, status = process_single_asm(asm, steps, rtl_test)
    
    print(f"{base_test_name:<45} | {tohost:<10} | {status}")
    
    if is_success: passed += 1
    else: failed += 1

  return passed, failed


def parse_arguments():
  """Handle command-line interface parsing only."""
  parser = argparse.ArgumentParser(description="Ibex DV Regression Manager")
  parser.add_argument('--steps', nargs='+', choices=['gen', 'comp_asm', 'comp_duv', 'sim', 'all'], default=['all'])
  parser.add_argument('--config', type=str, default='test_config.yaml')
  parser.add_argument('--out_dir', type=str, default='out_tests')
  
  args = parser.parse_args()
  # Expand 'all' into concrete steps
  if 'all' in args.steps:
    args.steps = ['gen', 'comp_asm', 'comp_duv', 'sim']
      
  return args


def main():
  args = parse_arguments()

  if 'comp_duv' in args.steps:
    step_compile_design()

  tests_config = load_config(args.config)
  os.makedirs(args.out_dir, exist_ok=True)

  total_passed, total_failed = 0, 0

  print(f"\nStarting regression with {len(tests_config)} test block(s)...")
  print(f"{'TEST':<45} | {'TOHOST':<10} | {'STATUS'}")
  print("-" * 70)

  # Main loop now stays clean and only accumulates metrics
  for test_cfg in tests_config:
    p, f = run_test_suite(test_cfg, args.steps, args.out_dir, args.config)
    total_passed += p
    total_failed += f

  if total_passed + total_failed > 0:
    print("\n" + "=" * 70)
    print(f"REGRESSION SUMMARY: {total_passed} PASSED, {total_failed} FAILED")
    print("=" * 70)

if __name__ == "__main__":
  main()