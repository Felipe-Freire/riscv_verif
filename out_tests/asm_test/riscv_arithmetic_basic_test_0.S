.include "user_define.h"
.globl _start
.section .text
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x11, h0_start
jalr x0, x11, 0
h0_start:
                  li x27, 0x40001104
                  csrw 0x301, x27
kernel_sp:        
                  la x25, kernel_stack_end

trap_vec_init:    
                  la x27, mtvec_handler
                  ori x27, x27, 0
                  csrw 0x305, x27 # MTVEC

mepc_setup:       
                  la x27, init
                  csrw 0x341, x27

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x27, 0x1800
                  csrw 0x300, x27 # MSTATUS
                  li x27, 0x0
                  csrw 0x304, x27 # MIE
                  mret
init:             
                  li x0, 0xe
                  li x1, 0xf6c37e9f
                  li x2, 0x31b084d1
                  li x3, 0xfb310578
                  li x4, 0x9
                  li x5, 0xf17704ea
                  li x6, 0x0
                  li x7, 0x80000000
                  li x8, 0xa6aa7a66
                  li x9, 0xf79f0c80
                  li x10, 0x80000000
                  li x11, 0xf0d77f89
                  li x13, 0x0
                  li x14, 0x80000000
                  li x15, 0xf
                  li x16, 0x0
                  li x17, 0xf924f5e3
                  li x18, 0xa
                  li x19, 0xe
                  li x20, 0x0
                  li x21, 0x7dc57aaf
                  li x22, 0x0
                  li x23, 0xf9bb84e5
                  li x24, 0x0
                  li x26, 0xf8a2a07e
                  li x27, 0x0
                  li x28, 0x80000000
                  li x29, 0xfc902d1c
                  li x30, 0x4289895f
                  li x31, 0x0
                  la x12, user_stack_end
main:             slli         s3, a4, 3
                  slti         t3, tp, 1366
                  mulhu        tp, s8, t1
                  and          s10, s4, s5
                  sra          sp, s3, tp
                  sltiu        a4, t1, 1525
                  c.srai       a0, 24
                  c.li         s4, -1
                  sll          zero, t1, sp
                  sll          zero, t1, sp
                  addi         a3, a0, 1774
                  sub          sp, a0, t1
                  c.addi16sp   sp, 192
                  nop
                  rem          gp, a0, ra
                  sra          sp, s3, tp
                  c.li         s4, -1
                  c.andi       s1, -1
                  sra          sp, s3, tp
                  sra          sp, s3, tp
                  srai         t1, a7, 10
                  srl          s11, t0, s8
                  lui          a4, 929986
                  sltu         s5, s11, tp
                  c.or         a0, a3
                  c.add        t0, t3
                  c.xor        s1, a0
                  auipc        a6, 359530
                  c.sub        s1, a0
                  c.addi4spn   a5, sp, 816
                  srai         t1, a7, 10
                  c.add        t0, t3
                  srl          s11, t0, s8
                  sltu         s5, s11, tp
                  nop
                  sltiu        a4, t1, 1525
                  slti         t3, tp, 1366
                  c.addi16sp   sp, 192
                  c.andi       s1, -1
                  add          tp, t5, s7
                  sll          zero, t1, sp
                  slti         t3, tp, 1366
                  mulhu        tp, s8, t1
                  slli         s3, a4, 3
                  c.srai       a0, 24
                  slt          t3, a6, sp
                  div          s4, a0, tp
                  c.andi       s1, -1
                  mulhsu       ra, s0, s10
                  c.srli       s1, 1
                  addi         a3, a0, 1774
                  c.add        t0, t3
                  c.mv         t4, t1
                  mul          tp, s9, sp
                  remu         gp, a3, t1
                  xor          s1, t3, s0
                  or           a7, s5, a3
                  slli         s3, a4, 3
                  remu         gp, a3, t1
                  c.lui        a4, 9
                  rem          gp, a0, ra
                  mulhsu       ra, s0, s10
                  c.addi16sp   sp, 192
                  slli         s3, a4, 3
                  c.addi       t6, -1
                  auipc        a6, 359530
                  sra          sp, s3, tp
                  xor          s1, t3, s0
                  xori         sp, a3, 268
                  div          s4, a0, tp
                  or           a7, s5, a3
                  c.srai       a0, 24
                  c.srai       a0, 24
                  c.andi       s1, -1
                  c.srai       a0, 24
                  c.and        a3, s1
                  c.and        a3, s1
                  c.slli       s5, 16
                  c.srli       s1, 1
                  c.lui        a4, 9
                  srl          s11, t0, s8
                  c.addi       t6, -1
                  srai         t1, a7, 10
                  auipc        a6, 359530
                  mulhu        tp, s8, t1
                  addi         a3, a0, 1774
                  div          s4, a0, tp
                  xor          s1, t3, s0
                  c.sub        s1, a0
                  srl          s11, t0, s8
                  nop
                  sltiu        a4, t1, 1525
                  addi         a3, a0, 1774
                  remu         gp, a3, t1
                  add          tp, t5, s7
                  auipc        a6, 359530
                  sub          sp, a0, t1
                  mulh         a6, s10, t3
                  c.sub        s1, a0
                  sra          sp, s3, tp
                  c.xor        s1, a0
                  auipc        a6, 359530
                  mulh         a6, s10, t3
                  auipc        a6, 359530
                  divu         s11, s7, s11
                  andi         ra, a6, -544
                  slli         s3, a4, 3
                  auipc        a6, 359530
                  sra          sp, s3, tp
                  mulh         a6, s10, t3
                  divu         s11, s7, s11
                  sra          sp, s3, tp
                  c.addi       t6, -1
                  sltiu        a4, t1, 1525
                  addi         a3, a0, 1774
                  and          s10, s4, s5
                  srl          s11, t0, s8
                  srai         t1, a7, 10
                  srai         t1, a7, 10
                  sltiu        a4, t1, 1525
                  lui          a4, 929986
                  divu         s11, s7, s11
                  or           a7, s5, a3
                  div          s4, a0, tp
                  c.andi       s1, -1
                  c.addi16sp   sp, 192
                  c.andi       s1, -1
                  sltiu        a4, t1, 1525
                  divu         s11, s7, s11
                  c.sub        s1, a0
                  mulh         a6, s10, t3
                  or           a7, s5, a3
                  c.addi4spn   a5, sp, 816
                  slti         t3, tp, 1366
                  slli         s3, a4, 3
                  andi         ra, a6, -544
                  c.nop
                  c.addi4spn   a5, sp, 816
                  srli         s0, a0, 31
                  c.srai       a0, 24
                  mulhu        tp, s8, t1
                  c.li         s4, -1
                  c.slli       s5, 16
                  sll          zero, t1, sp
                  divu         s11, s7, s11
                  c.lui        a4, 9
                  slti         t3, tp, 1366
                  auipc        a6, 359530
                  mul          tp, s9, sp
                  c.srai       a0, 24
                  c.slli       s5, 16
                  c.addi16sp   sp, 192
                  xori         sp, a3, 268
                  c.lui        a4, 9
                  or           a7, s5, a3
                  nop
                  c.srli       s1, 1
                  c.xor        s1, a0
                  c.lui        a4, 9
                  srli         s0, a0, 31
                  c.srli       s1, 1
                  sltu         s5, s11, tp
                  c.xor        s1, a0
                  sltiu        a4, t1, 1525
                  slti         t3, tp, 1366
                  c.srai       a0, 24
                  sra          sp, s3, tp
                  c.andi       s1, -1
                  xori         sp, a3, 268
                  add          tp, t5, s7
                  c.addi4spn   a5, sp, 816
                  addi         a3, a0, 1774
                  auipc        a6, 359530
                  slti         t3, tp, 1366
                  sll          zero, t1, sp
                  addi         a3, a0, 1774
                  div          s4, a0, tp
                  srl          s11, t0, s8
                  slli         s3, a4, 3
                  c.slli       s5, 16
                  nop
                  divu         s11, s7, s11
                  c.add        t0, t3
                  c.li         s4, -1
                  nop
                  sll          zero, t1, sp
                  divu         s11, s7, s11
                  slli         s3, a4, 3
                  c.slli       s5, 16
                  sltiu        a4, t1, 1525
                  and          s10, s4, s5
                  xor          s1, t3, s0
                  add          tp, t5, s7
                  c.and        a3, s1
                  c.xor        s1, a0
                  rem          gp, a0, ra
                  divu         s11, s7, s11
                  and          s10, s4, s5
                  mulh         a6, s10, t3
                  div          s4, a0, tp
                  slli         s3, a4, 3
                  c.srai       a0, 24
                  lui          a4, 929986
                  srl          s11, t0, s8
                  ori          a0, a1, -851
                  c.srai       a0, 24
                  xori         sp, a3, 268
                  sll          zero, t1, sp
                  c.slli       s5, 16
                  or           a7, s5, a3
                  c.addi       t6, -1
                  and          s10, s4, s5
                  c.nop
                  remu         gp, a3, t1
                  c.srli       s1, 1
                  ori          a0, a1, -851
                  srli         s0, a0, 31
                  c.li         s4, -1
                  c.li         s4, -1
                  lui          a4, 929986
                  mulh         a6, s10, t3
                  c.or         a0, a3
                  mulhu        tp, s8, t1
                  c.slli       s5, 16
                  add          tp, t5, s7
                  auipc        a6, 359530
                  c.srai       a0, 24
                  xor          s1, t3, s0
                  c.or         a0, a3
                  c.srli       s1, 1
                  c.addi       t6, -1
                  c.andi       s1, -1
                  c.addi       t6, -1
                  nop
                  sub          sp, a0, t1
                  sll          zero, t1, sp
                  c.addi       t6, -1
                  c.addi4spn   a5, sp, 816
                  sll          zero, t1, sp
                  srl          s11, t0, s8
                  slt          t3, a6, sp
                  or           a7, s5, a3
                  sltu         s5, s11, tp
                  sltiu        a4, t1, 1525
                  sltu         s5, s11, tp
                  c.addi       t6, -1
                  mulhu        tp, s8, t1
                  c.add        t0, t3
                  c.mv         t4, t1
                  slt          t3, a6, sp
                  sltu         s5, s11, tp
                  remu         gp, a3, t1
                  sltiu        a4, t1, 1525
                  mulhu        tp, s8, t1
                  c.or         a0, a3
                  lui          a4, 929986
                  c.sub        s1, a0
                  c.addi4spn   a5, sp, 816
                  sub          sp, a0, t1
                  srai         t1, a7, 10
                  sltu         s5, s11, tp
                  srai         t1, a7, 10
                  sltiu        a4, t1, 1525
                  srai         t1, a7, 10
                  nop
                  and          s10, s4, s5
                  slti         t3, tp, 1366
                  remu         gp, a3, t1
                  slti         t3, tp, 1366
                  sltu         s5, s11, tp
                  lui          a4, 929986
                  and          s10, s4, s5
                  add          tp, t5, s7
                  c.addi       t6, -1
                  c.addi16sp   sp, 192
                  c.addi4spn   a5, sp, 816
                  xor          s1, t3, s0
                  c.add        t0, t3
                  sltu         s5, s11, tp
                  addi         a3, a0, 1774
                  xor          s1, t3, s0
                  remu         gp, a3, t1
                  c.mv         t4, t1
                  lui          a4, 929986
                  srl          s11, t0, s8
                  c.addi16sp   sp, 192
                  divu         s11, s7, s11
                  sltiu        a4, t1, 1525
                  c.andi       s1, -1
                  c.andi       s1, -1
                  c.srai       a0, 24
                  c.srai       a0, 24
                  remu         gp, a3, t1
                  addi         a3, a0, 1774
                  sub          sp, a0, t1
                  c.addi       t6, -1
                  xor          s1, t3, s0
                  addi         a3, a0, 1774
                  c.addi16sp   sp, 192
                  c.addi       t6, -1
                  sub          sp, a0, t1
                  or           a7, s5, a3
                  auipc        a6, 359530
                  sltiu        a4, t1, 1525
                  ori          a0, a1, -851
                  c.srli       s1, 1
                  slti         t3, tp, 1366
                  c.add        t0, t3
                  srli         s0, a0, 31
                  sub          sp, a0, t1
                  c.xor        s1, a0
                  c.add        t0, t3
                  or           a7, s5, a3
                  c.add        t0, t3
                  addi         a3, a0, 1774
                  c.li         s4, -1
                  c.mv         t4, t1
                  srli         s0, a0, 31
                  sltiu        a4, t1, 1525
                  slli         s3, a4, 3
                  c.mv         t4, t1
                  c.lui        a4, 9
                  sub          sp, a0, t1
                  srli         s0, a0, 31
                  ori          a0, a1, -851
                  mulh         a6, s10, t3
                  slt          t3, a6, sp
                  and          s10, s4, s5
                  slti         t3, tp, 1366
                  sra          sp, s3, tp
                  rem          gp, a0, ra
                  srai         t1, a7, 10
                  sltiu        a4, t1, 1525
                  c.addi       t6, -1
                  c.xor        s1, a0
                  remu         gp, a3, t1
                  slli         s3, a4, 3
                  sub          sp, a0, t1
                  addi         a3, a0, 1774
                  c.li         s4, -1
                  srli         s0, a0, 31
                  c.and        a3, s1
                  sra          sp, s3, tp
                  mulhsu       ra, s0, s10
                  and          s10, s4, s5
                  sltiu        a4, t1, 1525
                  sltiu        a4, t1, 1525
                  div          s4, a0, tp
                  slli         s3, a4, 3
                  c.nop
                  xori         sp, a3, 268
                  slt          t3, a6, sp
                  ori          a0, a1, -851
                  auipc        a6, 359530
                  mul          tp, s9, sp
                  c.nop
                  c.or         a0, a3
                  c.and        a3, s1
                  c.sub        s1, a0
                  xori         sp, a3, 268
                  sltu         s5, s11, tp
                  c.andi       s1, -1
                  c.addi16sp   sp, 192
                  c.slli       s5, 16
                  sub          sp, a0, t1
                  lui          a4, 929986
                  c.andi       s1, -1
                  div          s4, a0, tp
                  slli         s3, a4, 3
                  c.sub        s1, a0
                  sltu         s5, s11, tp
                  ori          a0, a1, -851
                  c.add        t0, t3
                  and          s10, s4, s5
                  andi         ra, a6, -544
                  c.lui        a4, 9
                  remu         gp, a3, t1
                  c.addi16sp   sp, 192
                  sll          zero, t1, sp
                  mulh         a6, s10, t3
                  sub          sp, a0, t1
                  sub          sp, a0, t1
                  c.addi       t6, -1
                  xori         sp, a3, 268
                  addi         a3, a0, 1774
                  c.nop
                  mulhsu       ra, s0, s10
                  divu         s11, s7, s11
                  sra          sp, s3, tp
                  mulhsu       ra, s0, s10
                  div          s4, a0, tp
                  remu         gp, a3, t1
                  srai         t1, a7, 10
                  andi         ra, a6, -544
                  c.addi4spn   a5, sp, 816
                  c.or         a0, a3
                  mul          tp, s9, sp
                  sra          sp, s3, tp
                  andi         ra, a6, -544
                  sll          zero, t1, sp
                  andi         ra, a6, -544
                  add          tp, t5, s7
                  sra          sp, s3, tp
                  c.lui        a4, 9
                  div          s4, a0, tp
                  c.nop
                  c.addi16sp   sp, 192
                  rem          gp, a0, ra
                  c.mv         t4, t1
                  addi         a3, a0, 1774
                  or           a7, s5, a3
                  c.addi16sp   sp, 192
                  mulh         a6, s10, t3
                  addi         a3, a0, 1774
                  c.and        a3, s1
                  srli         s0, a0, 31
                  add          tp, t5, s7
                  c.mv         t4, t1
                  c.srli       s1, 1
                  mulh         a6, s10, t3
                  sltu         s5, s11, tp
                  slli         s3, a4, 3
                  divu         s11, s7, s11
                  srl          s11, t0, s8
                  or           a7, s5, a3
                  c.lui        a4, 9
                  rem          gp, a0, ra
                  ori          a0, a1, -851
                  c.srai       a0, 24
                  sra          sp, s3, tp
                  mul          tp, s9, sp
                  divu         s11, s7, s11
                  divu         s11, s7, s11
                  slt          t3, a6, sp
                  andi         ra, a6, -544
                  ori          a0, a1, -851
                  remu         gp, a3, t1
                  ori          a0, a1, -851
                  mulhu        tp, s8, t1
                  sltiu        a4, t1, 1525
                  c.mv         t4, t1
                  c.andi       s1, -1
                  mul          tp, s9, sp
                  sra          sp, s3, tp
                  sll          zero, t1, sp
                  c.and        a3, s1
                  sll          zero, t1, sp
                  c.xor        s1, a0
                  andi         ra, a6, -544
                  srl          s11, t0, s8
                  sltiu        a4, t1, 1525
                  srai         t1, a7, 10
                  sltiu        a4, t1, 1525
                  c.addi16sp   sp, 192
                  xori         sp, a3, 268
                  sll          zero, t1, sp
                  c.xor        s1, a0
                  lui          a4, 929986
                  and          s10, s4, s5
                  c.slli       s5, 16
                  mulhu        tp, s8, t1
                  c.and        a3, s1
                  c.sub        s1, a0
                  c.slli       s5, 16
                  slt          t3, a6, sp
                  c.andi       s1, -1
                  c.nop
                  lui          a4, 929986
                  srli         s0, a0, 31
                  c.lui        a4, 9
                  sltu         s5, s11, tp
                  srl          s11, t0, s8
                  remu         gp, a3, t1
                  sltiu        a4, t1, 1525
                  srl          s11, t0, s8
                  slli         s3, a4, 3
                  sub          sp, a0, t1
                  slti         t3, tp, 1366
                  c.mv         t4, t1
                  c.nop
                  srai         t1, a7, 10
                  c.and        a3, s1
                  div          s4, a0, tp
                  slti         t3, tp, 1366
                  sub          sp, a0, t1
                  mulh         a6, s10, t3
                  c.li         s4, -1
                  mul          tp, s9, sp
                  c.and        a3, s1
                  slli         s3, a4, 3
                  srl          s11, t0, s8
                  c.xor        s1, a0
                  divu         s11, s7, s11
                  slt          t3, a6, sp
                  sltu         s5, s11, tp
                  auipc        a6, 359530
                  c.srli       s1, 1
                  c.add        t0, t3
                  nop
                  mulhu        tp, s8, t1
                  la x11, test_done
                  jalr x0, x11, 0
test_done:        
                  li gp, 1
                  ecall
write_tohost:     
                  sw gp, tohost, t5

_exit:            
                  j write_tohost

instr_end:        
                  nop

.section .data
.align 6; .global tohost; tohost: .dword 0;
.align 6; .global fromhost; fromhost: .dword 0;
.section .user_stack,"aw",@progbits;
.align 2
user_stack_start:
.rept 4999
.4byte 0x0
.endr
user_stack_end:
.4byte 0x0
.align 2
kernel_instr_start:
.text
.align           2
mtvec_handler:    
                  addi x25, x25, -4
                  sw  x12, (x25)
                  add x12, x25, zero
                  addi x12, x12, -128
                  sw  x1, 4(x12)
                  sw  x2, 8(x12)
                  sw  x3, 12(x12)
                  sw  x4, 16(x12)
                  sw  x5, 20(x12)
                  sw  x6, 24(x12)
                  sw  x7, 28(x12)
                  sw  x8, 32(x12)
                  sw  x9, 36(x12)
                  sw  x10, 40(x12)
                  sw  x11, 44(x12)
                  sw  x12, 48(x12)
                  sw  x13, 52(x12)
                  sw  x14, 56(x12)
                  sw  x15, 60(x12)
                  sw  x16, 64(x12)
                  sw  x17, 68(x12)
                  sw  x18, 72(x12)
                  sw  x19, 76(x12)
                  sw  x20, 80(x12)
                  sw  x21, 84(x12)
                  sw  x22, 88(x12)
                  sw  x23, 92(x12)
                  sw  x24, 96(x12)
                  sw  x25, 100(x12)
                  sw  x26, 104(x12)
                  sw  x27, 108(x12)
                  sw  x28, 112(x12)
                  sw  x29, 116(x12)
                  sw  x30, 120(x12)
                  sw  x31, 124(x12)
                  add x25, x12, zero
                  csrr x27, 0x300 # MSTATUS
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 31
                  bne x27, x0, mmode_intr_handler

mmode_exception_handler:
                  csrr x27, 0x341 # MEPC
                  csrr x27, 0x342 # MCAUSE
                  li x31, 0x3 # BREAKPOINT
                  beq x27, x31, ebreak_handler
                  li x31, 0x8 # ECALL_UMODE
                  beq x27, x31, ecall_handler
                  li x31, 0x9 # ECALL_SMODE
                  beq x27, x31, ecall_handler
                  li x31, 0xb # ECALL_MMODE
                  beq x27, x31, ecall_handler
                  li x31, 0x1
                  beq x27, x31, instr_fault_handler
                  li x31, 0x5
                  beq x27, x31, load_fault_handler
                  li x31, 0x7
                  beq x27, x31, store_fault_handler
                  li x31, 0xc
                  beq x27, x31, pt_fault_handler
                  li x31, 0xd
                  beq x27, x31, pt_fault_handler
                  li x31, 0xf
                  beq x27, x31, pt_fault_handler
                  li x31, 0x2 # ILLEGAL_INSTRUCTION
                  beq x27, x31, illegal_instr_handler
                  csrr x31, 0x343 # MTVAL
                  1: la x11, test_done
                  jalr x1, x11, 0

ecall_handler:    
                  la x27, _start
                  sw x0, 0(x27)
                  sw x1, 4(x27)
                  sw x2, 8(x27)
                  sw x3, 12(x27)
                  sw x4, 16(x27)
                  sw x5, 20(x27)
                  sw x6, 24(x27)
                  sw x7, 28(x27)
                  sw x8, 32(x27)
                  sw x9, 36(x27)
                  sw x10, 40(x27)
                  sw x11, 44(x27)
                  sw x12, 48(x27)
                  sw x13, 52(x27)
                  sw x14, 56(x27)
                  sw x15, 60(x27)
                  sw x16, 64(x27)
                  sw x17, 68(x27)
                  sw x18, 72(x27)
                  sw x19, 76(x27)
                  sw x20, 80(x27)
                  sw x21, 84(x27)
                  sw x22, 88(x27)
                  sw x23, 92(x27)
                  sw x24, 96(x27)
                  sw x25, 100(x27)
                  sw x26, 104(x27)
                  sw x27, 108(x27)
                  sw x28, 112(x27)
                  sw x29, 116(x27)
                  sw x30, 120(x27)
                  sw x31, 124(x27)
                  la x11, write_tohost
                  jalr x0, x11, 0

instr_fault_handler:
                  add x12, x25, zero
                  lw  x1, 4(x12)
                  lw  x2, 8(x12)
                  lw  x3, 12(x12)
                  lw  x4, 16(x12)
                  lw  x5, 20(x12)
                  lw  x6, 24(x12)
                  lw  x7, 28(x12)
                  lw  x8, 32(x12)
                  lw  x9, 36(x12)
                  lw  x10, 40(x12)
                  lw  x11, 44(x12)
                  lw  x12, 48(x12)
                  lw  x13, 52(x12)
                  lw  x14, 56(x12)
                  lw  x15, 60(x12)
                  lw  x16, 64(x12)
                  lw  x17, 68(x12)
                  lw  x18, 72(x12)
                  lw  x19, 76(x12)
                  lw  x20, 80(x12)
                  lw  x21, 84(x12)
                  lw  x22, 88(x12)
                  lw  x23, 92(x12)
                  lw  x24, 96(x12)
                  lw  x25, 100(x12)
                  lw  x26, 104(x12)
                  lw  x27, 108(x12)
                  lw  x28, 112(x12)
                  lw  x29, 116(x12)
                  lw  x30, 120(x12)
                  lw  x31, 124(x12)
                  addi x12, x12, 128
                  add x25, x12, zero
                  lw  x12, (x25)
                  addi x25, x25, 4
                  mret

load_fault_handler:
                  add x12, x25, zero
                  lw  x1, 4(x12)
                  lw  x2, 8(x12)
                  lw  x3, 12(x12)
                  lw  x4, 16(x12)
                  lw  x5, 20(x12)
                  lw  x6, 24(x12)
                  lw  x7, 28(x12)
                  lw  x8, 32(x12)
                  lw  x9, 36(x12)
                  lw  x10, 40(x12)
                  lw  x11, 44(x12)
                  lw  x12, 48(x12)
                  lw  x13, 52(x12)
                  lw  x14, 56(x12)
                  lw  x15, 60(x12)
                  lw  x16, 64(x12)
                  lw  x17, 68(x12)
                  lw  x18, 72(x12)
                  lw  x19, 76(x12)
                  lw  x20, 80(x12)
                  lw  x21, 84(x12)
                  lw  x22, 88(x12)
                  lw  x23, 92(x12)
                  lw  x24, 96(x12)
                  lw  x25, 100(x12)
                  lw  x26, 104(x12)
                  lw  x27, 108(x12)
                  lw  x28, 112(x12)
                  lw  x29, 116(x12)
                  lw  x30, 120(x12)
                  lw  x31, 124(x12)
                  addi x12, x12, 128
                  add x25, x12, zero
                  lw  x12, (x25)
                  addi x25, x25, 4
                  mret

store_fault_handler:
                  add x12, x25, zero
                  lw  x1, 4(x12)
                  lw  x2, 8(x12)
                  lw  x3, 12(x12)
                  lw  x4, 16(x12)
                  lw  x5, 20(x12)
                  lw  x6, 24(x12)
                  lw  x7, 28(x12)
                  lw  x8, 32(x12)
                  lw  x9, 36(x12)
                  lw  x10, 40(x12)
                  lw  x11, 44(x12)
                  lw  x12, 48(x12)
                  lw  x13, 52(x12)
                  lw  x14, 56(x12)
                  lw  x15, 60(x12)
                  lw  x16, 64(x12)
                  lw  x17, 68(x12)
                  lw  x18, 72(x12)
                  lw  x19, 76(x12)
                  lw  x20, 80(x12)
                  lw  x21, 84(x12)
                  lw  x22, 88(x12)
                  lw  x23, 92(x12)
                  lw  x24, 96(x12)
                  lw  x25, 100(x12)
                  lw  x26, 104(x12)
                  lw  x27, 108(x12)
                  lw  x28, 112(x12)
                  lw  x29, 116(x12)
                  lw  x30, 120(x12)
                  lw  x31, 124(x12)
                  addi x12, x12, 128
                  add x25, x12, zero
                  lw  x12, (x25)
                  addi x25, x25, 4
                  mret

ebreak_handler:   
                  csrr  x27, 0x341
                  addi  x27, x27, 4
                  csrw  0x341, x27
                  add x12, x25, zero
                  lw  x1, 4(x12)
                  lw  x2, 8(x12)
                  lw  x3, 12(x12)
                  lw  x4, 16(x12)
                  lw  x5, 20(x12)
                  lw  x6, 24(x12)
                  lw  x7, 28(x12)
                  lw  x8, 32(x12)
                  lw  x9, 36(x12)
                  lw  x10, 40(x12)
                  lw  x11, 44(x12)
                  lw  x12, 48(x12)
                  lw  x13, 52(x12)
                  lw  x14, 56(x12)
                  lw  x15, 60(x12)
                  lw  x16, 64(x12)
                  lw  x17, 68(x12)
                  lw  x18, 72(x12)
                  lw  x19, 76(x12)
                  lw  x20, 80(x12)
                  lw  x21, 84(x12)
                  lw  x22, 88(x12)
                  lw  x23, 92(x12)
                  lw  x24, 96(x12)
                  lw  x25, 100(x12)
                  lw  x26, 104(x12)
                  lw  x27, 108(x12)
                  lw  x28, 112(x12)
                  lw  x29, 116(x12)
                  lw  x30, 120(x12)
                  lw  x31, 124(x12)
                  addi x12, x12, 128
                  add x25, x12, zero
                  lw  x12, (x25)
                  addi x25, x25, 4
                  mret

illegal_instr_handler:
                  csrr  x27, 0x341
                  addi  x27, x27, 4
                  csrw  0x341, x27
                  add x12, x25, zero
                  lw  x1, 4(x12)
                  lw  x2, 8(x12)
                  lw  x3, 12(x12)
                  lw  x4, 16(x12)
                  lw  x5, 20(x12)
                  lw  x6, 24(x12)
                  lw  x7, 28(x12)
                  lw  x8, 32(x12)
                  lw  x9, 36(x12)
                  lw  x10, 40(x12)
                  lw  x11, 44(x12)
                  lw  x12, 48(x12)
                  lw  x13, 52(x12)
                  lw  x14, 56(x12)
                  lw  x15, 60(x12)
                  lw  x16, 64(x12)
                  lw  x17, 68(x12)
                  lw  x18, 72(x12)
                  lw  x19, 76(x12)
                  lw  x20, 80(x12)
                  lw  x21, 84(x12)
                  lw  x22, 88(x12)
                  lw  x23, 92(x12)
                  lw  x24, 96(x12)
                  lw  x25, 100(x12)
                  lw  x26, 104(x12)
                  lw  x27, 108(x12)
                  lw  x28, 112(x12)
                  lw  x29, 116(x12)
                  lw  x30, 120(x12)
                  lw  x31, 124(x12)
                  addi x12, x12, 128
                  add x25, x12, zero
                  lw  x12, (x25)
                  addi x25, x25, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x27, 0x300 # MSTATUS;
                  csrr  x27, 0x304 # MIE;
                  csrr  x27, 0x344 # MIP;
                  csrrc x27, 0x344, x27 # MIP;
                  add x12, x25, zero
                  lw  x1, 4(x12)
                  lw  x2, 8(x12)
                  lw  x3, 12(x12)
                  lw  x4, 16(x12)
                  lw  x5, 20(x12)
                  lw  x6, 24(x12)
                  lw  x7, 28(x12)
                  lw  x8, 32(x12)
                  lw  x9, 36(x12)
                  lw  x10, 40(x12)
                  lw  x11, 44(x12)
                  lw  x12, 48(x12)
                  lw  x13, 52(x12)
                  lw  x14, 56(x12)
                  lw  x15, 60(x12)
                  lw  x16, 64(x12)
                  lw  x17, 68(x12)
                  lw  x18, 72(x12)
                  lw  x19, 76(x12)
                  lw  x20, 80(x12)
                  lw  x21, 84(x12)
                  lw  x22, 88(x12)
                  lw  x23, 92(x12)
                  lw  x24, 96(x12)
                  lw  x25, 100(x12)
                  lw  x26, 104(x12)
                  lw  x27, 108(x12)
                  lw  x28, 112(x12)
                  lw  x29, 116(x12)
                  lw  x30, 120(x12)
                  lw  x31, 124(x12)
                  addi x12, x12, 128
                  add x25, x12, zero
                  lw  x12, (x25)
                  addi x25, x25, 4
                  mret;

kernel_instr_end: nop
.section .kernel_stack,"aw",@progbits;
.align 2
kernel_stack_start:
.rept 3999
.4byte 0x0
.endr
kernel_stack_end:
.4byte 0x0
