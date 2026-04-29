import os
import subprocess
import logging
import sys
import glob
import re

class RegressionManager:
    def __init__(self, args, seed):
        self.args = args
        self.seed = seed
        self.logger = self._setup_logger()
        self.metrics = {'gen': [], 'comp_asm': [], 'sim': []}
        
    def _setup_logger(self):
        logger = logging.getLogger("RegressionManager")
        logger.setLevel(logging.INFO)
        
        os.makedirs("sim/out/logs", exist_ok=True)
        fh = logging.FileHandler(f"sim/out/logs/regression_run_{self.seed}.log")
        ch = logging.StreamHandler()
        
        formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
        fh.setFormatter(formatter)
        ch.setFormatter(formatter)
        
        logger.addHandler(fh)
        logger.addHandler(ch)
        return logger

    def run_cmd(self, cmd, cwd, verbose=False):
        self.logger.info(f"[EXEC] {cmd}")
        
        process = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, cwd=cwd)
        output = []
        
        while True:
            line = process.stdout.readline()
            if not line and process.poll() is not None:
                break
            if line:
                if verbose:
                    sys.stdout.write(line)
                    sys.stdout.flush()
                output.append(line)
                
                # Write to the log file, bypassing the console handler
                for handler in self.logger.handlers:
                    if isinstance(handler, logging.FileHandler):
                        handler.stream.write(line)
                        handler.stream.flush()
        
        rc = process.poll()
        return rc, "".join(output)

    def print_table_summary(self, phase_name, data_list):
        if not data_list: return
        self.logger.info(f"\n{'='*70}")
        self.logger.info(f"--- {phase_name.upper()} SUMMARY ---")
        
        # Simple table print
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
        
        cmd = f"make -f ../scripts/Makefile gen TEST_NAME={test_name} ITERATIONS={iterations} ISA={isa} SEED={self.seed}"
        self.logger.info(f"Generating {iterations} iterations for {test_name}")
        
        rc, out = self.run_cmd(cmd, cwd="sim")
        success = (rc == 0)
        self.metrics['gen'].append({'Test': test_name, 'Iterations': iterations, 'Status': 'PASS' if success else 'FAIL'})
        return success

    def run_comp_rtl(self):
        self.logger.info("Compiling RTL Design")
        cmd = "make -f ../scripts/Makefile comp_rtl"
        rc, out = self.run_cmd(cmd, cwd="sim")
        if rc != 0:
            self.logger.error("RTL Compilation Failed!")
            sys.exit(1)

    def run_comp_tb(self):
        self.logger.info("Compiling Verification Environment (TB and DPI)")
        cmd = "make -f ../scripts/Makefile comp_tb"
        rc, out = self.run_cmd(cmd, cwd="sim")
        if rc != 0:
            self.logger.error("TB Compilation Failed!")
            sys.exit(1)

    def extract_tohost(self, elf_file):
        rc, out = self.run_cmd(f"riscv32-unknown-elf-nm {elf_file} | grep tohost", cwd="sim")
        match = re.search(r'([0-9a-fA-F]+)\s+[A-Za-z]\s+tohost', out)
        return match.group(1) if match else None

    def run_comp_asm(self, asm_file, test_cfg):
        base_test_name = os.path.splitext(os.path.basename(asm_file))[0]
        # asm_file is relative to cwd="sim"
        cmd = f"make -f ../scripts/Makefile comp_asm ASM_FILE={asm_file} TEST_NAME={base_test_name} SEED={self.seed}"
        
        rc, out = self.run_cmd(cmd, cwd="sim")
        success = (rc == 0)
        
        elf_file = asm_file.replace('.S', '.elf')
        tohost = self.extract_tohost(elf_file) if success else "N/A"
        
        self.metrics['comp_asm'].append({'File': base_test_name, 'Tohost': str(tohost), 'Status': 'PASS' if success else 'FAIL'})
        return success, tohost

    def run_sim(self, hex_file, tohost_addr, test_cfg, base_test_name):
        rtl_test = test_cfg.get('rtl_test', 'ibex_core_base_test')
        cmd = f"make -f ../scripts/Makefile sim TEST_NAME={base_test_name} TEST_RTL={rtl_test} HEX_FILE={hex_file} TOHOST_ADDR={tohost_addr} SEED={self.seed}"
        
        rc, out = self.run_cmd(cmd, cwd="sim")
        
        if rc != 0: status = "ERROR/TIMEOUT"
        elif "TEST PASSED!" in out: status = "PASS"
        elif "TEST FAILED!" in out: status = "FAIL"
        else: status = "ERROR/UNKNOWN"
        
        self.metrics['sim'].append({'Test': base_test_name, 'Status': status})
        return status == "PASS"

    def execute_regression(self, tests_config):
        self.logger.info(f"Starting regression with Seed: {self.seed}")
        
        if 'comp_duv' in self.args.steps:
            self.run_comp_rtl()
            self.run_comp_tb()
            self.run_cmd("make -f ../scripts/Makefile opt", cwd="sim")
        
        for test_cfg in tests_config:
            test_name = test_cfg.get('test')
            
            if 'gen' in self.args.steps:
                self.run_gen(test_cfg)
            
            # Find generated ASM files. Note: path is relative to ROOT
            asm_pattern = f"out_tests/asm_test/{test_name}_*.S"
            asm_files = glob.glob(asm_pattern)
            
            if not asm_files and ('comp_asm' in self.args.steps or 'sim' in self.args.steps):
                self.logger.warning(f"No .S files found for {test_name}. Skipping...")
                continue
            
            for asm in asm_files:
                asm_rel = os.path.relpath(asm, "sim")
                base_test_name = os.path.splitext(os.path.basename(asm))[0]
                hex_file = asm_rel.replace('.S', '.hex')
                
                success = True
                tohost = "N/A"
                if 'comp_asm' in self.args.steps:
                    success, tohost = self.run_comp_asm(asm_rel, test_cfg)
                
                if 'sim' in self.args.steps and success:
                    if tohost == "N/A":
                        tohost = self.extract_tohost(asm_rel.replace('.S', '.elf'))
                    
                    if tohost:
                        self.run_sim(hex_file, tohost, test_cfg, base_test_name)
                    else:
                        self.logger.error(f"Cannot simulate {base_test_name}: tohost not found.")

        # Print metrics
        if 'gen' in self.args.steps:
            self.print_table_summary("Generation", self.metrics['gen'])
        if 'comp_asm' in self.args.steps:
            self.print_table_summary("Assembly Compilation", self.metrics['comp_asm'])
        if 'sim' in self.args.steps:
            self.print_table_summary("Simulation", self.metrics['sim'])
            passed = sum(1 for x in self.metrics['sim'] if x['Status'] == 'PASS')
            total = len(self.metrics['sim'])
            self.logger.info(f"FINAL REGRESSION SUMMARY: {passed}/{total} PASSED")
            
        if 'cov' in self.args.steps:
            self.run_cmd("make -f ../scripts/Makefile cov_report", cwd="sim")
