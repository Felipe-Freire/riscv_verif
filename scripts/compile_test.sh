#!/bin/bash
# Bare-Metal Compilation Script for Ibex-DV

# 1. Check whether the user passed the .S file as an argument
if [ -z "$1" ]; then
  echo "Incorrect usage."
      echo "Example: ./compile_test.sh out_2026-03-13/asm_test/riscv_arithmetic_basic_test_0.S"
  exit 1
fi

INPUT_ASM=$1

# 2. Extract the base file name (without path and without .S)
BASENAME=$(basename "$INPUT_ASM" .S)
ELF_OUT="${BASENAME}.elf"
HEX_OUT="${BASENAME}.hex"

echo "========================================="
echo " Compiling test: $BASENAME"
echo "========================================="

# 3. Run GCC with all bare-metal constraints
echo "[1/2] Generating ELF binary ($ELF_OUT)..."
$RISCV_GCC -march=rv32imc_zicsr_zifencei \
           -mabi=ilp32 \
           -static \
           -mcmodel=medany \
           -fvisibility=hidden \
           -nostdlib \
           -nostartfiles \
           -T link.ld \
           -I vendor/riscv-dv/user_extension \
           -I vendor/riscv-dv/target/rv32imc \
           "$INPUT_ASM" -o "$ELF_OUT"

      # Check whether GCC failed
if [ $? -ne 0 ]; then
        echo "ERROR: GCC compilation failed!"
    exit 1
fi

      # 4. Run Objcopy to generate the file read by UVM memory
      echo "[2/2] Extracting Verilog Hex format ($HEX_OUT)..."
$RISCV_OBJCOPY -O verilog "$ELF_OUT" "$HEX_OUT"

      # Check whether objcopy failed
if [ $? -ne 0 ]; then
        echo "ERROR: Failed to extract Hexadecimal format!"
    exit 1
fi

echo "========================================="
      echo " SUCCESS! File $HEX_OUT is ready."
echo "========================================="