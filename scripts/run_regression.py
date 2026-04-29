#!/usr/bin/env python3
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
    parser.add_argument('--steps', nargs='+', choices=['gen', 'comp_asm', 'comp_duv', 'sim', 'cov', 'all'], default=['all'])
    parser.add_argument('--config', type=str, default='scripts/test_config.yaml')
    parser.add_argument('--seed', type=int, default=None, help="Random seed for generation and simulation")
    parser.add_argument('--cov_gui', action='store_true', help="Open the global coverage report in Questa GUI.")
    
    args = parser.parse_args()
    
    # Expand 'all' into concrete steps
    if 'all' in args.steps:
        args.steps = ['gen', 'comp_asm', 'comp_duv', 'sim', 'cov']
        
    return args

def main():
    args = parse_arguments()
    seed = args.seed if args.seed is not None else random.randint(1, 999999)
    
    if args.cov_gui:
        os.system("cd sim && make -f ../scripts/Makefile cov_gui")
        sys.exit(0)

    tests_config = load_config(args.config)
    
    manager = RegressionManager(args, seed)
    manager.execute_regression(tests_config)

if __name__ == "__main__":
    main()