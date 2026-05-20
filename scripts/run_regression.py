#!/usr/bin/env python3
"""
Ibex DV Regression Manager — Entry Point

Usage (from project root):
  python3 scripts/run_regression.py --steps all
  python3 scripts/run_regression.py --steps gen comp_asm comp_duv sim --jobs 4
  python3 scripts/run_regression.py --cov_gui
"""
import os
import argparse
import random
import yaml
import sys
from regression_manager import RegressionManager


def load_config(config_path):
  if not os.path.exists(config_path):
    print(f"CRITICAL ERROR: Configuration file '{config_path}' not found.")
    sys.exit(1)

  with open(config_path, 'r') as file:
    data = yaml.safe_load(file)

  if not isinstance(data, list):
    print("CRITICAL ERROR: YAML must contain a list of tests (starting with '- test: ...')")
    sys.exit(1)
  return data


def parse_arguments():
  parser = argparse.ArgumentParser(description="Ibex DV Regression Manager")
  parser.add_argument('--steps', nargs='+',
                      choices=['gen', 'comp_asm', 'comp_duv', 'sim', 'cov', 'all'],
                      default=['all'])
  parser.add_argument('--config', type=str, default='scripts/test_config.yaml',
                      help="Path to YAML test list (relative to project root)")
  parser.add_argument('--seed', type=int, default=None,
                      help="Random seed for generation and simulation")
  parser.add_argument('--jobs', type=int, default=None,
                      help="Number of parallel simulation workers (default: cpu_count - 2)")
  parser.add_argument('--sim_timeout', type=int, default=600,
                      help="Per-simulation timeout in seconds (default: 600)")
  parser.add_argument('--simulator', choices=['questa', 'verilator'], default='questa',
                      help="EDA simulator backend (default: questa)")
  parser.add_argument('--cov_gui', action='store_true',
                      help="Open the global coverage report in Questa GUI.")

  args = parser.parse_args()

  # Expand 'all' into concrete steps
  if 'all' in args.steps:
    args.steps = ['gen', 'comp_asm', 'comp_duv', 'sim', 'cov']

  return args


def main():
  args = parse_arguments()
  seed = args.seed if args.seed is not None else random.randint(1, 999999)

  # Resolve project root: two levels up from this script
  proj_root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

  if args.cov_gui:
    make_cmd = (
      f"make -C {proj_root}/sim -f {proj_root}/scripts/Makefile "
      f"cov_gui PROJ_ROOT={proj_root} SIMULATOR={args.simulator}"
    )
    os.system(make_cmd)
    sys.exit(0)

  tests_config = load_config(os.path.join(proj_root, args.config))

  manager = RegressionManager(args, seed, proj_root)
  manager.execute_regression(tests_config)


if __name__ == "__main__":
  main()