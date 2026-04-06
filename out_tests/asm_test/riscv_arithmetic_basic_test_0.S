.include "user_define.h"
.globl _start
.section .text
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x10, h0_start
jalr x0, x10, 0
h0_start:
                  li x27, 0x40001104
                  csrw 0x301, x27
kernel_sp:        
                  la x30, kernel_stack_end

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
                  li x0, 0xf373fd57
                  li x1, 0x0
                  li x2, 0x4
                  li x3, 0x80000000
                  li x4, 0x1
                  li x5, 0xf9e3a4a3
                  li x6, 0x0
                  li x7, 0x0
                  li x8, 0x0
                  li x9, 0x80000000
                  li x10, 0x0
                  li x11, 0xf7e09243
                  li x12, 0x80000000
                  li x13, 0x0
                  li x14, 0x0
                  li x15, 0xf67715ed
                  li x17, 0xfd6521e6
                  li x18, 0xf6b71dae
                  li x19, 0x3
                  li x20, 0x1
                  li x21, 0x6
                  li x22, 0x3
                  li x23, 0xa2e56377
                  li x24, 0x0
                  li x25, 0x7909d6db
                  li x26, 0x80000000
                  li x27, 0xe74b063c
                  li x28, 0x7bb412ed
                  li x29, 0x0
                  li x31, 0xaa2dbe88
                  la x16, user_stack_end
main:             addi         s7, t2, -1579
                  andi         gp, a0, 1810
                  c.lui        gp, 4
                  c.srai       a1, 18
                  rem          a3, s1, t6
                  c.andi       a3, 13
                  xor          s6, gp, s0
                  c.and        a5, a1
                  c.and        a5, a1
                  add          a2, t3, t2
                  divu         s2, a4, s3
                  mulhsu       sp, s0, t5
                  mul          s5, zero, t4
                  c.lui        gp, 4
                  c.sub        a5, a3
                  c.addi16sp   sp, 224
                  c.sub        a5, a3
                  c.addi16sp   sp, 224
                  andi         gp, a0, 1810
                  remu         gp, a4, s3
                  c.li         t2, 14
                  sltiu        s6, zero, -1665
                  srai         a3, t6, 11
                  mul          s5, zero, t4
                  c.addi4spn   s1, sp, 192
                  c.addi16sp   sp, 224
                  c.addi       s5, -1
                  divu         s2, a4, s3
                  c.srli       a5, 22
                  lui          a2, 460343
                  addi         s7, t2, -1579
                  sub          a2, a0, a7
                  srli         s8, t3, 9
                  c.srai       a1, 18
                  c.and        a5, a1
                  c.lui        gp, 4
                  lui          a2, 460343
                  divu         s2, a4, s3
                  srai         a3, t6, 11
                  rem          a3, s1, t6
                  c.mv         t0, t6
                  slt          ra, a3, a1
                  mulh         s1, a7, a6
                  mulhu        t4, a3, s6
                  xori         a1, s1, 959
                  c.slli       t1, 10
                  add          a2, t3, t2
                  c.mv         t0, t6
                  c.lui        gp, 4
                  xor          s6, gp, s0
                  remu         gp, a4, s3
                  remu         gp, a4, s3
                  c.andi       a3, 13
                  divu         s2, a4, s3
                  or           t4, a6, ra
                  c.addi16sp   sp, 224
                  xor          s6, gp, s0
                  nop
                  xor          s6, gp, s0
                  or           t4, a6, ra
                  srli         s8, t3, 9
                  c.addi4spn   s1, sp, 192
                  xori         a1, s1, 959
                  sltiu        s6, zero, -1665
                  c.slli       t1, 10
                  c.or         a5, a0
                  c.and        a5, a1
                  sltiu        s6, zero, -1665
                  lui          a2, 460343
                  xor          s6, gp, s0
                  c.slli       t1, 10
                  slti         t3, t5, -1062
                  ori          s3, s3, 1495
                  srai         a3, t6, 11
                  c.and        a5, a1
                  slt          ra, a3, a1
                  c.lui        gp, 4
                  add          a2, t3, t2
                  c.andi       a3, 13
                  c.slli       t1, 10
                  andi         gp, a0, 1810
                  c.andi       a3, 13
                  c.slli       t1, 10
                  mul          s5, zero, t4
                  andi         gp, a0, 1810
                  sltu         t0, a4, t2
                  c.addi4spn   s1, sp, 192
                  slt          ra, a3, a1
                  divu         s2, a4, s3
                  divu         s2, a4, s3
                  mulhsu       sp, s0, t5
                  c.lui        gp, 4
                  or           t4, a6, ra
                  xori         a1, s1, 959
                  c.sub        a5, a3
                  mulh         s1, a7, a6
                  sub          a2, a0, a7
                  mulhu        t4, a3, s6
                  mulhsu       sp, s0, t5
                  c.mv         t0, t6
                  mulhu        t4, a3, s6
                  xor          s6, gp, s0
                  sra          s3, t0, s9
                  slt          ra, a3, a1
                  mulh         s1, a7, a6
                  auipc        ra, 350999
                  c.li         t2, 14
                  and          sp, a0, gp
                  xor          s6, gp, s0
                  sltiu        s6, zero, -1665
                  sra          s3, t0, s9
                  lui          a2, 460343
                  srl          s3, a1, s4
                  c.xor        a2, s1
                  rem          a3, s1, t6
                  nop
                  c.andi       a3, 13
                  ori          s3, s3, 1495
                  mulh         s1, a7, a6
                  sra          s3, t0, s9
                  c.lui        gp, 4
                  slti         t3, t5, -1062
                  c.addi16sp   sp, 224
                  andi         gp, a0, 1810
                  lui          a2, 460343
                  sltu         t0, a4, t2
                  add          a2, t3, t2
                  slti         t3, t5, -1062
                  div          s8, a5, a2
                  add          a2, t3, t2
                  srai         a3, t6, 11
                  c.nop
                  c.andi       a3, 13
                  c.srai       a1, 18
                  sub          a2, a0, a7
                  add          a2, t3, t2
                  c.xor        a2, s1
                  c.xor        a2, s1
                  or           t4, a6, ra
                  c.addi4spn   s1, sp, 192
                  divu         s2, a4, s3
                  sll          gp, s10, s11
                  lui          a2, 460343
                  srai         a3, t6, 11
                  sltu         t0, a4, t2
                  sltiu        s6, zero, -1665
                  ori          s3, s3, 1495
                  c.or         a5, a0
                  andi         gp, a0, 1810
                  sub          a2, a0, a7
                  c.nop
                  c.mv         t0, t6
                  sltu         t0, a4, t2
                  slt          ra, a3, a1
                  andi         gp, a0, 1810
                  c.or         a5, a0
                  c.addi4spn   s1, sp, 192
                  ori          s3, s3, 1495
                  slt          ra, a3, a1
                  c.lui        gp, 4
                  c.or         a5, a0
                  ori          s3, s3, 1495
                  c.xor        a2, s1
                  c.slli       t1, 10
                  c.li         t2, 14
                  remu         gp, a4, s3
                  lui          a2, 460343
                  auipc        ra, 350999
                  sltu         t0, a4, t2
                  c.srli       a5, 22
                  or           t4, a6, ra
                  c.lui        gp, 4
                  srai         a3, t6, 11
                  c.addi16sp   sp, 224
                  srli         s8, t3, 9
                  sll          gp, s10, s11
                  slti         t3, t5, -1062
                  rem          a3, s1, t6
                  sub          a2, a0, a7
                  c.srai       a1, 18
                  divu         s2, a4, s3
                  srl          s3, a1, s4
                  xor          s6, gp, s0
                  c.srli       a5, 22
                  srli         s8, t3, 9
                  c.li         t2, 14
                  and          sp, a0, gp
                  mulhsu       sp, s0, t5
                  xor          s6, gp, s0
                  nop
                  c.sub        a5, a3
                  c.srai       a1, 18
                  mulhsu       sp, s0, t5
                  srl          s3, a1, s4
                  divu         s2, a4, s3
                  xor          s6, gp, s0
                  remu         gp, a4, s3
                  slt          ra, a3, a1
                  sub          a2, a0, a7
                  xor          s6, gp, s0
                  c.addi16sp   sp, 224
                  c.add        s9, s7
                  xor          s6, gp, s0
                  srli         s8, t3, 9
                  c.xor        a2, s1
                  c.sub        a5, a3
                  c.lui        gp, 4
                  c.addi       s5, -1
                  div          s8, a5, a2
                  sltiu        s6, zero, -1665
                  and          sp, a0, gp
                  mulhsu       sp, s0, t5
                  sltiu        s6, zero, -1665
                  remu         gp, a4, s3
                  c.addi       s5, -1
                  slti         t3, t5, -1062
                  xor          s6, gp, s0
                  c.nop
                  addi         s7, t2, -1579
                  c.xor        a2, s1
                  mulh         s1, a7, a6
                  addi         s7, t2, -1579
                  sll          gp, s10, s11
                  c.srli       a5, 22
                  c.slli       t1, 10
                  sltu         t0, a4, t2
                  divu         s2, a4, s3
                  c.li         t2, 14
                  c.and        a5, a1
                  c.mv         t0, t6
                  auipc        ra, 350999
                  remu         gp, a4, s3
                  c.mv         t0, t6
                  mul          s5, zero, t4
                  mulhsu       sp, s0, t5
                  slli         sp, a1, 17
                  c.srai       a1, 18
                  srli         s8, t3, 9
                  divu         s2, a4, s3
                  mulhu        t4, a3, s6
                  sll          gp, s10, s11
                  mulhsu       sp, s0, t5
                  sra          s3, t0, s9
                  c.srli       a5, 22
                  sltu         t0, a4, t2
                  c.lui        gp, 4
                  srl          s3, a1, s4
                  c.srli       a5, 22
                  c.mv         t0, t6
                  srl          s3, a1, s4
                  addi         s7, t2, -1579
                  slli         sp, a1, 17
                  c.andi       a3, 13
                  slti         t3, t5, -1062
                  ori          s3, s3, 1495
                  xor          s6, gp, s0
                  divu         s2, a4, s3
                  nop
                  c.addi4spn   s1, sp, 192
                  lui          a2, 460343
                  c.addi16sp   sp, 224
                  or           t4, a6, ra
                  c.and        a5, a1
                  c.addi4spn   s1, sp, 192
                  and          sp, a0, gp
                  xori         a1, s1, 959
                  c.lui        gp, 4
                  ori          s3, s3, 1495
                  c.andi       a3, 13
                  div          s8, a5, a2
                  srl          s3, a1, s4
                  sll          gp, s10, s11
                  c.srli       a5, 22
                  srl          s3, a1, s4
                  mul          s5, zero, t4
                  c.addi4spn   s1, sp, 192
                  nop
                  remu         gp, a4, s3
                  nop
                  srai         a3, t6, 11
                  c.xor        a2, s1
                  c.andi       a3, 13
                  c.addi4spn   s1, sp, 192
                  c.srai       a1, 18
                  c.slli       t1, 10
                  lui          a2, 460343
                  divu         s2, a4, s3
                  auipc        ra, 350999
                  mulhu        t4, a3, s6
                  mulh         s1, a7, a6
                  mulhsu       sp, s0, t5
                  slt          ra, a3, a1
                  slt          ra, a3, a1
                  c.add        s9, s7
                  remu         gp, a4, s3
                  c.or         a5, a0
                  c.sub        a5, a3
                  remu         gp, a4, s3
                  sll          gp, s10, s11
                  c.and        a5, a1
                  divu         s2, a4, s3
                  c.addi16sp   sp, 224
                  c.slli       t1, 10
                  c.li         t2, 14
                  mulh         s1, a7, a6
                  or           t4, a6, ra
                  c.and        a5, a1
                  c.slli       t1, 10
                  mul          s5, zero, t4
                  c.nop
                  srli         s8, t3, 9
                  c.srai       a1, 18
                  c.slli       t1, 10
                  addi         s7, t2, -1579
                  srli         s8, t3, 9
                  c.addi16sp   sp, 224
                  andi         gp, a0, 1810
                  srli         s8, t3, 9
                  addi         s7, t2, -1579
                  auipc        ra, 350999
                  andi         gp, a0, 1810
                  srli         s8, t3, 9
                  and          sp, a0, gp
                  c.and        a5, a1
                  c.andi       a3, 13
                  slt          ra, a3, a1
                  sltu         t0, a4, t2
                  c.or         a5, a0
                  sltiu        s6, zero, -1665
                  c.addi4spn   s1, sp, 192
                  sub          a2, a0, a7
                  c.andi       a3, 13
                  divu         s2, a4, s3
                  srl          s3, a1, s4
                  c.lui        gp, 4
                  c.xor        a2, s1
                  c.srai       a1, 18
                  srl          s3, a1, s4
                  srl          s3, a1, s4
                  c.add        s9, s7
                  c.nop
                  sltu         t0, a4, t2
                  c.lui        gp, 4
                  slt          ra, a3, a1
                  c.mv         t0, t6
                  c.add        s9, s7
                  slt          ra, a3, a1
                  c.lui        gp, 4
                  srai         a3, t6, 11
                  addi         s7, t2, -1579
                  c.li         t2, 14
                  c.addi       s5, -1
                  mulhu        t4, a3, s6
                  div          s8, a5, a2
                  srl          s3, a1, s4
                  c.and        a5, a1
                  slt          ra, a3, a1
                  srai         a3, t6, 11
                  divu         s2, a4, s3
                  or           t4, a6, ra
                  c.addi       s5, -1
                  mulh         s1, a7, a6
                  mulhsu       sp, s0, t5
                  mulh         s1, a7, a6
                  addi         s7, t2, -1579
                  and          sp, a0, gp
                  divu         s2, a4, s3
                  c.addi4spn   s1, sp, 192
                  mul          s5, zero, t4
                  andi         gp, a0, 1810
                  slti         t3, t5, -1062
                  mulhsu       sp, s0, t5
                  mulh         s1, a7, a6
                  c.addi4spn   s1, sp, 192
                  c.li         t2, 14
                  slt          ra, a3, a1
                  add          a2, t3, t2
                  c.addi16sp   sp, 224
                  slt          ra, a3, a1
                  auipc        ra, 350999
                  srai         a3, t6, 11
                  c.or         a5, a0
                  c.add        s9, s7
                  slti         t3, t5, -1062
                  c.andi       a3, 13
                  c.and        a5, a1
                  srli         s8, t3, 9
                  remu         gp, a4, s3
                  c.addi4spn   s1, sp, 192
                  c.addi       s5, -1
                  c.srai       a1, 18
                  srli         s8, t3, 9
                  add          a2, t3, t2
                  lui          a2, 460343
                  srai         a3, t6, 11
                  c.andi       a3, 13
                  c.addi       s5, -1
                  c.or         a5, a0
                  and          sp, a0, gp
                  auipc        ra, 350999
                  c.slli       t1, 10
                  nop
                  c.addi16sp   sp, 224
                  add          a2, t3, t2
                  divu         s2, a4, s3
                  c.and        a5, a1
                  sub          a2, a0, a7
                  c.or         a5, a0
                  c.or         a5, a0
                  slli         sp, a1, 17
                  slli         sp, a1, 17
                  c.srli       a5, 22
                  andi         gp, a0, 1810
                  sltu         t0, a4, t2
                  sub          a2, a0, a7
                  srl          s3, a1, s4
                  srl          s3, a1, s4
                  c.addi16sp   sp, 224
                  remu         gp, a4, s3
                  c.slli       t1, 10
                  c.andi       a3, 13
                  c.srli       a5, 22
                  auipc        ra, 350999
                  c.add        s9, s7
                  and          sp, a0, gp
                  lui          a2, 460343
                  ori          s3, s3, 1495
                  sub          a2, a0, a7
                  sltu         t0, a4, t2
                  slli         sp, a1, 17
                  remu         gp, a4, s3
                  c.or         a5, a0
                  c.slli       t1, 10
                  ori          s3, s3, 1495
                  div          s8, a5, a2
                  xor          s6, gp, s0
                  c.lui        gp, 4
                  c.slli       t1, 10
                  addi         s7, t2, -1579
                  c.lui        gp, 4
                  c.mv         t0, t6
                  xor          s6, gp, s0
                  or           t4, a6, ra
                  auipc        ra, 350999
                  c.add        s9, s7
                  remu         gp, a4, s3
                  sltu         t0, a4, t2
                  srli         s8, t3, 9
                  sll          gp, s10, s11
                  c.andi       a3, 13
                  c.srai       a1, 18
                  addi         s7, t2, -1579
                  srli         s8, t3, 9
                  div          s8, a5, a2
                  c.mv         t0, t6
                  xor          s6, gp, s0
                  srai         a3, t6, 11
                  andi         gp, a0, 1810
                  srl          s3, a1, s4
                  c.and        a5, a1
                  lui          a2, 460343
                  c.sub        a5, a3
                  add          a2, t3, t2
                  lui          a2, 460343
                  rem          a3, s1, t6
                  c.lui        gp, 4
                  c.slli       t1, 10
                  add          a2, t3, t2
                  div          s8, a5, a2
                  add          a2, t3, t2
                  srl          s3, a1, s4
                  sra          s3, t0, s9
                  sub          a2, a0, a7
                  add          a2, t3, t2
                  addi         s7, t2, -1579
                  c.nop
                  sll          gp, s10, s11
                  srai         a3, t6, 11
                  c.or         a5, a0
                  slli         sp, a1, 17
                  slt          ra, a3, a1
                  lui          a2, 460343
                  sltu         t0, a4, t2
                  slti         t3, t5, -1062
                  mulhu        t4, a3, s6
                  c.li         t2, 14
                  c.srai       a1, 18
                  div          s8, a5, a2
                  c.lui        gp, 4
                  and          sp, a0, gp
                  mulh         s1, a7, a6
                  nop
                  c.slli       t1, 10
                  c.andi       a3, 13
                  c.and        a5, a1
                  c.mv         t0, t6
                  c.addi       s5, -1
                  c.and        a5, a1
                  c.addi16sp   sp, 224
                  c.mv         t0, t6
                  mulhu        t4, a3, s6
                  sra          s3, t0, s9
                  c.li         t2, 14
                  add          a2, t3, t2
                  c.li         t2, 14
                  srli         s8, t3, 9
                  andi         gp, a0, 1810
                  div          s8, a5, a2
                  lui          a2, 460343
                  c.slli       t1, 10
                  c.addi       s5, -1
                  ori          s3, s3, 1495
                  and          sp, a0, gp
                  c.and        a5, a1
                  mul          s5, zero, t4
                  auipc        ra, 350999
                  c.add        s9, s7
                  c.nop
                  div          s8, a5, a2
                  nop
                  c.nop
                  mulhu        t4, a3, s6
                  srli         s8, t3, 9
                  mulhsu       sp, s0, t5
                  or           t4, a6, ra
                  c.addi4spn   s1, sp, 192
                  c.lui        gp, 4
                  div          s8, a5, a2
                  add          a2, t3, t2
                  sltu         t0, a4, t2
                  sra          s3, t0, s9
                  c.srli       a5, 22
                  srli         s8, t3, 9
                  sra          s3, t0, s9
                  c.add        s9, s7
                  slli         sp, a1, 17
                  c.srai       a1, 18
                  andi         gp, a0, 1810
                  mulhsu       sp, s0, t5
                  ori          s3, s3, 1495
                  c.li         t2, 14
                  srl          s3, a1, s4
                  c.mv         t0, t6
                  c.xor        a2, s1
                  slt          ra, a3, a1
                  c.addi       s5, -1
                  c.li         t2, 14
                  c.nop
                  and          sp, a0, gp
                  c.slli       t1, 10
                  c.xor        a2, s1
                  c.andi       a3, 13
                  c.mv         t0, t6
                  srli         s8, t3, 9
                  c.nop
                  remu         gp, a4, s3
                  sub          a2, a0, a7
                  srl          s3, a1, s4
                  sll          gp, s10, s11
                  rem          a3, s1, t6
                  slti         t3, t5, -1062
                  srli         s8, t3, 9
                  slli         sp, a1, 17
                  andi         gp, a0, 1810
                  c.addi16sp   sp, 224
                  c.srli       a5, 22
                  c.xor        a2, s1
                  add          a2, t3, t2
                  addi         s7, t2, -1579
                  andi         gp, a0, 1810
                  c.or         a5, a0
                  xor          s6, gp, s0
                  or           t4, a6, ra
                  c.srai       a1, 18
                  c.andi       a3, 13
                  mulh         s1, a7, a6
                  sltiu        s6, zero, -1665
                  c.and        a5, a1
                  mulhu        t4, a3, s6
                  mul          s5, zero, t4
                  c.srai       a1, 18
                  add          a2, t3, t2
                  xori         a1, s1, 959
                  slt          ra, a3, a1
                  c.mv         t0, t6
                  divu         s2, a4, s3
                  sltiu        s6, zero, -1665
                  c.nop
                  c.addi4spn   s1, sp, 192
                  c.sub        a5, a3
                  divu         s2, a4, s3
                  lui          a2, 460343
                  c.mv         t0, t6
                  c.mv         t0, t6
                  mulhu        t4, a3, s6
                  rem          a3, s1, t6
                  div          s8, a5, a2
                  c.srli       a5, 22
                  c.lui        gp, 4
                  addi         s7, t2, -1579
                  sub          a2, a0, a7
                  addi         s7, t2, -1579
                  c.srai       a1, 18
                  slti         t3, t5, -1062
                  rem          a3, s1, t6
                  and          sp, a0, gp
                  div          s8, a5, a2
                  mulh         s1, a7, a6
                  srli         s8, t3, 9
                  c.addi       s5, -1
                  sll          gp, s10, s11
                  sub          a2, a0, a7
                  srli         s8, t3, 9
                  sra          s3, t0, s9
                  srl          s3, a1, s4
                  sltu         t0, a4, t2
                  xori         a1, s1, 959
                  addi         s7, t2, -1579
                  c.addi       s5, -1
                  rem          a3, s1, t6
                  c.slli       t1, 10
                  auipc        ra, 350999
                  c.and        a5, a1
                  c.srli       a5, 22
                  sltiu        s6, zero, -1665
                  slli         sp, a1, 17
                  c.xor        a2, s1
                  slli         sp, a1, 17
                  remu         gp, a4, s3
                  sltu         t0, a4, t2
                  c.mv         t0, t6
                  c.or         a5, a0
                  srai         a3, t6, 11
                  addi         s7, t2, -1579
                  c.slli       t1, 10
                  sra          s3, t0, s9
                  c.add        s9, s7
                  slti         t3, t5, -1062
                  c.addi16sp   sp, 224
                  c.mv         t0, t6
                  xor          s6, gp, s0
                  rem          a3, s1, t6
                  srai         a3, t6, 11
                  slli         sp, a1, 17
                  lui          a2, 460343
                  slli         sp, a1, 17
                  remu         gp, a4, s3
                  xor          s6, gp, s0
                  andi         gp, a0, 1810
                  sra          s3, t0, s9
                  c.addi16sp   sp, 224
                  slti         t3, t5, -1062
                  srli         s8, t3, 9
                  slli         sp, a1, 17
                  srl          s3, a1, s4
                  c.mv         t0, t6
                  slt          ra, a3, a1
                  xor          s6, gp, s0
                  addi         s7, t2, -1579
                  c.addi16sp   sp, 224
                  srl          s3, a1, s4
                  remu         gp, a4, s3
                  remu         gp, a4, s3
                  divu         s2, a4, s3
                  c.or         a5, a0
                  srl          s3, a1, s4
                  andi         gp, a0, 1810
                  srai         a3, t6, 11
                  mul          s5, zero, t4
                  mulhu        t4, a3, s6
                  sub          a2, a0, a7
                  slti         t3, t5, -1062
                  remu         gp, a4, s3
                  andi         gp, a0, 1810
                  addi         s7, t2, -1579
                  c.xor        a2, s1
                  sll          gp, s10, s11
                  and          sp, a0, gp
                  c.srli       a5, 22
                  sltu         t0, a4, t2
                  c.or         a5, a0
                  addi         s7, t2, -1579
                  xori         a1, s1, 959
                  xori         a1, s1, 959
                  c.lui        gp, 4
                  nop
                  slt          ra, a3, a1
                  c.nop
                  div          s8, a5, a2
                  lui          a2, 460343
                  c.xor        a2, s1
                  c.add        s9, s7
                  sltu         t0, a4, t2
                  c.slli       t1, 10
                  xori         a1, s1, 959
                  srai         a3, t6, 11
                  c.andi       a3, 13
                  c.srli       a5, 22
                  slli         sp, a1, 17
                  ori          s3, s3, 1495
                  lui          a2, 460343
                  c.srai       a1, 18
                  srai         a3, t6, 11
                  rem          a3, s1, t6
                  c.srai       a1, 18
                  c.andi       a3, 13
                  slt          ra, a3, a1
                  slti         t3, t5, -1062
                  slt          ra, a3, a1
                  c.addi4spn   s1, sp, 192
                  mulhu        t4, a3, s6
                  ori          s3, s3, 1495
                  andi         gp, a0, 1810
                  auipc        ra, 350999
                  mulh         s1, a7, a6
                  add          a2, t3, t2
                  sub          a2, a0, a7
                  andi         gp, a0, 1810
                  rem          a3, s1, t6
                  c.nop
                  slt          ra, a3, a1
                  sra          s3, t0, s9
                  c.or         a5, a0
                  c.nop
                  c.addi       s5, -1
                  slt          ra, a3, a1
                  slt          ra, a3, a1
                  mulh         s1, a7, a6
                  c.srli       a5, 22
                  c.srai       a1, 18
                  c.addi16sp   sp, 224
                  mulhu        t4, a3, s6
                  c.srli       a5, 22
                  xori         a1, s1, 959
                  srli         s8, t3, 9
                  c.andi       a3, 13
                  srli         s8, t3, 9
                  divu         s2, a4, s3
                  c.addi4spn   s1, sp, 192
                  ori          s3, s3, 1495
                  rem          a3, s1, t6
                  slli         sp, a1, 17
                  div          s8, a5, a2
                  srli         s8, t3, 9
                  c.sub        a5, a3
                  c.srli       a5, 22
                  slli         sp, a1, 17
                  sub          a2, a0, a7
                  mul          s5, zero, t4
                  mul          s5, zero, t4
                  c.addi4spn   s1, sp, 192
                  c.andi       a3, 13
                  sltiu        s6, zero, -1665
                  sub          a2, a0, a7
                  lui          a2, 460343
                  c.or         a5, a0
                  auipc        ra, 350999
                  mul          s5, zero, t4
                  slti         t3, t5, -1062
                  remu         gp, a4, s3
                  ori          s3, s3, 1495
                  c.mv         t0, t6
                  c.xor        a2, s1
                  lui          a2, 460343
                  srai         a3, t6, 11
                  and          sp, a0, gp
                  c.nop
                  c.li         t2, 14
                  c.nop
                  c.sub        a5, a3
                  c.addi4spn   s1, sp, 192
                  c.addi4spn   s1, sp, 192
                  c.addi16sp   sp, 224
                  srli         s8, t3, 9
                  srl          s3, a1, s4
                  sll          gp, s10, s11
                  c.addi4spn   s1, sp, 192
                  c.and        a5, a1
                  or           t4, a6, ra
                  c.or         a5, a0
                  c.srli       a5, 22
                  c.addi16sp   sp, 224
                  xori         a1, s1, 959
                  c.addi16sp   sp, 224
                  c.add        s9, s7
                  sll          gp, s10, s11
                  sltu         t0, a4, t2
                  c.xor        a2, s1
                  c.slli       t1, 10
                  div          s8, a5, a2
                  srai         a3, t6, 11
                  c.addi       s5, -1
                  remu         gp, a4, s3
                  srl          s3, a1, s4
                  auipc        ra, 350999
                  c.addi16sp   sp, 224
                  sub          a2, a0, a7
                  sltiu        s6, zero, -1665
                  and          sp, a0, gp
                  c.srli       a5, 22
                  addi         s7, t2, -1579
                  c.addi       s5, -1
                  sltu         t0, a4, t2
                  divu         s2, a4, s3
                  c.lui        gp, 4
                  rem          a3, s1, t6
                  mulhsu       sp, s0, t5
                  divu         s2, a4, s3
                  c.lui        gp, 4
                  c.lui        gp, 4
                  c.sub        a5, a3
                  c.srli       a5, 22
                  c.addi       s5, -1
                  xori         a1, s1, 959
                  xori         a1, s1, 959
                  sll          gp, s10, s11
                  c.mv         t0, t6
                  c.and        a5, a1
                  andi         gp, a0, 1810
                  c.addi16sp   sp, 224
                  slti         t3, t5, -1062
                  srl          s3, a1, s4
                  sltiu        s6, zero, -1665
                  c.srai       a1, 18
                  c.and        a5, a1
                  xori         a1, s1, 959
                  c.slli       t1, 10
                  ori          s3, s3, 1495
                  c.and        a5, a1
                  c.mv         t0, t6
                  c.addi16sp   sp, 224
                  sltu         t0, a4, t2
                  c.li         t2, 14
                  c.sub        a5, a3
                  mul          s5, zero, t4
                  srli         s8, t3, 9
                  mul          s5, zero, t4
                  c.andi       a3, 13
                  auipc        ra, 350999
                  mulh         s1, a7, a6
                  slli         sp, a1, 17
                  divu         s2, a4, s3
                  c.srli       a5, 22
                  c.srli       a5, 22
                  c.lui        gp, 4
                  c.addi4spn   s1, sp, 192
                  c.addi16sp   sp, 224
                  div          s8, a5, a2
                  slt          ra, a3, a1
                  c.mv         t0, t6
                  c.slli       t1, 10
                  c.slli       t1, 10
                  mulhsu       sp, s0, t5
                  mulhu        t4, a3, s6
                  mulhu        t4, a3, s6
                  divu         s2, a4, s3
                  sltu         t0, a4, t2
                  or           t4, a6, ra
                  addi         s7, t2, -1579
                  c.addi4spn   s1, sp, 192
                  c.li         t2, 14
                  c.slli       t1, 10
                  sltu         t0, a4, t2
                  mulhsu       sp, s0, t5
                  c.addi       s5, -1
                  c.addi4spn   s1, sp, 192
                  ori          s3, s3, 1495
                  sltiu        s6, zero, -1665
                  or           t4, a6, ra
                  c.xor        a2, s1
                  c.srai       a1, 18
                  slt          ra, a3, a1
                  remu         gp, a4, s3
                  mul          s5, zero, t4
                  c.lui        gp, 4
                  and          sp, a0, gp
                  slli         sp, a1, 17
                  sltu         t0, a4, t2
                  srai         a3, t6, 11
                  slt          ra, a3, a1
                  mulh         s1, a7, a6
                  c.srai       a1, 18
                  addi         s7, t2, -1579
                  slt          ra, a3, a1
                  andi         gp, a0, 1810
                  add          a2, t3, t2
                  mulhsu       sp, s0, t5
                  xori         a1, s1, 959
                  slli         sp, a1, 17
                  c.addi16sp   sp, 224
                  and          sp, a0, gp
                  addi         s7, t2, -1579
                  c.srai       a1, 18
                  c.or         a5, a0
                  xor          s6, gp, s0
                  ori          s3, s3, 1495
                  xor          s6, gp, s0
                  divu         s2, a4, s3
                  c.or         a5, a0
                  c.or         a5, a0
                  lui          a2, 460343
                  c.li         t2, 14
                  slli         sp, a1, 17
                  xori         a1, s1, 959
                  srai         a3, t6, 11
                  rem          a3, s1, t6
                  mul          s5, zero, t4
                  c.add        s9, s7
                  c.srli       a5, 22
                  sra          s3, t0, s9
                  mul          s5, zero, t4
                  c.lui        gp, 4
                  nop
                  sltiu        s6, zero, -1665
                  c.srli       a5, 22
                  srl          s3, a1, s4
                  sltiu        s6, zero, -1665
                  c.sub        a5, a3
                  c.sub        a5, a3
                  c.add        s9, s7
                  sll          gp, s10, s11
                  srai         a3, t6, 11
                  ori          s3, s3, 1495
                  mul          s5, zero, t4
                  c.or         a5, a0
                  slli         sp, a1, 17
                  or           t4, a6, ra
                  c.addi16sp   sp, 224
                  srli         s8, t3, 9
                  c.srai       a1, 18
                  lui          a2, 460343
                  or           t4, a6, ra
                  lui          a2, 460343
                  divu         s2, a4, s3
                  addi         s7, t2, -1579
                  xor          s6, gp, s0
                  remu         gp, a4, s3
                  slt          ra, a3, a1
                  c.li         t2, 14
                  sll          gp, s10, s11
                  sub          a2, a0, a7
                  sub          a2, a0, a7
                  slli         sp, a1, 17
                  srli         s8, t3, 9
                  and          sp, a0, gp
                  lui          a2, 460343
                  srli         s8, t3, 9
                  sltu         t0, a4, t2
                  slli         sp, a1, 17
                  mul          s5, zero, t4
                  slti         t3, t5, -1062
                  slli         sp, a1, 17
                  slt          ra, a3, a1
                  srl          s3, a1, s4
                  c.andi       a3, 13
                  xor          s6, gp, s0
                  c.li         t2, 14
                  addi         s7, t2, -1579
                  rem          a3, s1, t6
                  c.addi16sp   sp, 224
                  nop
                  c.li         t2, 14
                  sll          gp, s10, s11
                  mul          s5, zero, t4
                  c.slli       t1, 10
                  mulhsu       sp, s0, t5
                  c.slli       t1, 10
                  mulhu        t4, a3, s6
                  lui          a2, 460343
                  c.li         t2, 14
                  div          s8, a5, a2
                  mulhu        t4, a3, s6
                  mulhu        t4, a3, s6
                  c.xor        a2, s1
                  c.and        a5, a1
                  div          s8, a5, a2
                  srai         a3, t6, 11
                  or           t4, a6, ra
                  andi         gp, a0, 1810
                  srai         a3, t6, 11
                  or           t4, a6, ra
                  mul          s5, zero, t4
                  slli         sp, a1, 17
                  c.li         t2, 14
                  c.srli       a5, 22
                  addi         s7, t2, -1579
                  slt          ra, a3, a1
                  c.srai       a1, 18
                  sltiu        s6, zero, -1665
                  or           t4, a6, ra
                  c.srli       a5, 22
                  mulh         s1, a7, a6
                  add          a2, t3, t2
                  auipc        ra, 350999
                  sra          s3, t0, s9
                  addi         s7, t2, -1579
                  rem          a3, s1, t6
                  xor          s6, gp, s0
                  lui          a2, 460343
                  addi         s7, t2, -1579
                  slti         t3, t5, -1062
                  c.addi       s5, -1
                  c.add        s9, s7
                  c.addi16sp   sp, 224
                  lui          a2, 460343
                  divu         s2, a4, s3
                  rem          a3, s1, t6
                  slt          ra, a3, a1
                  c.li         t2, 14
                  slt          ra, a3, a1
                  c.li         t2, 14
                  andi         gp, a0, 1810
                  remu         gp, a4, s3
                  c.nop
                  c.lui        gp, 4
                  or           t4, a6, ra
                  mulh         s1, a7, a6
                  divu         s2, a4, s3
                  c.slli       t1, 10
                  mulhu        t4, a3, s6
                  andi         gp, a0, 1810
                  add          a2, t3, t2
                  c.addi16sp   sp, 224
                  slli         sp, a1, 17
                  c.srai       a1, 18
                  c.li         t2, 14
                  sltu         t0, a4, t2
                  sll          gp, s10, s11
                  c.srai       a1, 18
                  c.srai       a1, 18
                  mulhu        t4, a3, s6
                  sltiu        s6, zero, -1665
                  mulhsu       sp, s0, t5
                  sltu         t0, a4, t2
                  sub          a2, a0, a7
                  addi         s7, t2, -1579
                  slt          ra, a3, a1
                  div          s8, a5, a2
                  mul          s5, zero, t4
                  c.xor        a2, s1
                  nop
                  sra          s3, t0, s9
                  addi         s7, t2, -1579
                  sra          s3, t0, s9
                  add          a2, t3, t2
                  sra          s3, t0, s9
                  addi         s7, t2, -1579
                  c.slli       t1, 10
                  mulhu        t4, a3, s6
                  auipc        ra, 350999
                  remu         gp, a4, s3
                  c.lui        gp, 4
                  add          a2, t3, t2
                  c.addi       s5, -1
                  add          a2, t3, t2
                  c.srli       a5, 22
                  c.lui        gp, 4
                  sll          gp, s10, s11
                  slt          ra, a3, a1
                  srai         a3, t6, 11
                  rem          a3, s1, t6
                  c.mv         t0, t6
                  mulhsu       sp, s0, t5
                  or           t4, a6, ra
                  slti         t3, t5, -1062
                  c.addi       s5, -1
                  or           t4, a6, ra
                  c.and        a5, a1
                  c.addi16sp   sp, 224
                  divu         s2, a4, s3
                  auipc        ra, 350999
                  lui          a2, 460343
                  c.sub        a5, a3
                  div          s8, a5, a2
                  lui          a2, 460343
                  c.addi16sp   sp, 224
                  addi         s7, t2, -1579
                  andi         gp, a0, 1810
                  c.srai       a1, 18
                  c.addi16sp   sp, 224
                  c.lui        gp, 4
                  srli         s8, t3, 9
                  div          s8, a5, a2
                  c.addi4spn   s1, sp, 192
                  sub          a2, a0, a7
                  mulhu        t4, a3, s6
                  srl          s3, a1, s4
                  sltu         t0, a4, t2
                  lui          a2, 460343
                  c.srli       a5, 22
                  slli         sp, a1, 17
                  ori          s3, s3, 1495
                  c.and        a5, a1
                  c.li         t2, 14
                  c.and        a5, a1
                  auipc        ra, 350999
                  sub          a2, a0, a7
                  srai         a3, t6, 11
                  sltu         t0, a4, t2
                  sra          s3, t0, s9
                  divu         s2, a4, s3
                  c.and        a5, a1
                  c.xor        a2, s1
                  or           t4, a6, ra
                  srai         a3, t6, 11
                  sll          gp, s10, s11
                  c.sub        a5, a3
                  c.mv         t0, t6
                  addi         s7, t2, -1579
                  nop
                  slti         t3, t5, -1062
                  c.or         a5, a0
                  c.addi       s5, -1
                  remu         gp, a4, s3
                  c.nop
                  slti         t3, t5, -1062
                  c.addi4spn   s1, sp, 192
                  lui          a2, 460343
                  nop
                  c.xor        a2, s1
                  mulhsu       sp, s0, t5
                  lui          a2, 460343
                  and          sp, a0, gp
                  addi         s7, t2, -1579
                  remu         gp, a4, s3
                  sll          gp, s10, s11
                  c.add        s9, s7
                  sub          a2, a0, a7
                  or           t4, a6, ra
                  c.lui        gp, 4
                  sltiu        s6, zero, -1665
                  c.li         t2, 14
                  srli         s8, t3, 9
                  c.srai       a1, 18
                  lui          a2, 460343
                  mul          s5, zero, t4
                  c.nop
                  andi         gp, a0, 1810
                  c.slli       t1, 10
                  c.li         t2, 14
                  c.or         a5, a0
                  addi         s7, t2, -1579
                  andi         gp, a0, 1810
                  c.lui        gp, 4
                  c.add        s9, s7
                  c.addi       s5, -1
                  sra          s3, t0, s9
                  c.nop
                  sltu         t0, a4, t2
                  c.mv         t0, t6
                  and          sp, a0, gp
                  mulh         s1, a7, a6
                  srli         s8, t3, 9
                  sltu         t0, a4, t2
                  mulh         s1, a7, a6
                  c.addi       s5, -1
                  mul          s5, zero, t4
                  c.mv         t0, t6
                  c.or         a5, a0
                  sub          a2, a0, a7
                  slti         t3, t5, -1062
                  add          a2, t3, t2
                  auipc        ra, 350999
                  xor          s6, gp, s0
                  c.addi16sp   sp, 224
                  add          a2, t3, t2
                  and          sp, a0, gp
                  c.andi       a3, 13
                  c.lui        gp, 4
                  c.and        a5, a1
                  c.addi       s5, -1
                  c.lui        gp, 4
                  add          a2, t3, t2
                  c.xor        a2, s1
                  xor          s6, gp, s0
                  c.lui        gp, 4
                  slt          ra, a3, a1
                  andi         gp, a0, 1810
                  c.nop
                  auipc        ra, 350999
                  c.nop
                  c.andi       a3, 13
                  nop
                  and          sp, a0, gp
                  srli         s8, t3, 9
                  c.add        s9, s7
                  slti         t3, t5, -1062
                  c.slli       t1, 10
                  c.and        a5, a1
                  xori         a1, s1, 959
                  and          sp, a0, gp
                  srl          s3, a1, s4
                  mulhsu       sp, s0, t5
                  slli         sp, a1, 17
                  c.addi       s5, -1
                  c.andi       a3, 13
                  xor          s6, gp, s0
                  c.srli       a5, 22
                  c.srai       a1, 18
                  slli         sp, a1, 17
                  or           t4, a6, ra
                  c.mv         t0, t6
                  xor          s6, gp, s0
                  c.xor        a2, s1
                  c.xor        a2, s1
                  sll          gp, s10, s11
                  xor          s6, gp, s0
                  mulh         s1, a7, a6
                  lui          a2, 460343
                  c.sub        a5, a3
                  lui          a2, 460343
                  add          a2, t3, t2
                  divu         s2, a4, s3
                  xori         a1, s1, 959
                  auipc        ra, 350999
                  mulh         s1, a7, a6
                  slli         sp, a1, 17
                  mulhu        t4, a3, s6
                  addi         s7, t2, -1579
                  c.addi16sp   sp, 224
                  slti         t3, t5, -1062
                  c.add        s9, s7
                  sll          gp, s10, s11
                  c.andi       a3, 13
                  sll          gp, s10, s11
                  srl          s3, a1, s4
                  rem          a3, s1, t6
                  mul          s5, zero, t4
                  mul          s5, zero, t4
                  c.addi16sp   sp, 224
                  add          a2, t3, t2
                  slt          ra, a3, a1
                  c.andi       a3, 13
                  lui          a2, 460343
                  ori          s3, s3, 1495
                  sub          a2, a0, a7
                  sra          s3, t0, s9
                  c.addi       s5, -1
                  c.lui        gp, 4
                  divu         s2, a4, s3
                  mulh         s1, a7, a6
                  c.xor        a2, s1
                  c.nop
                  slli         sp, a1, 17
                  c.mv         t0, t6
                  mulhu        t4, a3, s6
                  sltu         t0, a4, t2
                  ori          s3, s3, 1495
                  mul          s5, zero, t4
                  auipc        ra, 350999
                  slti         t3, t5, -1062
                  c.nop
                  sltiu        s6, zero, -1665
                  c.add        s9, s7
                  mulhsu       sp, s0, t5
                  add          a2, t3, t2
                  auipc        ra, 350999
                  c.li         t2, 14
                  ori          s3, s3, 1495
                  sra          s3, t0, s9
                  addi         s7, t2, -1579
                  c.nop
                  sltu         t0, a4, t2
                  c.addi16sp   sp, 224
                  mulh         s1, a7, a6
                  sra          s3, t0, s9
                  slti         t3, t5, -1062
                  or           t4, a6, ra
                  addi         s7, t2, -1579
                  c.addi16sp   sp, 224
                  divu         s2, a4, s3
                  c.srai       a1, 18
                  sll          gp, s10, s11
                  or           t4, a6, ra
                  sub          a2, a0, a7
                  andi         gp, a0, 1810
                  c.or         a5, a0
                  xor          s6, gp, s0
                  and          sp, a0, gp
                  sltu         t0, a4, t2
                  srai         a3, t6, 11
                  ori          s3, s3, 1495
                  mulhsu       sp, s0, t5
                  c.addi       s5, -1
                  sra          s3, t0, s9
                  c.addi16sp   sp, 224
                  mul          s5, zero, t4
                  slti         t3, t5, -1062
                  slti         t3, t5, -1062
                  add          a2, t3, t2
                  addi         s7, t2, -1579
                  c.addi4spn   s1, sp, 192
                  c.srai       a1, 18
                  c.or         a5, a0
                  div          s8, a5, a2
                  xori         a1, s1, 959
                  sltu         t0, a4, t2
                  divu         s2, a4, s3
                  sltu         t0, a4, t2
                  c.srli       a5, 22
                  c.andi       a3, 13
                  c.addi16sp   sp, 224
                  c.addi16sp   sp, 224
                  nop
                  slti         t3, t5, -1062
                  slli         sp, a1, 17
                  c.li         t2, 14
                  xor          s6, gp, s0
                  c.srai       a1, 18
                  c.add        s9, s7
                  c.srli       a5, 22
                  c.slli       t1, 10
                  c.and        a5, a1
                  and          sp, a0, gp
                  remu         gp, a4, s3
                  slt          ra, a3, a1
                  sra          s3, t0, s9
                  c.li         t2, 14
                  c.add        s9, s7
                  c.sub        a5, a3
                  sll          gp, s10, s11
                  mulh         s1, a7, a6
                  slti         t3, t5, -1062
                  andi         gp, a0, 1810
                  c.xor        a2, s1
                  mulh         s1, a7, a6
                  add          a2, t3, t2
                  remu         gp, a4, s3
                  add          a2, t3, t2
                  c.slli       t1, 10
                  srl          s3, a1, s4
                  c.nop
                  slt          ra, a3, a1
                  srl          s3, a1, s4
                  slti         t3, t5, -1062
                  auipc        ra, 350999
                  sltu         t0, a4, t2
                  c.addi       s5, -1
                  c.nop
                  remu         gp, a4, s3
                  or           t4, a6, ra
                  mulhu        t4, a3, s6
                  sltu         t0, a4, t2
                  ori          s3, s3, 1495
                  nop
                  ori          s3, s3, 1495
                  mul          s5, zero, t4
                  xor          s6, gp, s0
                  c.add        s9, s7
                  c.addi16sp   sp, 224
                  sll          gp, s10, s11
                  c.srai       a1, 18
                  c.sub        a5, a3
                  sll          gp, s10, s11
                  remu         gp, a4, s3
                  rem          a3, s1, t6
                  c.nop
                  sub          a2, a0, a7
                  add          a2, t3, t2
                  sll          gp, s10, s11
                  c.li         t2, 14
                  c.slli       t1, 10
                  sll          gp, s10, s11
                  c.xor        a2, s1
                  srli         s8, t3, 9
                  lui          a2, 460343
                  c.addi       s5, -1
                  c.xor        a2, s1
                  sub          a2, a0, a7
                  c.lui        gp, 4
                  c.addi4spn   s1, sp, 192
                  c.nop
                  c.addi       s5, -1
                  c.slli       t1, 10
                  mulh         s1, a7, a6
                  add          a2, t3, t2
                  add          a2, t3, t2
                  c.addi       s5, -1
                  sltiu        s6, zero, -1665
                  c.sub        a5, a3
                  sltu         t0, a4, t2
                  sll          gp, s10, s11
                  srl          s3, a1, s4
                  sll          gp, s10, s11
                  c.mv         t0, t6
                  and          sp, a0, gp
                  c.addi       s5, -1
                  mulhsu       sp, s0, t5
                  c.or         a5, a0
                  c.xor        a2, s1
                  rem          a3, s1, t6
                  slt          ra, a3, a1
                  add          a2, t3, t2
                  srai         a3, t6, 11
                  srli         s8, t3, 9
                  c.li         t2, 14
                  rem          a3, s1, t6
                  mulhu        t4, a3, s6
                  c.mv         t0, t6
                  and          sp, a0, gp
                  slt          ra, a3, a1
                  sll          gp, s10, s11
                  div          s8, a5, a2
                  slt          ra, a3, a1
                  mulhu        t4, a3, s6
                  c.sub        a5, a3
                  add          a2, t3, t2
                  srl          s3, a1, s4
                  c.sub        a5, a3
                  c.add        s9, s7
                  and          sp, a0, gp
                  c.addi4spn   s1, sp, 192
                  c.lui        gp, 4
                  c.or         a5, a0
                  add          a2, t3, t2
                  lui          a2, 460343
                  c.andi       a3, 13
                  ori          s3, s3, 1495
                  c.andi       a3, 13
                  lui          a2, 460343
                  c.slli       t1, 10
                  srli         s8, t3, 9
                  sltiu        s6, zero, -1665
                  c.addi4spn   s1, sp, 192
                  remu         gp, a4, s3
                  c.srai       a1, 18
                  nop
                  slli         sp, a1, 17
                  andi         gp, a0, 1810
                  or           t4, a6, ra
                  c.mv         t0, t6
                  mul          s5, zero, t4
                  mul          s5, zero, t4
                  mulhsu       sp, s0, t5
                  c.andi       a3, 13
                  mul          s5, zero, t4
                  sltu         t0, a4, t2
                  addi         s7, t2, -1579
                  c.mv         t0, t6
                  slt          ra, a3, a1
                  divu         s2, a4, s3
                  addi         s7, t2, -1579
                  andi         gp, a0, 1810
                  nop
                  c.and        a5, a1
                  slli         sp, a1, 17
                  c.addi16sp   sp, 224
                  c.andi       a3, 13
                  c.slli       t1, 10
                  c.nop
                  c.xor        a2, s1
                  c.or         a5, a0
                  andi         gp, a0, 1810
                  c.sub        a5, a3
                  xori         a1, s1, 959
                  mul          s5, zero, t4
                  remu         gp, a4, s3
                  c.addi16sp   sp, 224
                  addi         s7, t2, -1579
                  addi         s7, t2, -1579
                  auipc        ra, 350999
                  mul          s5, zero, t4
                  srl          s3, a1, s4
                  c.addi4spn   s1, sp, 192
                  c.nop
                  auipc        ra, 350999
                  mulhu        t4, a3, s6
                  nop
                  or           t4, a6, ra
                  sltiu        s6, zero, -1665
                  c.xor        a2, s1
                  c.xor        a2, s1
                  div          s8, a5, a2
                  c.slli       t1, 10
                  c.slli       t1, 10
                  slli         sp, a1, 17
                  rem          a3, s1, t6
                  srl          s3, a1, s4
                  c.addi16sp   sp, 224
                  c.addi4spn   s1, sp, 192
                  addi         s7, t2, -1579
                  c.addi       s5, -1
                  c.or         a5, a0
                  mulhu        t4, a3, s6
                  andi         gp, a0, 1810
                  sltiu        s6, zero, -1665
                  slli         sp, a1, 17
                  c.andi       a3, 13
                  sltiu        s6, zero, -1665
                  c.lui        gp, 4
                  c.or         a5, a0
                  c.and        a5, a1
                  mulhu        t4, a3, s6
                  nop
                  lui          a2, 460343
                  xor          s6, gp, s0
                  andi         gp, a0, 1810
                  c.addi4spn   s1, sp, 192
                  c.srai       a1, 18
                  lui          a2, 460343
                  mul          s5, zero, t4
                  xor          s6, gp, s0
                  slti         t3, t5, -1062
                  c.addi16sp   sp, 224
                  c.srai       a1, 18
                  c.andi       a3, 13
                  c.addi       s5, -1
                  or           t4, a6, ra
                  c.li         t2, 14
                  c.srli       a5, 22
                  c.srai       a1, 18
                  c.nop
                  slt          ra, a3, a1
                  sub          a2, a0, a7
                  lui          a2, 460343
                  c.slli       t1, 10
                  sltiu        s6, zero, -1665
                  auipc        ra, 350999
                  sltiu        s6, zero, -1665
                  div          s8, a5, a2
                  sltu         t0, a4, t2
                  divu         s2, a4, s3
                  remu         gp, a4, s3
                  mulh         s1, a7, a6
                  and          sp, a0, gp
                  lui          a2, 460343
                  xori         a1, s1, 959
                  c.andi       a3, 13
                  remu         gp, a4, s3
                  mulh         s1, a7, a6
                  lui          a2, 460343
                  slti         t3, t5, -1062
                  divu         s2, a4, s3
                  c.and        a5, a1
                  xor          s6, gp, s0
                  addi         s7, t2, -1579
                  c.or         a5, a0
                  sub          a2, a0, a7
                  add          a2, t3, t2
                  srl          s3, a1, s4
                  nop
                  mulhsu       sp, s0, t5
                  c.addi16sp   sp, 224
                  xor          s6, gp, s0
                  mul          s5, zero, t4
                  remu         gp, a4, s3
                  nop
                  slli         sp, a1, 17
                  add          a2, t3, t2
                  c.li         t2, 14
                  mul          s5, zero, t4
                  c.lui        gp, 4
                  srl          s3, a1, s4
                  divu         s2, a4, s3
                  mul          s5, zero, t4
                  add          a2, t3, t2
                  or           t4, a6, ra
                  mul          s5, zero, t4
                  slt          ra, a3, a1
                  sub          a2, a0, a7
                  c.xor        a2, s1
                  slli         sp, a1, 17
                  mulhsu       sp, s0, t5
                  ori          s3, s3, 1495
                  c.mv         t0, t6
                  srai         a3, t6, 11
                  xori         a1, s1, 959
                  c.slli       t1, 10
                  srai         a3, t6, 11
                  c.xor        a2, s1
                  mulhu        t4, a3, s6
                  srai         a3, t6, 11
                  slt          ra, a3, a1
                  sltiu        s6, zero, -1665
                  addi         s7, t2, -1579
                  c.xor        a2, s1
                  auipc        ra, 350999
                  c.srli       a5, 22
                  sll          gp, s10, s11
                  c.nop
                  auipc        ra, 350999
                  divu         s2, a4, s3
                  c.addi       s5, -1
                  c.addi       s5, -1
                  div          s8, a5, a2
                  c.sub        a5, a3
                  c.srai       a1, 18
                  mulhsu       sp, s0, t5
                  c.mv         t0, t6
                  c.addi4spn   s1, sp, 192
                  mulhu        t4, a3, s6
                  c.srli       a5, 22
                  sub          a2, a0, a7
                  xor          s6, gp, s0
                  srl          s3, a1, s4
                  ori          s3, s3, 1495
                  rem          a3, s1, t6
                  c.mv         t0, t6
                  c.xor        a2, s1
                  srai         a3, t6, 11
                  or           t4, a6, ra
                  c.add        s9, s7
                  remu         gp, a4, s3
                  xor          s6, gp, s0
                  sltiu        s6, zero, -1665
                  slt          ra, a3, a1
                  lui          a2, 460343
                  xor          s6, gp, s0
                  andi         gp, a0, 1810
                  slt          ra, a3, a1
                  c.andi       a3, 13
                  xori         a1, s1, 959
                  rem          a3, s1, t6
                  c.lui        gp, 4
                  andi         gp, a0, 1810
                  srai         a3, t6, 11
                  c.slli       t1, 10
                  srai         a3, t6, 11
                  slt          ra, a3, a1
                  slli         sp, a1, 17
                  mulhsu       sp, s0, t5
                  c.addi16sp   sp, 224
                  divu         s2, a4, s3
                  auipc        ra, 350999
                  add          a2, t3, t2
                  divu         s2, a4, s3
                  c.addi4spn   s1, sp, 192
                  rem          a3, s1, t6
                  c.andi       a3, 13
                  remu         gp, a4, s3
                  c.addi       s5, -1
                  c.addi16sp   sp, 224
                  lui          a2, 460343
                  srl          s3, a1, s4
                  xori         a1, s1, 959
                  mulh         s1, a7, a6
                  srai         a3, t6, 11
                  c.addi16sp   sp, 224
                  remu         gp, a4, s3
                  ori          s3, s3, 1495
                  addi         s7, t2, -1579
                  c.lui        gp, 4
                  sra          s3, t0, s9
                  c.xor        a2, s1
                  slti         t3, t5, -1062
                  c.slli       t1, 10
                  c.srli       a5, 22
                  mulhu        t4, a3, s6
                  mulhu        t4, a3, s6
                  auipc        ra, 350999
                  mulhsu       sp, s0, t5
                  c.nop
                  sll          gp, s10, s11
                  c.andi       a3, 13
                  andi         gp, a0, 1810
                  or           t4, a6, ra
                  rem          a3, s1, t6
                  c.addi       s5, -1
                  or           t4, a6, ra
                  c.addi4spn   s1, sp, 192
                  slli         sp, a1, 17
                  lui          a2, 460343
                  c.lui        gp, 4
                  c.nop
                  c.nop
                  slli         sp, a1, 17
                  and          sp, a0, gp
                  xor          s6, gp, s0
                  nop
                  div          s8, a5, a2
                  mulh         s1, a7, a6
                  srli         s8, t3, 9
                  c.srli       a5, 22
                  srli         s8, t3, 9
                  c.addi16sp   sp, 224
                  srli         s8, t3, 9
                  lui          a2, 460343
                  slti         t3, t5, -1062
                  mulhu        t4, a3, s6
                  nop
                  or           t4, a6, ra
                  c.srli       a5, 22
                  sll          gp, s10, s11
                  c.srli       a5, 22
                  srli         s8, t3, 9
                  ori          s3, s3, 1495
                  ori          s3, s3, 1495
                  slti         t3, t5, -1062
                  ori          s3, s3, 1495
                  c.mv         t0, t6
                  divu         s2, a4, s3
                  nop
                  sub          a2, a0, a7
                  slti         t3, t5, -1062
                  srai         a3, t6, 11
                  mulhu        t4, a3, s6
                  nop
                  c.nop
                  c.sub        a5, a3
                  andi         gp, a0, 1810
                  c.andi       a3, 13
                  c.srli       a5, 22
                  sll          gp, s10, s11
                  or           t4, a6, ra
                  divu         s2, a4, s3
                  auipc        ra, 350999
                  c.srli       a5, 22
                  xor          s6, gp, s0
                  andi         gp, a0, 1810
                  mul          s5, zero, t4
                  sll          gp, s10, s11
                  auipc        ra, 350999
                  c.addi16sp   sp, 224
                  or           t4, a6, ra
                  sra          s3, t0, s9
                  or           t4, a6, ra
                  xor          s6, gp, s0
                  slti         t3, t5, -1062
                  add          a2, t3, t2
                  sltiu        s6, zero, -1665
                  c.mv         t0, t6
                  div          s8, a5, a2
                  sll          gp, s10, s11
                  nop
                  c.and        a5, a1
                  mulhsu       sp, s0, t5
                  or           t4, a6, ra
                  xor          s6, gp, s0
                  c.mv         t0, t6
                  nop
                  sltiu        s6, zero, -1665
                  addi         s7, t2, -1579
                  c.lui        gp, 4
                  div          s8, a5, a2
                  addi         s7, t2, -1579
                  c.and        a5, a1
                  mulh         s1, a7, a6
                  ori          s3, s3, 1495
                  srli         s8, t3, 9
                  rem          a3, s1, t6
                  slli         sp, a1, 17
                  c.slli       t1, 10
                  c.addi16sp   sp, 224
                  sltiu        s6, zero, -1665
                  sll          gp, s10, s11
                  c.addi16sp   sp, 224
                  andi         gp, a0, 1810
                  c.andi       a3, 13
                  c.or         a5, a0
                  mulh         s1, a7, a6
                  slti         t3, t5, -1062
                  mul          s5, zero, t4
                  srl          s3, a1, s4
                  sltiu        s6, zero, -1665
                  mulhsu       sp, s0, t5
                  sra          s3, t0, s9
                  add          a2, t3, t2
                  c.nop
                  srli         s8, t3, 9
                  nop
                  andi         gp, a0, 1810
                  rem          a3, s1, t6
                  xor          s6, gp, s0
                  srai         a3, t6, 11
                  c.addi       s5, -1
                  mulhsu       sp, s0, t5
                  c.nop
                  andi         gp, a0, 1810
                  c.add        s9, s7
                  c.srli       a5, 22
                  xor          s6, gp, s0
                  mulhsu       sp, s0, t5
                  sltu         t0, a4, t2
                  rem          a3, s1, t6
                  div          s8, a5, a2
                  xori         a1, s1, 959
                  srl          s3, a1, s4
                  mulh         s1, a7, a6
                  c.slli       t1, 10
                  xor          s6, gp, s0
                  divu         s2, a4, s3
                  div          s8, a5, a2
                  c.nop
                  and          sp, a0, gp
                  andi         gp, a0, 1810
                  srai         a3, t6, 11
                  sra          s3, t0, s9
                  sra          s3, t0, s9
                  c.slli       t1, 10
                  c.add        s9, s7
                  mulhu        t4, a3, s6
                  mul          s5, zero, t4
                  c.srai       a1, 18
                  mulhsu       sp, s0, t5
                  c.add        s9, s7
                  c.slli       t1, 10
                  c.srai       a1, 18
                  xori         a1, s1, 959
                  mulhsu       sp, s0, t5
                  mulhsu       sp, s0, t5
                  c.mv         t0, t6
                  ori          s3, s3, 1495
                  mulh         s1, a7, a6
                  c.li         t2, 14
                  c.andi       a3, 13
                  c.or         a5, a0
                  lui          a2, 460343
                  mulh         s1, a7, a6
                  c.and        a5, a1
                  c.mv         t0, t6
                  c.and        a5, a1
                  mulh         s1, a7, a6
                  c.and        a5, a1
                  addi         s7, t2, -1579
                  srli         s8, t3, 9
                  remu         gp, a4, s3
                  and          sp, a0, gp
                  xor          s6, gp, s0
                  mulhsu       sp, s0, t5
                  slti         t3, t5, -1062
                  lui          a2, 460343
                  sltu         t0, a4, t2
                  c.or         a5, a0
                  c.srli       a5, 22
                  auipc        ra, 350999
                  srai         a3, t6, 11
                  c.or         a5, a0
                  c.xor        a2, s1
                  add          a2, t3, t2
                  c.nop
                  slt          ra, a3, a1
                  c.addi4spn   s1, sp, 192
                  c.srli       a5, 22
                  xor          s6, gp, s0
                  c.addi4spn   s1, sp, 192
                  c.addi4spn   s1, sp, 192
                  mul          s5, zero, t4
                  c.srli       a5, 22
                  xor          s6, gp, s0
                  mulhu        t4, a3, s6
                  mulh         s1, a7, a6
                  rem          a3, s1, t6
                  c.nop
                  xori         a1, s1, 959
                  and          sp, a0, gp
                  slli         sp, a1, 17
                  rem          a3, s1, t6
                  slti         t3, t5, -1062
                  lui          a2, 460343
                  sub          a2, a0, a7
                  c.addi16sp   sp, 224
                  mulhu        t4, a3, s6
                  c.nop
                  and          sp, a0, gp
                  mulh         s1, a7, a6
                  xori         a1, s1, 959
                  div          s8, a5, a2
                  ori          s3, s3, 1495
                  mul          s5, zero, t4
                  andi         gp, a0, 1810
                  add          a2, t3, t2
                  sltu         t0, a4, t2
                  slti         t3, t5, -1062
                  c.nop
                  remu         gp, a4, s3
                  c.slli       t1, 10
                  srli         s8, t3, 9
                  srl          s3, a1, s4
                  slli         sp, a1, 17
                  xor          s6, gp, s0
                  c.sub        a5, a3
                  nop
                  c.nop
                  or           t4, a6, ra
                  slt          ra, a3, a1
                  c.andi       a3, 13
                  mul          s5, zero, t4
                  auipc        ra, 350999
                  remu         gp, a4, s3
                  c.xor        a2, s1
                  c.or         a5, a0
                  nop
                  add          a2, t3, t2
                  rem          a3, s1, t6
                  andi         gp, a0, 1810
                  c.li         t2, 14
                  c.srai       a1, 18
                  c.mv         t0, t6
                  c.or         a5, a0
                  addi         s7, t2, -1579
                  c.nop
                  rem          a3, s1, t6
                  ori          s3, s3, 1495
                  sub          a2, a0, a7
                  c.and        a5, a1
                  c.addi       s5, -1
                  sub          a2, a0, a7
                  slti         t3, t5, -1062
                  sll          gp, s10, s11
                  or           t4, a6, ra
                  add          a2, t3, t2
                  srl          s3, a1, s4
                  div          s8, a5, a2
                  sra          s3, t0, s9
                  addi         s7, t2, -1579
                  mulhu        t4, a3, s6
                  c.srli       a5, 22
                  sll          gp, s10, s11
                  c.addi4spn   s1, sp, 192
                  c.add        s9, s7
                  c.sub        a5, a3
                  c.addi16sp   sp, 224
                  sra          s3, t0, s9
                  divu         s2, a4, s3
                  andi         gp, a0, 1810
                  srli         s8, t3, 9
                  sltu         t0, a4, t2
                  srl          s3, a1, s4
                  c.and        a5, a1
                  xor          s6, gp, s0
                  xor          s6, gp, s0
                  sltu         t0, a4, t2
                  srai         a3, t6, 11
                  or           t4, a6, ra
                  c.and        a5, a1
                  xor          s6, gp, s0
                  slti         t3, t5, -1062
                  div          s8, a5, a2
                  and          sp, a0, gp
                  mulhsu       sp, s0, t5
                  srl          s3, a1, s4
                  remu         gp, a4, s3
                  srli         s8, t3, 9
                  c.andi       a3, 13
                  slli         sp, a1, 17
                  auipc        ra, 350999
                  c.add        s9, s7
                  c.slli       t1, 10
                  add          a2, t3, t2
                  srli         s8, t3, 9
                  slti         t3, t5, -1062
                  c.srli       a5, 22
                  c.xor        a2, s1
                  xori         a1, s1, 959
                  c.li         t2, 14
                  slti         t3, t5, -1062
                  mul          s5, zero, t4
                  div          s8, a5, a2
                  c.and        a5, a1
                  slli         sp, a1, 17
                  andi         gp, a0, 1810
                  c.and        a5, a1
                  srai         a3, t6, 11
                  c.addi16sp   sp, 224
                  remu         gp, a4, s3
                  rem          a3, s1, t6
                  c.li         t2, 14
                  and          sp, a0, gp
                  c.mv         t0, t6
                  c.and        a5, a1
                  auipc        ra, 350999
                  divu         s2, a4, s3
                  srli         s8, t3, 9
                  and          sp, a0, gp
                  c.lui        gp, 4
                  addi         s7, t2, -1579
                  xor          s6, gp, s0
                  c.addi4spn   s1, sp, 192
                  c.sub        a5, a3
                  mulhu        t4, a3, s6
                  sub          a2, a0, a7
                  slti         t3, t5, -1062
                  c.xor        a2, s1
                  c.addi       s5, -1
                  auipc        ra, 350999
                  div          s8, a5, a2
                  c.nop
                  srai         a3, t6, 11
                  xor          s6, gp, s0
                  ori          s3, s3, 1495
                  c.xor        a2, s1
                  andi         gp, a0, 1810
                  sra          s3, t0, s9
                  sltiu        s6, zero, -1665
                  divu         s2, a4, s3
                  auipc        ra, 350999
                  slli         sp, a1, 17
                  andi         gp, a0, 1810
                  c.li         t2, 14
                  andi         gp, a0, 1810
                  addi         s7, t2, -1579
                  c.srli       a5, 22
                  slt          ra, a3, a1
                  c.add        s9, s7
                  c.srli       a5, 22
                  c.srai       a1, 18
                  slti         t3, t5, -1062
                  sra          s3, t0, s9
                  c.andi       a3, 13
                  c.and        a5, a1
                  c.lui        gp, 4
                  slli         sp, a1, 17
                  ori          s3, s3, 1495
                  c.li         t2, 14
                  c.sub        a5, a3
                  xor          s6, gp, s0
                  add          a2, t3, t2
                  c.lui        gp, 4
                  mul          s5, zero, t4
                  div          s8, a5, a2
                  c.nop
                  lui          a2, 460343
                  sltiu        s6, zero, -1665
                  ori          s3, s3, 1495
                  slti         t3, t5, -1062
                  slli         sp, a1, 17
                  c.andi       a3, 13
                  srl          s3, a1, s4
                  c.add        s9, s7
                  srai         a3, t6, 11
                  c.slli       t1, 10
                  auipc        ra, 350999
                  add          a2, t3, t2
                  srli         s8, t3, 9
                  srai         a3, t6, 11
                  c.add        s9, s7
                  c.lui        gp, 4
                  mulh         s1, a7, a6
                  sra          s3, t0, s9
                  divu         s2, a4, s3
                  c.and        a5, a1
                  mul          s5, zero, t4
                  slli         sp, a1, 17
                  c.srai       a1, 18
                  slli         sp, a1, 17
                  slt          ra, a3, a1
                  srai         a3, t6, 11
                  sll          gp, s10, s11
                  c.srai       a1, 18
                  c.or         a5, a0
                  c.and        a5, a1
                  mulhu        t4, a3, s6
                  mul          s5, zero, t4
                  ori          s3, s3, 1495
                  ori          s3, s3, 1495
                  sub          a2, a0, a7
                  nop
                  srai         a3, t6, 11
                  and          sp, a0, gp
                  xor          s6, gp, s0
                  add          a2, t3, t2
                  andi         gp, a0, 1810
                  addi         s7, t2, -1579
                  remu         gp, a4, s3
                  sra          s3, t0, s9
                  c.li         t2, 14
                  lui          a2, 460343
                  div          s8, a5, a2
                  sltiu        s6, zero, -1665
                  remu         gp, a4, s3
                  c.slli       t1, 10
                  and          sp, a0, gp
                  sub          a2, a0, a7
                  and          sp, a0, gp
                  sra          s3, t0, s9
                  andi         gp, a0, 1810
                  rem          a3, s1, t6
                  c.slli       t1, 10
                  mul          s5, zero, t4
                  add          a2, t3, t2
                  c.andi       a3, 13
                  c.addi4spn   s1, sp, 192
                  addi         s7, t2, -1579
                  srl          s3, a1, s4
                  xori         a1, s1, 959
                  slti         t3, t5, -1062
                  mul          s5, zero, t4
                  divu         s2, a4, s3
                  xor          s6, gp, s0
                  slti         t3, t5, -1062
                  slti         t3, t5, -1062
                  andi         gp, a0, 1810
                  c.xor        a2, s1
                  c.xor        a2, s1
                  mulhu        t4, a3, s6
                  srl          s3, a1, s4
                  sltu         t0, a4, t2
                  c.addi       s5, -1
                  slti         t3, t5, -1062
                  sltu         t0, a4, t2
                  sll          gp, s10, s11
                  and          sp, a0, gp
                  sltiu        s6, zero, -1665
                  nop
                  rem          a3, s1, t6
                  sltu         t0, a4, t2
                  sltiu        s6, zero, -1665
                  sra          s3, t0, s9
                  slli         sp, a1, 17
                  srai         a3, t6, 11
                  c.addi16sp   sp, 224
                  c.slli       t1, 10
                  sll          gp, s10, s11
                  andi         gp, a0, 1810
                  c.mv         t0, t6
                  c.li         t2, 14
                  c.srli       a5, 22
                  slli         sp, a1, 17
                  ori          s3, s3, 1495
                  c.srli       a5, 22
                  lui          a2, 460343
                  sra          s3, t0, s9
                  addi         s7, t2, -1579
                  c.andi       a3, 13
                  srai         a3, t6, 11
                  rem          a3, s1, t6
                  srl          s3, a1, s4
                  c.andi       a3, 13
                  auipc        ra, 350999
                  remu         gp, a4, s3
                  nop
                  sra          s3, t0, s9
                  c.srli       a5, 22
                  mulh         s1, a7, a6
                  c.add        s9, s7
                  auipc        ra, 350999
                  slli         sp, a1, 17
                  c.andi       a3, 13
                  div          s8, a5, a2
                  mul          s5, zero, t4
                  c.srli       a5, 22
                  slt          ra, a3, a1
                  or           t4, a6, ra
                  rem          a3, s1, t6
                  c.sub        a5, a3
                  div          s8, a5, a2
                  divu         s2, a4, s3
                  slt          ra, a3, a1
                  xori         a1, s1, 959
                  sll          gp, s10, s11
                  c.mv         t0, t6
                  slli         sp, a1, 17
                  auipc        ra, 350999
                  xori         a1, s1, 959
                  mul          s5, zero, t4
                  divu         s2, a4, s3
                  c.sub        a5, a3
                  c.mv         t0, t6
                  srai         a3, t6, 11
                  c.add        s9, s7
                  c.or         a5, a0
                  c.addi       s5, -1
                  srai         a3, t6, 11
                  c.mv         t0, t6
                  c.li         t2, 14
                  ori          s3, s3, 1495
                  mulh         s1, a7, a6
                  c.sub        a5, a3
                  c.srli       a5, 22
                  slt          ra, a3, a1
                  xor          s6, gp, s0
                  srl          s3, a1, s4
                  c.li         t2, 14
                  c.and        a5, a1
                  slli         sp, a1, 17
                  c.lui        gp, 4
                  c.add        s9, s7
                  add          a2, t3, t2
                  sltu         t0, a4, t2
                  rem          a3, s1, t6
                  c.addi4spn   s1, sp, 192
                  c.addi4spn   s1, sp, 192
                  mulhu        t4, a3, s6
                  mulh         s1, a7, a6
                  c.addi4spn   s1, sp, 192
                  c.mv         t0, t6
                  srai         a3, t6, 11
                  nop
                  slti         t3, t5, -1062
                  sra          s3, t0, s9
                  add          a2, t3, t2
                  sra          s3, t0, s9
                  slt          ra, a3, a1
                  srl          s3, a1, s4
                  c.srli       a5, 22
                  slti         t3, t5, -1062
                  sltiu        s6, zero, -1665
                  sltiu        s6, zero, -1665
                  c.add        s9, s7
                  andi         gp, a0, 1810
                  ori          s3, s3, 1495
                  c.nop
                  xor          s6, gp, s0
                  sra          s3, t0, s9
                  slt          ra, a3, a1
                  or           t4, a6, ra
                  divu         s2, a4, s3
                  c.sub        a5, a3
                  c.addi       s5, -1
                  c.nop
                  or           t4, a6, ra
                  c.slli       t1, 10
                  mul          s5, zero, t4
                  c.srli       a5, 22
                  c.addi16sp   sp, 224
                  sltu         t0, a4, t2
                  c.and        a5, a1
                  slt          ra, a3, a1
                  xori         a1, s1, 959
                  mul          s5, zero, t4
                  srl          s3, a1, s4
                  xor          s6, gp, s0
                  c.addi       s5, -1
                  c.srli       a5, 22
                  addi         s7, t2, -1579
                  rem          a3, s1, t6
                  srl          s3, a1, s4
                  c.andi       a3, 13
                  auipc        ra, 350999
                  c.srai       a1, 18
                  sra          s3, t0, s9
                  c.addi       s5, -1
                  remu         gp, a4, s3
                  div          s8, a5, a2
                  c.srli       a5, 22
                  slt          ra, a3, a1
                  addi         s7, t2, -1579
                  auipc        ra, 350999
                  c.mv         t0, t6
                  slli         sp, a1, 17
                  divu         s2, a4, s3
                  mulhu        t4, a3, s6
                  slt          ra, a3, a1
                  mul          s5, zero, t4
                  ori          s3, s3, 1495
                  c.addi4spn   s1, sp, 192
                  xori         a1, s1, 959
                  c.xor        a2, s1
                  c.nop
                  sltu         t0, a4, t2
                  add          a2, t3, t2
                  ori          s3, s3, 1495
                  c.addi       s5, -1
                  mulh         s1, a7, a6
                  srl          s3, a1, s4
                  mulhu        t4, a3, s6
                  andi         gp, a0, 1810
                  c.sub        a5, a3
                  c.slli       t1, 10
                  sub          a2, a0, a7
                  srli         s8, t3, 9
                  c.addi4spn   s1, sp, 192
                  c.sub        a5, a3
                  auipc        ra, 350999
                  slt          ra, a3, a1
                  c.or         a5, a0
                  sra          s3, t0, s9
                  auipc        ra, 350999
                  and          sp, a0, gp
                  c.mv         t0, t6
                  mulhsu       sp, s0, t5
                  add          a2, t3, t2
                  c.addi4spn   s1, sp, 192
                  c.addi       s5, -1
                  c.sub        a5, a3
                  add          a2, t3, t2
                  div          s8, a5, a2
                  sra          s3, t0, s9
                  ori          s3, s3, 1495
                  mulh         s1, a7, a6
                  c.sub        a5, a3
                  c.lui        gp, 4
                  c.mv         t0, t6
                  div          s8, a5, a2
                  srl          s3, a1, s4
                  sub          a2, a0, a7
                  c.addi16sp   sp, 224
                  c.li         t2, 14
                  c.addi       s5, -1
                  add          a2, t3, t2
                  andi         gp, a0, 1810
                  c.xor        a2, s1
                  c.mv         t0, t6
                  srai         a3, t6, 11
                  auipc        ra, 350999
                  c.and        a5, a1
                  sltu         t0, a4, t2
                  srl          s3, a1, s4
                  c.mv         t0, t6
                  c.add        s9, s7
                  c.addi16sp   sp, 224
                  or           t4, a6, ra
                  mul          s5, zero, t4
                  sltu         t0, a4, t2
                  c.srai       a1, 18
                  c.slli       t1, 10
                  sra          s3, t0, s9
                  div          s8, a5, a2
                  xori         a1, s1, 959
                  c.srli       a5, 22
                  mulhu        t4, a3, s6
                  div          s8, a5, a2
                  andi         gp, a0, 1810
                  c.srli       a5, 22
                  mulhu        t4, a3, s6
                  sll          gp, s10, s11
                  xor          s6, gp, s0
                  c.add        s9, s7
                  c.andi       a3, 13
                  sll          gp, s10, s11
                  c.or         a5, a0
                  ori          s3, s3, 1495
                  add          a2, t3, t2
                  c.and        a5, a1
                  auipc        ra, 350999
                  andi         gp, a0, 1810
                  c.srai       a1, 18
                  c.xor        a2, s1
                  c.add        s9, s7
                  srai         a3, t6, 11
                  slt          ra, a3, a1
                  slt          ra, a3, a1
                  c.srai       a1, 18
                  c.nop
                  c.andi       a3, 13
                  mul          s5, zero, t4
                  mul          s5, zero, t4
                  div          s8, a5, a2
                  mulhu        t4, a3, s6
                  srai         a3, t6, 11
                  srli         s8, t3, 9
                  sltiu        s6, zero, -1665
                  c.lui        gp, 4
                  xor          s6, gp, s0
                  add          a2, t3, t2
                  nop
                  addi         s7, t2, -1579
                  c.nop
                  c.add        s9, s7
                  xor          s6, gp, s0
                  addi         s7, t2, -1579
                  slli         sp, a1, 17
                  addi         s7, t2, -1579
                  addi         s7, t2, -1579
                  c.addi4spn   s1, sp, 192
                  c.addi16sp   sp, 224
                  addi         s7, t2, -1579
                  slli         sp, a1, 17
                  mulhsu       sp, s0, t5
                  mulh         s1, a7, a6
                  srai         a3, t6, 11
                  divu         s2, a4, s3
                  mul          s5, zero, t4
                  sll          gp, s10, s11
                  slli         sp, a1, 17
                  divu         s2, a4, s3
                  mulh         s1, a7, a6
                  auipc        ra, 350999
                  xor          s6, gp, s0
                  c.srli       a5, 22
                  c.srai       a1, 18
                  c.lui        gp, 4
                  mulhu        t4, a3, s6
                  slti         t3, t5, -1062
                  c.add        s9, s7
                  mulhsu       sp, s0, t5
                  mulhsu       sp, s0, t5
                  sltiu        s6, zero, -1665
                  c.srai       a1, 18
                  c.nop
                  or           t4, a6, ra
                  mulhsu       sp, s0, t5
                  slti         t3, t5, -1062
                  c.mv         t0, t6
                  c.xor        a2, s1
                  sra          s3, t0, s9
                  c.addi4spn   s1, sp, 192
                  sltiu        s6, zero, -1665
                  sltu         t0, a4, t2
                  c.sub        a5, a3
                  ori          s3, s3, 1495
                  mulhu        t4, a3, s6
                  c.srai       a1, 18
                  c.or         a5, a0
                  c.mv         t0, t6
                  c.and        a5, a1
                  slli         sp, a1, 17
                  srai         a3, t6, 11
                  ori          s3, s3, 1495
                  and          sp, a0, gp
                  mulh         s1, a7, a6
                  remu         gp, a4, s3
                  slti         t3, t5, -1062
                  sra          s3, t0, s9
                  and          sp, a0, gp
                  c.li         t2, 14
                  c.add        s9, s7
                  add          a2, t3, t2
                  c.srli       a5, 22
                  slt          ra, a3, a1
                  c.nop
                  rem          a3, s1, t6
                  xor          s6, gp, s0
                  mul          s5, zero, t4
                  srai         a3, t6, 11
                  sra          s3, t0, s9
                  lui          a2, 460343
                  c.srai       a1, 18
                  c.lui        gp, 4
                  c.xor        a2, s1
                  slt          ra, a3, a1
                  c.addi4spn   s1, sp, 192
                  c.srai       a1, 18
                  sra          s3, t0, s9
                  c.addi       s5, -1
                  add          a2, t3, t2
                  ori          s3, s3, 1495
                  add          a2, t3, t2
                  srli         s8, t3, 9
                  slti         t3, t5, -1062
                  c.mv         t0, t6
                  or           t4, a6, ra
                  nop
                  c.srli       a5, 22
                  c.nop
                  mulhsu       sp, s0, t5
                  xori         a1, s1, 959
                  mulhu        t4, a3, s6
                  c.li         t2, 14
                  add          a2, t3, t2
                  and          sp, a0, gp
                  slt          ra, a3, a1
                  srai         a3, t6, 11
                  c.or         a5, a0
                  c.add        s9, s7
                  nop
                  c.and        a5, a1
                  auipc        ra, 350999
                  auipc        ra, 350999
                  rem          a3, s1, t6
                  auipc        ra, 350999
                  c.slli       t1, 10
                  sll          gp, s10, s11
                  c.srai       a1, 18
                  ori          s3, s3, 1495
                  srai         a3, t6, 11
                  c.lui        gp, 4
                  c.andi       a3, 13
                  c.lui        gp, 4
                  nop
                  sltu         t0, a4, t2
                  c.addi       s5, -1
                  andi         gp, a0, 1810
                  remu         gp, a4, s3
                  mulhsu       sp, s0, t5
                  c.add        s9, s7
                  c.xor        a2, s1
                  ori          s3, s3, 1495
                  c.addi       s5, -1
                  c.addi       s5, -1
                  or           t4, a6, ra
                  c.slli       t1, 10
                  c.or         a5, a0
                  remu         gp, a4, s3
                  c.and        a5, a1
                  c.addi4spn   s1, sp, 192
                  c.srai       a1, 18
                  slti         t3, t5, -1062
                  c.mv         t0, t6
                  c.lui        gp, 4
                  c.andi       a3, 13
                  sub          a2, a0, a7
                  xor          s6, gp, s0
                  remu         gp, a4, s3
                  lui          a2, 460343
                  mulh         s1, a7, a6
                  c.addi16sp   sp, 224
                  sra          s3, t0, s9
                  c.addi16sp   sp, 224
                  c.nop
                  c.add        s9, s7
                  remu         gp, a4, s3
                  mulh         s1, a7, a6
                  sra          s3, t0, s9
                  auipc        ra, 350999
                  xor          s6, gp, s0
                  sub          a2, a0, a7
                  c.lui        gp, 4
                  c.nop
                  c.addi4spn   s1, sp, 192
                  c.lui        gp, 4
                  andi         gp, a0, 1810
                  div          s8, a5, a2
                  sra          s3, t0, s9
                  remu         gp, a4, s3
                  c.slli       t1, 10
                  xori         a1, s1, 959
                  rem          a3, s1, t6
                  srli         s8, t3, 9
                  addi         s7, t2, -1579
                  auipc        ra, 350999
                  div          s8, a5, a2
                  c.slli       t1, 10
                  c.and        a5, a1
                  lui          a2, 460343
                  c.nop
                  mulhu        t4, a3, s6
                  c.srli       a5, 22
                  sub          a2, a0, a7
                  c.mv         t0, t6
                  addi         s7, t2, -1579
                  div          s8, a5, a2
                  c.addi4spn   s1, sp, 192
                  c.addi       s5, -1
                  c.sub        a5, a3
                  c.nop
                  sltu         t0, a4, t2
                  srli         s8, t3, 9
                  mulh         s1, a7, a6
                  c.and        a5, a1
                  c.mv         t0, t6
                  slt          ra, a3, a1
                  addi         s7, t2, -1579
                  sltiu        s6, zero, -1665
                  c.add        s9, s7
                  c.li         t2, 14
                  c.srai       a1, 18
                  rem          a3, s1, t6
                  slt          ra, a3, a1
                  srli         s8, t3, 9
                  c.srai       a1, 18
                  sltiu        s6, zero, -1665
                  remu         gp, a4, s3
                  add          a2, t3, t2
                  c.add        s9, s7
                  c.slli       t1, 10
                  c.mv         t0, t6
                  sltu         t0, a4, t2
                  lui          a2, 460343
                  and          sp, a0, gp
                  sub          a2, a0, a7
                  slli         sp, a1, 17
                  c.xor        a2, s1
                  add          a2, t3, t2
                  andi         gp, a0, 1810
                  sltiu        s6, zero, -1665
                  auipc        ra, 350999
                  c.srai       a1, 18
                  slli         sp, a1, 17
                  srli         s8, t3, 9
                  c.mv         t0, t6
                  mulhu        t4, a3, s6
                  c.or         a5, a0
                  c.and        a5, a1
                  remu         gp, a4, s3
                  sltu         t0, a4, t2
                  sra          s3, t0, s9
                  and          sp, a0, gp
                  srai         a3, t6, 11
                  srai         a3, t6, 11
                  c.srai       a1, 18
                  div          s8, a5, a2
                  or           t4, a6, ra
                  mul          s5, zero, t4
                  c.xor        a2, s1
                  nop
                  nop
                  slli         sp, a1, 17
                  c.nop
                  sll          gp, s10, s11
                  c.sub        a5, a3
                  c.xor        a2, s1
                  sub          a2, a0, a7
                  c.sub        a5, a3
                  mulhu        t4, a3, s6
                  mul          s5, zero, t4
                  c.slli       t1, 10
                  slt          ra, a3, a1
                  rem          a3, s1, t6
                  c.srai       a1, 18
                  addi         s7, t2, -1579
                  c.addi16sp   sp, 224
                  c.mv         t0, t6
                  div          s8, a5, a2
                  c.mv         t0, t6
                  c.addi4spn   s1, sp, 192
                  c.lui        gp, 4
                  divu         s2, a4, s3
                  c.srli       a5, 22
                  c.mv         t0, t6
                  andi         gp, a0, 1810
                  nop
                  c.li         t2, 14
                  xori         a1, s1, 959
                  c.addi       s5, -1
                  sltu         t0, a4, t2
                  c.andi       a3, 13
                  addi         s7, t2, -1579
                  sub          a2, a0, a7
                  srli         s8, t3, 9
                  slt          ra, a3, a1
                  c.li         t2, 14
                  c.mv         t0, t6
                  andi         gp, a0, 1810
                  srai         a3, t6, 11
                  slti         t3, t5, -1062
                  c.nop
                  c.li         t2, 14
                  c.or         a5, a0
                  remu         gp, a4, s3
                  sltiu        s6, zero, -1665
                  and          sp, a0, gp
                  xori         a1, s1, 959
                  sltiu        s6, zero, -1665
                  mul          s5, zero, t4
                  mulhu        t4, a3, s6
                  c.mv         t0, t6
                  sll          gp, s10, s11
                  slt          ra, a3, a1
                  c.srai       a1, 18
                  c.andi       a3, 13
                  c.or         a5, a0
                  mul          s5, zero, t4
                  divu         s2, a4, s3
                  mulh         s1, a7, a6
                  xor          s6, gp, s0
                  divu         s2, a4, s3
                  srl          s3, a1, s4
                  mulh         s1, a7, a6
                  lui          a2, 460343
                  c.and        a5, a1
                  c.nop
                  auipc        ra, 350999
                  c.or         a5, a0
                  c.mv         t0, t6
                  c.and        a5, a1
                  lui          a2, 460343
                  sltiu        s6, zero, -1665
                  c.nop
                  srli         s8, t3, 9
                  remu         gp, a4, s3
                  ori          s3, s3, 1495
                  mulh         s1, a7, a6
                  slti         t3, t5, -1062
                  slti         t3, t5, -1062
                  andi         gp, a0, 1810
                  mul          s5, zero, t4
                  ori          s3, s3, 1495
                  srai         a3, t6, 11
                  rem          a3, s1, t6
                  c.addi       s5, -1
                  mulhsu       sp, s0, t5
                  c.sub        a5, a3
                  sra          s3, t0, s9
                  ori          s3, s3, 1495
                  andi         gp, a0, 1810
                  rem          a3, s1, t6
                  add          a2, t3, t2
                  mulhu        t4, a3, s6
                  c.lui        gp, 4
                  ori          s3, s3, 1495
                  mulhu        t4, a3, s6
                  sub          a2, a0, a7
                  slt          ra, a3, a1
                  c.andi       a3, 13
                  srli         s8, t3, 9
                  mulhu        t4, a3, s6
                  c.or         a5, a0
                  c.add        s9, s7
                  slti         t3, t5, -1062
                  mulhsu       sp, s0, t5
                  sub          a2, a0, a7
                  sra          s3, t0, s9
                  c.or         a5, a0
                  mulh         s1, a7, a6
                  sltiu        s6, zero, -1665
                  c.or         a5, a0
                  or           t4, a6, ra
                  c.mv         t0, t6
                  c.addi4spn   s1, sp, 192
                  c.or         a5, a0
                  xori         a1, s1, 959
                  c.srai       a1, 18
                  sll          gp, s10, s11
                  nop
                  c.andi       a3, 13
                  xor          s6, gp, s0
                  c.andi       a3, 13
                  xor          s6, gp, s0
                  xor          s6, gp, s0
                  div          s8, a5, a2
                  c.addi4spn   s1, sp, 192
                  sra          s3, t0, s9
                  nop
                  srl          s3, a1, s4
                  srl          s3, a1, s4
                  add          a2, t3, t2
                  c.and        a5, a1
                  nop
                  mulhu        t4, a3, s6
                  srl          s3, a1, s4
                  or           t4, a6, ra
                  slli         sp, a1, 17
                  div          s8, a5, a2
                  c.addi       s5, -1
                  mul          s5, zero, t4
                  mulhsu       sp, s0, t5
                  xor          s6, gp, s0
                  nop
                  c.srai       a1, 18
                  mul          s5, zero, t4
                  addi         s7, t2, -1579
                  lui          a2, 460343
                  auipc        ra, 350999
                  ori          s3, s3, 1495
                  c.or         a5, a0
                  mulh         s1, a7, a6
                  mulh         s1, a7, a6
                  add          a2, t3, t2
                  lui          a2, 460343
                  lui          a2, 460343
                  srl          s3, a1, s4
                  slli         sp, a1, 17
                  nop
                  add          a2, t3, t2
                  c.addi       s5, -1
                  sub          a2, a0, a7
                  c.xor        a2, s1
                  c.or         a5, a0
                  c.or         a5, a0
                  auipc        ra, 350999
                  slti         t3, t5, -1062
                  rem          a3, s1, t6
                  add          a2, t3, t2
                  c.mv         t0, t6
                  rem          a3, s1, t6
                  sll          gp, s10, s11
                  lui          a2, 460343
                  c.sub        a5, a3
                  c.addi       s5, -1
                  lui          a2, 460343
                  or           t4, a6, ra
                  slt          ra, a3, a1
                  mulhu        t4, a3, s6
                  remu         gp, a4, s3
                  c.nop
                  andi         gp, a0, 1810
                  c.nop
                  sra          s3, t0, s9
                  c.srai       a1, 18
                  xor          s6, gp, s0
                  sll          gp, s10, s11
                  add          a2, t3, t2
                  auipc        ra, 350999
                  andi         gp, a0, 1810
                  c.addi4spn   s1, sp, 192
                  sll          gp, s10, s11
                  srl          s3, a1, s4
                  slti         t3, t5, -1062
                  c.mv         t0, t6
                  and          sp, a0, gp
                  sub          a2, a0, a7
                  c.lui        gp, 4
                  c.addi16sp   sp, 224
                  add          a2, t3, t2
                  sll          gp, s10, s11
                  c.andi       a3, 13
                  div          s8, a5, a2
                  and          sp, a0, gp
                  or           t4, a6, ra
                  c.addi16sp   sp, 224
                  c.srli       a5, 22
                  ori          s3, s3, 1495
                  c.srai       a1, 18
                  c.addi16sp   sp, 224
                  lui          a2, 460343
                  c.addi4spn   s1, sp, 192
                  slli         sp, a1, 17
                  c.srai       a1, 18
                  c.xor        a2, s1
                  c.addi4spn   s1, sp, 192
                  and          sp, a0, gp
                  sltiu        s6, zero, -1665
                  mul          s5, zero, t4
                  mulhu        t4, a3, s6
                  remu         gp, a4, s3
                  xor          s6, gp, s0
                  c.mv         t0, t6
                  slti         t3, t5, -1062
                  remu         gp, a4, s3
                  mulhu        t4, a3, s6
                  auipc        ra, 350999
                  sra          s3, t0, s9
                  lui          a2, 460343
                  c.add        s9, s7
                  remu         gp, a4, s3
                  xor          s6, gp, s0
                  divu         s2, a4, s3
                  c.li         t2, 14
                  c.srai       a1, 18
                  c.and        a5, a1
                  xori         a1, s1, 959
                  nop
                  srai         a3, t6, 11
                  nop
                  nop
                  sltiu        s6, zero, -1665
                  divu         s2, a4, s3
                  c.nop
                  sll          gp, s10, s11
                  c.srli       a5, 22
                  c.addi4spn   s1, sp, 192
                  c.addi16sp   sp, 224
                  slti         t3, t5, -1062
                  c.addi       s5, -1
                  c.slli       t1, 10
                  remu         gp, a4, s3
                  c.addi16sp   sp, 224
                  c.li         t2, 14
                  xori         a1, s1, 959
                  slli         sp, a1, 17
                  c.sub        a5, a3
                  lui          a2, 460343
                  nop
                  c.addi4spn   s1, sp, 192
                  slt          ra, a3, a1
                  add          a2, t3, t2
                  c.and        a5, a1
                  c.sub        a5, a3
                  slt          ra, a3, a1
                  lui          a2, 460343
                  add          a2, t3, t2
                  div          s8, a5, a2
                  div          s8, a5, a2
                  mulhu        t4, a3, s6
                  xor          s6, gp, s0
                  or           t4, a6, ra
                  c.sub        a5, a3
                  mul          s5, zero, t4
                  or           t4, a6, ra
                  mulh         s1, a7, a6
                  srli         s8, t3, 9
                  sra          s3, t0, s9
                  c.srli       a5, 22
                  c.sub        a5, a3
                  xor          s6, gp, s0
                  c.addi       s5, -1
                  c.nop
                  or           t4, a6, ra
                  remu         gp, a4, s3
                  andi         gp, a0, 1810
                  sltu         t0, a4, t2
                  ori          s3, s3, 1495
                  mulhsu       sp, s0, t5
                  add          a2, t3, t2
                  auipc        ra, 350999
                  c.slli       t1, 10
                  sltiu        s6, zero, -1665
                  c.srli       a5, 22
                  slt          ra, a3, a1
                  add          a2, t3, t2
                  slti         t3, t5, -1062
                  slti         t3, t5, -1062
                  c.lui        gp, 4
                  c.lui        gp, 4
                  mulhsu       sp, s0, t5
                  sltu         t0, a4, t2
                  c.addi4spn   s1, sp, 192
                  mulhsu       sp, s0, t5
                  c.or         a5, a0
                  add          a2, t3, t2
                  slti         t3, t5, -1062
                  xori         a1, s1, 959
                  sub          a2, a0, a7
                  add          a2, t3, t2
                  remu         gp, a4, s3
                  c.lui        gp, 4
                  mulh         s1, a7, a6
                  slt          ra, a3, a1
                  mulhsu       sp, s0, t5
                  sltu         t0, a4, t2
                  slt          ra, a3, a1
                  c.nop
                  and          sp, a0, gp
                  srli         s8, t3, 9
                  sltu         t0, a4, t2
                  mul          s5, zero, t4
                  mulh         s1, a7, a6
                  c.andi       a3, 13
                  c.sub        a5, a3
                  c.lui        gp, 4
                  add          a2, t3, t2
                  c.andi       a3, 13
                  c.addi16sp   sp, 224
                  rem          a3, s1, t6
                  c.addi       s5, -1
                  ori          s3, s3, 1495
                  c.andi       a3, 13
                  and          sp, a0, gp
                  c.and        a5, a1
                  add          a2, t3, t2
                  c.addi16sp   sp, 224
                  c.addi4spn   s1, sp, 192
                  sub          a2, a0, a7
                  lui          a2, 460343
                  c.addi       s5, -1
                  addi         s7, t2, -1579
                  auipc        ra, 350999
                  c.addi4spn   s1, sp, 192
                  c.andi       a3, 13
                  c.slli       t1, 10
                  c.slli       t1, 10
                  xor          s6, gp, s0
                  srai         a3, t6, 11
                  c.lui        gp, 4
                  sll          gp, s10, s11
                  c.srli       a5, 22
                  nop
                  sra          s3, t0, s9
                  c.mv         t0, t6
                  c.srai       a1, 18
                  c.nop
                  srai         a3, t6, 11
                  add          a2, t3, t2
                  mulhsu       sp, s0, t5
                  andi         gp, a0, 1810
                  slt          ra, a3, a1
                  c.sub        a5, a3
                  add          a2, t3, t2
                  xor          s6, gp, s0
                  lui          a2, 460343
                  c.lui        gp, 4
                  lui          a2, 460343
                  sub          a2, a0, a7
                  c.xor        a2, s1
                  c.or         a5, a0
                  addi         s7, t2, -1579
                  mul          s5, zero, t4
                  nop
                  or           t4, a6, ra
                  slt          ra, a3, a1
                  mulhu        t4, a3, s6
                  srli         s8, t3, 9
                  c.mv         t0, t6
                  lui          a2, 460343
                  and          sp, a0, gp
                  c.addi16sp   sp, 224
                  remu         gp, a4, s3
                  mulhsu       sp, s0, t5
                  c.mv         t0, t6
                  c.sub        a5, a3
                  lui          a2, 460343
                  sub          a2, a0, a7
                  sltu         t0, a4, t2
                  c.lui        gp, 4
                  slt          ra, a3, a1
                  slt          ra, a3, a1
                  andi         gp, a0, 1810
                  nop
                  c.andi       a3, 13
                  rem          a3, s1, t6
                  mulhu        t4, a3, s6
                  c.xor        a2, s1
                  auipc        ra, 350999
                  c.and        a5, a1
                  slti         t3, t5, -1062
                  c.xor        a2, s1
                  and          sp, a0, gp
                  c.addi       s5, -1
                  c.add        s9, s7
                  remu         gp, a4, s3
                  mulhu        t4, a3, s6
                  c.addi       s5, -1
                  slli         sp, a1, 17
                  c.nop
                  sll          gp, s10, s11
                  c.or         a5, a0
                  rem          a3, s1, t6
                  ori          s3, s3, 1495
                  ori          s3, s3, 1495
                  c.addi       s5, -1
                  c.li         t2, 14
                  srai         a3, t6, 11
                  lui          a2, 460343
                  c.or         a5, a0
                  xori         a1, s1, 959
                  and          sp, a0, gp
                  c.add        s9, s7
                  sub          a2, a0, a7
                  sltiu        s6, zero, -1665
                  srli         s8, t3, 9
                  add          a2, t3, t2
                  ori          s3, s3, 1495
                  c.srai       a1, 18
                  sltiu        s6, zero, -1665
                  and          sp, a0, gp
                  div          s8, a5, a2
                  c.srai       a1, 18
                  srli         s8, t3, 9
                  c.xor        a2, s1
                  or           t4, a6, ra
                  srai         a3, t6, 11
                  c.li         t2, 14
                  andi         gp, a0, 1810
                  and          sp, a0, gp
                  divu         s2, a4, s3
                  mulhsu       sp, s0, t5
                  div          s8, a5, a2
                  mulhsu       sp, s0, t5
                  c.srai       a1, 18
                  c.nop
                  srli         s8, t3, 9
                  andi         gp, a0, 1810
                  c.addi       s5, -1
                  addi         s7, t2, -1579
                  sll          gp, s10, s11
                  or           t4, a6, ra
                  mul          s5, zero, t4
                  sub          a2, a0, a7
                  c.lui        gp, 4
                  srli         s8, t3, 9
                  nop
                  c.nop
                  div          s8, a5, a2
                  c.srai       a1, 18
                  xori         a1, s1, 959
                  c.addi4spn   s1, sp, 192
                  c.lui        gp, 4
                  slti         t3, t5, -1062
                  c.srli       a5, 22
                  c.addi4spn   s1, sp, 192
                  srl          s3, a1, s4
                  c.srli       a5, 22
                  or           t4, a6, ra
                  remu         gp, a4, s3
                  sltiu        s6, zero, -1665
                  ori          s3, s3, 1495
                  mul          s5, zero, t4
                  xori         a1, s1, 959
                  c.srai       a1, 18
                  c.and        a5, a1
                  ori          s3, s3, 1495
                  c.nop
                  c.addi       s5, -1
                  sub          a2, a0, a7
                  c.slli       t1, 10
                  c.sub        a5, a3
                  nop
                  ori          s3, s3, 1495
                  sll          gp, s10, s11
                  sltiu        s6, zero, -1665
                  c.srli       a5, 22
                  xori         a1, s1, 959
                  srl          s3, a1, s4
                  c.srai       a1, 18
                  andi         gp, a0, 1810
                  remu         gp, a4, s3
                  c.mv         t0, t6
                  c.addi16sp   sp, 224
                  xori         a1, s1, 959
                  lui          a2, 460343
                  c.srai       a1, 18
                  c.add        s9, s7
                  c.addi       s5, -1
                  sra          s3, t0, s9
                  and          sp, a0, gp
                  auipc        ra, 350999
                  c.mv         t0, t6
                  mulhsu       sp, s0, t5
                  mulh         s1, a7, a6
                  sra          s3, t0, s9
                  c.srai       a1, 18
                  nop
                  div          s8, a5, a2
                  c.lui        gp, 4
                  andi         gp, a0, 1810
                  slli         sp, a1, 17
                  c.or         a5, a0
                  sub          a2, a0, a7
                  mulhu        t4, a3, s6
                  addi         s7, t2, -1579
                  c.addi       s5, -1
                  nop
                  c.addi16sp   sp, 224
                  c.slli       t1, 10
                  c.srai       a1, 18
                  c.addi       s5, -1
                  addi         s7, t2, -1579
                  c.srli       a5, 22
                  divu         s2, a4, s3
                  addi         s7, t2, -1579
                  addi         s7, t2, -1579
                  mul          s5, zero, t4
                  c.addi4spn   s1, sp, 192
                  c.andi       a3, 13
                  c.nop
                  srl          s3, a1, s4
                  c.andi       a3, 13
                  and          sp, a0, gp
                  c.xor        a2, s1
                  lui          a2, 460343
                  c.srli       a5, 22
                  sll          gp, s10, s11
                  c.addi16sp   sp, 224
                  slti         t3, t5, -1062
                  remu         gp, a4, s3
                  sll          gp, s10, s11
                  c.addi4spn   s1, sp, 192
                  c.addi4spn   s1, sp, 192
                  c.mv         t0, t6
                  andi         gp, a0, 1810
                  ori          s3, s3, 1495
                  c.mv         t0, t6
                  c.addi16sp   sp, 224
                  andi         gp, a0, 1810
                  sll          gp, s10, s11
                  xor          s6, gp, s0
                  sltiu        s6, zero, -1665
                  c.srli       a5, 22
                  srli         s8, t3, 9
                  srli         s8, t3, 9
                  auipc        ra, 350999
                  c.and        a5, a1
                  c.xor        a2, s1
                  c.andi       a3, 13
                  c.addi4spn   s1, sp, 192
                  and          sp, a0, gp
                  srli         s8, t3, 9
                  rem          a3, s1, t6
                  srli         s8, t3, 9
                  addi         s7, t2, -1579
                  ori          s3, s3, 1495
                  slti         t3, t5, -1062
                  lui          a2, 460343
                  mulhsu       sp, s0, t5
                  c.addi4spn   s1, sp, 192
                  nop
                  sub          a2, a0, a7
                  c.and        a5, a1
                  c.nop
                  c.slli       t1, 10
                  sra          s3, t0, s9
                  mulhsu       sp, s0, t5
                  c.mv         t0, t6
                  xor          s6, gp, s0
                  xori         a1, s1, 959
                  c.srli       a5, 22
                  slt          ra, a3, a1
                  c.xor        a2, s1
                  xor          s6, gp, s0
                  xor          s6, gp, s0
                  c.sub        a5, a3
                  addi         s7, t2, -1579
                  sll          gp, s10, s11
                  c.mv         t0, t6
                  c.lui        gp, 4
                  div          s8, a5, a2
                  c.addi4spn   s1, sp, 192
                  or           t4, a6, ra
                  c.addi16sp   sp, 224
                  slti         t3, t5, -1062
                  c.nop
                  srai         a3, t6, 11
                  sltu         t0, a4, t2
                  c.add        s9, s7
                  and          sp, a0, gp
                  sra          s3, t0, s9
                  sub          a2, a0, a7
                  c.addi16sp   sp, 224
                  c.addi4spn   s1, sp, 192
                  sltu         t0, a4, t2
                  slti         t3, t5, -1062
                  srl          s3, a1, s4
                  sll          gp, s10, s11
                  c.sub        a5, a3
                  c.srai       a1, 18
                  c.slli       t1, 10
                  c.add        s9, s7
                  auipc        ra, 350999
                  xor          s6, gp, s0
                  srai         a3, t6, 11
                  or           t4, a6, ra
                  mul          s5, zero, t4
                  c.slli       t1, 10
                  c.srli       a5, 22
                  xori         a1, s1, 959
                  sltiu        s6, zero, -1665
                  slt          ra, a3, a1
                  divu         s2, a4, s3
                  c.and        a5, a1
                  srli         s8, t3, 9
                  ori          s3, s3, 1495
                  sltu         t0, a4, t2
                  addi         s7, t2, -1579
                  c.addi4spn   s1, sp, 192
                  c.or         a5, a0
                  c.addi4spn   s1, sp, 192
                  sll          gp, s10, s11
                  mulhu        t4, a3, s6
                  c.srai       a1, 18
                  c.addi16sp   sp, 224
                  sub          a2, a0, a7
                  sll          gp, s10, s11
                  c.srai       a1, 18
                  c.sub        a5, a3
                  c.srli       a5, 22
                  xor          s6, gp, s0
                  mulhu        t4, a3, s6
                  c.and        a5, a1
                  addi         s7, t2, -1579
                  remu         gp, a4, s3
                  or           t4, a6, ra
                  c.srli       a5, 22
                  addi         s7, t2, -1579
                  div          s8, a5, a2
                  sra          s3, t0, s9
                  sra          s3, t0, s9
                  c.sub        a5, a3
                  or           t4, a6, ra
                  c.srai       a1, 18
                  nop
                  divu         s2, a4, s3
                  add          a2, t3, t2
                  c.mv         t0, t6
                  c.addi16sp   sp, 224
                  xori         a1, s1, 959
                  divu         s2, a4, s3
                  c.srli       a5, 22
                  slti         t3, t5, -1062
                  c.srai       a1, 18
                  mulh         s1, a7, a6
                  c.xor        a2, s1
                  c.xor        a2, s1
                  c.addi16sp   sp, 224
                  srl          s3, a1, s4
                  c.addi4spn   s1, sp, 192
                  mulhsu       sp, s0, t5
                  sltiu        s6, zero, -1665
                  c.mv         t0, t6
                  addi         s7, t2, -1579
                  c.or         a5, a0
                  c.mv         t0, t6
                  c.slli       t1, 10
                  or           t4, a6, ra
                  c.li         t2, 14
                  divu         s2, a4, s3
                  sltiu        s6, zero, -1665
                  srli         s8, t3, 9
                  mulh         s1, a7, a6
                  slli         sp, a1, 17
                  c.slli       t1, 10
                  remu         gp, a4, s3
                  divu         s2, a4, s3
                  slt          ra, a3, a1
                  mulh         s1, a7, a6
                  remu         gp, a4, s3
                  slt          ra, a3, a1
                  div          s8, a5, a2
                  div          s8, a5, a2
                  c.addi4spn   s1, sp, 192
                  c.addi4spn   s1, sp, 192
                  addi         s7, t2, -1579
                  ori          s3, s3, 1495
                  c.srli       a5, 22
                  mulh         s1, a7, a6
                  add          a2, t3, t2
                  lui          a2, 460343
                  srli         s8, t3, 9
                  slt          ra, a3, a1
                  c.srli       a5, 22
                  and          sp, a0, gp
                  slt          ra, a3, a1
                  ori          s3, s3, 1495
                  c.andi       a3, 13
                  mulhsu       sp, s0, t5
                  mul          s5, zero, t4
                  c.sub        a5, a3
                  c.slli       t1, 10
                  lui          a2, 460343
                  srli         s8, t3, 9
                  c.addi16sp   sp, 224
                  addi         s7, t2, -1579
                  auipc        ra, 350999
                  sll          gp, s10, s11
                  auipc        ra, 350999
                  srli         s8, t3, 9
                  slti         t3, t5, -1062
                  slt          ra, a3, a1
                  c.mv         t0, t6
                  srai         a3, t6, 11
                  c.addi16sp   sp, 224
                  mulh         s1, a7, a6
                  slti         t3, t5, -1062
                  srl          s3, a1, s4
                  and          sp, a0, gp
                  slli         sp, a1, 17
                  sltu         t0, a4, t2
                  auipc        ra, 350999
                  sub          a2, a0, a7
                  c.addi       s5, -1
                  sra          s3, t0, s9
                  c.addi16sp   sp, 224
                  ori          s3, s3, 1495
                  mulh         s1, a7, a6
                  c.mv         t0, t6
                  slt          ra, a3, a1
                  c.xor        a2, s1
                  c.addi16sp   sp, 224
                  c.xor        a2, s1
                  or           t4, a6, ra
                  slt          ra, a3, a1
                  mulhu        t4, a3, s6
                  srli         s8, t3, 9
                  divu         s2, a4, s3
                  andi         gp, a0, 1810
                  ori          s3, s3, 1495
                  xori         a1, s1, 959
                  mulhsu       sp, s0, t5
                  slti         t3, t5, -1062
                  sub          a2, a0, a7
                  c.and        a5, a1
                  c.mv         t0, t6
                  c.addi16sp   sp, 224
                  mul          s5, zero, t4
                  divu         s2, a4, s3
                  sll          gp, s10, s11
                  c.addi4spn   s1, sp, 192
                  nop
                  auipc        ra, 350999
                  c.sub        a5, a3
                  sltu         t0, a4, t2
                  sltu         t0, a4, t2
                  slti         t3, t5, -1062
                  c.slli       t1, 10
                  or           t4, a6, ra
                  c.nop
                  rem          a3, s1, t6
                  c.addi       s5, -1
                  c.slli       t1, 10
                  c.slli       t1, 10
                  mul          s5, zero, t4
                  add          a2, t3, t2
                  mulhsu       sp, s0, t5
                  slli         sp, a1, 17
                  c.slli       t1, 10
                  c.addi4spn   s1, sp, 192
                  mulh         s1, a7, a6
                  c.addi       s5, -1
                  c.andi       a3, 13
                  mulh         s1, a7, a6
                  c.addi       s5, -1
                  lui          a2, 460343
                  mulh         s1, a7, a6
                  c.addi       s5, -1
                  rem          a3, s1, t6
                  slti         t3, t5, -1062
                  c.nop
                  lui          a2, 460343
                  andi         gp, a0, 1810
                  add          a2, t3, t2
                  c.addi       s5, -1
                  c.li         t2, 14
                  c.or         a5, a0
                  srai         a3, t6, 11
                  mulh         s1, a7, a6
                  and          sp, a0, gp
                  divu         s2, a4, s3
                  rem          a3, s1, t6
                  andi         gp, a0, 1810
                  c.add        s9, s7
                  c.li         t2, 14
                  sll          gp, s10, s11
                  rem          a3, s1, t6
                  nop
                  div          s8, a5, a2
                  c.lui        gp, 4
                  srl          s3, a1, s4
                  remu         gp, a4, s3
                  c.lui        gp, 4
                  mulhsu       sp, s0, t5
                  slt          ra, a3, a1
                  c.mv         t0, t6
                  c.addi16sp   sp, 224
                  remu         gp, a4, s3
                  c.lui        gp, 4
                  slt          ra, a3, a1
                  c.add        s9, s7
                  c.addi4spn   s1, sp, 192
                  divu         s2, a4, s3
                  c.and        a5, a1
                  mul          s5, zero, t4
                  c.sub        a5, a3
                  c.li         t2, 14
                  sltiu        s6, zero, -1665
                  xori         a1, s1, 959
                  sll          gp, s10, s11
                  mul          s5, zero, t4
                  srai         a3, t6, 11
                  c.addi4spn   s1, sp, 192
                  andi         gp, a0, 1810
                  ori          s3, s3, 1495
                  c.or         a5, a0
                  slti         t3, t5, -1062
                  addi         s7, t2, -1579
                  xori         a1, s1, 959
                  c.add        s9, s7
                  c.xor        a2, s1
                  c.or         a5, a0
                  xor          s6, gp, s0
                  divu         s2, a4, s3
                  slt          ra, a3, a1
                  c.addi       s5, -1
                  sub          a2, a0, a7
                  xor          s6, gp, s0
                  auipc        ra, 350999
                  divu         s2, a4, s3
                  slli         sp, a1, 17
                  divu         s2, a4, s3
                  slli         sp, a1, 17
                  add          a2, t3, t2
                  ori          s3, s3, 1495
                  addi         s7, t2, -1579
                  c.addi4spn   s1, sp, 192
                  sll          gp, s10, s11
                  addi         s7, t2, -1579
                  srl          s3, a1, s4
                  srl          s3, a1, s4
                  and          sp, a0, gp
                  divu         s2, a4, s3
                  c.nop
                  auipc        ra, 350999
                  c.lui        gp, 4
                  c.slli       t1, 10
                  mulhu        t4, a3, s6
                  c.andi       a3, 13
                  c.srai       a1, 18
                  sub          a2, a0, a7
                  add          a2, t3, t2
                  c.sub        a5, a3
                  mulhu        t4, a3, s6
                  c.li         t2, 14
                  add          a2, t3, t2
                  c.addi       s5, -1
                  ori          s3, s3, 1495
                  mul          s5, zero, t4
                  sub          a2, a0, a7
                  rem          a3, s1, t6
                  auipc        ra, 350999
                  c.and        a5, a1
                  slti         t3, t5, -1062
                  srli         s8, t3, 9
                  c.li         t2, 14
                  auipc        ra, 350999
                  srl          s3, a1, s4
                  c.or         a5, a0
                  c.addi4spn   s1, sp, 192
                  andi         gp, a0, 1810
                  c.addi       s5, -1
                  mulhsu       sp, s0, t5
                  sll          gp, s10, s11
                  mulhsu       sp, s0, t5
                  div          s8, a5, a2
                  ori          s3, s3, 1495
                  xor          s6, gp, s0
                  lui          a2, 460343
                  c.sub        a5, a3
                  xor          s6, gp, s0
                  xori         a1, s1, 959
                  sra          s3, t0, s9
                  sra          s3, t0, s9
                  sll          gp, s10, s11
                  rem          a3, s1, t6
                  or           t4, a6, ra
                  c.srli       a5, 22
                  c.addi16sp   sp, 224
                  srai         a3, t6, 11
                  slt          ra, a3, a1
                  srl          s3, a1, s4
                  ori          s3, s3, 1495
                  nop
                  ori          s3, s3, 1495
                  c.nop
                  srai         a3, t6, 11
                  c.andi       a3, 13
                  lui          a2, 460343
                  nop
                  or           t4, a6, ra
                  ori          s3, s3, 1495
                  c.srai       a1, 18
                  auipc        ra, 350999
                  mulh         s1, a7, a6
                  xori         a1, s1, 959
                  and          sp, a0, gp
                  c.slli       t1, 10
                  sltiu        s6, zero, -1665
                  mulh         s1, a7, a6
                  c.and        a5, a1
                  div          s8, a5, a2
                  mul          s5, zero, t4
                  srl          s3, a1, s4
                  divu         s2, a4, s3
                  xori         a1, s1, 959
                  add          a2, t3, t2
                  srai         a3, t6, 11
                  c.addi16sp   sp, 224
                  slli         sp, a1, 17
                  c.and        a5, a1
                  c.or         a5, a0
                  xori         a1, s1, 959
                  addi         s7, t2, -1579
                  c.mv         t0, t6
                  c.srli       a5, 22
                  c.li         t2, 14
                  srai         a3, t6, 11
                  srl          s3, a1, s4
                  slt          ra, a3, a1
                  xori         a1, s1, 959
                  c.addi       s5, -1
                  c.sub        a5, a3
                  c.lui        gp, 4
                  xori         a1, s1, 959
                  sll          gp, s10, s11
                  c.slli       t1, 10
                  srli         s8, t3, 9
                  c.andi       a3, 13
                  divu         s2, a4, s3
                  c.nop
                  c.mv         t0, t6
                  add          a2, t3, t2
                  mulhsu       sp, s0, t5
                  c.and        a5, a1
                  c.sub        a5, a3
                  srl          s3, a1, s4
                  c.or         a5, a0
                  c.nop
                  divu         s2, a4, s3
                  c.addi4spn   s1, sp, 192
                  c.srai       a1, 18
                  andi         gp, a0, 1810
                  slli         sp, a1, 17
                  c.li         t2, 14
                  c.slli       t1, 10
                  lui          a2, 460343
                  mul          s5, zero, t4
                  c.li         t2, 14
                  c.addi16sp   sp, 224
                  mulh         s1, a7, a6
                  c.srai       a1, 18
                  srl          s3, a1, s4
                  c.mv         t0, t6
                  c.srli       a5, 22
                  lui          a2, 460343
                  sltiu        s6, zero, -1665
                  xori         a1, s1, 959
                  c.addi4spn   s1, sp, 192
                  c.or         a5, a0
                  andi         gp, a0, 1810
                  rem          a3, s1, t6
                  nop
                  c.srli       a5, 22
                  slli         sp, a1, 17
                  divu         s2, a4, s3
                  div          s8, a5, a2
                  srl          s3, a1, s4
                  c.sub        a5, a3
                  c.li         t2, 14
                  rem          a3, s1, t6
                  mul          s5, zero, t4
                  c.or         a5, a0
                  srai         a3, t6, 11
                  xor          s6, gp, s0
                  mulhsu       sp, s0, t5
                  lui          a2, 460343
                  c.lui        gp, 4
                  c.addi4spn   s1, sp, 192
                  auipc        ra, 350999
                  mulhu        t4, a3, s6
                  slli         sp, a1, 17
                  mulhsu       sp, s0, t5
                  srai         a3, t6, 11
                  c.addi16sp   sp, 224
                  divu         s2, a4, s3
                  c.lui        gp, 4
                  and          sp, a0, gp
                  c.mv         t0, t6
                  c.add        s9, s7
                  slli         sp, a1, 17
                  slt          ra, a3, a1
                  c.slli       t1, 10
                  mulhsu       sp, s0, t5
                  slti         t3, t5, -1062
                  c.srli       a5, 22
                  mul          s5, zero, t4
                  addi         s7, t2, -1579
                  sltiu        s6, zero, -1665
                  add          a2, t3, t2
                  c.or         a5, a0
                  c.andi       a3, 13
                  rem          a3, s1, t6
                  c.sub        a5, a3
                  srl          s3, a1, s4
                  c.srli       a5, 22
                  andi         gp, a0, 1810
                  mul          s5, zero, t4
                  addi         s7, t2, -1579
                  nop
                  srl          s3, a1, s4
                  c.addi16sp   sp, 224
                  srli         s8, t3, 9
                  c.or         a5, a0
                  nop
                  rem          a3, s1, t6
                  c.and        a5, a1
                  addi         s7, t2, -1579
                  sra          s3, t0, s9
                  div          s8, a5, a2
                  mulhu        t4, a3, s6
                  lui          a2, 460343
                  slt          ra, a3, a1
                  xor          s6, gp, s0
                  srl          s3, a1, s4
                  addi         s7, t2, -1579
                  slti         t3, t5, -1062
                  ori          s3, s3, 1495
                  remu         gp, a4, s3
                  add          a2, t3, t2
                  auipc        ra, 350999
                  c.add        s9, s7
                  nop
                  c.or         a5, a0
                  sub          a2, a0, a7
                  ori          s3, s3, 1495
                  c.or         a5, a0
                  c.sub        a5, a3
                  c.xor        a2, s1
                  srli         s8, t3, 9
                  c.li         t2, 14
                  andi         gp, a0, 1810
                  srli         s8, t3, 9
                  add          a2, t3, t2
                  or           t4, a6, ra
                  c.mv         t0, t6
                  divu         s2, a4, s3
                  c.mv         t0, t6
                  sub          a2, a0, a7
                  c.add        s9, s7
                  c.mv         t0, t6
                  ori          s3, s3, 1495
                  auipc        ra, 350999
                  mulhsu       sp, s0, t5
                  add          a2, t3, t2
                  srai         a3, t6, 11
                  auipc        ra, 350999
                  c.slli       t1, 10
                  c.mv         t0, t6
                  c.nop
                  addi         s7, t2, -1579
                  sll          gp, s10, s11
                  c.add        s9, s7
                  c.slli       t1, 10
                  c.lui        gp, 4
                  remu         gp, a4, s3
                  sltiu        s6, zero, -1665
                  c.sub        a5, a3
                  mulhsu       sp, s0, t5
                  c.slli       t1, 10
                  mulhu        t4, a3, s6
                  ori          s3, s3, 1495
                  c.mv         t0, t6
                  c.addi       s5, -1
                  c.srli       a5, 22
                  sll          gp, s10, s11
                  addi         s7, t2, -1579
                  rem          a3, s1, t6
                  c.xor        a2, s1
                  c.li         t2, 14
                  c.slli       t1, 10
                  c.addi4spn   s1, sp, 192
                  ori          s3, s3, 1495
                  c.or         a5, a0
                  ori          s3, s3, 1495
                  c.and        a5, a1
                  divu         s2, a4, s3
                  ori          s3, s3, 1495
                  slli         sp, a1, 17
                  c.sub        a5, a3
                  sra          s3, t0, s9
                  c.andi       a3, 13
                  sra          s3, t0, s9
                  auipc        ra, 350999
                  c.and        a5, a1
                  c.li         t2, 14
                  sltiu        s6, zero, -1665
                  c.or         a5, a0
                  xor          s6, gp, s0
                  c.slli       t1, 10
                  and          sp, a0, gp
                  sub          a2, a0, a7
                  c.li         t2, 14
                  c.or         a5, a0
                  srai         a3, t6, 11
                  and          sp, a0, gp
                  addi         s7, t2, -1579
                  srl          s3, a1, s4
                  mulh         s1, a7, a6
                  auipc        ra, 350999
                  srli         s8, t3, 9
                  slli         sp, a1, 17
                  or           t4, a6, ra
                  c.or         a5, a0
                  c.lui        gp, 4
                  mulhsu       sp, s0, t5
                  addi         s7, t2, -1579
                  sub          a2, a0, a7
                  mulhu        t4, a3, s6
                  c.xor        a2, s1
                  c.sub        a5, a3
                  c.add        s9, s7
                  mulhsu       sp, s0, t5
                  auipc        ra, 350999
                  slli         sp, a1, 17
                  mulhsu       sp, s0, t5
                  addi         s7, t2, -1579
                  c.addi       s5, -1
                  auipc        ra, 350999
                  c.lui        gp, 4
                  c.sub        a5, a3
                  srl          s3, a1, s4
                  c.srai       a1, 18
                  auipc        ra, 350999
                  srl          s3, a1, s4
                  mulhu        t4, a3, s6
                  srli         s8, t3, 9
                  remu         gp, a4, s3
                  lui          a2, 460343
                  c.andi       a3, 13
                  sub          a2, a0, a7
                  c.or         a5, a0
                  xor          s6, gp, s0
                  c.slli       t1, 10
                  mulhu        t4, a3, s6
                  sltiu        s6, zero, -1665
                  lui          a2, 460343
                  divu         s2, a4, s3
                  slti         t3, t5, -1062
                  slt          ra, a3, a1
                  c.lui        gp, 4
                  ori          s3, s3, 1495
                  c.andi       a3, 13
                  srai         a3, t6, 11
                  sra          s3, t0, s9
                  mulhu        t4, a3, s6
                  and          sp, a0, gp
                  xor          s6, gp, s0
                  sub          a2, a0, a7
                  mul          s5, zero, t4
                  slti         t3, t5, -1062
                  add          a2, t3, t2
                  nop
                  c.lui        gp, 4
                  remu         gp, a4, s3
                  sub          a2, a0, a7
                  div          s8, a5, a2
                  c.addi4spn   s1, sp, 192
                  mulhsu       sp, s0, t5
                  slti         t3, t5, -1062
                  c.addi16sp   sp, 224
                  or           t4, a6, ra
                  c.addi16sp   sp, 224
                  divu         s2, a4, s3
                  c.mv         t0, t6
                  c.li         t2, 14
                  c.srai       a1, 18
                  auipc        ra, 350999
                  c.addi       s5, -1
                  rem          a3, s1, t6
                  mul          s5, zero, t4
                  c.nop
                  or           t4, a6, ra
                  sll          gp, s10, s11
                  nop
                  c.or         a5, a0
                  mulhsu       sp, s0, t5
                  mulhsu       sp, s0, t5
                  auipc        ra, 350999
                  c.addi16sp   sp, 224
                  sll          gp, s10, s11
                  srli         s8, t3, 9
                  nop
                  sltiu        s6, zero, -1665
                  c.mv         t0, t6
                  c.slli       t1, 10
                  auipc        ra, 350999
                  c.sub        a5, a3
                  slli         sp, a1, 17
                  c.sub        a5, a3
                  c.andi       a3, 13
                  c.and        a5, a1
                  mul          s5, zero, t4
                  remu         gp, a4, s3
                  c.or         a5, a0
                  c.nop
                  add          a2, t3, t2
                  c.mv         t0, t6
                  mulhu        t4, a3, s6
                  sra          s3, t0, s9
                  ori          s3, s3, 1495
                  auipc        ra, 350999
                  and          sp, a0, gp
                  c.srli       a5, 22
                  c.li         t2, 14
                  xori         a1, s1, 959
                  and          sp, a0, gp
                  divu         s2, a4, s3
                  or           t4, a6, ra
                  addi         s7, t2, -1579
                  srl          s3, a1, s4
                  ori          s3, s3, 1495
                  srli         s8, t3, 9
                  sltiu        s6, zero, -1665
                  sltu         t0, a4, t2
                  c.addi4spn   s1, sp, 192
                  mulh         s1, a7, a6
                  div          s8, a5, a2
                  sltu         t0, a4, t2
                  mulhu        t4, a3, s6
                  c.lui        gp, 4
                  c.add        s9, s7
                  nop
                  xor          s6, gp, s0
                  c.addi       s5, -1
                  c.slli       t1, 10
                  c.srai       a1, 18
                  c.sub        a5, a3
                  c.mv         t0, t6
                  slti         t3, t5, -1062
                  c.addi16sp   sp, 224
                  c.nop
                  mulhsu       sp, s0, t5
                  slli         sp, a1, 17
                  sub          a2, a0, a7
                  slli         sp, a1, 17
                  c.and        a5, a1
                  c.lui        gp, 4
                  sra          s3, t0, s9
                  c.mv         t0, t6
                  div          s8, a5, a2
                  remu         gp, a4, s3
                  c.or         a5, a0
                  c.xor        a2, s1
                  c.andi       a3, 13
                  srai         a3, t6, 11
                  c.addi16sp   sp, 224
                  slti         t3, t5, -1062
                  c.li         t2, 14
                  andi         gp, a0, 1810
                  sltu         t0, a4, t2
                  slt          ra, a3, a1
                  sra          s3, t0, s9
                  sll          gp, s10, s11
                  c.xor        a2, s1
                  c.sub        a5, a3
                  c.addi16sp   sp, 224
                  c.addi       s5, -1
                  addi         s7, t2, -1579
                  srai         a3, t6, 11
                  c.addi16sp   sp, 224
                  addi         s7, t2, -1579
                  and          sp, a0, gp
                  c.or         a5, a0
                  andi         gp, a0, 1810
                  srl          s3, a1, s4
                  sra          s3, t0, s9
                  c.andi       a3, 13
                  slli         sp, a1, 17
                  sltu         t0, a4, t2
                  or           t4, a6, ra
                  lui          a2, 460343
                  c.addi4spn   s1, sp, 192
                  nop
                  c.xor        a2, s1
                  srl          s3, a1, s4
                  slti         t3, t5, -1062
                  c.addi4spn   s1, sp, 192
                  c.addi16sp   sp, 224
                  c.srli       a5, 22
                  c.and        a5, a1
                  sltu         t0, a4, t2
                  c.lui        gp, 4
                  div          s8, a5, a2
                  srai         a3, t6, 11
                  c.srli       a5, 22
                  sra          s3, t0, s9
                  slt          ra, a3, a1
                  mulh         s1, a7, a6
                  lui          a2, 460343
                  c.xor        a2, s1
                  c.mv         t0, t6
                  mulhu        t4, a3, s6
                  add          a2, t3, t2
                  andi         gp, a0, 1810
                  nop
                  mulh         s1, a7, a6
                  c.addi4spn   s1, sp, 192
                  divu         s2, a4, s3
                  c.andi       a3, 13
                  srli         s8, t3, 9
                  or           t4, a6, ra
                  mul          s5, zero, t4
                  slli         sp, a1, 17
                  c.lui        gp, 4
                  srl          s3, a1, s4
                  sub          a2, a0, a7
                  xori         a1, s1, 959
                  sltu         t0, a4, t2
                  c.and        a5, a1
                  sltiu        s6, zero, -1665
                  mul          s5, zero, t4
                  c.and        a5, a1
                  slli         sp, a1, 17
                  mulhu        t4, a3, s6
                  srli         s8, t3, 9
                  remu         gp, a4, s3
                  c.add        s9, s7
                  c.and        a5, a1
                  srli         s8, t3, 9
                  xor          s6, gp, s0
                  c.lui        gp, 4
                  mulhsu       sp, s0, t5
                  sltu         t0, a4, t2
                  c.sub        a5, a3
                  sltu         t0, a4, t2
                  c.li         t2, 14
                  c.addi       s5, -1
                  add          a2, t3, t2
                  c.srli       a5, 22
                  c.andi       a3, 13
                  c.andi       a3, 13
                  slli         sp, a1, 17
                  or           t4, a6, ra
                  sltu         t0, a4, t2
                  c.xor        a2, s1
                  c.addi4spn   s1, sp, 192
                  remu         gp, a4, s3
                  auipc        ra, 350999
                  sub          a2, a0, a7
                  c.slli       t1, 10
                  addi         s7, t2, -1579
                  nop
                  auipc        ra, 350999
                  mul          s5, zero, t4
                  addi         s7, t2, -1579
                  auipc        ra, 350999
                  add          a2, t3, t2
                  mulhsu       sp, s0, t5
                  srli         s8, t3, 9
                  mulhu        t4, a3, s6
                  c.addi4spn   s1, sp, 192
                  c.and        a5, a1
                  c.addi16sp   sp, 224
                  c.addi       s5, -1
                  c.slli       t1, 10
                  c.addi4spn   s1, sp, 192
                  c.mv         t0, t6
                  rem          a3, s1, t6
                  srli         s8, t3, 9
                  c.nop
                  sltiu        s6, zero, -1665
                  c.srli       a5, 22
                  c.srli       a5, 22
                  slti         t3, t5, -1062
                  addi         s7, t2, -1579
                  ori          s3, s3, 1495
                  srli         s8, t3, 9
                  div          s8, a5, a2
                  ori          s3, s3, 1495
                  or           t4, a6, ra
                  srli         s8, t3, 9
                  auipc        ra, 350999
                  c.addi16sp   sp, 224
                  c.add        s9, s7
                  c.li         t2, 14
                  c.mv         t0, t6
                  divu         s2, a4, s3
                  c.li         t2, 14
                  add          a2, t3, t2
                  rem          a3, s1, t6
                  add          a2, t3, t2
                  c.sub        a5, a3
                  c.slli       t1, 10
                  slti         t3, t5, -1062
                  c.srai       a1, 18
                  slti         t3, t5, -1062
                  c.xor        a2, s1
                  addi         s7, t2, -1579
                  slli         sp, a1, 17
                  c.and        a5, a1
                  sub          a2, a0, a7
                  c.mv         t0, t6
                  sltiu        s6, zero, -1665
                  andi         gp, a0, 1810
                  slt          ra, a3, a1
                  c.slli       t1, 10
                  mulh         s1, a7, a6
                  addi         s7, t2, -1579
                  add          a2, t3, t2
                  c.srai       a1, 18
                  or           t4, a6, ra
                  c.mv         t0, t6
                  slt          ra, a3, a1
                  srli         s8, t3, 9
                  mulhu        t4, a3, s6
                  c.xor        a2, s1
                  c.add        s9, s7
                  addi         s7, t2, -1579
                  addi         s7, t2, -1579
                  mulhsu       sp, s0, t5
                  mul          s5, zero, t4
                  add          a2, t3, t2
                  c.srli       a5, 22
                  c.mv         t0, t6
                  c.slli       t1, 10
                  slli         sp, a1, 17
                  c.mv         t0, t6
                  srl          s3, a1, s4
                  mulhsu       sp, s0, t5
                  srli         s8, t3, 9
                  sltiu        s6, zero, -1665
                  rem          a3, s1, t6
                  c.srli       a5, 22
                  xor          s6, gp, s0
                  c.mv         t0, t6
                  remu         gp, a4, s3
                  and          sp, a0, gp
                  srli         s8, t3, 9
                  c.mv         t0, t6
                  c.addi4spn   s1, sp, 192
                  mulhsu       sp, s0, t5
                  auipc        ra, 350999
                  lui          a2, 460343
                  c.li         t2, 14
                  c.sub        a5, a3
                  div          s8, a5, a2
                  c.addi4spn   s1, sp, 192
                  sra          s3, t0, s9
                  c.and        a5, a1
                  c.mv         t0, t6
                  slli         sp, a1, 17
                  auipc        ra, 350999
                  lui          a2, 460343
                  remu         gp, a4, s3
                  c.or         a5, a0
                  c.nop
                  add          a2, t3, t2
                  addi         s7, t2, -1579
                  rem          a3, s1, t6
                  nop
                  c.and        a5, a1
                  c.addi16sp   sp, 224
                  mul          s5, zero, t4
                  or           t4, a6, ra
                  divu         s2, a4, s3
                  slli         sp, a1, 17
                  rem          a3, s1, t6
                  add          a2, t3, t2
                  addi         s7, t2, -1579
                  c.srai       a1, 18
                  remu         gp, a4, s3
                  c.andi       a3, 13
                  c.mv         t0, t6
                  andi         gp, a0, 1810
                  mul          s5, zero, t4
                  c.srai       a1, 18
                  c.xor        a2, s1
                  mulhsu       sp, s0, t5
                  mulh         s1, a7, a6
                  mul          s5, zero, t4
                  c.nop
                  div          s8, a5, a2
                  div          s8, a5, a2
                  c.addi       s5, -1
                  slti         t3, t5, -1062
                  c.slli       t1, 10
                  ori          s3, s3, 1495
                  mulh         s1, a7, a6
                  c.andi       a3, 13
                  addi         s7, t2, -1579
                  auipc        ra, 350999
                  sub          a2, a0, a7
                  div          s8, a5, a2
                  andi         gp, a0, 1810
                  c.addi16sp   sp, 224
                  addi         s7, t2, -1579
                  c.or         a5, a0
                  and          sp, a0, gp
                  div          s8, a5, a2
                  mulhsu       sp, s0, t5
                  slli         sp, a1, 17
                  sll          gp, s10, s11
                  nop
                  auipc        ra, 350999
                  c.mv         t0, t6
                  c.lui        gp, 4
                  sltiu        s6, zero, -1665
                  c.srli       a5, 22
                  auipc        ra, 350999
                  c.mv         t0, t6
                  lui          a2, 460343
                  sll          gp, s10, s11
                  c.li         t2, 14
                  c.mv         t0, t6
                  c.addi4spn   s1, sp, 192
                  c.or         a5, a0
                  slti         t3, t5, -1062
                  c.addi16sp   sp, 224
                  c.addi16sp   sp, 224
                  mul          s5, zero, t4
                  xori         a1, s1, 959
                  c.srli       a5, 22
                  c.xor        a2, s1
                  c.lui        gp, 4
                  divu         s2, a4, s3
                  c.slli       t1, 10
                  srli         s8, t3, 9
                  c.andi       a3, 13
                  mulh         s1, a7, a6
                  divu         s2, a4, s3
                  c.sub        a5, a3
                  sra          s3, t0, s9
                  sub          a2, a0, a7
                  c.addi16sp   sp, 224
                  slti         t3, t5, -1062
                  mulhsu       sp, s0, t5
                  c.sub        a5, a3
                  c.andi       a3, 13
                  sll          gp, s10, s11
                  c.sub        a5, a3
                  c.and        a5, a1
                  c.srli       a5, 22
                  srli         s8, t3, 9
                  sll          gp, s10, s11
                  sub          a2, a0, a7
                  c.and        a5, a1
                  slli         sp, a1, 17
                  c.xor        a2, s1
                  slt          ra, a3, a1
                  rem          a3, s1, t6
                  mulhu        t4, a3, s6
                  remu         gp, a4, s3
                  lui          a2, 460343
                  addi         s7, t2, -1579
                  c.mv         t0, t6
                  xori         a1, s1, 959
                  c.addi4spn   s1, sp, 192
                  c.lui        gp, 4
                  or           t4, a6, ra
                  sub          a2, a0, a7
                  ori          s3, s3, 1495
                  c.addi4spn   s1, sp, 192
                  mul          s5, zero, t4
                  c.nop
                  c.addi4spn   s1, sp, 192
                  addi         s7, t2, -1579
                  c.mv         t0, t6
                  srli         s8, t3, 9
                  lui          a2, 460343
                  srli         s8, t3, 9
                  sub          a2, a0, a7
                  c.andi       a3, 13
                  c.andi       a3, 13
                  c.lui        gp, 4
                  c.srli       a5, 22
                  addi         s7, t2, -1579
                  c.mv         t0, t6
                  c.addi       s5, -1
                  c.addi16sp   sp, 224
                  and          sp, a0, gp
                  slt          ra, a3, a1
                  div          s8, a5, a2
                  sra          s3, t0, s9
                  remu         gp, a4, s3
                  lui          a2, 460343
                  mulh         s1, a7, a6
                  mulh         s1, a7, a6
                  mulhu        t4, a3, s6
                  rem          a3, s1, t6
                  nop
                  sltiu        s6, zero, -1665
                  or           t4, a6, ra
                  srli         s8, t3, 9
                  slti         t3, t5, -1062
                  srl          s3, a1, s4
                  mulhu        t4, a3, s6
                  c.xor        a2, s1
                  c.andi       a3, 13
                  auipc        ra, 350999
                  sub          a2, a0, a7
                  srai         a3, t6, 11
                  add          a2, t3, t2
                  c.andi       a3, 13
                  c.or         a5, a0
                  c.lui        gp, 4
                  and          sp, a0, gp
                  c.andi       a3, 13
                  c.or         a5, a0
                  srai         a3, t6, 11
                  sltu         t0, a4, t2
                  mulhsu       sp, s0, t5
                  auipc        ra, 350999
                  and          sp, a0, gp
                  c.xor        a2, s1
                  sll          gp, s10, s11
                  mulhsu       sp, s0, t5
                  c.addi16sp   sp, 224
                  c.slli       t1, 10
                  andi         gp, a0, 1810
                  slli         sp, a1, 17
                  rem          a3, s1, t6
                  div          s8, a5, a2
                  c.add        s9, s7
                  c.addi       s5, -1
                  xori         a1, s1, 959
                  slti         t3, t5, -1062
                  xor          s6, gp, s0
                  srai         a3, t6, 11
                  c.addi       s5, -1
                  c.or         a5, a0
                  sub          a2, a0, a7
                  divu         s2, a4, s3
                  c.xor        a2, s1
                  sltiu        s6, zero, -1665
                  c.addi16sp   sp, 224
                  or           t4, a6, ra
                  slli         sp, a1, 17
                  xori         a1, s1, 959
                  or           t4, a6, ra
                  slti         t3, t5, -1062
                  mulh         s1, a7, a6
                  c.nop
                  auipc        ra, 350999
                  c.li         t2, 14
                  sra          s3, t0, s9
                  xor          s6, gp, s0
                  c.slli       t1, 10
                  c.add        s9, s7
                  srli         s8, t3, 9
                  c.nop
                  srl          s3, a1, s4
                  ori          s3, s3, 1495
                  ori          s3, s3, 1495
                  c.add        s9, s7
                  sltiu        s6, zero, -1665
                  mulh         s1, a7, a6
                  divu         s2, a4, s3
                  sltu         t0, a4, t2
                  xori         a1, s1, 959
                  c.addi4spn   s1, sp, 192
                  sra          s3, t0, s9
                  c.srai       a1, 18
                  rem          a3, s1, t6
                  sub          a2, a0, a7
                  sltiu        s6, zero, -1665
                  mulhsu       sp, s0, t5
                  sra          s3, t0, s9
                  auipc        ra, 350999
                  c.xor        a2, s1
                  c.lui        gp, 4
                  mulh         s1, a7, a6
                  srli         s8, t3, 9
                  add          a2, t3, t2
                  c.add        s9, s7
                  remu         gp, a4, s3
                  div          s8, a5, a2
                  lui          a2, 460343
                  nop
                  c.and        a5, a1
                  slt          ra, a3, a1
                  c.and        a5, a1
                  slti         t3, t5, -1062
                  c.andi       a3, 13
                  andi         gp, a0, 1810
                  c.add        s9, s7
                  mul          s5, zero, t4
                  lui          a2, 460343
                  c.add        s9, s7
                  c.srai       a1, 18
                  sltu         t0, a4, t2
                  slt          ra, a3, a1
                  mulhsu       sp, s0, t5
                  xor          s6, gp, s0
                  sltiu        s6, zero, -1665
                  ori          s3, s3, 1495
                  nop
                  sltiu        s6, zero, -1665
                  and          sp, a0, gp
                  nop
                  c.addi       s5, -1
                  c.lui        gp, 4
                  c.addi       s5, -1
                  sltu         t0, a4, t2
                  sltiu        s6, zero, -1665
                  lui          a2, 460343
                  c.srli       a5, 22
                  c.nop
                  c.srli       a5, 22
                  sra          s3, t0, s9
                  srl          s3, a1, s4
                  xori         a1, s1, 959
                  sll          gp, s10, s11
                  c.sub        a5, a3
                  and          sp, a0, gp
                  mul          s5, zero, t4
                  slt          ra, a3, a1
                  mulh         s1, a7, a6
                  xor          s6, gp, s0
                  sub          a2, a0, a7
                  divu         s2, a4, s3
                  auipc        ra, 350999
                  c.li         t2, 14
                  divu         s2, a4, s3
                  c.mv         t0, t6
                  or           t4, a6, ra
                  c.addi       s5, -1
                  andi         gp, a0, 1810
                  c.add        s9, s7
                  mul          s5, zero, t4
                  c.nop
                  sltiu        s6, zero, -1665
                  andi         gp, a0, 1810
                  slli         sp, a1, 17
                  remu         gp, a4, s3
                  lui          a2, 460343
                  c.srli       a5, 22
                  divu         s2, a4, s3
                  div          s8, a5, a2
                  c.nop
                  slli         sp, a1, 17
                  c.mv         t0, t6
                  or           t4, a6, ra
                  c.add        s9, s7
                  mulhu        t4, a3, s6
                  sub          a2, a0, a7
                  mulhsu       sp, s0, t5
                  c.andi       a3, 13
                  c.srli       a5, 22
                  slti         t3, t5, -1062
                  srai         a3, t6, 11
                  auipc        ra, 350999
                  or           t4, a6, ra
                  srl          s3, a1, s4
                  div          s8, a5, a2
                  divu         s2, a4, s3
                  nop
                  c.slli       t1, 10
                  lui          a2, 460343
                  c.sub        a5, a3
                  addi         s7, t2, -1579
                  div          s8, a5, a2
                  sltu         t0, a4, t2
                  remu         gp, a4, s3
                  mulh         s1, a7, a6
                  c.and        a5, a1
                  sub          a2, a0, a7
                  c.li         t2, 14
                  srl          s3, a1, s4
                  slti         t3, t5, -1062
                  andi         gp, a0, 1810
                  mulhsu       sp, s0, t5
                  mulhu        t4, a3, s6
                  mulhsu       sp, s0, t5
                  addi         s7, t2, -1579
                  add          a2, t3, t2
                  lui          a2, 460343
                  addi         s7, t2, -1579
                  rem          a3, s1, t6
                  and          sp, a0, gp
                  sltiu        s6, zero, -1665
                  c.nop
                  srl          s3, a1, s4
                  c.sub        a5, a3
                  andi         gp, a0, 1810
                  addi         s7, t2, -1579
                  sub          a2, a0, a7
                  c.sub        a5, a3
                  or           t4, a6, ra
                  add          a2, t3, t2
                  sub          a2, a0, a7
                  slli         sp, a1, 17
                  mulhsu       sp, s0, t5
                  mul          s5, zero, t4
                  slti         t3, t5, -1062
                  c.lui        gp, 4
                  c.srli       a5, 22
                  ori          s3, s3, 1495
                  c.nop
                  slti         t3, t5, -1062
                  c.nop
                  mul          s5, zero, t4
                  c.add        s9, s7
                  c.add        s9, s7
                  c.srai       a1, 18
                  c.mv         t0, t6
                  slti         t3, t5, -1062
                  c.xor        a2, s1
                  c.mv         t0, t6
                  slli         sp, a1, 17
                  c.addi16sp   sp, 224
                  c.mv         t0, t6
                  rem          a3, s1, t6
                  addi         s7, t2, -1579
                  divu         s2, a4, s3
                  or           t4, a6, ra
                  c.nop
                  sra          s3, t0, s9
                  srl          s3, a1, s4
                  c.li         t2, 14
                  sra          s3, t0, s9
                  addi         s7, t2, -1579
                  and          sp, a0, gp
                  rem          a3, s1, t6
                  c.andi       a3, 13
                  xor          s6, gp, s0
                  xori         a1, s1, 959
                  sltiu        s6, zero, -1665
                  c.and        a5, a1
                  div          s8, a5, a2
                  auipc        ra, 350999
                  c.add        s9, s7
                  mulhu        t4, a3, s6
                  rem          a3, s1, t6
                  or           t4, a6, ra
                  remu         gp, a4, s3
                  c.li         t2, 14
                  mul          s5, zero, t4
                  c.sub        a5, a3
                  sra          s3, t0, s9
                  c.add        s9, s7
                  or           t4, a6, ra
                  addi         s7, t2, -1579
                  slti         t3, t5, -1062
                  or           t4, a6, ra
                  rem          a3, s1, t6
                  c.lui        gp, 4
                  srai         a3, t6, 11
                  slt          ra, a3, a1
                  div          s8, a5, a2
                  c.addi4spn   s1, sp, 192
                  auipc        ra, 350999
                  add          a2, t3, t2
                  add          a2, t3, t2
                  c.nop
                  mulh         s1, a7, a6
                  lui          a2, 460343
                  c.srai       a1, 18
                  remu         gp, a4, s3
                  mulh         s1, a7, a6
                  or           t4, a6, ra
                  srli         s8, t3, 9
                  c.sub        a5, a3
                  c.li         t2, 14
                  rem          a3, s1, t6
                  sltu         t0, a4, t2
                  sub          a2, a0, a7
                  c.andi       a3, 13
                  c.lui        gp, 4
                  addi         s7, t2, -1579
                  mulhu        t4, a3, s6
                  c.andi       a3, 13
                  c.srli       a5, 22
                  sltiu        s6, zero, -1665
                  c.mv         t0, t6
                  mul          s5, zero, t4
                  sltu         t0, a4, t2
                  c.xor        a2, s1
                  sra          s3, t0, s9
                  c.and        a5, a1
                  addi         s7, t2, -1579
                  sub          a2, a0, a7
                  mul          s5, zero, t4
                  c.addi       s5, -1
                  div          s8, a5, a2
                  xori         a1, s1, 959
                  xori         a1, s1, 959
                  c.addi16sp   sp, 224
                  c.xor        a2, s1
                  c.addi16sp   sp, 224
                  c.or         a5, a0
                  xori         a1, s1, 959
                  and          sp, a0, gp
                  sltiu        s6, zero, -1665
                  srai         a3, t6, 11
                  divu         s2, a4, s3
                  xor          s6, gp, s0
                  c.sub        a5, a3
                  c.addi       s5, -1
                  add          a2, t3, t2
                  mulhu        t4, a3, s6
                  slti         t3, t5, -1062
                  c.and        a5, a1
                  div          s8, a5, a2
                  c.lui        gp, 4
                  xori         a1, s1, 959
                  slli         sp, a1, 17
                  mulhu        t4, a3, s6
                  rem          a3, s1, t6
                  c.andi       a3, 13
                  c.sub        a5, a3
                  c.lui        gp, 4
                  sltu         t0, a4, t2
                  c.xor        a2, s1
                  c.sub        a5, a3
                  remu         gp, a4, s3
                  slti         t3, t5, -1062
                  sltu         t0, a4, t2
                  c.xor        a2, s1
                  c.and        a5, a1
                  andi         gp, a0, 1810
                  ori          s3, s3, 1495
                  slti         t3, t5, -1062
                  c.xor        a2, s1
                  mulh         s1, a7, a6
                  andi         gp, a0, 1810
                  srli         s8, t3, 9
                  c.andi       a3, 13
                  c.nop
                  c.lui        gp, 4
                  c.andi       a3, 13
                  addi         s7, t2, -1579
                  c.add        s9, s7
                  c.add        s9, s7
                  sltu         t0, a4, t2
                  mulhu        t4, a3, s6
                  c.li         t2, 14
                  ori          s3, s3, 1495
                  auipc        ra, 350999
                  c.mv         t0, t6
                  c.lui        gp, 4
                  lui          a2, 460343
                  c.addi16sp   sp, 224
                  c.li         t2, 14
                  sll          gp, s10, s11
                  lui          a2, 460343
                  c.slli       t1, 10
                  mulhu        t4, a3, s6
                  c.and        a5, a1
                  sll          gp, s10, s11
                  srli         s8, t3, 9
                  mulhsu       sp, s0, t5
                  divu         s2, a4, s3
                  sltu         t0, a4, t2
                  rem          a3, s1, t6
                  lui          a2, 460343
                  andi         gp, a0, 1810
                  remu         gp, a4, s3
                  c.andi       a3, 13
                  c.or         a5, a0
                  slli         sp, a1, 17
                  c.srli       a5, 22
                  c.or         a5, a0
                  addi         s7, t2, -1579
                  c.nop
                  remu         gp, a4, s3
                  nop
                  c.addi16sp   sp, 224
                  ori          s3, s3, 1495
                  nop
                  c.slli       t1, 10
                  srai         a3, t6, 11
                  lui          a2, 460343
                  div          s8, a5, a2
                  c.sub        a5, a3
                  mulh         s1, a7, a6
                  c.addi16sp   sp, 224
                  c.or         a5, a0
                  slli         sp, a1, 17
                  divu         s2, a4, s3
                  c.or         a5, a0
                  c.lui        gp, 4
                  c.and        a5, a1
                  c.add        s9, s7
                  remu         gp, a4, s3
                  ori          s3, s3, 1495
                  c.slli       t1, 10
                  lui          a2, 460343
                  add          a2, t3, t2
                  srli         s8, t3, 9
                  c.addi4spn   s1, sp, 192
                  c.and        a5, a1
                  lui          a2, 460343
                  mul          s5, zero, t4
                  xor          s6, gp, s0
                  c.srli       a5, 22
                  slli         sp, a1, 17
                  mulhsu       sp, s0, t5
                  c.addi16sp   sp, 224
                  c.srai       a1, 18
                  sub          a2, a0, a7
                  andi         gp, a0, 1810
                  mulhsu       sp, s0, t5
                  c.add        s9, s7
                  remu         gp, a4, s3
                  mulh         s1, a7, a6
                  c.addi16sp   sp, 224
                  mul          s5, zero, t4
                  c.slli       t1, 10
                  c.xor        a2, s1
                  c.add        s9, s7
                  c.nop
                  sll          gp, s10, s11
                  srli         s8, t3, 9
                  mulh         s1, a7, a6
                  addi         s7, t2, -1579
                  divu         s2, a4, s3
                  c.nop
                  c.lui        gp, 4
                  c.sub        a5, a3
                  c.and        a5, a1
                  rem          a3, s1, t6
                  c.li         t2, 14
                  srl          s3, a1, s4
                  auipc        ra, 350999
                  mulhu        t4, a3, s6
                  c.andi       a3, 13
                  div          s8, a5, a2
                  sltu         t0, a4, t2
                  mulhsu       sp, s0, t5
                  c.and        a5, a1
                  lui          a2, 460343
                  sltiu        s6, zero, -1665
                  c.mv         t0, t6
                  sll          gp, s10, s11
                  c.add        s9, s7
                  slti         t3, t5, -1062
                  c.addi       s5, -1
                  c.sub        a5, a3
                  sll          gp, s10, s11
                  sub          a2, a0, a7
                  c.srli       a5, 22
                  mul          s5, zero, t4
                  c.or         a5, a0
                  mul          s5, zero, t4
                  sra          s3, t0, s9
                  slli         sp, a1, 17
                  addi         s7, t2, -1579
                  rem          a3, s1, t6
                  sltu         t0, a4, t2
                  lui          a2, 460343
                  sll          gp, s10, s11
                  c.and        a5, a1
                  c.nop
                  c.or         a5, a0
                  slt          ra, a3, a1
                  mulhsu       sp, s0, t5
                  c.addi16sp   sp, 224
                  div          s8, a5, a2
                  slt          ra, a3, a1
                  srl          s3, a1, s4
                  srli         s8, t3, 9
                  addi         s7, t2, -1579
                  slli         sp, a1, 17
                  c.lui        gp, 4
                  mulh         s1, a7, a6
                  or           t4, a6, ra
                  lui          a2, 460343
                  auipc        ra, 350999
                  c.slli       t1, 10
                  c.and        a5, a1
                  c.addi4spn   s1, sp, 192
                  xor          s6, gp, s0
                  slt          ra, a3, a1
                  slti         t3, t5, -1062
                  c.addi16sp   sp, 224
                  nop
                  c.andi       a3, 13
                  c.mv         t0, t6
                  c.slli       t1, 10
                  andi         gp, a0, 1810
                  sltiu        s6, zero, -1665
                  xori         a1, s1, 959
                  sra          s3, t0, s9
                  srli         s8, t3, 9
                  sra          s3, t0, s9
                  sll          gp, s10, s11
                  slti         t3, t5, -1062
                  c.srli       a5, 22
                  remu         gp, a4, s3
                  c.li         t2, 14
                  auipc        ra, 350999
                  mulh         s1, a7, a6
                  mulh         s1, a7, a6
                  c.and        a5, a1
                  c.or         a5, a0
                  auipc        ra, 350999
                  lui          a2, 460343
                  rem          a3, s1, t6
                  mulhsu       sp, s0, t5
                  slli         sp, a1, 17
                  c.addi16sp   sp, 224
                  c.andi       a3, 13
                  c.or         a5, a0
                  c.and        a5, a1
                  c.mv         t0, t6
                  mul          s5, zero, t4
                  andi         gp, a0, 1810
                  c.or         a5, a0
                  divu         s2, a4, s3
                  sltu         t0, a4, t2
                  slli         sp, a1, 17
                  slti         t3, t5, -1062
                  mul          s5, zero, t4
                  lui          a2, 460343
                  mulhu        t4, a3, s6
                  slli         sp, a1, 17
                  auipc        ra, 350999
                  c.xor        a2, s1
                  auipc        ra, 350999
                  c.li         t2, 14
                  xor          s6, gp, s0
                  c.lui        gp, 4
                  nop
                  or           t4, a6, ra
                  mul          s5, zero, t4
                  rem          a3, s1, t6
                  sll          gp, s10, s11
                  c.li         t2, 14
                  lui          a2, 460343
                  srli         s8, t3, 9
                  srl          s3, a1, s4
                  c.andi       a3, 13
                  srai         a3, t6, 11
                  sll          gp, s10, s11
                  srli         s8, t3, 9
                  slt          ra, a3, a1
                  mulh         s1, a7, a6
                  c.addi       s5, -1
                  c.mv         t0, t6
                  div          s8, a5, a2
                  c.li         t2, 14
                  c.srli       a5, 22
                  c.srli       a5, 22
                  slt          ra, a3, a1
                  add          a2, t3, t2
                  c.li         t2, 14
                  nop
                  slt          ra, a3, a1
                  c.and        a5, a1
                  slli         sp, a1, 17
                  c.lui        gp, 4
                  or           t4, a6, ra
                  nop
                  mulh         s1, a7, a6
                  mulh         s1, a7, a6
                  sll          gp, s10, s11
                  mulh         s1, a7, a6
                  slti         t3, t5, -1062
                  rem          a3, s1, t6
                  srl          s3, a1, s4
                  remu         gp, a4, s3
                  slt          ra, a3, a1
                  xori         a1, s1, 959
                  srli         s8, t3, 9
                  sll          gp, s10, s11
                  slt          ra, a3, a1
                  slti         t3, t5, -1062
                  slti         t3, t5, -1062
                  c.and        a5, a1
                  rem          a3, s1, t6
                  remu         gp, a4, s3
                  ori          s3, s3, 1495
                  sll          gp, s10, s11
                  slt          ra, a3, a1
                  c.andi       a3, 13
                  c.slli       t1, 10
                  c.addi16sp   sp, 224
                  c.sub        a5, a3
                  c.xor        a2, s1
                  nop
                  c.srli       a5, 22
                  c.add        s9, s7
                  c.xor        a2, s1
                  sra          s3, t0, s9
                  mul          s5, zero, t4
                  srl          s3, a1, s4
                  xori         a1, s1, 959
                  xori         a1, s1, 959
                  c.or         a5, a0
                  andi         gp, a0, 1810
                  slli         sp, a1, 17
                  c.xor        a2, s1
                  ori          s3, s3, 1495
                  sra          s3, t0, s9
                  c.sub        a5, a3
                  add          a2, t3, t2
                  mulh         s1, a7, a6
                  div          s8, a5, a2
                  lui          a2, 460343
                  c.add        s9, s7
                  remu         gp, a4, s3
                  srli         s8, t3, 9
                  c.srli       a5, 22
                  c.li         t2, 14
                  sra          s3, t0, s9
                  srl          s3, a1, s4
                  c.sub        a5, a3
                  mulhu        t4, a3, s6
                  c.nop
                  c.mv         t0, t6
                  c.lui        gp, 4
                  c.and        a5, a1
                  mulhsu       sp, s0, t5
                  remu         gp, a4, s3
                  div          s8, a5, a2
                  add          a2, t3, t2
                  c.li         t2, 14
                  srl          s3, a1, s4
                  sltu         t0, a4, t2
                  c.li         t2, 14
                  c.xor        a2, s1
                  lui          a2, 460343
                  srai         a3, t6, 11
                  slti         t3, t5, -1062
                  c.lui        gp, 4
                  c.addi16sp   sp, 224
                  mulh         s1, a7, a6
                  sra          s3, t0, s9
                  xori         a1, s1, 959
                  xor          s6, gp, s0
                  sltu         t0, a4, t2
                  c.add        s9, s7
                  add          a2, t3, t2
                  andi         gp, a0, 1810
                  srli         s8, t3, 9
                  c.nop
                  rem          a3, s1, t6
                  mulhsu       sp, s0, t5
                  mulhu        t4, a3, s6
                  ori          s3, s3, 1495
                  c.mv         t0, t6
                  add          a2, t3, t2
                  add          a2, t3, t2
                  c.slli       t1, 10
                  c.srai       a1, 18
                  c.srai       a1, 18
                  c.mv         t0, t6
                  c.mv         t0, t6
                  ori          s3, s3, 1495
                  c.sub        a5, a3
                  xor          s6, gp, s0
                  c.li         t2, 14
                  c.lui        gp, 4
                  slli         sp, a1, 17
                  slli         sp, a1, 17
                  slti         t3, t5, -1062
                  c.nop
                  c.slli       t1, 10
                  slt          ra, a3, a1
                  nop
                  mulhu        t4, a3, s6
                  sltiu        s6, zero, -1665
                  c.or         a5, a0
                  srli         s8, t3, 9
                  mulhu        t4, a3, s6
                  add          a2, t3, t2
                  lui          a2, 460343
                  c.xor        a2, s1
                  add          a2, t3, t2
                  slti         t3, t5, -1062
                  or           t4, a6, ra
                  sltiu        s6, zero, -1665
                  xor          s6, gp, s0
                  c.addi4spn   s1, sp, 192
                  slli         sp, a1, 17
                  sltu         t0, a4, t2
                  mul          s5, zero, t4
                  ori          s3, s3, 1495
                  rem          a3, s1, t6
                  srli         s8, t3, 9
                  sltiu        s6, zero, -1665
                  c.mv         t0, t6
                  c.addi       s5, -1
                  sra          s3, t0, s9
                  c.nop
                  srl          s3, a1, s4
                  sll          gp, s10, s11
                  auipc        ra, 350999
                  c.or         a5, a0
                  sltiu        s6, zero, -1665
                  auipc        ra, 350999
                  slli         sp, a1, 17
                  c.or         a5, a0
                  slti         t3, t5, -1062
                  divu         s2, a4, s3
                  c.addi4spn   s1, sp, 192
                  mulhu        t4, a3, s6
                  divu         s2, a4, s3
                  lui          a2, 460343
                  srli         s8, t3, 9
                  c.and        a5, a1
                  c.or         a5, a0
                  c.addi4spn   s1, sp, 192
                  div          s8, a5, a2
                  c.xor        a2, s1
                  sltu         t0, a4, t2
                  rem          a3, s1, t6
                  c.andi       a3, 13
                  c.addi4spn   s1, sp, 192
                  c.xor        a2, s1
                  c.addi       s5, -1
                  c.add        s9, s7
                  remu         gp, a4, s3
                  sra          s3, t0, s9
                  c.xor        a2, s1
                  c.and        a5, a1
                  mulhu        t4, a3, s6
                  c.lui        gp, 4
                  div          s8, a5, a2
                  c.andi       a3, 13
                  sltiu        s6, zero, -1665
                  c.add        s9, s7
                  xori         a1, s1, 959
                  c.addi       s5, -1
                  add          a2, t3, t2
                  c.or         a5, a0
                  c.sub        a5, a3
                  slli         sp, a1, 17
                  nop
                  c.and        a5, a1
                  c.and        a5, a1
                  or           t4, a6, ra
                  c.addi4spn   s1, sp, 192
                  sltiu        s6, zero, -1665
                  auipc        ra, 350999
                  c.addi4spn   s1, sp, 192
                  div          s8, a5, a2
                  c.sub        a5, a3
                  c.addi       s5, -1
                  c.and        a5, a1
                  lui          a2, 460343
                  lui          a2, 460343
                  xor          s6, gp, s0
                  c.lui        gp, 4
                  c.add        s9, s7
                  c.add        s9, s7
                  slti         t3, t5, -1062
                  nop
                  add          a2, t3, t2
                  remu         gp, a4, s3
                  c.li         t2, 14
                  mulhsu       sp, s0, t5
                  c.srai       a1, 18
                  xor          s6, gp, s0
                  mulhsu       sp, s0, t5
                  mulh         s1, a7, a6
                  sltu         t0, a4, t2
                  sub          a2, a0, a7
                  and          sp, a0, gp
                  srli         s8, t3, 9
                  or           t4, a6, ra
                  remu         gp, a4, s3
                  andi         gp, a0, 1810
                  mulh         s1, a7, a6
                  srai         a3, t6, 11
                  c.sub        a5, a3
                  nop
                  lui          a2, 460343
                  sll          gp, s10, s11
                  srl          s3, a1, s4
                  c.srli       a5, 22
                  or           t4, a6, ra
                  c.xor        a2, s1
                  c.sub        a5, a3
                  remu         gp, a4, s3
                  or           t4, a6, ra
                  c.or         a5, a0
                  srli         s8, t3, 9
                  or           t4, a6, ra
                  c.sub        a5, a3
                  c.sub        a5, a3
                  srl          s3, a1, s4
                  c.srli       a5, 22
                  c.andi       a3, 13
                  c.and        a5, a1
                  c.andi       a3, 13
                  ori          s3, s3, 1495
                  sll          gp, s10, s11
                  remu         gp, a4, s3
                  sra          s3, t0, s9
                  remu         gp, a4, s3
                  c.sub        a5, a3
                  andi         gp, a0, 1810
                  sra          s3, t0, s9
                  c.nop
                  mulh         s1, a7, a6
                  slti         t3, t5, -1062
                  mulhu        t4, a3, s6
                  srai         a3, t6, 11
                  xori         a1, s1, 959
                  srl          s3, a1, s4
                  c.or         a5, a0
                  c.srli       a5, 22
                  c.slli       t1, 10
                  c.slli       t1, 10
                  andi         gp, a0, 1810
                  c.nop
                  addi         s7, t2, -1579
                  sra          s3, t0, s9
                  c.srli       a5, 22
                  divu         s2, a4, s3
                  c.nop
                  div          s8, a5, a2
                  c.add        s9, s7
                  c.xor        a2, s1
                  slli         sp, a1, 17
                  sltiu        s6, zero, -1665
                  and          sp, a0, gp
                  or           t4, a6, ra
                  divu         s2, a4, s3
                  c.lui        gp, 4
                  c.and        a5, a1
                  auipc        ra, 350999
                  c.addi4spn   s1, sp, 192
                  c.addi       s5, -1
                  sra          s3, t0, s9
                  srli         s8, t3, 9
                  div          s8, a5, a2
                  c.addi16sp   sp, 224
                  add          a2, t3, t2
                  srl          s3, a1, s4
                  sub          a2, a0, a7
                  or           t4, a6, ra
                  c.mv         t0, t6
                  addi         s7, t2, -1579
                  c.sub        a5, a3
                  c.srai       a1, 18
                  slti         t3, t5, -1062
                  xori         a1, s1, 959
                  c.addi16sp   sp, 224
                  sra          s3, t0, s9
                  mulhu        t4, a3, s6
                  ori          s3, s3, 1495
                  c.nop
                  mulhsu       sp, s0, t5
                  remu         gp, a4, s3
                  c.and        a5, a1
                  nop
                  c.addi16sp   sp, 224
                  c.slli       t1, 10
                  srai         a3, t6, 11
                  and          sp, a0, gp
                  slti         t3, t5, -1062
                  add          a2, t3, t2
                  c.and        a5, a1
                  mul          s5, zero, t4
                  div          s8, a5, a2
                  div          s8, a5, a2
                  c.mv         t0, t6
                  nop
                  c.or         a5, a0
                  xor          s6, gp, s0
                  c.srai       a1, 18
                  srli         s8, t3, 9
                  c.addi4spn   s1, sp, 192
                  c.nop
                  c.addi       s5, -1
                  mulh         s1, a7, a6
                  nop
                  xori         a1, s1, 959
                  sra          s3, t0, s9
                  mul          s5, zero, t4
                  addi         s7, t2, -1579
                  remu         gp, a4, s3
                  c.sub        a5, a3
                  add          a2, t3, t2
                  divu         s2, a4, s3
                  mul          s5, zero, t4
                  srl          s3, a1, s4
                  c.srli       a5, 22
                  srai         a3, t6, 11
                  srai         a3, t6, 11
                  slli         sp, a1, 17
                  rem          a3, s1, t6
                  sub          a2, a0, a7
                  c.or         a5, a0
                  c.addi       s5, -1
                  srl          s3, a1, s4
                  c.slli       t1, 10
                  slli         sp, a1, 17
                  ori          s3, s3, 1495
                  c.andi       a3, 13
                  ori          s3, s3, 1495
                  srai         a3, t6, 11
                  addi         s7, t2, -1579
                  srli         s8, t3, 9
                  auipc        ra, 350999
                  mulhu        t4, a3, s6
                  c.add        s9, s7
                  srai         a3, t6, 11
                  c.srli       a5, 22
                  remu         gp, a4, s3
                  xori         a1, s1, 959
                  c.add        s9, s7
                  c.srai       a1, 18
                  auipc        ra, 350999
                  mul          s5, zero, t4
                  c.slli       t1, 10
                  c.addi4spn   s1, sp, 192
                  addi         s7, t2, -1579
                  add          a2, t3, t2
                  and          sp, a0, gp
                  c.srai       a1, 18
                  c.andi       a3, 13
                  c.li         t2, 14
                  c.srli       a5, 22
                  srl          s3, a1, s4
                  slt          ra, a3, a1
                  addi         s7, t2, -1579
                  sll          gp, s10, s11
                  slli         sp, a1, 17
                  c.xor        a2, s1
                  c.andi       a3, 13
                  mul          s5, zero, t4
                  rem          a3, s1, t6
                  and          sp, a0, gp
                  divu         s2, a4, s3
                  srl          s3, a1, s4
                  sltiu        s6, zero, -1665
                  c.nop
                  c.srai       a1, 18
                  sra          s3, t0, s9
                  rem          a3, s1, t6
                  nop
                  and          sp, a0, gp
                  rem          a3, s1, t6
                  divu         s2, a4, s3
                  xori         a1, s1, 959
                  auipc        ra, 350999
                  c.srli       a5, 22
                  or           t4, a6, ra
                  addi         s7, t2, -1579
                  add          a2, t3, t2
                  sltiu        s6, zero, -1665
                  c.and        a5, a1
                  div          s8, a5, a2
                  andi         gp, a0, 1810
                  c.andi       a3, 13
                  auipc        ra, 350999
                  andi         gp, a0, 1810
                  mulhsu       sp, s0, t5
                  c.addi       s5, -1
                  divu         s2, a4, s3
                  c.nop
                  srl          s3, a1, s4
                  c.andi       a3, 13
                  xori         a1, s1, 959
                  c.sub        a5, a3
                  c.lui        gp, 4
                  rem          a3, s1, t6
                  div          s8, a5, a2
                  xor          s6, gp, s0
                  ori          s3, s3, 1495
                  mulhu        t4, a3, s6
                  c.nop
                  c.addi16sp   sp, 224
                  and          sp, a0, gp
                  sll          gp, s10, s11
                  sra          s3, t0, s9
                  c.nop
                  sub          a2, a0, a7
                  add          a2, t3, t2
                  nop
                  xori         a1, s1, 959
                  srai         a3, t6, 11
                  add          a2, t3, t2
                  c.srai       a1, 18
                  c.xor        a2, s1
                  c.add        s9, s7
                  auipc        ra, 350999
                  andi         gp, a0, 1810
                  andi         gp, a0, 1810
                  c.or         a5, a0
                  c.sub        a5, a3
                  slti         t3, t5, -1062
                  c.li         t2, 14
                  rem          a3, s1, t6
                  addi         s7, t2, -1579
                  rem          a3, s1, t6
                  c.srli       a5, 22
                  c.lui        gp, 4
                  c.li         t2, 14
                  c.srli       a5, 22
                  c.srli       a5, 22
                  mulhu        t4, a3, s6
                  c.nop
                  c.srli       a5, 22
                  andi         gp, a0, 1810
                  xor          s6, gp, s0
                  c.and        a5, a1
                  c.xor        a2, s1
                  andi         gp, a0, 1810
                  c.lui        gp, 4
                  c.addi       s5, -1
                  c.andi       a3, 13
                  c.addi       s5, -1
                  andi         gp, a0, 1810
                  remu         gp, a4, s3
                  c.addi       s5, -1
                  auipc        ra, 350999
                  srai         a3, t6, 11
                  mul          s5, zero, t4
                  remu         gp, a4, s3
                  c.addi4spn   s1, sp, 192
                  sltiu        s6, zero, -1665
                  mul          s5, zero, t4
                  c.addi16sp   sp, 224
                  ori          s3, s3, 1495
                  c.andi       a3, 13
                  srl          s3, a1, s4
                  slli         sp, a1, 17
                  mulhu        t4, a3, s6
                  sll          gp, s10, s11
                  sll          gp, s10, s11
                  c.sub        a5, a3
                  c.mv         t0, t6
                  sltiu        s6, zero, -1665
                  slli         sp, a1, 17
                  mulhu        t4, a3, s6
                  sra          s3, t0, s9
                  and          sp, a0, gp
                  c.srli       a5, 22
                  c.li         t2, 14
                  div          s8, a5, a2
                  slli         sp, a1, 17
                  auipc        ra, 350999
                  c.nop
                  srai         a3, t6, 11
                  c.addi       s5, -1
                  c.mv         t0, t6
                  slli         sp, a1, 17
                  addi         s7, t2, -1579
                  or           t4, a6, ra
                  c.slli       t1, 10
                  mul          s5, zero, t4
                  xori         a1, s1, 959
                  nop
                  sltu         t0, a4, t2
                  slti         t3, t5, -1062
                  slti         t3, t5, -1062
                  c.add        s9, s7
                  add          a2, t3, t2
                  c.srli       a5, 22
                  rem          a3, s1, t6
                  sll          gp, s10, s11
                  c.srai       a1, 18
                  mul          s5, zero, t4
                  xor          s6, gp, s0
                  div          s8, a5, a2
                  div          s8, a5, a2
                  div          s8, a5, a2
                  mulhu        t4, a3, s6
                  c.or         a5, a0
                  xor          s6, gp, s0
                  divu         s2, a4, s3
                  c.li         t2, 14
                  div          s8, a5, a2
                  remu         gp, a4, s3
                  c.lui        gp, 4
                  c.add        s9, s7
                  xor          s6, gp, s0
                  c.mv         t0, t6
                  srli         s8, t3, 9
                  sub          a2, a0, a7
                  c.and        a5, a1
                  or           t4, a6, ra
                  c.sub        a5, a3
                  xori         a1, s1, 959
                  mulh         s1, a7, a6
                  slt          ra, a3, a1
                  c.and        a5, a1
                  auipc        ra, 350999
                  c.addi16sp   sp, 224
                  c.xor        a2, s1
                  c.addi4spn   s1, sp, 192
                  mulhu        t4, a3, s6
                  c.nop
                  c.li         t2, 14
                  c.or         a5, a0
                  rem          a3, s1, t6
                  slt          ra, a3, a1
                  remu         gp, a4, s3
                  lui          a2, 460343
                  c.srli       a5, 22
                  slli         sp, a1, 17
                  c.srli       a5, 22
                  sltu         t0, a4, t2
                  div          s8, a5, a2
                  lui          a2, 460343
                  mulhsu       sp, s0, t5
                  sltiu        s6, zero, -1665
                  sub          a2, a0, a7
                  remu         gp, a4, s3
                  mulh         s1, a7, a6
                  srai         a3, t6, 11
                  slli         sp, a1, 17
                  c.addi16sp   sp, 224
                  c.lui        gp, 4
                  c.srli       a5, 22
                  remu         gp, a4, s3
                  auipc        ra, 350999
                  c.srli       a5, 22
                  c.lui        gp, 4
                  c.addi16sp   sp, 224
                  c.nop
                  xor          s6, gp, s0
                  divu         s2, a4, s3
                  c.srli       a5, 22
                  sltiu        s6, zero, -1665
                  mulh         s1, a7, a6
                  mulhu        t4, a3, s6
                  addi         s7, t2, -1579
                  sra          s3, t0, s9
                  c.slli       t1, 10
                  divu         s2, a4, s3
                  c.srai       a1, 18
                  c.srai       a1, 18
                  andi         gp, a0, 1810
                  andi         gp, a0, 1810
                  xori         a1, s1, 959
                  c.srai       a1, 18
                  srli         s8, t3, 9
                  nop
                  xori         a1, s1, 959
                  mul          s5, zero, t4
                  and          sp, a0, gp
                  c.li         t2, 14
                  c.mv         t0, t6
                  auipc        ra, 350999
                  c.addi4spn   s1, sp, 192
                  c.srli       a5, 22
                  or           t4, a6, ra
                  xor          s6, gp, s0
                  sub          a2, a0, a7
                  c.addi4spn   s1, sp, 192
                  sltu         t0, a4, t2
                  c.xor        a2, s1
                  lui          a2, 460343
                  c.li         t2, 14
                  div          s8, a5, a2
                  slti         t3, t5, -1062
                  sll          gp, s10, s11
                  c.srli       a5, 22
                  xor          s6, gp, s0
                  c.xor        a2, s1
                  srl          s3, a1, s4
                  c.addi16sp   sp, 224
                  c.srli       a5, 22
                  slti         t3, t5, -1062
                  srai         a3, t6, 11
                  c.lui        gp, 4
                  lui          a2, 460343
                  c.slli       t1, 10
                  or           t4, a6, ra
                  ori          s3, s3, 1495
                  c.andi       a3, 13
                  divu         s2, a4, s3
                  xor          s6, gp, s0
                  c.srli       a5, 22
                  sra          s3, t0, s9
                  c.xor        a2, s1
                  mulh         s1, a7, a6
                  c.or         a5, a0
                  sltiu        s6, zero, -1665
                  c.or         a5, a0
                  slt          ra, a3, a1
                  c.lui        gp, 4
                  c.srai       a1, 18
                  divu         s2, a4, s3
                  c.addi16sp   sp, 224
                  nop
                  c.mv         t0, t6
                  c.slli       t1, 10
                  slti         t3, t5, -1062
                  or           t4, a6, ra
                  c.or         a5, a0
                  remu         gp, a4, s3
                  divu         s2, a4, s3
                  divu         s2, a4, s3
                  c.nop
                  sub          a2, a0, a7
                  sub          a2, a0, a7
                  nop
                  srl          s3, a1, s4
                  slt          ra, a3, a1
                  xori         a1, s1, 959
                  remu         gp, a4, s3
                  c.srai       a1, 18
                  xor          s6, gp, s0
                  sll          gp, s10, s11
                  c.lui        gp, 4
                  slt          ra, a3, a1
                  ori          s3, s3, 1495
                  divu         s2, a4, s3
                  srai         a3, t6, 11
                  c.addi       s5, -1
                  mulh         s1, a7, a6
                  c.add        s9, s7
                  c.addi16sp   sp, 224
                  sltu         t0, a4, t2
                  c.or         a5, a0
                  mul          s5, zero, t4
                  div          s8, a5, a2
                  ori          s3, s3, 1495
                  sub          a2, a0, a7
                  c.addi16sp   sp, 224
                  c.li         t2, 14
                  sltiu        s6, zero, -1665
                  c.nop
                  ori          s3, s3, 1495
                  sra          s3, t0, s9
                  c.andi       a3, 13
                  ori          s3, s3, 1495
                  andi         gp, a0, 1810
                  c.sub        a5, a3
                  sltu         t0, a4, t2
                  c.srai       a1, 18
                  divu         s2, a4, s3
                  auipc        ra, 350999
                  auipc        ra, 350999
                  or           t4, a6, ra
                  c.srli       a5, 22
                  c.srai       a1, 18
                  c.and        a5, a1
                  mulh         s1, a7, a6
                  c.and        a5, a1
                  div          s8, a5, a2
                  sll          gp, s10, s11
                  c.addi       s5, -1
                  srli         s8, t3, 9
                  mul          s5, zero, t4
                  c.mv         t0, t6
                  c.addi16sp   sp, 224
                  c.mv         t0, t6
                  c.add        s9, s7
                  or           t4, a6, ra
                  c.nop
                  mul          s5, zero, t4
                  c.srai       a1, 18
                  sll          gp, s10, s11
                  c.andi       a3, 13
                  rem          a3, s1, t6
                  srli         s8, t3, 9
                  auipc        ra, 350999
                  slli         sp, a1, 17
                  mul          s5, zero, t4
                  c.srli       a5, 22
                  rem          a3, s1, t6
                  c.srai       a1, 18
                  mulh         s1, a7, a6
                  c.nop
                  sub          a2, a0, a7
                  srli         s8, t3, 9
                  remu         gp, a4, s3
                  nop
                  c.add        s9, s7
                  auipc        ra, 350999
                  srli         s8, t3, 9
                  mulhu        t4, a3, s6
                  c.addi4spn   s1, sp, 192
                  srai         a3, t6, 11
                  mulhu        t4, a3, s6
                  c.srai       a1, 18
                  mul          s5, zero, t4
                  addi         s7, t2, -1579
                  mulh         s1, a7, a6
                  c.addi16sp   sp, 224
                  sub          a2, a0, a7
                  slli         sp, a1, 17
                  sll          gp, s10, s11
                  slt          ra, a3, a1
                  slli         sp, a1, 17
                  sll          gp, s10, s11
                  and          sp, a0, gp
                  c.addi4spn   s1, sp, 192
                  c.slli       t1, 10
                  c.lui        gp, 4
                  c.addi4spn   s1, sp, 192
                  c.slli       t1, 10
                  and          sp, a0, gp
                  c.addi4spn   s1, sp, 192
                  ori          s3, s3, 1495
                  mulhsu       sp, s0, t5
                  addi         s7, t2, -1579
                  divu         s2, a4, s3
                  c.andi       a3, 13
                  remu         gp, a4, s3
                  c.andi       a3, 13
                  and          sp, a0, gp
                  c.slli       t1, 10
                  mulh         s1, a7, a6
                  c.xor        a2, s1
                  c.and        a5, a1
                  slli         sp, a1, 17
                  c.addi4spn   s1, sp, 192
                  mulh         s1, a7, a6
                  srli         s8, t3, 9
                  c.addi16sp   sp, 224
                  divu         s2, a4, s3
                  c.addi4spn   s1, sp, 192
                  lui          a2, 460343
                  div          s8, a5, a2
                  mulhu        t4, a3, s6
                  c.srai       a1, 18
                  xori         a1, s1, 959
                  c.lui        gp, 4
                  rem          a3, s1, t6
                  or           t4, a6, ra
                  divu         s2, a4, s3
                  c.li         t2, 14
                  andi         gp, a0, 1810
                  c.nop
                  or           t4, a6, ra
                  sra          s3, t0, s9
                  c.lui        gp, 4
                  sll          gp, s10, s11
                  c.addi       s5, -1
                  xori         a1, s1, 959
                  sra          s3, t0, s9
                  nop
                  andi         gp, a0, 1810
                  sltiu        s6, zero, -1665
                  slt          ra, a3, a1
                  c.addi       s5, -1
                  rem          a3, s1, t6
                  c.andi       a3, 13
                  srli         s8, t3, 9
                  c.addi16sp   sp, 224
                  sltiu        s6, zero, -1665
                  ori          s3, s3, 1495
                  srli         s8, t3, 9
                  sltiu        s6, zero, -1665
                  srl          s3, a1, s4
                  slli         sp, a1, 17
                  c.mv         t0, t6
                  c.xor        a2, s1
                  xori         a1, s1, 959
                  slt          ra, a3, a1
                  divu         s2, a4, s3
                  lui          a2, 460343
                  c.and        a5, a1
                  xori         a1, s1, 959
                  mulhu        t4, a3, s6
                  mulhsu       sp, s0, t5
                  c.xor        a2, s1
                  sltiu        s6, zero, -1665
                  c.li         t2, 14
                  xori         a1, s1, 959
                  c.nop
                  c.addi       s5, -1
                  div          s8, a5, a2
                  slti         t3, t5, -1062
                  c.addi16sp   sp, 224
                  c.and        a5, a1
                  slti         t3, t5, -1062
                  c.or         a5, a0
                  ori          s3, s3, 1495
                  mulhsu       sp, s0, t5
                  c.slli       t1, 10
                  divu         s2, a4, s3
                  c.or         a5, a0
                  nop
                  c.srai       a1, 18
                  mulhu        t4, a3, s6
                  mulhu        t4, a3, s6
                  sltu         t0, a4, t2
                  remu         gp, a4, s3
                  sltu         t0, a4, t2
                  nop
                  c.xor        a2, s1
                  add          a2, t3, t2
                  slti         t3, t5, -1062
                  srli         s8, t3, 9
                  or           t4, a6, ra
                  c.nop
                  and          sp, a0, gp
                  or           t4, a6, ra
                  sltu         t0, a4, t2
                  divu         s2, a4, s3
                  c.addi       s5, -1
                  remu         gp, a4, s3
                  div          s8, a5, a2
                  xori         a1, s1, 959
                  xori         a1, s1, 959
                  srli         s8, t3, 9
                  srli         s8, t3, 9
                  slli         sp, a1, 17
                  c.add        s9, s7
                  mulhsu       sp, s0, t5
                  mulh         s1, a7, a6
                  sltiu        s6, zero, -1665
                  sltiu        s6, zero, -1665
                  or           t4, a6, ra
                  div          s8, a5, a2
                  div          s8, a5, a2
                  or           t4, a6, ra
                  remu         gp, a4, s3
                  c.and        a5, a1
                  sll          gp, s10, s11
                  slti         t3, t5, -1062
                  divu         s2, a4, s3
                  c.srai       a1, 18
                  c.srai       a1, 18
                  srai         a3, t6, 11
                  and          sp, a0, gp
                  c.mv         t0, t6
                  srai         a3, t6, 11
                  c.and        a5, a1
                  mulh         s1, a7, a6
                  c.slli       t1, 10
                  add          a2, t3, t2
                  c.addi4spn   s1, sp, 192
                  c.nop
                  c.add        s9, s7
                  c.addi       s5, -1
                  mulhu        t4, a3, s6
                  lui          a2, 460343
                  c.add        s9, s7
                  sltiu        s6, zero, -1665
                  or           t4, a6, ra
                  c.li         t2, 14
                  c.li         t2, 14
                  mulhsu       sp, s0, t5
                  nop
                  ori          s3, s3, 1495
                  c.li         t2, 14
                  c.addi       s5, -1
                  mulhsu       sp, s0, t5
                  addi         s7, t2, -1579
                  c.sub        a5, a3
                  c.li         t2, 14
                  divu         s2, a4, s3
                  c.xor        a2, s1
                  c.andi       a3, 13
                  c.srli       a5, 22
                  sll          gp, s10, s11
                  xori         a1, s1, 959
                  c.add        s9, s7
                  remu         gp, a4, s3
                  and          sp, a0, gp
                  div          s8, a5, a2
                  c.xor        a2, s1
                  c.add        s9, s7
                  c.li         t2, 14
                  c.mv         t0, t6
                  addi         s7, t2, -1579
                  c.sub        a5, a3
                  c.addi4spn   s1, sp, 192
                  c.xor        a2, s1
                  xor          s6, gp, s0
                  c.nop
                  c.sub        a5, a3
                  sra          s3, t0, s9
                  addi         s7, t2, -1579
                  srli         s8, t3, 9
                  c.nop
                  nop
                  sltu         t0, a4, t2
                  srl          s3, a1, s4
                  slti         t3, t5, -1062
                  mulhsu       sp, s0, t5
                  ori          s3, s3, 1495
                  c.li         t2, 14
                  c.lui        gp, 4
                  xor          s6, gp, s0
                  c.nop
                  c.nop
                  c.srai       a1, 18
                  add          a2, t3, t2
                  c.add        s9, s7
                  mulh         s1, a7, a6
                  sltiu        s6, zero, -1665
                  srli         s8, t3, 9
                  ori          s3, s3, 1495
                  c.addi16sp   sp, 224
                  c.sub        a5, a3
                  c.and        a5, a1
                  xor          s6, gp, s0
                  c.nop
                  c.li         t2, 14
                  rem          a3, s1, t6
                  c.addi4spn   s1, sp, 192
                  sltiu        s6, zero, -1665
                  add          a2, t3, t2
                  divu         s2, a4, s3
                  sub          a2, a0, a7
                  c.addi16sp   sp, 224
                  xori         a1, s1, 959
                  slli         sp, a1, 17
                  xor          s6, gp, s0
                  c.xor        a2, s1
                  srli         s8, t3, 9
                  sll          gp, s10, s11
                  c.nop
                  lui          a2, 460343
                  c.li         t2, 14
                  slt          ra, a3, a1
                  slli         sp, a1, 17
                  c.sub        a5, a3
                  mulh         s1, a7, a6
                  c.lui        gp, 4
                  srai         a3, t6, 11
                  sra          s3, t0, s9
                  mulhu        t4, a3, s6
                  sltiu        s6, zero, -1665
                  mulhsu       sp, s0, t5
                  slti         t3, t5, -1062
                  lui          a2, 460343
                  div          s8, a5, a2
                  mulh         s1, a7, a6
                  sub          a2, a0, a7
                  or           t4, a6, ra
                  or           t4, a6, ra
                  c.srai       a1, 18
                  mul          s5, zero, t4
                  sra          s3, t0, s9
                  and          sp, a0, gp
                  c.xor        a2, s1
                  div          s8, a5, a2
                  slti         t3, t5, -1062
                  mul          s5, zero, t4
                  c.srai       a1, 18
                  c.addi16sp   sp, 224
                  sll          gp, s10, s11
                  srl          s3, a1, s4
                  c.and        a5, a1
                  xor          s6, gp, s0
                  sra          s3, t0, s9
                  divu         s2, a4, s3
                  sll          gp, s10, s11
                  srl          s3, a1, s4
                  c.nop
                  c.addi16sp   sp, 224
                  srli         s8, t3, 9
                  c.srai       a1, 18
                  c.srli       a5, 22
                  mulh         s1, a7, a6
                  and          sp, a0, gp
                  slti         t3, t5, -1062
                  c.sub        a5, a3
                  nop
                  rem          a3, s1, t6
                  c.srli       a5, 22
                  divu         s2, a4, s3
                  mul          s5, zero, t4
                  c.addi16sp   sp, 224
                  add          a2, t3, t2
                  rem          a3, s1, t6
                  c.slli       t1, 10
                  xori         a1, s1, 959
                  c.addi       s5, -1
                  slt          ra, a3, a1
                  xor          s6, gp, s0
                  c.sub        a5, a3
                  slti         t3, t5, -1062
                  sra          s3, t0, s9
                  c.xor        a2, s1
                  c.srai       a1, 18
                  c.add        s9, s7
                  c.xor        a2, s1
                  c.lui        gp, 4
                  xor          s6, gp, s0
                  c.and        a5, a1
                  srli         s8, t3, 9
                  slti         t3, t5, -1062
                  mulhsu       sp, s0, t5
                  auipc        ra, 350999
                  c.and        a5, a1
                  addi         s7, t2, -1579
                  xori         a1, s1, 959
                  c.addi16sp   sp, 224
                  c.andi       a3, 13
                  mulhsu       sp, s0, t5
                  sub          a2, a0, a7
                  remu         gp, a4, s3
                  auipc        ra, 350999
                  c.addi16sp   sp, 224
                  mul          s5, zero, t4
                  slli         sp, a1, 17
                  c.addi16sp   sp, 224
                  mulhsu       sp, s0, t5
                  c.or         a5, a0
                  slt          ra, a3, a1
                  sub          a2, a0, a7
                  mul          s5, zero, t4
                  and          sp, a0, gp
                  remu         gp, a4, s3
                  c.and        a5, a1
                  srai         a3, t6, 11
                  mulhsu       sp, s0, t5
                  andi         gp, a0, 1810
                  xori         a1, s1, 959
                  sltu         t0, a4, t2
                  srli         s8, t3, 9
                  slli         sp, a1, 17
                  c.addi       s5, -1
                  c.srli       a5, 22
                  or           t4, a6, ra
                  auipc        ra, 350999
                  c.or         a5, a0
                  auipc        ra, 350999
                  and          sp, a0, gp
                  c.li         t2, 14
                  c.srai       a1, 18
                  xori         a1, s1, 959
                  sltu         t0, a4, t2
                  c.slli       t1, 10
                  c.srli       a5, 22
                  slti         t3, t5, -1062
                  c.srai       a1, 18
                  div          s8, a5, a2
                  mulhsu       sp, s0, t5
                  c.slli       t1, 10
                  nop
                  sltu         t0, a4, t2
                  c.add        s9, s7
                  c.srli       a5, 22
                  c.addi16sp   sp, 224
                  sub          a2, a0, a7
                  c.nop
                  sra          s3, t0, s9
                  sra          s3, t0, s9
                  mul          s5, zero, t4
                  c.srli       a5, 22
                  c.mv         t0, t6
                  slt          ra, a3, a1
                  c.nop
                  ori          s3, s3, 1495
                  c.sub        a5, a3
                  c.and        a5, a1
                  c.mv         t0, t6
                  xori         a1, s1, 959
                  div          s8, a5, a2
                  c.addi4spn   s1, sp, 192
                  div          s8, a5, a2
                  and          sp, a0, gp
                  c.addi16sp   sp, 224
                  srl          s3, a1, s4
                  c.mv         t0, t6
                  remu         gp, a4, s3
                  srli         s8, t3, 9
                  mul          s5, zero, t4
                  slt          ra, a3, a1
                  c.nop
                  c.and        a5, a1
                  c.and        a5, a1
                  sub          a2, a0, a7
                  and          sp, a0, gp
                  c.lui        gp, 4
                  slt          ra, a3, a1
                  c.and        a5, a1
                  sltiu        s6, zero, -1665
                  lui          a2, 460343
                  c.xor        a2, s1
                  slti         t3, t5, -1062
                  srli         s8, t3, 9
                  c.and        a5, a1
                  div          s8, a5, a2
                  sltu         t0, a4, t2
                  c.slli       t1, 10
                  c.lui        gp, 4
                  c.mv         t0, t6
                  srl          s3, a1, s4
                  mulhsu       sp, s0, t5
                  xor          s6, gp, s0
                  c.xor        a2, s1
                  xor          s6, gp, s0
                  c.slli       t1, 10
                  xori         a1, s1, 959
                  c.srai       a1, 18
                  andi         gp, a0, 1810
                  xor          s6, gp, s0
                  c.andi       a3, 13
                  nop
                  slli         sp, a1, 17
                  c.li         t2, 14
                  mulhsu       sp, s0, t5
                  sltiu        s6, zero, -1665
                  auipc        ra, 350999
                  sltu         t0, a4, t2
                  srai         a3, t6, 11
                  c.addi16sp   sp, 224
                  c.xor        a2, s1
                  c.or         a5, a0
                  nop
                  mulhu        t4, a3, s6
                  c.andi       a3, 13
                  slli         sp, a1, 17
                  c.xor        a2, s1
                  c.srai       a1, 18
                  c.addi4spn   s1, sp, 192
                  sll          gp, s10, s11
                  srli         s8, t3, 9
                  andi         gp, a0, 1810
                  slt          ra, a3, a1
                  addi         s7, t2, -1579
                  slt          ra, a3, a1
                  ori          s3, s3, 1495
                  srli         s8, t3, 9
                  c.addi16sp   sp, 224
                  srl          s3, a1, s4
                  c.andi       a3, 13
                  auipc        ra, 350999
                  mulhsu       sp, s0, t5
                  remu         gp, a4, s3
                  sll          gp, s10, s11
                  c.addi       s5, -1
                  mulhu        t4, a3, s6
                  nop
                  srai         a3, t6, 11
                  or           t4, a6, ra
                  c.xor        a2, s1
                  c.or         a5, a0
                  c.lui        gp, 4
                  sltiu        s6, zero, -1665
                  divu         s2, a4, s3
                  c.or         a5, a0
                  ori          s3, s3, 1495
                  c.or         a5, a0
                  c.mv         t0, t6
                  sub          a2, a0, a7
                  c.lui        gp, 4
                  xori         a1, s1, 959
                  auipc        ra, 350999
                  auipc        ra, 350999
                  c.lui        gp, 4
                  sra          s3, t0, s9
                  mulhu        t4, a3, s6
                  mulhsu       sp, s0, t5
                  slt          ra, a3, a1
                  nop
                  sub          a2, a0, a7
                  lui          a2, 460343
                  xor          s6, gp, s0
                  c.addi16sp   sp, 224
                  rem          a3, s1, t6
                  slli         sp, a1, 17
                  auipc        ra, 350999
                  slt          ra, a3, a1
                  sltu         t0, a4, t2
                  or           t4, a6, ra
                  srai         a3, t6, 11
                  or           t4, a6, ra
                  c.addi       s5, -1
                  srai         a3, t6, 11
                  addi         s7, t2, -1579
                  c.or         a5, a0
                  sll          gp, s10, s11
                  or           t4, a6, ra
                  c.srai       a1, 18
                  c.or         a5, a0
                  sltiu        s6, zero, -1665
                  auipc        ra, 350999
                  c.mv         t0, t6
                  and          sp, a0, gp
                  slt          ra, a3, a1
                  addi         s7, t2, -1579
                  c.li         t2, 14
                  c.addi4spn   s1, sp, 192
                  auipc        ra, 350999
                  c.mv         t0, t6
                  slti         t3, t5, -1062
                  nop
                  sub          a2, a0, a7
                  c.slli       t1, 10
                  andi         gp, a0, 1810
                  mul          s5, zero, t4
                  addi         s7, t2, -1579
                  and          sp, a0, gp
                  c.add        s9, s7
                  c.or         a5, a0
                  auipc        ra, 350999
                  sll          gp, s10, s11
                  nop
                  xor          s6, gp, s0
                  sltiu        s6, zero, -1665
                  c.srai       a1, 18
                  c.addi4spn   s1, sp, 192
                  xor          s6, gp, s0
                  mulh         s1, a7, a6
                  srl          s3, a1, s4
                  sltiu        s6, zero, -1665
                  srli         s8, t3, 9
                  auipc        ra, 350999
                  mulhsu       sp, s0, t5
                  and          sp, a0, gp
                  c.srai       a1, 18
                  nop
                  c.sub        a5, a3
                  sltu         t0, a4, t2
                  c.li         t2, 14
                  slti         t3, t5, -1062
                  c.li         t2, 14
                  srl          s3, a1, s4
                  c.or         a5, a0
                  c.srai       a1, 18
                  c.addi       s5, -1
                  add          a2, t3, t2
                  ori          s3, s3, 1495
                  xori         a1, s1, 959
                  c.andi       a3, 13
                  sltu         t0, a4, t2
                  c.li         t2, 14
                  slt          ra, a3, a1
                  lui          a2, 460343
                  c.nop
                  div          s8, a5, a2
                  sra          s3, t0, s9
                  c.andi       a3, 13
                  or           t4, a6, ra
                  add          a2, t3, t2
                  c.andi       a3, 13
                  remu         gp, a4, s3
                  srli         s8, t3, 9
                  c.srli       a5, 22
                  ori          s3, s3, 1495
                  mul          s5, zero, t4
                  c.addi       s5, -1
                  c.xor        a2, s1
                  c.srai       a1, 18
                  ori          s3, s3, 1495
                  c.srli       a5, 22
                  div          s8, a5, a2
                  slti         t3, t5, -1062
                  sll          gp, s10, s11
                  auipc        ra, 350999
                  div          s8, a5, a2
                  c.srli       a5, 22
                  div          s8, a5, a2
                  andi         gp, a0, 1810
                  mulhu        t4, a3, s6
                  c.sub        a5, a3
                  rem          a3, s1, t6
                  c.srai       a1, 18
                  c.mv         t0, t6
                  c.lui        gp, 4
                  sub          a2, a0, a7
                  mulh         s1, a7, a6
                  c.and        a5, a1
                  div          s8, a5, a2
                  sub          a2, a0, a7
                  srl          s3, a1, s4
                  rem          a3, s1, t6
                  c.srai       a1, 18
                  c.nop
                  nop
                  c.addi4spn   s1, sp, 192
                  c.slli       t1, 10
                  c.addi16sp   sp, 224
                  slli         sp, a1, 17
                  mulhu        t4, a3, s6
                  addi         s7, t2, -1579
                  sltu         t0, a4, t2
                  rem          a3, s1, t6
                  mulh         s1, a7, a6
                  divu         s2, a4, s3
                  c.xor        a2, s1
                  sltiu        s6, zero, -1665
                  mul          s5, zero, t4
                  addi         s7, t2, -1579
                  c.or         a5, a0
                  c.xor        a2, s1
                  nop
                  xor          s6, gp, s0
                  xor          s6, gp, s0
                  c.or         a5, a0
                  div          s8, a5, a2
                  nop
                  slti         t3, t5, -1062
                  c.li         t2, 14
                  divu         s2, a4, s3
                  c.mv         t0, t6
                  addi         s7, t2, -1579
                  xori         a1, s1, 959
                  sub          a2, a0, a7
                  sll          gp, s10, s11
                  xori         a1, s1, 959
                  sltiu        s6, zero, -1665
                  addi         s7, t2, -1579
                  c.slli       t1, 10
                  xor          s6, gp, s0
                  srai         a3, t6, 11
                  rem          a3, s1, t6
                  mulh         s1, a7, a6
                  mul          s5, zero, t4
                  rem          a3, s1, t6
                  divu         s2, a4, s3
                  mulhsu       sp, s0, t5
                  c.addi16sp   sp, 224
                  c.andi       a3, 13
                  ori          s3, s3, 1495
                  srli         s8, t3, 9
                  c.addi4spn   s1, sp, 192
                  c.sub        a5, a3
                  srl          s3, a1, s4
                  xori         a1, s1, 959
                  c.addi4spn   s1, sp, 192
                  srl          s3, a1, s4
                  auipc        ra, 350999
                  c.slli       t1, 10
                  or           t4, a6, ra
                  auipc        ra, 350999
                  and          sp, a0, gp
                  and          sp, a0, gp
                  divu         s2, a4, s3
                  sltiu        s6, zero, -1665
                  sra          s3, t0, s9
                  sra          s3, t0, s9
                  divu         s2, a4, s3
                  add          a2, t3, t2
                  c.lui        gp, 4
                  slt          ra, a3, a1
                  c.mv         t0, t6
                  c.or         a5, a0
                  sll          gp, s10, s11
                  c.lui        gp, 4
                  slti         t3, t5, -1062
                  c.sub        a5, a3
                  c.addi4spn   s1, sp, 192
                  divu         s2, a4, s3
                  xori         a1, s1, 959
                  c.li         t2, 14
                  c.srai       a1, 18
                  sll          gp, s10, s11
                  c.or         a5, a0
                  lui          a2, 460343
                  and          sp, a0, gp
                  c.srli       a5, 22
                  slti         t3, t5, -1062
                  slli         sp, a1, 17
                  div          s8, a5, a2
                  srl          s3, a1, s4
                  c.addi16sp   sp, 224
                  andi         gp, a0, 1810
                  c.xor        a2, s1
                  divu         s2, a4, s3
                  remu         gp, a4, s3
                  mul          s5, zero, t4
                  c.nop
                  xori         a1, s1, 959
                  remu         gp, a4, s3
                  mulh         s1, a7, a6
                  nop
                  sub          a2, a0, a7
                  c.or         a5, a0
                  lui          a2, 460343
                  auipc        ra, 350999
                  sra          s3, t0, s9
                  slli         sp, a1, 17
                  mulh         s1, a7, a6
                  c.addi       s5, -1
                  c.nop
                  add          a2, t3, t2
                  c.addi       s5, -1
                  sub          a2, a0, a7
                  mulhu        t4, a3, s6
                  c.li         t2, 14
                  auipc        ra, 350999
                  c.xor        a2, s1
                  c.sub        a5, a3
                  add          a2, t3, t2
                  c.addi       s5, -1
                  mulh         s1, a7, a6
                  c.and        a5, a1
                  c.and        a5, a1
                  c.srai       a1, 18
                  and          sp, a0, gp
                  c.or         a5, a0
                  divu         s2, a4, s3
                  lui          a2, 460343
                  c.or         a5, a0
                  remu         gp, a4, s3
                  c.mv         t0, t6
                  or           t4, a6, ra
                  c.slli       t1, 10
                  mulhsu       sp, s0, t5
                  c.addi       s5, -1
                  c.mv         t0, t6
                  c.sub        a5, a3
                  srli         s8, t3, 9
                  remu         gp, a4, s3
                  slti         t3, t5, -1062
                  c.slli       t1, 10
                  auipc        ra, 350999
                  div          s8, a5, a2
                  xor          s6, gp, s0
                  lui          a2, 460343
                  c.mv         t0, t6
                  c.xor        a2, s1
                  srai         a3, t6, 11
                  auipc        ra, 350999
                  c.li         t2, 14
                  c.addi4spn   s1, sp, 192
                  c.mv         t0, t6
                  srli         s8, t3, 9
                  add          a2, t3, t2
                  rem          a3, s1, t6
                  sltiu        s6, zero, -1665
                  c.addi4spn   s1, sp, 192
                  c.addi16sp   sp, 224
                  andi         gp, a0, 1810
                  sltu         t0, a4, t2
                  and          sp, a0, gp
                  srl          s3, a1, s4
                  addi         s7, t2, -1579
                  ori          s3, s3, 1495
                  remu         gp, a4, s3
                  sltu         t0, a4, t2
                  sub          a2, a0, a7
                  slli         sp, a1, 17
                  mul          s5, zero, t4
                  sltiu        s6, zero, -1665
                  or           t4, a6, ra
                  srai         a3, t6, 11
                  c.nop
                  slti         t3, t5, -1062
                  lui          a2, 460343
                  srai         a3, t6, 11
                  srli         s8, t3, 9
                  mulhsu       sp, s0, t5
                  mulhu        t4, a3, s6
                  mulhsu       sp, s0, t5
                  c.srli       a5, 22
                  c.xor        a2, s1
                  c.andi       a3, 13
                  c.lui        gp, 4
                  mul          s5, zero, t4
                  andi         gp, a0, 1810
                  ori          s3, s3, 1495
                  lui          a2, 460343
                  mul          s5, zero, t4
                  c.andi       a3, 13
                  mulhu        t4, a3, s6
                  rem          a3, s1, t6
                  c.xor        a2, s1
                  div          s8, a5, a2
                  xor          s6, gp, s0
                  mul          s5, zero, t4
                  slt          ra, a3, a1
                  c.addi16sp   sp, 224
                  mulh         s1, a7, a6
                  sub          a2, a0, a7
                  c.xor        a2, s1
                  c.andi       a3, 13
                  and          sp, a0, gp
                  mulhsu       sp, s0, t5
                  sltiu        s6, zero, -1665
                  c.addi       s5, -1
                  divu         s2, a4, s3
                  mulhsu       sp, s0, t5
                  add          a2, t3, t2
                  divu         s2, a4, s3
                  slti         t3, t5, -1062
                  c.li         t2, 14
                  c.and        a5, a1
                  c.andi       a3, 13
                  sll          gp, s10, s11
                  remu         gp, a4, s3
                  remu         gp, a4, s3
                  c.lui        gp, 4
                  c.srli       a5, 22
                  lui          a2, 460343
                  slti         t3, t5, -1062
                  div          s8, a5, a2
                  c.addi16sp   sp, 224
                  srai         a3, t6, 11
                  addi         s7, t2, -1579
                  c.srli       a5, 22
                  c.li         t2, 14
                  c.slli       t1, 10
                  sll          gp, s10, s11
                  addi         s7, t2, -1579
                  c.and        a5, a1
                  c.mv         t0, t6
                  xor          s6, gp, s0
                  lui          a2, 460343
                  c.andi       a3, 13
                  add          a2, t3, t2
                  slli         sp, a1, 17
                  or           t4, a6, ra
                  c.srli       a5, 22
                  divu         s2, a4, s3
                  srl          s3, a1, s4
                  mulhsu       sp, s0, t5
                  slli         sp, a1, 17
                  mulhu        t4, a3, s6
                  divu         s2, a4, s3
                  xori         a1, s1, 959
                  sll          gp, s10, s11
                  c.mv         t0, t6
                  c.srai       a1, 18
                  sltiu        s6, zero, -1665
                  mul          s5, zero, t4
                  c.xor        a2, s1
                  divu         s2, a4, s3
                  c.addi       s5, -1
                  c.slli       t1, 10
                  slti         t3, t5, -1062
                  c.and        a5, a1
                  c.addi16sp   sp, 224
                  c.addi16sp   sp, 224
                  c.addi       s5, -1
                  c.slli       t1, 10
                  mulhsu       sp, s0, t5
                  c.or         a5, a0
                  ori          s3, s3, 1495
                  xori         a1, s1, 959
                  lui          a2, 460343
                  c.nop
                  or           t4, a6, ra
                  c.lui        gp, 4
                  lui          a2, 460343
                  srli         s8, t3, 9
                  sltiu        s6, zero, -1665
                  c.slli       t1, 10
                  or           t4, a6, ra
                  sltu         t0, a4, t2
                  xori         a1, s1, 959
                  auipc        ra, 350999
                  c.or         a5, a0
                  c.andi       a3, 13
                  xor          s6, gp, s0
                  c.and        a5, a1
                  slli         sp, a1, 17
                  addi         s7, t2, -1579
                  mulh         s1, a7, a6
                  mul          s5, zero, t4
                  c.addi       s5, -1
                  sltu         t0, a4, t2
                  c.li         t2, 14
                  sra          s3, t0, s9
                  srli         s8, t3, 9
                  or           t4, a6, ra
                  c.addi4spn   s1, sp, 192
                  add          a2, t3, t2
                  sll          gp, s10, s11
                  c.addi       s5, -1
                  sub          a2, a0, a7
                  slti         t3, t5, -1062
                  sll          gp, s10, s11
                  nop
                  lui          a2, 460343
                  sub          a2, a0, a7
                  rem          a3, s1, t6
                  c.and        a5, a1
                  c.or         a5, a0
                  c.addi16sp   sp, 224
                  rem          a3, s1, t6
                  c.sub        a5, a3
                  c.or         a5, a0
                  div          s8, a5, a2
                  sltu         t0, a4, t2
                  div          s8, a5, a2
                  c.add        s9, s7
                  mulhsu       sp, s0, t5
                  remu         gp, a4, s3
                  auipc        ra, 350999
                  c.addi4spn   s1, sp, 192
                  c.slli       t1, 10
                  c.srai       a1, 18
                  srli         s8, t3, 9
                  c.sub        a5, a3
                  c.mv         t0, t6
                  c.or         a5, a0
                  nop
                  srai         a3, t6, 11
                  xor          s6, gp, s0
                  div          s8, a5, a2
                  or           t4, a6, ra
                  nop
                  sltiu        s6, zero, -1665
                  c.sub        a5, a3
                  slli         sp, a1, 17
                  slt          ra, a3, a1
                  auipc        ra, 350999
                  sra          s3, t0, s9
                  c.addi       s5, -1
                  c.andi       a3, 13
                  or           t4, a6, ra
                  c.sub        a5, a3
                  c.add        s9, s7
                  c.or         a5, a0
                  c.slli       t1, 10
                  c.addi       s5, -1
                  auipc        ra, 350999
                  c.addi4spn   s1, sp, 192
                  c.add        s9, s7
                  sltiu        s6, zero, -1665
                  mul          s5, zero, t4
                  rem          a3, s1, t6
                  andi         gp, a0, 1810
                  c.li         t2, 14
                  c.srli       a5, 22
                  auipc        ra, 350999
                  add          a2, t3, t2
                  sltu         t0, a4, t2
                  lui          a2, 460343
                  mulhsu       sp, s0, t5
                  c.slli       t1, 10
                  auipc        ra, 350999
                  sltu         t0, a4, t2
                  sltu         t0, a4, t2
                  srl          s3, a1, s4
                  c.sub        a5, a3
                  mulhsu       sp, s0, t5
                  srai         a3, t6, 11
                  c.or         a5, a0
                  div          s8, a5, a2
                  c.mv         t0, t6
                  xor          s6, gp, s0
                  or           t4, a6, ra
                  sub          a2, a0, a7
                  add          a2, t3, t2
                  c.addi       s5, -1
                  slt          ra, a3, a1
                  sra          s3, t0, s9
                  xor          s6, gp, s0
                  xor          s6, gp, s0
                  sltiu        s6, zero, -1665
                  c.addi16sp   sp, 224
                  xor          s6, gp, s0
                  xor          s6, gp, s0
                  c.andi       a3, 13
                  nop
                  c.slli       t1, 10
                  c.addi       s5, -1
                  divu         s2, a4, s3
                  mulh         s1, a7, a6
                  divu         s2, a4, s3
                  mulh         s1, a7, a6
                  div          s8, a5, a2
                  mulhsu       sp, s0, t5
                  sltiu        s6, zero, -1665
                  c.mv         t0, t6
                  c.li         t2, 14
                  c.lui        gp, 4
                  c.addi4spn   s1, sp, 192
                  c.addi4spn   s1, sp, 192
                  andi         gp, a0, 1810
                  c.nop
                  srai         a3, t6, 11
                  c.andi       a3, 13
                  c.or         a5, a0
                  slli         sp, a1, 17
                  sltu         t0, a4, t2
                  c.addi4spn   s1, sp, 192
                  srli         s8, t3, 9
                  c.xor        a2, s1
                  div          s8, a5, a2
                  or           t4, a6, ra
                  lui          a2, 460343
                  mul          s5, zero, t4
                  c.li         t2, 14
                  sub          a2, a0, a7
                  c.srai       a1, 18
                  mulh         s1, a7, a6
                  c.xor        a2, s1
                  lui          a2, 460343
                  mulh         s1, a7, a6
                  srli         s8, t3, 9
                  c.mv         t0, t6
                  andi         gp, a0, 1810
                  sltiu        s6, zero, -1665
                  nop
                  slli         sp, a1, 17
                  srli         s8, t3, 9
                  mulh         s1, a7, a6
                  c.mv         t0, t6
                  lui          a2, 460343
                  mulhsu       sp, s0, t5
                  sltiu        s6, zero, -1665
                  mulhsu       sp, s0, t5
                  sltiu        s6, zero, -1665
                  c.addi4spn   s1, sp, 192
                  c.lui        gp, 4
                  c.srli       a5, 22
                  srli         s8, t3, 9
                  ori          s3, s3, 1495
                  c.xor        a2, s1
                  add          a2, t3, t2
                  rem          a3, s1, t6
                  mul          s5, zero, t4
                  slti         t3, t5, -1062
                  remu         gp, a4, s3
                  c.nop
                  c.sub        a5, a3
                  c.addi16sp   sp, 224
                  c.mv         t0, t6
                  c.addi16sp   sp, 224
                  auipc        ra, 350999
                  c.srli       a5, 22
                  ori          s3, s3, 1495
                  div          s8, a5, a2
                  or           t4, a6, ra
                  slli         sp, a1, 17
                  divu         s2, a4, s3
                  sll          gp, s10, s11
                  c.and        a5, a1
                  ori          s3, s3, 1495
                  c.andi       a3, 13
                  xor          s6, gp, s0
                  rem          a3, s1, t6
                  c.nop
                  sub          a2, a0, a7
                  addi         s7, t2, -1579
                  sltu         t0, a4, t2
                  srli         s8, t3, 9
                  c.srli       a5, 22
                  srai         a3, t6, 11
                  c.addi       s5, -1
                  sra          s3, t0, s9
                  remu         gp, a4, s3
                  c.nop
                  sltiu        s6, zero, -1665
                  c.add        s9, s7
                  c.xor        a2, s1
                  slt          ra, a3, a1
                  c.andi       a3, 13
                  c.mv         t0, t6
                  c.srli       a5, 22
                  add          a2, t3, t2
                  c.srai       a1, 18
                  xor          s6, gp, s0
                  andi         gp, a0, 1810
                  nop
                  mulhsu       sp, s0, t5
                  sltiu        s6, zero, -1665
                  c.add        s9, s7
                  auipc        ra, 350999
                  slti         t3, t5, -1062
                  addi         s7, t2, -1579
                  auipc        ra, 350999
                  c.xor        a2, s1
                  slt          ra, a3, a1
                  c.li         t2, 14
                  remu         gp, a4, s3
                  sub          a2, a0, a7
                  div          s8, a5, a2
                  c.sub        a5, a3
                  add          a2, t3, t2
                  or           t4, a6, ra
                  ori          s3, s3, 1495
                  and          sp, a0, gp
                  add          a2, t3, t2
                  c.srli       a5, 22
                  and          sp, a0, gp
                  auipc        ra, 350999
                  c.addi4spn   s1, sp, 192
                  nop
                  c.or         a5, a0
                  xor          s6, gp, s0
                  rem          a3, s1, t6
                  srl          s3, a1, s4
                  and          sp, a0, gp
                  addi         s7, t2, -1579
                  c.nop
                  rem          a3, s1, t6
                  c.xor        a2, s1
                  slti         t3, t5, -1062
                  mulhsu       sp, s0, t5
                  xori         a1, s1, 959
                  or           t4, a6, ra
                  c.and        a5, a1
                  divu         s2, a4, s3
                  c.andi       a3, 13
                  divu         s2, a4, s3
                  slti         t3, t5, -1062
                  c.or         a5, a0
                  c.nop
                  c.srai       a1, 18
                  c.li         t2, 14
                  remu         gp, a4, s3
                  c.nop
                  nop
                  sra          s3, t0, s9
                  auipc        ra, 350999
                  c.addi       s5, -1
                  addi         s7, t2, -1579
                  srli         s8, t3, 9
                  add          a2, t3, t2
                  mulhsu       sp, s0, t5
                  addi         s7, t2, -1579
                  div          s8, a5, a2
                  srai         a3, t6, 11
                  sra          s3, t0, s9
                  c.nop
                  sra          s3, t0, s9
                  slti         t3, t5, -1062
                  mulh         s1, a7, a6
                  div          s8, a5, a2
                  mul          s5, zero, t4
                  slt          ra, a3, a1
                  mulh         s1, a7, a6
                  ori          s3, s3, 1495
                  nop
                  mulh         s1, a7, a6
                  c.xor        a2, s1
                  c.addi16sp   sp, 224
                  rem          a3, s1, t6
                  nop
                  c.addi       s5, -1
                  sub          a2, a0, a7
                  mulhu        t4, a3, s6
                  sub          a2, a0, a7
                  sltu         t0, a4, t2
                  c.li         t2, 14
                  c.addi16sp   sp, 224
                  c.sub        a5, a3
                  c.sub        a5, a3
                  c.li         t2, 14
                  and          sp, a0, gp
                  mul          s5, zero, t4
                  mulhu        t4, a3, s6
                  ori          s3, s3, 1495
                  c.or         a5, a0
                  mulhu        t4, a3, s6
                  sll          gp, s10, s11
                  c.lui        gp, 4
                  c.li         t2, 14
                  divu         s2, a4, s3
                  mulhu        t4, a3, s6
                  c.addi       s5, -1
                  add          a2, t3, t2
                  c.or         a5, a0
                  rem          a3, s1, t6
                  c.add        s9, s7
                  auipc        ra, 350999
                  srli         s8, t3, 9
                  xor          s6, gp, s0
                  auipc        ra, 350999
                  xori         a1, s1, 959
                  srli         s8, t3, 9
                  mulh         s1, a7, a6
                  xori         a1, s1, 959
                  or           t4, a6, ra
                  rem          a3, s1, t6
                  c.or         a5, a0
                  slt          ra, a3, a1
                  nop
                  lui          a2, 460343
                  c.addi       s5, -1
                  slti         t3, t5, -1062
                  slli         sp, a1, 17
                  c.addi16sp   sp, 224
                  add          a2, t3, t2
                  slt          ra, a3, a1
                  c.srai       a1, 18
                  c.addi4spn   s1, sp, 192
                  c.srli       a5, 22
                  add          a2, t3, t2
                  c.sub        a5, a3
                  ori          s3, s3, 1495
                  slli         sp, a1, 17
                  c.addi4spn   s1, sp, 192
                  c.xor        a2, s1
                  sra          s3, t0, s9
                  or           t4, a6, ra
                  andi         gp, a0, 1810
                  mulh         s1, a7, a6
                  c.lui        gp, 4
                  sra          s3, t0, s9
                  sub          a2, a0, a7
                  srl          s3, a1, s4
                  sltu         t0, a4, t2
                  or           t4, a6, ra
                  remu         gp, a4, s3
                  sltu         t0, a4, t2
                  xori         a1, s1, 959
                  sltu         t0, a4, t2
                  slt          ra, a3, a1
                  slli         sp, a1, 17
                  mulh         s1, a7, a6
                  xor          s6, gp, s0
                  lui          a2, 460343
                  add          a2, t3, t2
                  andi         gp, a0, 1810
                  sltu         t0, a4, t2
                  nop
                  c.srli       a5, 22
                  and          sp, a0, gp
                  sll          gp, s10, s11
                  c.slli       t1, 10
                  c.nop
                  c.add        s9, s7
                  c.lui        gp, 4
                  slti         t3, t5, -1062
                  srl          s3, a1, s4
                  c.li         t2, 14
                  auipc        ra, 350999
                  xori         a1, s1, 959
                  srl          s3, a1, s4
                  sltu         t0, a4, t2
                  mul          s5, zero, t4
                  c.slli       t1, 10
                  divu         s2, a4, s3
                  lui          a2, 460343
                  c.addi4spn   s1, sp, 192
                  c.or         a5, a0
                  c.mv         t0, t6
                  mulhsu       sp, s0, t5
                  rem          a3, s1, t6
                  c.mv         t0, t6
                  auipc        ra, 350999
                  mulhsu       sp, s0, t5
                  mulhsu       sp, s0, t5
                  c.xor        a2, s1
                  c.addi       s5, -1
                  slt          ra, a3, a1
                  add          a2, t3, t2
                  sltu         t0, a4, t2
                  sltiu        s6, zero, -1665
                  mulhu        t4, a3, s6
                  c.nop
                  c.srli       a5, 22
                  ori          s3, s3, 1495
                  mulhsu       sp, s0, t5
                  andi         gp, a0, 1810
                  c.or         a5, a0
                  srai         a3, t6, 11
                  divu         s2, a4, s3
                  lui          a2, 460343
                  and          sp, a0, gp
                  srl          s3, a1, s4
                  andi         gp, a0, 1810
                  mulhu        t4, a3, s6
                  div          s8, a5, a2
                  divu         s2, a4, s3
                  div          s8, a5, a2
                  c.addi       s5, -1
                  or           t4, a6, ra
                  slt          ra, a3, a1
                  c.add        s9, s7
                  srli         s8, t3, 9
                  c.addi       s5, -1
                  rem          a3, s1, t6
                  srl          s3, a1, s4
                  c.xor        a2, s1
                  c.nop
                  addi         s7, t2, -1579
                  srl          s3, a1, s4
                  ori          s3, s3, 1495
                  mulhu        t4, a3, s6
                  remu         gp, a4, s3
                  mulhsu       sp, s0, t5
                  srl          s3, a1, s4
                  nop
                  mulhsu       sp, s0, t5
                  c.addi16sp   sp, 224
                  ori          s3, s3, 1495
                  c.andi       a3, 13
                  c.and        a5, a1
                  nop
                  and          sp, a0, gp
                  srli         s8, t3, 9
                  srai         a3, t6, 11
                  add          a2, t3, t2
                  c.addi4spn   s1, sp, 192
                  c.andi       a3, 13
                  c.srai       a1, 18
                  sub          a2, a0, a7
                  rem          a3, s1, t6
                  sra          s3, t0, s9
                  srl          s3, a1, s4
                  srl          s3, a1, s4
                  sra          s3, t0, s9
                  xori         a1, s1, 959
                  divu         s2, a4, s3
                  or           t4, a6, ra
                  addi         s7, t2, -1579
                  rem          a3, s1, t6
                  slti         t3, t5, -1062
                  srli         s8, t3, 9
                  sub          a2, a0, a7
                  addi         s7, t2, -1579
                  div          s8, a5, a2
                  c.or         a5, a0
                  andi         gp, a0, 1810
                  srl          s3, a1, s4
                  nop
                  sltu         t0, a4, t2
                  add          a2, t3, t2
                  srai         a3, t6, 11
                  c.xor        a2, s1
                  nop
                  slt          ra, a3, a1
                  xori         a1, s1, 959
                  remu         gp, a4, s3
                  c.addi       s5, -1
                  xori         a1, s1, 959
                  slti         t3, t5, -1062
                  c.addi4spn   s1, sp, 192
                  remu         gp, a4, s3
                  mulhu        t4, a3, s6
                  auipc        ra, 350999
                  divu         s2, a4, s3
                  sub          a2, a0, a7
                  ori          s3, s3, 1495
                  add          a2, t3, t2
                  mul          s5, zero, t4
                  divu         s2, a4, s3
                  c.addi16sp   sp, 224
                  nop
                  srli         s8, t3, 9
                  c.lui        gp, 4
                  c.nop
                  auipc        ra, 350999
                  div          s8, a5, a2
                  c.lui        gp, 4
                  c.xor        a2, s1
                  mulhu        t4, a3, s6
                  auipc        ra, 350999
                  c.andi       a3, 13
                  c.addi       s5, -1
                  c.srai       a1, 18
                  c.mv         t0, t6
                  rem          a3, s1, t6
                  c.slli       t1, 10
                  c.xor        a2, s1
                  c.and        a5, a1
                  c.addi       s5, -1
                  c.xor        a2, s1
                  xori         a1, s1, 959
                  slli         sp, a1, 17
                  c.srli       a5, 22
                  c.or         a5, a0
                  c.andi       a3, 13
                  srl          s3, a1, s4
                  c.srai       a1, 18
                  c.andi       a3, 13
                  lui          a2, 460343
                  c.add        s9, s7
                  c.and        a5, a1
                  addi         s7, t2, -1579
                  c.addi16sp   sp, 224
                  addi         s7, t2, -1579
                  c.li         t2, 14
                  mulhu        t4, a3, s6
                  c.srli       a5, 22
                  mulhsu       sp, s0, t5
                  c.srli       a5, 22
                  sll          gp, s10, s11
                  c.addi16sp   sp, 224
                  c.lui        gp, 4
                  sll          gp, s10, s11
                  xor          s6, gp, s0
                  c.slli       t1, 10
                  ori          s3, s3, 1495
                  srli         s8, t3, 9
                  or           t4, a6, ra
                  slli         sp, a1, 17
                  auipc        ra, 350999
                  c.and        a5, a1
                  c.sub        a5, a3
                  div          s8, a5, a2
                  c.li         t2, 14
                  divu         s2, a4, s3
                  addi         s7, t2, -1579
                  mulhsu       sp, s0, t5
                  c.li         t2, 14
                  c.sub        a5, a3
                  c.srli       a5, 22
                  remu         gp, a4, s3
                  c.or         a5, a0
                  nop
                  c.addi16sp   sp, 224
                  addi         s7, t2, -1579
                  xori         a1, s1, 959
                  mul          s5, zero, t4
                  c.and        a5, a1
                  andi         gp, a0, 1810
                  c.addi       s5, -1
                  div          s8, a5, a2
                  sltiu        s6, zero, -1665
                  sltiu        s6, zero, -1665
                  add          a2, t3, t2
                  mul          s5, zero, t4
                  and          sp, a0, gp
                  mul          s5, zero, t4
                  sll          gp, s10, s11
                  c.mv         t0, t6
                  andi         gp, a0, 1810
                  sll          gp, s10, s11
                  c.li         t2, 14
                  c.addi4spn   s1, sp, 192
                  c.srai       a1, 18
                  c.slli       t1, 10
                  c.andi       a3, 13
                  xor          s6, gp, s0
                  c.xor        a2, s1
                  xori         a1, s1, 959
                  c.andi       a3, 13
                  mulh         s1, a7, a6
                  mulhu        t4, a3, s6
                  c.or         a5, a0
                  c.sub        a5, a3
                  c.srai       a1, 18
                  c.nop
                  or           t4, a6, ra
                  sltu         t0, a4, t2
                  slli         sp, a1, 17
                  div          s8, a5, a2
                  or           t4, a6, ra
                  xori         a1, s1, 959
                  mul          s5, zero, t4
                  addi         s7, t2, -1579
                  c.lui        gp, 4
                  xor          s6, gp, s0
                  divu         s2, a4, s3
                  divu         s2, a4, s3
                  c.andi       a3, 13
                  add          a2, t3, t2
                  c.xor        a2, s1
                  slt          ra, a3, a1
                  c.andi       a3, 13
                  ori          s3, s3, 1495
                  mulhsu       sp, s0, t5
                  nop
                  c.srli       a5, 22
                  sltiu        s6, zero, -1665
                  c.and        a5, a1
                  slli         sp, a1, 17
                  div          s8, a5, a2
                  or           t4, a6, ra
                  remu         gp, a4, s3
                  slt          ra, a3, a1
                  c.nop
                  c.or         a5, a0
                  mulhu        t4, a3, s6
                  sltu         t0, a4, t2
                  c.slli       t1, 10
                  and          sp, a0, gp
                  sltiu        s6, zero, -1665
                  div          s8, a5, a2
                  mul          s5, zero, t4
                  rem          a3, s1, t6
                  c.xor        a2, s1
                  rem          a3, s1, t6
                  sra          s3, t0, s9
                  add          a2, t3, t2
                  xor          s6, gp, s0
                  slt          ra, a3, a1
                  c.addi16sp   sp, 224
                  and          sp, a0, gp
                  sub          a2, a0, a7
                  c.addi16sp   sp, 224
                  lui          a2, 460343
                  c.addi4spn   s1, sp, 192
                  lui          a2, 460343
                  auipc        ra, 350999
                  srli         s8, t3, 9
                  nop
                  mulhsu       sp, s0, t5
                  c.nop
                  slti         t3, t5, -1062
                  sub          a2, a0, a7
                  c.mv         t0, t6
                  sltiu        s6, zero, -1665
                  slti         t3, t5, -1062
                  srai         a3, t6, 11
                  srli         s8, t3, 9
                  mulhu        t4, a3, s6
                  sltu         t0, a4, t2
                  c.sub        a5, a3
                  xor          s6, gp, s0
                  mulh         s1, a7, a6
                  c.nop
                  sll          gp, s10, s11
                  remu         gp, a4, s3
                  lui          a2, 460343
                  srli         s8, t3, 9
                  srl          s3, a1, s4
                  c.lui        gp, 4
                  c.mv         t0, t6
                  c.addi       s5, -1
                  addi         s7, t2, -1579
                  and          sp, a0, gp
                  sltiu        s6, zero, -1665
                  remu         gp, a4, s3
                  c.mv         t0, t6
                  c.or         a5, a0
                  c.and        a5, a1
                  srli         s8, t3, 9
                  mulhsu       sp, s0, t5
                  c.mv         t0, t6
                  divu         s2, a4, s3
                  divu         s2, a4, s3
                  div          s8, a5, a2
                  c.xor        a2, s1
                  sub          a2, a0, a7
                  add          a2, t3, t2
                  mulh         s1, a7, a6
                  or           t4, a6, ra
                  mul          s5, zero, t4
                  or           t4, a6, ra
                  c.or         a5, a0
                  addi         s7, t2, -1579
                  slti         t3, t5, -1062
                  nop
                  ori          s3, s3, 1495
                  c.srli       a5, 22
                  divu         s2, a4, s3
                  c.lui        gp, 4
                  slli         sp, a1, 17
                  xori         a1, s1, 959
                  c.srai       a1, 18
                  nop
                  c.add        s9, s7
                  mulhu        t4, a3, s6
                  c.add        s9, s7
                  xori         a1, s1, 959
                  ori          s3, s3, 1495
                  c.addi       s5, -1
                  c.nop
                  mul          s5, zero, t4
                  sll          gp, s10, s11
                  ori          s3, s3, 1495
                  mul          s5, zero, t4
                  mulhu        t4, a3, s6
                  c.add        s9, s7
                  c.sub        a5, a3
                  srai         a3, t6, 11
                  andi         gp, a0, 1810
                  xor          s6, gp, s0
                  div          s8, a5, a2
                  andi         gp, a0, 1810
                  and          sp, a0, gp
                  xor          s6, gp, s0
                  srai         a3, t6, 11
                  divu         s2, a4, s3
                  sltu         t0, a4, t2
                  c.addi16sp   sp, 224
                  xori         a1, s1, 959
                  and          sp, a0, gp
                  c.addi16sp   sp, 224
                  srli         s8, t3, 9
                  c.li         t2, 14
                  c.lui        gp, 4
                  add          a2, t3, t2
                  divu         s2, a4, s3
                  mulhsu       sp, s0, t5
                  xor          s6, gp, s0
                  c.srai       a1, 18
                  divu         s2, a4, s3
                  slt          ra, a3, a1
                  slti         t3, t5, -1062
                  xor          s6, gp, s0
                  mulh         s1, a7, a6
                  c.li         t2, 14
                  c.slli       t1, 10
                  c.xor        a2, s1
                  sll          gp, s10, s11
                  nop
                  mulh         s1, a7, a6
                  mulhsu       sp, s0, t5
                  divu         s2, a4, s3
                  c.srli       a5, 22
                  srai         a3, t6, 11
                  div          s8, a5, a2
                  sll          gp, s10, s11
                  xor          s6, gp, s0
                  mulhsu       sp, s0, t5
                  rem          a3, s1, t6
                  c.or         a5, a0
                  slli         sp, a1, 17
                  c.mv         t0, t6
                  sltiu        s6, zero, -1665
                  srli         s8, t3, 9
                  c.mv         t0, t6
                  c.addi4spn   s1, sp, 192
                  divu         s2, a4, s3
                  c.srli       a5, 22
                  c.lui        gp, 4
                  slti         t3, t5, -1062
                  slti         t3, t5, -1062
                  ori          s3, s3, 1495
                  div          s8, a5, a2
                  slli         sp, a1, 17
                  xor          s6, gp, s0
                  c.addi4spn   s1, sp, 192
                  ori          s3, s3, 1495
                  sltu         t0, a4, t2
                  sub          a2, a0, a7
                  mulhu        t4, a3, s6
                  nop
                  remu         gp, a4, s3
                  c.andi       a3, 13
                  sltiu        s6, zero, -1665
                  rem          a3, s1, t6
                  mulhsu       sp, s0, t5
                  xori         a1, s1, 959
                  and          sp, a0, gp
                  remu         gp, a4, s3
                  c.srai       a1, 18
                  remu         gp, a4, s3
                  sll          gp, s10, s11
                  mulhsu       sp, s0, t5
                  c.and        a5, a1
                  c.mv         t0, t6
                  xor          s6, gp, s0
                  c.xor        a2, s1
                  c.and        a5, a1
                  or           t4, a6, ra
                  sra          s3, t0, s9
                  sub          a2, a0, a7
                  xori         a1, s1, 959
                  slti         t3, t5, -1062
                  rem          a3, s1, t6
                  div          s8, a5, a2
                  sub          a2, a0, a7
                  srli         s8, t3, 9
                  or           t4, a6, ra
                  c.addi16sp   sp, 224
                  mulhsu       sp, s0, t5
                  slli         sp, a1, 17
                  srai         a3, t6, 11
                  divu         s2, a4, s3
                  c.slli       t1, 10
                  sltu         t0, a4, t2
                  srl          s3, a1, s4
                  slli         sp, a1, 17
                  srli         s8, t3, 9
                  c.addi4spn   s1, sp, 192
                  c.xor        a2, s1
                  lui          a2, 460343
                  c.addi16sp   sp, 224
                  c.and        a5, a1
                  slli         sp, a1, 17
                  mulhu        t4, a3, s6
                  div          s8, a5, a2
                  c.srli       a5, 22
                  c.or         a5, a0
                  xor          s6, gp, s0
                  mul          s5, zero, t4
                  rem          a3, s1, t6
                  andi         gp, a0, 1810
                  c.addi16sp   sp, 224
                  c.nop
                  c.and        a5, a1
                  srai         a3, t6, 11
                  c.mv         t0, t6
                  or           t4, a6, ra
                  c.or         a5, a0
                  c.and        a5, a1
                  andi         gp, a0, 1810
                  auipc        ra, 350999
                  xor          s6, gp, s0
                  sra          s3, t0, s9
                  sll          gp, s10, s11
                  c.addi4spn   s1, sp, 192
                  c.add        s9, s7
                  rem          a3, s1, t6
                  slt          ra, a3, a1
                  c.andi       a3, 13
                  c.srai       a1, 18
                  srl          s3, a1, s4
                  c.mv         t0, t6
                  c.and        a5, a1
                  c.srai       a1, 18
                  srl          s3, a1, s4
                  slt          ra, a3, a1
                  sub          a2, a0, a7
                  srai         a3, t6, 11
                  or           t4, a6, ra
                  c.or         a5, a0
                  or           t4, a6, ra
                  c.srli       a5, 22
                  c.addi16sp   sp, 224
                  c.and        a5, a1
                  div          s8, a5, a2
                  c.lui        gp, 4
                  c.add        s9, s7
                  sltiu        s6, zero, -1665
                  xori         a1, s1, 959
                  sra          s3, t0, s9
                  c.andi       a3, 13
                  c.addi16sp   sp, 224
                  nop
                  c.addi16sp   sp, 224
                  c.or         a5, a0
                  ori          s3, s3, 1495
                  add          a2, t3, t2
                  sub          a2, a0, a7
                  xor          s6, gp, s0
                  c.and        a5, a1
                  c.or         a5, a0
                  add          a2, t3, t2
                  c.xor        a2, s1
                  c.addi4spn   s1, sp, 192
                  mulh         s1, a7, a6
                  mulhu        t4, a3, s6
                  auipc        ra, 350999
                  c.nop
                  c.mv         t0, t6
                  c.addi       s5, -1
                  slt          ra, a3, a1
                  divu         s2, a4, s3
                  c.lui        gp, 4
                  slt          ra, a3, a1
                  remu         gp, a4, s3
                  and          sp, a0, gp
                  c.li         t2, 14
                  c.addi4spn   s1, sp, 192
                  or           t4, a6, ra
                  c.and        a5, a1
                  c.addi       s5, -1
                  sra          s3, t0, s9
                  divu         s2, a4, s3
                  c.mv         t0, t6
                  sltiu        s6, zero, -1665
                  sltu         t0, a4, t2
                  mulh         s1, a7, a6
                  and          sp, a0, gp
                  c.addi4spn   s1, sp, 192
                  sltu         t0, a4, t2
                  and          sp, a0, gp
                  nop
                  addi         s7, t2, -1579
                  sltu         t0, a4, t2
                  mul          s5, zero, t4
                  slli         sp, a1, 17
                  rem          a3, s1, t6
                  mulhu        t4, a3, s6
                  c.addi4spn   s1, sp, 192
                  mulh         s1, a7, a6
                  sltu         t0, a4, t2
                  slli         sp, a1, 17
                  sra          s3, t0, s9
                  c.mv         t0, t6
                  rem          a3, s1, t6
                  c.sub        a5, a3
                  c.xor        a2, s1
                  sra          s3, t0, s9
                  c.slli       t1, 10
                  remu         gp, a4, s3
                  lui          a2, 460343
                  c.sub        a5, a3
                  c.nop
                  div          s8, a5, a2
                  sra          s3, t0, s9
                  c.li         t2, 14
                  xor          s6, gp, s0
                  c.slli       t1, 10
                  sub          a2, a0, a7
                  or           t4, a6, ra
                  and          sp, a0, gp
                  remu         gp, a4, s3
                  sub          a2, a0, a7
                  addi         s7, t2, -1579
                  xori         a1, s1, 959
                  c.mv         t0, t6
                  sltiu        s6, zero, -1665
                  c.nop
                  c.and        a5, a1
                  and          sp, a0, gp
                  divu         s2, a4, s3
                  c.and        a5, a1
                  sltu         t0, a4, t2
                  mulhsu       sp, s0, t5
                  and          sp, a0, gp
                  c.srli       a5, 22
                  nop
                  sub          a2, a0, a7
                  and          sp, a0, gp
                  c.addi16sp   sp, 224
                  mulhsu       sp, s0, t5
                  div          s8, a5, a2
                  mulhu        t4, a3, s6
                  sub          a2, a0, a7
                  remu         gp, a4, s3
                  c.addi       s5, -1
                  srli         s8, t3, 9
                  auipc        ra, 350999
                  add          a2, t3, t2
                  c.lui        gp, 4
                  c.mv         t0, t6
                  and          sp, a0, gp
                  c.srai       a1, 18
                  sltu         t0, a4, t2
                  xor          s6, gp, s0
                  remu         gp, a4, s3
                  srl          s3, a1, s4
                  c.sub        a5, a3
                  remu         gp, a4, s3
                  slti         t3, t5, -1062
                  c.slli       t1, 10
                  c.slli       t1, 10
                  sltiu        s6, zero, -1665
                  c.addi       s5, -1
                  c.sub        a5, a3
                  sra          s3, t0, s9
                  c.addi4spn   s1, sp, 192
                  auipc        ra, 350999
                  remu         gp, a4, s3
                  mulhsu       sp, s0, t5
                  srai         a3, t6, 11
                  c.andi       a3, 13
                  c.srli       a5, 22
                  and          sp, a0, gp
                  and          sp, a0, gp
                  addi         s7, t2, -1579
                  mulhsu       sp, s0, t5
                  auipc        ra, 350999
                  c.srai       a1, 18
                  auipc        ra, 350999
                  mulhu        t4, a3, s6
                  lui          a2, 460343
                  xor          s6, gp, s0
                  c.or         a5, a0
                  c.slli       t1, 10
                  sub          a2, a0, a7
                  addi         s7, t2, -1579
                  xor          s6, gp, s0
                  sll          gp, s10, s11
                  sra          s3, t0, s9
                  c.andi       a3, 13
                  c.li         t2, 14
                  c.srai       a1, 18
                  sub          a2, a0, a7
                  mulh         s1, a7, a6
                  mulhu        t4, a3, s6
                  mulh         s1, a7, a6
                  and          sp, a0, gp
                  c.li         t2, 14
                  c.add        s9, s7
                  div          s8, a5, a2
                  c.srli       a5, 22
                  ori          s3, s3, 1495
                  xor          s6, gp, s0
                  c.add        s9, s7
                  addi         s7, t2, -1579
                  div          s8, a5, a2
                  c.addi       s5, -1
                  xori         a1, s1, 959
                  c.srli       a5, 22
                  c.slli       t1, 10
                  slt          ra, a3, a1
                  and          sp, a0, gp
                  c.or         a5, a0
                  div          s8, a5, a2
                  mulhu        t4, a3, s6
                  or           t4, a6, ra
                  c.nop
                  xori         a1, s1, 959
                  slli         sp, a1, 17
                  mul          s5, zero, t4
                  c.nop
                  sra          s3, t0, s9
                  c.addi16sp   sp, 224
                  andi         gp, a0, 1810
                  c.and        a5, a1
                  sub          a2, a0, a7
                  sub          a2, a0, a7
                  c.xor        a2, s1
                  nop
                  c.addi16sp   sp, 224
                  c.lui        gp, 4
                  slti         t3, t5, -1062
                  c.lui        gp, 4
                  c.srli       a5, 22
                  c.srai       a1, 18
                  mulhsu       sp, s0, t5
                  sll          gp, s10, s11
                  sub          a2, a0, a7
                  lui          a2, 460343
                  xori         a1, s1, 959
                  slli         sp, a1, 17
                  c.xor        a2, s1
                  sll          gp, s10, s11
                  add          a2, t3, t2
                  sll          gp, s10, s11
                  mul          s5, zero, t4
                  and          sp, a0, gp
                  c.sub        a5, a3
                  c.slli       t1, 10
                  c.srai       a1, 18
                  addi         s7, t2, -1579
                  mulhsu       sp, s0, t5
                  remu         gp, a4, s3
                  c.slli       t1, 10
                  srai         a3, t6, 11
                  add          a2, t3, t2
                  mulh         s1, a7, a6
                  xor          s6, gp, s0
                  mulhu        t4, a3, s6
                  c.addi4spn   s1, sp, 192
                  srl          s3, a1, s4
                  xori         a1, s1, 959
                  addi         s7, t2, -1579
                  remu         gp, a4, s3
                  slti         t3, t5, -1062
                  mulh         s1, a7, a6
                  lui          a2, 460343
                  auipc        ra, 350999
                  c.srai       a1, 18
                  sra          s3, t0, s9
                  c.mv         t0, t6
                  andi         gp, a0, 1810
                  mulhu        t4, a3, s6
                  slt          ra, a3, a1
                  slli         sp, a1, 17
                  or           t4, a6, ra
                  c.srai       a1, 18
                  c.sub        a5, a3
                  c.andi       a3, 13
                  rem          a3, s1, t6
                  c.addi4spn   s1, sp, 192
                  c.nop
                  c.srli       a5, 22
                  c.slli       t1, 10
                  c.slli       t1, 10
                  lui          a2, 460343
                  mulhsu       sp, s0, t5
                  rem          a3, s1, t6
                  nop
                  sltiu        s6, zero, -1665
                  sub          a2, a0, a7
                  mul          s5, zero, t4
                  slli         sp, a1, 17
                  add          a2, t3, t2
                  ori          s3, s3, 1495
                  or           t4, a6, ra
                  srl          s3, a1, s4
                  c.addi       s5, -1
                  rem          a3, s1, t6
                  sub          a2, a0, a7
                  c.mv         t0, t6
                  c.mv         t0, t6
                  sub          a2, a0, a7
                  nop
                  c.nop
                  nop
                  auipc        ra, 350999
                  sub          a2, a0, a7
                  c.sub        a5, a3
                  div          s8, a5, a2
                  sll          gp, s10, s11
                  c.addi4spn   s1, sp, 192
                  srli         s8, t3, 9
                  remu         gp, a4, s3
                  mul          s5, zero, t4
                  c.nop
                  c.addi16sp   sp, 224
                  c.andi       a3, 13
                  and          sp, a0, gp
                  mulh         s1, a7, a6
                  xor          s6, gp, s0
                  slli         sp, a1, 17
                  mulhu        t4, a3, s6
                  c.srai       a1, 18
                  c.nop
                  andi         gp, a0, 1810
                  sll          gp, s10, s11
                  c.andi       a3, 13
                  c.or         a5, a0
                  add          a2, t3, t2
                  c.and        a5, a1
                  c.xor        a2, s1
                  and          sp, a0, gp
                  div          s8, a5, a2
                  add          a2, t3, t2
                  sll          gp, s10, s11
                  xori         a1, s1, 959
                  c.and        a5, a1
                  lui          a2, 460343
                  rem          a3, s1, t6
                  slti         t3, t5, -1062
                  c.and        a5, a1
                  c.xor        a2, s1
                  c.lui        gp, 4
                  xori         a1, s1, 959
                  c.andi       a3, 13
                  xor          s6, gp, s0
                  c.srli       a5, 22
                  c.xor        a2, s1
                  c.sub        a5, a3
                  c.srli       a5, 22
                  andi         gp, a0, 1810
                  srai         a3, t6, 11
                  c.and        a5, a1
                  andi         gp, a0, 1810
                  xor          s6, gp, s0
                  c.add        s9, s7
                  sltiu        s6, zero, -1665
                  andi         gp, a0, 1810
                  remu         gp, a4, s3
                  c.andi       a3, 13
                  c.or         a5, a0
                  c.addi4spn   s1, sp, 192
                  c.andi       a3, 13
                  sltu         t0, a4, t2
                  c.add        s9, s7
                  c.li         t2, 14
                  sub          a2, a0, a7
                  c.nop
                  divu         s2, a4, s3
                  mulhu        t4, a3, s6
                  mulhu        t4, a3, s6
                  auipc        ra, 350999
                  c.add        s9, s7
                  sltiu        s6, zero, -1665
                  mul          s5, zero, t4
                  mulhsu       sp, s0, t5
                  div          s8, a5, a2
                  c.addi4spn   s1, sp, 192
                  add          a2, t3, t2
                  c.li         t2, 14
                  sltiu        s6, zero, -1665
                  slli         sp, a1, 17
                  divu         s2, a4, s3
                  ori          s3, s3, 1495
                  sltu         t0, a4, t2
                  divu         s2, a4, s3
                  c.srai       a1, 18
                  nop
                  slli         sp, a1, 17
                  c.and        a5, a1
                  divu         s2, a4, s3
                  srai         a3, t6, 11
                  lui          a2, 460343
                  c.andi       a3, 13
                  c.addi16sp   sp, 224
                  c.nop
                  lui          a2, 460343
                  c.add        s9, s7
                  divu         s2, a4, s3
                  lui          a2, 460343
                  c.and        a5, a1
                  c.slli       t1, 10
                  rem          a3, s1, t6
                  c.sub        a5, a3
                  xori         a1, s1, 959
                  srai         a3, t6, 11
                  c.srli       a5, 22
                  mulh         s1, a7, a6
                  mul          s5, zero, t4
                  remu         gp, a4, s3
                  or           t4, a6, ra
                  rem          a3, s1, t6
                  slli         sp, a1, 17
                  slti         t3, t5, -1062
                  rem          a3, s1, t6
                  c.xor        a2, s1
                  c.xor        a2, s1
                  sltiu        s6, zero, -1665
                  c.srli       a5, 22
                  mulhu        t4, a3, s6
                  c.addi16sp   sp, 224
                  remu         gp, a4, s3
                  slt          ra, a3, a1
                  divu         s2, a4, s3
                  remu         gp, a4, s3
                  sll          gp, s10, s11
                  c.slli       t1, 10
                  sra          s3, t0, s9
                  c.nop
                  c.slli       t1, 10
                  slt          ra, a3, a1
                  mul          s5, zero, t4
                  auipc        ra, 350999
                  mulhu        t4, a3, s6
                  lui          a2, 460343
                  xor          s6, gp, s0
                  c.addi16sp   sp, 224
                  c.sub        a5, a3
                  c.and        a5, a1
                  div          s8, a5, a2
                  srai         a3, t6, 11
                  srl          s3, a1, s4
                  sra          s3, t0, s9
                  slt          ra, a3, a1
                  mulhu        t4, a3, s6
                  srai         a3, t6, 11
                  c.and        a5, a1
                  andi         gp, a0, 1810
                  mulh         s1, a7, a6
                  c.xor        a2, s1
                  c.addi       s5, -1
                  c.srai       a1, 18
                  xor          s6, gp, s0
                  c.lui        gp, 4
                  and          sp, a0, gp
                  mulh         s1, a7, a6
                  xor          s6, gp, s0
                  sltu         t0, a4, t2
                  slli         sp, a1, 17
                  srai         a3, t6, 11
                  and          sp, a0, gp
                  addi         s7, t2, -1579
                  ori          s3, s3, 1495
                  sltiu        s6, zero, -1665
                  mulhu        t4, a3, s6
                  mulh         s1, a7, a6
                  c.add        s9, s7
                  c.nop
                  auipc        ra, 350999
                  sltu         t0, a4, t2
                  c.add        s9, s7
                  c.addi16sp   sp, 224
                  c.or         a5, a0
                  sltu         t0, a4, t2
                  c.xor        a2, s1
                  c.nop
                  or           t4, a6, ra
                  sub          a2, a0, a7
                  addi         s7, t2, -1579
                  c.srli       a5, 22
                  slli         sp, a1, 17
                  xori         a1, s1, 959
                  nop
                  add          a2, t3, t2
                  slt          ra, a3, a1
                  c.addi       s5, -1
                  c.add        s9, s7
                  c.sub        a5, a3
                  c.or         a5, a0
                  rem          a3, s1, t6
                  andi         gp, a0, 1810
                  slli         sp, a1, 17
                  auipc        ra, 350999
                  c.addi4spn   s1, sp, 192
                  auipc        ra, 350999
                  c.slli       t1, 10
                  and          sp, a0, gp
                  addi         s7, t2, -1579
                  nop
                  c.slli       t1, 10
                  sltu         t0, a4, t2
                  mulh         s1, a7, a6
                  or           t4, a6, ra
                  rem          a3, s1, t6
                  andi         gp, a0, 1810
                  divu         s2, a4, s3
                  srli         s8, t3, 9
                  srli         s8, t3, 9
                  andi         gp, a0, 1810
                  addi         s7, t2, -1579
                  sltiu        s6, zero, -1665
                  lui          a2, 460343
                  addi         s7, t2, -1579
                  xori         a1, s1, 959
                  sltiu        s6, zero, -1665
                  srl          s3, a1, s4
                  rem          a3, s1, t6
                  c.srai       a1, 18
                  c.andi       a3, 13
                  or           t4, a6, ra
                  nop
                  xori         a1, s1, 959
                  srai         a3, t6, 11
                  c.addi4spn   s1, sp, 192
                  srl          s3, a1, s4
                  addi         s7, t2, -1579
                  or           t4, a6, ra
                  c.and        a5, a1
                  add          a2, t3, t2
                  c.li         t2, 14
                  mulhsu       sp, s0, t5
                  slt          ra, a3, a1
                  srl          s3, a1, s4
                  c.addi       s5, -1
                  c.add        s9, s7
                  slt          ra, a3, a1
                  and          sp, a0, gp
                  mulh         s1, a7, a6
                  and          sp, a0, gp
                  c.or         a5, a0
                  mulhu        t4, a3, s6
                  and          sp, a0, gp
                  c.addi16sp   sp, 224
                  sltiu        s6, zero, -1665
                  remu         gp, a4, s3
                  c.and        a5, a1
                  c.and        a5, a1
                  remu         gp, a4, s3
                  rem          a3, s1, t6
                  c.or         a5, a0
                  xor          s6, gp, s0
                  srli         s8, t3, 9
                  srai         a3, t6, 11
                  c.andi       a3, 13
                  sub          a2, a0, a7
                  xor          s6, gp, s0
                  c.or         a5, a0
                  lui          a2, 460343
                  srai         a3, t6, 11
                  c.andi       a3, 13
                  c.srai       a1, 18
                  ori          s3, s3, 1495
                  divu         s2, a4, s3
                  rem          a3, s1, t6
                  and          sp, a0, gp
                  mul          s5, zero, t4
                  add          a2, t3, t2
                  slt          ra, a3, a1
                  c.lui        gp, 4
                  rem          a3, s1, t6
                  c.andi       a3, 13
                  c.srli       a5, 22
                  c.andi       a3, 13
                  mulhsu       sp, s0, t5
                  add          a2, t3, t2
                  c.or         a5, a0
                  c.slli       t1, 10
                  sra          s3, t0, s9
                  ori          s3, s3, 1495
                  sra          s3, t0, s9
                  c.or         a5, a0
                  c.xor        a2, s1
                  srl          s3, a1, s4
                  srl          s3, a1, s4
                  srai         a3, t6, 11
                  c.addi16sp   sp, 224
                  add          a2, t3, t2
                  xori         a1, s1, 959
                  divu         s2, a4, s3
                  mulh         s1, a7, a6
                  div          s8, a5, a2
                  c.andi       a3, 13
                  c.xor        a2, s1
                  remu         gp, a4, s3
                  c.sub        a5, a3
                  c.slli       t1, 10
                  sltiu        s6, zero, -1665
                  slt          ra, a3, a1
                  mulhsu       sp, s0, t5
                  c.li         t2, 14
                  addi         s7, t2, -1579
                  c.sub        a5, a3
                  c.srli       a5, 22
                  c.xor        a2, s1
                  c.add        s9, s7
                  c.xor        a2, s1
                  addi         s7, t2, -1579
                  c.andi       a3, 13
                  lui          a2, 460343
                  c.sub        a5, a3
                  c.mv         t0, t6
                  c.lui        gp, 4
                  c.and        a5, a1
                  mul          s5, zero, t4
                  c.addi       s5, -1
                  c.addi16sp   sp, 224
                  c.srli       a5, 22
                  c.srai       a1, 18
                  c.lui        gp, 4
                  c.addi4spn   s1, sp, 192
                  srl          s3, a1, s4
                  xor          s6, gp, s0
                  sltiu        s6, zero, -1665
                  slli         sp, a1, 17
                  c.nop
                  xori         a1, s1, 959
                  remu         gp, a4, s3
                  or           t4, a6, ra
                  sll          gp, s10, s11
                  srli         s8, t3, 9
                  xori         a1, s1, 959
                  addi         s7, t2, -1579
                  sub          a2, a0, a7
                  c.addi4spn   s1, sp, 192
                  divu         s2, a4, s3
                  c.li         t2, 14
                  xori         a1, s1, 959
                  auipc        ra, 350999
                  sltiu        s6, zero, -1665
                  sltu         t0, a4, t2
                  mulhsu       sp, s0, t5
                  c.li         t2, 14
                  nop
                  lui          a2, 460343
                  c.lui        gp, 4
                  c.slli       t1, 10
                  mulhu        t4, a3, s6
                  srai         a3, t6, 11
                  c.srli       a5, 22
                  c.and        a5, a1
                  and          sp, a0, gp
                  add          a2, t3, t2
                  mul          s5, zero, t4
                  sltu         t0, a4, t2
                  divu         s2, a4, s3
                  mulh         s1, a7, a6
                  sltiu        s6, zero, -1665
                  sll          gp, s10, s11
                  sra          s3, t0, s9
                  divu         s2, a4, s3
                  c.add        s9, s7
                  div          s8, a5, a2
                  c.srai       a1, 18
                  srl          s3, a1, s4
                  srl          s3, a1, s4
                  remu         gp, a4, s3
                  mulhu        t4, a3, s6
                  mul          s5, zero, t4
                  c.addi4spn   s1, sp, 192
                  c.addi16sp   sp, 224
                  sra          s3, t0, s9
                  c.andi       a3, 13
                  sltu         t0, a4, t2
                  sltiu        s6, zero, -1665
                  srai         a3, t6, 11
                  remu         gp, a4, s3
                  xori         a1, s1, 959
                  c.xor        a2, s1
                  c.srai       a1, 18
                  c.lui        gp, 4
                  slli         sp, a1, 17
                  add          a2, t3, t2
                  or           t4, a6, ra
                  or           t4, a6, ra
                  c.lui        gp, 4
                  c.slli       t1, 10
                  slt          ra, a3, a1
                  c.xor        a2, s1
                  mul          s5, zero, t4
                  c.addi       s5, -1
                  lui          a2, 460343
                  srl          s3, a1, s4
                  c.srai       a1, 18
                  slti         t3, t5, -1062
                  slti         t3, t5, -1062
                  and          sp, a0, gp
                  c.sub        a5, a3
                  slti         t3, t5, -1062
                  sll          gp, s10, s11
                  xor          s6, gp, s0
                  xor          s6, gp, s0
                  c.lui        gp, 4
                  c.or         a5, a0
                  or           t4, a6, ra
                  mul          s5, zero, t4
                  sltu         t0, a4, t2
                  c.and        a5, a1
                  remu         gp, a4, s3
                  sltu         t0, a4, t2
                  andi         gp, a0, 1810
                  mulhu        t4, a3, s6
                  sltiu        s6, zero, -1665
                  lui          a2, 460343
                  c.and        a5, a1
                  slt          ra, a3, a1
                  ori          s3, s3, 1495
                  srai         a3, t6, 11
                  c.andi       a3, 13
                  div          s8, a5, a2
                  c.addi       s5, -1
                  addi         s7, t2, -1579
                  slli         sp, a1, 17
                  nop
                  c.srli       a5, 22
                  sltiu        s6, zero, -1665
                  c.add        s9, s7
                  nop
                  or           t4, a6, ra
                  c.addi       s5, -1
                  and          sp, a0, gp
                  c.or         a5, a0
                  c.srai       a1, 18
                  c.addi16sp   sp, 224
                  c.xor        a2, s1
                  andi         gp, a0, 1810
                  mul          s5, zero, t4
                  auipc        ra, 350999
                  c.addi4spn   s1, sp, 192
                  or           t4, a6, ra
                  sltu         t0, a4, t2
                  add          a2, t3, t2
                  ori          s3, s3, 1495
                  c.add        s9, s7
                  sltu         t0, a4, t2
                  div          s8, a5, a2
                  c.andi       a3, 13
                  c.addi4spn   s1, sp, 192
                  c.nop
                  c.srai       a1, 18
                  c.addi16sp   sp, 224
                  divu         s2, a4, s3
                  lui          a2, 460343
                  mulhsu       sp, s0, t5
                  mulhu        t4, a3, s6
                  or           t4, a6, ra
                  c.slli       t1, 10
                  add          a2, t3, t2
                  divu         s2, a4, s3
                  c.srli       a5, 22
                  c.or         a5, a0
                  srli         s8, t3, 9
                  c.or         a5, a0
                  srl          s3, a1, s4
                  xor          s6, gp, s0
                  sra          s3, t0, s9
                  c.xor        a2, s1
                  mulhu        t4, a3, s6
                  sltu         t0, a4, t2
                  c.srli       a5, 22
                  c.srai       a1, 18
                  c.nop
                  add          a2, t3, t2
                  c.srli       a5, 22
                  c.li         t2, 14
                  sub          a2, a0, a7
                  c.andi       a3, 13
                  mulhsu       sp, s0, t5
                  srl          s3, a1, s4
                  or           t4, a6, ra
                  nop
                  c.nop
                  sltiu        s6, zero, -1665
                  addi         s7, t2, -1579
                  mulhu        t4, a3, s6
                  c.li         t2, 14
                  slti         t3, t5, -1062
                  c.li         t2, 14
                  xori         a1, s1, 959
                  c.addi16sp   sp, 224
                  sra          s3, t0, s9
                  slti         t3, t5, -1062
                  c.and        a5, a1
                  c.and        a5, a1
                  slt          ra, a3, a1
                  sltu         t0, a4, t2
                  c.addi4spn   s1, sp, 192
                  add          a2, t3, t2
                  addi         s7, t2, -1579
                  mulhsu       sp, s0, t5
                  srli         s8, t3, 9
                  ori          s3, s3, 1495
                  andi         gp, a0, 1810
                  div          s8, a5, a2
                  div          s8, a5, a2
                  srl          s3, a1, s4
                  c.srai       a1, 18
                  c.andi       a3, 13
                  slt          ra, a3, a1
                  c.nop
                  nop
                  remu         gp, a4, s3
                  c.addi16sp   sp, 224
                  auipc        ra, 350999
                  auipc        ra, 350999
                  xori         a1, s1, 959
                  slt          ra, a3, a1
                  nop
                  rem          a3, s1, t6
                  slt          ra, a3, a1
                  slli         sp, a1, 17
                  srai         a3, t6, 11
                  xor          s6, gp, s0
                  mulhu        t4, a3, s6
                  slt          ra, a3, a1
                  slti         t3, t5, -1062
                  ori          s3, s3, 1495
                  c.slli       t1, 10
                  mulh         s1, a7, a6
                  sub          a2, a0, a7
                  c.mv         t0, t6
                  c.mv         t0, t6
                  srli         s8, t3, 9
                  slti         t3, t5, -1062
                  c.addi16sp   sp, 224
                  andi         gp, a0, 1810
                  srl          s3, a1, s4
                  c.or         a5, a0
                  or           t4, a6, ra
                  nop
                  mul          s5, zero, t4
                  andi         gp, a0, 1810
                  c.xor        a2, s1
                  c.li         t2, 14
                  c.addi       s5, -1
                  sll          gp, s10, s11
                  add          a2, t3, t2
                  mulh         s1, a7, a6
                  sltiu        s6, zero, -1665
                  c.addi4spn   s1, sp, 192
                  xori         a1, s1, 959
                  rem          a3, s1, t6
                  c.nop
                  c.addi       s5, -1
                  mulhu        t4, a3, s6
                  c.addi       s5, -1
                  slti         t3, t5, -1062
                  mulhsu       sp, s0, t5
                  andi         gp, a0, 1810
                  divu         s2, a4, s3
                  xor          s6, gp, s0
                  slt          ra, a3, a1
                  c.lui        gp, 4
                  add          a2, t3, t2
                  mulhu        t4, a3, s6
                  sltiu        s6, zero, -1665
                  c.sub        a5, a3
                  srai         a3, t6, 11
                  c.addi4spn   s1, sp, 192
                  srai         a3, t6, 11
                  c.add        s9, s7
                  auipc        ra, 350999
                  srli         s8, t3, 9
                  srli         s8, t3, 9
                  c.andi       a3, 13
                  c.addi16sp   sp, 224
                  mul          s5, zero, t4
                  srai         a3, t6, 11
                  auipc        ra, 350999
                  divu         s2, a4, s3
                  andi         gp, a0, 1810
                  auipc        ra, 350999
                  lui          a2, 460343
                  rem          a3, s1, t6
                  slt          ra, a3, a1
                  c.srli       a5, 22
                  sra          s3, t0, s9
                  auipc        ra, 350999
                  div          s8, a5, a2
                  c.mv         t0, t6
                  andi         gp, a0, 1810
                  srai         a3, t6, 11
                  or           t4, a6, ra
                  c.srai       a1, 18
                  c.nop
                  xor          s6, gp, s0
                  c.add        s9, s7
                  srai         a3, t6, 11
                  c.or         a5, a0
                  sub          a2, a0, a7
                  mul          s5, zero, t4
                  and          sp, a0, gp
                  or           t4, a6, ra
                  divu         s2, a4, s3
                  xori         a1, s1, 959
                  c.slli       t1, 10
                  c.or         a5, a0
                  c.slli       t1, 10
                  c.slli       t1, 10
                  srli         s8, t3, 9
                  c.lui        gp, 4
                  c.srli       a5, 22
                  c.mv         t0, t6
                  c.lui        gp, 4
                  slli         sp, a1, 17
                  or           t4, a6, ra
                  lui          a2, 460343
                  addi         s7, t2, -1579
                  c.slli       t1, 10
                  c.addi4spn   s1, sp, 192
                  mulh         s1, a7, a6
                  rem          a3, s1, t6
                  c.li         t2, 14
                  c.xor        a2, s1
                  c.sub        a5, a3
                  addi         s7, t2, -1579
                  c.slli       t1, 10
                  remu         gp, a4, s3
                  c.and        a5, a1
                  divu         s2, a4, s3
                  mulhsu       sp, s0, t5
                  c.li         t2, 14
                  c.lui        gp, 4
                  addi         s7, t2, -1579
                  srai         a3, t6, 11
                  mulhu        t4, a3, s6
                  addi         s7, t2, -1579
                  auipc        ra, 350999
                  c.addi       s5, -1
                  c.lui        gp, 4
                  c.xor        a2, s1
                  slli         sp, a1, 17
                  c.addi4spn   s1, sp, 192
                  c.add        s9, s7
                  c.addi16sp   sp, 224
                  sltu         t0, a4, t2
                  srai         a3, t6, 11
                  xori         a1, s1, 959
                  andi         gp, a0, 1810
                  c.srli       a5, 22
                  xori         a1, s1, 959
                  c.slli       t1, 10
                  c.xor        a2, s1
                  srai         a3, t6, 11
                  addi         s7, t2, -1579
                  div          s8, a5, a2
                  divu         s2, a4, s3
                  sub          a2, a0, a7
                  slt          ra, a3, a1
                  c.xor        a2, s1
                  c.and        a5, a1
                  c.slli       t1, 10
                  c.or         a5, a0
                  slli         sp, a1, 17
                  divu         s2, a4, s3
                  sub          a2, a0, a7
                  srli         s8, t3, 9
                  sra          s3, t0, s9
                  c.srli       a5, 22
                  srl          s3, a1, s4
                  sll          gp, s10, s11
                  rem          a3, s1, t6
                  c.slli       t1, 10
                  addi         s7, t2, -1579
                  sub          a2, a0, a7
                  c.addi4spn   s1, sp, 192
                  c.and        a5, a1
                  slt          ra, a3, a1
                  srli         s8, t3, 9
                  sltu         t0, a4, t2
                  lui          a2, 460343
                  lui          a2, 460343
                  c.xor        a2, s1
                  sll          gp, s10, s11
                  andi         gp, a0, 1810
                  c.srli       a5, 22
                  slt          ra, a3, a1
                  auipc        ra, 350999
                  auipc        ra, 350999
                  sltu         t0, a4, t2
                  ori          s3, s3, 1495
                  c.or         a5, a0
                  xori         a1, s1, 959
                  c.srai       a1, 18
                  c.addi       s5, -1
                  sub          a2, a0, a7
                  sra          s3, t0, s9
                  sltu         t0, a4, t2
                  and          sp, a0, gp
                  c.xor        a2, s1
                  div          s8, a5, a2
                  remu         gp, a4, s3
                  sub          a2, a0, a7
                  c.srai       a1, 18
                  nop
                  mulhsu       sp, s0, t5
                  srli         s8, t3, 9
                  sltiu        s6, zero, -1665
                  c.xor        a2, s1
                  c.xor        a2, s1
                  mulhsu       sp, s0, t5
                  rem          a3, s1, t6
                  c.xor        a2, s1
                  c.andi       a3, 13
                  remu         gp, a4, s3
                  c.nop
                  c.addi       s5, -1
                  c.addi16sp   sp, 224
                  nop
                  srai         a3, t6, 11
                  c.slli       t1, 10
                  srai         a3, t6, 11
                  c.nop
                  xori         a1, s1, 959
                  c.sub        a5, a3
                  c.addi       s5, -1
                  c.mv         t0, t6
                  mulh         s1, a7, a6
                  slti         t3, t5, -1062
                  lui          a2, 460343
                  c.slli       t1, 10
                  c.addi16sp   sp, 224
                  c.xor        a2, s1
                  c.srli       a5, 22
                  lui          a2, 460343
                  auipc        ra, 350999
                  xori         a1, s1, 959
                  c.addi       s5, -1
                  c.li         t2, 14
                  sltiu        s6, zero, -1665
                  c.srli       a5, 22
                  c.srli       a5, 22
                  ori          s3, s3, 1495
                  divu         s2, a4, s3
                  xori         a1, s1, 959
                  ori          s3, s3, 1495
                  add          a2, t3, t2
                  xori         a1, s1, 959
                  div          s8, a5, a2
                  c.srai       a1, 18
                  c.lui        gp, 4
                  xor          s6, gp, s0
                  srai         a3, t6, 11
                  c.andi       a3, 13
                  c.srli       a5, 22
                  srli         s8, t3, 9
                  andi         gp, a0, 1810
                  divu         s2, a4, s3
                  nop
                  div          s8, a5, a2
                  c.lui        gp, 4
                  srl          s3, a1, s4
                  lui          a2, 460343
                  c.mv         t0, t6
                  sltu         t0, a4, t2
                  c.li         t2, 14
                  remu         gp, a4, s3
                  sltu         t0, a4, t2
                  div          s8, a5, a2
                  mul          s5, zero, t4
                  srli         s8, t3, 9
                  ori          s3, s3, 1495
                  ori          s3, s3, 1495
                  srli         s8, t3, 9
                  srli         s8, t3, 9
                  slt          ra, a3, a1
                  c.lui        gp, 4
                  c.mv         t0, t6
                  add          a2, t3, t2
                  sltiu        s6, zero, -1665
                  slti         t3, t5, -1062
                  addi         s7, t2, -1579
                  addi         s7, t2, -1579
                  mulhu        t4, a3, s6
                  mulh         s1, a7, a6
                  c.srai       a1, 18
                  c.add        s9, s7
                  c.slli       t1, 10
                  c.addi       s5, -1
                  xori         a1, s1, 959
                  lui          a2, 460343
                  addi         s7, t2, -1579
                  andi         gp, a0, 1810
                  addi         s7, t2, -1579
                  mul          s5, zero, t4
                  ori          s3, s3, 1495
                  auipc        ra, 350999
                  sub          a2, a0, a7
                  slli         sp, a1, 17
                  slli         sp, a1, 17
                  c.mv         t0, t6
                  sltiu        s6, zero, -1665
                  c.and        a5, a1
                  div          s8, a5, a2
                  div          s8, a5, a2
                  div          s8, a5, a2
                  slti         t3, t5, -1062
                  remu         gp, a4, s3
                  mul          s5, zero, t4
                  div          s8, a5, a2
                  or           t4, a6, ra
                  div          s8, a5, a2
                  mulhu        t4, a3, s6
                  c.li         t2, 14
                  srli         s8, t3, 9
                  sll          gp, s10, s11
                  c.slli       t1, 10
                  addi         s7, t2, -1579
                  mulh         s1, a7, a6
                  srl          s3, a1, s4
                  c.sub        a5, a3
                  c.srai       a1, 18
                  srli         s8, t3, 9
                  c.mv         t0, t6
                  andi         gp, a0, 1810
                  xor          s6, gp, s0
                  ori          s3, s3, 1495
                  srli         s8, t3, 9
                  remu         gp, a4, s3
                  c.srai       a1, 18
                  c.andi       a3, 13
                  c.li         t2, 14
                  mulhsu       sp, s0, t5
                  c.srai       a1, 18
                  sub          a2, a0, a7
                  c.addi       s5, -1
                  c.addi       s5, -1
                  c.slli       t1, 10
                  xori         a1, s1, 959
                  c.addi16sp   sp, 224
                  mulh         s1, a7, a6
                  slli         sp, a1, 17
                  c.and        a5, a1
                  sltu         t0, a4, t2
                  andi         gp, a0, 1810
                  mulh         s1, a7, a6
                  srl          s3, a1, s4
                  div          s8, a5, a2
                  c.or         a5, a0
                  auipc        ra, 350999
                  srli         s8, t3, 9
                  slti         t3, t5, -1062
                  slti         t3, t5, -1062
                  c.srli       a5, 22
                  c.or         a5, a0
                  c.andi       a3, 13
                  auipc        ra, 350999
                  sll          gp, s10, s11
                  sltu         t0, a4, t2
                  sub          a2, a0, a7
                  addi         s7, t2, -1579
                  srli         s8, t3, 9
                  c.lui        gp, 4
                  ori          s3, s3, 1495
                  and          sp, a0, gp
                  andi         gp, a0, 1810
                  c.or         a5, a0
                  slti         t3, t5, -1062
                  sll          gp, s10, s11
                  and          sp, a0, gp
                  srli         s8, t3, 9
                  srai         a3, t6, 11
                  mul          s5, zero, t4
                  c.addi       s5, -1
                  mulh         s1, a7, a6
                  addi         s7, t2, -1579
                  remu         gp, a4, s3
                  xori         a1, s1, 959
                  c.add        s9, s7
                  and          sp, a0, gp
                  remu         gp, a4, s3
                  xori         a1, s1, 959
                  lui          a2, 460343
                  mulhsu       sp, s0, t5
                  c.add        s9, s7
                  add          a2, t3, t2
                  remu         gp, a4, s3
                  slli         sp, a1, 17
                  or           t4, a6, ra
                  c.addi       s5, -1
                  c.nop
                  mul          s5, zero, t4
                  addi         s7, t2, -1579
                  addi         s7, t2, -1579
                  c.xor        a2, s1
                  sra          s3, t0, s9
                  slli         sp, a1, 17
                  nop
                  c.sub        a5, a3
                  and          sp, a0, gp
                  nop
                  lui          a2, 460343
                  auipc        ra, 350999
                  nop
                  auipc        ra, 350999
                  mulh         s1, a7, a6
                  srai         a3, t6, 11
                  xor          s6, gp, s0
                  c.and        a5, a1
                  c.lui        gp, 4
                  c.add        s9, s7
                  mulhsu       sp, s0, t5
                  c.addi       s5, -1
                  sltiu        s6, zero, -1665
                  c.addi16sp   sp, 224
                  and          sp, a0, gp
                  nop
                  c.addi4spn   s1, sp, 192
                  c.lui        gp, 4
                  sltu         t0, a4, t2
                  c.mv         t0, t6
                  srli         s8, t3, 9
                  add          a2, t3, t2
                  c.andi       a3, 13
                  xor          s6, gp, s0
                  sra          s3, t0, s9
                  and          sp, a0, gp
                  add          a2, t3, t2
                  c.srli       a5, 22
                  sltiu        s6, zero, -1665
                  c.mv         t0, t6
                  nop
                  sll          gp, s10, s11
                  sltu         t0, a4, t2
                  slt          ra, a3, a1
                  c.lui        gp, 4
                  sra          s3, t0, s9
                  sltu         t0, a4, t2
                  add          a2, t3, t2
                  sltiu        s6, zero, -1665
                  c.sub        a5, a3
                  srli         s8, t3, 9
                  auipc        ra, 350999
                  addi         s7, t2, -1579
                  c.or         a5, a0
                  nop
                  and          sp, a0, gp
                  c.addi16sp   sp, 224
                  mulhu        t4, a3, s6
                  srli         s8, t3, 9
                  c.and        a5, a1
                  c.addi16sp   sp, 224
                  lui          a2, 460343
                  slli         sp, a1, 17
                  sub          a2, a0, a7
                  add          a2, t3, t2
                  c.addi4spn   s1, sp, 192
                  remu         gp, a4, s3
                  c.mv         t0, t6
                  ori          s3, s3, 1495
                  srl          s3, a1, s4
                  c.srai       a1, 18
                  c.andi       a3, 13
                  srai         a3, t6, 11
                  remu         gp, a4, s3
                  c.or         a5, a0
                  or           t4, a6, ra
                  mulh         s1, a7, a6
                  sll          gp, s10, s11
                  c.slli       t1, 10
                  c.srli       a5, 22
                  and          sp, a0, gp
                  c.slli       t1, 10
                  slli         sp, a1, 17
                  c.addi16sp   sp, 224
                  c.nop
                  mulh         s1, a7, a6
                  c.addi       s5, -1
                  c.xor        a2, s1
                  sll          gp, s10, s11
                  c.addi       s5, -1
                  divu         s2, a4, s3
                  rem          a3, s1, t6
                  ori          s3, s3, 1495
                  div          s8, a5, a2
                  addi         s7, t2, -1579
                  mulhu        t4, a3, s6
                  c.add        s9, s7
                  c.sub        a5, a3
                  c.xor        a2, s1
                  nop
                  c.slli       t1, 10
                  c.andi       a3, 13
                  sra          s3, t0, s9
                  add          a2, t3, t2
                  divu         s2, a4, s3
                  c.add        s9, s7
                  xori         a1, s1, 959
                  auipc        ra, 350999
                  c.addi16sp   sp, 224
                  ori          s3, s3, 1495
                  lui          a2, 460343
                  c.srli       a5, 22
                  lui          a2, 460343
                  c.add        s9, s7
                  c.nop
                  c.li         t2, 14
                  c.lui        gp, 4
                  or           t4, a6, ra
                  sltiu        s6, zero, -1665
                  slti         t3, t5, -1062
                  mulhsu       sp, s0, t5
                  c.srli       a5, 22
                  andi         gp, a0, 1810
                  srai         a3, t6, 11
                  andi         gp, a0, 1810
                  c.addi16sp   sp, 224
                  mul          s5, zero, t4
                  c.srli       a5, 22
                  c.addi       s5, -1
                  andi         gp, a0, 1810
                  divu         s2, a4, s3
                  andi         gp, a0, 1810
                  c.sub        a5, a3
                  nop
                  c.andi       a3, 13
                  slt          ra, a3, a1
                  c.and        a5, a1
                  c.li         t2, 14
                  srli         s8, t3, 9
                  divu         s2, a4, s3
                  nop
                  c.nop
                  srl          s3, a1, s4
                  xor          s6, gp, s0
                  lui          a2, 460343
                  or           t4, a6, ra
                  c.andi       a3, 13
                  sltiu        s6, zero, -1665
                  add          a2, t3, t2
                  divu         s2, a4, s3
                  mul          s5, zero, t4
                  slt          ra, a3, a1
                  remu         gp, a4, s3
                  add          a2, t3, t2
                  xor          s6, gp, s0
                  c.addi4spn   s1, sp, 192
                  mulhu        t4, a3, s6
                  c.or         a5, a0
                  ori          s3, s3, 1495
                  sltiu        s6, zero, -1665
                  divu         s2, a4, s3
                  c.or         a5, a0
                  c.addi       s5, -1
                  c.or         a5, a0
                  addi         s7, t2, -1579
                  c.and        a5, a1
                  xor          s6, gp, s0
                  c.addi4spn   s1, sp, 192
                  rem          a3, s1, t6
                  mul          s5, zero, t4
                  c.xor        a2, s1
                  c.lui        gp, 4
                  c.or         a5, a0
                  c.addi       s5, -1
                  c.xor        a2, s1
                  c.mv         t0, t6
                  add          a2, t3, t2
                  srl          s3, a1, s4
                  mulhsu       sp, s0, t5
                  srl          s3, a1, s4
                  mulhsu       sp, s0, t5
                  divu         s2, a4, s3
                  c.lui        gp, 4
                  c.andi       a3, 13
                  remu         gp, a4, s3
                  sra          s3, t0, s9
                  slt          ra, a3, a1
                  c.li         t2, 14
                  c.mv         t0, t6
                  mulhu        t4, a3, s6
                  c.addi4spn   s1, sp, 192
                  and          sp, a0, gp
                  c.sub        a5, a3
                  and          sp, a0, gp
                  c.add        s9, s7
                  c.lui        gp, 4
                  ori          s3, s3, 1495
                  c.srai       a1, 18
                  c.nop
                  c.or         a5, a0
                  xori         a1, s1, 959
                  c.sub        a5, a3
                  sltiu        s6, zero, -1665
                  c.mv         t0, t6
                  srl          s3, a1, s4
                  c.mv         t0, t6
                  remu         gp, a4, s3
                  srli         s8, t3, 9
                  sub          a2, a0, a7
                  c.li         t2, 14
                  srl          s3, a1, s4
                  sra          s3, t0, s9
                  c.nop
                  sra          s3, t0, s9
                  c.srai       a1, 18
                  ori          s3, s3, 1495
                  slti         t3, t5, -1062
                  c.addi       s5, -1
                  sra          s3, t0, s9
                  add          a2, t3, t2
                  c.sub        a5, a3
                  c.srli       a5, 22
                  slt          ra, a3, a1
                  xori         a1, s1, 959
                  remu         gp, a4, s3
                  c.addi16sp   sp, 224
                  srai         a3, t6, 11
                  ori          s3, s3, 1495
                  sltiu        s6, zero, -1665
                  mulhu        t4, a3, s6
                  sll          gp, s10, s11
                  srli         s8, t3, 9
                  xori         a1, s1, 959
                  and          sp, a0, gp
                  c.slli       t1, 10
                  c.addi16sp   sp, 224
                  c.nop
                  c.andi       a3, 13
                  c.slli       t1, 10
                  srl          s3, a1, s4
                  mul          s5, zero, t4
                  add          a2, t3, t2
                  srl          s3, a1, s4
                  c.srli       a5, 22
                  c.addi       s5, -1
                  sltu         t0, a4, t2
                  c.or         a5, a0
                  addi         s7, t2, -1579
                  srai         a3, t6, 11
                  lui          a2, 460343
                  remu         gp, a4, s3
                  lui          a2, 460343
                  c.addi       s5, -1
                  mulhsu       sp, s0, t5
                  rem          a3, s1, t6
                  div          s8, a5, a2
                  mulhsu       sp, s0, t5
                  sltu         t0, a4, t2
                  nop
                  c.addi       s5, -1
                  remu         gp, a4, s3
                  c.sub        a5, a3
                  sub          a2, a0, a7
                  c.mv         t0, t6
                  ori          s3, s3, 1495
                  add          a2, t3, t2
                  sra          s3, t0, s9
                  c.slli       t1, 10
                  c.or         a5, a0
                  srli         s8, t3, 9
                  andi         gp, a0, 1810
                  or           t4, a6, ra
                  mulhu        t4, a3, s6
                  slt          ra, a3, a1
                  c.mv         t0, t6
                  c.add        s9, s7
                  xor          s6, gp, s0
                  c.add        s9, s7
                  sub          a2, a0, a7
                  addi         s7, t2, -1579
                  sltu         t0, a4, t2
                  and          sp, a0, gp
                  mulhsu       sp, s0, t5
                  nop
                  rem          a3, s1, t6
                  c.addi16sp   sp, 224
                  rem          a3, s1, t6
                  auipc        ra, 350999
                  xor          s6, gp, s0
                  sltu         t0, a4, t2
                  or           t4, a6, ra
                  xor          s6, gp, s0
                  c.addi16sp   sp, 224
                  sra          s3, t0, s9
                  ori          s3, s3, 1495
                  c.mv         t0, t6
                  sra          s3, t0, s9
                  c.addi4spn   s1, sp, 192
                  c.andi       a3, 13
                  ori          s3, s3, 1495
                  slli         sp, a1, 17
                  xor          s6, gp, s0
                  c.srai       a1, 18
                  lui          a2, 460343
                  c.addi       s5, -1
                  or           t4, a6, ra
                  c.slli       t1, 10
                  c.add        s9, s7
                  srli         s8, t3, 9
                  c.or         a5, a0
                  addi         s7, t2, -1579
                  sub          a2, a0, a7
                  sub          a2, a0, a7
                  remu         gp, a4, s3
                  c.addi4spn   s1, sp, 192
                  slli         sp, a1, 17
                  c.slli       t1, 10
                  c.srai       a1, 18
                  slli         sp, a1, 17
                  andi         gp, a0, 1810
                  srli         s8, t3, 9
                  c.srai       a1, 18
                  lui          a2, 460343
                  c.mv         t0, t6
                  andi         gp, a0, 1810
                  c.addi       s5, -1
                  srli         s8, t3, 9
                  andi         gp, a0, 1810
                  c.addi16sp   sp, 224
                  srai         a3, t6, 11
                  sub          a2, a0, a7
                  auipc        ra, 350999
                  c.xor        a2, s1
                  nop
                  auipc        ra, 350999
                  sltiu        s6, zero, -1665
                  mulh         s1, a7, a6
                  andi         gp, a0, 1810
                  nop
                  c.addi       s5, -1
                  c.xor        a2, s1
                  add          a2, t3, t2
                  mulhu        t4, a3, s6
                  ori          s3, s3, 1495
                  srl          s3, a1, s4
                  xor          s6, gp, s0
                  c.srli       a5, 22
                  c.slli       t1, 10
                  c.and        a5, a1
                  srl          s3, a1, s4
                  c.xor        a2, s1
                  c.addi4spn   s1, sp, 192
                  sub          a2, a0, a7
                  xori         a1, s1, 959
                  c.and        a5, a1
                  divu         s2, a4, s3
                  c.li         t2, 14
                  srl          s3, a1, s4
                  c.andi       a3, 13
                  and          sp, a0, gp
                  andi         gp, a0, 1810
                  xor          s6, gp, s0
                  xor          s6, gp, s0
                  slti         t3, t5, -1062
                  remu         gp, a4, s3
                  sub          a2, a0, a7
                  c.li         t2, 14
                  ori          s3, s3, 1495
                  divu         s2, a4, s3
                  c.and        a5, a1
                  remu         gp, a4, s3
                  or           t4, a6, ra
                  c.sub        a5, a3
                  slti         t3, t5, -1062
                  ori          s3, s3, 1495
                  lui          a2, 460343
                  c.add        s9, s7
                  mulhsu       sp, s0, t5
                  add          a2, t3, t2
                  xori         a1, s1, 959
                  or           t4, a6, ra
                  mul          s5, zero, t4
                  c.xor        a2, s1
                  sra          s3, t0, s9
                  c.and        a5, a1
                  rem          a3, s1, t6
                  c.srli       a5, 22
                  srl          s3, a1, s4
                  c.addi       s5, -1
                  c.sub        a5, a3
                  divu         s2, a4, s3
                  srl          s3, a1, s4
                  c.srai       a1, 18
                  srli         s8, t3, 9
                  addi         s7, t2, -1579
                  sltiu        s6, zero, -1665
                  c.add        s9, s7
                  c.li         t2, 14
                  or           t4, a6, ra
                  addi         s7, t2, -1579
                  slli         sp, a1, 17
                  slt          ra, a3, a1
                  c.li         t2, 14
                  mul          s5, zero, t4
                  c.andi       a3, 13
                  sra          s3, t0, s9
                  c.and        a5, a1
                  c.li         t2, 14
                  c.add        s9, s7
                  ori          s3, s3, 1495
                  remu         gp, a4, s3
                  c.srli       a5, 22
                  ori          s3, s3, 1495
                  c.mv         t0, t6
                  divu         s2, a4, s3
                  c.andi       a3, 13
                  c.srli       a5, 22
                  sra          s3, t0, s9
                  divu         s2, a4, s3
                  xori         a1, s1, 959
                  mul          s5, zero, t4
                  c.mv         t0, t6
                  c.xor        a2, s1
                  c.slli       t1, 10
                  mulhu        t4, a3, s6
                  c.xor        a2, s1
                  or           t4, a6, ra
                  sra          s3, t0, s9
                  c.nop
                  c.andi       a3, 13
                  c.srai       a1, 18
                  c.sub        a5, a3
                  lui          a2, 460343
                  xor          s6, gp, s0
                  c.srli       a5, 22
                  add          a2, t3, t2
                  slt          ra, a3, a1
                  sltu         t0, a4, t2
                  and          sp, a0, gp
                  c.srli       a5, 22
                  remu         gp, a4, s3
                  c.srli       a5, 22
                  c.and        a5, a1
                  c.mv         t0, t6
                  or           t4, a6, ra
                  xor          s6, gp, s0
                  c.and        a5, a1
                  div          s8, a5, a2
                  add          a2, t3, t2
                  c.li         t2, 14
                  sltu         t0, a4, t2
                  c.add        s9, s7
                  srl          s3, a1, s4
                  mul          s5, zero, t4
                  ori          s3, s3, 1495
                  addi         s7, t2, -1579
                  c.lui        gp, 4
                  slli         sp, a1, 17
                  mul          s5, zero, t4
                  srli         s8, t3, 9
                  c.lui        gp, 4
                  c.xor        a2, s1
                  auipc        ra, 350999
                  sltu         t0, a4, t2
                  c.srli       a5, 22
                  div          s8, a5, a2
                  c.xor        a2, s1
                  c.addi16sp   sp, 224
                  sub          a2, a0, a7
                  c.nop
                  or           t4, a6, ra
                  nop
                  c.or         a5, a0
                  and          sp, a0, gp
                  slti         t3, t5, -1062
                  nop
                  slli         sp, a1, 17
                  sltu         t0, a4, t2
                  c.andi       a3, 13
                  remu         gp, a4, s3
                  c.add        s9, s7
                  c.sub        a5, a3
                  srli         s8, t3, 9
                  xor          s6, gp, s0
                  add          a2, t3, t2
                  add          a2, t3, t2
                  andi         gp, a0, 1810
                  c.sub        a5, a3
                  srl          s3, a1, s4
                  mul          s5, zero, t4
                  xor          s6, gp, s0
                  c.add        s9, s7
                  or           t4, a6, ra
                  c.addi16sp   sp, 224
                  c.addi       s5, -1
                  slt          ra, a3, a1
                  c.lui        gp, 4
                  mulh         s1, a7, a6
                  c.slli       t1, 10
                  slli         sp, a1, 17
                  mul          s5, zero, t4
                  c.srli       a5, 22
                  xori         a1, s1, 959
                  mulhsu       sp, s0, t5
                  c.nop
                  c.lui        gp, 4
                  c.lui        gp, 4
                  srai         a3, t6, 11
                  c.or         a5, a0
                  rem          a3, s1, t6
                  c.add        s9, s7
                  c.mv         t0, t6
                  c.lui        gp, 4
                  c.lui        gp, 4
                  ori          s3, s3, 1495
                  remu         gp, a4, s3
                  ori          s3, s3, 1495
                  srli         s8, t3, 9
                  c.or         a5, a0
                  lui          a2, 460343
                  c.addi16sp   sp, 224
                  c.addi4spn   s1, sp, 192
                  c.srai       a1, 18
                  mulh         s1, a7, a6
                  xor          s6, gp, s0
                  divu         s2, a4, s3
                  c.li         t2, 14
                  mulhu        t4, a3, s6
                  c.srai       a1, 18
                  srl          s3, a1, s4
                  c.add        s9, s7
                  c.or         a5, a0
                  nop
                  slli         sp, a1, 17
                  div          s8, a5, a2
                  slti         t3, t5, -1062
                  sltu         t0, a4, t2
                  sll          gp, s10, s11
                  c.li         t2, 14
                  slti         t3, t5, -1062
                  nop
                  c.addi16sp   sp, 224
                  srli         s8, t3, 9
                  sub          a2, a0, a7
                  xori         a1, s1, 959
                  mulhsu       sp, s0, t5
                  mulhsu       sp, s0, t5
                  c.andi       a3, 13
                  sltiu        s6, zero, -1665
                  c.slli       t1, 10
                  srl          s3, a1, s4
                  sub          a2, a0, a7
                  nop
                  c.lui        gp, 4
                  mulh         s1, a7, a6
                  rem          a3, s1, t6
                  divu         s2, a4, s3
                  rem          a3, s1, t6
                  c.addi       s5, -1
                  ori          s3, s3, 1495
                  mulhsu       sp, s0, t5
                  add          a2, t3, t2
                  c.andi       a3, 13
                  divu         s2, a4, s3
                  srli         s8, t3, 9
                  sra          s3, t0, s9
                  c.or         a5, a0
                  c.and        a5, a1
                  c.addi       s5, -1
                  c.addi16sp   sp, 224
                  add          a2, t3, t2
                  c.addi       s5, -1
                  c.or         a5, a0
                  c.addi4spn   s1, sp, 192
                  sltiu        s6, zero, -1665
                  sub          a2, a0, a7
                  c.addi4spn   s1, sp, 192
                  c.lui        gp, 4
                  slti         t3, t5, -1062
                  srl          s3, a1, s4
                  divu         s2, a4, s3
                  rem          a3, s1, t6
                  nop
                  xori         a1, s1, 959
                  mulh         s1, a7, a6
                  sub          a2, a0, a7
                  c.andi       a3, 13
                  addi         s7, t2, -1579
                  sub          a2, a0, a7
                  lui          a2, 460343
                  c.xor        a2, s1
                  srli         s8, t3, 9
                  srli         s8, t3, 9
                  c.add        s9, s7
                  c.add        s9, s7
                  mulhu        t4, a3, s6
                  andi         gp, a0, 1810
                  auipc        ra, 350999
                  or           t4, a6, ra
                  c.and        a5, a1
                  c.and        a5, a1
                  and          sp, a0, gp
                  andi         gp, a0, 1810
                  remu         gp, a4, s3
                  lui          a2, 460343
                  c.nop
                  c.lui        gp, 4
                  add          a2, t3, t2
                  addi         s7, t2, -1579
                  mulhu        t4, a3, s6
                  xor          s6, gp, s0
                  c.li         t2, 14
                  auipc        ra, 350999
                  rem          a3, s1, t6
                  c.sub        a5, a3
                  sub          a2, a0, a7
                  c.lui        gp, 4
                  mulhsu       sp, s0, t5
                  mul          s5, zero, t4
                  mulh         s1, a7, a6
                  mulh         s1, a7, a6
                  c.srai       a1, 18
                  c.li         t2, 14
                  lui          a2, 460343
                  xori         a1, s1, 959
                  c.or         a5, a0
                  andi         gp, a0, 1810
                  xori         a1, s1, 959
                  c.addi       s5, -1
                  rem          a3, s1, t6
                  slti         t3, t5, -1062
                  c.mv         t0, t6
                  srai         a3, t6, 11
                  srli         s8, t3, 9
                  sub          a2, a0, a7
                  c.and        a5, a1
                  c.andi       a3, 13
                  srl          s3, a1, s4
                  mulh         s1, a7, a6
                  mul          s5, zero, t4
                  add          a2, t3, t2
                  remu         gp, a4, s3
                  c.lui        gp, 4
                  c.and        a5, a1
                  srl          s3, a1, s4
                  lui          a2, 460343
                  sltiu        s6, zero, -1665
                  lui          a2, 460343
                  srai         a3, t6, 11
                  sll          gp, s10, s11
                  c.addi4spn   s1, sp, 192
                  slli         sp, a1, 17
                  rem          a3, s1, t6
                  c.nop
                  c.nop
                  slt          ra, a3, a1
                  or           t4, a6, ra
                  and          sp, a0, gp
                  c.xor        a2, s1
                  c.nop
                  mulhsu       sp, s0, t5
                  c.srai       a1, 18
                  slli         sp, a1, 17
                  srli         s8, t3, 9
                  slt          ra, a3, a1
                  srli         s8, t3, 9
                  c.li         t2, 14
                  divu         s2, a4, s3
                  c.srli       a5, 22
                  c.srai       a1, 18
                  c.sub        a5, a3
                  c.lui        gp, 4
                  c.addi4spn   s1, sp, 192
                  rem          a3, s1, t6
                  rem          a3, s1, t6
                  divu         s2, a4, s3
                  nop
                  c.srli       a5, 22
                  addi         s7, t2, -1579
                  sra          s3, t0, s9
                  c.sub        a5, a3
                  c.addi16sp   sp, 224
                  lui          a2, 460343
                  or           t4, a6, ra
                  c.xor        a2, s1
                  c.srai       a1, 18
                  sltiu        s6, zero, -1665
                  c.sub        a5, a3
                  c.or         a5, a0
                  slti         t3, t5, -1062
                  lui          a2, 460343
                  c.addi       s5, -1
                  sll          gp, s10, s11
                  c.andi       a3, 13
                  mulhsu       sp, s0, t5
                  div          s8, a5, a2
                  slli         sp, a1, 17
                  mulh         s1, a7, a6
                  remu         gp, a4, s3
                  nop
                  ori          s3, s3, 1495
                  c.and        a5, a1
                  c.add        s9, s7
                  c.and        a5, a1
                  andi         gp, a0, 1810
                  sltiu        s6, zero, -1665
                  sll          gp, s10, s11
                  ori          s3, s3, 1495
                  c.and        a5, a1
                  add          a2, t3, t2
                  c.srli       a5, 22
                  c.nop
                  c.srli       a5, 22
                  c.mv         t0, t6
                  c.xor        a2, s1
                  auipc        ra, 350999
                  sra          s3, t0, s9
                  srl          s3, a1, s4
                  rem          a3, s1, t6
                  nop
                  sra          s3, t0, s9
                  c.or         a5, a0
                  srl          s3, a1, s4
                  slt          ra, a3, a1
                  lui          a2, 460343
                  c.nop
                  c.addi4spn   s1, sp, 192
                  c.mv         t0, t6
                  andi         gp, a0, 1810
                  slt          ra, a3, a1
                  srli         s8, t3, 9
                  sll          gp, s10, s11
                  c.xor        a2, s1
                  c.xor        a2, s1
                  andi         gp, a0, 1810
                  auipc        ra, 350999
                  auipc        ra, 350999
                  remu         gp, a4, s3
                  slti         t3, t5, -1062
                  srl          s3, a1, s4
                  and          sp, a0, gp
                  c.xor        a2, s1
                  auipc        ra, 350999
                  slt          ra, a3, a1
                  c.andi       a3, 13
                  rem          a3, s1, t6
                  sra          s3, t0, s9
                  c.addi16sp   sp, 224
                  c.add        s9, s7
                  remu         gp, a4, s3
                  and          sp, a0, gp
                  c.nop
                  c.mv         t0, t6
                  and          sp, a0, gp
                  nop
                  slti         t3, t5, -1062
                  nop
                  c.addi       s5, -1
                  add          a2, t3, t2
                  mulhsu       sp, s0, t5
                  sra          s3, t0, s9
                  sltiu        s6, zero, -1665
                  xori         a1, s1, 959
                  ori          s3, s3, 1495
                  divu         s2, a4, s3
                  divu         s2, a4, s3
                  slti         t3, t5, -1062
                  ori          s3, s3, 1495
                  c.add        s9, s7
                  srai         a3, t6, 11
                  c.srli       a5, 22
                  c.mv         t0, t6
                  srl          s3, a1, s4
                  srai         a3, t6, 11
                  rem          a3, s1, t6
                  mulh         s1, a7, a6
                  divu         s2, a4, s3
                  sub          a2, a0, a7
                  srli         s8, t3, 9
                  c.srai       a1, 18
                  srl          s3, a1, s4
                  mulh         s1, a7, a6
                  or           t4, a6, ra
                  sra          s3, t0, s9
                  c.mv         t0, t6
                  sltu         t0, a4, t2
                  srli         s8, t3, 9
                  c.nop
                  remu         gp, a4, s3
                  c.srai       a1, 18
                  c.srli       a5, 22
                  c.mv         t0, t6
                  mul          s5, zero, t4
                  sra          s3, t0, s9
                  c.li         t2, 14
                  c.and        a5, a1
                  c.addi4spn   s1, sp, 192
                  c.slli       t1, 10
                  slli         sp, a1, 17
                  srai         a3, t6, 11
                  srai         a3, t6, 11
                  c.mv         t0, t6
                  ori          s3, s3, 1495
                  andi         gp, a0, 1810
                  lui          a2, 460343
                  srai         a3, t6, 11
                  sub          a2, a0, a7
                  c.andi       a3, 13
                  and          sp, a0, gp
                  mulhu        t4, a3, s6
                  c.andi       a3, 13
                  c.nop
                  xor          s6, gp, s0
                  and          sp, a0, gp
                  div          s8, a5, a2
                  slti         t3, t5, -1062
                  sltu         t0, a4, t2
                  mulhsu       sp, s0, t5
                  sub          a2, a0, a7
                  remu         gp, a4, s3
                  sltiu        s6, zero, -1665
                  add          a2, t3, t2
                  c.and        a5, a1
                  sltiu        s6, zero, -1665
                  mul          s5, zero, t4
                  sll          gp, s10, s11
                  c.addi       s5, -1
                  srli         s8, t3, 9
                  mulh         s1, a7, a6
                  nop
                  mul          s5, zero, t4
                  div          s8, a5, a2
                  c.addi16sp   sp, 224
                  andi         gp, a0, 1810
                  c.lui        gp, 4
                  c.srai       a1, 18
                  c.srai       a1, 18
                  sltu         t0, a4, t2
                  c.slli       t1, 10
                  c.add        s9, s7
                  c.srai       a1, 18
                  divu         s2, a4, s3
                  srl          s3, a1, s4
                  slt          ra, a3, a1
                  mulhu        t4, a3, s6
                  srli         s8, t3, 9
                  xor          s6, gp, s0
                  sltiu        s6, zero, -1665
                  addi         s7, t2, -1579
                  mulh         s1, a7, a6
                  sll          gp, s10, s11
                  c.srli       a5, 22
                  and          sp, a0, gp
                  mulhsu       sp, s0, t5
                  c.xor        a2, s1
                  sll          gp, s10, s11
                  add          a2, t3, t2
                  xor          s6, gp, s0
                  c.or         a5, a0
                  sltiu        s6, zero, -1665
                  c.srai       a1, 18
                  mulhsu       sp, s0, t5
                  add          a2, t3, t2
                  mulhu        t4, a3, s6
                  c.xor        a2, s1
                  c.mv         t0, t6
                  c.slli       t1, 10
                  and          sp, a0, gp
                  mul          s5, zero, t4
                  divu         s2, a4, s3
                  slli         sp, a1, 17
                  mulh         s1, a7, a6
                  srl          s3, a1, s4
                  c.mv         t0, t6
                  c.lui        gp, 4
                  xori         a1, s1, 959
                  remu         gp, a4, s3
                  srl          s3, a1, s4
                  mul          s5, zero, t4
                  xor          s6, gp, s0
                  sub          a2, a0, a7
                  c.slli       t1, 10
                  lui          a2, 460343
                  andi         gp, a0, 1810
                  sub          a2, a0, a7
                  mulhsu       sp, s0, t5
                  sra          s3, t0, s9
                  c.sub        a5, a3
                  c.andi       a3, 13
                  c.mv         t0, t6
                  c.lui        gp, 4
                  remu         gp, a4, s3
                  c.slli       t1, 10
                  or           t4, a6, ra
                  slti         t3, t5, -1062
                  or           t4, a6, ra
                  c.or         a5, a0
                  mul          s5, zero, t4
                  xori         a1, s1, 959
                  slt          ra, a3, a1
                  c.add        s9, s7
                  xor          s6, gp, s0
                  c.add        s9, s7
                  mulhu        t4, a3, s6
                  nop
                  nop
                  nop
                  c.addi16sp   sp, 224
                  divu         s2, a4, s3
                  c.addi       s5, -1
                  c.add        s9, s7
                  mulh         s1, a7, a6
                  remu         gp, a4, s3
                  sltiu        s6, zero, -1665
                  andi         gp, a0, 1810
                  lui          a2, 460343
                  or           t4, a6, ra
                  srl          s3, a1, s4
                  lui          a2, 460343
                  auipc        ra, 350999
                  divu         s2, a4, s3
                  mulh         s1, a7, a6
                  c.li         t2, 14
                  srai         a3, t6, 11
                  xor          s6, gp, s0
                  c.srai       a1, 18
                  sub          a2, a0, a7
                  srli         s8, t3, 9
                  srai         a3, t6, 11
                  andi         gp, a0, 1810
                  c.li         t2, 14
                  lui          a2, 460343
                  mulhu        t4, a3, s6
                  c.addi16sp   sp, 224
                  c.add        s9, s7
                  rem          a3, s1, t6
                  slli         sp, a1, 17
                  rem          a3, s1, t6
                  c.srai       a1, 18
                  sll          gp, s10, s11
                  sltu         t0, a4, t2
                  srli         s8, t3, 9
                  sub          a2, a0, a7
                  c.mv         t0, t6
                  srai         a3, t6, 11
                  sub          a2, a0, a7
                  srai         a3, t6, 11
                  lui          a2, 460343
                  sra          s3, t0, s9
                  sub          a2, a0, a7
                  and          sp, a0, gp
                  slli         sp, a1, 17
                  c.srai       a1, 18
                  slt          ra, a3, a1
                  sll          gp, s10, s11
                  xori         a1, s1, 959
                  divu         s2, a4, s3
                  c.sub        a5, a3
                  mul          s5, zero, t4
                  sltiu        s6, zero, -1665
                  sra          s3, t0, s9
                  andi         gp, a0, 1810
                  srli         s8, t3, 9
                  c.add        s9, s7
                  c.and        a5, a1
                  slli         sp, a1, 17
                  c.srli       a5, 22
                  add          a2, t3, t2
                  c.or         a5, a0
                  slli         sp, a1, 17
                  c.add        s9, s7
                  div          s8, a5, a2
                  c.or         a5, a0
                  mul          s5, zero, t4
                  mulh         s1, a7, a6
                  mulhu        t4, a3, s6
                  xor          s6, gp, s0
                  sltu         t0, a4, t2
                  c.add        s9, s7
                  c.or         a5, a0
                  sub          a2, a0, a7
                  c.li         t2, 14
                  slt          ra, a3, a1
                  c.slli       t1, 10
                  c.add        s9, s7
                  remu         gp, a4, s3
                  c.nop
                  xori         a1, s1, 959
                  c.srai       a1, 18
                  xori         a1, s1, 959
                  div          s8, a5, a2
                  ori          s3, s3, 1495
                  sll          gp, s10, s11
                  mulh         s1, a7, a6
                  sltiu        s6, zero, -1665
                  srl          s3, a1, s4
                  sra          s3, t0, s9
                  c.or         a5, a0
                  mulhu        t4, a3, s6
                  c.addi       s5, -1
                  remu         gp, a4, s3
                  and          sp, a0, gp
                  or           t4, a6, ra
                  c.addi16sp   sp, 224
                  sub          a2, a0, a7
                  sltiu        s6, zero, -1665
                  ori          s3, s3, 1495
                  slt          ra, a3, a1
                  c.srai       a1, 18
                  c.addi16sp   sp, 224
                  c.andi       a3, 13
                  sub          a2, a0, a7
                  lui          a2, 460343
                  c.sub        a5, a3
                  sltu         t0, a4, t2
                  srai         a3, t6, 11
                  c.and        a5, a1
                  srli         s8, t3, 9
                  div          s8, a5, a2
                  slli         sp, a1, 17
                  nop
                  c.and        a5, a1
                  mulh         s1, a7, a6
                  or           t4, a6, ra
                  mulhu        t4, a3, s6
                  c.mv         t0, t6
                  c.and        a5, a1
                  c.addi       s5, -1
                  c.nop
                  c.nop
                  div          s8, a5, a2
                  or           t4, a6, ra
                  or           t4, a6, ra
                  ori          s3, s3, 1495
                  sltu         t0, a4, t2
                  c.and        a5, a1
                  div          s8, a5, a2
                  rem          a3, s1, t6
                  sra          s3, t0, s9
                  sltiu        s6, zero, -1665
                  and          sp, a0, gp
                  xor          s6, gp, s0
                  c.nop
                  c.or         a5, a0
                  mulhu        t4, a3, s6
                  or           t4, a6, ra
                  lui          a2, 460343
                  and          sp, a0, gp
                  nop
                  ori          s3, s3, 1495
                  c.xor        a2, s1
                  c.or         a5, a0
                  srai         a3, t6, 11
                  c.andi       a3, 13
                  c.slli       t1, 10
                  c.add        s9, s7
                  rem          a3, s1, t6
                  c.lui        gp, 4
                  c.srai       a1, 18
                  srai         a3, t6, 11
                  mul          s5, zero, t4
                  c.and        a5, a1
                  addi         s7, t2, -1579
                  sll          gp, s10, s11
                  xori         a1, s1, 959
                  c.addi16sp   sp, 224
                  mul          s5, zero, t4
                  srai         a3, t6, 11
                  rem          a3, s1, t6
                  c.sub        a5, a3
                  or           t4, a6, ra
                  add          a2, t3, t2
                  and          sp, a0, gp
                  slt          ra, a3, a1
                  ori          s3, s3, 1495
                  div          s8, a5, a2
                  rem          a3, s1, t6
                  c.slli       t1, 10
                  sra          s3, t0, s9
                  sltiu        s6, zero, -1665
                  c.add        s9, s7
                  mulh         s1, a7, a6
                  sltiu        s6, zero, -1665
                  lui          a2, 460343
                  mulhsu       sp, s0, t5
                  c.lui        gp, 4
                  c.li         t2, 14
                  srl          s3, a1, s4
                  auipc        ra, 350999
                  srai         a3, t6, 11
                  mulhu        t4, a3, s6
                  sub          a2, a0, a7
                  c.li         t2, 14
                  c.addi16sp   sp, 224
                  addi         s7, t2, -1579
                  srai         a3, t6, 11
                  mulhsu       sp, s0, t5
                  c.li         t2, 14
                  div          s8, a5, a2
                  c.addi4spn   s1, sp, 192
                  c.add        s9, s7
                  mul          s5, zero, t4
                  srli         s8, t3, 9
                  mulh         s1, a7, a6
                  lui          a2, 460343
                  lui          a2, 460343
                  srl          s3, a1, s4
                  addi         s7, t2, -1579
                  div          s8, a5, a2
                  xor          s6, gp, s0
                  xori         a1, s1, 959
                  xori         a1, s1, 959
                  c.srli       a5, 22
                  sub          a2, a0, a7
                  slt          ra, a3, a1
                  andi         gp, a0, 1810
                  rem          a3, s1, t6
                  sra          s3, t0, s9
                  sltiu        s6, zero, -1665
                  and          sp, a0, gp
                  sub          a2, a0, a7
                  auipc        ra, 350999
                  c.and        a5, a1
                  c.addi       s5, -1
                  add          a2, t3, t2
                  c.addi       s5, -1
                  srai         a3, t6, 11
                  c.sub        a5, a3
                  c.xor        a2, s1
                  c.or         a5, a0
                  and          sp, a0, gp
                  c.addi16sp   sp, 224
                  remu         gp, a4, s3
                  sltu         t0, a4, t2
                  xori         a1, s1, 959
                  slt          ra, a3, a1
                  slti         t3, t5, -1062
                  lui          a2, 460343
                  add          a2, t3, t2
                  c.or         a5, a0
                  xor          s6, gp, s0
                  sltu         t0, a4, t2
                  addi         s7, t2, -1579
                  or           t4, a6, ra
                  add          a2, t3, t2
                  addi         s7, t2, -1579
                  c.addi       s5, -1
                  add          a2, t3, t2
                  slt          ra, a3, a1
                  slli         sp, a1, 17
                  slt          ra, a3, a1
                  add          a2, t3, t2
                  c.add        s9, s7
                  slti         t3, t5, -1062
                  srai         a3, t6, 11
                  c.slli       t1, 10
                  add          a2, t3, t2
                  mulhsu       sp, s0, t5
                  mulhu        t4, a3, s6
                  mulh         s1, a7, a6
                  lui          a2, 460343
                  mulhsu       sp, s0, t5
                  mulhsu       sp, s0, t5
                  nop
                  addi         s7, t2, -1579
                  mulhsu       sp, s0, t5
                  mul          s5, zero, t4
                  mulhsu       sp, s0, t5
                  srai         a3, t6, 11
                  nop
                  c.nop
                  nop
                  srl          s3, a1, s4
                  auipc        ra, 350999
                  c.srli       a5, 22
                  srli         s8, t3, 9
                  or           t4, a6, ra
                  rem          a3, s1, t6
                  sra          s3, t0, s9
                  auipc        ra, 350999
                  c.and        a5, a1
                  mulh         s1, a7, a6
                  c.mv         t0, t6
                  sra          s3, t0, s9
                  c.addi16sp   sp, 224
                  c.addi       s5, -1
                  rem          a3, s1, t6
                  slli         sp, a1, 17
                  divu         s2, a4, s3
                  c.addi       s5, -1
                  c.and        a5, a1
                  c.addi4spn   s1, sp, 192
                  remu         gp, a4, s3
                  mulhu        t4, a3, s6
                  slli         sp, a1, 17
                  addi         s7, t2, -1579
                  mulhu        t4, a3, s6
                  addi         s7, t2, -1579
                  c.addi4spn   s1, sp, 192
                  sltiu        s6, zero, -1665
                  slt          ra, a3, a1
                  c.slli       t1, 10
                  c.and        a5, a1
                  srl          s3, a1, s4
                  slti         t3, t5, -1062
                  divu         s2, a4, s3
                  divu         s2, a4, s3
                  div          s8, a5, a2
                  slti         t3, t5, -1062
                  add          a2, t3, t2
                  ori          s3, s3, 1495
                  remu         gp, a4, s3
                  div          s8, a5, a2
                  rem          a3, s1, t6
                  c.or         a5, a0
                  div          s8, a5, a2
                  c.addi16sp   sp, 224
                  mulh         s1, a7, a6
                  c.sub        a5, a3
                  addi         s7, t2, -1579
                  mul          s5, zero, t4
                  c.and        a5, a1
                  c.srai       a1, 18
                  sll          gp, s10, s11
                  c.andi       a3, 13
                  xor          s6, gp, s0
                  slti         t3, t5, -1062
                  sub          a2, a0, a7
                  c.add        s9, s7
                  c.addi       s5, -1
                  c.addi       s5, -1
                  srl          s3, a1, s4
                  srai         a3, t6, 11
                  sub          a2, a0, a7
                  or           t4, a6, ra
                  andi         gp, a0, 1810
                  c.sub        a5, a3
                  c.srai       a1, 18
                  c.nop
                  c.addi16sp   sp, 224
                  lui          a2, 460343
                  c.addi4spn   s1, sp, 192
                  sra          s3, t0, s9
                  add          a2, t3, t2
                  c.addi       s5, -1
                  mulhu        t4, a3, s6
                  c.add        s9, s7
                  c.addi4spn   s1, sp, 192
                  srai         a3, t6, 11
                  c.srai       a1, 18
                  mul          s5, zero, t4
                  remu         gp, a4, s3
                  slti         t3, t5, -1062
                  c.lui        gp, 4
                  divu         s2, a4, s3
                  xor          s6, gp, s0
                  xor          s6, gp, s0
                  c.and        a5, a1
                  sll          gp, s10, s11
                  c.lui        gp, 4
                  c.or         a5, a0
                  c.sub        a5, a3
                  and          sp, a0, gp
                  c.addi       s5, -1
                  sll          gp, s10, s11
                  addi         s7, t2, -1579
                  rem          a3, s1, t6
                  mulhu        t4, a3, s6
                  slt          ra, a3, a1
                  sltiu        s6, zero, -1665
                  c.andi       a3, 13
                  ori          s3, s3, 1495
                  c.add        s9, s7
                  mulh         s1, a7, a6
                  c.nop
                  c.srai       a1, 18
                  c.li         t2, 14
                  div          s8, a5, a2
                  c.slli       t1, 10
                  sub          a2, a0, a7
                  div          s8, a5, a2
                  rem          a3, s1, t6
                  c.and        a5, a1
                  c.slli       t1, 10
                  c.li         t2, 14
                  sltiu        s6, zero, -1665
                  sra          s3, t0, s9
                  c.addi       s5, -1
                  and          sp, a0, gp
                  c.addi16sp   sp, 224
                  mulhu        t4, a3, s6
                  slt          ra, a3, a1
                  slt          ra, a3, a1
                  xori         a1, s1, 959
                  or           t4, a6, ra
                  c.srai       a1, 18
                  addi         s7, t2, -1579
                  c.xor        a2, s1
                  add          a2, t3, t2
                  div          s8, a5, a2
                  sll          gp, s10, s11
                  xor          s6, gp, s0
                  divu         s2, a4, s3
                  slti         t3, t5, -1062
                  slli         sp, a1, 17
                  mulhsu       sp, s0, t5
                  or           t4, a6, ra
                  slli         sp, a1, 17
                  div          s8, a5, a2
                  c.mv         t0, t6
                  c.nop
                  slt          ra, a3, a1
                  c.addi16sp   sp, 224
                  or           t4, a6, ra
                  rem          a3, s1, t6
                  mulhsu       sp, s0, t5
                  mulhsu       sp, s0, t5
                  div          s8, a5, a2
                  c.srli       a5, 22
                  sll          gp, s10, s11
                  c.addi16sp   sp, 224
                  c.xor        a2, s1
                  xori         a1, s1, 959
                  srai         a3, t6, 11
                  c.addi       s5, -1
                  c.add        s9, s7
                  mul          s5, zero, t4
                  c.xor        a2, s1
                  rem          a3, s1, t6
                  c.add        s9, s7
                  slti         t3, t5, -1062
                  c.srli       a5, 22
                  srl          s3, a1, s4
                  and          sp, a0, gp
                  mulh         s1, a7, a6
                  srai         a3, t6, 11
                  c.add        s9, s7
                  c.addi4spn   s1, sp, 192
                  c.andi       a3, 13
                  sll          gp, s10, s11
                  and          sp, a0, gp
                  mulhsu       sp, s0, t5
                  sltiu        s6, zero, -1665
                  slli         sp, a1, 17
                  c.addi4spn   s1, sp, 192
                  xori         a1, s1, 959
                  c.addi4spn   s1, sp, 192
                  nop
                  c.sub        a5, a3
                  c.mv         t0, t6
                  srli         s8, t3, 9
                  lui          a2, 460343
                  slli         sp, a1, 17
                  addi         s7, t2, -1579
                  c.li         t2, 14
                  c.and        a5, a1
                  mulhsu       sp, s0, t5
                  auipc        ra, 350999
                  c.sub        a5, a3
                  c.li         t2, 14
                  rem          a3, s1, t6
                  srai         a3, t6, 11
                  sub          a2, a0, a7
                  remu         gp, a4, s3
                  divu         s2, a4, s3
                  nop
                  andi         gp, a0, 1810
                  div          s8, a5, a2
                  xori         a1, s1, 959
                  mulh         s1, a7, a6
                  xor          s6, gp, s0
                  srl          s3, a1, s4
                  slt          ra, a3, a1
                  sll          gp, s10, s11
                  or           t4, a6, ra
                  andi         gp, a0, 1810
                  sltu         t0, a4, t2
                  srai         a3, t6, 11
                  ori          s3, s3, 1495
                  c.add        s9, s7
                  and          sp, a0, gp
                  mul          s5, zero, t4
                  ori          s3, s3, 1495
                  c.and        a5, a1
                  or           t4, a6, ra
                  sltu         t0, a4, t2
                  and          sp, a0, gp
                  mul          s5, zero, t4
                  mulhsu       sp, s0, t5
                  ori          s3, s3, 1495
                  sll          gp, s10, s11
                  mul          s5, zero, t4
                  xori         a1, s1, 959
                  sll          gp, s10, s11
                  c.andi       a3, 13
                  c.or         a5, a0
                  c.add        s9, s7
                  mul          s5, zero, t4
                  xor          s6, gp, s0
                  c.slli       t1, 10
                  c.or         a5, a0
                  divu         s2, a4, s3
                  c.addi16sp   sp, 224
                  sltu         t0, a4, t2
                  c.nop
                  addi         s7, t2, -1579
                  mul          s5, zero, t4
                  sll          gp, s10, s11
                  and          sp, a0, gp
                  divu         s2, a4, s3
                  c.or         a5, a0
                  mul          s5, zero, t4
                  c.xor        a2, s1
                  sra          s3, t0, s9
                  andi         gp, a0, 1810
                  add          a2, t3, t2
                  c.srai       a1, 18
                  add          a2, t3, t2
                  c.xor        a2, s1
                  c.srai       a1, 18
                  xori         a1, s1, 959
                  srai         a3, t6, 11
                  ori          s3, s3, 1495
                  sub          a2, a0, a7
                  c.and        a5, a1
                  or           t4, a6, ra
                  add          a2, t3, t2
                  slt          ra, a3, a1
                  c.addi16sp   sp, 224
                  slti         t3, t5, -1062
                  c.mv         t0, t6
                  c.andi       a3, 13
                  c.andi       a3, 13
                  nop
                  c.li         t2, 14
                  mulhu        t4, a3, s6
                  c.nop
                  c.srli       a5, 22
                  c.andi       a3, 13
                  c.srai       a1, 18
                  srai         a3, t6, 11
                  mulhsu       sp, s0, t5
                  srl          s3, a1, s4
                  c.add        s9, s7
                  sll          gp, s10, s11
                  lui          a2, 460343
                  sltiu        s6, zero, -1665
                  rem          a3, s1, t6
                  c.mv         t0, t6
                  andi         gp, a0, 1810
                  nop
                  divu         s2, a4, s3
                  c.addi16sp   sp, 224
                  c.addi16sp   sp, 224
                  and          sp, a0, gp
                  c.or         a5, a0
                  sub          a2, a0, a7
                  sub          a2, a0, a7
                  c.lui        gp, 4
                  c.addi4spn   s1, sp, 192
                  c.srai       a1, 18
                  and          sp, a0, gp
                  sltiu        s6, zero, -1665
                  nop
                  xor          s6, gp, s0
                  sltiu        s6, zero, -1665
                  sltu         t0, a4, t2
                  mulhu        t4, a3, s6
                  divu         s2, a4, s3
                  andi         gp, a0, 1810
                  slt          ra, a3, a1
                  c.andi       a3, 13
                  c.mv         t0, t6
                  sra          s3, t0, s9
                  srai         a3, t6, 11
                  div          s8, a5, a2
                  sub          a2, a0, a7
                  srai         a3, t6, 11
                  sub          a2, a0, a7
                  xor          s6, gp, s0
                  sltu         t0, a4, t2
                  c.andi       a3, 13
                  sltiu        s6, zero, -1665
                  andi         gp, a0, 1810
                  lui          a2, 460343
                  addi         s7, t2, -1579
                  sub          a2, a0, a7
                  and          sp, a0, gp
                  srai         a3, t6, 11
                  c.or         a5, a0
                  c.and        a5, a1
                  sltu         t0, a4, t2
                  xori         a1, s1, 959
                  divu         s2, a4, s3
                  c.lui        gp, 4
                  sltiu        s6, zero, -1665
                  sltiu        s6, zero, -1665
                  c.srai       a1, 18
                  auipc        ra, 350999
                  c.addi4spn   s1, sp, 192
                  rem          a3, s1, t6
                  c.nop
                  and          sp, a0, gp
                  sra          s3, t0, s9
                  c.xor        a2, s1
                  sltu         t0, a4, t2
                  ori          s3, s3, 1495
                  srai         a3, t6, 11
                  srli         s8, t3, 9
                  or           t4, a6, ra
                  c.sub        a5, a3
                  lui          a2, 460343
                  remu         gp, a4, s3
                  mul          s5, zero, t4
                  slti         t3, t5, -1062
                  mulhu        t4, a3, s6
                  and          sp, a0, gp
                  addi         s7, t2, -1579
                  xor          s6, gp, s0
                  mul          s5, zero, t4
                  srai         a3, t6, 11
                  addi         s7, t2, -1579
                  and          sp, a0, gp
                  c.and        a5, a1
                  remu         gp, a4, s3
                  slti         t3, t5, -1062
                  c.addi16sp   sp, 224
                  lui          a2, 460343
                  c.xor        a2, s1
                  srl          s3, a1, s4
                  slt          ra, a3, a1
                  slt          ra, a3, a1
                  sra          s3, t0, s9
                  c.srai       a1, 18
                  c.or         a5, a0
                  c.and        a5, a1
                  nop
                  sra          s3, t0, s9
                  c.li         t2, 14
                  c.nop
                  srai         a3, t6, 11
                  remu         gp, a4, s3
                  or           t4, a6, ra
                  c.or         a5, a0
                  c.add        s9, s7
                  sltu         t0, a4, t2
                  mulhu        t4, a3, s6
                  remu         gp, a4, s3
                  c.or         a5, a0
                  c.srai       a1, 18
                  lui          a2, 460343
                  slti         t3, t5, -1062
                  c.lui        gp, 4
                  auipc        ra, 350999
                  divu         s2, a4, s3
                  or           t4, a6, ra
                  c.xor        a2, s1
                  nop
                  srl          s3, a1, s4
                  ori          s3, s3, 1495
                  srl          s3, a1, s4
                  c.nop
                  c.add        s9, s7
                  slti         t3, t5, -1062
                  c.add        s9, s7
                  c.srai       a1, 18
                  c.xor        a2, s1
                  auipc        ra, 350999
                  sra          s3, t0, s9
                  c.addi       s5, -1
                  slt          ra, a3, a1
                  c.add        s9, s7
                  mul          s5, zero, t4
                  mul          s5, zero, t4
                  c.slli       t1, 10
                  divu         s2, a4, s3
                  sltiu        s6, zero, -1665
                  slti         t3, t5, -1062
                  c.addi4spn   s1, sp, 192
                  xor          s6, gp, s0
                  c.nop
                  srli         s8, t3, 9
                  sll          gp, s10, s11
                  c.addi       s5, -1
                  c.add        s9, s7
                  andi         gp, a0, 1810
                  or           t4, a6, ra
                  c.add        s9, s7
                  slti         t3, t5, -1062
                  srai         a3, t6, 11
                  c.addi16sp   sp, 224
                  or           t4, a6, ra
                  slt          ra, a3, a1
                  mulh         s1, a7, a6
                  c.li         t2, 14
                  c.addi4spn   s1, sp, 192
                  auipc        ra, 350999
                  c.and        a5, a1
                  mul          s5, zero, t4
                  c.addi       s5, -1
                  sra          s3, t0, s9
                  addi         s7, t2, -1579
                  slli         sp, a1, 17
                  mul          s5, zero, t4
                  c.addi4spn   s1, sp, 192
                  c.andi       a3, 13
                  andi         gp, a0, 1810
                  addi         s7, t2, -1579
                  c.andi       a3, 13
                  and          sp, a0, gp
                  nop
                  c.addi16sp   sp, 224
                  div          s8, a5, a2
                  c.nop
                  mul          s5, zero, t4
                  xor          s6, gp, s0
                  c.addi4spn   s1, sp, 192
                  sltiu        s6, zero, -1665
                  c.addi16sp   sp, 224
                  c.lui        gp, 4
                  slti         t3, t5, -1062
                  c.addi4spn   s1, sp, 192
                  remu         gp, a4, s3
                  ori          s3, s3, 1495
                  add          a2, t3, t2
                  or           t4, a6, ra
                  sra          s3, t0, s9
                  xor          s6, gp, s0
                  sra          s3, t0, s9
                  slt          ra, a3, a1
                  mulh         s1, a7, a6
                  c.slli       t1, 10
                  c.li         t2, 14
                  add          a2, t3, t2
                  c.andi       a3, 13
                  sll          gp, s10, s11
                  div          s8, a5, a2
                  c.xor        a2, s1
                  c.slli       t1, 10
                  c.or         a5, a0
                  or           t4, a6, ra
                  c.sub        a5, a3
                  c.lui        gp, 4
                  c.addi16sp   sp, 224
                  or           t4, a6, ra
                  sra          s3, t0, s9
                  mulh         s1, a7, a6
                  mulhu        t4, a3, s6
                  slli         sp, a1, 17
                  divu         s2, a4, s3
                  lui          a2, 460343
                  srai         a3, t6, 11
                  and          sp, a0, gp
                  c.li         t2, 14
                  c.srli       a5, 22
                  sltu         t0, a4, t2
                  div          s8, a5, a2
                  andi         gp, a0, 1810
                  ori          s3, s3, 1495
                  rem          a3, s1, t6
                  mulh         s1, a7, a6
                  mulhu        t4, a3, s6
                  c.or         a5, a0
                  rem          a3, s1, t6
                  srai         a3, t6, 11
                  xor          s6, gp, s0
                  addi         s7, t2, -1579
                  divu         s2, a4, s3
                  sra          s3, t0, s9
                  c.or         a5, a0
                  sltiu        s6, zero, -1665
                  add          a2, t3, t2
                  sltiu        s6, zero, -1665
                  c.li         t2, 14
                  sll          gp, s10, s11
                  ori          s3, s3, 1495
                  slti         t3, t5, -1062
                  la x10, test_done
                  jalr x0, x10, 0
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
                  addi x30, x30, -4
                  sw  x16, (x30)
                  add x16, x30, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x30, x16, zero
                  csrr x27, 0x300 # MSTATUS
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 31
                  bne x27, x0, mmode_intr_handler

mmode_exception_handler:
                  csrr x27, 0x341 # MEPC
                  csrr x27, 0x342 # MCAUSE
                  li x14, 0x3 # BREAKPOINT
                  beq x27, x14, ebreak_handler
                  li x14, 0x8 # ECALL_UMODE
                  beq x27, x14, ecall_handler
                  li x14, 0x9 # ECALL_SMODE
                  beq x27, x14, ecall_handler
                  li x14, 0xb # ECALL_MMODE
                  beq x27, x14, ecall_handler
                  li x14, 0x1
                  beq x27, x14, instr_fault_handler
                  li x14, 0x5
                  beq x27, x14, load_fault_handler
                  li x14, 0x7
                  beq x27, x14, store_fault_handler
                  li x14, 0xc
                  beq x27, x14, pt_fault_handler
                  li x14, 0xd
                  beq x27, x14, pt_fault_handler
                  li x14, 0xf
                  beq x27, x14, pt_fault_handler
                  li x14, 0x2 # ILLEGAL_INSTRUCTION
                  beq x27, x14, illegal_instr_handler
                  csrr x14, 0x343 # MTVAL
                  1: la x10, test_done
                  jalr x1, x10, 0

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
                  la x10, write_tohost
                  jalr x0, x10, 0

instr_fault_handler:
                  add x16, x30, zero
                  lw  x1, 4(x16)
                  lw  x2, 8(x16)
                  lw  x3, 12(x16)
                  lw  x4, 16(x16)
                  lw  x5, 20(x16)
                  lw  x6, 24(x16)
                  lw  x7, 28(x16)
                  lw  x8, 32(x16)
                  lw  x9, 36(x16)
                  lw  x10, 40(x16)
                  lw  x11, 44(x16)
                  lw  x12, 48(x16)
                  lw  x13, 52(x16)
                  lw  x14, 56(x16)
                  lw  x15, 60(x16)
                  lw  x16, 64(x16)
                  lw  x17, 68(x16)
                  lw  x18, 72(x16)
                  lw  x19, 76(x16)
                  lw  x20, 80(x16)
                  lw  x21, 84(x16)
                  lw  x22, 88(x16)
                  lw  x23, 92(x16)
                  lw  x24, 96(x16)
                  lw  x25, 100(x16)
                  lw  x26, 104(x16)
                  lw  x27, 108(x16)
                  lw  x28, 112(x16)
                  lw  x29, 116(x16)
                  lw  x30, 120(x16)
                  lw  x31, 124(x16)
                  addi x16, x16, 128
                  add x30, x16, zero
                  lw  x16, (x30)
                  addi x30, x30, 4
                  mret

load_fault_handler:
                  add x16, x30, zero
                  lw  x1, 4(x16)
                  lw  x2, 8(x16)
                  lw  x3, 12(x16)
                  lw  x4, 16(x16)
                  lw  x5, 20(x16)
                  lw  x6, 24(x16)
                  lw  x7, 28(x16)
                  lw  x8, 32(x16)
                  lw  x9, 36(x16)
                  lw  x10, 40(x16)
                  lw  x11, 44(x16)
                  lw  x12, 48(x16)
                  lw  x13, 52(x16)
                  lw  x14, 56(x16)
                  lw  x15, 60(x16)
                  lw  x16, 64(x16)
                  lw  x17, 68(x16)
                  lw  x18, 72(x16)
                  lw  x19, 76(x16)
                  lw  x20, 80(x16)
                  lw  x21, 84(x16)
                  lw  x22, 88(x16)
                  lw  x23, 92(x16)
                  lw  x24, 96(x16)
                  lw  x25, 100(x16)
                  lw  x26, 104(x16)
                  lw  x27, 108(x16)
                  lw  x28, 112(x16)
                  lw  x29, 116(x16)
                  lw  x30, 120(x16)
                  lw  x31, 124(x16)
                  addi x16, x16, 128
                  add x30, x16, zero
                  lw  x16, (x30)
                  addi x30, x30, 4
                  mret

store_fault_handler:
                  add x16, x30, zero
                  lw  x1, 4(x16)
                  lw  x2, 8(x16)
                  lw  x3, 12(x16)
                  lw  x4, 16(x16)
                  lw  x5, 20(x16)
                  lw  x6, 24(x16)
                  lw  x7, 28(x16)
                  lw  x8, 32(x16)
                  lw  x9, 36(x16)
                  lw  x10, 40(x16)
                  lw  x11, 44(x16)
                  lw  x12, 48(x16)
                  lw  x13, 52(x16)
                  lw  x14, 56(x16)
                  lw  x15, 60(x16)
                  lw  x16, 64(x16)
                  lw  x17, 68(x16)
                  lw  x18, 72(x16)
                  lw  x19, 76(x16)
                  lw  x20, 80(x16)
                  lw  x21, 84(x16)
                  lw  x22, 88(x16)
                  lw  x23, 92(x16)
                  lw  x24, 96(x16)
                  lw  x25, 100(x16)
                  lw  x26, 104(x16)
                  lw  x27, 108(x16)
                  lw  x28, 112(x16)
                  lw  x29, 116(x16)
                  lw  x30, 120(x16)
                  lw  x31, 124(x16)
                  addi x16, x16, 128
                  add x30, x16, zero
                  lw  x16, (x30)
                  addi x30, x30, 4
                  mret

ebreak_handler:   
                  csrr  x27, 0x341
                  addi  x27, x27, 4
                  csrw  0x341, x27
                  add x16, x30, zero
                  lw  x1, 4(x16)
                  lw  x2, 8(x16)
                  lw  x3, 12(x16)
                  lw  x4, 16(x16)
                  lw  x5, 20(x16)
                  lw  x6, 24(x16)
                  lw  x7, 28(x16)
                  lw  x8, 32(x16)
                  lw  x9, 36(x16)
                  lw  x10, 40(x16)
                  lw  x11, 44(x16)
                  lw  x12, 48(x16)
                  lw  x13, 52(x16)
                  lw  x14, 56(x16)
                  lw  x15, 60(x16)
                  lw  x16, 64(x16)
                  lw  x17, 68(x16)
                  lw  x18, 72(x16)
                  lw  x19, 76(x16)
                  lw  x20, 80(x16)
                  lw  x21, 84(x16)
                  lw  x22, 88(x16)
                  lw  x23, 92(x16)
                  lw  x24, 96(x16)
                  lw  x25, 100(x16)
                  lw  x26, 104(x16)
                  lw  x27, 108(x16)
                  lw  x28, 112(x16)
                  lw  x29, 116(x16)
                  lw  x30, 120(x16)
                  lw  x31, 124(x16)
                  addi x16, x16, 128
                  add x30, x16, zero
                  lw  x16, (x30)
                  addi x30, x30, 4
                  mret

illegal_instr_handler:
                  csrr  x27, 0x341
                  addi  x27, x27, 4
                  csrw  0x341, x27
                  add x16, x30, zero
                  lw  x1, 4(x16)
                  lw  x2, 8(x16)
                  lw  x3, 12(x16)
                  lw  x4, 16(x16)
                  lw  x5, 20(x16)
                  lw  x6, 24(x16)
                  lw  x7, 28(x16)
                  lw  x8, 32(x16)
                  lw  x9, 36(x16)
                  lw  x10, 40(x16)
                  lw  x11, 44(x16)
                  lw  x12, 48(x16)
                  lw  x13, 52(x16)
                  lw  x14, 56(x16)
                  lw  x15, 60(x16)
                  lw  x16, 64(x16)
                  lw  x17, 68(x16)
                  lw  x18, 72(x16)
                  lw  x19, 76(x16)
                  lw  x20, 80(x16)
                  lw  x21, 84(x16)
                  lw  x22, 88(x16)
                  lw  x23, 92(x16)
                  lw  x24, 96(x16)
                  lw  x25, 100(x16)
                  lw  x26, 104(x16)
                  lw  x27, 108(x16)
                  lw  x28, 112(x16)
                  lw  x29, 116(x16)
                  lw  x30, 120(x16)
                  lw  x31, 124(x16)
                  addi x16, x16, 128
                  add x30, x16, zero
                  lw  x16, (x30)
                  addi x30, x30, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x27, 0x300 # MSTATUS;
                  csrr  x27, 0x304 # MIE;
                  csrr  x27, 0x344 # MIP;
                  csrrc x27, 0x344, x27 # MIP;
                  add x16, x30, zero
                  lw  x1, 4(x16)
                  lw  x2, 8(x16)
                  lw  x3, 12(x16)
                  lw  x4, 16(x16)
                  lw  x5, 20(x16)
                  lw  x6, 24(x16)
                  lw  x7, 28(x16)
                  lw  x8, 32(x16)
                  lw  x9, 36(x16)
                  lw  x10, 40(x16)
                  lw  x11, 44(x16)
                  lw  x12, 48(x16)
                  lw  x13, 52(x16)
                  lw  x14, 56(x16)
                  lw  x15, 60(x16)
                  lw  x16, 64(x16)
                  lw  x17, 68(x16)
                  lw  x18, 72(x16)
                  lw  x19, 76(x16)
                  lw  x20, 80(x16)
                  lw  x21, 84(x16)
                  lw  x22, 88(x16)
                  lw  x23, 92(x16)
                  lw  x24, 96(x16)
                  lw  x25, 100(x16)
                  lw  x26, 104(x16)
                  lw  x27, 108(x16)
                  lw  x28, 112(x16)
                  lw  x29, 116(x16)
                  lw  x30, 120(x16)
                  lw  x31, 124(x16)
                  addi x16, x16, 128
                  add x30, x16, zero
                  lw  x16, (x30)
                  addi x30, x30, 4
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
