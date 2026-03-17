.include "user_define.h"
.globl _start
.section .text
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x21, h0_start
jalr x0, x21, 0
h0_start:
                  li x4, 0x40001104
                  csrw 0x301, x4
kernel_sp:        
                  la x30, kernel_stack_end

trap_vec_init:    
                  la x4, mtvec_handler
                  ori x4, x4, 1
                  csrw 0x305, x4 # MTVEC

mepc_setup:       
                  la x4, init
                  csrw 0x341, x4

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x4, 0x1800
                  csrw 0x300, x4 # MSTATUS
                  li x4, 0x0
                  csrw 0x304, x4 # MIE
                  mret
init:             
                  li x0, 0xfa361f95
                  li x1, 0x0
                  li x2, 0xa
                  li x3, 0xf5124d67
                  li x4, 0xf5ae23ad
                  li x5, 0x0
                  li x6, 0xf9cf5b6b
                  li x7, 0x0
                  li x8, 0x80000000
                  li x9, 0xdc4d1984
                  li x10, 0x80000000
                  li x12, 0x0
                  li x13, 0x0
                  li x14, 0x814c0b32
                  li x15, 0x5
                  li x16, 0x0
                  li x17, 0x4
                  li x18, 0x0
                  li x19, 0x80000000
                  li x20, 0x0
                  li x21, 0xfffe4a55
                  li x22, 0xf7caad7d
                  li x23, 0x2458b351
                  li x24, 0x80000000
                  li x25, 0x80000000
                  li x26, 0x80000000
                  li x27, 0xf04dc211
                  li x28, 0xab1b166e
                  li x29, 0xb847b118
                  li x31, 0xb0a6fbee
                  la x11, user_stack_end
main:             li           s3, 0x80000000 #start riscv_int_numeric_corner_stream_23
                  li           a5, 0x80000000
                  li           ra, 0x2a660c6d
                  li           a4, 0xffffffff
                  li           s10, 0xffffffff
                  li           s11, 0x0
                  li           sp, 0x0
                  li           t3, 0x80000000
                  li           a3, 0x80000000
                  li           s1, 0xffffffff
                  remu         s1, a3, s10
                  mulhu        a3, s10, s11
                  rem          s3, s10, s1
                  add          a3, s3, s3
                  lui          ra, 1036702
                  mul          a5, a5, s10
                  mul          a5, a5, s10
                  mulhu        a3, s10, s11
                  remu         s1, a3, s10
                  div          a4, s1, a5
                  mulh         s3, ra, a4
                  auipc        a4, 368653
                  sub          s1, a5, s3
                  div          a4, s1, a5
                  mul          a5, a5, s10
                  mul          a5, a5, s10
                  sub          s1, a5, s3 #end riscv_int_numeric_corner_stream_23
                  li           a4, 0x3f1a06f1 #start riscv_int_numeric_corner_stream_39
                  li           t2, 0xffffffff
                  li           s11, 0x0
                  li           sp, 0x80000000
                  li           t0, 0x0
                  li           s7, 0x80000000
                  li           a5, 0xa90884d1
                  li           a7, 0x0
                  li           gp, 0xffffffff
                  li           s6, 0x80000000
                  mulhu        t2, s6, s7
                  lui          sp, 1036702
                  nop
                  mulhu        t2, s6, s7
                  mulhsu       gp, s6, a5
                  remu         t0, t2, s6
                  mulhu        t2, s6, s7
                  add          t2, a7, a7
                  div          a4, t0, a5
                  mulhu        t2, s6, s7
                  remu         t0, t2, s6
                  mulh         a7, sp, a4
                  add          t2, a7, a7
                  rem          a7, s6, t0
                  lui          sp, 1036702
                  div          a4, t0, a5
                  rem          a7, s6, t0
                  rem          a7, s6, t0
                  mulh         a7, sp, a4
                  mulhu        t2, s6, s7 #end riscv_int_numeric_corner_stream_39
                  li           t0, 0x0 #start riscv_int_numeric_corner_stream_20
                  li           t6, 0x80000000
                  li           t3, 0x80000000
                  li           a0, 0x80000000
                  li           a4, 0xa1687031
                  li           sp, 0xffffffff
                  li           s0, 0x80000000
                  li           a5, 0x80000000
                  li           t1, 0xffffffff
                  li           a3, 0xcd1fda2b
                  rem          a4, a5, t1
                  mul          a3, a3, a5
                  rem          a4, a5, t1
                  auipc        a0, 368653
                  div          a0, t1, a3
                  mulhu        s0, a5, t3
                  auipc        a0, 368653
                  div          a0, t1, a3
                  mulhsu       t0, a5, a3
                  nop
                  addi         t1, t1, -1824
                  add          s0, a4, a4
                  sub          t1, a3, a4
                  mulh         a4, sp, a0
                  rem          a4, a5, t1
                  mulh         a4, sp, a0
                  mulh         a4, sp, a0
                  mulhsu       t0, a5, a3 #end riscv_int_numeric_corner_stream_20
                  li           s7, 0x80000000 #start riscv_int_numeric_corner_stream_33
                  li           s6, 0xffffffff
                  li           s8, 0xffffffff
                  li           a7, 0x80000000
                  li           s0, 0x80000000
                  li           s11, 0x80000000
                  li           s10, 0xffffffff
                  li           a6, 0x80000000
                  li           t3, 0x80000000
                  li           t2, 0x80000000
                  sub          a6, s7, s8
                  sub          a6, s7, s8
                  lui          t2, 1036702
                  mulhu        a7, s10, s11
                  remu         a6, a7, s10
                  auipc        s6, 368653
                  addi         a6, a6, -1824
                  mulhu        a7, s10, s11
                  mulhsu       s0, s10, s7
                  mulh         s8, t2, s6
                  mulhsu       s0, s10, s7
                  auipc        s6, 368653
                  addi         a6, a6, -1824
                  mulhsu       s0, s10, s7
                  lui          t2, 1036702
                  rem          s8, s10, a6
                  auipc        s6, 368653
                  rem          s8, s10, a6
                  auipc        s6, 368653
                  rem          s8, s10, a6
                  mulhsu       s0, s10, s7
                  lui          t2, 1036702 #end riscv_int_numeric_corner_stream_33
                  li           t1, 0xc43d1dbc #start riscv_int_numeric_corner_stream_24
                  li           t6, 0x0
                  li           s6, 0x6734f847
                  li           s11, 0x0
                  li           gp, 0xc9ac81ee
                  li           s8, 0x80000000
                  li           a7, 0x5eb3d659
                  li           s4, 0xffffffff
                  li           t3, 0x475fd753
                  li           a0, 0x0
                  remu         a0, a7, s11
                  mul          s6, s6, s11
                  mulhsu       t1, s11, s6
                  add          a7, s8, s8
                  mulh         s8, gp, s4
                  lui          gp, 1036702
                  nop
                  addi         a0, a0, -1824
                  mul          s6, s6, s11
                  rem          s8, s11, a0
                  add          a7, s8, s8
                  mulhsu       t1, s11, s6
                  divu         gp, s4, s11
                  divu         gp, s4, s11
                  mulhsu       t1, s11, s6
                  mul          s6, s6, s11
                  mul          s6, s6, s11
                  addi         a0, a0, -1824
                  auipc        s4, 368653
                  rem          s8, s11, a0
                  addi         a0, a0, -1824
                  lui          gp, 1036702
                  mulh         s8, gp, s4
                  nop
                  mul          s6, s6, s11 #end riscv_int_numeric_corner_stream_24
                  li           s7, 0x0 #start riscv_int_numeric_corner_stream_8
                  li           s2, 0xffffffff
                  li           t3, 0xdb084859
                  li           t6, 0xffffffff
                  li           t0, 0xdd5bdd84
                  li           s1, 0x80000000
                  li           t4, 0x80000000
                  li           s0, 0xffffffff
                  li           a5, 0x0
                  li           s4, 0x80000000
                  addi         s1, s1, -1824
                  sub          s1, s4, s7
                  mulh         s7, t0, s2
                  auipc        s2, 368653
                  mulh         s7, t0, s2
                  sub          s1, s4, s7
                  mulhsu       s0, t3, s4
                  mulhu        a5, t3, t4
                  sub          s1, s4, s7
                  mulhsu       s0, t3, s4
                  mul          s4, s4, t3
                  mulh         s7, t0, s2
                  auipc        s2, 368653
                  auipc        s2, 368653
                  mulhsu       s0, t3, s4
                  sub          s1, s4, s7
                  lui          t0, 1036702
                  div          s2, s1, s4
                  lui          t0, 1036702
                  rem          s7, t3, s1
                  lui          t0, 1036702
                  lui          t0, 1036702
                  mul          s4, s4, t3
                  mul          s4, s4, t3
                  mulh         s7, t0, s2
                  rem          s7, t3, s1
                  lui          t0, 1036702
                  divu         t0, s2, t3
                  mulhsu       s0, t3, s4
                  sub          s1, s4, s7 #end riscv_int_numeric_corner_stream_8
                  li           s0, 0x0 #start riscv_int_numeric_corner_stream_35
                  li           s8, 0xa1d1c24b
                  li           a5, 0xffffffff
                  li           a3, 0x138090da
                  li           a4, 0xdf7ce237
                  li           a7, 0xffffffff
                  li           gp, 0x80000000
                  li           s9, 0xffffffff
                  li           t6, 0x0
                  li           s4, 0x217fae08
                  add          a4, s4, s4
                  addi         a3, a3, -1824
                  sub          a3, a7, s4
                  auipc        a5, 368653
                  mulhsu       s0, s8, a7
                  nop
                  mulhsu       s0, s8, a7
                  add          a4, s4, s4
                  mul          a7, a7, s8
                  remu         a3, a4, s8
                  remu         a3, a4, s8
                  mul          a7, a7, s8
                  divu         gp, a5, s8
                  rem          s4, s8, a3
                  mulhu        a4, s8, s9
                  addi         a3, a3, -1824
                  add          a4, s4, s4
                  remu         a3, a4, s8
                  remu         a3, a4, s8
                  mulh         s4, gp, a5
                  lui          gp, 1036702
                  div          a5, a3, a7
                  mulhsu       s0, s8, a7
                  addi         a3, a3, -1824
                  auipc        a5, 368653 #end riscv_int_numeric_corner_stream_35
                  li           s4, 0x0 #start riscv_int_numeric_corner_stream_19
                  li           s0, 0x6142e353
                  li           a4, 0x80000000
                  li           s1, 0x0
                  li           t6, 0x0
                  li           a7, 0x0
                  li           s7, 0xc2bef7b8
                  li           sp, 0x80000000
                  li           t1, 0xffffffff
                  li           a0, 0x80000000
                  auipc        a0, 368653
                  mul          a4, a4, s4
                  divu         sp, a0, s4
                  lui          sp, 1036702
                  rem          a7, s4, s0
                  auipc        a0, 368653
                  div          a0, s0, a4
                  mulh         a7, sp, a0
                  div          a0, s0, a4
                  rem          a7, s4, s0
                  mulhu        s1, s4, s7
                  mul          a4, a4, s4
                  mulhu        s1, s4, s7
                  addi         s0, s0, -1824
                  add          s1, a7, a7
                  auipc        a0, 368653
                  sub          s0, a4, a7
                  rem          a7, s4, s0 #end riscv_int_numeric_corner_stream_19
                  li           tp, 0xffffffff #start riscv_int_numeric_corner_stream_21
                  li           s0, 0x0
                  li           s7, 0x0
                  li           a0, 0xc9ebb642
                  li           s4, 0xffffffff
                  li           a6, 0xffffffff
                  li           t1, 0xffffffff
                  li           t0, 0xefb4aaeb
                  li           a7, 0xffffffff
                  li           t6, 0x80000000
                  mulhu        s0, s4, s7
                  rem          a7, s4, t1
                  mulhu        s0, s4, s7
                  rem          a7, s4, t1
                  divu         tp, a0, s4
                  rem          a7, s4, t1
                  add          s0, a7, a7
                  auipc        a0, 368653
                  remu         t1, s0, s4
                  divu         tp, a0, s4
                  auipc        a0, 368653
                  mul          a6, a6, s4
                  rem          a7, s4, t1
                  div          a0, t1, a6
                  auipc        a0, 368653
                  remu         t1, s0, s4
                  rem          a7, s4, t1
                  mulhsu       t0, s4, a6
                  addi         t1, t1, -1824
                  sub          t1, a6, a7
                  mulh         a7, tp, a0
                  sub          t1, a6, a7
                  div          a0, t1, a6
                  divu         tp, a0, s4
                  mulhsu       t0, s4, a6
                  rem          a7, s4, t1
                  rem          a7, s4, t1
                  sub          t1, a6, a7
                  div          a0, t1, a6
                  mulhsu       t0, s4, a6 #end riscv_int_numeric_corner_stream_21
                  li           t2, 0x0 #start riscv_int_numeric_corner_stream_4
                  li           s8, 0xffffffff
                  li           a5, 0x0
                  li           s0, 0x38416f5d
                  li           s6, 0x80000000
                  li           s11, 0x7f224656
                  li           tp, 0xffffffff
                  li           a3, 0x0
                  li           t0, 0x0
                  li           a7, 0x0
                  div          a3, t2, a5
                  mul          a5, a5, s6
                  mulh         a7, tp, a3
                  lui          tp, 1036702
                  addi         t2, t2, -1824
                  mul          a5, a5, s6
                  auipc        a3, 368653
                  add          s0, a7, a7
                  remu         t2, s0, s6
                  rem          a7, s6, t2
                  addi         t2, t2, -1824
                  mulhu        s0, s6, s8
                  rem          a7, s6, t2
                  mulhsu       t0, s6, a5
                  nop
                  remu         t2, s0, s6
                  lui          tp, 1036702
                  add          s0, a7, a7
                  sub          t2, a5, a7
                  sub          t2, a5, a7 #end riscv_int_numeric_corner_stream_4
                  li           tp, 0x0 #start riscv_int_numeric_corner_stream_17
                  li           s3, 0xffffffff
                  li           s11, 0x80000000
                  li           t2, 0x80000000
                  li           s8, 0xffffffff
                  li           sp, 0x80000000
                  li           s10, 0x80000000
                  li           s9, 0x0
                  li           gp, 0x80000000
                  li           a2, 0xffffffff
                  mulhsu       gp, s9, s3
                  remu         tp, t2, s9
                  mulh         s8, sp, a2
                  sub          tp, s3, s8
                  lui          sp, 1036702
                  divu         sp, a2, s9
                  rem          s8, s9, tp
                  addi         tp, tp, -1824
                  mulh         s8, sp, a2
                  mulhu        t2, s9, s10
                  sub          tp, s3, s8
                  nop
                  sub          tp, s3, s8
                  divu         sp, a2, s9
                  addi         tp, tp, -1824
                  auipc        a2, 368653
                  remu         tp, t2, s9 #end riscv_int_numeric_corner_stream_17
                  li           t2, 0xecf3e7f9 #start riscv_int_numeric_corner_stream_31
                  li           t6, 0xffffffff
                  li           tp, 0x80000000
                  li           s11, 0x80000000
                  li           a2, 0xffffffff
                  li           a0, 0x2e837e0d
                  li           s4, 0x0
                  li           s6, 0x8cd0df84
                  li           s10, 0x69022f4a
                  li           a7, 0x0
                  sub          a0, s4, s6
                  mul          s4, s4, s10
                  nop
                  mulhsu       t2, s10, s4
                  div          a7, a0, s4
                  mulhu        a2, s10, s11
                  divu         tp, a7, s10
                  div          a7, a0, s4
                  divu         tp, a7, s10
                  sub          a0, s4, s6
                  sub          a0, s4, s6
                  remu         a0, a2, s10
                  div          a7, a0, s4
                  mul          s4, s4, s10
                  mulhsu       t2, s10, s4
                  mulhsu       t2, s10, s4 #end riscv_int_numeric_corner_stream_31
                  li           s1, 0x80000000 #start riscv_int_numeric_corner_stream_10
                  li           a6, 0x80000000
                  li           s11, 0x5d7e0989
                  li           gp, 0x286daa5
                  li           s4, 0xffffffff
                  li           ra, 0x1b272325
                  li           s9, 0xffffffff
                  li           t3, 0x0
                  li           s0, 0xffffffff
                  li           a5, 0xffffffff
                  divu         ra, a5, s9
                  auipc        a5, 368653
                  nop
                  sub          s0, a6, s4
                  sub          s0, a6, s4
                  div          a5, s0, a6
                  div          a5, s0, a6
                  nop
                  mul          a6, a6, s9
                  divu         ra, a5, s9
                  add          s1, s4, s4
                  nop
                  nop
                  auipc        a5, 368653
                  sub          s0, a6, s4
                  remu         s0, s1, s9
                  nop
                  div          a5, s0, a6
                  sub          s0, a6, s4
                  remu         s0, s1, s9
                  mulh         s4, ra, a5
                  auipc        a5, 368653
                  remu         s0, s1, s9
                  nop
                  mul          a6, a6, s9 #end riscv_int_numeric_corner_stream_10
                  li           tp, 0xffffffff #start riscv_int_numeric_corner_stream_0
                  li           s0, 0x0
                  li           s1, 0xffffffff
                  li           ra, 0x80000000
                  li           gp, 0x9b2d8580
                  li           s11, 0x0
                  li           a3, 0x0
                  li           t0, 0xffffffff
                  li           s10, 0xffffffff
                  li           sp, 0x80000000
                  mul          s0, s0, a3
                  addi         gp, gp, -1824
                  add          tp, s1, s1
                  lui          ra, 1036702
                  mulh         s1, ra, t0
                  sub          gp, s0, s1
                  auipc        t0, 368653
                  divu         ra, t0, a3
                  mulhu        tp, a3, s10
                  lui          ra, 1036702
                  add          tp, s1, s1
                  mul          s0, s0, a3
                  sub          gp, s0, s1
                  divu         ra, t0, a3
                  nop
                  mulhu        tp, a3, s10 #end riscv_int_numeric_corner_stream_0
                  li           a4, 0x80000000 #start riscv_int_numeric_corner_stream_22
                  li           t6, 0x62d923b3
                  li           a5, 0x80000000
                  li           s1, 0x1ca08363
                  li           a2, 0x119773c1
                  li           a6, 0x0
                  li           t4, 0x80000000
                  li           t0, 0x0
                  li           s2, 0xde8044fb
                  li           s11, 0x0
                  addi         a2, a2, -1824
                  mulhu        a4, s11, t4
                  remu         a2, a4, s11
                  sub          a2, a6, s2
                  divu         t0, a5, s11
                  auipc        a5, 368653
                  addi         a2, a2, -1824
                  remu         a2, a4, s11
                  nop
                  mul          a6, a6, s11
                  div          a5, a2, a6
                  mul          a6, a6, s11
                  rem          s2, s11, a2
                  addi         a2, a2, -1824
                  nop
                  add          a4, s2, s2
                  remu         a2, a4, s11
                  divu         t0, a5, s11 #end riscv_int_numeric_corner_stream_22
                  li           a7, 0x0 #start riscv_int_numeric_corner_stream_25
                  li           t6, 0x805214b9
                  li           s2, 0x643bdb9c
                  li           a6, 0x0
                  li           t4, 0x80000000
                  li           s11, 0x0
                  li           a3, 0xffffffff
                  li           s8, 0xcd87b1e6
                  li           s9, 0xffffffff
                  li           s10, 0xffffffff
                  mulhu        s2, s11, t4
                  rem          s10, s11, a7
                  addi         a7, a7, -1824
                  add          s2, s10, s10
                  auipc        s8, 368653
                  mul          s9, s9, s11
                  mulh         s10, a3, s8
                  nop
                  mulhsu       a6, s11, s9
                  nop
                  auipc        s8, 368653
                  addi         a7, a7, -1824
                  mul          s9, s9, s11
                  auipc        s8, 368653
                  nop
                  addi         a7, a7, -1824
                  add          s2, s10, s10
                  lui          a3, 1036702
                  div          s8, a7, s9
                  remu         a7, s2, s11
                  mulhsu       a6, s11, s9
                  lui          a3, 1036702
                  sub          a7, s9, s10
                  nop
                  nop
                  rem          s10, s11, a7
                  nop
                  lui          a3, 1036702 #end riscv_int_numeric_corner_stream_25
                  li           t3, 0x80000000 #start riscv_int_numeric_corner_stream_7
                  li           s3, 0x958b322f
                  li           a7, 0xffffffff
                  li           s2, 0xffffffff
                  li           a3, 0x6525b86b
                  li           t1, 0xb3faf83b
                  li           s10, 0x80000000
                  li           t2, 0xffffffff
                  li           sp, 0x0
                  li           s4, 0xffffffff
                  nop
                  add          a3, s3, s3
                  auipc        a7, 368653
                  mul          s2, s2, s4
                  div          a7, t2, s2
                  mulh         s3, sp, a7
                  addi         t2, t2, -1824
                  mulhsu       t1, s4, s2
                  mulh         s3, sp, a7
                  lui          sp, 1036702
                  rem          s3, s4, t2
                  add          a3, s3, s3
                  addi         t2, t2, -1824
                  lui          sp, 1036702
                  add          a3, s3, s3
                  sub          t2, s2, s3
                  mulh         s3, sp, a7
                  sub          t2, s2, s3
                  divu         sp, a7, s4
                  addi         t2, t2, -1824
                  mulh         s3, sp, a7
                  sub          t2, s2, s3
                  sub          t2, s2, s3
                  divu         sp, a7, s4
                  nop
                  addi         t2, t2, -1824
                  lui          sp, 1036702
                  auipc        a7, 368653
                  auipc        a7, 368653
                  remu         t2, a3, s4 #end riscv_int_numeric_corner_stream_7
                  sub          sp, t0, a2
                  xori         sp, ra, -1938
                  andi         a4, a7, -1410
                  c.addi16sp   sp, 256
                  slt          s3, a6, a0
                  div          t3, sp, t0
                  c.or         a2, s0
                  sub          sp, t0, a2
                  c.addi16sp   sp, 256
                  ori          a6, t4, 27
                  mulhsu       ra, t3, a0
                  add          s4, a1, t4
                  mulh         s8, zero, tp
                  xori         sp, ra, -1938
                  srli         s4, s3, 13
                  c.addi       s7, -1
                  mulh         s8, zero, tp
                  c.or         a2, s0
                  slti         sp, a1, 426
                  auipc        tp, 368653
                  slt          s3, a6, a0
                  ori          a6, t4, 27
                  addi         s3, s2, -1824
                  srl          t4, s1, t1
                  c.addi4spn   a0, sp, 368
                  c.nop
                  c.xor        a0, s1
                  sll          t2, gp, a3
                  divu         a7, s4, t2
                  c.mv         s6, s5
                  remu         sp, s3, s7
                  mul          s7, t5, a5
                  c.add        a2, t6
                  nop
                  c.xor        a0, s1
                  auipc        tp, 368653
                  c.li         s3, 9
                  c.or         a2, s0
                  add          s4, a1, t4
                  nop
                  sll          t2, gp, a3
                  c.lui        s10, 18
                  srl          t4, s1, t1
                  c.andi       a3, 13
                  srl          t4, s1, t1
                  sub          sp, t0, a2
                  lui          a7, 1036702
                  add          s4, a1, t4
                  c.srai       s0, 8
                  sltiu        a6, ra, -900
                  c.add        a2, t6
                  andi         a4, a7, -1410
                  c.addi16sp   sp, 256
                  srai         a4, ra, 3
                  slti         sp, a1, 426
                  xor          tp, a3, tp
                  slti         sp, a1, 426
                  or           t1, a5, t0
                  divu         a7, s4, t2
                  c.srli       a0, 16
                  slli         t1, ra, 5
                  mulhu        a5, a3, t5
                  c.srai       s0, 8
                  andi         a4, a7, -1410
                  mulhsu       ra, t3, a0
                  c.addi4spn   a0, sp, 368
                  c.lui        s10, 18
                  xori         sp, ra, -1938
                  xor          tp, a3, tp
                  rem          t1, s7, s2
                  auipc        tp, 368653
                  sub          sp, t0, a2
                  c.add        a2, t6
                  c.srai       s0, 8
                  srai         a4, ra, 3
                  sltu         s6, s9, sp
                  sltiu        a6, ra, -900
                  c.slli       tp, 29
                  c.and        a0, s0
                  lui          a7, 1036702
                  sub          sp, t0, a2
                  auipc        tp, 368653
                  lui          a7, 1036702
                  add          s4, a1, t4
                  mulhsu       ra, t3, a0
                  sll          t2, gp, a3
                  and          s3, a6, s7
                  xor          tp, a3, tp
                  srai         a4, ra, 3
                  c.sub        a0, a1
                  c.mv         s6, s5
                  c.and        a0, s0
                  addi         s3, s2, -1824
                  xori         sp, ra, -1938
                  rem          t1, s7, s2
                  c.sub        a0, a1
                  srl          t4, s1, t1
                  addi         s3, s2, -1824
                  slti         sp, a1, 426
                  c.addi4spn   a0, sp, 368
                  or           t1, a5, t0
                  c.or         a2, s0
                  mulh         s8, zero, tp
                  c.nop
                  c.addi16sp   sp, 256
                  slli         t1, ra, 5
                  slli         t1, ra, 5
                  slt          s3, a6, a0
                  c.and        a0, s0
                  and          s3, a6, s7
                  c.addi4spn   a0, sp, 368
                  lui          a7, 1036702
                  or           t1, a5, t0
                  nop
                  mulhsu       ra, t3, a0
                  sltiu        a6, ra, -900
                  c.or         a2, s0
                  nop
                  and          s3, a6, s7
                  mul          s7, t5, a5
                  c.xor        a0, s1
                  mulhu        a5, a3, t5
                  sra          a3, t2, s2
                  sub          sp, t0, a2
                  srai         a4, ra, 3
                  sltiu        a6, ra, -900
                  mul          s7, t5, a5
                  sltu         s6, s9, sp
                  xor          tp, a3, tp
                  mul          s7, t5, a5
                  lui          a7, 1036702
                  rem          t1, s7, s2
                  c.li         s3, 9
                  lui          a7, 1036702
                  c.li         s3, 9
                  sltu         s6, s9, sp
                  c.addi16sp   sp, 256
                  sll          t2, gp, a3
                  sll          t2, gp, a3
                  ori          a6, t4, 27
                  c.or         a2, s0
                  sub          sp, t0, a2
                  addi         s3, s2, -1824
                  sub          sp, t0, a2
                  slli         t1, ra, 5
                  c.addi16sp   sp, 256
                  c.nop
                  sll          t2, gp, a3
                  mulh         s8, zero, tp
                  sra          a3, t2, s2
                  c.addi       s7, -1
                  xor          tp, a3, tp
                  c.or         a2, s0
                  sra          a3, t2, s2
                  c.or         a2, s0
                  c.add        a2, t6
                  c.or         a2, s0
                  c.sub        a0, a1
                  lui          a7, 1036702
                  mulhsu       ra, t3, a0
                  c.and        a0, s0
                  c.andi       a3, 13
                  c.or         a2, s0
                  c.mv         s6, s5
                  sub          sp, t0, a2
                  div          t3, sp, t0
                  or           t1, a5, t0
                  srli         s4, s3, 13
                  sub          sp, t0, a2
                  c.nop
                  c.and        a0, s0
                  nop
                  srai         a4, ra, 3
                  divu         a7, s4, t2
                  c.addi       s7, -1
                  sll          t2, gp, a3
                  srli         s4, s3, 13
                  c.addi       s7, -1
                  sltu         s6, s9, sp
                  ori          a6, t4, 27
                  c.slli       tp, 29
                  c.xor        a0, s1
                  c.li         s3, 9
                  c.and        a0, s0
                  c.srli       a0, 16
                  srli         s4, s3, 13
                  lui          a7, 1036702
                  nop
                  mulhsu       ra, t3, a0
                  addi         s3, s2, -1824
                  c.srli       a0, 16
                  c.nop
                  slli         t1, ra, 5
                  c.andi       a3, 13
                  div          t3, sp, t0
                  ori          a6, t4, 27
                  slti         sp, a1, 426
                  lui          a7, 1036702
                  mulhu        a5, a3, t5
                  or           t1, a5, t0
                  lui          a7, 1036702
                  rem          t1, s7, s2
                  slti         sp, a1, 426
                  sub          sp, t0, a2
                  slt          s3, a6, a0
                  mulhsu       ra, t3, a0
                  div          t3, sp, t0
                  mulhu        a5, a3, t5
                  c.addi       s7, -1
                  divu         a7, s4, t2
                  xori         sp, ra, -1938
                  rem          t1, s7, s2
                  sll          t2, gp, a3
                  sra          a3, t2, s2
                  sltu         s6, s9, sp
                  sltiu        a6, ra, -900
                  add          s4, a1, t4
                  and          s3, a6, s7
                  sltu         s6, s9, sp
                  c.sub        a0, a1
                  rem          t1, s7, s2
                  c.and        a0, s0
                  c.addi4spn   a0, sp, 368
                  mul          s7, t5, a5
                  mulh         s8, zero, tp
                  div          t3, sp, t0
                  sra          a3, t2, s2
                  c.nop
                  nop
                  div          t3, sp, t0
                  c.andi       a3, 13
                  c.li         s3, 9
                  srli         s4, s3, 13
                  sll          t2, gp, a3
                  or           t1, a5, t0
                  and          s3, a6, s7
                  div          t3, sp, t0
                  sltu         s6, s9, sp
                  auipc        tp, 368653
                  c.mv         s6, s5
                  or           t1, a5, t0
                  slli         t1, ra, 5
                  remu         sp, s3, s7
                  xor          tp, a3, tp
                  divu         a7, s4, t2
                  sll          t2, gp, a3
                  c.add        a2, t6
                  c.nop
                  mulh         s8, zero, tp
                  srli         s4, s3, 13
                  c.li         s3, 9
                  auipc        tp, 368653
                  sll          t2, gp, a3
                  remu         sp, s3, s7
                  c.mv         s6, s5
                  sra          a3, t2, s2
                  c.lui        s10, 18
                  c.addi       s7, -1
                  mulhu        a5, a3, t5
                  c.slli       tp, 29
                  sltu         s6, s9, sp
                  srai         a4, ra, 3
                  sub          sp, t0, a2
                  addi         s3, s2, -1824
                  c.lui        s10, 18
                  add          s4, a1, t4
                  c.addi       s7, -1
                  c.andi       a3, 13
                  c.lui        s10, 18
                  auipc        tp, 368653
                  mulhu        a5, a3, t5
                  c.nop
                  c.or         a2, s0
                  add          s4, a1, t4
                  sub          sp, t0, a2
                  sra          a3, t2, s2
                  srai         a4, ra, 3
                  srli         s4, s3, 13
                  slli         t1, ra, 5
                  sltiu        a6, ra, -900
                  c.addi16sp   sp, 256
                  c.add        a2, t6
                  xor          tp, a3, tp
                  addi         s3, s2, -1824
                  c.li         s3, 9
                  c.li         s3, 9
                  div          t3, sp, t0
                  srai         a4, ra, 3
                  ori          a6, t4, 27
                  rem          t1, s7, s2
                  mul          s7, t5, a5
                  sltiu        a6, ra, -900
                  c.slli       tp, 29
                  c.nop
                  c.li         s3, 9
                  c.slli       tp, 29
                  mul          s7, t5, a5
                  lui          a7, 1036702
                  srli         s4, s3, 13
                  c.addi4spn   a0, sp, 368
                  sltu         s6, s9, sp
                  c.and        a0, s0
                  c.and        a0, s0
                  div          t3, sp, t0
                  sll          t2, gp, a3
                  c.addi       s7, -1
                  slti         sp, a1, 426
                  c.and        a0, s0
                  sltu         s6, s9, sp
                  slt          s3, a6, a0
                  addi         s3, s2, -1824
                  mul          s7, t5, a5
                  srl          t4, s1, t1
                  c.srli       a0, 16
                  and          s3, a6, s7
                  slti         sp, a1, 426
                  c.lui        s10, 18
                  mulh         s8, zero, tp
                  auipc        tp, 368653
                  sltu         s6, s9, sp
                  c.srai       s0, 8
                  c.addi       s7, -1
                  c.addi       s7, -1
                  mulhu        a5, a3, t5
                  add          s4, a1, t4
                  sltiu        a6, ra, -900
                  remu         sp, s3, s7
                  srai         a4, ra, 3
                  c.nop
                  add          s4, a1, t4
                  mulhsu       ra, t3, a0
                  c.addi4spn   a0, sp, 368
                  addi         s3, s2, -1824
                  remu         sp, s3, s7
                  c.slli       tp, 29
                  c.srli       a0, 16
                  div          t3, sp, t0
                  srai         a4, ra, 3
                  mulhu        a5, a3, t5
                  rem          t1, s7, s2
                  c.xor        a0, s1
                  nop
                  sra          a3, t2, s2
                  or           t1, a5, t0
                  c.slli       tp, 29
                  sltu         s6, s9, sp
                  nop
                  slt          s3, a6, a0
                  c.lui        s10, 18
                  c.srli       a0, 16
                  c.lui        s10, 18
                  remu         sp, s3, s7
                  c.srai       s0, 8
                  c.or         a2, s0
                  remu         sp, s3, s7
                  c.mv         s6, s5
                  andi         a4, a7, -1410
                  slt          s3, a6, a0
                  xori         sp, ra, -1938
                  sltu         s6, s9, sp
                  sll          t2, gp, a3
                  c.slli       tp, 29
                  srai         a4, ra, 3
                  div          t3, sp, t0
                  c.addi16sp   sp, 256
                  addi         s3, s2, -1824
                  andi         a4, a7, -1410
                  sltu         s6, s9, sp
                  and          s3, a6, s7
                  addi         s3, s2, -1824
                  c.andi       a3, 13
                  c.li         s3, 9
                  remu         sp, s3, s7
                  c.sub        a0, a1
                  c.srai       s0, 8
                  mulhu        a5, a3, t5
                  ori          a6, t4, 27
                  c.li         s3, 9
                  add          s4, a1, t4
                  divu         a7, s4, t2
                  rem          t1, s7, s2
                  c.addi       s7, -1
                  and          s3, a6, s7
                  slti         sp, a1, 426
                  and          s3, a6, s7
                  sra          a3, t2, s2
                  mul          s7, t5, a5
                  divu         a7, s4, t2
                  li           t0, 0xffffffff #start riscv_int_numeric_corner_stream_13
                  li           t4, 0x0
                  li           t6, 0xffffffff
                  li           t1, 0x80000000
                  li           a5, 0x0
                  li           a6, 0xa0edd698
                  li           a0, 0x80000000
                  li           s10, 0x0
                  li           s0, 0x0
                  li           s3, 0x80000000
                  auipc        a5, 368653
                  mulhsu       t1, s10, a6
                  mul          a6, a6, s10
                  sub          s0, a6, s3
                  lui          t0, 1036702
                  mulhsu       t1, s10, a6
                  mulhu        a0, s10, t4
                  lui          t0, 1036702
                  rem          s3, s10, s0
                  sub          s0, a6, s3
                  mulhsu       t1, s10, a6
                  div          a5, s0, a6
                  addi         s0, s0, -1824
                  mulh         s3, t0, a5
                  auipc        a5, 368653
                  rem          s3, s10, s0
                  sub          s0, a6, s3
                  mulhu        a0, s10, t4
                  auipc        a5, 368653
                  sub          s0, a6, s3
                  nop #end riscv_int_numeric_corner_stream_13
                  ori          a6, t4, 27
                  c.xor        a0, s1
                  c.srai       s0, 8
                  c.srli       a0, 16
                  mulh         s8, zero, tp
                  c.xor        a0, s1
                  srli         s4, s3, 13
                  mulhu        a5, a3, t5
                  slti         sp, a1, 426
                  or           t1, a5, t0
                  c.and        a0, s0
                  mulhu        a5, a3, t5
                  c.andi       a3, 13
                  c.nop
                  or           t1, a5, t0
                  mulhsu       ra, t3, a0
                  c.slli       tp, 29
                  c.nop
                  or           t1, a5, t0
                  c.or         a2, s0
                  sll          t2, gp, a3
                  slt          s3, a6, a0
                  ori          a6, t4, 27
                  c.xor        a0, s1
                  and          s3, a6, s7
                  div          t3, sp, t0
                  c.li         s3, 9
                  slti         sp, a1, 426
                  srl          t4, s1, t1
                  ori          a6, t4, 27
                  c.addi       s7, -1
                  c.li         s3, 9
                  mulh         s8, zero, tp
                  c.srli       a0, 16
                  add          s4, a1, t4
                  c.lui        s10, 18
                  c.sub        a0, a1
                  slti         sp, a1, 426
                  remu         sp, s3, s7
                  nop
                  srl          t4, s1, t1
                  sltu         s6, s9, sp
                  mulhu        a5, a3, t5
                  srli         s4, s3, 13
                  c.add        a2, t6
                  ori          a6, t4, 27
                  slti         sp, a1, 426
                  and          s3, a6, s7
                  add          s4, a1, t4
                  c.srli       a0, 16
                  c.and        a0, s0
                  ori          a6, t4, 27
                  c.xor        a0, s1
                  c.and        a0, s0
                  andi         a4, a7, -1410
                  addi         s3, s2, -1824
                  srl          t4, s1, t1
                  srai         a4, ra, 3
                  mulhu        a5, a3, t5
                  c.sub        a0, a1
                  and          s3, a6, s7
                  rem          t1, s7, s2
                  c.li         s3, 9
                  mulhu        a5, a3, t5
                  sltiu        a6, ra, -900
                  mulhsu       ra, t3, a0
                  sltu         s6, s9, sp
                  ori          a6, t4, 27
                  and          s3, a6, s7
                  xori         sp, ra, -1938
                  srli         s4, s3, 13
                  sltu         s6, s9, sp
                  srl          t4, s1, t1
                  srli         s4, s3, 13
                  c.andi       a3, 13
                  c.srai       s0, 8
                  slt          s3, a6, a0
                  div          t3, sp, t0
                  slt          s3, a6, a0
                  divu         a7, s4, t2
                  c.sub        a0, a1
                  andi         a4, a7, -1410
                  and          s3, a6, s7
                  c.addi16sp   sp, 256
                  c.srai       s0, 8
                  nop
                  mul          s7, t5, a5
                  mulh         s8, zero, tp
                  c.add        a2, t6
                  c.and        a0, s0
                  c.and        a0, s0
                  nop
                  c.srli       a0, 16
                  auipc        tp, 368653
                  sub          sp, t0, a2
                  mulh         s8, zero, tp
                  slti         sp, a1, 426
                  addi         s3, s2, -1824
                  mul          s7, t5, a5
                  sll          t2, gp, a3
                  addi         s3, s2, -1824
                  srli         s4, s3, 13
                  slt          s3, a6, a0
                  sub          sp, t0, a2
                  c.slli       tp, 29
                  srai         a4, ra, 3
                  c.add        a2, t6
                  add          s4, a1, t4
                  mulhsu       ra, t3, a0
                  mulh         s8, zero, tp
                  c.slli       tp, 29
                  c.srli       a0, 16
                  slti         sp, a1, 426
                  slti         sp, a1, 426
                  nop
                  mulhu        a5, a3, t5
                  slt          s3, a6, a0
                  c.nop
                  ori          a6, t4, 27
                  sll          t2, gp, a3
                  c.sub        a0, a1
                  srli         s4, s3, 13
                  c.addi       s7, -1
                  add          s4, a1, t4
                  mulh         s8, zero, tp
                  c.sub        a0, a1
                  mul          s7, t5, a5
                  c.slli       tp, 29
                  divu         a7, s4, t2
                  c.addi       s7, -1
                  xor          tp, a3, tp
                  c.and        a0, s0
                  c.srai       s0, 8
                  sltiu        a6, ra, -900
                  or           t1, a5, t0
                  c.addi16sp   sp, 256
                  c.or         a2, s0
                  mulh         s8, zero, tp
                  c.addi16sp   sp, 256
                  c.addi       s7, -1
                  sra          a3, t2, s2
                  c.li         s3, 9
                  mulhsu       ra, t3, a0
                  srl          t4, s1, t1
                  slti         sp, a1, 426
                  c.srli       a0, 16
                  c.addi16sp   sp, 256
                  slti         sp, a1, 426
                  c.li         s3, 9
                  c.addi       s7, -1
                  li           s1, 0x80000000 #start riscv_int_numeric_corner_stream_11
                  li           a7, 0xffffffff
                  li           t1, 0xffffffff
                  li           gp, 0xbdf6a18f
                  li           a6, 0x231bc11d
                  li           a5, 0xd379c8f9
                  li           s2, 0x2bd897e2
                  li           s0, 0x80000000
                  li           s6, 0x80000000
                  li           t4, 0xffffffff
                  mul          a6, a6, s2
                  lui          gp, 1036702
                  mulh         a7, gp, a5
                  lui          gp, 1036702
                  div          a5, s0, a6
                  divu         gp, a5, s2
                  mul          a6, a6, s2
                  mul          a6, a6, s2
                  add          s1, a7, a7
                  remu         s0, s1, s2
                  sub          s0, a6, a7
                  add          s1, a7, a7
                  mulh         a7, gp, a5
                  rem          a7, s2, s0
                  add          s1, a7, a7
                  rem          a7, s2, s0
                  div          a5, s0, a6 #end riscv_int_numeric_corner_stream_11
                  c.nop
                  c.xor        a0, s1
                  c.lui        s10, 18
                  c.addi4spn   a0, sp, 368
                  c.slli       tp, 29
                  c.addi       s7, -1
                  addi         s3, s2, -1824
                  c.addi4spn   a0, sp, 368
                  andi         a4, a7, -1410
                  c.srai       s0, 8
                  srli         s4, s3, 13
                  div          t3, sp, t0
                  slti         sp, a1, 426
                  sra          a3, t2, s2
                  rem          t1, s7, s2
                  c.or         a2, s0
                  mulhsu       ra, t3, a0
                  c.addi       s7, -1
                  sub          sp, t0, a2
                  or           t1, a5, t0
                  c.srai       s0, 8
                  mulhu        a5, a3, t5
                  andi         a4, a7, -1410
                  c.nop
                  slt          s3, a6, a0
                  sltiu        a6, ra, -900
                  slli         t1, ra, 5
                  sra          a3, t2, s2
                  div          t3, sp, t0
                  c.addi       s7, -1
                  remu         sp, s3, s7
                  c.sub        a0, a1
                  c.mv         s6, s5
                  slti         sp, a1, 426
                  xor          tp, a3, tp
                  c.srli       a0, 16
                  c.lui        s10, 18
                  and          s3, a6, s7
                  slli         t1, ra, 5
                  mulhsu       ra, t3, a0
                  c.sub        a0, a1
                  mulhsu       ra, t3, a0
                  lui          a7, 1036702
                  slti         sp, a1, 426
                  and          s3, a6, s7
                  sltiu        a6, ra, -900
                  xori         sp, ra, -1938
                  mulhu        a5, a3, t5
                  c.lui        s10, 18
                  mulhu        a5, a3, t5
                  c.andi       a3, 13
                  slli         t1, ra, 5
                  div          t3, sp, t0
                  divu         a7, s4, t2
                  c.sub        a0, a1
                  sub          sp, t0, a2
                  lui          a7, 1036702
                  slli         t1, ra, 5
                  c.and        a0, s0
                  c.srli       a0, 16
                  c.or         a2, s0
                  sltiu        a6, ra, -900
                  c.addi16sp   sp, 256
                  add          s4, a1, t4
                  c.slli       tp, 29
                  srl          t4, s1, t1
                  rem          t1, s7, s2
                  sll          t2, gp, a3
                  c.add        a2, t6
                  mul          s7, t5, a5
                  c.li         s3, 9
                  c.addi4spn   a0, sp, 368
                  c.srai       s0, 8
                  c.nop
                  divu         a7, s4, t2
                  slli         t1, ra, 5
                  c.addi4spn   a0, sp, 368
                  sll          t2, gp, a3
                  and          s3, a6, s7
                  mulhsu       ra, t3, a0
                  addi         s3, s2, -1824
                  c.add        a2, t6
                  nop
                  srli         s4, s3, 13
                  sltiu        a6, ra, -900
                  mulhsu       ra, t3, a0
                  c.or         a2, s0
                  c.sub        a0, a1
                  mulhsu       ra, t3, a0
                  divu         a7, s4, t2
                  mul          s7, t5, a5
                  c.addi       s7, -1
                  xori         sp, ra, -1938
                  c.andi       a3, 13
                  c.xor        a0, s1
                  sub          sp, t0, a2
                  srai         a4, ra, 3
                  or           t1, a5, t0
                  c.addi4spn   a0, sp, 368
                  addi         s3, s2, -1824
                  divu         a7, s4, t2
                  sltiu        a6, ra, -900
                  and          s3, a6, s7
                  c.li         s3, 9
                  div          t3, sp, t0
                  xori         sp, ra, -1938
                  srl          t4, s1, t1
                  c.sub        a0, a1
                  srai         a4, ra, 3
                  add          s4, a1, t4
                  sltiu        a6, ra, -900
                  xori         sp, ra, -1938
                  sltu         s6, s9, sp
                  c.srli       a0, 16
                  andi         a4, a7, -1410
                  divu         a7, s4, t2
                  mulhu        a5, a3, t5
                  xori         sp, ra, -1938
                  remu         sp, s3, s7
                  c.mv         s6, s5
                  slt          s3, a6, a0
                  c.lui        s10, 18
                  c.or         a2, s0
                  c.sub        a0, a1
                  addi         s3, s2, -1824
                  andi         a4, a7, -1410
                  sra          a3, t2, s2
                  mulh         s8, zero, tp
                  mulhsu       ra, t3, a0
                  c.nop
                  c.andi       a3, 13
                  sltiu        a6, ra, -900
                  addi         s3, s2, -1824
                  c.add        a2, t6
                  andi         a4, a7, -1410
                  c.addi16sp   sp, 256
                  c.xor        a0, s1
                  sltu         s6, s9, sp
                  srai         a4, ra, 3
                  or           t1, a5, t0
                  remu         sp, s3, s7
                  andi         a4, a7, -1410
                  c.addi4spn   a0, sp, 368
                  sltu         s6, s9, sp
                  and          s3, a6, s7
                  slli         t1, ra, 5
                  remu         sp, s3, s7
                  c.add        a2, t6
                  slt          s3, a6, a0
                  xori         sp, ra, -1938
                  c.xor        a0, s1
                  c.xor        a0, s1
                  slti         sp, a1, 426
                  sub          sp, t0, a2
                  c.li         s3, 9
                  sll          t2, gp, a3
                  or           t1, a5, t0
                  mulhsu       ra, t3, a0
                  divu         a7, s4, t2
                  or           t1, a5, t0
                  auipc        tp, 368653
                  c.addi       s7, -1
                  mulh         s8, zero, tp
                  c.and        a0, s0
                  c.andi       a3, 13
                  c.slli       tp, 29
                  nop
                  addi         s3, s2, -1824
                  mulhu        a5, a3, t5
                  sra          a3, t2, s2
                  divu         a7, s4, t2
                  xori         sp, ra, -1938
                  andi         a4, a7, -1410
                  lui          a7, 1036702
                  and          s3, a6, s7
                  rem          t1, s7, s2
                  mulhsu       ra, t3, a0
                  remu         sp, s3, s7
                  srl          t4, s1, t1
                  c.slli       tp, 29
                  slli         t1, ra, 5
                  sub          sp, t0, a2
                  c.mv         s6, s5
                  lui          a7, 1036702
                  c.srli       a0, 16
                  mulhsu       ra, t3, a0
                  sub          sp, t0, a2
                  lui          a7, 1036702
                  srai         a4, ra, 3
                  c.addi       s7, -1
                  c.andi       a3, 13
                  c.xor        a0, s1
                  rem          t1, s7, s2
                  and          s3, a6, s7
                  c.addi4spn   a0, sp, 368
                  mulhu        a5, a3, t5
                  mulhsu       ra, t3, a0
                  srl          t4, s1, t1
                  c.add        a2, t6
                  andi         a4, a7, -1410
                  c.and        a0, s0
                  add          s4, a1, t4
                  li           s1, 0x80000000 #start riscv_int_numeric_corner_stream_15
                  li           gp, 0x80000000
                  li           a4, 0x2adae42a
                  li           s6, 0x0
                  li           t3, 0xffffffff
                  li           s0, 0xffffffff
                  li           t6, 0xc529413c
                  li           ra, 0x80000000
                  li           t2, 0xffffffff
                  li           s7, 0x3d582a2a
                  addi         t2, t2, -1824
                  divu         ra, s1, s7
                  mulhu        s0, s7, t3
                  nop
                  nop
                  lui          ra, 1036702
                  mulhu        s0, s7, t3
                  auipc        s1, 368653
                  rem          s6, s7, t2
                  mulh         s6, ra, s1
                  div          s1, t2, a4
                  auipc        s1, 368653
                  rem          s6, s7, t2
                  div          s1, t2, a4
                  nop
                  remu         t2, s0, s7
                  addi         t2, t2, -1824
                  auipc        s1, 368653
                  mul          a4, a4, s7
                  mulhu        s0, s7, t3
                  mulhsu       gp, s7, a4
                  div          s1, t2, a4
                  auipc        s1, 368653
                  div          s1, t2, a4
                  lui          ra, 1036702
                  mulh         s6, ra, s1
                  add          s0, s6, s6 #end riscv_int_numeric_corner_stream_15
                  c.addi4spn   a0, sp, 368
                  divu         a7, s4, t2
                  c.add        a2, t6
                  c.lui        s10, 18
                  c.lui        s10, 18
                  c.addi16sp   sp, 256
                  lui          a7, 1036702
                  slti         sp, a1, 426
                  c.srai       s0, 8
                  mulhsu       ra, t3, a0
                  c.addi4spn   a0, sp, 368
                  c.nop
                  addi         s3, s2, -1824
                  c.addi       s7, -1
                  xori         sp, ra, -1938
                  c.sub        a0, a1
                  c.mv         s6, s5
                  c.nop
                  slli         t1, ra, 5
                  divu         a7, s4, t2
                  nop
                  mul          s7, t5, a5
                  c.srli       a0, 16
                  div          t3, sp, t0
                  c.li         s3, 9
                  c.addi16sp   sp, 256
                  mulhsu       ra, t3, a0
                  remu         sp, s3, s7
                  c.srai       s0, 8
                  c.lui        s10, 18
                  add          s4, a1, t4
                  sll          t2, gp, a3
                  c.li         s3, 9
                  c.andi       a3, 13
                  mulhu        a5, a3, t5
                  srl          t4, s1, t1
                  mulhu        a5, a3, t5
                  c.slli       tp, 29
                  lui          a7, 1036702
                  c.srli       a0, 16
                  mulh         s8, zero, tp
                  sra          a3, t2, s2
                  c.xor        a0, s1
                  sub          sp, t0, a2
                  c.srli       a0, 16
                  srli         s4, s3, 13
                  c.addi16sp   sp, 256
                  c.lui        s10, 18
                  sub          sp, t0, a2
                  div          t3, sp, t0
                  c.slli       tp, 29
                  c.nop
                  sra          a3, t2, s2
                  slli         t1, ra, 5
                  c.and        a0, s0
                  divu         a7, s4, t2
                  c.lui        s10, 18
                  or           t1, a5, t0
                  c.and        a0, s0
                  c.add        a2, t6
                  add          s4, a1, t4
                  c.addi16sp   sp, 256
                  c.and        a0, s0
                  c.addi       s7, -1
                  c.nop
                  mulhu        a5, a3, t5
                  rem          t1, s7, s2
                  c.and        a0, s0
                  sra          a3, t2, s2
                  mulh         s8, zero, tp
                  add          s4, a1, t4
                  sra          a3, t2, s2
                  mul          s7, t5, a5
                  c.addi       s7, -1
                  lui          a7, 1036702
                  c.xor        a0, s1
                  xori         sp, ra, -1938
                  mulh         s8, zero, tp
                  ori          a6, t4, 27
                  mulh         s8, zero, tp
                  c.andi       a3, 13
                  divu         a7, s4, t2
                  div          t3, sp, t0
                  andi         a4, a7, -1410
                  srl          t4, s1, t1
                  auipc        tp, 368653
                  and          s3, a6, s7
                  andi         a4, a7, -1410
                  lui          a7, 1036702
                  c.add        a2, t6
                  c.addi       s7, -1
                  div          t3, sp, t0
                  mulhsu       ra, t3, a0
                  c.addi16sp   sp, 256
                  sltu         s6, s9, sp
                  mul          s7, t5, a5
                  mul          s7, t5, a5
                  c.lui        s10, 18
                  lui          a7, 1036702
                  sll          t2, gp, a3
                  c.andi       a3, 13
                  c.add        a2, t6
                  div          t3, sp, t0
                  remu         sp, s3, s7
                  div          t3, sp, t0
                  lui          a7, 1036702
                  c.add        a2, t6
                  c.addi       s7, -1
                  sub          sp, t0, a2
                  c.xor        a0, s1
                  mulh         s8, zero, tp
                  xor          tp, a3, tp
                  div          t3, sp, t0
                  sltu         s6, s9, sp
                  rem          t1, s7, s2
                  div          t3, sp, t0
                  mulhsu       ra, t3, a0
                  ori          a6, t4, 27
                  c.addi4spn   a0, sp, 368
                  c.sub        a0, a1
                  or           t1, a5, t0
                  c.slli       tp, 29
                  and          s3, a6, s7
                  mulhu        a5, a3, t5
                  nop
                  c.sub        a0, a1
                  mulhu        a5, a3, t5
                  sll          t2, gp, a3
                  sra          a3, t2, s2
                  slli         t1, ra, 5
                  xor          tp, a3, tp
                  c.add        a2, t6
                  nop
                  mulhsu       ra, t3, a0
                  add          s4, a1, t4
                  c.and        a0, s0
                  c.and        a0, s0
                  c.addi16sp   sp, 256
                  srl          t4, s1, t1
                  auipc        tp, 368653
                  c.addi16sp   sp, 256
                  or           t1, a5, t0
                  c.nop
                  auipc        tp, 368653
                  c.sub        a0, a1
                  slt          s3, a6, a0
                  mulhu        a5, a3, t5
                  c.add        a2, t6
                  remu         sp, s3, s7
                  srli         s4, s3, 13
                  c.sub        a0, a1
                  or           t1, a5, t0
                  slli         t1, ra, 5
                  sltu         s6, s9, sp
                  lui          a7, 1036702
                  c.srli       a0, 16
                  xori         sp, ra, -1938
                  slt          s3, a6, a0
                  sltiu        a6, ra, -900
                  srl          t4, s1, t1
                  xor          tp, a3, tp
                  c.srai       s0, 8
                  c.and        a0, s0
                  c.slli       tp, 29
                  remu         sp, s3, s7
                  mul          s7, t5, a5
                  srai         a4, ra, 3
                  c.addi4spn   a0, sp, 368
                  andi         a4, a7, -1410
                  c.and        a0, s0
                  remu         sp, s3, s7
                  c.addi4spn   a0, sp, 368
                  c.nop
                  div          t3, sp, t0
                  sll          t2, gp, a3
                  xor          tp, a3, tp
                  rem          t1, s7, s2
                  xori         sp, ra, -1938
                  sll          t2, gp, a3
                  srli         s4, s3, 13
                  nop
                  c.srai       s0, 8
                  slli         t1, ra, 5
                  c.mv         s6, s5
                  c.xor        a0, s1
                  remu         sp, s3, s7
                  c.mv         s6, s5
                  c.xor        a0, s1
                  nop
                  and          s3, a6, s7
                  lui          a7, 1036702
                  c.nop
                  c.xor        a0, s1
                  andi         a4, a7, -1410
                  div          t3, sp, t0
                  sub          sp, t0, a2
                  and          s3, a6, s7
                  srl          t4, s1, t1
                  andi         a4, a7, -1410
                  c.addi4spn   a0, sp, 368
                  srai         a4, ra, 3
                  lui          a7, 1036702
                  c.mv         s6, s5
                  mulhu        a5, a3, t5
                  addi         s3, s2, -1824
                  c.addi4spn   a0, sp, 368
                  divu         a7, s4, t2
                  slt          s3, a6, a0
                  sll          t2, gp, a3
                  sra          a3, t2, s2
                  mulh         s8, zero, tp
                  srli         s4, s3, 13
                  c.andi       a3, 13
                  remu         sp, s3, s7
                  slti         sp, a1, 426
                  c.addi       s7, -1
                  c.add        a2, t6
                  xor          tp, a3, tp
                  rem          t1, s7, s2
                  mulhu        a5, a3, t5
                  c.srai       s0, 8
                  rem          t1, s7, s2
                  xor          tp, a3, tp
                  c.sub        a0, a1
                  sltiu        a6, ra, -900
                  c.slli       tp, 29
                  c.addi16sp   sp, 256
                  div          t3, sp, t0
                  c.sub        a0, a1
                  mulh         s8, zero, tp
                  slti         sp, a1, 426
                  c.add        a2, t6
                  c.addi16sp   sp, 256
                  divu         a7, s4, t2
                  srl          t4, s1, t1
                  sll          t2, gp, a3
                  c.and        a0, s0
                  c.addi4spn   a0, sp, 368
                  divu         a7, s4, t2
                  sltiu        a6, ra, -900
                  c.addi16sp   sp, 256
                  nop
                  addi         s3, s2, -1824
                  sltiu        a6, ra, -900
                  mulhu        a5, a3, t5
                  mulhsu       ra, t3, a0
                  c.srli       a0, 16
                  slt          s3, a6, a0
                  sltu         s6, s9, sp
                  div          t3, sp, t0
                  slli         t1, ra, 5
                  c.nop
                  c.srai       s0, 8
                  mulhsu       ra, t3, a0
                  c.li         s3, 9
                  c.addi16sp   sp, 256
                  or           t1, a5, t0
                  c.srli       a0, 16
                  c.addi16sp   sp, 256
                  slt          s3, a6, a0
                  c.and        a0, s0
                  add          s4, a1, t4
                  c.li         s3, 9
                  c.mv         s6, s5
                  c.addi4spn   a0, sp, 368
                  srli         s4, s3, 13
                  lui          a7, 1036702
                  lui          a7, 1036702
                  andi         a4, a7, -1410
                  sll          t2, gp, a3
                  c.slli       tp, 29
                  auipc        tp, 368653
                  li           a2, 0x0 #start riscv_int_numeric_corner_stream_1
                  li           gp, 0x82f634b7
                  li           t6, 0xa3bed843
                  li           s10, 0x0
                  li           s11, 0xffffffff
                  li           a5, 0x80000000
                  li           t3, 0xce5ba905
                  li           s8, 0xf1239f47
                  li           a4, 0x8cba39e1
                  li           a6, 0xffffffff
                  sub          a4, s8, s10
                  addi         a4, a4, -1824
                  div          a6, a4, s8
                  sub          a4, s8, s10
                  divu         gp, a6, s11
                  auipc        a6, 368653
                  mulh         s10, gp, a6
                  sub          a4, s8, s10
                  nop
                  lui          gp, 1036702
                  mul          s8, s8, s11
                  lui          gp, 1036702
                  nop
                  lui          gp, 1036702
                  lui          gp, 1036702
                  nop
                  mulhu        a5, s11, t3
                  add          a5, s10, s10
                  rem          s10, s11, a4
                  addi         a4, a4, -1824
                  mulh         s10, gp, a6
                  auipc        a6, 368653
                  remu         a4, a5, s11
                  mul          s8, s8, s11 #end riscv_int_numeric_corner_stream_1
                  c.mv         s6, s5
                  and          s3, a6, s7
                  slt          s3, a6, a0
                  c.srli       a0, 16
                  c.addi16sp   sp, 256
                  c.addi16sp   sp, 256
                  and          s3, a6, s7
                  sll          t2, gp, a3
                  mulh         s8, zero, tp
                  sub          sp, t0, a2
                  c.srli       a0, 16
                  and          s3, a6, s7
                  c.or         a2, s0
                  c.add        a2, t6
                  xori         sp, ra, -1938
                  sll          t2, gp, a3
                  nop
                  c.and        a0, s0
                  xor          tp, a3, tp
                  c.and        a0, s0
                  c.or         a2, s0
                  mul          s7, t5, a5
                  add          s4, a1, t4
                  xori         sp, ra, -1938
                  addi         s3, s2, -1824
                  srl          t4, s1, t1
                  slli         t1, ra, 5
                  addi         s3, s2, -1824
                  or           t1, a5, t0
                  mulhsu       ra, t3, a0
                  sll          t2, gp, a3
                  addi         s3, s2, -1824
                  nop
                  c.or         a2, s0
                  c.nop
                  andi         a4, a7, -1410
                  srl          t4, s1, t1
                  mulhsu       ra, t3, a0
                  mulhu        a5, a3, t5
                  slt          s3, a6, a0
                  add          s4, a1, t4
                  srli         s4, s3, 13
                  c.slli       tp, 29
                  c.add        a2, t6
                  sltu         s6, s9, sp
                  slti         sp, a1, 426
                  addi         s3, s2, -1824
                  sub          sp, t0, a2
                  c.addi16sp   sp, 256
                  and          s3, a6, s7
                  divu         a7, s4, t2
                  divu         a7, s4, t2
                  c.or         a2, s0
                  divu         a7, s4, t2
                  srli         s4, s3, 13
                  rem          t1, s7, s2
                  rem          t1, s7, s2
                  c.nop
                  andi         a4, a7, -1410
                  c.slli       tp, 29
                  sll          t2, gp, a3
                  c.addi4spn   a0, sp, 368
                  auipc        tp, 368653
                  c.srai       s0, 8
                  sub          sp, t0, a2
                  divu         a7, s4, t2
                  mulhu        a5, a3, t5
                  divu         a7, s4, t2
                  and          s3, a6, s7
                  slli         t1, ra, 5
                  c.sub        a0, a1
                  c.mv         s6, s5
                  c.sub        a0, a1
                  div          t3, sp, t0
                  c.addi       s7, -1
                  sltu         s6, s9, sp
                  sltu         s6, s9, sp
                  c.slli       tp, 29
                  c.andi       a3, 13
                  c.addi4spn   a0, sp, 368
                  mulh         s8, zero, tp
                  sltu         s6, s9, sp
                  c.srli       a0, 16
                  and          s3, a6, s7
                  c.andi       a3, 13
                  c.srli       a0, 16
                  remu         sp, s3, s7
                  mul          s7, t5, a5
                  slt          s3, a6, a0
                  lui          a7, 1036702
                  and          s3, a6, s7
                  c.xor        a0, s1
                  c.slli       tp, 29
                  c.lui        s10, 18
                  c.addi16sp   sp, 256
                  slt          s3, a6, a0
                  srai         a4, ra, 3
                  sltiu        a6, ra, -900
                  c.slli       tp, 29
                  sub          sp, t0, a2
                  or           t1, a5, t0
                  c.add        a2, t6
                  auipc        tp, 368653
                  nop
                  auipc        tp, 368653
                  srl          t4, s1, t1
                  mulhu        a5, a3, t5
                  srai         a4, ra, 3
                  slt          s3, a6, a0
                  srl          t4, s1, t1
                  mulhsu       ra, t3, a0
                  lui          a7, 1036702
                  slt          s3, a6, a0
                  c.addi4spn   a0, sp, 368
                  c.srai       s0, 8
                  slt          s3, a6, a0
                  mulh         s8, zero, tp
                  srli         s4, s3, 13
                  remu         sp, s3, s7
                  nop
                  addi         s3, s2, -1824
                  sub          sp, t0, a2
                  sll          t2, gp, a3
                  mulhsu       ra, t3, a0
                  c.lui        s10, 18
                  c.li         s3, 9
                  add          s4, a1, t4
                  nop
                  c.andi       a3, 13
                  andi         a4, a7, -1410
                  c.addi16sp   sp, 256
                  c.andi       a3, 13
                  c.addi       s7, -1
                  c.or         a2, s0
                  xor          tp, a3, tp
                  mulh         s8, zero, tp
                  c.addi16sp   sp, 256
                  mul          s7, t5, a5
                  sltu         s6, s9, sp
                  c.mv         s6, s5
                  srai         a4, ra, 3
                  mulhsu       ra, t3, a0
                  addi         s3, s2, -1824
                  slti         sp, a1, 426
                  srai         a4, ra, 3
                  c.addi16sp   sp, 256
                  add          s4, a1, t4
                  nop
                  nop
                  c.sub        a0, a1
                  c.addi       s7, -1
                  auipc        tp, 368653
                  c.and        a0, s0
                  c.li         s3, 9
                  nop
                  auipc        tp, 368653
                  or           t1, a5, t0
                  c.nop
                  sra          a3, t2, s2
                  remu         sp, s3, s7
                  remu         sp, s3, s7
                  c.addi16sp   sp, 256
                  slt          s3, a6, a0
                  mul          s7, t5, a5
                  remu         sp, s3, s7
                  c.srai       s0, 8
                  c.srli       a0, 16
                  c.addi       s7, -1
                  c.addi4spn   a0, sp, 368
                  or           t1, a5, t0
                  srai         a4, ra, 3
                  and          s3, a6, s7
                  sub          sp, t0, a2
                  auipc        tp, 368653
                  sltu         s6, s9, sp
                  c.slli       tp, 29
                  sub          sp, t0, a2
                  or           t1, a5, t0
                  or           t1, a5, t0
                  c.and        a0, s0
                  ori          a6, t4, 27
                  c.nop
                  c.sub        a0, a1
                  c.li         s3, 9
                  c.lui        s10, 18
                  c.addi16sp   sp, 256
                  auipc        tp, 368653
                  c.andi       a3, 13
                  div          t3, sp, t0
                  c.sub        a0, a1
                  sltu         s6, s9, sp
                  add          s4, a1, t4
                  c.or         a2, s0
                  c.srli       a0, 16
                  slti         sp, a1, 426
                  xori         sp, ra, -1938
                  c.addi4spn   a0, sp, 368
                  ori          a6, t4, 27
                  sub          sp, t0, a2
                  c.addi16sp   sp, 256
                  mul          s7, t5, a5
                  xor          tp, a3, tp
                  slti         sp, a1, 426
                  nop
                  andi         a4, a7, -1410
                  andi         a4, a7, -1410
                  lui          a7, 1036702
                  lui          a7, 1036702
                  c.sub        a0, a1
                  or           t1, a5, t0
                  auipc        tp, 368653
                  mul          s7, t5, a5
                  c.nop
                  mulhsu       ra, t3, a0
                  c.srli       a0, 16
                  c.srli       a0, 16
                  c.addi       s7, -1
                  c.and        a0, s0
                  c.li         s3, 9
                  slti         sp, a1, 426
                  sra          a3, t2, s2
                  and          s3, a6, s7
                  xor          tp, a3, tp
                  c.slli       tp, 29
                  or           t1, a5, t0
                  sub          sp, t0, a2
                  addi         s3, s2, -1824
                  c.addi       s7, -1
                  c.xor        a0, s1
                  slli         t1, ra, 5
                  remu         sp, s3, s7
                  sll          t2, gp, a3
                  sltu         s6, s9, sp
                  sltiu        a6, ra, -900
                  mul          s7, t5, a5
                  mulh         s8, zero, tp
                  srli         s4, s3, 13
                  c.xor        a0, s1
                  c.andi       a3, 13
                  add          s4, a1, t4
                  div          t3, sp, t0
                  auipc        tp, 368653
                  c.lui        s10, 18
                  c.xor        a0, s1
                  add          s4, a1, t4
                  sll          t2, gp, a3
                  lui          a7, 1036702
                  sltu         s6, s9, sp
                  sltu         s6, s9, sp
                  srli         s4, s3, 13
                  c.li         s3, 9
                  xori         sp, ra, -1938
                  mulhu        a5, a3, t5
                  slti         sp, a1, 426
                  slli         t1, ra, 5
                  c.and        a0, s0
                  and          s3, a6, s7
                  srl          t4, s1, t1
                  c.addi       s7, -1
                  c.andi       a3, 13
                  sub          sp, t0, a2
                  lui          a7, 1036702
                  mulhsu       ra, t3, a0
                  c.mv         s6, s5
                  add          s4, a1, t4
                  sltu         s6, s9, sp
                  srl          t4, s1, t1
                  c.slli       tp, 29
                  and          s3, a6, s7
                  c.and        a0, s0
                  add          s4, a1, t4
                  c.nop
                  or           t1, a5, t0
                  srl          t4, s1, t1
                  sltiu        a6, ra, -900
                  auipc        tp, 368653
                  sra          a3, t2, s2
                  xor          tp, a3, tp
                  xor          tp, a3, tp
                  c.slli       tp, 29
                  srli         s4, s3, 13
                  xor          tp, a3, tp
                  c.srli       a0, 16
                  mulhsu       ra, t3, a0
                  addi         s3, s2, -1824
                  and          s3, a6, s7
                  c.mv         s6, s5
                  slt          s3, a6, a0
                  c.slli       tp, 29
                  mulh         s8, zero, tp
                  auipc        tp, 368653
                  add          s4, a1, t4
                  mulh         s8, zero, tp
                  c.srai       s0, 8
                  xor          tp, a3, tp
                  andi         a4, a7, -1410
                  slt          s3, a6, a0
                  remu         sp, s3, s7
                  c.lui        s10, 18
                  or           t1, a5, t0
                  slti         sp, a1, 426
                  sll          t2, gp, a3
                  c.andi       a3, 13
                  srli         s4, s3, 13
                  divu         a7, s4, t2
                  c.li         s3, 9
                  slli         t1, ra, 5
                  c.slli       tp, 29
                  mulh         s8, zero, tp
                  div          t3, sp, t0
                  andi         a4, a7, -1410
                  mulhsu       ra, t3, a0
                  c.lui        s10, 18
                  xor          tp, a3, tp
                  sra          a3, t2, s2
                  ori          a6, t4, 27
                  mulhu        a5, a3, t5
                  c.addi4spn   a0, sp, 368
                  xor          tp, a3, tp
                  sltiu        a6, ra, -900
                  srl          t4, s1, t1
                  c.sub        a0, a1
                  div          t3, sp, t0
                  xor          tp, a3, tp
                  slli         t1, ra, 5
                  c.srai       s0, 8
                  sra          a3, t2, s2
                  or           t1, a5, t0
                  add          s4, a1, t4
                  c.xor        a0, s1
                  divu         a7, s4, t2
                  rem          t1, s7, s2
                  mul          s7, t5, a5
                  mul          s7, t5, a5
                  sra          a3, t2, s2
                  slt          s3, a6, a0
                  auipc        tp, 368653
                  srai         a4, ra, 3
                  c.slli       tp, 29
                  divu         a7, s4, t2
                  c.addi16sp   sp, 256
                  sra          a3, t2, s2
                  mul          s7, t5, a5
                  or           t1, a5, t0
                  c.mv         s6, s5
                  c.srai       s0, 8
                  remu         sp, s3, s7
                  sub          sp, t0, a2
                  xori         sp, ra, -1938
                  sub          sp, t0, a2
                  auipc        tp, 368653
                  slti         sp, a1, 426
                  slt          s3, a6, a0
                  sltiu        a6, ra, -900
                  sltiu        a6, ra, -900
                  xori         sp, ra, -1938
                  c.xor        a0, s1
                  lui          a7, 1036702
                  c.srli       a0, 16
                  and          s3, a6, s7
                  ori          a6, t4, 27
                  sub          sp, t0, a2
                  c.srai       s0, 8
                  c.or         a2, s0
                  sll          t2, gp, a3
                  c.addi16sp   sp, 256
                  auipc        tp, 368653
                  rem          t1, s7, s2
                  ori          a6, t4, 27
                  nop
                  andi         a4, a7, -1410
                  xori         sp, ra, -1938
                  mulh         s8, zero, tp
                  c.slli       tp, 29
                  srl          t4, s1, t1
                  c.mv         s6, s5
                  xori         sp, ra, -1938
                  sll          t2, gp, a3
                  mulh         s8, zero, tp
                  or           t1, a5, t0
                  srai         a4, ra, 3
                  ori          a6, t4, 27
                  c.sub        a0, a1
                  c.li         s3, 9
                  addi         s3, s2, -1824
                  div          t3, sp, t0
                  andi         a4, a7, -1410
                  add          s4, a1, t4
                  c.and        a0, s0
                  sll          t2, gp, a3
                  c.sub        a0, a1
                  c.srli       a0, 16
                  c.xor        a0, s1
                  divu         a7, s4, t2
                  ori          a6, t4, 27
                  c.addi16sp   sp, 256
                  div          t3, sp, t0
                  div          t3, sp, t0
                  mulhu        a5, a3, t5
                  c.lui        s10, 18
                  c.or         a2, s0
                  sltu         s6, s9, sp
                  mulhsu       ra, t3, a0
                  divu         a7, s4, t2
                  sll          t2, gp, a3
                  c.or         a2, s0
                  ori          a6, t4, 27
                  c.addi4spn   a0, sp, 368
                  c.sub        a0, a1
                  and          s3, a6, s7
                  c.addi16sp   sp, 256
                  addi         s3, s2, -1824
                  and          s3, a6, s7
                  c.srai       s0, 8
                  sll          t2, gp, a3
                  c.and        a0, s0
                  c.slli       tp, 29
                  slli         t1, ra, 5
                  xor          tp, a3, tp
                  div          t3, sp, t0
                  c.andi       a3, 13
                  xor          tp, a3, tp
                  c.lui        s10, 18
                  c.nop
                  mulhu        a5, a3, t5
                  remu         sp, s3, s7
                  ori          a6, t4, 27
                  sltiu        a6, ra, -900
                  slt          s3, a6, a0
                  mulhsu       ra, t3, a0
                  c.srli       a0, 16
                  ori          a6, t4, 27
                  c.xor        a0, s1
                  sub          sp, t0, a2
                  xori         sp, ra, -1938
                  divu         a7, s4, t2
                  c.srai       s0, 8
                  sll          t2, gp, a3
                  remu         sp, s3, s7
                  mulhu        a5, a3, t5
                  c.slli       tp, 29
                  and          s3, a6, s7
                  c.andi       a3, 13
                  srai         a4, ra, 3
                  c.srli       a0, 16
                  c.addi4spn   a0, sp, 368
                  c.and        a0, s0
                  c.addi4spn   a0, sp, 368
                  remu         sp, s3, s7
                  lui          a7, 1036702
                  rem          t1, s7, s2
                  c.sub        a0, a1
                  c.lui        s10, 18
                  c.andi       a3, 13
                  c.andi       a3, 13
                  c.addi16sp   sp, 256
                  sub          sp, t0, a2
                  divu         a7, s4, t2
                  sltu         s6, s9, sp
                  ori          a6, t4, 27
                  mulhsu       ra, t3, a0
                  remu         sp, s3, s7
                  mulh         s8, zero, tp
                  rem          t1, s7, s2
                  sll          t2, gp, a3
                  divu         a7, s4, t2
                  srli         s4, s3, 13
                  srai         a4, ra, 3
                  c.mv         s6, s5
                  c.srli       a0, 16
                  c.slli       tp, 29
                  c.xor        a0, s1
                  c.li         s3, 9
                  c.add        a2, t6
                  c.andi       a3, 13
                  sltu         s6, s9, sp
                  andi         a4, a7, -1410
                  c.add        a2, t6
                  sll          t2, gp, a3
                  lui          a7, 1036702
                  mulhu        a5, a3, t5
                  c.xor        a0, s1
                  and          s3, a6, s7
                  c.sub        a0, a1
                  slti         sp, a1, 426
                  c.addi4spn   a0, sp, 368
                  mulhsu       ra, t3, a0
                  sub          sp, t0, a2
                  div          t3, sp, t0
                  xori         sp, ra, -1938
                  c.nop
                  auipc        tp, 368653
                  lui          a7, 1036702
                  div          t3, sp, t0
                  ori          a6, t4, 27
                  slli         t1, ra, 5
                  c.slli       tp, 29
                  c.addi16sp   sp, 256
                  c.addi4spn   a0, sp, 368
                  mulh         s8, zero, tp
                  auipc        tp, 368653
                  slt          s3, a6, a0
                  c.addi4spn   a0, sp, 368
                  lui          a7, 1036702
                  c.and        a0, s0
                  c.or         a2, s0
                  sll          t2, gp, a3
                  auipc        tp, 368653
                  divu         a7, s4, t2
                  sltu         s6, s9, sp
                  srai         a4, ra, 3
                  c.addi16sp   sp, 256
                  andi         a4, a7, -1410
                  sltu         s6, s9, sp
                  sltiu        a6, ra, -900
                  addi         s3, s2, -1824
                  c.slli       tp, 29
                  c.li         s3, 9
                  c.srli       a0, 16
                  c.li         s3, 9
                  c.add        a2, t6
                  c.addi       s7, -1
                  mulhsu       ra, t3, a0
                  mulh         s8, zero, tp
                  mul          s7, t5, a5
                  or           t1, a5, t0
                  c.and        a0, s0
                  c.or         a2, s0
                  c.srli       a0, 16
                  c.andi       a3, 13
                  c.li         s3, 9
                  srli         s4, s3, 13
                  c.srai       s0, 8
                  sub          sp, t0, a2
                  c.li         s3, 9
                  slli         t1, ra, 5
                  c.mv         s6, s5
                  c.srai       s0, 8
                  lui          a7, 1036702
                  andi         a4, a7, -1410
                  c.srli       a0, 16
                  add          s4, a1, t4
                  sll          t2, gp, a3
                  c.andi       a3, 13
                  xor          tp, a3, tp
                  rem          t1, s7, s2
                  sltu         s6, s9, sp
                  srli         s4, s3, 13
                  nop
                  c.li         s3, 9
                  c.addi       s7, -1
                  auipc        tp, 368653
                  c.add        a2, t6
                  sra          a3, t2, s2
                  auipc        tp, 368653
                  xor          tp, a3, tp
                  c.srai       s0, 8
                  rem          t1, s7, s2
                  c.sub        a0, a1
                  or           t1, a5, t0
                  nop
                  slt          s3, a6, a0
                  c.addi4spn   a0, sp, 368
                  lui          a7, 1036702
                  add          s4, a1, t4
                  divu         a7, s4, t2
                  mul          s7, t5, a5
                  srl          t4, s1, t1
                  c.mv         s6, s5
                  c.lui        s10, 18
                  and          s3, a6, s7
                  slli         t1, ra, 5
                  c.nop
                  c.srai       s0, 8
                  srai         a4, ra, 3
                  c.srai       s0, 8
                  xori         sp, ra, -1938
                  sltu         s6, s9, sp
                  c.nop
                  mulhu        a5, a3, t5
                  nop
                  c.xor        a0, s1
                  mulhu        a5, a3, t5
                  c.srli       a0, 16
                  lui          a7, 1036702
                  and          s3, a6, s7
                  and          s3, a6, s7
                  c.li         s3, 9
                  rem          t1, s7, s2
                  slti         sp, a1, 426
                  lui          a7, 1036702
                  srl          t4, s1, t1
                  or           t1, a5, t0
                  slli         t1, ra, 5
                  c.and        a0, s0
                  c.addi4spn   a0, sp, 368
                  c.sub        a0, a1
                  c.srli       a0, 16
                  mul          s7, t5, a5
                  mulhsu       ra, t3, a0
                  addi         s3, s2, -1824
                  c.or         a2, s0
                  c.srli       a0, 16
                  sll          t2, gp, a3
                  c.add        a2, t6
                  mulh         s8, zero, tp
                  mulhsu       ra, t3, a0
                  c.addi16sp   sp, 256
                  c.sub        a0, a1
                  or           t1, a5, t0
                  mul          s7, t5, a5
                  c.or         a2, s0
                  li           ra, 0x0 #start riscv_int_numeric_corner_stream_36
                  li           s0, 0xffffffff
                  li           a0, 0x0
                  li           a7, 0x0
                  li           sp, 0xffffffff
                  li           gp, 0x0
                  li           s10, 0x80000000
                  li           t0, 0x0
                  li           s3, 0x0
                  li           a2, 0xd93561c8
                  add          t0, a2, a2
                  auipc        s0, 368653
                  lui          ra, 1036702
                  rem          a2, a7, gp
                  mulhsu       sp, a7, a0
                  addi         gp, gp, -1824
                  addi         gp, gp, -1824
                  sub          gp, a0, a2
                  sub          gp, a0, a2
                  add          t0, a2, a2
                  mulh         a2, ra, s0
                  mul          a0, a0, a7
                  rem          a2, a7, gp
                  addi         gp, gp, -1824
                  mulh         a2, ra, s0 #end riscv_int_numeric_corner_stream_36
                  auipc        tp, 368653
                  c.slli       tp, 29
                  c.nop
                  mulhsu       ra, t3, a0
                  sltu         s6, s9, sp
                  c.mv         s6, s5
                  c.or         a2, s0
                  c.srli       a0, 16
                  sub          sp, t0, a2
                  c.slli       tp, 29
                  sltiu        a6, ra, -900
                  divu         a7, s4, t2
                  c.nop
                  srl          t4, s1, t1
                  slli         t1, ra, 5
                  ori          a6, t4, 27
                  mulhu        a5, a3, t5
                  lui          a7, 1036702
                  sltiu        a6, ra, -900
                  sub          sp, t0, a2
                  mulhu        a5, a3, t5
                  c.add        a2, t6
                  c.add        a2, t6
                  sra          a3, t2, s2
                  c.li         s3, 9
                  c.srai       s0, 8
                  xor          tp, a3, tp
                  sltu         s6, s9, sp
                  mulhsu       ra, t3, a0
                  c.andi       a3, 13
                  mulhsu       ra, t3, a0
                  sub          sp, t0, a2
                  c.srli       a0, 16
                  c.addi       s7, -1
                  and          s3, a6, s7
                  mulh         s8, zero, tp
                  addi         s3, s2, -1824
                  c.addi       s7, -1
                  remu         sp, s3, s7
                  sltiu        a6, ra, -900
                  c.slli       tp, 29
                  or           t1, a5, t0
                  srl          t4, s1, t1
                  c.add        a2, t6
                  sub          sp, t0, a2
                  sub          sp, t0, a2
                  c.addi16sp   sp, 256
                  srl          t4, s1, t1
                  srli         s4, s3, 13
                  mulhu        a5, a3, t5
                  auipc        tp, 368653
                  sltu         s6, s9, sp
                  auipc        tp, 368653
                  c.srai       s0, 8
                  c.li         s3, 9
                  c.andi       a3, 13
                  add          s4, a1, t4
                  c.srai       s0, 8
                  c.srli       a0, 16
                  remu         sp, s3, s7
                  c.xor        a0, s1
                  mulh         s8, zero, tp
                  div          t3, sp, t0
                  sub          sp, t0, a2
                  rem          t1, s7, s2
                  mul          s7, t5, a5
                  c.and        a0, s0
                  and          s3, a6, s7
                  c.addi4spn   a0, sp, 368
                  sltiu        a6, ra, -900
                  c.xor        a0, s1
                  nop
                  auipc        tp, 368653
                  c.lui        s10, 18
                  srl          t4, s1, t1
                  c.add        a2, t6
                  sra          a3, t2, s2
                  slli         t1, ra, 5
                  xor          tp, a3, tp
                  sltu         s6, s9, sp
                  add          s4, a1, t4
                  or           t1, a5, t0
                  xori         sp, ra, -1938
                  mulh         s8, zero, tp
                  c.srai       s0, 8
                  c.xor        a0, s1
                  mul          s7, t5, a5
                  and          s3, a6, s7
                  or           t1, a5, t0
                  c.addi16sp   sp, 256
                  c.srai       s0, 8
                  c.add        a2, t6
                  lui          a7, 1036702
                  c.addi16sp   sp, 256
                  c.addi4spn   a0, sp, 368
                  c.addi4spn   a0, sp, 368
                  mulhu        a5, a3, t5
                  srl          t4, s1, t1
                  mulhu        a5, a3, t5
                  c.and        a0, s0
                  sltiu        a6, ra, -900
                  rem          t1, s7, s2
                  xor          tp, a3, tp
                  divu         a7, s4, t2
                  sub          sp, t0, a2
                  slti         sp, a1, 426
                  rem          t1, s7, s2
                  auipc        tp, 368653
                  c.nop
                  c.addi16sp   sp, 256
                  c.add        a2, t6
                  c.addi4spn   a0, sp, 368
                  sltiu        a6, ra, -900
                  c.nop
                  divu         a7, s4, t2
                  slt          s3, a6, a0
                  srli         s4, s3, 13
                  slt          s3, a6, a0
                  andi         a4, a7, -1410
                  divu         a7, s4, t2
                  mulh         s8, zero, tp
                  rem          t1, s7, s2
                  remu         sp, s3, s7
                  lui          a7, 1036702
                  andi         a4, a7, -1410
                  c.xor        a0, s1
                  c.sub        a0, a1
                  c.andi       a3, 13
                  c.sub        a0, a1
                  lui          a7, 1036702
                  c.li         s3, 9
                  slti         sp, a1, 426
                  mulh         s8, zero, tp
                  c.srai       s0, 8
                  and          s3, a6, s7
                  mul          s7, t5, a5
                  srai         a4, ra, 3
                  sll          t2, gp, a3
                  c.add        a2, t6
                  andi         a4, a7, -1410
                  slli         t1, ra, 5
                  sub          sp, t0, a2
                  srli         s4, s3, 13
                  c.and        a0, s0
                  divu         a7, s4, t2
                  divu         a7, s4, t2
                  addi         s3, s2, -1824
                  c.nop
                  srl          t4, s1, t1
                  c.lui        s10, 18
                  c.add        a2, t6
                  or           t1, a5, t0
                  mulhsu       ra, t3, a0
                  sltu         s6, s9, sp
                  add          s4, a1, t4
                  div          t3, sp, t0
                  srai         a4, ra, 3
                  slt          s3, a6, a0
                  mulhu        a5, a3, t5
                  c.addi4spn   a0, sp, 368
                  nop
                  and          s3, a6, s7
                  c.add        a2, t6
                  c.andi       a3, 13
                  c.lui        s10, 18
                  c.srai       s0, 8
                  sltiu        a6, ra, -900
                  sll          t2, gp, a3
                  mulhu        a5, a3, t5
                  srli         s4, s3, 13
                  auipc        tp, 368653
                  addi         s3, s2, -1824
                  sra          a3, t2, s2
                  srl          t4, s1, t1
                  div          t3, sp, t0
                  c.li         s3, 9
                  mulhu        a5, a3, t5
                  slt          s3, a6, a0
                  c.or         a2, s0
                  c.addi16sp   sp, 256
                  mulh         s8, zero, tp
                  srai         a4, ra, 3
                  mul          s7, t5, a5
                  c.addi       s7, -1
                  auipc        tp, 368653
                  c.srli       a0, 16
                  xori         sp, ra, -1938
                  and          s3, a6, s7
                  srai         a4, ra, 3
                  div          t3, sp, t0
                  srl          t4, s1, t1
                  c.li         s3, 9
                  slti         sp, a1, 426
                  slt          s3, a6, a0
                  div          t3, sp, t0
                  c.li         s3, 9
                  c.sub        a0, a1
                  c.nop
                  sra          a3, t2, s2
                  ori          a6, t4, 27
                  sub          sp, t0, a2
                  addi         s3, s2, -1824
                  ori          a6, t4, 27
                  c.andi       a3, 13
                  or           t1, a5, t0
                  slli         t1, ra, 5
                  lui          a7, 1036702
                  xori         sp, ra, -1938
                  c.addi4spn   a0, sp, 368
                  lui          a7, 1036702
                  div          t3, sp, t0
                  div          t3, sp, t0
                  c.lui        s10, 18
                  sltu         s6, s9, sp
                  srai         a4, ra, 3
                  lui          a7, 1036702
                  c.addi       s7, -1
                  c.lui        s10, 18
                  c.andi       a3, 13
                  sltiu        a6, ra, -900
                  mul          s7, t5, a5
                  remu         sp, s3, s7
                  mul          s7, t5, a5
                  andi         a4, a7, -1410
                  mulhsu       ra, t3, a0
                  c.srai       s0, 8
                  add          s4, a1, t4
                  xor          tp, a3, tp
                  c.addi16sp   sp, 256
                  sltiu        a6, ra, -900
                  sltu         s6, s9, sp
                  mul          s7, t5, a5
                  c.srli       a0, 16
                  li           a4, 0xffffffff #start riscv_int_numeric_corner_stream_14
                  li           a0, 0xffffffff
                  li           ra, 0xffffffff
                  li           tp, 0xffffffff
                  li           a2, 0x80000000
                  li           s6, 0x5f2e838
                  li           t6, 0xffffffff
                  li           t3, 0x80000000
                  li           sp, 0xc87b7145
                  li           gp, 0x0
                  mulhsu       sp, s6, a2
                  mulh         a4, ra, a0
                  mulhu        tp, s6, t3
                  remu         gp, tp, s6
                  addi         gp, gp, -1824
                  auipc        a0, 368653
                  divu         ra, a0, s6
                  div          a0, gp, a2
                  auipc        a0, 368653
                  sub          gp, a2, a4
                  mulhu        tp, s6, t3
                  remu         gp, tp, s6
                  mulhu        tp, s6, t3
                  add          tp, a4, a4
                  mulh         a4, ra, a0
                  add          tp, a4, a4
                  rem          a4, s6, gp
                  divu         ra, a0, s6
                  nop
                  rem          a4, s6, gp
                  div          a0, gp, a2 #end riscv_int_numeric_corner_stream_14
                  c.andi       a3, 13
                  c.lui        s10, 18
                  srli         s4, s3, 13
                  c.slli       tp, 29
                  slli         t1, ra, 5
                  addi         s3, s2, -1824
                  c.add        a2, t6
                  sub          sp, t0, a2
                  c.li         s3, 9
                  c.sub        a0, a1
                  srai         a4, ra, 3
                  sub          sp, t0, a2
                  c.and        a0, s0
                  c.nop
                  nop
                  sltiu        a6, ra, -900
                  c.and        a0, s0
                  c.srli       a0, 16
                  mulhsu       ra, t3, a0
                  nop
                  lui          a7, 1036702
                  addi         s3, s2, -1824
                  c.mv         s6, s5
                  c.xor        a0, s1
                  slt          s3, a6, a0
                  c.addi16sp   sp, 256
                  lui          a7, 1036702
                  addi         s3, s2, -1824
                  rem          t1, s7, s2
                  c.and        a0, s0
                  xor          tp, a3, tp
                  sra          a3, t2, s2
                  ori          a6, t4, 27
                  slti         sp, a1, 426
                  and          s3, a6, s7
                  c.nop
                  slli         t1, ra, 5
                  c.and        a0, s0
                  c.and        a0, s0
                  rem          t1, s7, s2
                  c.and        a0, s0
                  slti         sp, a1, 426
                  c.srli       a0, 16
                  sub          sp, t0, a2
                  auipc        tp, 368653
                  lui          a7, 1036702
                  c.addi4spn   a0, sp, 368
                  sltiu        a6, ra, -900
                  xor          tp, a3, tp
                  c.addi16sp   sp, 256
                  srli         s4, s3, 13
                  sll          t2, gp, a3
                  c.andi       a3, 13
                  c.addi       s7, -1
                  nop
                  sub          sp, t0, a2
                  lui          a7, 1036702
                  or           t1, a5, t0
                  nop
                  c.srai       s0, 8
                  c.srli       a0, 16
                  c.mv         s6, s5
                  xori         sp, ra, -1938
                  c.li         s3, 9
                  sltu         s6, s9, sp
                  xor          tp, a3, tp
                  c.xor        a0, s1
                  c.nop
                  slti         sp, a1, 426
                  or           t1, a5, t0
                  c.srli       a0, 16
                  c.xor        a0, s1
                  sra          a3, t2, s2
                  nop
                  and          s3, a6, s7
                  and          s3, a6, s7
                  srl          t4, s1, t1
                  c.lui        s10, 18
                  nop
                  mulh         s8, zero, tp
                  c.slli       tp, 29
                  andi         a4, a7, -1410
                  auipc        tp, 368653
                  remu         sp, s3, s7
                  srai         a4, ra, 3
                  c.lui        s10, 18
                  c.addi4spn   a0, sp, 368
                  remu         sp, s3, s7
                  c.sub        a0, a1
                  c.li         s3, 9
                  slli         t1, ra, 5
                  addi         s3, s2, -1824
                  c.nop
                  xor          tp, a3, tp
                  srl          t4, s1, t1
                  slli         t1, ra, 5
                  remu         sp, s3, s7
                  slti         sp, a1, 426
                  mulhu        a5, a3, t5
                  mulh         s8, zero, tp
                  slli         t1, ra, 5
                  c.slli       tp, 29
                  lui          a7, 1036702
                  sltiu        a6, ra, -900
                  sltu         s6, s9, sp
                  c.or         a2, s0
                  c.slli       tp, 29
                  add          s4, a1, t4
                  add          s4, a1, t4
                  c.mv         s6, s5
                  c.addi16sp   sp, 256
                  c.add        a2, t6
                  mulh         s8, zero, tp
                  nop
                  lui          a7, 1036702
                  srl          t4, s1, t1
                  nop
                  c.srai       s0, 8
                  sll          t2, gp, a3
                  c.lui        s10, 18
                  lui          a7, 1036702
                  lui          a7, 1036702
                  sll          t2, gp, a3
                  c.li         s3, 9
                  slli         t1, ra, 5
                  srli         s4, s3, 13
                  add          s4, a1, t4
                  c.lui        s10, 18
                  mulhu        a5, a3, t5
                  c.or         a2, s0
                  c.addi       s7, -1
                  srli         s4, s3, 13
                  slli         t1, ra, 5
                  mulhu        a5, a3, t5
                  remu         sp, s3, s7
                  mulhu        a5, a3, t5
                  mul          s7, t5, a5
                  xori         sp, ra, -1938
                  sltiu        a6, ra, -900
                  c.and        a0, s0
                  c.and        a0, s0
                  c.addi16sp   sp, 256
                  srai         a4, ra, 3
                  sll          t2, gp, a3
                  slt          s3, a6, a0
                  xori         sp, ra, -1938
                  c.li         s3, 9
                  c.add        a2, t6
                  c.andi       a3, 13
                  c.and        a0, s0
                  lui          a7, 1036702
                  mul          s7, t5, a5
                  c.srli       a0, 16
                  c.andi       a3, 13
                  auipc        tp, 368653
                  c.andi       a3, 13
                  c.nop
                  mulhsu       ra, t3, a0
                  c.nop
                  c.xor        a0, s1
                  add          s4, a1, t4
                  sub          sp, t0, a2
                  sll          t2, gp, a3
                  auipc        tp, 368653
                  slti         sp, a1, 426
                  remu         sp, s3, s7
                  sltu         s6, s9, sp
                  nop
                  c.mv         s6, s5
                  c.addi16sp   sp, 256
                  mulhsu       ra, t3, a0
                  ori          a6, t4, 27
                  c.li         s3, 9
                  c.andi       a3, 13
                  c.srli       a0, 16
                  nop
                  andi         a4, a7, -1410
                  sra          a3, t2, s2
                  remu         sp, s3, s7
                  mulhsu       ra, t3, a0
                  sltiu        a6, ra, -900
                  c.slli       tp, 29
                  sltiu        a6, ra, -900
                  sltiu        a6, ra, -900
                  c.li         s3, 9
                  sra          a3, t2, s2
                  mul          s7, t5, a5
                  ori          a6, t4, 27
                  lui          a7, 1036702
                  add          s4, a1, t4
                  xor          tp, a3, tp
                  and          s3, a6, s7
                  mulh         s8, zero, tp
                  srli         s4, s3, 13
                  slli         t1, ra, 5
                  sltiu        a6, ra, -900
                  sra          a3, t2, s2
                  c.and        a0, s0
                  srli         s4, s3, 13
                  c.or         a2, s0
                  c.li         s3, 9
                  c.addi16sp   sp, 256
                  addi         s3, s2, -1824
                  xori         sp, ra, -1938
                  slt          s3, a6, a0
                  c.or         a2, s0
                  c.addi16sp   sp, 256
                  mulhu        a5, a3, t5
                  addi         s3, s2, -1824
                  c.mv         s6, s5
                  c.srli       a0, 16
                  c.addi16sp   sp, 256
                  slti         sp, a1, 426
                  ori          a6, t4, 27
                  sll          t2, gp, a3
                  c.addi4spn   a0, sp, 368
                  c.xor        a0, s1
                  c.or         a2, s0
                  li           ra, 0x51efcea4 #start riscv_int_numeric_corner_stream_28
                  li           tp, 0x80000000
                  li           a5, 0x80000000
                  li           t6, 0xa15974b8
                  li           a2, 0x0
                  li           a6, 0xffffffff
                  li           sp, 0x0
                  li           a4, 0x0
                  li           t0, 0x4192f3d6
                  li           s8, 0x0
                  mulhu        t0, a6, s8
                  add          t0, a5, a5
                  lui          ra, 1036702
                  mulhu        t0, a6, s8
                  auipc        a2, 368653
                  rem          a5, a6, tp
                  nop
                  nop
                  remu         tp, t0, a6
                  mulh         a5, ra, a2
                  mulhsu       sp, a6, a4
                  remu         tp, t0, a6
                  remu         tp, t0, a6
                  div          a2, tp, a4
                  addi         tp, tp, -1824
                  addi         tp, tp, -1824
                  mulhsu       sp, a6, a4
                  mulhsu       sp, a6, a4
                  remu         tp, t0, a6
                  rem          a5, a6, tp #end riscv_int_numeric_corner_stream_28
                  ori          a6, t4, 27
                  sub          sp, t0, a2
                  c.add        a2, t6
                  lui          a7, 1036702
                  c.addi       s7, -1
                  sll          t2, gp, a3
                  srli         s4, s3, 13
                  c.addi       s7, -1
                  rem          t1, s7, s2
                  mulhsu       ra, t3, a0
                  mul          s7, t5, a5
                  mul          s7, t5, a5
                  c.li         s3, 9
                  divu         a7, s4, t2
                  srai         a4, ra, 3
                  c.li         s3, 9
                  c.nop
                  c.addi       s7, -1
                  c.srai       s0, 8
                  auipc        tp, 368653
                  ori          a6, t4, 27
                  xor          tp, a3, tp
                  remu         sp, s3, s7
                  c.lui        s10, 18
                  c.or         a2, s0
                  lui          a7, 1036702
                  sll          t2, gp, a3
                  c.addi4spn   a0, sp, 368
                  c.slli       tp, 29
                  sub          sp, t0, a2
                  sltu         s6, s9, sp
                  div          t3, sp, t0
                  c.sub        a0, a1
                  sltiu        a6, ra, -900
                  div          t3, sp, t0
                  slti         sp, a1, 426
                  c.or         a2, s0
                  divu         a7, s4, t2
                  c.slli       tp, 29
                  add          s4, a1, t4
                  mul          s7, t5, a5
                  sra          a3, t2, s2
                  divu         a7, s4, t2
                  sltu         s6, s9, sp
                  c.andi       a3, 13
                  mulhu        a5, a3, t5
                  c.lui        s10, 18
                  sra          a3, t2, s2
                  rem          t1, s7, s2
                  c.addi       s7, -1
                  nop
                  srli         s4, s3, 13
                  auipc        tp, 368653
                  sltiu        a6, ra, -900
                  c.sub        a0, a1
                  xori         sp, ra, -1938
                  c.xor        a0, s1
                  ori          a6, t4, 27
                  auipc        tp, 368653
                  xori         sp, ra, -1938
                  c.srli       a0, 16
                  divu         a7, s4, t2
                  c.lui        s10, 18
                  c.srai       s0, 8
                  lui          a7, 1036702
                  add          s4, a1, t4
                  remu         sp, s3, s7
                  rem          t1, s7, s2
                  xori         sp, ra, -1938
                  nop
                  c.andi       a3, 13
                  c.lui        s10, 18
                  addi         s3, s2, -1824
                  mulhsu       ra, t3, a0
                  c.or         a2, s0
                  sll          t2, gp, a3
                  sll          t2, gp, a3
                  sra          a3, t2, s2
                  sltiu        a6, ra, -900
                  xori         sp, ra, -1938
                  srli         s4, s3, 13
                  mulhsu       ra, t3, a0
                  xori         sp, ra, -1938
                  slli         t1, ra, 5
                  lui          a7, 1036702
                  sltiu        a6, ra, -900
                  c.sub        a0, a1
                  sltiu        a6, ra, -900
                  c.mv         s6, s5
                  xori         sp, ra, -1938
                  divu         a7, s4, t2
                  lui          a7, 1036702
                  srai         a4, ra, 3
                  c.addi       s7, -1
                  mul          s7, t5, a5
                  nop
                  div          t3, sp, t0
                  srai         a4, ra, 3
                  srli         s4, s3, 13
                  c.or         a2, s0
                  or           t1, a5, t0
                  srli         s4, s3, 13
                  c.and        a0, s0
                  andi         a4, a7, -1410
                  c.nop
                  c.or         a2, s0
                  c.xor        a0, s1
                  slti         sp, a1, 426
                  sra          a3, t2, s2
                  slti         sp, a1, 426
                  divu         a7, s4, t2
                  srl          t4, s1, t1
                  nop
                  add          s4, a1, t4
                  slli         t1, ra, 5
                  c.xor        a0, s1
                  c.lui        s10, 18
                  c.add        a2, t6
                  slt          s3, a6, a0
                  remu         sp, s3, s7
                  lui          a7, 1036702
                  sll          t2, gp, a3
                  ori          a6, t4, 27
                  c.slli       tp, 29
                  c.lui        s10, 18
                  xor          tp, a3, tp
                  c.add        a2, t6
                  lui          a7, 1036702
                  mulhu        a5, a3, t5
                  c.srli       a0, 16
                  c.lui        s10, 18
                  divu         a7, s4, t2
                  sub          sp, t0, a2
                  mulh         s8, zero, tp
                  sra          a3, t2, s2
                  lui          a7, 1036702
                  c.or         a2, s0
                  c.mv         s6, s5
                  slli         t1, ra, 5
                  xor          tp, a3, tp
                  div          t3, sp, t0
                  srai         a4, ra, 3
                  slt          s3, a6, a0
                  mul          s7, t5, a5
                  xori         sp, ra, -1938
                  mulhu        a5, a3, t5
                  auipc        tp, 368653
                  ori          a6, t4, 27
                  remu         sp, s3, s7
                  add          s4, a1, t4
                  c.addi4spn   a0, sp, 368
                  c.sub        a0, a1
                  nop
                  srli         s4, s3, 13
                  addi         s3, s2, -1824
                  c.andi       a3, 13
                  or           t1, a5, t0
                  c.and        a0, s0
                  c.and        a0, s0
                  slli         t1, ra, 5
                  c.and        a0, s0
                  mul          s7, t5, a5
                  xori         sp, ra, -1938
                  c.addi16sp   sp, 256
                  div          t3, sp, t0
                  rem          t1, s7, s2
                  sra          a3, t2, s2
                  xori         sp, ra, -1938
                  c.mv         s6, s5
                  xori         sp, ra, -1938
                  c.srli       a0, 16
                  mulh         s8, zero, tp
                  sub          sp, t0, a2
                  and          s3, a6, s7
                  sltiu        a6, ra, -900
                  srli         s4, s3, 13
                  and          s3, a6, s7
                  c.lui        s10, 18
                  c.xor        a0, s1
                  srl          t4, s1, t1
                  c.li         s3, 9
                  c.lui        s10, 18
                  c.slli       tp, 29
                  c.addi4spn   a0, sp, 368
                  c.addi16sp   sp, 256
                  slti         sp, a1, 426
                  c.slli       tp, 29
                  c.slli       tp, 29
                  sub          sp, t0, a2
                  remu         sp, s3, s7
                  rem          t1, s7, s2
                  nop
                  mulh         s8, zero, tp
                  slti         sp, a1, 426
                  sra          a3, t2, s2
                  c.srai       s0, 8
                  and          s3, a6, s7
                  mulh         s8, zero, tp
                  or           t1, a5, t0
                  sra          a3, t2, s2
                  add          s4, a1, t4
                  slt          s3, a6, a0
                  rem          t1, s7, s2
                  c.mv         s6, s5
                  srli         s4, s3, 13
                  lui          a7, 1036702
                  c.nop
                  ori          a6, t4, 27
                  auipc        tp, 368653
                  mulhu        a5, a3, t5
                  sub          sp, t0, a2
                  divu         a7, s4, t2
                  c.xor        a0, s1
                  ori          a6, t4, 27
                  divu         a7, s4, t2
                  slti         sp, a1, 426
                  nop
                  c.slli       tp, 29
                  srli         s4, s3, 13
                  sll          t2, gp, a3
                  remu         sp, s3, s7
                  and          s3, a6, s7
                  sltiu        a6, ra, -900
                  c.srai       s0, 8
                  andi         a4, a7, -1410
                  c.addi16sp   sp, 256
                  div          t3, sp, t0
                  sltiu        a6, ra, -900
                  slt          s3, a6, a0
                  xor          tp, a3, tp
                  slt          s3, a6, a0
                  c.li         s3, 9
                  c.or         a2, s0
                  nop
                  add          s4, a1, t4
                  slli         t1, ra, 5
                  sltu         s6, s9, sp
                  or           t1, a5, t0
                  sub          sp, t0, a2
                  c.andi       a3, 13
                  c.andi       a3, 13
                  sltu         s6, s9, sp
                  c.addi16sp   sp, 256
                  andi         a4, a7, -1410
                  c.srli       a0, 16
                  and          s3, a6, s7
                  auipc        tp, 368653
                  srl          t4, s1, t1
                  c.nop
                  c.li         s3, 9
                  c.addi       s7, -1
                  lui          a7, 1036702
                  rem          t1, s7, s2
                  c.li         s3, 9
                  c.addi4spn   a0, sp, 368
                  mulhu        a5, a3, t5
                  c.and        a0, s0
                  xor          tp, a3, tp
                  c.lui        s10, 18
                  slti         sp, a1, 426
                  andi         a4, a7, -1410
                  mulh         s8, zero, tp
                  xor          tp, a3, tp
                  mulhu        a5, a3, t5
                  c.srli       a0, 16
                  mul          s7, t5, a5
                  mulhu        a5, a3, t5
                  remu         sp, s3, s7
                  slt          s3, a6, a0
                  and          s3, a6, s7
                  srl          t4, s1, t1
                  c.srai       s0, 8
                  or           t1, a5, t0
                  rem          t1, s7, s2
                  auipc        tp, 368653
                  sltu         s6, s9, sp
                  c.addi       s7, -1
                  c.or         a2, s0
                  sltu         s6, s9, sp
                  add          s4, a1, t4
                  c.andi       a3, 13
                  mulhu        a5, a3, t5
                  rem          t1, s7, s2
                  c.srli       a0, 16
                  c.sub        a0, a1
                  mulh         s8, zero, tp
                  divu         a7, s4, t2
                  divu         a7, s4, t2
                  c.addi4spn   a0, sp, 368
                  mulh         s8, zero, tp
                  c.lui        s10, 18
                  mul          s7, t5, a5
                  c.srli       a0, 16
                  c.nop
                  andi         a4, a7, -1410
                  c.or         a2, s0
                  c.or         a2, s0
                  c.mv         s6, s5
                  mulh         s8, zero, tp
                  and          s3, a6, s7
                  andi         a4, a7, -1410
                  sltu         s6, s9, sp
                  c.andi       a3, 13
                  c.and        a0, s0
                  c.lui        s10, 18
                  c.xor        a0, s1
                  c.slli       tp, 29
                  divu         a7, s4, t2
                  c.xor        a0, s1
                  sra          a3, t2, s2
                  c.sub        a0, a1
                  slt          s3, a6, a0
                  c.xor        a0, s1
                  srl          t4, s1, t1
                  srli         s4, s3, 13
                  div          t3, sp, t0
                  auipc        tp, 368653
                  c.nop
                  c.xor        a0, s1
                  c.lui        s10, 18
                  c.and        a0, s0
                  rem          t1, s7, s2
                  srli         s4, s3, 13
                  c.add        a2, t6
                  sltu         s6, s9, sp
                  c.addi16sp   sp, 256
                  c.addi4spn   a0, sp, 368
                  nop
                  srli         s4, s3, 13
                  div          t3, sp, t0
                  c.li         s3, 9
                  c.and        a0, s0
                  c.srai       s0, 8
                  slti         sp, a1, 426
                  c.srli       a0, 16
                  sltiu        a6, ra, -900
                  c.addi16sp   sp, 256
                  srai         a4, ra, 3
                  or           t1, a5, t0
                  c.add        a2, t6
                  mulhu        a5, a3, t5
                  c.xor        a0, s1
                  sltu         s6, s9, sp
                  mulhu        a5, a3, t5
                  srai         a4, ra, 3
                  c.mv         s6, s5
                  or           t1, a5, t0
                  sll          t2, gp, a3
                  slt          s3, a6, a0
                  sll          t2, gp, a3
                  slti         sp, a1, 426
                  mulhu        a5, a3, t5
                  slt          s3, a6, a0
                  mulhsu       ra, t3, a0
                  c.addi       s7, -1
                  c.srli       a0, 16
                  ori          a6, t4, 27
                  slt          s3, a6, a0
                  c.and        a0, s0
                  c.or         a2, s0
                  lui          a7, 1036702
                  c.addi16sp   sp, 256
                  nop
                  andi         a4, a7, -1410
                  sltiu        a6, ra, -900
                  c.addi16sp   sp, 256
                  sra          a3, t2, s2
                  c.add        a2, t6
                  c.nop
                  c.xor        a0, s1
                  sll          t2, gp, a3
                  xori         sp, ra, -1938
                  srl          t4, s1, t1
                  c.srli       a0, 16
                  c.sub        a0, a1
                  mulhu        a5, a3, t5
                  sltu         s6, s9, sp
                  nop
                  slt          s3, a6, a0
                  rem          t1, s7, s2
                  sltu         s6, s9, sp
                  slt          s3, a6, a0
                  c.slli       tp, 29
                  addi         s3, s2, -1824
                  srl          t4, s1, t1
                  slti         sp, a1, 426
                  sltu         s6, s9, sp
                  addi         s3, s2, -1824
                  mulh         s8, zero, tp
                  c.sub        a0, a1
                  c.lui        s10, 18
                  or           t1, a5, t0
                  c.add        a2, t6
                  slt          s3, a6, a0
                  c.lui        s10, 18
                  nop
                  xor          tp, a3, tp
                  slli         t1, ra, 5
                  slli         t1, ra, 5
                  mul          s7, t5, a5
                  and          s3, a6, s7
                  mulh         s8, zero, tp
                  c.xor        a0, s1
                  c.addi       s7, -1
                  lui          a7, 1036702
                  auipc        tp, 368653
                  c.addi       s7, -1
                  c.srai       s0, 8
                  add          s4, a1, t4
                  c.lui        s10, 18
                  c.mv         s6, s5
                  mul          s7, t5, a5
                  sub          sp, t0, a2
                  or           t1, a5, t0
                  andi         a4, a7, -1410
                  or           t1, a5, t0
                  c.srli       a0, 16
                  rem          t1, s7, s2
                  c.add        a2, t6
                  c.addi       s7, -1
                  nop
                  sub          sp, t0, a2
                  mulh         s8, zero, tp
                  divu         a7, s4, t2
                  sll          t2, gp, a3
                  c.addi       s7, -1
                  c.lui        s10, 18
                  c.srli       a0, 16
                  sltu         s6, s9, sp
                  c.add        a2, t6
                  addi         s3, s2, -1824
                  nop
                  c.andi       a3, 13
                  sub          sp, t0, a2
                  c.nop
                  lui          a7, 1036702
                  c.addi       s7, -1
                  remu         sp, s3, s7
                  c.xor        a0, s1
                  ori          a6, t4, 27
                  mulhu        a5, a3, t5
                  c.addi       s7, -1
                  sub          sp, t0, a2
                  or           t1, a5, t0
                  lui          a7, 1036702
                  xori         sp, ra, -1938
                  c.srli       a0, 16
                  srl          t4, s1, t1
                  slti         sp, a1, 426
                  andi         a4, a7, -1410
                  xor          tp, a3, tp
                  c.sub        a0, a1
                  c.addi       s7, -1
                  srl          t4, s1, t1
                  c.srai       s0, 8
                  c.nop
                  c.or         a2, s0
                  slti         sp, a1, 426
                  sra          a3, t2, s2
                  c.and        a0, s0
                  c.slli       tp, 29
                  c.srai       s0, 8
                  sub          sp, t0, a2
                  srli         s4, s3, 13
                  c.add        a2, t6
                  c.li         s3, 9
                  sub          sp, t0, a2
                  ori          a6, t4, 27
                  c.and        a0, s0
                  or           t1, a5, t0
                  slt          s3, a6, a0
                  c.and        a0, s0
                  lui          a7, 1036702
                  c.lui        s10, 18
                  c.li         s3, 9
                  remu         sp, s3, s7
                  sra          a3, t2, s2
                  c.addi16sp   sp, 256
                  sra          a3, t2, s2
                  remu         sp, s3, s7
                  add          s4, a1, t4
                  ori          a6, t4, 27
                  c.or         a2, s0
                  c.addi       s7, -1
                  lui          a7, 1036702
                  c.andi       a3, 13
                  c.add        a2, t6
                  or           t1, a5, t0
                  sltiu        a6, ra, -900
                  c.mv         s6, s5
                  rem          t1, s7, s2
                  ori          a6, t4, 27
                  add          s4, a1, t4
                  c.addi       s7, -1
                  slt          s3, a6, a0
                  mulhsu       ra, t3, a0
                  c.srli       a0, 16
                  add          s4, a1, t4
                  srai         a4, ra, 3
                  srl          t4, s1, t1
                  nop
                  c.srli       a0, 16
                  srai         a4, ra, 3
                  c.addi16sp   sp, 256
                  ori          a6, t4, 27
                  xori         sp, ra, -1938
                  slti         sp, a1, 426
                  addi         s3, s2, -1824
                  c.li         s3, 9
                  c.mv         s6, s5
                  c.addi16sp   sp, 256
                  or           t1, a5, t0
                  divu         a7, s4, t2
                  sub          sp, t0, a2
                  c.li         s3, 9
                  xori         sp, ra, -1938
                  c.sub        a0, a1
                  mulhsu       ra, t3, a0
                  slt          s3, a6, a0
                  auipc        tp, 368653
                  c.li         s3, 9
                  sra          a3, t2, s2
                  ori          a6, t4, 27
                  sra          a3, t2, s2
                  c.lui        s10, 18
                  xor          tp, a3, tp
                  c.or         a2, s0
                  srli         s4, s3, 13
                  sltu         s6, s9, sp
                  rem          t1, s7, s2
                  slli         t1, ra, 5
                  c.mv         s6, s5
                  c.addi       s7, -1
                  c.li         s3, 9
                  slt          s3, a6, a0
                  sltiu        a6, ra, -900
                  c.sub        a0, a1
                  c.xor        a0, s1
                  c.slli       tp, 29
                  nop
                  sltiu        a6, ra, -900
                  xori         sp, ra, -1938
                  c.lui        s10, 18
                  c.sub        a0, a1
                  mul          s7, t5, a5
                  slt          s3, a6, a0
                  xori         sp, ra, -1938
                  c.addi       s7, -1
                  c.srai       s0, 8
                  or           t1, a5, t0
                  c.addi16sp   sp, 256
                  sub          sp, t0, a2
                  mulh         s8, zero, tp
                  addi         s3, s2, -1824
                  mulh         s8, zero, tp
                  c.srai       s0, 8
                  nop
                  c.addi       s7, -1
                  c.or         a2, s0
                  c.sub        a0, a1
                  sll          t2, gp, a3
                  c.slli       tp, 29
                  addi         s3, s2, -1824
                  c.or         a2, s0
                  addi         s3, s2, -1824
                  c.andi       a3, 13
                  rem          t1, s7, s2
                  sll          t2, gp, a3
                  srai         a4, ra, 3
                  sra          a3, t2, s2
                  c.addi16sp   sp, 256
                  sra          a3, t2, s2
                  c.li         s3, 9
                  c.nop
                  auipc        tp, 368653
                  srl          t4, s1, t1
                  ori          a6, t4, 27
                  ori          a6, t4, 27
                  sll          t2, gp, a3
                  nop
                  c.srai       s0, 8
                  c.addi4spn   a0, sp, 368
                  c.srli       a0, 16
                  c.slli       tp, 29
                  c.addi       s7, -1
                  c.andi       a3, 13
                  auipc        tp, 368653
                  and          s3, a6, s7
                  lui          a7, 1036702
                  c.srli       a0, 16
                  srai         a4, ra, 3
                  srli         s4, s3, 13
                  c.xor        a0, s1
                  sll          t2, gp, a3
                  auipc        tp, 368653
                  c.addi16sp   sp, 256
                  c.and        a0, s0
                  c.addi       s7, -1
                  sltiu        a6, ra, -900
                  c.addi       s7, -1
                  c.and        a0, s0
                  sltu         s6, s9, sp
                  div          t3, sp, t0
                  sltu         s6, s9, sp
                  c.and        a0, s0
                  srl          t4, s1, t1
                  slt          s3, a6, a0
                  slt          s3, a6, a0
                  mulhsu       ra, t3, a0
                  or           t1, a5, t0
                  c.li         s3, 9
                  c.mv         s6, s5
                  sll          t2, gp, a3
                  slli         t1, ra, 5
                  srli         s4, s3, 13
                  c.or         a2, s0
                  c.sub        a0, a1
                  slti         sp, a1, 426
                  nop
                  nop
                  c.nop
                  srli         s4, s3, 13
                  nop
                  slti         sp, a1, 426
                  mul          s7, t5, a5
                  mulh         s8, zero, tp
                  srli         s4, s3, 13
                  sltu         s6, s9, sp
                  c.nop
                  c.xor        a0, s1
                  c.slli       tp, 29
                  c.srli       a0, 16
                  mul          s7, t5, a5
                  andi         a4, a7, -1410
                  addi         s3, s2, -1824
                  div          t3, sp, t0
                  sll          t2, gp, a3
                  c.srai       s0, 8
                  c.srai       s0, 8
                  mul          s7, t5, a5
                  c.srai       s0, 8
                  c.lui        s10, 18
                  srli         s4, s3, 13
                  ori          a6, t4, 27
                  auipc        tp, 368653
                  remu         sp, s3, s7
                  sra          a3, t2, s2
                  sltiu        a6, ra, -900
                  c.mv         s6, s5
                  c.srai       s0, 8
                  c.sub        a0, a1
                  c.srai       s0, 8
                  div          t3, sp, t0
                  c.srai       s0, 8
                  xor          tp, a3, tp
                  srai         a4, ra, 3
                  c.slli       tp, 29
                  srli         s4, s3, 13
                  srl          t4, s1, t1
                  sub          sp, t0, a2
                  or           t1, a5, t0
                  srl          t4, s1, t1
                  ori          a6, t4, 27
                  c.sub        a0, a1
                  sub          sp, t0, a2
                  c.addi16sp   sp, 256
                  c.mv         s6, s5
                  xori         sp, ra, -1938
                  c.and        a0, s0
                  andi         a4, a7, -1410
                  lui          a7, 1036702
                  sub          sp, t0, a2
                  c.sub        a0, a1
                  xor          tp, a3, tp
                  srl          t4, s1, t1
                  rem          t1, s7, s2
                  srli         s4, s3, 13
                  c.lui        s10, 18
                  div          t3, sp, t0
                  slti         sp, a1, 426
                  sub          sp, t0, a2
                  slli         t1, ra, 5
                  srli         s4, s3, 13
                  c.mv         s6, s5
                  xori         sp, ra, -1938
                  c.li         s3, 9
                  mul          s7, t5, a5
                  nop
                  srai         a4, ra, 3
                  sub          sp, t0, a2
                  sub          sp, t0, a2
                  c.and        a0, s0
                  sra          a3, t2, s2
                  c.xor        a0, s1
                  sub          sp, t0, a2
                  lui          a7, 1036702
                  sra          a3, t2, s2
                  and          s3, a6, s7
                  c.and        a0, s0
                  srai         a4, ra, 3
                  sra          a3, t2, s2
                  sub          sp, t0, a2
                  slti         sp, a1, 426
                  addi         s3, s2, -1824
                  div          t3, sp, t0
                  c.lui        s10, 18
                  auipc        tp, 368653
                  add          s4, a1, t4
                  srli         s4, s3, 13
                  sll          t2, gp, a3
                  slti         sp, a1, 426
                  slt          s3, a6, a0
                  c.and        a0, s0
                  auipc        tp, 368653
                  sltu         s6, s9, sp
                  xor          tp, a3, tp
                  c.nop
                  slti         sp, a1, 426
                  andi         a4, a7, -1410
                  mulhu        a5, a3, t5
                  sra          a3, t2, s2
                  mulh         s8, zero, tp
                  srl          t4, s1, t1
                  c.addi       s7, -1
                  srl          t4, s1, t1
                  and          s3, a6, s7
                  ori          a6, t4, 27
                  xori         sp, ra, -1938
                  sltu         s6, s9, sp
                  srai         a4, ra, 3
                  sra          a3, t2, s2
                  mulhsu       ra, t3, a0
                  c.slli       tp, 29
                  c.slli       tp, 29
                  or           t1, a5, t0
                  c.sub        a0, a1
                  slti         sp, a1, 426
                  c.srai       s0, 8
                  c.mv         s6, s5
                  addi         s3, s2, -1824
                  lui          a7, 1036702
                  c.srli       a0, 16
                  divu         a7, s4, t2
                  addi         s3, s2, -1824
                  slti         sp, a1, 426
                  sltu         s6, s9, sp
                  mulh         s8, zero, tp
                  mul          s7, t5, a5
                  srli         s4, s3, 13
                  srli         s4, s3, 13
                  sltu         s6, s9, sp
                  mul          s7, t5, a5
                  c.srli       a0, 16
                  xori         sp, ra, -1938
                  srai         a4, ra, 3
                  c.mv         s6, s5
                  srai         a4, ra, 3
                  c.addi16sp   sp, 256
                  c.lui        s10, 18
                  slti         sp, a1, 426
                  auipc        tp, 368653
                  sltu         s6, s9, sp
                  c.lui        s10, 18
                  mulh         s8, zero, tp
                  c.li         s3, 9
                  c.addi4spn   a0, sp, 368
                  sra          a3, t2, s2
                  nop
                  lui          a7, 1036702
                  or           t1, a5, t0
                  mulhu        a5, a3, t5
                  div          t3, sp, t0
                  c.li         s3, 9
                  ori          a6, t4, 27
                  mulhu        a5, a3, t5
                  xori         sp, ra, -1938
                  c.sub        a0, a1
                  c.sub        a0, a1
                  and          s3, a6, s7
                  and          s3, a6, s7
                  nop
                  slli         t1, ra, 5
                  add          s4, a1, t4
                  c.lui        s10, 18
                  sub          sp, t0, a2
                  c.andi       a3, 13
                  nop
                  c.addi4spn   a0, sp, 368
                  c.li         s3, 9
                  auipc        tp, 368653
                  c.lui        s10, 18
                  slt          s3, a6, a0
                  slt          s3, a6, a0
                  sub          sp, t0, a2
                  mulhu        a5, a3, t5
                  xori         sp, ra, -1938
                  srli         s4, s3, 13
                  c.add        a2, t6
                  slt          s3, a6, a0
                  or           t1, a5, t0
                  srai         a4, ra, 3
                  c.and        a0, s0
                  c.xor        a0, s1
                  c.nop
                  c.srli       a0, 16
                  div          t3, sp, t0
                  mulhsu       ra, t3, a0
                  auipc        tp, 368653
                  c.nop
                  add          s4, a1, t4
                  addi         s3, s2, -1824
                  ori          a6, t4, 27
                  and          s3, a6, s7
                  lui          a7, 1036702
                  slt          s3, a6, a0
                  srai         a4, ra, 3
                  remu         sp, s3, s7
                  mulhsu       ra, t3, a0
                  srli         s4, s3, 13
                  nop
                  mul          s7, t5, a5
                  nop
                  c.add        a2, t6
                  sra          a3, t2, s2
                  addi         s3, s2, -1824
                  xori         sp, ra, -1938
                  or           t1, a5, t0
                  c.srli       a0, 16
                  c.xor        a0, s1
                  auipc        tp, 368653
                  srli         s4, s3, 13
                  srai         a4, ra, 3
                  ori          a6, t4, 27
                  slt          s3, a6, a0
                  c.addi       s7, -1
                  or           t1, a5, t0
                  sll          t2, gp, a3
                  srai         a4, ra, 3
                  nop
                  or           t1, a5, t0
                  c.addi4spn   a0, sp, 368
                  c.andi       a3, 13
                  c.addi16sp   sp, 256
                  sub          sp, t0, a2
                  sub          sp, t0, a2
                  div          t3, sp, t0
                  addi         s3, s2, -1824
                  c.nop
                  nop
                  slt          s3, a6, a0
                  andi         a4, a7, -1410
                  c.addi       s7, -1
                  c.xor        a0, s1
                  c.add        a2, t6
                  and          s3, a6, s7
                  c.nop
                  c.nop
                  sra          a3, t2, s2
                  c.slli       tp, 29
                  c.li         s3, 9
                  slt          s3, a6, a0
                  sub          sp, t0, a2
                  c.xor        a0, s1
                  srli         s4, s3, 13
                  srli         s4, s3, 13
                  c.slli       tp, 29
                  xor          tp, a3, tp
                  ori          a6, t4, 27
                  or           t1, a5, t0
                  c.srli       a0, 16
                  c.srai       s0, 8
                  c.or         a2, s0
                  mul          s7, t5, a5
                  c.add        a2, t6
                  c.sub        a0, a1
                  rem          t1, s7, s2
                  remu         sp, s3, s7
                  andi         a4, a7, -1410
                  c.addi       s7, -1
                  sltu         s6, s9, sp
                  slt          s3, a6, a0
                  c.addi4spn   a0, sp, 368
                  c.addi       s7, -1
                  nop
                  c.or         a2, s0
                  c.srai       s0, 8
                  c.or         a2, s0
                  sltu         s6, s9, sp
                  addi         s3, s2, -1824
                  srli         s4, s3, 13
                  c.xor        a0, s1
                  div          t3, sp, t0
                  divu         a7, s4, t2
                  slti         sp, a1, 426
                  c.srai       s0, 8
                  mul          s7, t5, a5
                  divu         a7, s4, t2
                  lui          a7, 1036702
                  mulhsu       ra, t3, a0
                  c.add        a2, t6
                  mulh         s8, zero, tp
                  c.andi       a3, 13
                  c.sub        a0, a1
                  c.mv         s6, s5
                  mulhu        a5, a3, t5
                  ori          a6, t4, 27
                  mulhu        a5, a3, t5
                  auipc        tp, 368653
                  sra          a3, t2, s2
                  divu         a7, s4, t2
                  srai         a4, ra, 3
                  sll          t2, gp, a3
                  c.andi       a3, 13
                  srl          t4, s1, t1
                  c.add        a2, t6
                  slt          s3, a6, a0
                  srl          t4, s1, t1
                  sra          a3, t2, s2
                  rem          t1, s7, s2
                  auipc        tp, 368653
                  c.slli       tp, 29
                  slti         sp, a1, 426
                  c.nop
                  c.lui        s10, 18
                  sub          sp, t0, a2
                  c.andi       a3, 13
                  c.addi       s7, -1
                  srai         a4, ra, 3
                  c.srli       a0, 16
                  li           a5, 0xffffffff #start riscv_int_numeric_corner_stream_18
                  li           a3, 0x6db79769
                  li           a0, 0xffffffff
                  li           s4, 0x80000000
                  li           t4, 0xb7ca1ceb
                  li           ra, 0x0
                  li           s1, 0x53ec728d
                  li           t2, 0x0
                  li           tp, 0xe61729e4
                  li           a2, 0xffffffff
                  mulhu        s1, a5, s4
                  mulhu        s1, a5, s4
                  nop
                  mulhu        s1, a5, s4
                  auipc        a0, 368653
                  add          s1, a3, a3
                  div          a0, t2, a2
                  divu         ra, a0, a5
                  addi         t2, t2, -1824
                  mulh         a3, ra, a0
                  lui          ra, 1036702
                  mulhu        s1, a5, s4
                  lui          ra, 1036702
                  mul          a2, a2, a5
                  mulhsu       tp, a5, a2
                  remu         t2, s1, a5
                  mulh         a3, ra, a0
                  addi         t2, t2, -1824
                  mulh         a3, ra, a0
                  rem          a3, a5, t2
                  mul          a2, a2, a5
                  div          a0, t2, a2
                  div          a0, t2, a2
                  mulh         a3, ra, a0
                  mulhu        s1, a5, s4
                  remu         t2, s1, a5
                  remu         t2, s1, a5
                  mulhsu       tp, a5, a2 #end riscv_int_numeric_corner_stream_18
                  sltu         s6, s9, sp
                  sll          t2, gp, a3
                  lui          a7, 1036702
                  sltu         s6, s9, sp
                  mulhsu       ra, t3, a0
                  auipc        tp, 368653
                  xori         sp, ra, -1938
                  c.andi       a3, 13
                  c.nop
                  mulh         s8, zero, tp
                  sltiu        a6, ra, -900
                  auipc        tp, 368653
                  c.addi16sp   sp, 256
                  sltiu        a6, ra, -900
                  addi         s3, s2, -1824
                  c.slli       tp, 29
                  c.sub        a0, a1
                  nop
                  c.or         a2, s0
                  xori         sp, ra, -1938
                  c.mv         s6, s5
                  c.addi       s7, -1
                  c.nop
                  srai         a4, ra, 3
                  c.li         s3, 9
                  or           t1, a5, t0
                  rem          t1, s7, s2
                  addi         s3, s2, -1824
                  sltiu        a6, ra, -900
                  c.lui        s10, 18
                  c.addi4spn   a0, sp, 368
                  slti         sp, a1, 426
                  srli         s4, s3, 13
                  c.mv         s6, s5
                  c.nop
                  div          t3, sp, t0
                  srai         a4, ra, 3
                  slt          s3, a6, a0
                  c.addi       s7, -1
                  srli         s4, s3, 13
                  divu         a7, s4, t2
                  slli         t1, ra, 5
                  srli         s4, s3, 13
                  srli         s4, s3, 13
                  srl          t4, s1, t1
                  xori         sp, ra, -1938
                  c.sub        a0, a1
                  lui          a7, 1036702
                  c.addi       s7, -1
                  mul          s7, t5, a5
                  c.sub        a0, a1
                  c.add        a2, t6
                  c.or         a2, s0
                  c.addi       s7, -1
                  slti         sp, a1, 426
                  srli         s4, s3, 13
                  mulhsu       ra, t3, a0
                  xori         sp, ra, -1938
                  xori         sp, ra, -1938
                  c.li         s3, 9
                  srai         a4, ra, 3
                  xor          tp, a3, tp
                  slt          s3, a6, a0
                  ori          a6, t4, 27
                  c.addi       s7, -1
                  c.xor        a0, s1
                  add          s4, a1, t4
                  xor          tp, a3, tp
                  slt          s3, a6, a0
                  c.and        a0, s0
                  c.andi       a3, 13
                  add          s4, a1, t4
                  auipc        tp, 368653
                  divu         a7, s4, t2
                  slli         t1, ra, 5
                  srl          t4, s1, t1
                  rem          t1, s7, s2
                  mulhsu       ra, t3, a0
                  nop
                  xori         sp, ra, -1938
                  mulhu        a5, a3, t5
                  c.addi       s7, -1
                  or           t1, a5, t0
                  auipc        tp, 368653
                  sltiu        a6, ra, -900
                  lui          a7, 1036702
                  xor          tp, a3, tp
                  c.li         s3, 9
                  lui          a7, 1036702
                  c.srli       a0, 16
                  rem          t1, s7, s2
                  srai         a4, ra, 3
                  sub          sp, t0, a2
                  lui          a7, 1036702
                  and          s3, a6, s7
                  c.nop
                  sll          t2, gp, a3
                  c.addi       s7, -1
                  c.srai       s0, 8
                  nop
                  srai         a4, ra, 3
                  c.srli       a0, 16
                  c.and        a0, s0
                  c.slli       tp, 29
                  c.srai       s0, 8
                  c.addi16sp   sp, 256
                  ori          a6, t4, 27
                  slli         t1, ra, 5
                  xori         sp, ra, -1938
                  sra          a3, t2, s2
                  c.lui        s10, 18
                  remu         sp, s3, s7
                  mul          s7, t5, a5
                  lui          a7, 1036702
                  lui          a7, 1036702
                  xori         sp, ra, -1938
                  add          s4, a1, t4
                  mulh         s8, zero, tp
                  or           t1, a5, t0
                  auipc        tp, 368653
                  auipc        tp, 368653
                  srli         s4, s3, 13
                  slt          s3, a6, a0
                  div          t3, sp, t0
                  lui          a7, 1036702
                  slt          s3, a6, a0
                  c.andi       a3, 13
                  slli         t1, ra, 5
                  or           t1, a5, t0
                  mulh         s8, zero, tp
                  sub          sp, t0, a2
                  and          s3, a6, s7
                  sra          a3, t2, s2
                  divu         a7, s4, t2
                  mulhu        a5, a3, t5
                  mulhu        a5, a3, t5
                  slti         sp, a1, 426
                  srli         s4, s3, 13
                  rem          t1, s7, s2
                  slli         t1, ra, 5
                  mulhu        a5, a3, t5
                  c.slli       tp, 29
                  c.li         s3, 9
                  div          t3, sp, t0
                  mul          s7, t5, a5
                  sltiu        a6, ra, -900
                  sltiu        a6, ra, -900
                  srl          t4, s1, t1
                  srli         s4, s3, 13
                  sltu         s6, s9, sp
                  c.xor        a0, s1
                  andi         a4, a7, -1410
                  srl          t4, s1, t1
                  mulh         s8, zero, tp
                  lui          a7, 1036702
                  c.nop
                  addi         s3, s2, -1824
                  mulhu        a5, a3, t5
                  srli         s4, s3, 13
                  c.lui        s10, 18
                  mulhsu       ra, t3, a0
                  sub          sp, t0, a2
                  slti         sp, a1, 426
                  slli         t1, ra, 5
                  mul          s7, t5, a5
                  c.srli       a0, 16
                  c.slli       tp, 29
                  ori          a6, t4, 27
                  srli         s4, s3, 13
                  xori         sp, ra, -1938
                  sra          a3, t2, s2
                  srli         s4, s3, 13
                  c.addi4spn   a0, sp, 368
                  nop
                  c.nop
                  c.mv         s6, s5
                  sub          sp, t0, a2
                  add          s4, a1, t4
                  rem          t1, s7, s2
                  xori         sp, ra, -1938
                  c.addi16sp   sp, 256
                  c.and        a0, s0
                  c.srai       s0, 8
                  c.addi4spn   a0, sp, 368
                  remu         sp, s3, s7
                  xori         sp, ra, -1938
                  c.add        a2, t6
                  c.andi       a3, 13
                  mul          s7, t5, a5
                  c.addi4spn   a0, sp, 368
                  c.li         s3, 9
                  c.srai       s0, 8
                  c.srli       a0, 16
                  or           t1, a5, t0
                  add          s4, a1, t4
                  div          t3, sp, t0
                  c.addi4spn   a0, sp, 368
                  auipc        tp, 368653
                  c.mv         s6, s5
                  c.add        a2, t6
                  c.srai       s0, 8
                  srai         a4, ra, 3
                  slti         sp, a1, 426
                  nop
                  remu         sp, s3, s7
                  c.srai       s0, 8
                  slli         t1, ra, 5
                  auipc        tp, 368653
                  mulhsu       ra, t3, a0
                  mul          s7, t5, a5
                  xori         sp, ra, -1938
                  c.sub        a0, a1
                  c.or         a2, s0
                  srli         s4, s3, 13
                  srl          t4, s1, t1
                  sltiu        a6, ra, -900
                  c.addi16sp   sp, 256
                  slli         t1, ra, 5
                  c.sub        a0, a1
                  c.addi4spn   a0, sp, 368
                  or           t1, a5, t0
                  slli         t1, ra, 5
                  sll          t2, gp, a3
                  c.and        a0, s0
                  c.andi       a3, 13
                  c.slli       tp, 29
                  remu         sp, s3, s7
                  addi         s3, s2, -1824
                  c.lui        s10, 18
                  c.addi       s7, -1
                  c.slli       tp, 29
                  nop
                  mulhsu       ra, t3, a0
                  c.srli       a0, 16
                  c.addi16sp   sp, 256
                  xori         sp, ra, -1938
                  rem          t1, s7, s2
                  c.srai       s0, 8
                  rem          t1, s7, s2
                  sltiu        a6, ra, -900
                  c.nop
                  c.and        a0, s0
                  c.addi4spn   a0, sp, 368
                  add          s4, a1, t4
                  c.addi16sp   sp, 256
                  c.addi16sp   sp, 256
                  slli         t1, ra, 5
                  mul          s7, t5, a5
                  sra          a3, t2, s2
                  c.addi16sp   sp, 256
                  c.andi       a3, 13
                  c.addi16sp   sp, 256
                  c.xor        a0, s1
                  c.li         s3, 9
                  c.addi       s7, -1
                  c.srli       a0, 16
                  c.or         a2, s0
                  auipc        tp, 368653
                  addi         s3, s2, -1824
                  c.mv         s6, s5
                  sub          sp, t0, a2
                  sll          t2, gp, a3
                  andi         a4, a7, -1410
                  c.addi16sp   sp, 256
                  nop
                  andi         a4, a7, -1410
                  nop
                  c.addi       s7, -1
                  c.sub        a0, a1
                  xor          tp, a3, tp
                  c.xor        a0, s1
                  mulh         s8, zero, tp
                  c.srli       a0, 16
                  auipc        tp, 368653
                  divu         a7, s4, t2
                  srl          t4, s1, t1
                  ori          a6, t4, 27
                  sll          t2, gp, a3
                  c.srli       a0, 16
                  sltiu        a6, ra, -900
                  srli         s4, s3, 13
                  auipc        tp, 368653
                  slti         sp, a1, 426
                  c.sub        a0, a1
                  srli         s4, s3, 13
                  c.and        a0, s0
                  nop
                  slti         sp, a1, 426
                  mul          s7, t5, a5
                  mul          s7, t5, a5
                  sltu         s6, s9, sp
                  c.srli       a0, 16
                  nop
                  c.slli       tp, 29
                  and          s3, a6, s7
                  srli         s4, s3, 13
                  rem          t1, s7, s2
                  auipc        tp, 368653
                  sra          a3, t2, s2
                  c.sub        a0, a1
                  c.li         s3, 9
                  slli         t1, ra, 5
                  c.xor        a0, s1
                  mulhsu       ra, t3, a0
                  auipc        tp, 368653
                  c.addi4spn   a0, sp, 368
                  c.addi4spn   a0, sp, 368
                  sra          a3, t2, s2
                  c.slli       tp, 29
                  c.addi       s7, -1
                  c.slli       tp, 29
                  c.mv         s6, s5
                  c.mv         s6, s5
                  add          s4, a1, t4
                  c.srli       a0, 16
                  xor          tp, a3, tp
                  srl          t4, s1, t1
                  srl          t4, s1, t1
                  c.addi16sp   sp, 256
                  slli         t1, ra, 5
                  div          t3, sp, t0
                  or           t1, a5, t0
                  srai         a4, ra, 3
                  c.mv         s6, s5
                  mul          s7, t5, a5
                  sltiu        a6, ra, -900
                  slti         sp, a1, 426
                  c.or         a2, s0
                  xori         sp, ra, -1938
                  c.andi       a3, 13
                  c.mv         s6, s5
                  srli         s4, s3, 13
                  c.mv         s6, s5
                  c.lui        s10, 18
                  c.andi       a3, 13
                  sra          a3, t2, s2
                  addi         s3, s2, -1824
                  c.li         s3, 9
                  c.addi4spn   a0, sp, 368
                  add          s4, a1, t4
                  c.xor        a0, s1
                  c.lui        s10, 18
                  sltiu        a6, ra, -900
                  slt          s3, a6, a0
                  sra          a3, t2, s2
                  mulhsu       ra, t3, a0
                  srl          t4, s1, t1
                  sll          t2, gp, a3
                  c.lui        s10, 18
                  xori         sp, ra, -1938
                  auipc        tp, 368653
                  mulh         s8, zero, tp
                  c.nop
                  c.slli       tp, 29
                  remu         sp, s3, s7
                  sll          t2, gp, a3
                  srl          t4, s1, t1
                  c.addi4spn   a0, sp, 368
                  mulh         s8, zero, tp
                  c.and        a0, s0
                  srli         s4, s3, 13
                  srli         s4, s3, 13
                  c.sub        a0, a1
                  ori          a6, t4, 27
                  or           t1, a5, t0
                  nop
                  lui          a7, 1036702
                  xori         sp, ra, -1938
                  add          s4, a1, t4
                  c.addi       s7, -1
                  c.addi16sp   sp, 256
                  c.add        a2, t6
                  srl          t4, s1, t1
                  nop
                  slt          s3, a6, a0
                  and          s3, a6, s7
                  sub          sp, t0, a2
                  rem          t1, s7, s2
                  c.addi4spn   a0, sp, 368
                  srai         a4, ra, 3
                  srai         a4, ra, 3
                  mulhsu       ra, t3, a0
                  sub          sp, t0, a2
                  c.srai       s0, 8
                  sra          a3, t2, s2
                  sll          t2, gp, a3
                  andi         a4, a7, -1410
                  xori         sp, ra, -1938
                  addi         s3, s2, -1824
                  nop
                  c.andi       a3, 13
                  c.or         a2, s0
                  slli         t1, ra, 5
                  srli         s4, s3, 13
                  c.mv         s6, s5
                  nop
                  c.slli       tp, 29
                  mul          s7, t5, a5
                  slli         t1, ra, 5
                  c.lui        s10, 18
                  xor          tp, a3, tp
                  and          s3, a6, s7
                  c.slli       tp, 29
                  c.add        a2, t6
                  div          t3, sp, t0
                  xori         sp, ra, -1938
                  xor          tp, a3, tp
                  c.addi       s7, -1
                  lui          a7, 1036702
                  c.nop
                  andi         a4, a7, -1410
                  c.slli       tp, 29
                  srli         s4, s3, 13
                  c.slli       tp, 29
                  or           t1, a5, t0
                  c.nop
                  srl          t4, s1, t1
                  srli         s4, s3, 13
                  mulh         s8, zero, tp
                  c.xor        a0, s1
                  c.and        a0, s0
                  c.slli       tp, 29
                  c.addi16sp   sp, 256
                  slli         t1, ra, 5
                  c.addi4spn   a0, sp, 368
                  c.mv         s6, s5
                  sltu         s6, s9, sp
                  sll          t2, gp, a3
                  div          t3, sp, t0
                  c.li         s3, 9
                  sra          a3, t2, s2
                  slti         sp, a1, 426
                  slt          s3, a6, a0
                  c.or         a2, s0
                  c.addi16sp   sp, 256
                  sra          a3, t2, s2
                  srli         s4, s3, 13
                  addi         s3, s2, -1824
                  c.add        a2, t6
                  li           s6, 0xffffffff #start riscv_int_numeric_corner_stream_12
                  li           s8, 0xe554a31a
                  li           t3, 0xffffffff
                  li           gp, 0x80000000
                  li           s9, 0x80000000
                  li           a4, 0xffffffff
                  li           s0, 0xffffffff
                  li           t0, 0x0
                  li           s11, 0x80000000
                  li           s3, 0x0
                  divu         gp, s3, s9
                  mulhu        a4, s9, s11
                  nop
                  mulhu        a4, s9, s11
                  mulhsu       t0, s9, s6
                  mul          s6, s6, s9
                  nop
                  addi         s0, s0, -1824
                  div          s3, s0, s6
                  sub          s0, s6, s8
                  addi         s0, s0, -1824
                  rem          s8, s9, s0
                  mulhu        a4, s9, s11
                  divu         gp, s3, s9
                  rem          s8, s9, s0
                  lui          gp, 1036702
                  mulhsu       t0, s9, s6
                  div          s3, s0, s6
                  remu         s0, a4, s9
                  remu         s0, a4, s9
                  mulhu        a4, s9, s11
                  mulhsu       t0, s9, s6 #end riscv_int_numeric_corner_stream_12
                  slt          s3, a6, a0
                  rem          t1, s7, s2
                  xor          tp, a3, tp
                  c.addi       s7, -1
                  c.srai       s0, 8
                  lui          a7, 1036702
                  sltu         s6, s9, sp
                  mulhsu       ra, t3, a0
                  mulhsu       ra, t3, a0
                  sltiu        a6, ra, -900
                  mulhsu       ra, t3, a0
                  c.srai       s0, 8
                  slti         sp, a1, 426
                  div          t3, sp, t0
                  mul          s7, t5, a5
                  sra          a3, t2, s2
                  c.srai       s0, 8
                  sll          t2, gp, a3
                  srai         a4, ra, 3
                  sltiu        a6, ra, -900
                  xori         sp, ra, -1938
                  mulhu        a5, a3, t5
                  srl          t4, s1, t1
                  c.addi16sp   sp, 256
                  add          s4, a1, t4
                  sub          sp, t0, a2
                  lui          a7, 1036702
                  lui          a7, 1036702
                  sltu         s6, s9, sp
                  c.mv         s6, s5
                  auipc        tp, 368653
                  auipc        tp, 368653
                  c.addi       s7, -1
                  srl          t4, s1, t1
                  and          s3, a6, s7
                  mulhu        a5, a3, t5
                  xori         sp, ra, -1938
                  addi         s3, s2, -1824
                  sra          a3, t2, s2
                  c.mv         s6, s5
                  mulhu        a5, a3, t5
                  or           t1, a5, t0
                  srai         a4, ra, 3
                  srl          t4, s1, t1
                  ori          a6, t4, 27
                  sltiu        a6, ra, -900
                  c.li         s3, 9
                  c.nop
                  remu         sp, s3, s7
                  sll          t2, gp, a3
                  c.nop
                  srl          t4, s1, t1
                  xori         sp, ra, -1938
                  div          t3, sp, t0
                  c.addi16sp   sp, 256
                  c.sub        a0, a1
                  slt          s3, a6, a0
                  c.li         s3, 9
                  c.slli       tp, 29
                  add          s4, a1, t4
                  add          s4, a1, t4
                  sltiu        a6, ra, -900
                  c.sub        a0, a1
                  c.slli       tp, 29
                  c.addi       s7, -1
                  c.mv         s6, s5
                  c.and        a0, s0
                  div          t3, sp, t0
                  srl          t4, s1, t1
                  mulh         s8, zero, tp
                  c.nop
                  c.addi4spn   a0, sp, 368
                  remu         sp, s3, s7
                  c.lui        s10, 18
                  c.mv         s6, s5
                  lui          a7, 1036702
                  c.xor        a0, s1
                  c.xor        a0, s1
                  mulh         s8, zero, tp
                  auipc        tp, 368653
                  c.addi4spn   a0, sp, 368
                  mulh         s8, zero, tp
                  sra          a3, t2, s2
                  slti         sp, a1, 426
                  mulhsu       ra, t3, a0
                  xori         sp, ra, -1938
                  mul          s7, t5, a5
                  srai         a4, ra, 3
                  c.nop
                  c.sub        a0, a1
                  c.li         s3, 9
                  c.sub        a0, a1
                  andi         a4, a7, -1410
                  addi         s3, s2, -1824
                  c.or         a2, s0
                  rem          t1, s7, s2
                  c.and        a0, s0
                  srai         a4, ra, 3
                  xor          tp, a3, tp
                  div          t3, sp, t0
                  c.andi       a3, 13
                  slt          s3, a6, a0
                  srai         a4, ra, 3
                  slt          s3, a6, a0
                  and          s3, a6, s7
                  slli         t1, ra, 5
                  lui          a7, 1036702
                  c.andi       a3, 13
                  c.srai       s0, 8
                  c.xor        a0, s1
                  c.srli       a0, 16
                  c.srli       a0, 16
                  c.addi       s7, -1
                  c.srai       s0, 8
                  remu         sp, s3, s7
                  c.mv         s6, s5
                  mul          s7, t5, a5
                  c.addi16sp   sp, 256
                  srl          t4, s1, t1
                  lui          a7, 1036702
                  c.addi       s7, -1
                  c.xor        a0, s1
                  xor          tp, a3, tp
                  c.xor        a0, s1
                  addi         s3, s2, -1824
                  c.mv         s6, s5
                  sra          a3, t2, s2
                  srli         s4, s3, 13
                  c.srli       a0, 16
                  mulhu        a5, a3, t5
                  slt          s3, a6, a0
                  c.andi       a3, 13
                  mul          s7, t5, a5
                  slti         sp, a1, 426
                  slti         sp, a1, 426
                  c.add        a2, t6
                  sra          a3, t2, s2
                  rem          t1, s7, s2
                  nop
                  lui          a7, 1036702
                  rem          t1, s7, s2
                  ori          a6, t4, 27
                  c.li         s3, 9
                  and          s3, a6, s7
                  div          t3, sp, t0
                  andi         a4, a7, -1410
                  sra          a3, t2, s2
                  ori          a6, t4, 27
                  ori          a6, t4, 27
                  slli         t1, ra, 5
                  c.mv         s6, s5
                  c.srli       a0, 16
                  c.andi       a3, 13
                  c.addi16sp   sp, 256
                  slti         sp, a1, 426
                  rem          t1, s7, s2
                  c.nop
                  mulhsu       ra, t3, a0
                  or           t1, a5, t0
                  c.mv         s6, s5
                  c.nop
                  addi         s3, s2, -1824
                  nop
                  ori          a6, t4, 27
                  lui          a7, 1036702
                  sltu         s6, s9, sp
                  sltiu        a6, ra, -900
                  c.srli       a0, 16
                  sltu         s6, s9, sp
                  slti         sp, a1, 426
                  div          t3, sp, t0
                  rem          t1, s7, s2
                  c.andi       a3, 13
                  srli         s4, s3, 13
                  mul          s7, t5, a5
                  srli         s4, s3, 13
                  andi         a4, a7, -1410
                  srli         s4, s3, 13
                  or           t1, a5, t0
                  nop
                  rem          t1, s7, s2
                  xor          tp, a3, tp
                  c.add        a2, t6
                  div          t3, sp, t0
                  sub          sp, t0, a2
                  mulhu        a5, a3, t5
                  auipc        tp, 368653
                  rem          t1, s7, s2
                  mulhu        a5, a3, t5
                  c.slli       tp, 29
                  c.sub        a0, a1
                  c.or         a2, s0
                  c.slli       tp, 29
                  c.and        a0, s0
                  xor          tp, a3, tp
                  remu         sp, s3, s7
                  srli         s4, s3, 13
                  sub          sp, t0, a2
                  or           t1, a5, t0
                  rem          t1, s7, s2
                  sra          a3, t2, s2
                  c.xor        a0, s1
                  slt          s3, a6, a0
                  mul          s7, t5, a5
                  mulhsu       ra, t3, a0
                  and          s3, a6, s7
                  add          s4, a1, t4
                  nop
                  sub          sp, t0, a2
                  slti         sp, a1, 426
                  sub          sp, t0, a2
                  c.and        a0, s0
                  or           t1, a5, t0
                  mul          s7, t5, a5
                  rem          t1, s7, s2
                  c.sub        a0, a1
                  c.add        a2, t6
                  c.andi       a3, 13
                  slti         sp, a1, 426
                  remu         sp, s3, s7
                  addi         s3, s2, -1824
                  mulh         s8, zero, tp
                  sll          t2, gp, a3
                  auipc        tp, 368653
                  or           t1, a5, t0
                  divu         a7, s4, t2
                  c.lui        s10, 18
                  c.mv         s6, s5
                  c.andi       a3, 13
                  c.lui        s10, 18
                  sltu         s6, s9, sp
                  slli         t1, ra, 5
                  xori         sp, ra, -1938
                  div          t3, sp, t0
                  c.slli       tp, 29
                  or           t1, a5, t0
                  c.nop
                  lui          a7, 1036702
                  sltu         s6, s9, sp
                  add          s4, a1, t4
                  sub          sp, t0, a2
                  mulh         s8, zero, tp
                  c.nop
                  add          s4, a1, t4
                  sub          sp, t0, a2
                  c.or         a2, s0
                  div          t3, sp, t0
                  mulh         s8, zero, tp
                  sltiu        a6, ra, -900
                  c.srai       s0, 8
                  sltiu        a6, ra, -900
                  c.li         s3, 9
                  sra          a3, t2, s2
                  c.li         s3, 9
                  c.lui        s10, 18
                  divu         a7, s4, t2
                  c.addi16sp   sp, 256
                  addi         s3, s2, -1824
                  xori         sp, ra, -1938
                  c.addi       s7, -1
                  mul          s7, t5, a5
                  mulhsu       ra, t3, a0
                  c.lui        s10, 18
                  c.nop
                  c.andi       a3, 13
                  and          s3, a6, s7
                  ori          a6, t4, 27
                  mulhu        a5, a3, t5
                  xori         sp, ra, -1938
                  sll          t2, gp, a3
                  div          t3, sp, t0
                  c.li         s3, 9
                  andi         a4, a7, -1410
                  mulhu        a5, a3, t5
                  sltiu        a6, ra, -900
                  c.lui        s10, 18
                  mul          s7, t5, a5
                  mul          s7, t5, a5
                  c.xor        a0, s1
                  slli         t1, ra, 5
                  rem          t1, s7, s2
                  c.or         a2, s0
                  addi         s3, s2, -1824
                  andi         a4, a7, -1410
                  sltu         s6, s9, sp
                  sub          sp, t0, a2
                  mulh         s8, zero, tp
                  c.addi4spn   a0, sp, 368
                  nop
                  addi         s3, s2, -1824
                  c.mv         s6, s5
                  srl          t4, s1, t1
                  mulh         s8, zero, tp
                  divu         a7, s4, t2
                  mulh         s8, zero, tp
                  c.xor        a0, s1
                  srl          t4, s1, t1
                  c.mv         s6, s5
                  srli         s4, s3, 13
                  c.add        a2, t6
                  c.andi       a3, 13
                  andi         a4, a7, -1410
                  c.sub        a0, a1
                  c.lui        s10, 18
                  sll          t2, gp, a3
                  slt          s3, a6, a0
                  div          t3, sp, t0
                  mulh         s8, zero, tp
                  c.li         s3, 9
                  andi         a4, a7, -1410
                  c.mv         s6, s5
                  c.sub        a0, a1
                  c.mv         s6, s5
                  sll          t2, gp, a3
                  c.lui        s10, 18
                  c.or         a2, s0
                  lui          a7, 1036702
                  srai         a4, ra, 3
                  remu         sp, s3, s7
                  srl          t4, s1, t1
                  srai         a4, ra, 3
                  c.and        a0, s0
                  mulhu        a5, a3, t5
                  c.li         s3, 9
                  c.mv         s6, s5
                  add          s4, a1, t4
                  remu         sp, s3, s7
                  div          t3, sp, t0
                  c.addi16sp   sp, 256
                  sub          sp, t0, a2
                  lui          a7, 1036702
                  c.add        a2, t6
                  or           t1, a5, t0
                  and          s3, a6, s7
                  sltiu        a6, ra, -900
                  c.and        a0, s0
                  auipc        tp, 368653
                  sltiu        a6, ra, -900
                  c.mv         s6, s5
                  andi         a4, a7, -1410
                  remu         sp, s3, s7
                  sll          t2, gp, a3
                  divu         a7, s4, t2
                  mul          s7, t5, a5
                  srai         a4, ra, 3
                  c.addi4spn   a0, sp, 368
                  rem          t1, s7, s2
                  srli         s4, s3, 13
                  andi         a4, a7, -1410
                  c.addi       s7, -1
                  c.add        a2, t6
                  mulh         s8, zero, tp
                  ori          a6, t4, 27
                  c.mv         s6, s5
                  c.addi4spn   a0, sp, 368
                  nop
                  c.andi       a3, 13
                  c.add        a2, t6
                  slli         t1, ra, 5
                  c.li         s3, 9
                  c.srai       s0, 8
                  srli         s4, s3, 13
                  c.addi4spn   a0, sp, 368
                  srl          t4, s1, t1
                  c.and        a0, s0
                  sltu         s6, s9, sp
                  remu         sp, s3, s7
                  add          s4, a1, t4
                  c.slli       tp, 29
                  c.and        a0, s0
                  c.nop
                  mul          s7, t5, a5
                  c.and        a0, s0
                  auipc        tp, 368653
                  c.mv         s6, s5
                  c.nop
                  c.xor        a0, s1
                  srl          t4, s1, t1
                  c.addi16sp   sp, 256
                  c.mv         s6, s5
                  slti         sp, a1, 426
                  slt          s3, a6, a0
                  mul          s7, t5, a5
                  lui          a7, 1036702
                  c.mv         s6, s5
                  andi         a4, a7, -1410
                  andi         a4, a7, -1410
                  c.addi16sp   sp, 256
                  c.srli       a0, 16
                  rem          t1, s7, s2
                  nop
                  c.and        a0, s0
                  mul          s7, t5, a5
                  c.andi       a3, 13
                  c.andi       a3, 13
                  mulhu        a5, a3, t5
                  addi         s3, s2, -1824
                  c.and        a0, s0
                  c.andi       a3, 13
                  srli         s4, s3, 13
                  mulhu        a5, a3, t5
                  xor          tp, a3, tp
                  ori          a6, t4, 27
                  sll          t2, gp, a3
                  slt          s3, a6, a0
                  mul          s7, t5, a5
                  c.addi       s7, -1
                  mulh         s8, zero, tp
                  add          s4, a1, t4
                  c.addi16sp   sp, 256
                  c.srai       s0, 8
                  addi         s3, s2, -1824
                  c.slli       tp, 29
                  c.mv         s6, s5
                  c.addi16sp   sp, 256
                  c.li         s3, 9
                  divu         a7, s4, t2
                  nop
                  slt          s3, a6, a0
                  slti         sp, a1, 426
                  slt          s3, a6, a0
                  c.lui        s10, 18
                  andi         a4, a7, -1410
                  slt          s3, a6, a0
                  remu         sp, s3, s7
                  c.or         a2, s0
                  c.lui        s10, 18
                  slti         sp, a1, 426
                  ori          a6, t4, 27
                  c.slli       tp, 29
                  or           t1, a5, t0
                  div          t3, sp, t0
                  addi         s3, s2, -1824
                  sra          a3, t2, s2
                  c.sub        a0, a1
                  sub          sp, t0, a2
                  sltiu        a6, ra, -900
                  ori          a6, t4, 27
                  c.lui        s10, 18
                  c.slli       tp, 29
                  slti         sp, a1, 426
                  andi         a4, a7, -1410
                  addi         s3, s2, -1824
                  c.nop
                  c.addi16sp   sp, 256
                  addi         s3, s2, -1824
                  addi         s3, s2, -1824
                  sub          sp, t0, a2
                  div          t3, sp, t0
                  addi         s3, s2, -1824
                  sra          a3, t2, s2
                  c.li         s3, 9
                  rem          t1, s7, s2
                  c.and        a0, s0
                  rem          t1, s7, s2
                  xori         sp, ra, -1938
                  xor          tp, a3, tp
                  sub          sp, t0, a2
                  srl          t4, s1, t1
                  c.li         s3, 9
                  xori         sp, ra, -1938
                  c.addi       s7, -1
                  srl          t4, s1, t1
                  mulh         s8, zero, tp
                  c.sub        a0, a1
                  xori         sp, ra, -1938
                  xori         sp, ra, -1938
                  slti         sp, a1, 426
                  and          s3, a6, s7
                  c.lui        s10, 18
                  srai         a4, ra, 3
                  and          s3, a6, s7
                  c.mv         s6, s5
                  c.slli       tp, 29
                  slti         sp, a1, 426
                  slli         t1, ra, 5
                  lui          a7, 1036702
                  xor          tp, a3, tp
                  ori          a6, t4, 27
                  auipc        tp, 368653
                  c.lui        s10, 18
                  c.mv         s6, s5
                  slt          s3, a6, a0
                  div          t3, sp, t0
                  mulhsu       ra, t3, a0
                  mul          s7, t5, a5
                  mulhsu       ra, t3, a0
                  ori          a6, t4, 27
                  auipc        tp, 368653
                  c.addi       s7, -1
                  andi         a4, a7, -1410
                  divu         a7, s4, t2
                  mulhsu       ra, t3, a0
                  c.slli       tp, 29
                  lui          a7, 1036702
                  slti         sp, a1, 426
                  c.andi       a3, 13
                  c.slli       tp, 29
                  srli         s4, s3, 13
                  c.slli       tp, 29
                  c.addi16sp   sp, 256
                  c.lui        s10, 18
                  srai         a4, ra, 3
                  c.li         s3, 9
                  srai         a4, ra, 3
                  mulhsu       ra, t3, a0
                  srli         s4, s3, 13
                  sra          a3, t2, s2
                  xori         sp, ra, -1938
                  c.addi4spn   a0, sp, 368
                  mul          s7, t5, a5
                  mulh         s8, zero, tp
                  slti         sp, a1, 426
                  c.srai       s0, 8
                  c.lui        s10, 18
                  addi         s3, s2, -1824
                  c.sub        a0, a1
                  srl          t4, s1, t1
                  c.srli       a0, 16
                  add          s4, a1, t4
                  nop
                  mulh         s8, zero, tp
                  srai         a4, ra, 3
                  srl          t4, s1, t1
                  or           t1, a5, t0
                  c.add        a2, t6
                  srai         a4, ra, 3
                  sltiu        a6, ra, -900
                  srai         a4, ra, 3
                  auipc        tp, 368653
                  c.xor        a0, s1
                  or           t1, a5, t0
                  slt          s3, a6, a0
                  srai         a4, ra, 3
                  srl          t4, s1, t1
                  divu         a7, s4, t2
                  c.slli       tp, 29
                  srl          t4, s1, t1
                  c.nop
                  c.srai       s0, 8
                  sra          a3, t2, s2
                  div          t3, sp, t0
                  sltu         s6, s9, sp
                  c.addi16sp   sp, 256
                  xori         sp, ra, -1938
                  srli         s4, s3, 13
                  c.sub        a0, a1
                  c.addi       s7, -1
                  sltu         s6, s9, sp
                  c.srai       s0, 8
                  nop
                  c.add        a2, t6
                  c.xor        a0, s1
                  addi         s3, s2, -1824
                  divu         a7, s4, t2
                  slti         sp, a1, 426
                  lui          a7, 1036702
                  auipc        tp, 368653
                  sltiu        a6, ra, -900
                  c.addi       s7, -1
                  sll          t2, gp, a3
                  srl          t4, s1, t1
                  sub          sp, t0, a2
                  mulhu        a5, a3, t5
                  mulhu        a5, a3, t5
                  divu         a7, s4, t2
                  c.sub        a0, a1
                  mulhu        a5, a3, t5
                  srai         a4, ra, 3
                  slli         t1, ra, 5
                  srai         a4, ra, 3
                  c.nop
                  or           t1, a5, t0
                  lui          a7, 1036702
                  slti         sp, a1, 426
                  sll          t2, gp, a3
                  c.sub        a0, a1
                  c.mv         s6, s5
                  and          s3, a6, s7
                  mul          s7, t5, a5
                  c.or         a2, s0
                  slli         t1, ra, 5
                  or           t1, a5, t0
                  c.nop
                  mulhsu       ra, t3, a0
                  srai         a4, ra, 3
                  c.slli       tp, 29
                  c.nop
                  mulhu        a5, a3, t5
                  c.xor        a0, s1
                  c.addi4spn   a0, sp, 368
                  c.lui        s10, 18
                  sltu         s6, s9, sp
                  srl          t4, s1, t1
                  lui          a7, 1036702
                  srl          t4, s1, t1
                  xori         sp, ra, -1938
                  xori         sp, ra, -1938
                  and          s3, a6, s7
                  c.lui        s10, 18
                  c.xor        a0, s1
                  mulh         s8, zero, tp
                  sub          sp, t0, a2
                  mulh         s8, zero, tp
                  addi         s3, s2, -1824
                  c.xor        a0, s1
                  andi         a4, a7, -1410
                  c.addi16sp   sp, 256
                  c.srai       s0, 8
                  sub          sp, t0, a2
                  lui          a7, 1036702
                  rem          t1, s7, s2
                  slt          s3, a6, a0
                  c.and        a0, s0
                  sltiu        a6, ra, -900
                  mulhu        a5, a3, t5
                  mul          s7, t5, a5
                  c.xor        a0, s1
                  srai         a4, ra, 3
                  sra          a3, t2, s2
                  div          t3, sp, t0
                  rem          t1, s7, s2
                  div          t3, sp, t0
                  mulhu        a5, a3, t5
                  mulh         s8, zero, tp
                  slt          s3, a6, a0
                  c.addi       s7, -1
                  c.nop
                  srl          t4, s1, t1
                  remu         sp, s3, s7
                  slt          s3, a6, a0
                  or           t1, a5, t0
                  c.or         a2, s0
                  add          s4, a1, t4
                  remu         sp, s3, s7
                  c.li         s3, 9
                  lui          a7, 1036702
                  c.xor        a0, s1
                  c.addi       s7, -1
                  c.lui        s10, 18
                  c.slli       tp, 29
                  sltu         s6, s9, sp
                  slli         t1, ra, 5
                  sltu         s6, s9, sp
                  c.and        a0, s0
                  c.lui        s10, 18
                  sll          t2, gp, a3
                  sll          t2, gp, a3
                  div          t3, sp, t0
                  xor          tp, a3, tp
                  c.slli       tp, 29
                  srai         a4, ra, 3
                  c.slli       tp, 29
                  c.addi       s7, -1
                  addi         s3, s2, -1824
                  srl          t4, s1, t1
                  mul          s7, t5, a5
                  c.addi       s7, -1
                  c.lui        s10, 18
                  or           t1, a5, t0
                  sll          t2, gp, a3
                  addi         s3, s2, -1824
                  sltu         s6, s9, sp
                  c.or         a2, s0
                  c.andi       a3, 13
                  ori          a6, t4, 27
                  srl          t4, s1, t1
                  or           t1, a5, t0
                  div          t3, sp, t0
                  c.addi16sp   sp, 256
                  nop
                  div          t3, sp, t0
                  nop
                  sll          t2, gp, a3
                  c.mv         s6, s5
                  srli         s4, s3, 13
                  sltiu        a6, ra, -900
                  or           t1, a5, t0
                  lui          a7, 1036702
                  sltu         s6, s9, sp
                  c.mv         s6, s5
                  c.xor        a0, s1
                  c.addi16sp   sp, 256
                  andi         a4, a7, -1410
                  c.or         a2, s0
                  sll          t2, gp, a3
                  c.mv         s6, s5
                  c.andi       a3, 13
                  c.andi       a3, 13
                  sll          t2, gp, a3
                  c.srai       s0, 8
                  mulh         s8, zero, tp
                  c.or         a2, s0
                  slt          s3, a6, a0
                  slli         t1, ra, 5
                  xori         sp, ra, -1938
                  c.srli       a0, 16
                  slti         sp, a1, 426
                  andi         a4, a7, -1410
                  srai         a4, ra, 3
                  remu         sp, s3, s7
                  div          t3, sp, t0
                  lui          a7, 1036702
                  slt          s3, a6, a0
                  c.srli       a0, 16
                  sub          sp, t0, a2
                  lui          a7, 1036702
                  c.srai       s0, 8
                  add          s4, a1, t4
                  xor          tp, a3, tp
                  srai         a4, ra, 3
                  add          s4, a1, t4
                  divu         a7, s4, t2
                  c.srli       a0, 16
                  srl          t4, s1, t1
                  remu         sp, s3, s7
                  lui          a7, 1036702
                  add          s4, a1, t4
                  slli         t1, ra, 5
                  sra          a3, t2, s2
                  xori         sp, ra, -1938
                  divu         a7, s4, t2
                  c.nop
                  c.or         a2, s0
                  sra          a3, t2, s2
                  c.mv         s6, s5
                  c.srli       a0, 16
                  rem          t1, s7, s2
                  auipc        tp, 368653
                  sra          a3, t2, s2
                  sltiu        a6, ra, -900
                  c.lui        s10, 18
                  or           t1, a5, t0
                  addi         s3, s2, -1824
                  srli         s4, s3, 13
                  c.slli       tp, 29
                  c.addi16sp   sp, 256
                  c.nop
                  mulhsu       ra, t3, a0
                  and          s3, a6, s7
                  and          s3, a6, s7
                  sltiu        a6, ra, -900
                  c.li         s3, 9
                  c.slli       tp, 29
                  c.andi       a3, 13
                  xori         sp, ra, -1938
                  auipc        tp, 368653
                  sltiu        a6, ra, -900
                  mul          s7, t5, a5
                  srli         s4, s3, 13
                  slli         t1, ra, 5
                  and          s3, a6, s7
                  xori         sp, ra, -1938
                  c.or         a2, s0
                  srl          t4, s1, t1
                  c.sub        a0, a1
                  remu         sp, s3, s7
                  sll          t2, gp, a3
                  srl          t4, s1, t1
                  divu         a7, s4, t2
                  sltiu        a6, ra, -900
                  sub          sp, t0, a2
                  srai         a4, ra, 3
                  mul          s7, t5, a5
                  c.add        a2, t6
                  srl          t4, s1, t1
                  addi         s3, s2, -1824
                  slti         sp, a1, 426
                  c.li         s3, 9
                  xor          tp, a3, tp
                  mulh         s8, zero, tp
                  slti         sp, a1, 426
                  lui          a7, 1036702
                  mulh         s8, zero, tp
                  c.addi4spn   a0, sp, 368
                  c.nop
                  c.or         a2, s0
                  slti         sp, a1, 426
                  srai         a4, ra, 3
                  and          s3, a6, s7
                  c.andi       a3, 13
                  c.nop
                  srai         a4, ra, 3
                  c.or         a2, s0
                  addi         s3, s2, -1824
                  andi         a4, a7, -1410
                  or           t1, a5, t0
                  srli         s4, s3, 13
                  slli         t1, ra, 5
                  c.li         s3, 9
                  slli         t1, ra, 5
                  and          s3, a6, s7
                  sll          t2, gp, a3
                  sltiu        a6, ra, -900
                  c.addi       s7, -1
                  c.or         a2, s0
                  slt          s3, a6, a0
                  auipc        tp, 368653
                  mul          s7, t5, a5
                  lui          a7, 1036702
                  nop
                  c.xor        a0, s1
                  sll          t2, gp, a3
                  mulhu        a5, a3, t5
                  andi         a4, a7, -1410
                  nop
                  slti         sp, a1, 426
                  ori          a6, t4, 27
                  c.srli       a0, 16
                  and          s3, a6, s7
                  mulhsu       ra, t3, a0
                  c.srai       s0, 8
                  xor          tp, a3, tp
                  c.addi4spn   a0, sp, 368
                  and          s3, a6, s7
                  mulhsu       ra, t3, a0
                  sra          a3, t2, s2
                  c.xor        a0, s1
                  c.andi       a3, 13
                  mulhsu       ra, t3, a0
                  c.andi       a3, 13
                  srl          t4, s1, t1
                  xor          tp, a3, tp
                  divu         a7, s4, t2
                  c.srli       a0, 16
                  ori          a6, t4, 27
                  sll          t2, gp, a3
                  divu         a7, s4, t2
                  srli         s4, s3, 13
                  sll          t2, gp, a3
                  sra          a3, t2, s2
                  mulh         s8, zero, tp
                  c.srai       s0, 8
                  c.li         s3, 9
                  mul          s7, t5, a5
                  srli         s4, s3, 13
                  c.slli       tp, 29
                  c.slli       tp, 29
                  ori          a6, t4, 27
                  c.andi       a3, 13
                  slt          s3, a6, a0
                  sra          a3, t2, s2
                  c.srai       s0, 8
                  slti         sp, a1, 426
                  mulhsu       ra, t3, a0
                  xori         sp, ra, -1938
                  andi         a4, a7, -1410
                  addi         s3, s2, -1824
                  or           t1, a5, t0
                  mul          s7, t5, a5
                  c.mv         s6, s5
                  c.add        a2, t6
                  srl          t4, s1, t1
                  c.andi       a3, 13
                  c.addi4spn   a0, sp, 368
                  c.andi       a3, 13
                  c.or         a2, s0
                  c.addi       s7, -1
                  c.addi4spn   a0, sp, 368
                  or           t1, a5, t0
                  div          t3, sp, t0
                  c.addi16sp   sp, 256
                  remu         sp, s3, s7
                  c.srli       a0, 16
                  slti         sp, a1, 426
                  sltiu        a6, ra, -900
                  c.sub        a0, a1
                  srai         a4, ra, 3
                  c.addi       s7, -1
                  sll          t2, gp, a3
                  remu         sp, s3, s7
                  xor          tp, a3, tp
                  slt          s3, a6, a0
                  c.xor        a0, s1
                  sll          t2, gp, a3
                  slli         t1, ra, 5
                  rem          t1, s7, s2
                  mulh         s8, zero, tp
                  remu         sp, s3, s7
                  c.nop
                  slti         sp, a1, 426
                  c.nop
                  mulh         s8, zero, tp
                  div          t3, sp, t0
                  sltu         s6, s9, sp
                  c.nop
                  c.and        a0, s0
                  c.srai       s0, 8
                  sub          sp, t0, a2
                  c.nop
                  mul          s7, t5, a5
                  add          s4, a1, t4
                  or           t1, a5, t0
                  sltiu        a6, ra, -900
                  c.mv         s6, s5
                  mulhu        a5, a3, t5
                  mulh         s8, zero, tp
                  add          s4, a1, t4
                  andi         a4, a7, -1410
                  sra          a3, t2, s2
                  c.mv         s6, s5
                  c.addi4spn   a0, sp, 368
                  sra          a3, t2, s2
                  sltu         s6, s9, sp
                  xori         sp, ra, -1938
                  c.srli       a0, 16
                  sltiu        a6, ra, -900
                  c.addi4spn   a0, sp, 368
                  c.xor        a0, s1
                  andi         a4, a7, -1410
                  mul          s7, t5, a5
                  c.andi       a3, 13
                  srai         a4, ra, 3
                  sltiu        a6, ra, -900
                  auipc        tp, 368653
                  sra          a3, t2, s2
                  c.addi       s7, -1
                  divu         a7, s4, t2
                  and          s3, a6, s7
                  c.xor        a0, s1
                  xori         sp, ra, -1938
                  sltiu        a6, ra, -900
                  slti         sp, a1, 426
                  xor          tp, a3, tp
                  div          t3, sp, t0
                  mulhu        a5, a3, t5
                  c.addi4spn   a0, sp, 368
                  xori         sp, ra, -1938
                  srai         a4, ra, 3
                  c.add        a2, t6
                  c.li         s3, 9
                  c.mv         s6, s5
                  c.slli       tp, 29
                  srli         s4, s3, 13
                  slli         t1, ra, 5
                  c.sub        a0, a1
                  mul          s7, t5, a5
                  c.slli       tp, 29
                  sll          t2, gp, a3
                  divu         a7, s4, t2
                  xori         sp, ra, -1938
                  addi         s3, s2, -1824
                  lui          a7, 1036702
                  c.slli       tp, 29
                  rem          t1, s7, s2
                  mul          s7, t5, a5
                  div          t3, sp, t0
                  srli         s4, s3, 13
                  addi         s3, s2, -1824
                  c.add        a2, t6
                  sltiu        a6, ra, -900
                  add          s4, a1, t4
                  slti         sp, a1, 426
                  sltiu        a6, ra, -900
                  c.mv         s6, s5
                  auipc        tp, 368653
                  sltu         s6, s9, sp
                  srl          t4, s1, t1
                  c.lui        s10, 18
                  c.slli       tp, 29
                  add          s4, a1, t4
                  c.or         a2, s0
                  addi         s3, s2, -1824
                  div          t3, sp, t0
                  mulh         s8, zero, tp
                  sub          sp, t0, a2
                  divu         a7, s4, t2
                  mulhu        a5, a3, t5
                  c.srai       s0, 8
                  c.addi4spn   a0, sp, 368
                  c.add        a2, t6
                  mulhu        a5, a3, t5
                  ori          a6, t4, 27
                  srli         s4, s3, 13
                  add          s4, a1, t4
                  c.andi       a3, 13
                  sub          sp, t0, a2
                  slt          s3, a6, a0
                  c.xor        a0, s1
                  slti         sp, a1, 426
                  c.add        a2, t6
                  c.xor        a0, s1
                  auipc        tp, 368653
                  mul          s7, t5, a5
                  sra          a3, t2, s2
                  and          s3, a6, s7
                  remu         sp, s3, s7
                  or           t1, a5, t0
                  div          t3, sp, t0
                  slti         sp, a1, 426
                  srli         s4, s3, 13
                  c.add        a2, t6
                  c.lui        s10, 18
                  mul          s7, t5, a5
                  auipc        tp, 368653
                  xor          tp, a3, tp
                  div          t3, sp, t0
                  srai         a4, ra, 3
                  c.andi       a3, 13
                  c.and        a0, s0
                  rem          t1, s7, s2
                  c.addi       s7, -1
                  remu         sp, s3, s7
                  slt          s3, a6, a0
                  c.li         s3, 9
                  div          t3, sp, t0
                  ori          a6, t4, 27
                  mulhsu       ra, t3, a0
                  srli         s4, s3, 13
                  auipc        tp, 368653
                  c.li         s3, 9
                  and          s3, a6, s7
                  slti         sp, a1, 426
                  rem          t1, s7, s2
                  andi         a4, a7, -1410
                  xori         sp, ra, -1938
                  sub          sp, t0, a2
                  divu         a7, s4, t2
                  add          s4, a1, t4
                  lui          a7, 1036702
                  div          t3, sp, t0
                  c.mv         s6, s5
                  auipc        tp, 368653
                  sra          a3, t2, s2
                  rem          t1, s7, s2
                  c.srli       a0, 16
                  mul          s7, t5, a5
                  c.xor        a0, s1
                  c.nop
                  c.lui        s10, 18
                  mulhsu       ra, t3, a0
                  ori          a6, t4, 27
                  ori          a6, t4, 27
                  auipc        tp, 368653
                  c.srli       a0, 16
                  slti         sp, a1, 426
                  auipc        tp, 368653
                  divu         a7, s4, t2
                  c.srli       a0, 16
                  or           t1, a5, t0
                  xori         sp, ra, -1938
                  mulh         s8, zero, tp
                  c.andi       a3, 13
                  sub          sp, t0, a2
                  c.addi4spn   a0, sp, 368
                  xor          tp, a3, tp
                  and          s3, a6, s7
                  c.sub        a0, a1
                  andi         a4, a7, -1410
                  c.add        a2, t6
                  sltu         s6, s9, sp
                  c.nop
                  xori         sp, ra, -1938
                  auipc        tp, 368653
                  sra          a3, t2, s2
                  remu         sp, s3, s7
                  andi         a4, a7, -1410
                  and          s3, a6, s7
                  c.li         s3, 9
                  c.lui        s10, 18
                  addi         s3, s2, -1824
                  lui          a7, 1036702
                  c.slli       tp, 29
                  div          t3, sp, t0
                  c.srli       a0, 16
                  c.and        a0, s0
                  c.xor        a0, s1
                  c.add        a2, t6
                  divu         a7, s4, t2
                  c.srai       s0, 8
                  sra          a3, t2, s2
                  c.lui        s10, 18
                  c.addi       s7, -1
                  mulh         s8, zero, tp
                  nop
                  sub          sp, t0, a2
                  ori          a6, t4, 27
                  c.li         s3, 9
                  slli         t1, ra, 5
                  sub          sp, t0, a2
                  nop
                  and          s3, a6, s7
                  slti         sp, a1, 426
                  mulhu        a5, a3, t5
                  xori         sp, ra, -1938
                  c.andi       a3, 13
                  c.andi       a3, 13
                  div          t3, sp, t0
                  srli         s4, s3, 13
                  c.and        a0, s0
                  nop
                  divu         a7, s4, t2
                  mul          s7, t5, a5
                  auipc        tp, 368653
                  slli         t1, ra, 5
                  mul          s7, t5, a5
                  c.slli       tp, 29
                  addi         s3, s2, -1824
                  mulhu        a5, a3, t5
                  sra          a3, t2, s2
                  srli         s4, s3, 13
                  c.addi4spn   a0, sp, 368
                  c.srli       a0, 16
                  c.mv         s6, s5
                  xori         sp, ra, -1938
                  slt          s3, a6, a0
                  c.li         s3, 9
                  c.addi4spn   a0, sp, 368
                  srli         s4, s3, 13
                  add          s4, a1, t4
                  c.and        a0, s0
                  nop
                  addi         s3, s2, -1824
                  andi         a4, a7, -1410
                  c.andi       a3, 13
                  sub          sp, t0, a2
                  slti         sp, a1, 426
                  c.andi       a3, 13
                  c.li         s3, 9
                  xor          tp, a3, tp
                  slt          s3, a6, a0
                  xori         sp, ra, -1938
                  sub          sp, t0, a2
                  srl          t4, s1, t1
                  c.addi16sp   sp, 256
                  c.srai       s0, 8
                  srl          t4, s1, t1
                  and          s3, a6, s7
                  c.slli       tp, 29
                  auipc        tp, 368653
                  slti         sp, a1, 426
                  c.andi       a3, 13
                  c.addi4spn   a0, sp, 368
                  srai         a4, ra, 3
                  div          t3, sp, t0
                  c.add        a2, t6
                  c.lui        s10, 18
                  slli         t1, ra, 5
                  divu         a7, s4, t2
                  andi         a4, a7, -1410
                  sltu         s6, s9, sp
                  slt          s3, a6, a0
                  remu         sp, s3, s7
                  c.andi       a3, 13
                  rem          t1, s7, s2
                  c.slli       tp, 29
                  mulhu        a5, a3, t5
                  add          s4, a1, t4
                  srl          t4, s1, t1
                  addi         s3, s2, -1824
                  remu         sp, s3, s7
                  c.nop
                  sll          t2, gp, a3
                  c.addi       s7, -1
                  auipc        tp, 368653
                  mulh         s8, zero, tp
                  mulhsu       ra, t3, a0
                  c.or         a2, s0
                  rem          t1, s7, s2
                  mulhu        a5, a3, t5
                  remu         sp, s3, s7
                  xor          tp, a3, tp
                  c.and        a0, s0
                  or           t1, a5, t0
                  xori         sp, ra, -1938
                  div          t3, sp, t0
                  srai         a4, ra, 3
                  sltiu        a6, ra, -900
                  sltu         s6, s9, sp
                  c.add        a2, t6
                  divu         a7, s4, t2
                  sra          a3, t2, s2
                  slli         t1, ra, 5
                  sltu         s6, s9, sp
                  add          s4, a1, t4
                  div          t3, sp, t0
                  srai         a4, ra, 3
                  c.srai       s0, 8
                  c.li         s3, 9
                  div          t3, sp, t0
                  andi         a4, a7, -1410
                  c.lui        s10, 18
                  c.xor        a0, s1
                  mul          s7, t5, a5
                  addi         s3, s2, -1824
                  slti         sp, a1, 426
                  xor          tp, a3, tp
                  c.nop
                  lui          a7, 1036702
                  c.and        a0, s0
                  add          s4, a1, t4
                  sub          sp, t0, a2
                  mul          s7, t5, a5
                  c.mv         s6, s5
                  c.addi4spn   a0, sp, 368
                  lui          a7, 1036702
                  slti         sp, a1, 426
                  c.srli       a0, 16
                  c.srli       a0, 16
                  ori          a6, t4, 27
                  auipc        tp, 368653
                  c.slli       tp, 29
                  c.addi16sp   sp, 256
                  c.and        a0, s0
                  c.xor        a0, s1
                  ori          a6, t4, 27
                  mulhsu       ra, t3, a0
                  sltiu        a6, ra, -900
                  mulh         s8, zero, tp
                  mulh         s8, zero, tp
                  lui          a7, 1036702
                  sll          t2, gp, a3
                  mulhu        a5, a3, t5
                  mulh         s8, zero, tp
                  mulhsu       ra, t3, a0
                  sll          t2, gp, a3
                  sltu         s6, s9, sp
                  c.nop
                  c.lui        s10, 18
                  mulh         s8, zero, tp
                  lui          a7, 1036702
                  mulhu        a5, a3, t5
                  xor          tp, a3, tp
                  c.mv         s6, s5
                  sll          t2, gp, a3
                  ori          a6, t4, 27
                  sub          sp, t0, a2
                  c.sub        a0, a1
                  andi         a4, a7, -1410
                  c.andi       a3, 13
                  or           t1, a5, t0
                  sub          sp, t0, a2
                  c.and        a0, s0
                  c.srli       a0, 16
                  c.nop
                  andi         a4, a7, -1410
                  mul          s7, t5, a5
                  c.srai       s0, 8
                  xori         sp, ra, -1938
                  andi         a4, a7, -1410
                  xori         sp, ra, -1938
                  c.xor        a0, s1
                  c.slli       tp, 29
                  c.srli       a0, 16
                  sltu         s6, s9, sp
                  srai         a4, ra, 3
                  c.xor        a0, s1
                  mulh         s8, zero, tp
                  auipc        tp, 368653
                  div          t3, sp, t0
                  srli         s4, s3, 13
                  mul          s7, t5, a5
                  c.nop
                  sub          sp, t0, a2
                  remu         sp, s3, s7
                  slti         sp, a1, 426
                  c.andi       a3, 13
                  div          t3, sp, t0
                  sltu         s6, s9, sp
                  c.mv         s6, s5
                  lui          a7, 1036702
                  srl          t4, s1, t1
                  slli         t1, ra, 5
                  srli         s4, s3, 13
                  sub          sp, t0, a2
                  sll          t2, gp, a3
                  or           t1, a5, t0
                  sll          t2, gp, a3
                  srli         s4, s3, 13
                  divu         a7, s4, t2
                  srl          t4, s1, t1
                  and          s3, a6, s7
                  mul          s7, t5, a5
                  mulhsu       ra, t3, a0
                  srai         a4, ra, 3
                  mulhsu       ra, t3, a0
                  c.or         a2, s0
                  sra          a3, t2, s2
                  c.srli       a0, 16
                  sltiu        a6, ra, -900
                  c.addi4spn   a0, sp, 368
                  or           t1, a5, t0
                  c.nop
                  c.add        a2, t6
                  c.and        a0, s0
                  c.sub        a0, a1
                  sll          t2, gp, a3
                  mulhu        a5, a3, t5
                  c.addi16sp   sp, 256
                  sra          a3, t2, s2
                  srai         a4, ra, 3
                  c.srli       a0, 16
                  c.slli       tp, 29
                  sub          sp, t0, a2
                  slti         sp, a1, 426
                  nop
                  andi         a4, a7, -1410
                  rem          t1, s7, s2
                  divu         a7, s4, t2
                  sub          sp, t0, a2
                  c.or         a2, s0
                  add          s4, a1, t4
                  c.and        a0, s0
                  slt          s3, a6, a0
                  c.srli       a0, 16
                  sll          t2, gp, a3
                  c.sub        a0, a1
                  c.and        a0, s0
                  srai         a4, ra, 3
                  srli         s4, s3, 13
                  c.or         a2, s0
                  li           s3, 0x0 #start riscv_int_numeric_corner_stream_38
                  li           t2, 0xffffffff
                  li           t1, 0x0
                  li           t6, 0xffffffff
                  li           a7, 0xffffffff
                  li           s10, 0x80000000
                  li           ra, 0x0
                  li           gp, 0x80000000
                  li           s6, 0x13a6a7b4
                  li           s7, 0xffffffff
                  div          a7, t1, s3
                  addi         t1, t1, -1824
                  auipc        a7, 368653
                  mul          s3, s3, s7
                  mulhu        t2, s7, s10
                  lui          ra, 1036702
                  mulhu        t2, s7, s10
                  auipc        a7, 368653
                  remu         t1, t2, s7
                  mulhsu       gp, s7, s3
                  mulhu        t2, s7, s10
                  mulhsu       gp, s7, s3
                  addi         t1, t1, -1824
                  div          a7, t1, s3
                  mul          s3, s3, s7
                  div          a7, t1, s3
                  mul          s3, s3, s7
                  nop
                  add          t2, s6, s6
                  mulh         s6, ra, a7
                  divu         ra, a7, s7
                  mulhu        t2, s7, s10
                  addi         t1, t1, -1824
                  mulhsu       gp, s7, s3
                  sub          t1, s3, s6
                  rem          s6, s7, t1
                  mul          s3, s3, s7 #end riscv_int_numeric_corner_stream_38
                  c.add        a2, t6
                  slli         t1, ra, 5
                  c.add        a2, t6
                  c.addi16sp   sp, 256
                  mul          s7, t5, a5
                  divu         a7, s4, t2
                  rem          t1, s7, s2
                  sra          a3, t2, s2
                  c.srli       a0, 16
                  c.mv         s6, s5
                  auipc        tp, 368653
                  divu         a7, s4, t2
                  c.addi       s7, -1
                  sltiu        a6, ra, -900
                  slli         t1, ra, 5
                  srli         s4, s3, 13
                  add          s4, a1, t4
                  srl          t4, s1, t1
                  remu         sp, s3, s7
                  mul          s7, t5, a5
                  c.slli       tp, 29
                  nop
                  mul          s7, t5, a5
                  c.mv         s6, s5
                  c.or         a2, s0
                  mulhsu       ra, t3, a0
                  sub          sp, t0, a2
                  sub          sp, t0, a2
                  c.or         a2, s0
                  c.addi       s7, -1
                  add          s4, a1, t4
                  slti         sp, a1, 426
                  nop
                  c.slli       tp, 29
                  and          s3, a6, s7
                  slt          s3, a6, a0
                  c.xor        a0, s1
                  c.mv         s6, s5
                  divu         a7, s4, t2
                  c.add        a2, t6
                  c.andi       a3, 13
                  c.addi       s7, -1
                  c.mv         s6, s5
                  c.addi16sp   sp, 256
                  add          s4, a1, t4
                  c.li         s3, 9
                  c.and        a0, s0
                  sltiu        a6, ra, -900
                  c.srai       s0, 8
                  sra          a3, t2, s2
                  remu         sp, s3, s7
                  divu         a7, s4, t2
                  divu         a7, s4, t2
                  slti         sp, a1, 426
                  srl          t4, s1, t1
                  mulhsu       ra, t3, a0
                  c.srli       a0, 16
                  c.slli       tp, 29
                  xor          tp, a3, tp
                  xor          tp, a3, tp
                  c.li         s3, 9
                  sub          sp, t0, a2
                  srai         a4, ra, 3
                  add          s4, a1, t4
                  addi         s3, s2, -1824
                  c.xor        a0, s1
                  sltu         s6, s9, sp
                  mul          s7, t5, a5
                  rem          t1, s7, s2
                  c.nop
                  c.add        a2, t6
                  slti         sp, a1, 426
                  c.mv         s6, s5
                  xori         sp, ra, -1938
                  mulhu        a5, a3, t5
                  div          t3, sp, t0
                  or           t1, a5, t0
                  c.addi       s7, -1
                  c.lui        s10, 18
                  lui          a7, 1036702
                  c.xor        a0, s1
                  lui          a7, 1036702
                  c.mv         s6, s5
                  srl          t4, s1, t1
                  c.mv         s6, s5
                  mulh         s8, zero, tp
                  sll          t2, gp, a3
                  c.andi       a3, 13
                  remu         sp, s3, s7
                  c.mv         s6, s5
                  c.addi       s7, -1
                  c.slli       tp, 29
                  c.slli       tp, 29
                  c.sub        a0, a1
                  srli         s4, s3, 13
                  srli         s4, s3, 13
                  c.andi       a3, 13
                  srli         s4, s3, 13
                  mulh         s8, zero, tp
                  c.sub        a0, a1
                  sra          a3, t2, s2
                  sub          sp, t0, a2
                  mulhsu       ra, t3, a0
                  c.or         a2, s0
                  remu         sp, s3, s7
                  slti         sp, a1, 426
                  c.addi4spn   a0, sp, 368
                  mulhsu       ra, t3, a0
                  add          s4, a1, t4
                  c.addi       s7, -1
                  addi         s3, s2, -1824
                  srli         s4, s3, 13
                  c.andi       a3, 13
                  divu         a7, s4, t2
                  sll          t2, gp, a3
                  xori         sp, ra, -1938
                  c.srai       s0, 8
                  sub          sp, t0, a2
                  xor          tp, a3, tp
                  slt          s3, a6, a0
                  c.xor        a0, s1
                  srai         a4, ra, 3
                  mul          s7, t5, a5
                  andi         a4, a7, -1410
                  c.xor        a0, s1
                  sltu         s6, s9, sp
                  c.lui        s10, 18
                  c.addi16sp   sp, 256
                  ori          a6, t4, 27
                  mulhsu       ra, t3, a0
                  mul          s7, t5, a5
                  nop
                  add          s4, a1, t4
                  slt          s3, a6, a0
                  mulhu        a5, a3, t5
                  or           t1, a5, t0
                  auipc        tp, 368653
                  sra          a3, t2, s2
                  c.srai       s0, 8
                  sltiu        a6, ra, -900
                  sub          sp, t0, a2
                  c.slli       tp, 29
                  c.srai       s0, 8
                  c.addi4spn   a0, sp, 368
                  mulhsu       ra, t3, a0
                  c.nop
                  lui          a7, 1036702
                  c.lui        s10, 18
                  c.or         a2, s0
                  srl          t4, s1, t1
                  srl          t4, s1, t1
                  mulhu        a5, a3, t5
                  c.or         a2, s0
                  lui          a7, 1036702
                  c.and        a0, s0
                  xor          tp, a3, tp
                  c.or         a2, s0
                  c.xor        a0, s1
                  c.lui        s10, 18
                  remu         sp, s3, s7
                  c.srai       s0, 8
                  c.or         a2, s0
                  ori          a6, t4, 27
                  c.addi4spn   a0, sp, 368
                  auipc        tp, 368653
                  xor          tp, a3, tp
                  nop
                  c.slli       tp, 29
                  c.and        a0, s0
                  srl          t4, s1, t1
                  c.lui        s10, 18
                  xori         sp, ra, -1938
                  xor          tp, a3, tp
                  ori          a6, t4, 27
                  andi         a4, a7, -1410
                  divu         a7, s4, t2
                  ori          a6, t4, 27
                  mul          s7, t5, a5
                  lui          a7, 1036702
                  c.slli       tp, 29
                  c.srai       s0, 8
                  c.addi       s7, -1
                  c.andi       a3, 13
                  slli         t1, ra, 5
                  or           t1, a5, t0
                  c.li         s3, 9
                  sub          sp, t0, a2
                  xori         sp, ra, -1938
                  sltiu        a6, ra, -900
                  sra          a3, t2, s2
                  andi         a4, a7, -1410
                  c.and        a0, s0
                  or           t1, a5, t0
                  c.slli       tp, 29
                  andi         a4, a7, -1410
                  add          s4, a1, t4
                  c.addi       s7, -1
                  c.or         a2, s0
                  addi         s3, s2, -1824
                  srli         s4, s3, 13
                  mulhu        a5, a3, t5
                  slti         sp, a1, 426
                  mulhu        a5, a3, t5
                  srai         a4, ra, 3
                  c.xor        a0, s1
                  c.nop
                  c.add        a2, t6
                  mulhsu       ra, t3, a0
                  c.addi16sp   sp, 256
                  c.lui        s10, 18
                  slti         sp, a1, 426
                  sra          a3, t2, s2
                  c.sub        a0, a1
                  c.sub        a0, a1
                  c.xor        a0, s1
                  sub          sp, t0, a2
                  c.and        a0, s0
                  c.srai       s0, 8
                  slti         sp, a1, 426
                  sltu         s6, s9, sp
                  or           t1, a5, t0
                  c.srai       s0, 8
                  andi         a4, a7, -1410
                  srl          t4, s1, t1
                  nop
                  c.add        a2, t6
                  c.sub        a0, a1
                  or           t1, a5, t0
                  slli         t1, ra, 5
                  remu         sp, s3, s7
                  c.and        a0, s0
                  div          t3, sp, t0
                  c.and        a0, s0
                  ori          a6, t4, 27
                  addi         s3, s2, -1824
                  c.srli       a0, 16
                  rem          t1, s7, s2
                  c.and        a0, s0
                  auipc        tp, 368653
                  c.nop
                  remu         sp, s3, s7
                  sra          a3, t2, s2
                  div          t3, sp, t0
                  and          s3, a6, s7
                  slli         t1, ra, 5
                  rem          t1, s7, s2
                  mulhsu       ra, t3, a0
                  c.nop
                  addi         s3, s2, -1824
                  rem          t1, s7, s2
                  c.mv         s6, s5
                  addi         s3, s2, -1824
                  mulh         s8, zero, tp
                  mul          s7, t5, a5
                  andi         a4, a7, -1410
                  c.li         s3, 9
                  ori          a6, t4, 27
                  and          s3, a6, s7
                  c.slli       tp, 29
                  andi         a4, a7, -1410
                  c.slli       tp, 29
                  c.xor        a0, s1
                  divu         a7, s4, t2
                  add          s4, a1, t4
                  c.and        a0, s0
                  c.add        a2, t6
                  auipc        tp, 368653
                  add          s4, a1, t4
                  remu         sp, s3, s7
                  c.srai       s0, 8
                  c.andi       a3, 13
                  slt          s3, a6, a0
                  srai         a4, ra, 3
                  slti         sp, a1, 426
                  mul          s7, t5, a5
                  c.and        a0, s0
                  c.lui        s10, 18
                  slli         t1, ra, 5
                  c.srli       a0, 16
                  c.xor        a0, s1
                  slli         t1, ra, 5
                  addi         s3, s2, -1824
                  c.sub        a0, a1
                  sub          sp, t0, a2
                  c.mv         s6, s5
                  c.or         a2, s0
                  auipc        tp, 368653
                  c.srli       a0, 16
                  sltiu        a6, ra, -900
                  sll          t2, gp, a3
                  slt          s3, a6, a0
                  addi         s3, s2, -1824
                  nop
                  slli         t1, ra, 5
                  xor          tp, a3, tp
                  andi         a4, a7, -1410
                  xor          tp, a3, tp
                  c.andi       a3, 13
                  sub          sp, t0, a2
                  ori          a6, t4, 27
                  sltiu        a6, ra, -900
                  sra          a3, t2, s2
                  divu         a7, s4, t2
                  mulh         s8, zero, tp
                  mulhsu       ra, t3, a0
                  xori         sp, ra, -1938
                  srl          t4, s1, t1
                  slti         sp, a1, 426
                  slli         t1, ra, 5
                  remu         sp, s3, s7
                  sltiu        a6, ra, -900
                  auipc        tp, 368653
                  ori          a6, t4, 27
                  srai         a4, ra, 3
                  c.and        a0, s0
                  c.slli       tp, 29
                  or           t1, a5, t0
                  slti         sp, a1, 426
                  remu         sp, s3, s7
                  nop
                  sltu         s6, s9, sp
                  c.sub        a0, a1
                  slti         sp, a1, 426
                  slt          s3, a6, a0
                  sra          a3, t2, s2
                  c.slli       tp, 29
                  c.srli       a0, 16
                  auipc        tp, 368653
                  srai         a4, ra, 3
                  c.add        a2, t6
                  sra          a3, t2, s2
                  slli         t1, ra, 5
                  mulh         s8, zero, tp
                  c.andi       a3, 13
                  mulhsu       ra, t3, a0
                  add          s4, a1, t4
                  slli         t1, ra, 5
                  srli         s4, s3, 13
                  srl          t4, s1, t1
                  c.add        a2, t6
                  andi         a4, a7, -1410
                  c.slli       tp, 29
                  c.slli       tp, 29
                  ori          a6, t4, 27
                  c.srai       s0, 8
                  rem          t1, s7, s2
                  srli         s4, s3, 13
                  divu         a7, s4, t2
                  c.addi       s7, -1
                  c.slli       tp, 29
                  c.lui        s10, 18
                  c.xor        a0, s1
                  remu         sp, s3, s7
                  srai         a4, ra, 3
                  c.addi4spn   a0, sp, 368
                  remu         sp, s3, s7
                  sltiu        a6, ra, -900
                  c.xor        a0, s1
                  mulh         s8, zero, tp
                  mulhu        a5, a3, t5
                  sll          t2, gp, a3
                  rem          t1, s7, s2
                  nop
                  div          t3, sp, t0
                  c.addi       s7, -1
                  add          s4, a1, t4
                  lui          a7, 1036702
                  c.and        a0, s0
                  xor          tp, a3, tp
                  ori          a6, t4, 27
                  mulhsu       ra, t3, a0
                  srl          t4, s1, t1
                  div          t3, sp, t0
                  lui          a7, 1036702
                  c.addi16sp   sp, 256
                  lui          a7, 1036702
                  auipc        tp, 368653
                  mulhsu       ra, t3, a0
                  sra          a3, t2, s2
                  add          s4, a1, t4
                  c.xor        a0, s1
                  remu         sp, s3, s7
                  auipc        tp, 368653
                  c.or         a2, s0
                  c.andi       a3, 13
                  nop
                  nop
                  srl          t4, s1, t1
                  slt          s3, a6, a0
                  mulh         s8, zero, tp
                  rem          t1, s7, s2
                  lui          a7, 1036702
                  c.slli       tp, 29
                  c.nop
                  c.xor        a0, s1
                  xor          tp, a3, tp
                  c.add        a2, t6
                  c.addi       s7, -1
                  mulh         s8, zero, tp
                  c.xor        a0, s1
                  srai         a4, ra, 3
                  addi         s3, s2, -1824
                  c.lui        s10, 18
                  c.andi       a3, 13
                  divu         a7, s4, t2
                  c.li         s3, 9
                  c.andi       a3, 13
                  mul          s7, t5, a5
                  mul          s7, t5, a5
                  xor          tp, a3, tp
                  c.srli       a0, 16
                  sltu         s6, s9, sp
                  c.add        a2, t6
                  c.or         a2, s0
                  c.addi16sp   sp, 256
                  c.srli       a0, 16
                  sltu         s6, s9, sp
                  xori         sp, ra, -1938
                  c.xor        a0, s1
                  addi         s3, s2, -1824
                  addi         s3, s2, -1824
                  mulhu        a5, a3, t5
                  slt          s3, a6, a0
                  c.and        a0, s0
                  and          s3, a6, s7
                  add          s4, a1, t4
                  sra          a3, t2, s2
                  c.srai       s0, 8
                  sltu         s6, s9, sp
                  c.srli       a0, 16
                  sra          a3, t2, s2
                  mulh         s8, zero, tp
                  remu         sp, s3, s7
                  c.li         s3, 9
                  mulhsu       ra, t3, a0
                  c.addi16sp   sp, 256
                  slt          s3, a6, a0
                  or           t1, a5, t0
                  rem          t1, s7, s2
                  c.and        a0, s0
                  xor          tp, a3, tp
                  c.sub        a0, a1
                  div          t3, sp, t0
                  c.add        a2, t6
                  c.add        a2, t6
                  c.addi       s7, -1
                  sub          sp, t0, a2
                  c.lui        s10, 18
                  sltiu        a6, ra, -900
                  sltiu        a6, ra, -900
                  srl          t4, s1, t1
                  c.addi16sp   sp, 256
                  c.andi       a3, 13
                  c.srli       a0, 16
                  sltu         s6, s9, sp
                  c.addi4spn   a0, sp, 368
                  mulh         s8, zero, tp
                  mulhu        a5, a3, t5
                  sltu         s6, s9, sp
                  srli         s4, s3, 13
                  mul          s7, t5, a5
                  and          s3, a6, s7
                  slti         sp, a1, 426
                  rem          t1, s7, s2
                  mulh         s8, zero, tp
                  slti         sp, a1, 426
                  c.addi       s7, -1
                  c.add        a2, t6
                  lui          a7, 1036702
                  c.mv         s6, s5
                  nop
                  nop
                  slti         sp, a1, 426
                  srl          t4, s1, t1
                  divu         a7, s4, t2
                  auipc        tp, 368653
                  rem          t1, s7, s2
                  mulh         s8, zero, tp
                  c.li         s3, 9
                  ori          a6, t4, 27
                  c.andi       a3, 13
                  xor          tp, a3, tp
                  c.srai       s0, 8
                  mulh         s8, zero, tp
                  remu         sp, s3, s7
                  c.nop
                  slti         sp, a1, 426
                  or           t1, a5, t0
                  slti         sp, a1, 426
                  mulhu        a5, a3, t5
                  rem          t1, s7, s2
                  divu         a7, s4, t2
                  li           sp, 0x4ca06317 #start riscv_int_numeric_corner_stream_9
                  li           t1, 0xffffffff
                  li           s2, 0x9c1f8833
                  li           t0, 0x80000000
                  li           ra, 0x864934b3
                  li           s9, 0xffffffff
                  li           a7, 0x80000000
                  li           t6, 0xfdd3a9df
                  li           a3, 0xc8858d2a
                  li           t4, 0x2631f1c5
                  add          t1, s2, s2
                  div          a3, t0, a7
                  nop
                  addi         t0, t0, -1824
                  divu         ra, a3, s9
                  mul          a7, a7, s9
                  rem          s2, s9, t0
                  mulh         s2, ra, a3
                  mul          a7, a7, s9
                  mulhsu       sp, s9, a7
                  addi         t0, t0, -1824
                  add          t1, s2, s2
                  add          t1, s2, s2
                  rem          s2, s9, t0
                  mulh         s2, ra, a3
                  add          t1, s2, s2
                  mulh         s2, ra, a3
                  remu         t0, t1, s9
                  div          a3, t0, a7 #end riscv_int_numeric_corner_stream_9
                  slt          s3, a6, a0
                  c.sub        a0, a1
                  lui          a7, 1036702
                  rem          t1, s7, s2
                  c.addi16sp   sp, 256
                  c.srli       a0, 16
                  sub          sp, t0, a2
                  c.add        a2, t6
                  rem          t1, s7, s2
                  div          t3, sp, t0
                  c.addi       s7, -1
                  c.and        a0, s0
                  add          s4, a1, t4
                  xori         sp, ra, -1938
                  c.addi16sp   sp, 256
                  c.mv         s6, s5
                  mul          s7, t5, a5
                  ori          a6, t4, 27
                  c.add        a2, t6
                  c.addi       s7, -1
                  srl          t4, s1, t1
                  sub          sp, t0, a2
                  srai         a4, ra, 3
                  ori          a6, t4, 27
                  andi         a4, a7, -1410
                  c.sub        a0, a1
                  and          s3, a6, s7
                  c.sub        a0, a1
                  sra          a3, t2, s2
                  sra          a3, t2, s2
                  mulhu        a5, a3, t5
                  c.add        a2, t6
                  srli         s4, s3, 13
                  nop
                  srli         s4, s3, 13
                  c.nop
                  c.lui        s10, 18
                  add          s4, a1, t4
                  c.and        a0, s0
                  c.li         s3, 9
                  or           t1, a5, t0
                  andi         a4, a7, -1410
                  lui          a7, 1036702
                  sub          sp, t0, a2
                  c.addi4spn   a0, sp, 368
                  srli         s4, s3, 13
                  srli         s4, s3, 13
                  sll          t2, gp, a3
                  div          t3, sp, t0
                  c.addi4spn   a0, sp, 368
                  c.xor        a0, s1
                  srli         s4, s3, 13
                  c.lui        s10, 18
                  srli         s4, s3, 13
                  c.andi       a3, 13
                  slt          s3, a6, a0
                  c.addi16sp   sp, 256
                  mul          s7, t5, a5
                  lui          a7, 1036702
                  sub          sp, t0, a2
                  div          t3, sp, t0
                  rem          t1, s7, s2
                  div          t3, sp, t0
                  c.or         a2, s0
                  slti         sp, a1, 426
                  c.slli       tp, 29
                  srl          t4, s1, t1
                  xor          tp, a3, tp
                  c.addi4spn   a0, sp, 368
                  add          s4, a1, t4
                  divu         a7, s4, t2
                  srai         a4, ra, 3
                  divu         a7, s4, t2
                  and          s3, a6, s7
                  c.li         s3, 9
                  mul          s7, t5, a5
                  c.sub        a0, a1
                  sltu         s6, s9, sp
                  remu         sp, s3, s7
                  slti         sp, a1, 426
                  sll          t2, gp, a3
                  mulhu        a5, a3, t5
                  nop
                  xori         sp, ra, -1938
                  c.and        a0, s0
                  c.srli       a0, 16
                  sra          a3, t2, s2
                  sll          t2, gp, a3
                  c.nop
                  srai         a4, ra, 3
                  sltu         s6, s9, sp
                  c.addi4spn   a0, sp, 368
                  sll          t2, gp, a3
                  div          t3, sp, t0
                  addi         s3, s2, -1824
                  mul          s7, t5, a5
                  sub          sp, t0, a2
                  nop
                  sub          sp, t0, a2
                  sub          sp, t0, a2
                  sltiu        a6, ra, -900
                  c.lui        s10, 18
                  c.srai       s0, 8
                  andi         a4, a7, -1410
                  sra          a3, t2, s2
                  mulhsu       ra, t3, a0
                  xori         sp, ra, -1938
                  nop
                  divu         a7, s4, t2
                  mulhu        a5, a3, t5
                  slti         sp, a1, 426
                  ori          a6, t4, 27
                  c.addi       s7, -1
                  srli         s4, s3, 13
                  c.add        a2, t6
                  c.sub        a0, a1
                  srl          t4, s1, t1
                  c.li         s3, 9
                  and          s3, a6, s7
                  srl          t4, s1, t1
                  slti         sp, a1, 426
                  slli         t1, ra, 5
                  slli         t1, ra, 5
                  c.and        a0, s0
                  mulh         s8, zero, tp
                  mulh         s8, zero, tp
                  c.srli       a0, 16
                  rem          t1, s7, s2
                  addi         s3, s2, -1824
                  mulhu        a5, a3, t5
                  slti         sp, a1, 426
                  c.srli       a0, 16
                  c.lui        s10, 18
                  c.lui        s10, 18
                  mulh         s8, zero, tp
                  ori          a6, t4, 27
                  c.srli       a0, 16
                  sll          t2, gp, a3
                  sub          sp, t0, a2
                  c.add        a2, t6
                  c.li         s3, 9
                  mulh         s8, zero, tp
                  c.nop
                  srai         a4, ra, 3
                  c.slli       tp, 29
                  andi         a4, a7, -1410
                  c.nop
                  c.mv         s6, s5
                  srl          t4, s1, t1
                  sub          sp, t0, a2
                  srl          t4, s1, t1
                  sltiu        a6, ra, -900
                  nop
                  c.addi       s7, -1
                  c.sub        a0, a1
                  c.sub        a0, a1
                  c.add        a2, t6
                  c.sub        a0, a1
                  or           t1, a5, t0
                  c.nop
                  c.or         a2, s0
                  slti         sp, a1, 426
                  sub          sp, t0, a2
                  ori          a6, t4, 27
                  or           t1, a5, t0
                  nop
                  slt          s3, a6, a0
                  c.addi4spn   a0, sp, 368
                  sra          a3, t2, s2
                  auipc        tp, 368653
                  and          s3, a6, s7
                  c.srai       s0, 8
                  nop
                  srl          t4, s1, t1
                  c.or         a2, s0
                  sll          t2, gp, a3
                  divu         a7, s4, t2
                  mul          s7, t5, a5
                  xori         sp, ra, -1938
                  xori         sp, ra, -1938
                  xori         sp, ra, -1938
                  sub          sp, t0, a2
                  c.addi       s7, -1
                  slli         t1, ra, 5
                  sltiu        a6, ra, -900
                  c.andi       a3, 13
                  sll          t2, gp, a3
                  srai         a4, ra, 3
                  c.or         a2, s0
                  c.lui        s10, 18
                  c.or         a2, s0
                  c.srai       s0, 8
                  sltiu        a6, ra, -900
                  mulhu        a5, a3, t5
                  c.addi4spn   a0, sp, 368
                  srl          t4, s1, t1
                  slti         sp, a1, 426
                  c.mv         s6, s5
                  mulh         s8, zero, tp
                  c.slli       tp, 29
                  rem          t1, s7, s2
                  slli         t1, ra, 5
                  xori         sp, ra, -1938
                  andi         a4, a7, -1410
                  c.lui        s10, 18
                  c.xor        a0, s1
                  c.or         a2, s0
                  or           t1, a5, t0
                  mulh         s8, zero, tp
                  c.or         a2, s0
                  slti         sp, a1, 426
                  c.lui        s10, 18
                  c.li         s3, 9
                  c.li         s3, 9
                  divu         a7, s4, t2
                  sltu         s6, s9, sp
                  nop
                  srli         s4, s3, 13
                  addi         s3, s2, -1824
                  add          s4, a1, t4
                  xor          tp, a3, tp
                  lui          a7, 1036702
                  andi         a4, a7, -1410
                  slli         t1, ra, 5
                  nop
                  c.andi       a3, 13
                  ori          a6, t4, 27
                  lui          a7, 1036702
                  c.andi       a3, 13
                  srli         s4, s3, 13
                  c.and        a0, s0
                  add          s4, a1, t4
                  auipc        tp, 368653
                  addi         s3, s2, -1824
                  li           a5, 0xaa1640a9 #start riscv_int_numeric_corner_stream_37
                  li           s3, 0x0
                  li           tp, 0x80000000
                  li           gp, 0x80000000
                  li           s0, 0xffffffff
                  li           t1, 0x80000000
                  li           a0, 0x0
                  li           sp, 0xffffffff
                  li           a6, 0x667d025e
                  li           s6, 0x6efa1585
                  addi         tp, tp, -1824
                  mulhu        t1, a6, s3
                  auipc        s0, 368653
                  mul          a0, a0, a6
                  mulh         a5, sp, s0
                  divu         sp, s0, a6
                  mulhu        t1, a6, s3
                  div          s0, tp, a0
                  mulhu        t1, a6, s3
                  mulhu        t1, a6, s3
                  addi         tp, tp, -1824
                  addi         tp, tp, -1824
                  div          s0, tp, a0
                  mulhu        t1, a6, s3
                  mul          a0, a0, a6
                  mulhsu       gp, a6, a0
                  add          t1, a5, a5
                  mul          a0, a0, a6
                  addi         tp, tp, -1824
                  mulhsu       gp, a6, a0
                  sub          tp, a0, a5
                  addi         tp, tp, -1824
                  lui          sp, 1036702
                  mulhsu       gp, a6, a0 #end riscv_int_numeric_corner_stream_37
                  c.addi4spn   a0, sp, 368
                  c.addi16sp   sp, 256
                  c.srai       s0, 8
                  auipc        tp, 368653
                  addi         s3, s2, -1824
                  c.addi4spn   a0, sp, 368
                  div          t3, sp, t0
                  and          s3, a6, s7
                  addi         s3, s2, -1824
                  slli         t1, ra, 5
                  c.srli       a0, 16
                  sltiu        a6, ra, -900
                  add          s4, a1, t4
                  c.and        a0, s0
                  ori          a6, t4, 27
                  c.li         s3, 9
                  lui          a7, 1036702
                  sub          sp, t0, a2
                  c.addi       s7, -1
                  sra          a3, t2, s2
                  c.addi       s7, -1
                  and          s3, a6, s7
                  addi         s3, s2, -1824
                  slti         sp, a1, 426
                  addi         s3, s2, -1824
                  c.add        a2, t6
                  addi         s3, s2, -1824
                  remu         sp, s3, s7
                  lui          a7, 1036702
                  divu         a7, s4, t2
                  or           t1, a5, t0
                  c.addi4spn   a0, sp, 368
                  addi         s3, s2, -1824
                  rem          t1, s7, s2
                  and          s3, a6, s7
                  sltu         s6, s9, sp
                  sltiu        a6, ra, -900
                  c.and        a0, s0
                  mulhu        a5, a3, t5
                  c.slli       tp, 29
                  mulhsu       ra, t3, a0
                  addi         s3, s2, -1824
                  slti         sp, a1, 426
                  srl          t4, s1, t1
                  srl          t4, s1, t1
                  lui          a7, 1036702
                  sltu         s6, s9, sp
                  c.addi16sp   sp, 256
                  mulhu        a5, a3, t5
                  add          s4, a1, t4
                  divu         a7, s4, t2
                  srl          t4, s1, t1
                  c.mv         s6, s5
                  sltu         s6, s9, sp
                  remu         sp, s3, s7
                  srli         s4, s3, 13
                  c.slli       tp, 29
                  sra          a3, t2, s2
                  and          s3, a6, s7
                  c.or         a2, s0
                  remu         sp, s3, s7
                  mulhsu       ra, t3, a0
                  srai         a4, ra, 3
                  nop
                  mulhu        a5, a3, t5
                  c.srai       s0, 8
                  srl          t4, s1, t1
                  c.addi4spn   a0, sp, 368
                  xori         sp, ra, -1938
                  c.srai       s0, 8
                  c.srli       a0, 16
                  c.addi       s7, -1
                  slt          s3, a6, a0
                  c.addi       s7, -1
                  xori         sp, ra, -1938
                  c.lui        s10, 18
                  c.andi       a3, 13
                  srai         a4, ra, 3
                  c.li         s3, 9
                  c.and        a0, s0
                  or           t1, a5, t0
                  mul          s7, t5, a5
                  xor          tp, a3, tp
                  add          s4, a1, t4
                  c.mv         s6, s5
                  c.xor        a0, s1
                  slti         sp, a1, 426
                  nop
                  mul          s7, t5, a5
                  slt          s3, a6, a0
                  mul          s7, t5, a5
                  c.lui        s10, 18
                  c.addi4spn   a0, sp, 368
                  divu         a7, s4, t2
                  c.addi4spn   a0, sp, 368
                  c.xor        a0, s1
                  c.xor        a0, s1
                  mulh         s8, zero, tp
                  c.addi       s7, -1
                  c.add        a2, t6
                  div          t3, sp, t0
                  srl          t4, s1, t1
                  ori          a6, t4, 27
                  mul          s7, t5, a5
                  div          t3, sp, t0
                  sub          sp, t0, a2
                  slli         t1, ra, 5
                  and          s3, a6, s7
                  c.addi       s7, -1
                  mulh         s8, zero, tp
                  lui          a7, 1036702
                  addi         s3, s2, -1824
                  c.and        a0, s0
                  xori         sp, ra, -1938
                  srli         s4, s3, 13
                  srai         a4, ra, 3
                  rem          t1, s7, s2
                  div          t3, sp, t0
                  c.addi16sp   sp, 256
                  div          t3, sp, t0
                  rem          t1, s7, s2
                  mul          s7, t5, a5
                  sra          a3, t2, s2
                  or           t1, a5, t0
                  c.addi4spn   a0, sp, 368
                  or           t1, a5, t0
                  sltiu        a6, ra, -900
                  remu         sp, s3, s7
                  addi         s3, s2, -1824
                  c.lui        s10, 18
                  sra          a3, t2, s2
                  sll          t2, gp, a3
                  c.addi16sp   sp, 256
                  c.nop
                  c.mv         s6, s5
                  slt          s3, a6, a0
                  c.andi       a3, 13
                  c.slli       tp, 29
                  xori         sp, ra, -1938
                  add          s4, a1, t4
                  c.addi       s7, -1
                  c.addi4spn   a0, sp, 368
                  c.xor        a0, s1
                  add          s4, a1, t4
                  srli         s4, s3, 13
                  remu         sp, s3, s7
                  c.andi       a3, 13
                  c.li         s3, 9
                  remu         sp, s3, s7
                  mul          s7, t5, a5
                  c.add        a2, t6
                  c.add        a2, t6
                  auipc        tp, 368653
                  andi         a4, a7, -1410
                  c.addi16sp   sp, 256
                  div          t3, sp, t0
                  and          s3, a6, s7
                  slt          s3, a6, a0
                  c.addi16sp   sp, 256
                  sltu         s6, s9, sp
                  slti         sp, a1, 426
                  c.sub        a0, a1
                  mulhu        a5, a3, t5
                  c.addi       s7, -1
                  and          s3, a6, s7
                  c.or         a2, s0
                  c.mv         s6, s5
                  c.and        a0, s0
                  c.li         s3, 9
                  rem          t1, s7, s2
                  c.and        a0, s0
                  mulhu        a5, a3, t5
                  div          t3, sp, t0
                  div          t3, sp, t0
                  srl          t4, s1, t1
                  c.nop
                  or           t1, a5, t0
                  xor          tp, a3, tp
                  sltu         s6, s9, sp
                  srl          t4, s1, t1
                  div          t3, sp, t0
                  andi         a4, a7, -1410
                  and          s3, a6, s7
                  c.slli       tp, 29
                  divu         a7, s4, t2
                  c.andi       a3, 13
                  addi         s3, s2, -1824
                  c.addi       s7, -1
                  div          t3, sp, t0
                  c.addi4spn   a0, sp, 368
                  sltu         s6, s9, sp
                  c.andi       a3, 13
                  mulhu        a5, a3, t5
                  nop
                  srl          t4, s1, t1
                  c.srli       a0, 16
                  c.nop
                  sub          sp, t0, a2
                  and          s3, a6, s7
                  c.mv         s6, s5
                  sltu         s6, s9, sp
                  c.andi       a3, 13
                  sub          sp, t0, a2
                  slli         t1, ra, 5
                  andi         a4, a7, -1410
                  mulhu        a5, a3, t5
                  c.xor        a0, s1
                  and          s3, a6, s7
                  sltiu        a6, ra, -900
                  addi         s3, s2, -1824
                  slt          s3, a6, a0
                  sub          sp, t0, a2
                  xor          tp, a3, tp
                  mul          s7, t5, a5
                  srai         a4, ra, 3
                  auipc        tp, 368653
                  or           t1, a5, t0
                  mulhu        a5, a3, t5
                  addi         s3, s2, -1824
                  ori          a6, t4, 27
                  nop
                  sltu         s6, s9, sp
                  sra          a3, t2, s2
                  sub          sp, t0, a2
                  srli         s4, s3, 13
                  c.xor        a0, s1
                  addi         s3, s2, -1824
                  lui          a7, 1036702
                  srli         s4, s3, 13
                  mulhu        a5, a3, t5
                  div          t3, sp, t0
                  nop
                  srl          t4, s1, t1
                  addi         s3, s2, -1824
                  or           t1, a5, t0
                  c.li         s3, 9
                  ori          a6, t4, 27
                  addi         s3, s2, -1824
                  lui          a7, 1036702
                  divu         a7, s4, t2
                  rem          t1, s7, s2
                  and          s3, a6, s7
                  srl          t4, s1, t1
                  c.slli       tp, 29
                  lui          a7, 1036702
                  remu         sp, s3, s7
                  sra          a3, t2, s2
                  add          s4, a1, t4
                  add          s4, a1, t4
                  slt          s3, a6, a0
                  or           t1, a5, t0
                  srai         a4, ra, 3
                  ori          a6, t4, 27
                  sll          t2, gp, a3
                  nop
                  mulh         s8, zero, tp
                  c.add        a2, t6
                  slli         t1, ra, 5
                  c.lui        s10, 18
                  add          s4, a1, t4
                  andi         a4, a7, -1410
                  addi         s3, s2, -1824
                  c.slli       tp, 29
                  c.li         s3, 9
                  xori         sp, ra, -1938
                  add          s4, a1, t4
                  lui          a7, 1036702
                  ori          a6, t4, 27
                  c.addi       s7, -1
                  mulh         s8, zero, tp
                  c.or         a2, s0
                  sltiu        a6, ra, -900
                  mulhu        a5, a3, t5
                  mulhsu       ra, t3, a0
                  c.add        a2, t6
                  slti         sp, a1, 426
                  ori          a6, t4, 27
                  c.addi16sp   sp, 256
                  c.srai       s0, 8
                  c.andi       a3, 13
                  xori         sp, ra, -1938
                  nop
                  c.nop
                  slt          s3, a6, a0
                  sltu         s6, s9, sp
                  mulhu        a5, a3, t5
                  c.addi4spn   a0, sp, 368
                  mulh         s8, zero, tp
                  sltiu        a6, ra, -900
                  mulhsu       ra, t3, a0
                  mulhsu       ra, t3, a0
                  srai         a4, ra, 3
                  srai         a4, ra, 3
                  srai         a4, ra, 3
                  div          t3, sp, t0
                  c.slli       tp, 29
                  mulhsu       ra, t3, a0
                  c.li         s3, 9
                  c.srli       a0, 16
                  mulhu        a5, a3, t5
                  sll          t2, gp, a3
                  ori          a6, t4, 27
                  c.addi16sp   sp, 256
                  c.sub        a0, a1
                  nop
                  slt          s3, a6, a0
                  c.li         s3, 9
                  mulh         s8, zero, tp
                  sra          a3, t2, s2
                  sra          a3, t2, s2
                  mul          s7, t5, a5
                  xori         sp, ra, -1938
                  c.nop
                  remu         sp, s3, s7
                  sll          t2, gp, a3
                  addi         s3, s2, -1824
                  sltiu        a6, ra, -900
                  mulhsu       ra, t3, a0
                  auipc        tp, 368653
                  remu         sp, s3, s7
                  c.srli       a0, 16
                  c.addi4spn   a0, sp, 368
                  xor          tp, a3, tp
                  slti         sp, a1, 426
                  c.sub        a0, a1
                  c.slli       tp, 29
                  c.lui        s10, 18
                  c.slli       tp, 29
                  sll          t2, gp, a3
                  and          s3, a6, s7
                  xor          tp, a3, tp
                  c.and        a0, s0
                  mulhsu       ra, t3, a0
                  addi         s3, s2, -1824
                  srl          t4, s1, t1
                  c.andi       a3, 13
                  sltu         s6, s9, sp
                  c.andi       a3, 13
                  xori         sp, ra, -1938
                  c.mv         s6, s5
                  c.sub        a0, a1
                  mulhu        a5, a3, t5
                  divu         a7, s4, t2
                  or           t1, a5, t0
                  srai         a4, ra, 3
                  and          s3, a6, s7
                  sll          t2, gp, a3
                  div          t3, sp, t0
                  c.or         a2, s0
                  rem          t1, s7, s2
                  c.addi4spn   a0, sp, 368
                  c.mv         s6, s5
                  srai         a4, ra, 3
                  xori         sp, ra, -1938
                  srai         a4, ra, 3
                  c.mv         s6, s5
                  andi         a4, a7, -1410
                  andi         a4, a7, -1410
                  div          t3, sp, t0
                  c.lui        s10, 18
                  c.xor        a0, s1
                  divu         a7, s4, t2
                  div          t3, sp, t0
                  and          s3, a6, s7
                  c.and        a0, s0
                  auipc        tp, 368653
                  sll          t2, gp, a3
                  sltiu        a6, ra, -900
                  xor          tp, a3, tp
                  srai         a4, ra, 3
                  sltu         s6, s9, sp
                  sll          t2, gp, a3
                  c.sub        a0, a1
                  c.andi       a3, 13
                  srai         a4, ra, 3
                  mulhu        a5, a3, t5
                  c.or         a2, s0
                  nop
                  mul          s7, t5, a5
                  c.or         a2, s0
                  c.andi       a3, 13
                  c.andi       a3, 13
                  slli         t1, ra, 5
                  c.addi16sp   sp, 256
                  addi         s3, s2, -1824
                  srl          t4, s1, t1
                  c.andi       a3, 13
                  divu         a7, s4, t2
                  and          s3, a6, s7
                  slt          s3, a6, a0
                  c.li         s3, 9
                  or           t1, a5, t0
                  c.lui        s10, 18
                  srai         a4, ra, 3
                  c.lui        s10, 18
                  ori          a6, t4, 27
                  sltiu        a6, ra, -900
                  c.nop
                  rem          t1, s7, s2
                  auipc        tp, 368653
                  srli         s4, s3, 13
                  sltu         s6, s9, sp
                  c.srai       s0, 8
                  andi         a4, a7, -1410
                  rem          t1, s7, s2
                  c.srli       a0, 16
                  c.andi       a3, 13
                  sub          sp, t0, a2
                  c.addi16sp   sp, 256
                  slt          s3, a6, a0
                  xori         sp, ra, -1938
                  mulh         s8, zero, tp
                  sub          sp, t0, a2
                  c.addi16sp   sp, 256
                  c.li         s3, 9
                  c.lui        s10, 18
                  mul          s7, t5, a5
                  c.lui        s10, 18
                  divu         a7, s4, t2
                  c.addi16sp   sp, 256
                  add          s4, a1, t4
                  sltu         s6, s9, sp
                  div          t3, sp, t0
                  slt          s3, a6, a0
                  xor          tp, a3, tp
                  mulhu        a5, a3, t5
                  slli         t1, ra, 5
                  c.addi16sp   sp, 256
                  auipc        tp, 368653
                  nop
                  c.sub        a0, a1
                  srai         a4, ra, 3
                  add          s4, a1, t4
                  mulhu        a5, a3, t5
                  c.add        a2, t6
                  c.or         a2, s0
                  srl          t4, s1, t1
                  c.nop
                  c.li         s3, 9
                  lui          a7, 1036702
                  mul          s7, t5, a5
                  addi         s3, s2, -1824
                  remu         sp, s3, s7
                  srl          t4, s1, t1
                  sub          sp, t0, a2
                  xori         sp, ra, -1938
                  sltiu        a6, ra, -900
                  and          s3, a6, s7
                  sltiu        a6, ra, -900
                  add          s4, a1, t4
                  slli         t1, ra, 5
                  mul          s7, t5, a5
                  c.add        a2, t6
                  add          s4, a1, t4
                  lui          a7, 1036702
                  and          s3, a6, s7
                  sra          a3, t2, s2
                  divu         a7, s4, t2
                  c.nop
                  div          t3, sp, t0
                  sra          a3, t2, s2
                  remu         sp, s3, s7
                  c.srli       a0, 16
                  xor          tp, a3, tp
                  remu         sp, s3, s7
                  c.slli       tp, 29
                  lui          a7, 1036702
                  ori          a6, t4, 27
                  c.or         a2, s0
                  c.mv         s6, s5
                  nop
                  divu         a7, s4, t2
                  srai         a4, ra, 3
                  c.addi16sp   sp, 256
                  rem          t1, s7, s2
                  c.addi16sp   sp, 256
                  c.mv         s6, s5
                  ori          a6, t4, 27
                  slli         t1, ra, 5
                  xori         sp, ra, -1938
                  ori          a6, t4, 27
                  mul          s7, t5, a5
                  c.srai       s0, 8
                  c.srai       s0, 8
                  c.mv         s6, s5
                  c.addi16sp   sp, 256
                  mulhu        a5, a3, t5
                  lui          a7, 1036702
                  nop
                  mulhsu       ra, t3, a0
                  div          t3, sp, t0
                  srli         s4, s3, 13
                  c.add        a2, t6
                  srai         a4, ra, 3
                  andi         a4, a7, -1410
                  c.addi4spn   a0, sp, 368
                  remu         sp, s3, s7
                  div          t3, sp, t0
                  c.addi4spn   a0, sp, 368
                  c.li         s3, 9
                  rem          t1, s7, s2
                  c.srai       s0, 8
                  c.lui        s10, 18
                  auipc        tp, 368653
                  c.addi       s7, -1
                  slti         sp, a1, 426
                  sltu         s6, s9, sp
                  c.add        a2, t6
                  c.slli       tp, 29
                  sra          a3, t2, s2
                  nop
                  mulhu        a5, a3, t5
                  sltiu        a6, ra, -900
                  c.lui        s10, 18
                  c.slli       tp, 29
                  srai         a4, ra, 3
                  auipc        tp, 368653
                  mul          s7, t5, a5
                  mulh         s8, zero, tp
                  c.addi16sp   sp, 256
                  mulh         s8, zero, tp
                  add          s4, a1, t4
                  c.lui        s10, 18
                  srl          t4, s1, t1
                  auipc        tp, 368653
                  c.add        a2, t6
                  c.nop
                  divu         a7, s4, t2
                  sltiu        a6, ra, -900
                  auipc        tp, 368653
                  mulh         s8, zero, tp
                  xori         sp, ra, -1938
                  c.addi       s7, -1
                  or           t1, a5, t0
                  divu         a7, s4, t2
                  mulh         s8, zero, tp
                  nop
                  auipc        tp, 368653
                  c.lui        s10, 18
                  div          t3, sp, t0
                  divu         a7, s4, t2
                  div          t3, sp, t0
                  mul          s7, t5, a5
                  mulhsu       ra, t3, a0
                  sll          t2, gp, a3
                  or           t1, a5, t0
                  c.xor        a0, s1
                  nop
                  slti         sp, a1, 426
                  sltu         s6, s9, sp
                  c.srli       a0, 16
                  srli         s4, s3, 13
                  nop
                  divu         a7, s4, t2
                  sltu         s6, s9, sp
                  auipc        tp, 368653
                  c.xor        a0, s1
                  c.andi       a3, 13
                  c.addi16sp   sp, 256
                  ori          a6, t4, 27
                  c.add        a2, t6
                  c.xor        a0, s1
                  c.addi       s7, -1
                  slt          s3, a6, a0
                  c.addi       s7, -1
                  c.addi16sp   sp, 256
                  and          s3, a6, s7
                  lui          a7, 1036702
                  slti         sp, a1, 426
                  c.sub        a0, a1
                  andi         a4, a7, -1410
                  add          s4, a1, t4
                  c.slli       tp, 29
                  add          s4, a1, t4
                  c.andi       a3, 13
                  nop
                  mulhsu       ra, t3, a0
                  add          s4, a1, t4
                  xori         sp, ra, -1938
                  c.nop
                  c.add        a2, t6
                  c.slli       tp, 29
                  mulhsu       ra, t3, a0
                  srl          t4, s1, t1
                  rem          t1, s7, s2
                  and          s3, a6, s7
                  addi         s3, s2, -1824
                  nop
                  nop
                  or           t1, a5, t0
                  sra          a3, t2, s2
                  srai         a4, ra, 3
                  c.add        a2, t6
                  andi         a4, a7, -1410
                  c.and        a0, s0
                  remu         sp, s3, s7
                  rem          t1, s7, s2
                  c.addi16sp   sp, 256
                  c.addi16sp   sp, 256
                  srl          t4, s1, t1
                  lui          a7, 1036702
                  add          s4, a1, t4
                  c.nop
                  c.srai       s0, 8
                  c.addi       s7, -1
                  srli         s4, s3, 13
                  c.srli       a0, 16
                  c.addi16sp   sp, 256
                  or           t1, a5, t0
                  nop
                  srli         s4, s3, 13
                  nop
                  sltiu        a6, ra, -900
                  srai         a4, ra, 3
                  rem          t1, s7, s2
                  rem          t1, s7, s2
                  xori         sp, ra, -1938
                  sltu         s6, s9, sp
                  c.addi4spn   a0, sp, 368
                  nop
                  nop
                  mulhu        a5, a3, t5
                  sltu         s6, s9, sp
                  or           t1, a5, t0
                  srai         a4, ra, 3
                  c.slli       tp, 29
                  c.srai       s0, 8
                  slt          s3, a6, a0
                  c.nop
                  c.xor        a0, s1
                  c.andi       a3, 13
                  sra          a3, t2, s2
                  xori         sp, ra, -1938
                  mul          s7, t5, a5
                  c.andi       a3, 13
                  add          s4, a1, t4
                  c.addi16sp   sp, 256
                  c.srli       a0, 16
                  c.lui        s10, 18
                  c.or         a2, s0
                  srai         a4, ra, 3
                  divu         a7, s4, t2
                  c.add        a2, t6
                  remu         sp, s3, s7
                  c.andi       a3, 13
                  sra          a3, t2, s2
                  c.and        a0, s0
                  sltu         s6, s9, sp
                  c.lui        s10, 18
                  andi         a4, a7, -1410
                  slt          s3, a6, a0
                  c.lui        s10, 18
                  sll          t2, gp, a3
                  c.sub        a0, a1
                  c.slli       tp, 29
                  c.addi16sp   sp, 256
                  c.add        a2, t6
                  sltu         s6, s9, sp
                  remu         sp, s3, s7
                  ori          a6, t4, 27
                  xori         sp, ra, -1938
                  c.andi       a3, 13
                  c.add        a2, t6
                  sltiu        a6, ra, -900
                  mul          s7, t5, a5
                  nop
                  divu         a7, s4, t2
                  xori         sp, ra, -1938
                  sltiu        a6, ra, -900
                  sltu         s6, s9, sp
                  sltiu        a6, ra, -900
                  mulhsu       ra, t3, a0
                  c.andi       a3, 13
                  slti         sp, a1, 426
                  add          s4, a1, t4
                  c.or         a2, s0
                  c.or         a2, s0
                  div          t3, sp, t0
                  c.slli       tp, 29
                  c.li         s3, 9
                  c.slli       tp, 29
                  divu         a7, s4, t2
                  c.slli       tp, 29
                  sltu         s6, s9, sp
                  c.sub        a0, a1
                  c.sub        a0, a1
                  c.sub        a0, a1
                  mul          s7, t5, a5
                  add          s4, a1, t4
                  c.lui        s10, 18
                  xor          tp, a3, tp
                  c.nop
                  c.slli       tp, 29
                  rem          t1, s7, s2
                  srli         s4, s3, 13
                  sltu         s6, s9, sp
                  c.slli       tp, 29
                  xori         sp, ra, -1938
                  c.sub        a0, a1
                  c.srai       s0, 8
                  c.addi16sp   sp, 256
                  c.addi16sp   sp, 256
                  srai         a4, ra, 3
                  andi         a4, a7, -1410
                  c.xor        a0, s1
                  slt          s3, a6, a0
                  c.slli       tp, 29
                  c.and        a0, s0
                  lui          a7, 1036702
                  mul          s7, t5, a5
                  sltu         s6, s9, sp
                  lui          a7, 1036702
                  divu         a7, s4, t2
                  srl          t4, s1, t1
                  c.xor        a0, s1
                  c.nop
                  srai         a4, ra, 3
                  c.add        a2, t6
                  lui          a7, 1036702
                  rem          t1, s7, s2
                  slli         t1, ra, 5
                  sub          sp, t0, a2
                  sub          sp, t0, a2
                  sub          sp, t0, a2
                  lui          a7, 1036702
                  c.xor        a0, s1
                  andi         a4, a7, -1410
                  srl          t4, s1, t1
                  srai         a4, ra, 3
                  c.sub        a0, a1
                  div          t3, sp, t0
                  c.sub        a0, a1
                  div          t3, sp, t0
                  c.addi4spn   a0, sp, 368
                  c.srai       s0, 8
                  slt          s3, a6, a0
                  xor          tp, a3, tp
                  c.add        a2, t6
                  xori         sp, ra, -1938
                  c.nop
                  srl          t4, s1, t1
                  ori          a6, t4, 27
                  rem          t1, s7, s2
                  slli         t1, ra, 5
                  mul          s7, t5, a5
                  xori         sp, ra, -1938
                  lui          a7, 1036702
                  c.xor        a0, s1
                  sub          sp, t0, a2
                  c.slli       tp, 29
                  c.add        a2, t6
                  remu         sp, s3, s7
                  c.addi4spn   a0, sp, 368
                  xor          tp, a3, tp
                  slli         t1, ra, 5
                  srli         s4, s3, 13
                  c.or         a2, s0
                  c.addi       s7, -1
                  c.addi       s7, -1
                  divu         a7, s4, t2
                  slli         t1, ra, 5
                  c.andi       a3, 13
                  c.addi       s7, -1
                  mulhu        a5, a3, t5
                  c.andi       a3, 13
                  mulhu        a5, a3, t5
                  nop
                  nop
                  slli         t1, ra, 5
                  sll          t2, gp, a3
                  or           t1, a5, t0
                  c.li         s3, 9
                  sra          a3, t2, s2
                  li           a2, 0xffffffff #start riscv_int_numeric_corner_stream_29
                  li           t1, 0xffffffff
                  li           s6, 0x80000000
                  li           a5, 0x0
                  li           a6, 0x122d23c0
                  li           s3, 0x80000000
                  li           t2, 0x80000000
                  li           s8, 0x80000000
                  li           a3, 0x513e07a3
                  li           t4, 0x0
                  lui          t1, 1036702
                  mulhsu       t2, s6, a6
                  divu         t1, a5, s6
                  add          a3, s3, s3
                  mulhsu       t2, s6, a6
                  mulhu        a3, s6, s8
                  mulh         s3, t1, a5
                  remu         a2, a3, s6
                  remu         a2, a3, s6
                  mulhu        a3, s6, s8
                  add          a3, s3, s3
                  addi         a2, a2, -1824
                  mulh         s3, t1, a5
                  remu         a2, a3, s6
                  sub          a2, a6, s3
                  mulhu        a3, s6, s8
                  remu         a2, a3, s6
                  div          a5, a2, a6
                  sub          a2, a6, s3
                  remu         a2, a3, s6
                  divu         t1, a5, s6
                  nop
                  sub          a2, a6, s3 #end riscv_int_numeric_corner_stream_29
                  c.addi16sp   sp, 256
                  c.slli       tp, 29
                  sltiu        a6, ra, -900
                  sltiu        a6, ra, -900
                  slli         t1, ra, 5
                  and          s3, a6, s7
                  slt          s3, a6, a0
                  nop
                  c.srai       s0, 8
                  c.add        a2, t6
                  add          s4, a1, t4
                  slli         t1, ra, 5
                  mulhu        a5, a3, t5
                  srai         a4, ra, 3
                  c.and        a0, s0
                  xor          tp, a3, tp
                  c.mv         s6, s5
                  nop
                  nop
                  slli         t1, ra, 5
                  mulh         s8, zero, tp
                  c.addi16sp   sp, 256
                  sltu         s6, s9, sp
                  srli         s4, s3, 13
                  slt          s3, a6, a0
                  c.li         s3, 9
                  mulhu        a5, a3, t5
                  c.lui        s10, 18
                  slt          s3, a6, a0
                  c.slli       tp, 29
                  and          s3, a6, s7
                  slli         t1, ra, 5
                  slli         t1, ra, 5
                  c.andi       a3, 13
                  divu         a7, s4, t2
                  c.mv         s6, s5
                  mulhu        a5, a3, t5
                  srai         a4, ra, 3
                  remu         sp, s3, s7
                  c.srli       a0, 16
                  c.nop
                  slli         t1, ra, 5
                  sltiu        a6, ra, -900
                  nop
                  mul          s7, t5, a5
                  c.add        a2, t6
                  add          s4, a1, t4
                  slti         sp, a1, 426
                  c.sub        a0, a1
                  c.and        a0, s0
                  mul          s7, t5, a5
                  c.srai       s0, 8
                  sll          t2, gp, a3
                  divu         a7, s4, t2
                  srai         a4, ra, 3
                  c.sub        a0, a1
                  auipc        tp, 368653
                  c.andi       a3, 13
                  c.addi16sp   sp, 256
                  c.li         s3, 9
                  sltu         s6, s9, sp
                  c.andi       a3, 13
                  srli         s4, s3, 13
                  sll          t2, gp, a3
                  srai         a4, ra, 3
                  sra          a3, t2, s2
                  c.nop
                  ori          a6, t4, 27
                  addi         s3, s2, -1824
                  or           t1, a5, t0
                  remu         sp, s3, s7
                  mulhsu       ra, t3, a0
                  c.srli       a0, 16
                  mulhu        a5, a3, t5
                  ori          a6, t4, 27
                  srli         s4, s3, 13
                  c.xor        a0, s1
                  sra          a3, t2, s2
                  nop
                  remu         sp, s3, s7
                  addi         s3, s2, -1824
                  c.srai       s0, 8
                  c.slli       tp, 29
                  auipc        tp, 368653
                  c.mv         s6, s5
                  and          s3, a6, s7
                  srli         s4, s3, 13
                  lui          a7, 1036702
                  c.li         s3, 9
                  sra          a3, t2, s2
                  c.srli       a0, 16
                  xori         sp, ra, -1938
                  mulhsu       ra, t3, a0
                  c.addi16sp   sp, 256
                  auipc        tp, 368653
                  and          s3, a6, s7
                  lui          a7, 1036702
                  sll          t2, gp, a3
                  srai         a4, ra, 3
                  srl          t4, s1, t1
                  div          t3, sp, t0
                  lui          a7, 1036702
                  srl          t4, s1, t1
                  c.lui        s10, 18
                  slti         sp, a1, 426
                  sltu         s6, s9, sp
                  c.add        a2, t6
                  div          t3, sp, t0
                  srli         s4, s3, 13
                  c.lui        s10, 18
                  c.addi16sp   sp, 256
                  add          s4, a1, t4
                  sll          t2, gp, a3
                  div          t3, sp, t0
                  nop
                  sub          sp, t0, a2
                  srl          t4, s1, t1
                  slti         sp, a1, 426
                  c.nop
                  mulhu        a5, a3, t5
                  ori          a6, t4, 27
                  c.srli       a0, 16
                  mulhu        a5, a3, t5
                  c.slli       tp, 29
                  remu         sp, s3, s7
                  c.sub        a0, a1
                  xor          tp, a3, tp
                  auipc        tp, 368653
                  c.slli       tp, 29
                  sll          t2, gp, a3
                  c.addi16sp   sp, 256
                  sra          a3, t2, s2
                  c.slli       tp, 29
                  add          s4, a1, t4
                  mulhsu       ra, t3, a0
                  sltu         s6, s9, sp
                  sub          sp, t0, a2
                  rem          t1, s7, s2
                  auipc        tp, 368653
                  ori          a6, t4, 27
                  sltiu        a6, ra, -900
                  and          s3, a6, s7
                  srli         s4, s3, 13
                  mulhu        a5, a3, t5
                  lui          a7, 1036702
                  add          s4, a1, t4
                  slt          s3, a6, a0
                  andi         a4, a7, -1410
                  or           t1, a5, t0
                  slli         t1, ra, 5
                  nop
                  c.and        a0, s0
                  remu         sp, s3, s7
                  c.slli       tp, 29
                  mulh         s8, zero, tp
                  srai         a4, ra, 3
                  c.andi       a3, 13
                  sll          t2, gp, a3
                  c.srli       a0, 16
                  div          t3, sp, t0
                  and          s3, a6, s7
                  slt          s3, a6, a0
                  c.nop
                  c.or         a2, s0
                  xor          tp, a3, tp
                  remu         sp, s3, s7
                  rem          t1, s7, s2
                  srl          t4, s1, t1
                  c.xor        a0, s1
                  xori         sp, ra, -1938
                  sra          a3, t2, s2
                  addi         s3, s2, -1824
                  or           t1, a5, t0
                  slli         t1, ra, 5
                  addi         s3, s2, -1824
                  nop
                  nop
                  divu         a7, s4, t2
                  add          s4, a1, t4
                  slt          s3, a6, a0
                  c.slli       tp, 29
                  srai         a4, ra, 3
                  srli         s4, s3, 13
                  c.slli       tp, 29
                  mulh         s8, zero, tp
                  c.or         a2, s0
                  c.addi16sp   sp, 256
                  divu         a7, s4, t2
                  sll          t2, gp, a3
                  c.add        a2, t6
                  and          s3, a6, s7
                  sltu         s6, s9, sp
                  c.addi4spn   a0, sp, 368
                  c.addi4spn   a0, sp, 368
                  sltu         s6, s9, sp
                  c.and        a0, s0
                  nop
                  c.lui        s10, 18
                  div          t3, sp, t0
                  auipc        tp, 368653
                  mulhu        a5, a3, t5
                  c.addi       s7, -1
                  mulhsu       ra, t3, a0
                  mulhsu       ra, t3, a0
                  slt          s3, a6, a0
                  sub          sp, t0, a2
                  c.slli       tp, 29
                  addi         s3, s2, -1824
                  mulhu        a5, a3, t5
                  and          s3, a6, s7
                  addi         s3, s2, -1824
                  sub          sp, t0, a2
                  or           t1, a5, t0
                  add          s4, a1, t4
                  mulhu        a5, a3, t5
                  c.addi16sp   sp, 256
                  mulh         s8, zero, tp
                  sltu         s6, s9, sp
                  c.addi4spn   a0, sp, 368
                  ori          a6, t4, 27
                  divu         a7, s4, t2
                  add          s4, a1, t4
                  srai         a4, ra, 3
                  c.xor        a0, s1
                  c.srai       s0, 8
                  mulh         s8, zero, tp
                  srl          t4, s1, t1
                  slti         sp, a1, 426
                  slli         t1, ra, 5
                  sll          t2, gp, a3
                  mul          s7, t5, a5
                  slt          s3, a6, a0
                  slti         sp, a1, 426
                  srl          t4, s1, t1
                  nop
                  xori         sp, ra, -1938
                  or           t1, a5, t0
                  add          s4, a1, t4
                  sltiu        a6, ra, -900
                  add          s4, a1, t4
                  c.andi       a3, 13
                  auipc        tp, 368653
                  srli         s4, s3, 13
                  c.addi16sp   sp, 256
                  sll          t2, gp, a3
                  srl          t4, s1, t1
                  c.xor        a0, s1
                  c.srai       s0, 8
                  sra          a3, t2, s2
                  sra          a3, t2, s2
                  c.sub        a0, a1
                  nop
                  mul          s7, t5, a5
                  divu         a7, s4, t2
                  nop
                  c.nop
                  mul          s7, t5, a5
                  add          s4, a1, t4
                  slti         sp, a1, 426
                  c.mv         s6, s5
                  nop
                  divu         a7, s4, t2
                  addi         s3, s2, -1824
                  c.srai       s0, 8
                  c.slli       tp, 29
                  c.mv         s6, s5
                  c.and        a0, s0
                  c.addi4spn   a0, sp, 368
                  xori         sp, ra, -1938
                  mulhu        a5, a3, t5
                  ori          a6, t4, 27
                  mulh         s8, zero, tp
                  remu         sp, s3, s7
                  xori         sp, ra, -1938
                  mul          s7, t5, a5
                  rem          t1, s7, s2
                  c.lui        s10, 18
                  div          t3, sp, t0
                  mulhu        a5, a3, t5
                  rem          t1, s7, s2
                  c.sub        a0, a1
                  slli         t1, ra, 5
                  c.or         a2, s0
                  c.addi       s7, -1
                  sltu         s6, s9, sp
                  sub          sp, t0, a2
                  slt          s3, a6, a0
                  c.add        a2, t6
                  c.andi       a3, 13
                  c.andi       a3, 13
                  add          s4, a1, t4
                  sub          sp, t0, a2
                  c.xor        a0, s1
                  and          s3, a6, s7
                  andi         a4, a7, -1410
                  div          t3, sp, t0
                  c.nop
                  and          s3, a6, s7
                  c.andi       a3, 13
                  mulhu        a5, a3, t5
                  sltu         s6, s9, sp
                  c.and        a0, s0
                  c.addi4spn   a0, sp, 368
                  xor          tp, a3, tp
                  c.addi4spn   a0, sp, 368
                  sltu         s6, s9, sp
                  lui          a7, 1036702
                  slt          s3, a6, a0
                  slli         t1, ra, 5
                  c.or         a2, s0
                  xori         sp, ra, -1938
                  mulh         s8, zero, tp
                  remu         sp, s3, s7
                  c.addi4spn   a0, sp, 368
                  mulh         s8, zero, tp
                  c.add        a2, t6
                  mulhsu       ra, t3, a0
                  c.addi       s7, -1
                  sub          sp, t0, a2
                  sltiu        a6, ra, -900
                  ori          a6, t4, 27
                  c.srai       s0, 8
                  c.nop
                  slti         sp, a1, 426
                  c.srai       s0, 8
                  c.and        a0, s0
                  c.xor        a0, s1
                  sltiu        a6, ra, -900
                  divu         a7, s4, t2
                  c.add        a2, t6
                  slti         sp, a1, 426
                  sltiu        a6, ra, -900
                  xori         sp, ra, -1938
                  mulhsu       ra, t3, a0
                  c.lui        s10, 18
                  slli         t1, ra, 5
                  lui          a7, 1036702
                  c.slli       tp, 29
                  c.addi16sp   sp, 256
                  and          s3, a6, s7
                  ori          a6, t4, 27
                  srl          t4, s1, t1
                  srli         s4, s3, 13
                  and          s3, a6, s7
                  xor          tp, a3, tp
                  xor          tp, a3, tp
                  sll          t2, gp, a3
                  c.or         a2, s0
                  mulhu        a5, a3, t5
                  xori         sp, ra, -1938
                  mulhsu       ra, t3, a0
                  sra          a3, t2, s2
                  remu         sp, s3, s7
                  sub          sp, t0, a2
                  nop
                  xor          tp, a3, tp
                  c.lui        s10, 18
                  mul          s7, t5, a5
                  div          t3, sp, t0
                  sll          t2, gp, a3
                  c.xor        a0, s1
                  xor          tp, a3, tp
                  c.addi16sp   sp, 256
                  andi         a4, a7, -1410
                  mulh         s8, zero, tp
                  c.srai       s0, 8
                  mulh         s8, zero, tp
                  xori         sp, ra, -1938
                  ori          a6, t4, 27
                  sub          sp, t0, a2
                  lui          a7, 1036702
                  xori         sp, ra, -1938
                  c.addi       s7, -1
                  remu         sp, s3, s7
                  slt          s3, a6, a0
                  slli         t1, ra, 5
                  c.addi       s7, -1
                  c.srli       a0, 16
                  srli         s4, s3, 13
                  srli         s4, s3, 13
                  slti         sp, a1, 426
                  c.addi16sp   sp, 256
                  lui          a7, 1036702
                  ori          a6, t4, 27
                  add          s4, a1, t4
                  sltiu        a6, ra, -900
                  mulh         s8, zero, tp
                  c.xor        a0, s1
                  sltu         s6, s9, sp
                  c.li         s3, 9
                  c.sub        a0, a1
                  mulhsu       ra, t3, a0
                  srl          t4, s1, t1
                  mulhu        a5, a3, t5
                  lui          a7, 1036702
                  c.addi4spn   a0, sp, 368
                  remu         sp, s3, s7
                  c.lui        s10, 18
                  mulhu        a5, a3, t5
                  slt          s3, a6, a0
                  mulhu        a5, a3, t5
                  c.lui        s10, 18
                  sra          a3, t2, s2
                  c.sub        a0, a1
                  divu         a7, s4, t2
                  remu         sp, s3, s7
                  c.add        a2, t6
                  remu         sp, s3, s7
                  divu         a7, s4, t2
                  and          s3, a6, s7
                  srli         s4, s3, 13
                  li           gp, 0x0 #start riscv_int_numeric_corner_stream_6
                  li           a2, 0xffffffff
                  li           a3, 0x0
                  li           tp, 0x0
                  li           s3, 0x0
                  li           s10, 0x9d8cd5a4
                  li           a0, 0x366d5779
                  li           sp, 0x80000000
                  li           t6, 0xffffffff
                  li           t4, 0x0
                  mul          a3, a3, s10
                  mulh         s3, sp, a2
                  auipc        a2, 368653
                  div          a2, tp, a3
                  addi         tp, tp, -1824
                  nop
                  add          a0, s3, s3
                  div          a2, tp, a3
                  mulh         s3, sp, a2
                  auipc        a2, 368653
                  rem          s3, s10, tp
                  sub          tp, a3, s3
                  mulhu        a0, s10, t4
                  mulhsu       gp, s10, a3
                  mulh         s3, sp, a2
                  auipc        a2, 368653 #end riscv_int_numeric_corner_stream_6
                  addi         s3, s2, -1824
                  div          t3, sp, t0
                  c.addi4spn   a0, sp, 368
                  sltiu        a6, ra, -900
                  andi         a4, a7, -1410
                  sltu         s6, s9, sp
                  c.li         s3, 9
                  srai         a4, ra, 3
                  c.addi4spn   a0, sp, 368
                  andi         a4, a7, -1410
                  c.and        a0, s0
                  remu         sp, s3, s7
                  c.sub        a0, a1
                  c.andi       a3, 13
                  sltu         s6, s9, sp
                  divu         a7, s4, t2
                  mulhsu       ra, t3, a0
                  auipc        tp, 368653
                  c.addi16sp   sp, 256
                  or           t1, a5, t0
                  sub          sp, t0, a2
                  c.and        a0, s0
                  or           t1, a5, t0
                  c.and        a0, s0
                  c.xor        a0, s1
                  sub          sp, t0, a2
                  slli         t1, ra, 5
                  c.xor        a0, s1
                  c.andi       a3, 13
                  c.and        a0, s0
                  sltiu        a6, ra, -900
                  lui          a7, 1036702
                  srli         s4, s3, 13
                  mulhu        a5, a3, t5
                  xor          tp, a3, tp
                  c.xor        a0, s1
                  sll          t2, gp, a3
                  c.lui        s10, 18
                  ori          a6, t4, 27
                  mul          s7, t5, a5
                  c.andi       a3, 13
                  slli         t1, ra, 5
                  c.li         s3, 9
                  sltu         s6, s9, sp
                  and          s3, a6, s7
                  c.li         s3, 9
                  mulhsu       ra, t3, a0
                  divu         a7, s4, t2
                  nop
                  c.slli       tp, 29
                  mulhsu       ra, t3, a0
                  addi         s3, s2, -1824
                  slt          s3, a6, a0
                  c.addi       s7, -1
                  xori         sp, ra, -1938
                  sub          sp, t0, a2
                  and          s3, a6, s7
                  c.li         s3, 9
                  rem          t1, s7, s2
                  andi         a4, a7, -1410
                  c.addi4spn   a0, sp, 368
                  c.xor        a0, s1
                  or           t1, a5, t0
                  c.xor        a0, s1
                  mulh         s8, zero, tp
                  nop
                  nop
                  divu         a7, s4, t2
                  ori          a6, t4, 27
                  rem          t1, s7, s2
                  sll          t2, gp, a3
                  c.andi       a3, 13
                  c.andi       a3, 13
                  sltu         s6, s9, sp
                  c.slli       tp, 29
                  mul          s7, t5, a5
                  lui          a7, 1036702
                  divu         a7, s4, t2
                  xori         sp, ra, -1938
                  xori         sp, ra, -1938
                  c.xor        a0, s1
                  c.srai       s0, 8
                  srai         a4, ra, 3
                  srli         s4, s3, 13
                  add          s4, a1, t4
                  ori          a6, t4, 27
                  slt          s3, a6, a0
                  divu         a7, s4, t2
                  nop
                  slt          s3, a6, a0
                  slt          s3, a6, a0
                  and          s3, a6, s7
                  lui          a7, 1036702
                  or           t1, a5, t0
                  srai         a4, ra, 3
                  mul          s7, t5, a5
                  andi         a4, a7, -1410
                  srli         s4, s3, 13
                  mulh         s8, zero, tp
                  remu         sp, s3, s7
                  c.addi       s7, -1
                  c.addi16sp   sp, 256
                  or           t1, a5, t0
                  ori          a6, t4, 27
                  sll          t2, gp, a3
                  or           t1, a5, t0
                  c.lui        s10, 18
                  addi         s3, s2, -1824
                  srli         s4, s3, 13
                  c.xor        a0, s1
                  slti         sp, a1, 426
                  mul          s7, t5, a5
                  c.li         s3, 9
                  lui          a7, 1036702
                  srl          t4, s1, t1
                  divu         a7, s4, t2
                  c.srai       s0, 8
                  sra          a3, t2, s2
                  c.srli       a0, 16
                  mulhsu       ra, t3, a0
                  c.srai       s0, 8
                  c.addi4spn   a0, sp, 368
                  mulhu        a5, a3, t5
                  c.mv         s6, s5
                  nop
                  c.mv         s6, s5
                  rem          t1, s7, s2
                  and          s3, a6, s7
                  sub          sp, t0, a2
                  slt          s3, a6, a0
                  c.addi       s7, -1
                  c.lui        s10, 18
                  sll          t2, gp, a3
                  slli         t1, ra, 5
                  c.or         a2, s0
                  c.add        a2, t6
                  addi         s3, s2, -1824
                  rem          t1, s7, s2
                  srai         a4, ra, 3
                  divu         a7, s4, t2
                  c.add        a2, t6
                  lui          a7, 1036702
                  c.andi       a3, 13
                  auipc        tp, 368653
                  c.srli       a0, 16
                  c.addi       s7, -1
                  srai         a4, ra, 3
                  xori         sp, ra, -1938
                  srai         a4, ra, 3
                  c.srai       s0, 8
                  c.srai       s0, 8
                  add          s4, a1, t4
                  and          s3, a6, s7
                  divu         a7, s4, t2
                  xori         sp, ra, -1938
                  c.nop
                  c.li         s3, 9
                  ori          a6, t4, 27
                  c.lui        s10, 18
                  mulhsu       ra, t3, a0
                  c.addi4spn   a0, sp, 368
                  srl          t4, s1, t1
                  c.andi       a3, 13
                  c.li         s3, 9
                  c.srli       a0, 16
                  c.li         s3, 9
                  nop
                  mulhsu       ra, t3, a0
                  c.mv         s6, s5
                  mulhu        a5, a3, t5
                  slli         t1, ra, 5
                  andi         a4, a7, -1410
                  c.andi       a3, 13
                  and          s3, a6, s7
                  add          s4, a1, t4
                  c.sub        a0, a1
                  sll          t2, gp, a3
                  sra          a3, t2, s2
                  add          s4, a1, t4
                  remu         sp, s3, s7
                  divu         a7, s4, t2
                  ori          a6, t4, 27
                  srl          t4, s1, t1
                  c.addi4spn   a0, sp, 368
                  srl          t4, s1, t1
                  c.mv         s6, s5
                  add          s4, a1, t4
                  c.xor        a0, s1
                  sll          t2, gp, a3
                  divu         a7, s4, t2
                  c.or         a2, s0
                  and          s3, a6, s7
                  andi         a4, a7, -1410
                  sub          sp, t0, a2
                  mulh         s8, zero, tp
                  and          s3, a6, s7
                  nop
                  c.srai       s0, 8
                  slt          s3, a6, a0
                  c.andi       a3, 13
                  mulh         s8, zero, tp
                  add          s4, a1, t4
                  c.nop
                  srai         a4, ra, 3
                  mul          s7, t5, a5
                  sub          sp, t0, a2
                  remu         sp, s3, s7
                  c.mv         s6, s5
                  c.li         s3, 9
                  addi         s3, s2, -1824
                  auipc        tp, 368653
                  remu         sp, s3, s7
                  andi         a4, a7, -1410
                  c.lui        s10, 18
                  c.mv         s6, s5
                  c.addi16sp   sp, 256
                  mulh         s8, zero, tp
                  c.and        a0, s0
                  c.xor        a0, s1
                  mulhsu       ra, t3, a0
                  andi         a4, a7, -1410
                  remu         sp, s3, s7
                  add          s4, a1, t4
                  c.lui        s10, 18
                  slt          s3, a6, a0
                  nop
                  ori          a6, t4, 27
                  sll          t2, gp, a3
                  sll          t2, gp, a3
                  c.xor        a0, s1
                  addi         s3, s2, -1824
                  c.addi       s7, -1
                  ori          a6, t4, 27
                  mulhsu       ra, t3, a0
                  c.srli       a0, 16
                  c.or         a2, s0
                  mulhu        a5, a3, t5
                  andi         a4, a7, -1410
                  andi         a4, a7, -1410
                  c.addi4spn   a0, sp, 368
                  and          s3, a6, s7
                  c.slli       tp, 29
                  c.or         a2, s0
                  divu         a7, s4, t2
                  addi         s3, s2, -1824
                  rem          t1, s7, s2
                  add          s4, a1, t4
                  srli         s4, s3, 13
                  remu         sp, s3, s7
                  div          t3, sp, t0
                  c.xor        a0, s1
                  andi         a4, a7, -1410
                  c.srai       s0, 8
                  mul          s7, t5, a5
                  auipc        tp, 368653
                  nop
                  auipc        tp, 368653
                  sub          sp, t0, a2
                  srai         a4, ra, 3
                  c.andi       a3, 13
                  div          t3, sp, t0
                  auipc        tp, 368653
                  slli         t1, ra, 5
                  mulhu        a5, a3, t5
                  sub          sp, t0, a2
                  ori          a6, t4, 27
                  c.li         s3, 9
                  c.addi       s7, -1
                  mulh         s8, zero, tp
                  sra          a3, t2, s2
                  c.slli       tp, 29
                  ori          a6, t4, 27
                  xor          tp, a3, tp
                  sll          t2, gp, a3
                  slli         t1, ra, 5
                  c.li         s3, 9
                  lui          a7, 1036702
                  c.nop
                  c.and        a0, s0
                  c.sub        a0, a1
                  remu         sp, s3, s7
                  c.addi4spn   a0, sp, 368
                  c.and        a0, s0
                  divu         a7, s4, t2
                  add          s4, a1, t4
                  rem          t1, s7, s2
                  c.srai       s0, 8
                  c.and        a0, s0
                  remu         sp, s3, s7
                  c.xor        a0, s1
                  mulh         s8, zero, tp
                  slt          s3, a6, a0
                  ori          a6, t4, 27
                  or           t1, a5, t0
                  slt          s3, a6, a0
                  srli         s4, s3, 13
                  slt          s3, a6, a0
                  sltiu        a6, ra, -900
                  c.srli       a0, 16
                  c.xor        a0, s1
                  mulhsu       ra, t3, a0
                  c.and        a0, s0
                  c.addi       s7, -1
                  srai         a4, ra, 3
                  xori         sp, ra, -1938
                  slt          s3, a6, a0
                  rem          t1, s7, s2
                  add          s4, a1, t4
                  addi         s3, s2, -1824
                  c.sub        a0, a1
                  addi         s3, s2, -1824
                  c.sub        a0, a1
                  sltu         s6, s9, sp
                  c.or         a2, s0
                  c.li         s3, 9
                  rem          t1, s7, s2
                  sltu         s6, s9, sp
                  mul          s7, t5, a5
                  sll          t2, gp, a3
                  rem          t1, s7, s2
                  slli         t1, ra, 5
                  rem          t1, s7, s2
                  c.addi4spn   a0, sp, 368
                  c.srli       a0, 16
                  slli         t1, ra, 5
                  div          t3, sp, t0
                  slti         sp, a1, 426
                  c.or         a2, s0
                  ori          a6, t4, 27
                  c.or         a2, s0
                  divu         a7, s4, t2
                  c.srai       s0, 8
                  sltu         s6, s9, sp
                  c.or         a2, s0
                  c.and        a0, s0
                  sltu         s6, s9, sp
                  c.and        a0, s0
                  xori         sp, ra, -1938
                  mulhu        a5, a3, t5
                  c.addi4spn   a0, sp, 368
                  sra          a3, t2, s2
                  mul          s7, t5, a5
                  c.srli       a0, 16
                  c.srai       s0, 8
                  sra          a3, t2, s2
                  addi         s3, s2, -1824
                  c.srai       s0, 8
                  sub          sp, t0, a2
                  c.lui        s10, 18
                  c.srai       s0, 8
                  c.li         s3, 9
                  slt          s3, a6, a0
                  rem          t1, s7, s2
                  andi         a4, a7, -1410
                  c.add        a2, t6
                  c.and        a0, s0
                  divu         a7, s4, t2
                  remu         sp, s3, s7
                  c.lui        s10, 18
                  c.or         a2, s0
                  c.xor        a0, s1
                  auipc        tp, 368653
                  slti         sp, a1, 426
                  c.nop
                  c.or         a2, s0
                  c.mv         s6, s5
                  mulhu        a5, a3, t5
                  c.addi16sp   sp, 256
                  auipc        tp, 368653
                  xor          tp, a3, tp
                  div          t3, sp, t0
                  c.nop
                  xori         sp, ra, -1938
                  sltu         s6, s9, sp
                  c.addi16sp   sp, 256
                  slli         t1, ra, 5
                  c.mv         s6, s5
                  c.and        a0, s0
                  c.mv         s6, s5
                  rem          t1, s7, s2
                  auipc        tp, 368653
                  c.and        a0, s0
                  rem          t1, s7, s2
                  c.and        a0, s0
                  addi         s3, s2, -1824
                  xor          tp, a3, tp
                  c.and        a0, s0
                  lui          a7, 1036702
                  c.or         a2, s0
                  mulhsu       ra, t3, a0
                  srli         s4, s3, 13
                  srli         s4, s3, 13
                  xor          tp, a3, tp
                  sub          sp, t0, a2
                  c.lui        s10, 18
                  addi         s3, s2, -1824
                  slt          s3, a6, a0
                  c.andi       a3, 13
                  c.andi       a3, 13
                  xori         sp, ra, -1938
                  mul          s7, t5, a5
                  add          s4, a1, t4
                  c.nop
                  srl          t4, s1, t1
                  c.nop
                  addi         s3, s2, -1824
                  slt          s3, a6, a0
                  srai         a4, ra, 3
                  div          t3, sp, t0
                  c.andi       a3, 13
                  auipc        tp, 368653
                  c.slli       tp, 29
                  c.xor        a0, s1
                  auipc        tp, 368653
                  slt          s3, a6, a0
                  mulhsu       ra, t3, a0
                  sll          t2, gp, a3
                  divu         a7, s4, t2
                  c.addi       s7, -1
                  c.sub        a0, a1
                  lui          a7, 1036702
                  xori         sp, ra, -1938
                  c.andi       a3, 13
                  divu         a7, s4, t2
                  c.or         a2, s0
                  div          t3, sp, t0
                  andi         a4, a7, -1410
                  addi         s3, s2, -1824
                  or           t1, a5, t0
                  srl          t4, s1, t1
                  c.add        a2, t6
                  addi         s3, s2, -1824
                  slli         t1, ra, 5
                  c.and        a0, s0
                  srl          t4, s1, t1
                  mulh         s8, zero, tp
                  sltiu        a6, ra, -900
                  c.addi4spn   a0, sp, 368
                  sltu         s6, s9, sp
                  c.add        a2, t6
                  c.or         a2, s0
                  srai         a4, ra, 3
                  srai         a4, ra, 3
                  rem          t1, s7, s2
                  c.slli       tp, 29
                  c.and        a0, s0
                  sub          sp, t0, a2
                  c.addi4spn   a0, sp, 368
                  slti         sp, a1, 426
                  c.and        a0, s0
                  mulhsu       ra, t3, a0
                  c.sub        a0, a1
                  c.add        a2, t6
                  c.addi4spn   a0, sp, 368
                  mul          s7, t5, a5
                  nop
                  slt          s3, a6, a0
                  and          s3, a6, s7
                  c.addi       s7, -1
                  c.sub        a0, a1
                  c.slli       tp, 29
                  xori         sp, ra, -1938
                  mulhsu       ra, t3, a0
                  remu         sp, s3, s7
                  c.srli       a0, 16
                  slti         sp, a1, 426
                  srai         a4, ra, 3
                  auipc        tp, 368653
                  c.addi       s7, -1
                  c.addi       s7, -1
                  c.add        a2, t6
                  c.addi4spn   a0, sp, 368
                  slti         sp, a1, 426
                  lui          a7, 1036702
                  mulhsu       ra, t3, a0
                  mulhu        a5, a3, t5
                  c.and        a0, s0
                  sltiu        a6, ra, -900
                  rem          t1, s7, s2
                  c.xor        a0, s1
                  c.lui        s10, 18
                  addi         s3, s2, -1824
                  c.addi4spn   a0, sp, 368
                  slt          s3, a6, a0
                  mulhsu       ra, t3, a0
                  mulhsu       ra, t3, a0
                  slt          s3, a6, a0
                  sra          a3, t2, s2
                  add          s4, a1, t4
                  div          t3, sp, t0
                  c.or         a2, s0
                  div          t3, sp, t0
                  remu         sp, s3, s7
                  mulhu        a5, a3, t5
                  mulhsu       ra, t3, a0
                  mulh         s8, zero, tp
                  add          s4, a1, t4
                  c.add        a2, t6
                  c.mv         s6, s5
                  c.lui        s10, 18
                  c.srai       s0, 8
                  slli         t1, ra, 5
                  xor          tp, a3, tp
                  c.nop
                  sra          a3, t2, s2
                  sll          t2, gp, a3
                  mulhsu       ra, t3, a0
                  c.slli       tp, 29
                  andi         a4, a7, -1410
                  c.addi       s7, -1
                  mulh         s8, zero, tp
                  c.nop
                  xor          tp, a3, tp
                  lui          a7, 1036702
                  c.mv         s6, s5
                  ori          a6, t4, 27
                  c.sub        a0, a1
                  andi         a4, a7, -1410
                  lui          a7, 1036702
                  c.add        a2, t6
                  rem          t1, s7, s2
                  xor          tp, a3, tp
                  ori          a6, t4, 27
                  sltiu        a6, ra, -900
                  lui          a7, 1036702
                  andi         a4, a7, -1410
                  sra          a3, t2, s2
                  c.srai       s0, 8
                  sll          t2, gp, a3
                  mul          s7, t5, a5
                  srai         a4, ra, 3
                  sra          a3, t2, s2
                  auipc        tp, 368653
                  sub          sp, t0, a2
                  sra          a3, t2, s2
                  mulh         s8, zero, tp
                  sll          t2, gp, a3
                  srli         s4, s3, 13
                  sub          sp, t0, a2
                  c.lui        s10, 18
                  and          s3, a6, s7
                  srli         s4, s3, 13
                  slli         t1, ra, 5
                  rem          t1, s7, s2
                  slti         sp, a1, 426
                  sltiu        a6, ra, -900
                  add          s4, a1, t4
                  lui          a7, 1036702
                  c.or         a2, s0
                  c.addi16sp   sp, 256
                  nop
                  slt          s3, a6, a0
                  c.slli       tp, 29
                  c.srli       a0, 16
                  andi         a4, a7, -1410
                  nop
                  c.or         a2, s0
                  c.add        a2, t6
                  div          t3, sp, t0
                  sll          t2, gp, a3
                  sltiu        a6, ra, -900
                  c.slli       tp, 29
                  mul          s7, t5, a5
                  ori          a6, t4, 27
                  andi         a4, a7, -1410
                  add          s4, a1, t4
                  div          t3, sp, t0
                  sltiu        a6, ra, -900
                  mul          s7, t5, a5
                  c.addi       s7, -1
                  and          s3, a6, s7
                  slti         sp, a1, 426
                  mulhu        a5, a3, t5
                  remu         sp, s3, s7
                  c.lui        s10, 18
                  mulhu        a5, a3, t5
                  lui          a7, 1036702
                  c.sub        a0, a1
                  divu         a7, s4, t2
                  srli         s4, s3, 13
                  c.srai       s0, 8
                  rem          t1, s7, s2
                  nop
                  sltu         s6, s9, sp
                  c.or         a2, s0
                  c.li         s3, 9
                  ori          a6, t4, 27
                  div          t3, sp, t0
                  rem          t1, s7, s2
                  c.addi4spn   a0, sp, 368
                  xor          tp, a3, tp
                  c.addi       s7, -1
                  lui          a7, 1036702
                  c.xor        a0, s1
                  or           t1, a5, t0
                  mulh         s8, zero, tp
                  div          t3, sp, t0
                  andi         a4, a7, -1410
                  sltiu        a6, ra, -900
                  slt          s3, a6, a0
                  c.li         s3, 9
                  div          t3, sp, t0
                  div          t3, sp, t0
                  addi         s3, s2, -1824
                  c.add        a2, t6
                  mulhu        a5, a3, t5
                  remu         sp, s3, s7
                  srli         s4, s3, 13
                  mulhsu       ra, t3, a0
                  andi         a4, a7, -1410
                  add          s4, a1, t4
                  divu         a7, s4, t2
                  c.srli       a0, 16
                  c.srli       a0, 16
                  c.xor        a0, s1
                  c.li         s3, 9
                  divu         a7, s4, t2
                  rem          t1, s7, s2
                  sub          sp, t0, a2
                  andi         a4, a7, -1410
                  c.addi       s7, -1
                  c.nop
                  c.addi       s7, -1
                  mul          s7, t5, a5
                  rem          t1, s7, s2
                  sll          t2, gp, a3
                  addi         s3, s2, -1824
                  c.add        a2, t6
                  mulh         s8, zero, tp
                  nop
                  mulh         s8, zero, tp
                  slli         t1, ra, 5
                  c.mv         s6, s5
                  c.addi4spn   a0, sp, 368
                  srl          t4, s1, t1
                  c.add        a2, t6
                  or           t1, a5, t0
                  c.srli       a0, 16
                  srl          t4, s1, t1
                  mulh         s8, zero, tp
                  c.srai       s0, 8
                  sltu         s6, s9, sp
                  sltu         s6, s9, sp
                  sub          sp, t0, a2
                  srai         a4, ra, 3
                  c.addi4spn   a0, sp, 368
                  srai         a4, ra, 3
                  or           t1, a5, t0
                  sra          a3, t2, s2
                  c.addi16sp   sp, 256
                  c.lui        s10, 18
                  c.nop
                  c.addi16sp   sp, 256
                  sltiu        a6, ra, -900
                  sub          sp, t0, a2
                  sll          t2, gp, a3
                  divu         a7, s4, t2
                  c.addi16sp   sp, 256
                  c.srli       a0, 16
                  c.addi       s7, -1
                  or           t1, a5, t0
                  or           t1, a5, t0
                  c.sub        a0, a1
                  sra          a3, t2, s2
                  c.xor        a0, s1
                  sra          a3, t2, s2
                  mul          s7, t5, a5
                  c.nop
                  sltiu        a6, ra, -900
                  c.andi       a3, 13
                  xori         sp, ra, -1938
                  xori         sp, ra, -1938
                  c.mv         s6, s5
                  or           t1, a5, t0
                  c.addi       s7, -1
                  slt          s3, a6, a0
                  sub          sp, t0, a2
                  c.li         s3, 9
                  addi         s3, s2, -1824
                  c.andi       a3, 13
                  c.li         s3, 9
                  c.slli       tp, 29
                  remu         sp, s3, s7
                  c.nop
                  andi         a4, a7, -1410
                  add          s4, a1, t4
                  or           t1, a5, t0
                  mulhsu       ra, t3, a0
                  srli         s4, s3, 13
                  mul          s7, t5, a5
                  nop
                  c.srai       s0, 8
                  add          s4, a1, t4
                  c.xor        a0, s1
                  add          s4, a1, t4
                  c.slli       tp, 29
                  c.mv         s6, s5
                  slt          s3, a6, a0
                  c.lui        s10, 18
                  xor          tp, a3, tp
                  and          s3, a6, s7
                  c.slli       tp, 29
                  srl          t4, s1, t1
                  mulhsu       ra, t3, a0
                  mul          s7, t5, a5
                  xori         sp, ra, -1938
                  srai         a4, ra, 3
                  sltiu        a6, ra, -900
                  mulhu        a5, a3, t5
                  c.sub        a0, a1
                  xori         sp, ra, -1938
                  c.or         a2, s0
                  lui          a7, 1036702
                  c.sub        a0, a1
                  sub          sp, t0, a2
                  c.addi4spn   a0, sp, 368
                  c.addi4spn   a0, sp, 368
                  mulhsu       ra, t3, a0
                  auipc        tp, 368653
                  or           t1, a5, t0
                  c.srli       a0, 16
                  c.andi       a3, 13
                  sltiu        a6, ra, -900
                  mul          s7, t5, a5
                  c.andi       a3, 13
                  xor          tp, a3, tp
                  lui          a7, 1036702
                  xori         sp, ra, -1938
                  andi         a4, a7, -1410
                  c.mv         s6, s5
                  c.slli       tp, 29
                  c.addi       s7, -1
                  sub          sp, t0, a2
                  c.slli       tp, 29
                  c.li         s3, 9
                  c.add        a2, t6
                  c.srai       s0, 8
                  slli         t1, ra, 5
                  mulhsu       ra, t3, a0
                  c.addi4spn   a0, sp, 368
                  c.srli       a0, 16
                  add          s4, a1, t4
                  add          s4, a1, t4
                  c.sub        a0, a1
                  divu         a7, s4, t2
                  srli         s4, s3, 13
                  xor          tp, a3, tp
                  srai         a4, ra, 3
                  c.addi16sp   sp, 256
                  c.srai       s0, 8
                  mulh         s8, zero, tp
                  c.sub        a0, a1
                  slti         sp, a1, 426
                  c.or         a2, s0
                  srli         s4, s3, 13
                  mulhu        a5, a3, t5
                  c.srai       s0, 8
                  c.srai       s0, 8
                  remu         sp, s3, s7
                  auipc        tp, 368653
                  sra          a3, t2, s2
                  remu         sp, s3, s7
                  c.srai       s0, 8
                  srai         a4, ra, 3
                  mulhu        a5, a3, t5
                  slt          s3, a6, a0
                  c.add        a2, t6
                  c.addi4spn   a0, sp, 368
                  c.mv         s6, s5
                  ori          a6, t4, 27
                  slli         t1, ra, 5
                  c.and        a0, s0
                  mulhsu       ra, t3, a0
                  div          t3, sp, t0
                  c.lui        s10, 18
                  ori          a6, t4, 27
                  mulh         s8, zero, tp
                  slli         t1, ra, 5
                  add          s4, a1, t4
                  or           t1, a5, t0
                  c.addi4spn   a0, sp, 368
                  div          t3, sp, t0
                  div          t3, sp, t0
                  c.nop
                  auipc        tp, 368653
                  remu         sp, s3, s7
                  mulhsu       ra, t3, a0
                  c.addi       s7, -1
                  srli         s4, s3, 13
                  remu         sp, s3, s7
                  div          t3, sp, t0
                  rem          t1, s7, s2
                  sll          t2, gp, a3
                  srli         s4, s3, 13
                  c.mv         s6, s5
                  sltu         s6, s9, sp
                  c.srai       s0, 8
                  srai         a4, ra, 3
                  mulh         s8, zero, tp
                  c.srli       a0, 16
                  c.addi       s7, -1
                  c.lui        s10, 18
                  sra          a3, t2, s2
                  sll          t2, gp, a3
                  div          t3, sp, t0
                  sltu         s6, s9, sp
                  sltiu        a6, ra, -900
                  addi         s3, s2, -1824
                  srli         s4, s3, 13
                  nop
                  lui          a7, 1036702
                  slli         t1, ra, 5
                  and          s3, a6, s7
                  mulh         s8, zero, tp
                  and          s3, a6, s7
                  c.or         a2, s0
                  div          t3, sp, t0
                  lui          a7, 1036702
                  c.and        a0, s0
                  div          t3, sp, t0
                  sltiu        a6, ra, -900
                  sub          sp, t0, a2
                  divu         a7, s4, t2
                  ori          a6, t4, 27
                  c.andi       a3, 13
                  srl          t4, s1, t1
                  div          t3, sp, t0
                  sltiu        a6, ra, -900
                  slti         sp, a1, 426
                  remu         sp, s3, s7
                  xori         sp, ra, -1938
                  divu         a7, s4, t2
                  slt          s3, a6, a0
                  slti         sp, a1, 426
                  rem          t1, s7, s2
                  c.addi16sp   sp, 256
                  mul          s7, t5, a5
                  add          s4, a1, t4
                  c.xor        a0, s1
                  ori          a6, t4, 27
                  c.li         s3, 9
                  remu         sp, s3, s7
                  c.and        a0, s0
                  c.mv         s6, s5
                  c.nop
                  srai         a4, ra, 3
                  c.srai       s0, 8
                  srai         a4, ra, 3
                  c.addi4spn   a0, sp, 368
                  sltiu        a6, ra, -900
                  c.addi       s7, -1
                  c.addi4spn   a0, sp, 368
                  auipc        tp, 368653
                  add          s4, a1, t4
                  srli         s4, s3, 13
                  or           t1, a5, t0
                  c.andi       a3, 13
                  sub          sp, t0, a2
                  li           t2, 0x7cbef743 #start riscv_int_numeric_corner_stream_34
                  li           a4, 0x0
                  li           a2, 0x80000000
                  li           s10, 0xffffffff
                  li           sp, 0xd5cfcdec
                  li           s7, 0x9747b3db
                  li           t6, 0xffffffff
                  li           t3, 0x0
                  li           a0, 0x0
                  li           ra, 0xffffffff
                  add          a0, s7, s7
                  mulh         s7, ra, a2
                  mulhu        a0, s10, t3
                  lui          ra, 1036702
                  lui          ra, 1036702
                  rem          s7, s10, t2
                  lui          ra, 1036702
                  lui          ra, 1036702
                  rem          s7, s10, t2
                  div          a2, t2, a4
                  remu         t2, a0, s10
                  nop
                  add          a0, s7, s7
                  remu         t2, a0, s10
                  sub          t2, a4, s7
                  remu         t2, a0, s10
                  sub          t2, a4, s7
                  mul          a4, a4, s10
                  add          a0, s7, s7
                  mulhsu       sp, s10, a4
                  rem          s7, s10, t2
                  mulhsu       sp, s10, a4
                  mulhsu       sp, s10, a4
                  remu         t2, a0, s10
                  add          a0, s7, s7
                  mul          a4, a4, s10 #end riscv_int_numeric_corner_stream_34
                  xori         sp, ra, -1938
                  and          s3, a6, s7
                  sltiu        a6, ra, -900
                  rem          t1, s7, s2
                  mul          s7, t5, a5
                  mulhu        a5, a3, t5
                  c.xor        a0, s1
                  srai         a4, ra, 3
                  c.nop
                  c.slli       tp, 29
                  slti         sp, a1, 426
                  ori          a6, t4, 27
                  c.add        a2, t6
                  sub          sp, t0, a2
                  c.srli       a0, 16
                  ori          a6, t4, 27
                  and          s3, a6, s7
                  xor          tp, a3, tp
                  or           t1, a5, t0
                  lui          a7, 1036702
                  li           a0, 0x80000000 #start riscv_int_numeric_corner_stream_3
                  li           s7, 0x0
                  li           ra, 0x2712e811
                  li           s1, 0xd0224605
                  li           tp, 0xffffffff
                  li           s8, 0xd1c144dd
                  li           s0, 0x0
                  li           s10, 0xe15791a1
                  li           t0, 0x374ca422
                  li           gp, 0x0
                  auipc        s0, 368653
                  sub          tp, s1, a0
                  mul          s1, s1, s7
                  lui          ra, 1036702
                  div          s0, tp, s1
                  add          t0, a0, a0
                  auipc        s0, 368653
                  sub          tp, s1, a0
                  div          s0, tp, s1
                  nop
                  auipc        s0, 368653
                  mul          s1, s1, s7
                  addi         tp, tp, -1824
                  div          s0, tp, s1
                  addi         tp, tp, -1824 #end riscv_int_numeric_corner_stream_3
                  c.xor        a0, s1
                  c.or         a2, s0
                  srl          t4, s1, t1
                  c.slli       tp, 29
                  and          s3, a6, s7
                  mulh         s8, zero, tp
                  lui          a7, 1036702
                  andi         a4, a7, -1410
                  c.or         a2, s0
                  c.lui        s10, 18
                  sub          sp, t0, a2
                  xori         sp, ra, -1938
                  sltiu        a6, ra, -900
                  mulhu        a5, a3, t5
                  c.andi       a3, 13
                  mulh         s8, zero, tp
                  sll          t2, gp, a3
                  c.addi4spn   a0, sp, 368
                  slti         sp, a1, 426
                  c.slli       tp, 29
                  add          s4, a1, t4
                  slti         sp, a1, 426
                  rem          t1, s7, s2
                  c.li         s3, 9
                  c.andi       a3, 13
                  c.srli       a0, 16
                  c.and        a0, s0
                  c.srli       a0, 16
                  c.li         s3, 9
                  div          t3, sp, t0
                  srai         a4, ra, 3
                  srl          t4, s1, t1
                  and          s3, a6, s7
                  rem          t1, s7, s2
                  sltiu        a6, ra, -900
                  mulh         s8, zero, tp
                  and          s3, a6, s7
                  andi         a4, a7, -1410
                  sra          a3, t2, s2
                  sltiu        a6, ra, -900
                  and          s3, a6, s7
                  nop
                  add          s4, a1, t4
                  c.andi       a3, 13
                  or           t1, a5, t0
                  remu         sp, s3, s7
                  c.addi4spn   a0, sp, 368
                  sub          sp, t0, a2
                  slti         sp, a1, 426
                  divu         a7, s4, t2
                  remu         sp, s3, s7
                  mulh         s8, zero, tp
                  c.lui        s10, 18
                  nop
                  c.li         s3, 9
                  c.addi       s7, -1
                  c.srli       a0, 16
                  c.mv         s6, s5
                  sra          a3, t2, s2
                  c.sub        a0, a1
                  nop
                  xor          tp, a3, tp
                  srl          t4, s1, t1
                  srl          t4, s1, t1
                  c.lui        s10, 18
                  slt          s3, a6, a0
                  mulh         s8, zero, tp
                  c.nop
                  auipc        tp, 368653
                  div          t3, sp, t0
                  add          s4, a1, t4
                  nop
                  mul          s7, t5, a5
                  c.srli       a0, 16
                  and          s3, a6, s7
                  c.and        a0, s0
                  slti         sp, a1, 426
                  c.addi4spn   a0, sp, 368
                  srli         s4, s3, 13
                  mulhsu       ra, t3, a0
                  xori         sp, ra, -1938
                  rem          t1, s7, s2
                  c.srli       a0, 16
                  remu         sp, s3, s7
                  srai         a4, ra, 3
                  ori          a6, t4, 27
                  c.addi       s7, -1
                  c.nop
                  divu         a7, s4, t2
                  c.add        a2, t6
                  sra          a3, t2, s2
                  c.srli       a0, 16
                  sltu         s6, s9, sp
                  c.li         s3, 9
                  c.addi4spn   a0, sp, 368
                  nop
                  c.lui        s10, 18
                  mulhu        a5, a3, t5
                  c.andi       a3, 13
                  add          s4, a1, t4
                  c.addi       s7, -1
                  andi         a4, a7, -1410
                  slti         sp, a1, 426
                  ori          a6, t4, 27
                  mulhsu       ra, t3, a0
                  c.add        a2, t6
                  c.mv         s6, s5
                  srl          t4, s1, t1
                  srli         s4, s3, 13
                  slti         sp, a1, 426
                  srl          t4, s1, t1
                  or           t1, a5, t0
                  c.nop
                  sll          t2, gp, a3
                  c.lui        s10, 18
                  c.srai       s0, 8
                  srli         s4, s3, 13
                  c.addi16sp   sp, 256
                  or           t1, a5, t0
                  c.srli       a0, 16
                  slti         sp, a1, 426
                  divu         a7, s4, t2
                  and          s3, a6, s7
                  c.addi4spn   a0, sp, 368
                  slt          s3, a6, a0
                  c.addi       s7, -1
                  auipc        tp, 368653
                  c.addi4spn   a0, sp, 368
                  rem          t1, s7, s2
                  sll          t2, gp, a3
                  sltiu        a6, ra, -900
                  c.lui        s10, 18
                  ori          a6, t4, 27
                  divu         a7, s4, t2
                  c.xor        a0, s1
                  slti         sp, a1, 426
                  c.nop
                  c.addi16sp   sp, 256
                  addi         s3, s2, -1824
                  divu         a7, s4, t2
                  div          t3, sp, t0
                  mul          s7, t5, a5
                  c.mv         s6, s5
                  c.and        a0, s0
                  ori          a6, t4, 27
                  xori         sp, ra, -1938
                  srl          t4, s1, t1
                  auipc        tp, 368653
                  remu         sp, s3, s7
                  xori         sp, ra, -1938
                  c.addi16sp   sp, 256
                  divu         a7, s4, t2
                  mul          s7, t5, a5
                  c.slli       tp, 29
                  c.srai       s0, 8
                  nop
                  sltu         s6, s9, sp
                  c.mv         s6, s5
                  c.sub        a0, a1
                  c.lui        s10, 18
                  lui          a7, 1036702
                  c.nop
                  xori         sp, ra, -1938
                  mul          s7, t5, a5
                  c.srli       a0, 16
                  srli         s4, s3, 13
                  srli         s4, s3, 13
                  c.slli       tp, 29
                  c.srli       a0, 16
                  c.andi       a3, 13
                  rem          t1, s7, s2
                  c.addi16sp   sp, 256
                  addi         s3, s2, -1824
                  sub          sp, t0, a2
                  srai         a4, ra, 3
                  c.addi4spn   a0, sp, 368
                  sub          sp, t0, a2
                  srl          t4, s1, t1
                  c.addi16sp   sp, 256
                  c.srli       a0, 16
                  c.addi16sp   sp, 256
                  ori          a6, t4, 27
                  c.srli       a0, 16
                  ori          a6, t4, 27
                  c.xor        a0, s1
                  addi         s3, s2, -1824
                  mulhsu       ra, t3, a0
                  andi         a4, a7, -1410
                  sltu         s6, s9, sp
                  c.add        a2, t6
                  sra          a3, t2, s2
                  sltiu        a6, ra, -900
                  c.sub        a0, a1
                  c.mv         s6, s5
                  xor          tp, a3, tp
                  divu         a7, s4, t2
                  slti         sp, a1, 426
                  c.addi16sp   sp, 256
                  addi         s3, s2, -1824
                  c.and        a0, s0
                  sra          a3, t2, s2
                  sltiu        a6, ra, -900
                  srli         s4, s3, 13
                  c.lui        s10, 18
                  slt          s3, a6, a0
                  rem          t1, s7, s2
                  sub          sp, t0, a2
                  c.sub        a0, a1
                  c.or         a2, s0
                  c.addi4spn   a0, sp, 368
                  c.and        a0, s0
                  c.andi       a3, 13
                  c.srli       a0, 16
                  or           t1, a5, t0
                  c.slli       tp, 29
                  srl          t4, s1, t1
                  auipc        tp, 368653
                  slti         sp, a1, 426
                  slti         sp, a1, 426
                  mulhu        a5, a3, t5
                  auipc        tp, 368653
                  mulhsu       ra, t3, a0
                  mulhu        a5, a3, t5
                  remu         sp, s3, s7
                  c.and        a0, s0
                  lui          a7, 1036702
                  div          t3, sp, t0
                  auipc        tp, 368653
                  c.andi       a3, 13
                  rem          t1, s7, s2
                  or           t1, a5, t0
                  add          s4, a1, t4
                  mul          s7, t5, a5
                  or           t1, a5, t0
                  sltu         s6, s9, sp
                  sltu         s6, s9, sp
                  c.xor        a0, s1
                  c.lui        s10, 18
                  slli         t1, ra, 5
                  mulhu        a5, a3, t5
                  sltiu        a6, ra, -900
                  c.nop
                  c.srli       a0, 16
                  c.srli       a0, 16
                  c.or         a2, s0
                  c.srli       a0, 16
                  addi         s3, s2, -1824
                  lui          a7, 1036702
                  addi         s3, s2, -1824
                  xori         sp, ra, -1938
                  sub          sp, t0, a2
                  rem          t1, s7, s2
                  nop
                  or           t1, a5, t0
                  c.srai       s0, 8
                  c.addi16sp   sp, 256
                  divu         a7, s4, t2
                  li           s3, 0xffffffff #start riscv_int_numeric_corner_stream_26
                  li           t0, 0x181c218f
                  li           t2, 0x0
                  li           a5, 0xffffffff
                  li           s9, 0x0
                  li           t3, 0x0
                  li           a0, 0xd0c3e528
                  li           sp, 0xffffffff
                  li           gp, 0x0
                  li           s1, 0xffffffff
                  remu         t0, t2, s3
                  divu         sp, s1, s3
                  div          s1, t0, a0
                  auipc        s1, 368653
                  mulhsu       gp, s3, a0
                  remu         t0, t2, s3
                  mulhsu       gp, s3, a0
                  mulhsu       gp, s3, a0
                  auipc        s1, 368653
                  mul          a0, a0, s3
                  auipc        s1, 368653
                  div          s1, t0, a0
                  divu         sp, s1, s3
                  rem          a5, s3, t0
                  auipc        s1, 368653
                  mulh         a5, sp, s1
                  nop
                  mul          a0, a0, s3 #end riscv_int_numeric_corner_stream_26
                  c.addi       s7, -1
                  c.srli       a0, 16
                  c.srli       a0, 16
                  c.addi4spn   a0, sp, 368
                  c.or         a2, s0
                  ori          a6, t4, 27
                  auipc        tp, 368653
                  remu         sp, s3, s7
                  c.add        a2, t6
                  mulhu        a5, a3, t5
                  sll          t2, gp, a3
                  c.sub        a0, a1
                  div          t3, sp, t0
                  c.li         s3, 9
                  and          s3, a6, s7
                  nop
                  add          s4, a1, t4
                  slti         sp, a1, 426
                  addi         s3, s2, -1824
                  slt          s3, a6, a0
                  ori          a6, t4, 27
                  srli         s4, s3, 13
                  mulhsu       ra, t3, a0
                  c.slli       tp, 29
                  sltiu        a6, ra, -900
                  sub          sp, t0, a2
                  c.li         s3, 9
                  slti         sp, a1, 426
                  ori          a6, t4, 27
                  c.srai       s0, 8
                  srai         a4, ra, 3
                  c.and        a0, s0
                  slt          s3, a6, a0
                  sub          sp, t0, a2
                  remu         sp, s3, s7
                  ori          a6, t4, 27
                  srl          t4, s1, t1
                  or           t1, a5, t0
                  slli         t1, ra, 5
                  divu         a7, s4, t2
                  c.andi       a3, 13
                  slt          s3, a6, a0
                  c.addi       s7, -1
                  slt          s3, a6, a0
                  divu         a7, s4, t2
                  xori         sp, ra, -1938
                  andi         a4, a7, -1410
                  slti         sp, a1, 426
                  c.lui        s10, 18
                  div          t3, sp, t0
                  auipc        tp, 368653
                  c.srli       a0, 16
                  mulhsu       ra, t3, a0
                  c.addi4spn   a0, sp, 368
                  and          s3, a6, s7
                  or           t1, a5, t0
                  sub          sp, t0, a2
                  xor          tp, a3, tp
                  sltiu        a6, ra, -900
                  c.mv         s6, s5
                  ori          a6, t4, 27
                  divu         a7, s4, t2
                  div          t3, sp, t0
                  and          s3, a6, s7
                  sll          t2, gp, a3
                  c.or         a2, s0
                  andi         a4, a7, -1410
                  mulhsu       ra, t3, a0
                  srl          t4, s1, t1
                  c.addi4spn   a0, sp, 368
                  andi         a4, a7, -1410
                  c.addi4spn   a0, sp, 368
                  c.addi4spn   a0, sp, 368
                  mulhu        a5, a3, t5
                  c.add        a2, t6
                  xor          tp, a3, tp
                  xor          tp, a3, tp
                  mul          s7, t5, a5
                  andi         a4, a7, -1410
                  xor          tp, a3, tp
                  and          s3, a6, s7
                  div          t3, sp, t0
                  mulhsu       ra, t3, a0
                  mulhu        a5, a3, t5
                  c.srai       s0, 8
                  sra          a3, t2, s2
                  c.srli       a0, 16
                  addi         s3, s2, -1824
                  c.srli       a0, 16
                  c.xor        a0, s1
                  c.addi4spn   a0, sp, 368
                  xori         sp, ra, -1938
                  c.andi       a3, 13
                  auipc        tp, 368653
                  slli         t1, ra, 5
                  xori         sp, ra, -1938
                  c.nop
                  divu         a7, s4, t2
                  srl          t4, s1, t1
                  mulhu        a5, a3, t5
                  ori          a6, t4, 27
                  srli         s4, s3, 13
                  slli         t1, ra, 5
                  sltu         s6, s9, sp
                  and          s3, a6, s7
                  lui          a7, 1036702
                  addi         s3, s2, -1824
                  lui          a7, 1036702
                  add          s4, a1, t4
                  and          s3, a6, s7
                  c.srai       s0, 8
                  sltiu        a6, ra, -900
                  c.slli       tp, 29
                  c.lui        s10, 18
                  auipc        tp, 368653
                  div          t3, sp, t0
                  c.and        a0, s0
                  c.addi16sp   sp, 256
                  c.or         a2, s0
                  sra          a3, t2, s2
                  srl          t4, s1, t1
                  slti         sp, a1, 426
                  mulhsu       ra, t3, a0
                  divu         a7, s4, t2
                  c.nop
                  and          s3, a6, s7
                  srl          t4, s1, t1
                  c.srli       a0, 16
                  c.andi       a3, 13
                  c.add        a2, t6
                  c.addi4spn   a0, sp, 368
                  sra          a3, t2, s2
                  slli         t1, ra, 5
                  c.li         s3, 9
                  xor          tp, a3, tp
                  xor          tp, a3, tp
                  c.slli       tp, 29
                  and          s3, a6, s7
                  ori          a6, t4, 27
                  c.mv         s6, s5
                  sltu         s6, s9, sp
                  c.srai       s0, 8
                  slti         sp, a1, 426
                  slli         t1, ra, 5
                  slti         sp, a1, 426
                  slti         sp, a1, 426
                  c.li         s3, 9
                  lui          a7, 1036702
                  c.lui        s10, 18
                  c.andi       a3, 13
                  addi         s3, s2, -1824
                  auipc        tp, 368653
                  srl          t4, s1, t1
                  remu         sp, s3, s7
                  c.addi       s7, -1
                  c.addi4spn   a0, sp, 368
                  lui          a7, 1036702
                  div          t3, sp, t0
                  slt          s3, a6, a0
                  c.li         s3, 9
                  or           t1, a5, t0
                  c.slli       tp, 29
                  c.addi16sp   sp, 256
                  auipc        tp, 368653
                  addi         s3, s2, -1824
                  c.srai       s0, 8
                  andi         a4, a7, -1410
                  ori          a6, t4, 27
                  sra          a3, t2, s2
                  sub          sp, t0, a2
                  c.or         a2, s0
                  div          t3, sp, t0
                  c.and        a0, s0
                  addi         s3, s2, -1824
                  srl          t4, s1, t1
                  and          s3, a6, s7
                  remu         sp, s3, s7
                  ori          a6, t4, 27
                  mulh         s8, zero, tp
                  c.addi       s7, -1
                  sltiu        a6, ra, -900
                  mulhsu       ra, t3, a0
                  sub          sp, t0, a2
                  slli         t1, ra, 5
                  c.and        a0, s0
                  slti         sp, a1, 426
                  c.xor        a0, s1
                  c.mv         s6, s5
                  div          t3, sp, t0
                  c.addi       s7, -1
                  c.add        a2, t6
                  c.addi4spn   a0, sp, 368
                  sub          sp, t0, a2
                  c.srli       a0, 16
                  c.slli       tp, 29
                  addi         s3, s2, -1824
                  c.mv         s6, s5
                  c.nop
                  and          s3, a6, s7
                  sltiu        a6, ra, -900
                  remu         sp, s3, s7
                  or           t1, a5, t0
                  c.or         a2, s0
                  c.lui        s10, 18
                  c.and        a0, s0
                  c.mv         s6, s5
                  sltu         s6, s9, sp
                  c.srli       a0, 16
                  rem          t1, s7, s2
                  c.xor        a0, s1
                  and          s3, a6, s7
                  srai         a4, ra, 3
                  sra          a3, t2, s2
                  slt          s3, a6, a0
                  addi         s3, s2, -1824
                  mulhsu       ra, t3, a0
                  c.xor        a0, s1
                  c.srai       s0, 8
                  and          s3, a6, s7
                  c.mv         s6, s5
                  auipc        tp, 368653
                  sll          t2, gp, a3
                  or           t1, a5, t0
                  c.andi       a3, 13
                  srai         a4, ra, 3
                  c.addi16sp   sp, 256
                  addi         s3, s2, -1824
                  c.nop
                  slti         sp, a1, 426
                  andi         a4, a7, -1410
                  mulhu        a5, a3, t5
                  auipc        tp, 368653
                  slt          s3, a6, a0
                  c.andi       a3, 13
                  auipc        tp, 368653
                  c.srai       s0, 8
                  c.mv         s6, s5
                  add          s4, a1, t4
                  sltu         s6, s9, sp
                  c.add        a2, t6
                  c.add        a2, t6
                  lui          a7, 1036702
                  c.addi16sp   sp, 256
                  c.or         a2, s0
                  c.xor        a0, s1
                  sll          t2, gp, a3
                  ori          a6, t4, 27
                  mulhsu       ra, t3, a0
                  c.srli       a0, 16
                  c.and        a0, s0
                  mul          s7, t5, a5
                  c.li         s3, 9
                  c.or         a2, s0
                  c.nop
                  slt          s3, a6, a0
                  srl          t4, s1, t1
                  sub          sp, t0, a2
                  c.or         a2, s0
                  c.srli       a0, 16
                  divu         a7, s4, t2
                  c.or         a2, s0
                  sltu         s6, s9, sp
                  srl          t4, s1, t1
                  rem          t1, s7, s2
                  c.andi       a3, 13
                  or           t1, a5, t0
                  rem          t1, s7, s2
                  nop
                  mulhsu       ra, t3, a0
                  mulhsu       ra, t3, a0
                  lui          a7, 1036702
                  c.addi       s7, -1
                  c.addi       s7, -1
                  and          s3, a6, s7
                  xori         sp, ra, -1938
                  remu         sp, s3, s7
                  mulh         s8, zero, tp
                  sltu         s6, s9, sp
                  c.addi       s7, -1
                  slt          s3, a6, a0
                  mulhsu       ra, t3, a0
                  mulhu        a5, a3, t5
                  xor          tp, a3, tp
                  rem          t1, s7, s2
                  c.and        a0, s0
                  nop
                  mulhu        a5, a3, t5
                  and          s3, a6, s7
                  c.mv         s6, s5
                  xori         sp, ra, -1938
                  nop
                  c.lui        s10, 18
                  c.xor        a0, s1
                  slti         sp, a1, 426
                  nop
                  c.nop
                  c.mv         s6, s5
                  slti         sp, a1, 426
                  andi         a4, a7, -1410
                  c.or         a2, s0
                  or           t1, a5, t0
                  c.xor        a0, s1
                  c.slli       tp, 29
                  slli         t1, ra, 5
                  srai         a4, ra, 3
                  c.sub        a0, a1
                  lui          a7, 1036702
                  remu         sp, s3, s7
                  c.nop
                  mul          s7, t5, a5
                  c.add        a2, t6
                  c.sub        a0, a1
                  slti         sp, a1, 426
                  slti         sp, a1, 426
                  ori          a6, t4, 27
                  c.add        a2, t6
                  mulhu        a5, a3, t5
                  rem          t1, s7, s2
                  sltu         s6, s9, sp
                  c.slli       tp, 29
                  srai         a4, ra, 3
                  c.li         s3, 9
                  divu         a7, s4, t2
                  c.add        a2, t6
                  mulh         s8, zero, tp
                  c.nop
                  c.and        a0, s0
                  srli         s4, s3, 13
                  sub          sp, t0, a2
                  mul          s7, t5, a5
                  c.add        a2, t6
                  auipc        tp, 368653
                  sltu         s6, s9, sp
                  mulhu        a5, a3, t5
                  sltiu        a6, ra, -900
                  ori          a6, t4, 27
                  sltu         s6, s9, sp
                  xor          tp, a3, tp
                  sra          a3, t2, s2
                  xor          tp, a3, tp
                  divu         a7, s4, t2
                  c.mv         s6, s5
                  auipc        tp, 368653
                  c.addi4spn   a0, sp, 368
                  c.addi4spn   a0, sp, 368
                  c.nop
                  slli         t1, ra, 5
                  c.andi       a3, 13
                  ori          a6, t4, 27
                  c.lui        s10, 18
                  auipc        tp, 368653
                  c.slli       tp, 29
                  mulhu        a5, a3, t5
                  c.li         s3, 9
                  srl          t4, s1, t1
                  rem          t1, s7, s2
                  divu         a7, s4, t2
                  lui          a7, 1036702
                  c.andi       a3, 13
                  sll          t2, gp, a3
                  c.xor        a0, s1
                  addi         s3, s2, -1824
                  sll          t2, gp, a3
                  mulh         s8, zero, tp
                  and          s3, a6, s7
                  sub          sp, t0, a2
                  c.add        a2, t6
                  c.slli       tp, 29
                  remu         sp, s3, s7
                  slti         sp, a1, 426
                  c.lui        s10, 18
                  mulh         s8, zero, tp
                  andi         a4, a7, -1410
                  andi         a4, a7, -1410
                  add          s4, a1, t4
                  c.nop
                  addi         s3, s2, -1824
                  slti         sp, a1, 426
                  sll          t2, gp, a3
                  sub          sp, t0, a2
                  slli         t1, ra, 5
                  nop
                  lui          a7, 1036702
                  ori          a6, t4, 27
                  rem          t1, s7, s2
                  c.sub        a0, a1
                  c.nop
                  mulhsu       ra, t3, a0
                  div          t3, sp, t0
                  mul          s7, t5, a5
                  c.addi4spn   a0, sp, 368
                  sltiu        a6, ra, -900
                  lui          a7, 1036702
                  sll          t2, gp, a3
                  rem          t1, s7, s2
                  auipc        tp, 368653
                  rem          t1, s7, s2
                  c.or         a2, s0
                  ori          a6, t4, 27
                  lui          a7, 1036702
                  srai         a4, ra, 3
                  mulhsu       ra, t3, a0
                  c.addi16sp   sp, 256
                  sra          a3, t2, s2
                  c.nop
                  mulhsu       ra, t3, a0
                  andi         a4, a7, -1410
                  c.mv         s6, s5
                  slli         t1, ra, 5
                  andi         a4, a7, -1410
                  c.and        a0, s0
                  divu         a7, s4, t2
                  sltiu        a6, ra, -900
                  c.xor        a0, s1
                  c.mv         s6, s5
                  srai         a4, ra, 3
                  divu         a7, s4, t2
                  c.addi4spn   a0, sp, 368
                  sltiu        a6, ra, -900
                  c.or         a2, s0
                  nop
                  remu         sp, s3, s7
                  mulhsu       ra, t3, a0
                  c.or         a2, s0
                  c.addi       s7, -1
                  c.and        a0, s0
                  nop
                  xori         sp, ra, -1938
                  c.addi       s7, -1
                  c.xor        a0, s1
                  slti         sp, a1, 426
                  or           t1, a5, t0
                  c.srai       s0, 8
                  c.addi       s7, -1
                  xor          tp, a3, tp
                  lui          a7, 1036702
                  slti         sp, a1, 426
                  c.xor        a0, s1
                  div          t3, sp, t0
                  sra          a3, t2, s2
                  slli         t1, ra, 5
                  div          t3, sp, t0
                  c.slli       tp, 29
                  c.andi       a3, 13
                  sltu         s6, s9, sp
                  slt          s3, a6, a0
                  ori          a6, t4, 27
                  sll          t2, gp, a3
                  c.addi4spn   a0, sp, 368
                  c.slli       tp, 29
                  c.xor        a0, s1
                  lui          a7, 1036702
                  c.addi4spn   a0, sp, 368
                  srli         s4, s3, 13
                  slt          s3, a6, a0
                  c.li         s3, 9
                  srli         s4, s3, 13
                  slt          s3, a6, a0
                  c.li         s3, 9
                  slti         sp, a1, 426
                  ori          a6, t4, 27
                  remu         sp, s3, s7
                  srai         a4, ra, 3
                  sub          sp, t0, a2
                  mulhu        a5, a3, t5
                  srli         s4, s3, 13
                  remu         sp, s3, s7
                  lui          a7, 1036702
                  c.addi       s7, -1
                  c.srai       s0, 8
                  nop
                  c.mv         s6, s5
                  mulhu        a5, a3, t5
                  c.srli       a0, 16
                  andi         a4, a7, -1410
                  c.lui        s10, 18
                  c.nop
                  c.or         a2, s0
                  or           t1, a5, t0
                  lui          a7, 1036702
                  divu         a7, s4, t2
                  c.or         a2, s0
                  xori         sp, ra, -1938
                  srai         a4, ra, 3
                  sub          sp, t0, a2
                  or           t1, a5, t0
                  xori         sp, ra, -1938
                  sltiu        a6, ra, -900
                  c.slli       tp, 29
                  c.srai       s0, 8
                  c.srli       a0, 16
                  c.slli       tp, 29
                  or           t1, a5, t0
                  and          s3, a6, s7
                  and          s3, a6, s7
                  srai         a4, ra, 3
                  c.addi       s7, -1
                  mul          s7, t5, a5
                  c.xor        a0, s1
                  or           t1, a5, t0
                  c.srli       a0, 16
                  rem          t1, s7, s2
                  ori          a6, t4, 27
                  c.addi16sp   sp, 256
                  sub          sp, t0, a2
                  c.xor        a0, s1
                  mulh         s8, zero, tp
                  c.addi4spn   a0, sp, 368
                  andi         a4, a7, -1410
                  mulhsu       ra, t3, a0
                  divu         a7, s4, t2
                  mulhu        a5, a3, t5
                  mul          s7, t5, a5
                  c.andi       a3, 13
                  c.andi       a3, 13
                  c.srli       a0, 16
                  sra          a3, t2, s2
                  addi         s3, s2, -1824
                  slti         sp, a1, 426
                  addi         s3, s2, -1824
                  c.srli       a0, 16
                  c.mv         s6, s5
                  c.or         a2, s0
                  addi         s3, s2, -1824
                  c.mv         s6, s5
                  divu         a7, s4, t2
                  slt          s3, a6, a0
                  div          t3, sp, t0
                  c.or         a2, s0
                  sltiu        a6, ra, -900
                  c.xor        a0, s1
                  xori         sp, ra, -1938
                  nop
                  srai         a4, ra, 3
                  c.srai       s0, 8
                  c.add        a2, t6
                  c.slli       tp, 29
                  xori         sp, ra, -1938
                  c.srli       a0, 16
                  sltiu        a6, ra, -900
                  c.mv         s6, s5
                  mul          s7, t5, a5
                  slti         sp, a1, 426
                  srl          t4, s1, t1
                  c.nop
                  c.srai       s0, 8
                  mulh         s8, zero, tp
                  add          s4, a1, t4
                  andi         a4, a7, -1410
                  c.addi4spn   a0, sp, 368
                  c.andi       a3, 13
                  c.addi16sp   sp, 256
                  c.srai       s0, 8
                  ori          a6, t4, 27
                  mulhu        a5, a3, t5
                  and          s3, a6, s7
                  and          s3, a6, s7
                  c.xor        a0, s1
                  c.or         a2, s0
                  sub          sp, t0, a2
                  xori         sp, ra, -1938
                  srli         s4, s3, 13
                  c.sub        a0, a1
                  sub          sp, t0, a2
                  and          s3, a6, s7
                  ori          a6, t4, 27
                  srai         a4, ra, 3
                  and          s3, a6, s7
                  slt          s3, a6, a0
                  ori          a6, t4, 27
                  auipc        tp, 368653
                  c.slli       tp, 29
                  c.addi16sp   sp, 256
                  mulh         s8, zero, tp
                  ori          a6, t4, 27
                  auipc        tp, 368653
                  slt          s3, a6, a0
                  and          s3, a6, s7
                  c.add        a2, t6
                  c.srai       s0, 8
                  slli         t1, ra, 5
                  srl          t4, s1, t1
                  c.li         s3, 9
                  divu         a7, s4, t2
                  c.srai       s0, 8
                  c.addi       s7, -1
                  and          s3, a6, s7
                  mul          s7, t5, a5
                  xori         sp, ra, -1938
                  srl          t4, s1, t1
                  c.or         a2, s0
                  c.li         s3, 9
                  div          t3, sp, t0
                  c.nop
                  remu         sp, s3, s7
                  add          s4, a1, t4
                  and          s3, a6, s7
                  c.slli       tp, 29
                  andi         a4, a7, -1410
                  or           t1, a5, t0
                  sltiu        a6, ra, -900
                  c.andi       a3, 13
                  c.nop
                  c.li         s3, 9
                  srai         a4, ra, 3
                  c.addi       s7, -1
                  and          s3, a6, s7
                  sll          t2, gp, a3
                  slt          s3, a6, a0
                  c.slli       tp, 29
                  c.lui        s10, 18
                  lui          a7, 1036702
                  divu         a7, s4, t2
                  add          s4, a1, t4
                  nop
                  slt          s3, a6, a0
                  c.addi       s7, -1
                  c.srli       a0, 16
                  c.andi       a3, 13
                  slli         t1, ra, 5
                  rem          t1, s7, s2
                  c.nop
                  c.xor        a0, s1
                  auipc        tp, 368653
                  sra          a3, t2, s2
                  or           t1, a5, t0
                  slt          s3, a6, a0
                  lui          a7, 1036702
                  c.sub        a0, a1
                  nop
                  slt          s3, a6, a0
                  c.addi       s7, -1
                  c.andi       a3, 13
                  xor          tp, a3, tp
                  c.addi       s7, -1
                  slti         sp, a1, 426
                  srl          t4, s1, t1
                  ori          a6, t4, 27
                  nop
                  c.slli       tp, 29
                  lui          a7, 1036702
                  xori         sp, ra, -1938
                  mulh         s8, zero, tp
                  c.lui        s10, 18
                  div          t3, sp, t0
                  ori          a6, t4, 27
                  sltu         s6, s9, sp
                  c.li         s3, 9
                  slli         t1, ra, 5
                  mul          s7, t5, a5
                  c.addi4spn   a0, sp, 368
                  and          s3, a6, s7
                  c.addi4spn   a0, sp, 368
                  srl          t4, s1, t1
                  divu         a7, s4, t2
                  c.sub        a0, a1
                  rem          t1, s7, s2
                  slt          s3, a6, a0
                  slli         t1, ra, 5
                  c.addi       s7, -1
                  sltiu        a6, ra, -900
                  c.andi       a3, 13
                  c.srli       a0, 16
                  c.addi4spn   a0, sp, 368
                  c.lui        s10, 18
                  c.sub        a0, a1
                  mulh         s8, zero, tp
                  auipc        tp, 368653
                  addi         s3, s2, -1824
                  andi         a4, a7, -1410
                  remu         sp, s3, s7
                  c.srli       a0, 16
                  sll          t2, gp, a3
                  ori          a6, t4, 27
                  c.addi4spn   a0, sp, 368
                  c.nop
                  c.li         s3, 9
                  div          t3, sp, t0
                  c.lui        s10, 18
                  c.srli       a0, 16
                  slli         t1, ra, 5
                  xor          tp, a3, tp
                  mulh         s8, zero, tp
                  c.li         s3, 9
                  add          s4, a1, t4
                  nop
                  srl          t4, s1, t1
                  c.xor        a0, s1
                  xor          tp, a3, tp
                  divu         a7, s4, t2
                  sltiu        a6, ra, -900
                  srai         a4, ra, 3
                  c.addi16sp   sp, 256
                  c.nop
                  c.or         a2, s0
                  c.addi       s7, -1
                  sll          t2, gp, a3
                  c.slli       tp, 29
                  c.addi4spn   a0, sp, 368
                  c.mv         s6, s5
                  c.addi       s7, -1
                  li           a4, 0x80000000 #start riscv_int_numeric_corner_stream_5
                  li           t0, 0x80000000
                  li           s8, 0x80000000
                  li           s6, 0x1c2f27af
                  li           t6, 0x0
                  li           a7, 0x80000000
                  li           s9, 0x80000000
                  li           s4, 0x0
                  li           a3, 0xffffffff
                  li           s11, 0xffffffff
                  mulh         s8, t0, s4
                  add          a7, s8, s8
                  mulhsu       a3, s9, s6
                  divu         t0, s4, s9
                  lui          t0, 1036702
                  lui          t0, 1036702
                  mulh         s8, t0, s4
                  addi         a4, a4, -1824
                  auipc        s4, 368653
                  remu         a4, a7, s9
                  auipc        s4, 368653
                  lui          t0, 1036702
                  nop
                  addi         a4, a4, -1824
                  mulh         s8, t0, s4
                  addi         a4, a4, -1824
                  sub          a4, s6, s8
                  mulhu        a7, s9, s11
                  rem          s8, s9, a4
                  auipc        s4, 368653
                  mulhu        a7, s9, s11
                  mulh         s8, t0, s4
                  rem          s8, s9, a4
                  addi         a4, a4, -1824
                  remu         a4, a7, s9 #end riscv_int_numeric_corner_stream_5
                  or           t1, a5, t0
                  c.addi4spn   a0, sp, 368
                  c.andi       a3, 13
                  sll          t2, gp, a3
                  c.srli       a0, 16
                  c.li         s3, 9
                  c.andi       a3, 13
                  sltu         s6, s9, sp
                  c.andi       a3, 13
                  slt          s3, a6, a0
                  srli         s4, s3, 13
                  c.nop
                  sltu         s6, s9, sp
                  sub          sp, t0, a2
                  c.andi       a3, 13
                  or           t1, a5, t0
                  xor          tp, a3, tp
                  rem          t1, s7, s2
                  mulhu        a5, a3, t5
                  c.add        a2, t6
                  c.slli       tp, 29
                  c.srli       a0, 16
                  c.add        a2, t6
                  c.li         s3, 9
                  c.and        a0, s0
                  sra          a3, t2, s2
                  and          s3, a6, s7
                  sra          a3, t2, s2
                  slti         sp, a1, 426
                  rem          t1, s7, s2
                  mulh         s8, zero, tp
                  slti         sp, a1, 426
                  srli         s4, s3, 13
                  srai         a4, ra, 3
                  c.slli       tp, 29
                  sub          sp, t0, a2
                  rem          t1, s7, s2
                  slli         t1, ra, 5
                  divu         a7, s4, t2
                  c.slli       tp, 29
                  mulhsu       ra, t3, a0
                  c.li         s3, 9
                  sra          a3, t2, s2
                  c.and        a0, s0
                  sll          t2, gp, a3
                  c.sub        a0, a1
                  sub          sp, t0, a2
                  ori          a6, t4, 27
                  c.add        a2, t6
                  sltu         s6, s9, sp
                  srai         a4, ra, 3
                  divu         a7, s4, t2
                  c.lui        s10, 18
                  lui          a7, 1036702
                  c.slli       tp, 29
                  slli         t1, ra, 5
                  c.addi4spn   a0, sp, 368
                  sltiu        a6, ra, -900
                  andi         a4, a7, -1410
                  xor          tp, a3, tp
                  srl          t4, s1, t1
                  sltu         s6, s9, sp
                  mul          s7, t5, a5
                  or           t1, a5, t0
                  c.or         a2, s0
                  c.and        a0, s0
                  c.srai       s0, 8
                  mulhu        a5, a3, t5
                  mulh         s8, zero, tp
                  sll          t2, gp, a3
                  slti         sp, a1, 426
                  sltu         s6, s9, sp
                  c.addi       s7, -1
                  rem          t1, s7, s2
                  c.nop
                  sltu         s6, s9, sp
                  slli         t1, ra, 5
                  slt          s3, a6, a0
                  sll          t2, gp, a3
                  slti         sp, a1, 426
                  remu         sp, s3, s7
                  sltiu        a6, ra, -900
                  mul          s7, t5, a5
                  andi         a4, a7, -1410
                  c.addi16sp   sp, 256
                  c.andi       a3, 13
                  mulhu        a5, a3, t5
                  mul          s7, t5, a5
                  srli         s4, s3, 13
                  mulh         s8, zero, tp
                  divu         a7, s4, t2
                  remu         sp, s3, s7
                  auipc        tp, 368653
                  mulh         s8, zero, tp
                  mul          s7, t5, a5
                  srl          t4, s1, t1
                  mulhsu       ra, t3, a0
                  rem          t1, s7, s2
                  auipc        tp, 368653
                  rem          t1, s7, s2
                  c.lui        s10, 18
                  c.srai       s0, 8
                  c.or         a2, s0
                  sub          sp, t0, a2
                  slt          s3, a6, a0
                  xor          tp, a3, tp
                  c.and        a0, s0
                  mulhsu       ra, t3, a0
                  slti         sp, a1, 426
                  div          t3, sp, t0
                  addi         s3, s2, -1824
                  slt          s3, a6, a0
                  mulhsu       ra, t3, a0
                  c.srai       s0, 8
                  c.lui        s10, 18
                  sub          sp, t0, a2
                  lui          a7, 1036702
                  nop
                  and          s3, a6, s7
                  slt          s3, a6, a0
                  c.addi4spn   a0, sp, 368
                  or           t1, a5, t0
                  sltiu        a6, ra, -900
                  divu         a7, s4, t2
                  auipc        tp, 368653
                  nop
                  sra          a3, t2, s2
                  divu         a7, s4, t2
                  c.addi4spn   a0, sp, 368
                  c.addi16sp   sp, 256
                  srli         s4, s3, 13
                  div          t3, sp, t0
                  sra          a3, t2, s2
                  lui          a7, 1036702
                  c.and        a0, s0
                  sltiu        a6, ra, -900
                  sll          t2, gp, a3
                  c.sub        a0, a1
                  sll          t2, gp, a3
                  c.addi16sp   sp, 256
                  c.addi       s7, -1
                  srai         a4, ra, 3
                  rem          t1, s7, s2
                  remu         sp, s3, s7
                  c.and        a0, s0
                  c.sub        a0, a1
                  mulhsu       ra, t3, a0
                  add          s4, a1, t4
                  sll          t2, gp, a3
                  mulhsu       ra, t3, a0
                  ori          a6, t4, 27
                  c.or         a2, s0
                  c.lui        s10, 18
                  c.andi       a3, 13
                  div          t3, sp, t0
                  c.add        a2, t6
                  c.andi       a3, 13
                  ori          a6, t4, 27
                  c.slli       tp, 29
                  mulhsu       ra, t3, a0
                  rem          t1, s7, s2
                  slti         sp, a1, 426
                  mulhsu       ra, t3, a0
                  srl          t4, s1, t1
                  nop
                  and          s3, a6, s7
                  xori         sp, ra, -1938
                  c.add        a2, t6
                  srli         s4, s3, 13
                  c.add        a2, t6
                  sll          t2, gp, a3
                  mulh         s8, zero, tp
                  rem          t1, s7, s2
                  c.srli       a0, 16
                  c.xor        a0, s1
                  sltiu        a6, ra, -900
                  slli         t1, ra, 5
                  c.andi       a3, 13
                  c.xor        a0, s1
                  sltu         s6, s9, sp
                  c.andi       a3, 13
                  srai         a4, ra, 3
                  c.li         s3, 9
                  remu         sp, s3, s7
                  c.addi16sp   sp, 256
                  mulhu        a5, a3, t5
                  and          s3, a6, s7
                  sra          a3, t2, s2
                  mulhsu       ra, t3, a0
                  xor          tp, a3, tp
                  slt          s3, a6, a0
                  add          s4, a1, t4
                  c.and        a0, s0
                  c.sub        a0, a1
                  c.nop
                  mulhsu       ra, t3, a0
                  c.lui        s10, 18
                  c.li         s3, 9
                  c.xor        a0, s1
                  addi         s3, s2, -1824
                  mulh         s8, zero, tp
                  sll          t2, gp, a3
                  c.srli       a0, 16
                  mulhu        a5, a3, t5
                  c.srai       s0, 8
                  mulh         s8, zero, tp
                  c.li         s3, 9
                  sltiu        a6, ra, -900
                  sll          t2, gp, a3
                  c.mv         s6, s5
                  and          s3, a6, s7
                  c.andi       a3, 13
                  c.and        a0, s0
                  xor          tp, a3, tp
                  sltiu        a6, ra, -900
                  c.xor        a0, s1
                  c.slli       tp, 29
                  c.addi4spn   a0, sp, 368
                  srl          t4, s1, t1
                  sltiu        a6, ra, -900
                  mulhu        a5, a3, t5
                  mulh         s8, zero, tp
                  sltu         s6, s9, sp
                  c.slli       tp, 29
                  c.addi       s7, -1
                  c.slli       tp, 29
                  c.mv         s6, s5
                  c.addi       s7, -1
                  ori          a6, t4, 27
                  lui          a7, 1036702
                  sltiu        a6, ra, -900
                  ori          a6, t4, 27
                  c.srai       s0, 8
                  c.srli       a0, 16
                  divu         a7, s4, t2
                  srai         a4, ra, 3
                  and          s3, a6, s7
                  c.slli       tp, 29
                  xori         sp, ra, -1938
                  xori         sp, ra, -1938
                  sll          t2, gp, a3
                  sra          a3, t2, s2
                  slli         t1, ra, 5
                  div          t3, sp, t0
                  srai         a4, ra, 3
                  lui          a7, 1036702
                  mulhu        a5, a3, t5
                  srl          t4, s1, t1
                  sra          a3, t2, s2
                  srai         a4, ra, 3
                  mulhsu       ra, t3, a0
                  c.add        a2, t6
                  auipc        tp, 368653
                  xor          tp, a3, tp
                  c.and        a0, s0
                  mulhu        a5, a3, t5
                  sltiu        a6, ra, -900
                  c.add        a2, t6
                  c.sub        a0, a1
                  slt          s3, a6, a0
                  auipc        tp, 368653
                  lui          a7, 1036702
                  slt          s3, a6, a0
                  mulhu        a5, a3, t5
                  c.addi4spn   a0, sp, 368
                  addi         s3, s2, -1824
                  and          s3, a6, s7
                  slt          s3, a6, a0
                  c.li         s3, 9
                  srai         a4, ra, 3
                  slt          s3, a6, a0
                  c.mv         s6, s5
                  or           t1, a5, t0
                  auipc        tp, 368653
                  srl          t4, s1, t1
                  c.addi4spn   a0, sp, 368
                  c.sub        a0, a1
                  slt          s3, a6, a0
                  srl          t4, s1, t1
                  sra          a3, t2, s2
                  sub          sp, t0, a2
                  c.addi16sp   sp, 256
                  c.add        a2, t6
                  auipc        tp, 368653
                  sll          t2, gp, a3
                  ori          a6, t4, 27
                  lui          a7, 1036702
                  sra          a3, t2, s2
                  nop
                  mul          s7, t5, a5
                  lui          a7, 1036702
                  c.mv         s6, s5
                  mul          s7, t5, a5
                  c.nop
                  mulhu        a5, a3, t5
                  srai         a4, ra, 3
                  mulh         s8, zero, tp
                  ori          a6, t4, 27
                  c.and        a0, s0
                  nop
                  mulhu        a5, a3, t5
                  c.mv         s6, s5
                  c.slli       tp, 29
                  mulhu        a5, a3, t5
                  c.xor        a0, s1
                  srl          t4, s1, t1
                  c.addi4spn   a0, sp, 368
                  mul          s7, t5, a5
                  srli         s4, s3, 13
                  xor          tp, a3, tp
                  divu         a7, s4, t2
                  andi         a4, a7, -1410
                  lui          a7, 1036702
                  srl          t4, s1, t1
                  mul          s7, t5, a5
                  c.andi       a3, 13
                  sltiu        a6, ra, -900
                  c.and        a0, s0
                  andi         a4, a7, -1410
                  c.li         s3, 9
                  slli         t1, ra, 5
                  addi         s3, s2, -1824
                  c.addi4spn   a0, sp, 368
                  mulh         s8, zero, tp
                  div          t3, sp, t0
                  c.addi16sp   sp, 256
                  add          s4, a1, t4
                  andi         a4, a7, -1410
                  srli         s4, s3, 13
                  c.lui        s10, 18
                  add          s4, a1, t4
                  xor          tp, a3, tp
                  srai         a4, ra, 3
                  c.nop
                  slti         sp, a1, 426
                  c.srai       s0, 8
                  srli         s4, s3, 13
                  auipc        tp, 368653
                  c.nop
                  mulh         s8, zero, tp
                  slli         t1, ra, 5
                  divu         a7, s4, t2
                  auipc        tp, 368653
                  slti         sp, a1, 426
                  div          t3, sp, t0
                  auipc        tp, 368653
                  sll          t2, gp, a3
                  c.xor        a0, s1
                  sub          sp, t0, a2
                  rem          t1, s7, s2
                  mulh         s8, zero, tp
                  c.or         a2, s0
                  mulhsu       ra, t3, a0
                  c.li         s3, 9
                  xori         sp, ra, -1938
                  mulhsu       ra, t3, a0
                  c.add        a2, t6
                  c.or         a2, s0
                  auipc        tp, 368653
                  c.mv         s6, s5
                  slli         t1, ra, 5
                  nop
                  c.add        a2, t6
                  c.addi16sp   sp, 256
                  nop
                  c.and        a0, s0
                  sltiu        a6, ra, -900
                  c.lui        s10, 18
                  c.srli       a0, 16
                  rem          t1, s7, s2
                  remu         sp, s3, s7
                  sra          a3, t2, s2
                  auipc        tp, 368653
                  mulh         s8, zero, tp
                  sltu         s6, s9, sp
                  c.and        a0, s0
                  sltu         s6, s9, sp
                  sub          sp, t0, a2
                  ori          a6, t4, 27
                  c.srli       a0, 16
                  c.mv         s6, s5
                  c.srli       a0, 16
                  srl          t4, s1, t1
                  sll          t2, gp, a3
                  mulhsu       ra, t3, a0
                  mul          s7, t5, a5
                  lui          a7, 1036702
                  addi         s3, s2, -1824
                  slli         t1, ra, 5
                  add          s4, a1, t4
                  addi         s3, s2, -1824
                  c.srai       s0, 8
                  lui          a7, 1036702
                  or           t1, a5, t0
                  srai         a4, ra, 3
                  slti         sp, a1, 426
                  xor          tp, a3, tp
                  c.add        a2, t6
                  addi         s3, s2, -1824
                  mul          s7, t5, a5
                  slt          s3, a6, a0
                  div          t3, sp, t0
                  remu         sp, s3, s7
                  c.slli       tp, 29
                  c.and        a0, s0
                  xori         sp, ra, -1938
                  slli         t1, ra, 5
                  srli         s4, s3, 13
                  rem          t1, s7, s2
                  remu         sp, s3, s7
                  c.lui        s10, 18
                  sll          t2, gp, a3
                  c.xor        a0, s1
                  lui          a7, 1036702
                  c.lui        s10, 18
                  c.xor        a0, s1
                  c.srai       s0, 8
                  c.and        a0, s0
                  c.xor        a0, s1
                  c.addi4spn   a0, sp, 368
                  srli         s4, s3, 13
                  mulhsu       ra, t3, a0
                  sub          sp, t0, a2
                  srli         s4, s3, 13
                  nop
                  or           t1, a5, t0
                  xor          tp, a3, tp
                  add          s4, a1, t4
                  c.lui        s10, 18
                  c.addi4spn   a0, sp, 368
                  auipc        tp, 368653
                  slt          s3, a6, a0
                  ori          a6, t4, 27
                  slti         sp, a1, 426
                  sll          t2, gp, a3
                  and          s3, a6, s7
                  mulh         s8, zero, tp
                  divu         a7, s4, t2
                  c.lui        s10, 18
                  c.li         s3, 9
                  c.add        a2, t6
                  c.nop
                  auipc        tp, 368653
                  add          s4, a1, t4
                  mulhu        a5, a3, t5
                  c.sub        a0, a1
                  andi         a4, a7, -1410
                  divu         a7, s4, t2
                  sra          a3, t2, s2
                  li           s8, 0x80000000 #start riscv_int_numeric_corner_stream_32
                  li           sp, 0xffffffff
                  li           t2, 0x0
                  li           a7, 0x80000000
                  li           a4, 0xffffffff
                  li           a2, 0xffffffff
                  li           s6, 0x80000000
                  li           ra, 0xd3aa408f
                  li           a6, 0x0
                  li           gp, 0xffffffff
                  sub          gp, a4, a6
                  add          t2, a6, a6
                  nop
                  mul          a4, a4, a7
                  rem          a6, a7, gp
                  addi         gp, gp, -1824
                  auipc        a2, 368653
                  rem          a6, a7, gp
                  mulh         a6, ra, a2
                  nop
                  mulhsu       sp, a7, a4
                  divu         ra, a2, a7
                  auipc        a2, 368653
                  auipc        a2, 368653
                  remu         gp, t2, a7
                  auipc        a2, 368653
                  addi         gp, gp, -1824
                  remu         gp, t2, a7
                  remu         gp, t2, a7
                  mulh         a6, ra, a2
                  addi         gp, gp, -1824 #end riscv_int_numeric_corner_stream_32
                  c.slli       tp, 29
                  c.nop
                  rem          t1, s7, s2
                  sra          a3, t2, s2
                  xori         sp, ra, -1938
                  and          s3, a6, s7
                  c.addi       s7, -1
                  c.xor        a0, s1
                  c.andi       a3, 13
                  slti         sp, a1, 426
                  c.and        a0, s0
                  c.mv         s6, s5
                  rem          t1, s7, s2
                  divu         a7, s4, t2
                  c.srai       s0, 8
                  sub          sp, t0, a2
                  srl          t4, s1, t1
                  c.srai       s0, 8
                  c.nop
                  c.nop
                  or           t1, a5, t0
                  andi         a4, a7, -1410
                  mulh         s8, zero, tp
                  c.nop
                  c.lui        s10, 18
                  auipc        tp, 368653
                  c.sub        a0, a1
                  xori         sp, ra, -1938
                  srli         s4, s3, 13
                  c.nop
                  xori         sp, ra, -1938
                  c.sub        a0, a1
                  rem          t1, s7, s2
                  mulhu        a5, a3, t5
                  sub          sp, t0, a2
                  nop
                  nop
                  lui          a7, 1036702
                  c.srli       a0, 16
                  add          s4, a1, t4
                  c.li         s3, 9
                  slli         t1, ra, 5
                  sub          sp, t0, a2
                  rem          t1, s7, s2
                  c.addi16sp   sp, 256
                  add          s4, a1, t4
                  and          s3, a6, s7
                  slti         sp, a1, 426
                  remu         sp, s3, s7
                  and          s3, a6, s7
                  sub          sp, t0, a2
                  addi         s3, s2, -1824
                  li           t4, 0xffffffff #start riscv_int_numeric_corner_stream_27
                  li           a0, 0x80000000
                  li           s2, 0x9cc79e4d
                  li           ra, 0xffffffff
                  li           a5, 0x0
                  li           tp, 0x0
                  li           a2, 0x80000000
                  li           gp, 0x0
                  li           a7, 0x80000000
                  li           a6, 0x0
                  div          a2, tp, a5
                  addi         tp, tp, -1824
                  mulhsu       gp, a7, a5
                  add          a0, a6, a6
                  divu         ra, a2, a7
                  mul          a5, a5, a7
                  mulhsu       gp, a7, a5
                  rem          a6, a7, tp
                  auipc        a2, 368653
                  nop
                  auipc        a2, 368653
                  mulhu        a0, a7, s2
                  rem          a6, a7, tp
                  div          a2, tp, a5
                  mulh         a6, ra, a2
                  div          a2, tp, a5
                  lui          ra, 1036702
                  remu         tp, a0, a7
                  add          a0, a6, a6
                  rem          a6, a7, tp
                  rem          a6, a7, tp
                  addi         tp, tp, -1824
                  mulhu        a0, a7, s2
                  nop
                  addi         tp, tp, -1824
                  auipc        a2, 368653
                  rem          a6, a7, tp
                  add          a0, a6, a6
                  sub          tp, a5, a6 #end riscv_int_numeric_corner_stream_27
                  slli         t1, ra, 5
                  remu         sp, s3, s7
                  xor          tp, a3, tp
                  c.add        a2, t6
                  srai         a4, ra, 3
                  sll          t2, gp, a3
                  slti         sp, a1, 426
                  sra          a3, t2, s2
                  mulhsu       ra, t3, a0
                  sltiu        a6, ra, -900
                  c.andi       a3, 13
                  c.nop
                  and          s3, a6, s7
                  c.li         s3, 9
                  c.addi       s7, -1
                  remu         sp, s3, s7
                  auipc        tp, 368653
                  and          s3, a6, s7
                  slt          s3, a6, a0
                  c.addi       s7, -1
                  c.and        a0, s0
                  andi         a4, a7, -1410
                  c.or         a2, s0
                  srli         s4, s3, 13
                  c.add        a2, t6
                  sra          a3, t2, s2
                  rem          t1, s7, s2
                  c.xor        a0, s1
                  lui          a7, 1036702
                  c.nop
                  addi         s3, s2, -1824
                  sub          sp, t0, a2
                  c.addi       s7, -1
                  add          s4, a1, t4
                  nop
                  div          t3, sp, t0
                  or           t1, a5, t0
                  nop
                  div          t3, sp, t0
                  c.li         s3, 9
                  srl          t4, s1, t1
                  andi         a4, a7, -1410
                  and          s3, a6, s7
                  c.mv         s6, s5
                  addi         s3, s2, -1824
                  c.addi4spn   a0, sp, 368
                  ori          a6, t4, 27
                  div          t3, sp, t0
                  slti         sp, a1, 426
                  c.srai       s0, 8
                  remu         sp, s3, s7
                  c.andi       a3, 13
                  divu         a7, s4, t2
                  c.addi       s7, -1
                  lui          a7, 1036702
                  c.sub        a0, a1
                  or           t1, a5, t0
                  c.addi       s7, -1
                  add          s4, a1, t4
                  xor          tp, a3, tp
                  c.addi       s7, -1
                  srl          t4, s1, t1
                  c.or         a2, s0
                  slti         sp, a1, 426
                  slt          s3, a6, a0
                  c.addi16sp   sp, 256
                  sltiu        a6, ra, -900
                  c.or         a2, s0
                  nop
                  c.lui        s10, 18
                  nop
                  xori         sp, ra, -1938
                  c.addi4spn   a0, sp, 368
                  c.srli       a0, 16
                  slt          s3, a6, a0
                  slt          s3, a6, a0
                  c.xor        a0, s1
                  rem          t1, s7, s2
                  c.slli       tp, 29
                  lui          a7, 1036702
                  slt          s3, a6, a0
                  sltiu        a6, ra, -900
                  xor          tp, a3, tp
                  divu         a7, s4, t2
                  c.addi16sp   sp, 256
                  or           t1, a5, t0
                  slti         sp, a1, 426
                  mulhu        a5, a3, t5
                  slli         t1, ra, 5
                  mulhu        a5, a3, t5
                  c.or         a2, s0
                  xor          tp, a3, tp
                  c.add        a2, t6
                  slli         t1, ra, 5
                  c.sub        a0, a1
                  slt          s3, a6, a0
                  xor          tp, a3, tp
                  ori          a6, t4, 27
                  c.addi       s7, -1
                  mulh         s8, zero, tp
                  auipc        tp, 368653
                  xor          tp, a3, tp
                  sltiu        a6, ra, -900
                  add          s4, a1, t4
                  srli         s4, s3, 13
                  mulhsu       ra, t3, a0
                  slti         sp, a1, 426
                  c.srli       a0, 16
                  and          s3, a6, s7
                  c.or         a2, s0
                  sltu         s6, s9, sp
                  nop
                  addi         s3, s2, -1824
                  slt          s3, a6, a0
                  mulhsu       ra, t3, a0
                  mul          s7, t5, a5
                  c.mv         s6, s5
                  slti         sp, a1, 426
                  c.slli       tp, 29
                  xor          tp, a3, tp
                  div          t3, sp, t0
                  auipc        tp, 368653
                  or           t1, a5, t0
                  sll          t2, gp, a3
                  add          s4, a1, t4
                  li           s2, 0xffffffff #start riscv_int_numeric_corner_stream_2
                  li           t6, 0x0
                  li           a5, 0x4180f907
                  li           a4, 0xffffffff
                  li           a2, 0x80000000
                  li           s7, 0x80000000
                  li           s8, 0x80000000
                  li           tp, 0xffffffff
                  li           sp, 0x80000000
                  li           s9, 0x0
                  add          a4, s7, s7
                  add          a4, s7, s7
                  add          a4, s7, s7
                  div          a5, a2, s2
                  divu         sp, a5, s8
                  addi         a2, a2, -1824
                  mulh         s7, sp, a5
                  add          a4, s7, s7
                  divu         sp, a5, s8
                  rem          s7, s8, a2
                  mulh         s7, sp, a5
                  mulh         s7, sp, a5
                  div          a5, a2, s2
                  rem          s7, s8, a2
                  mulhu        a4, s8, s9
                  addi         a2, a2, -1824
                  divu         sp, a5, s8
                  mul          s2, s2, s8
                  mul          s2, s2, s8
                  rem          s7, s8, a2
                  auipc        a5, 368653
                  div          a5, a2, s2
                  add          a4, s7, s7 #end riscv_int_numeric_corner_stream_2
                  sll          t2, gp, a3
                  c.lui        s10, 18
                  c.sub        a0, a1
                  and          s3, a6, s7
                  c.sub        a0, a1
                  srl          t4, s1, t1
                  c.addi4spn   a0, sp, 368
                  auipc        tp, 368653
                  and          s3, a6, s7
                  mul          s7, t5, a5
                  sub          sp, t0, a2
                  c.srai       s0, 8
                  slt          s3, a6, a0
                  and          s3, a6, s7
                  c.sub        a0, a1
                  xor          tp, a3, tp
                  c.sub        a0, a1
                  sll          t2, gp, a3
                  c.addi       s7, -1
                  c.srli       a0, 16
                  c.srai       s0, 8
                  srai         a4, ra, 3
                  c.lui        s10, 18
                  c.add        a2, t6
                  mulh         s8, zero, tp
                  sltu         s6, s9, sp
                  slt          s3, a6, a0
                  c.and        a0, s0
                  div          t3, sp, t0
                  or           t1, a5, t0
                  c.srli       a0, 16
                  sltiu        a6, ra, -900
                  c.nop
                  sll          t2, gp, a3
                  c.mv         s6, s5
                  and          s3, a6, s7
                  mul          s7, t5, a5
                  ori          a6, t4, 27
                  ori          a6, t4, 27
                  ori          a6, t4, 27
                  or           t1, a5, t0
                  c.addi16sp   sp, 256
                  c.slli       tp, 29
                  sltu         s6, s9, sp
                  c.or         a2, s0
                  c.lui        s10, 18
                  c.lui        s10, 18
                  c.srai       s0, 8
                  c.or         a2, s0
                  c.or         a2, s0
                  c.srli       a0, 16
                  c.slli       tp, 29
                  remu         sp, s3, s7
                  c.li         s3, 9
                  xori         sp, ra, -1938
                  slli         t1, ra, 5
                  sll          t2, gp, a3
                  lui          a7, 1036702
                  c.srli       a0, 16
                  c.or         a2, s0
                  c.xor        a0, s1
                  or           t1, a5, t0
                  divu         a7, s4, t2
                  slt          s3, a6, a0
                  c.or         a2, s0
                  c.xor        a0, s1
                  srai         a4, ra, 3
                  c.srai       s0, 8
                  mulh         s8, zero, tp
                  xori         sp, ra, -1938
                  lui          a7, 1036702
                  c.addi       s7, -1
                  c.nop
                  sra          a3, t2, s2
                  andi         a4, a7, -1410
                  add          s4, a1, t4
                  mulhsu       ra, t3, a0
                  srli         s4, s3, 13
                  auipc        tp, 368653
                  mulh         s8, zero, tp
                  c.addi4spn   a0, sp, 368
                  add          s4, a1, t4
                  lui          a7, 1036702
                  div          t3, sp, t0
                  sltu         s6, s9, sp
                  srli         s4, s3, 13
                  srli         s4, s3, 13
                  or           t1, a5, t0
                  mulhu        a5, a3, t5
                  c.nop
                  c.add        a2, t6
                  slli         t1, ra, 5
                  xori         sp, ra, -1938
                  add          s4, a1, t4
                  mulhsu       ra, t3, a0
                  sltu         s6, s9, sp
                  slli         t1, ra, 5
                  c.addi       s7, -1
                  c.addi4spn   a0, sp, 368
                  c.addi4spn   a0, sp, 368
                  sub          sp, t0, a2
                  srl          t4, s1, t1
                  c.addi       s7, -1
                  addi         s3, s2, -1824
                  xor          tp, a3, tp
                  xori         sp, ra, -1938
                  mul          s7, t5, a5
                  c.srai       s0, 8
                  c.slli       tp, 29
                  slt          s3, a6, a0
                  srli         s4, s3, 13
                  lui          a7, 1036702
                  ori          a6, t4, 27
                  and          s3, a6, s7
                  add          s4, a1, t4
                  sll          t2, gp, a3
                  sra          a3, t2, s2
                  c.mv         s6, s5
                  c.li         s3, 9
                  c.xor        a0, s1
                  slti         sp, a1, 426
                  sltu         s6, s9, sp
                  srai         a4, ra, 3
                  auipc        tp, 368653
                  xori         sp, ra, -1938
                  c.xor        a0, s1
                  sltu         s6, s9, sp
                  slli         t1, ra, 5
                  c.or         a2, s0
                  c.addi       s7, -1
                  srai         a4, ra, 3
                  c.mv         s6, s5
                  c.addi16sp   sp, 256
                  c.and        a0, s0
                  c.addi       s7, -1
                  mulhu        a5, a3, t5
                  div          t3, sp, t0
                  slti         sp, a1, 426
                  add          s4, a1, t4
                  c.and        a0, s0
                  c.and        a0, s0
                  c.li         s3, 9
                  sll          t2, gp, a3
                  c.srli       a0, 16
                  xor          tp, a3, tp
                  c.addi16sp   sp, 256
                  c.li         s3, 9
                  c.and        a0, s0
                  sltiu        a6, ra, -900
                  sltiu        a6, ra, -900
                  ori          a6, t4, 27
                  nop
                  c.or         a2, s0
                  srl          t4, s1, t1
                  mulhsu       ra, t3, a0
                  c.srai       s0, 8
                  c.srli       a0, 16
                  c.nop
                  or           t1, a5, t0
                  c.addi16sp   sp, 256
                  and          s3, a6, s7
                  divu         a7, s4, t2
                  slt          s3, a6, a0
                  c.addi16sp   sp, 256
                  srli         s4, s3, 13
                  c.srli       a0, 16
                  srl          t4, s1, t1
                  and          s3, a6, s7
                  mulhsu       ra, t3, a0
                  and          s3, a6, s7
                  c.slli       tp, 29
                  and          s3, a6, s7
                  sltu         s6, s9, sp
                  sll          t2, gp, a3
                  sra          a3, t2, s2
                  divu         a7, s4, t2
                  srl          t4, s1, t1
                  c.andi       a3, 13
                  mulh         s8, zero, tp
                  sub          sp, t0, a2
                  c.slli       tp, 29
                  lui          a7, 1036702
                  remu         sp, s3, s7
                  c.addi16sp   sp, 256
                  add          s4, a1, t4
                  andi         a4, a7, -1410
                  c.add        a2, t6
                  add          s4, a1, t4
                  c.srai       s0, 8
                  sub          sp, t0, a2
                  srl          t4, s1, t1
                  auipc        tp, 368653
                  sltiu        a6, ra, -900
                  mulhsu       ra, t3, a0
                  c.addi4spn   a0, sp, 368
                  sra          a3, t2, s2
                  and          s3, a6, s7
                  auipc        tp, 368653
                  c.andi       a3, 13
                  c.mv         s6, s5
                  sra          a3, t2, s2
                  slt          s3, a6, a0
                  c.addi16sp   sp, 256
                  or           t1, a5, t0
                  mulh         s8, zero, tp
                  andi         a4, a7, -1410
                  nop
                  and          s3, a6, s7
                  c.andi       a3, 13
                  c.and        a0, s0
                  mulhsu       ra, t3, a0
                  divu         a7, s4, t2
                  and          s3, a6, s7
                  divu         a7, s4, t2
                  or           t1, a5, t0
                  mulh         s8, zero, tp
                  c.srai       s0, 8
                  c.xor        a0, s1
                  and          s3, a6, s7
                  mulh         s8, zero, tp
                  add          s4, a1, t4
                  c.lui        s10, 18
                  mul          s7, t5, a5
                  c.slli       tp, 29
                  c.andi       a3, 13
                  lui          a7, 1036702
                  c.xor        a0, s1
                  srai         a4, ra, 3
                  c.mv         s6, s5
                  or           t1, a5, t0
                  mul          s7, t5, a5
                  slt          s3, a6, a0
                  c.sub        a0, a1
                  slt          s3, a6, a0
                  andi         a4, a7, -1410
                  mulhu        a5, a3, t5
                  c.srai       s0, 8
                  c.add        a2, t6
                  nop
                  c.sub        a0, a1
                  mulhu        a5, a3, t5
                  xori         sp, ra, -1938
                  sll          t2, gp, a3
                  mulh         s8, zero, tp
                  slli         t1, ra, 5
                  c.li         s3, 9
                  c.add        a2, t6
                  slli         t1, ra, 5
                  c.slli       tp, 29
                  c.lui        s10, 18
                  slt          s3, a6, a0
                  sub          sp, t0, a2
                  c.nop
                  c.add        a2, t6
                  c.mv         s6, s5
                  sltiu        a6, ra, -900
                  mulhsu       ra, t3, a0
                  mulh         s8, zero, tp
                  divu         a7, s4, t2
                  addi         s3, s2, -1824
                  srli         s4, s3, 13
                  rem          t1, s7, s2
                  sll          t2, gp, a3
                  lui          a7, 1036702
                  remu         sp, s3, s7
                  slti         sp, a1, 426
                  addi         s3, s2, -1824
                  sub          sp, t0, a2
                  c.slli       tp, 29
                  c.lui        s10, 18
                  lui          a7, 1036702
                  c.li         s3, 9
                  ori          a6, t4, 27
                  xor          tp, a3, tp
                  mulhu        a5, a3, t5
                  xori         sp, ra, -1938
                  c.addi4spn   a0, sp, 368
                  mulh         s8, zero, tp
                  addi         s3, s2, -1824
                  c.addi       s7, -1
                  sltiu        a6, ra, -900
                  srai         a4, ra, 3
                  c.xor        a0, s1
                  sra          a3, t2, s2
                  rem          t1, s7, s2
                  sltiu        a6, ra, -900
                  mulhsu       ra, t3, a0
                  c.srli       a0, 16
                  c.andi       a3, 13
                  c.srli       a0, 16
                  mulh         s8, zero, tp
                  auipc        tp, 368653
                  c.addi16sp   sp, 256
                  or           t1, a5, t0
                  mulh         s8, zero, tp
                  srli         s4, s3, 13
                  addi         s3, s2, -1824
                  and          s3, a6, s7
                  add          s4, a1, t4
                  divu         a7, s4, t2
                  c.add        a2, t6
                  remu         sp, s3, s7
                  c.slli       tp, 29
                  c.xor        a0, s1
                  nop
                  c.add        a2, t6
                  c.addi4spn   a0, sp, 368
                  c.addi       s7, -1
                  srl          t4, s1, t1
                  c.mv         s6, s5
                  ori          a6, t4, 27
                  c.slli       tp, 29
                  srl          t4, s1, t1
                  addi         s3, s2, -1824
                  add          s4, a1, t4
                  c.slli       tp, 29
                  mulh         s8, zero, tp
                  c.slli       tp, 29
                  sll          t2, gp, a3
                  c.sub        a0, a1
                  addi         s3, s2, -1824
                  sra          a3, t2, s2
                  c.addi4spn   a0, sp, 368
                  c.mv         s6, s5
                  srli         s4, s3, 13
                  addi         s3, s2, -1824
                  c.or         a2, s0
                  c.sub        a0, a1
                  addi         s3, s2, -1824
                  c.lui        s10, 18
                  remu         sp, s3, s7
                  c.mv         s6, s5
                  nop
                  sll          t2, gp, a3
                  c.mv         s6, s5
                  andi         a4, a7, -1410
                  c.lui        s10, 18
                  c.xor        a0, s1
                  mulh         s8, zero, tp
                  sra          a3, t2, s2
                  xori         sp, ra, -1938
                  c.lui        s10, 18
                  andi         a4, a7, -1410
                  sltiu        a6, ra, -900
                  ori          a6, t4, 27
                  slti         sp, a1, 426
                  c.li         s3, 9
                  divu         a7, s4, t2
                  div          t3, sp, t0
                  mul          s7, t5, a5
                  andi         a4, a7, -1410
                  c.srli       a0, 16
                  xor          tp, a3, tp
                  c.addi4spn   a0, sp, 368
                  nop
                  add          s4, a1, t4
                  c.li         s3, 9
                  nop
                  addi         s3, s2, -1824
                  nop
                  c.lui        s10, 18
                  auipc        tp, 368653
                  mulhu        a5, a3, t5
                  xor          tp, a3, tp
                  addi         s3, s2, -1824
                  mulh         s8, zero, tp
                  sltiu        a6, ra, -900
                  c.nop
                  c.andi       a3, 13
                  mul          s7, t5, a5
                  c.andi       a3, 13
                  srli         s4, s3, 13
                  mulhsu       ra, t3, a0
                  c.and        a0, s0
                  c.add        a2, t6
                  add          s4, a1, t4
                  c.srli       a0, 16
                  c.srai       s0, 8
                  nop
                  slti         sp, a1, 426
                  c.mv         s6, s5
                  c.mv         s6, s5
                  mulh         s8, zero, tp
                  srai         a4, ra, 3
                  c.and        a0, s0
                  c.and        a0, s0
                  c.mv         s6, s5
                  c.addi16sp   sp, 256
                  c.xor        a0, s1
                  c.sub        a0, a1
                  c.lui        s10, 18
                  c.addi       s7, -1
                  c.addi       s7, -1
                  div          t3, sp, t0
                  sra          a3, t2, s2
                  rem          t1, s7, s2
                  mulh         s8, zero, tp
                  c.sub        a0, a1
                  sltu         s6, s9, sp
                  add          s4, a1, t4
                  c.and        a0, s0
                  c.mv         s6, s5
                  sra          a3, t2, s2
                  c.addi16sp   sp, 256
                  c.li         s3, 9
                  sub          sp, t0, a2
                  lui          a7, 1036702
                  c.srli       a0, 16
                  c.mv         s6, s5
                  divu         a7, s4, t2
                  mul          s7, t5, a5
                  c.addi       s7, -1
                  add          s4, a1, t4
                  slti         sp, a1, 426
                  add          s4, a1, t4
                  div          t3, sp, t0
                  xor          tp, a3, tp
                  slti         sp, a1, 426
                  slt          s3, a6, a0
                  lui          a7, 1036702
                  add          s4, a1, t4
                  c.addi4spn   a0, sp, 368
                  mulhsu       ra, t3, a0
                  c.lui        s10, 18
                  sltu         s6, s9, sp
                  c.addi       s7, -1
                  slti         sp, a1, 426
                  andi         a4, a7, -1410
                  xor          tp, a3, tp
                  c.xor        a0, s1
                  ori          a6, t4, 27
                  c.mv         s6, s5
                  slli         t1, ra, 5
                  c.addi16sp   sp, 256
                  divu         a7, s4, t2
                  mulh         s8, zero, tp
                  c.andi       a3, 13
                  remu         sp, s3, s7
                  and          s3, a6, s7
                  c.srai       s0, 8
                  xori         sp, ra, -1938
                  slli         t1, ra, 5
                  divu         a7, s4, t2
                  c.nop
                  sra          a3, t2, s2
                  c.mv         s6, s5
                  c.or         a2, s0
                  andi         a4, a7, -1410
                  sltu         s6, s9, sp
                  xori         sp, ra, -1938
                  xori         sp, ra, -1938
                  c.nop
                  sra          a3, t2, s2
                  add          s4, a1, t4
                  sll          t2, gp, a3
                  auipc        tp, 368653
                  sll          t2, gp, a3
                  ori          a6, t4, 27
                  sltiu        a6, ra, -900
                  sltu         s6, s9, sp
                  c.slli       tp, 29
                  addi         s3, s2, -1824
                  auipc        tp, 368653
                  c.srai       s0, 8
                  c.sub        a0, a1
                  div          t3, sp, t0
                  c.and        a0, s0
                  c.nop
                  xor          tp, a3, tp
                  c.andi       a3, 13
                  c.and        a0, s0
                  c.sub        a0, a1
                  srai         a4, ra, 3
                  srli         s4, s3, 13
                  sltu         s6, s9, sp
                  sltu         s6, s9, sp
                  srai         a4, ra, 3
                  divu         a7, s4, t2
                  divu         a7, s4, t2
                  mul          s7, t5, a5
                  srli         s4, s3, 13
                  c.addi16sp   sp, 256
                  add          s4, a1, t4
                  xor          tp, a3, tp
                  srli         s4, s3, 13
                  sltiu        a6, ra, -900
                  mulhu        a5, a3, t5
                  mulh         s8, zero, tp
                  c.and        a0, s0
                  slli         t1, ra, 5
                  xor          tp, a3, tp
                  c.slli       tp, 29
                  c.addi16sp   sp, 256
                  c.nop
                  ori          a6, t4, 27
                  ori          a6, t4, 27
                  lui          a7, 1036702
                  c.andi       a3, 13
                  sltu         s6, s9, sp
                  slti         sp, a1, 426
                  slti         sp, a1, 426
                  mul          s7, t5, a5
                  c.srli       a0, 16
                  auipc        tp, 368653
                  c.and        a0, s0
                  xor          tp, a3, tp
                  c.lui        s10, 18
                  add          s4, a1, t4
                  c.srli       a0, 16
                  c.add        a2, t6
                  c.andi       a3, 13
                  mulh         s8, zero, tp
                  c.addi4spn   a0, sp, 368
                  c.addi16sp   sp, 256
                  li           s8, 0xffffffff #start riscv_int_numeric_corner_stream_16
                  li           a5, 0x0
                  li           t3, 0x63b8c31e
                  li           t4, 0x0
                  li           s6, 0x17d150ad
                  li           t6, 0x0
                  li           a6, 0xffffffff
                  li           s7, 0x0
                  li           s1, 0x80000000
                  li           s11, 0xffffffff
                  auipc        s7, 368653
                  addi         a6, a6, -1824
                  sub          a6, s8, s11
                  sub          a6, s8, s11
                  mulh         s11, s1, s7
                  mul          s8, s8, t3
                  add          s6, s11, s11
                  mulhu        s6, t3, t4
                  remu         a6, s6, t3
                  add          s6, s11, s11
                  auipc        s7, 368653
                  addi         a6, a6, -1824
                  remu         a6, s6, t3
                  remu         a6, s6, t3
                  rem          s11, t3, a6
                  div          s7, a6, s8
                  div          s7, a6, s8
                  divu         s1, s7, t3
                  div          s7, a6, s8
                  addi         a6, a6, -1824
                  lui          s1, 1036702
                  mulhsu       a5, t3, s8
                  divu         s1, s7, t3
                  mulh         s11, s1, s7
                  div          s7, a6, s8
                  mulh         s11, s1, s7
                  mulhu        s6, t3, t4 #end riscv_int_numeric_corner_stream_16
                  auipc        tp, 368653
                  srl          t4, s1, t1
                  c.or         a2, s0
                  auipc        tp, 368653
                  addi         s3, s2, -1824
                  srli         s4, s3, 13
                  sltu         s6, s9, sp
                  c.add        a2, t6
                  c.addi       s7, -1
                  sra          a3, t2, s2
                  c.srai       s0, 8
                  c.and        a0, s0
                  c.sub        a0, a1
                  mulhsu       ra, t3, a0
                  slti         sp, a1, 426
                  c.addi16sp   sp, 256
                  add          s4, a1, t4
                  rem          t1, s7, s2
                  mulhsu       ra, t3, a0
                  slt          s3, a6, a0
                  mulhsu       ra, t3, a0
                  xori         sp, ra, -1938
                  c.addi       s7, -1
                  rem          t1, s7, s2
                  add          s4, a1, t4
                  c.addi16sp   sp, 256
                  c.sub        a0, a1
                  c.srli       a0, 16
                  c.sub        a0, a1
                  divu         a7, s4, t2
                  slli         t1, ra, 5
                  and          s3, a6, s7
                  sub          sp, t0, a2
                  c.xor        a0, s1
                  c.addi16sp   sp, 256
                  c.mv         s6, s5
                  nop
                  sll          t2, gp, a3
                  mul          s7, t5, a5
                  srli         s4, s3, 13
                  mulhsu       ra, t3, a0
                  sra          a3, t2, s2
                  slli         t1, ra, 5
                  or           t1, a5, t0
                  ori          a6, t4, 27
                  andi         a4, a7, -1410
                  c.slli       tp, 29
                  div          t3, sp, t0
                  c.and        a0, s0
                  xor          tp, a3, tp
                  andi         a4, a7, -1410
                  sra          a3, t2, s2
                  slli         t1, ra, 5
                  srai         a4, ra, 3
                  c.li         s3, 9
                  c.andi       a3, 13
                  c.srai       s0, 8
                  srl          t4, s1, t1
                  c.andi       a3, 13
                  c.slli       tp, 29
                  slt          s3, a6, a0
                  c.addi4spn   a0, sp, 368
                  srli         s4, s3, 13
                  xori         sp, ra, -1938
                  c.lui        s10, 18
                  c.slli       tp, 29
                  c.srai       s0, 8
                  c.addi       s7, -1
                  mulh         s8, zero, tp
                  c.xor        a0, s1
                  addi         s3, s2, -1824
                  andi         a4, a7, -1410
                  c.slli       tp, 29
                  c.mv         s6, s5
                  c.andi       a3, 13
                  c.srli       a0, 16
                  mulhu        a5, a3, t5
                  slti         sp, a1, 426
                  mulh         s8, zero, tp
                  sll          t2, gp, a3
                  c.xor        a0, s1
                  mulh         s8, zero, tp
                  c.nop
                  sll          t2, gp, a3
                  sltiu        a6, ra, -900
                  sra          a3, t2, s2
                  andi         a4, a7, -1410
                  sll          t2, gp, a3
                  c.andi       a3, 13
                  sub          sp, t0, a2
                  c.addi4spn   a0, sp, 368
                  mulh         s8, zero, tp
                  c.srai       s0, 8
                  auipc        tp, 368653
                  and          s3, a6, s7
                  c.li         s3, 9
                  slti         sp, a1, 426
                  xor          tp, a3, tp
                  slli         t1, ra, 5
                  c.mv         s6, s5
                  divu         a7, s4, t2
                  or           t1, a5, t0
                  c.sub        a0, a1
                  slli         t1, ra, 5
                  c.or         a2, s0
                  c.mv         s6, s5
                  remu         sp, s3, s7
                  c.srai       s0, 8
                  c.xor        a0, s1
                  c.mv         s6, s5
                  c.srli       a0, 16
                  srai         a4, ra, 3
                  c.li         s3, 9
                  mulh         s8, zero, tp
                  remu         sp, s3, s7
                  andi         a4, a7, -1410
                  auipc        tp, 368653
                  xori         sp, ra, -1938
                  c.mv         s6, s5
                  slt          s3, a6, a0
                  andi         a4, a7, -1410
                  remu         sp, s3, s7
                  addi         s3, s2, -1824
                  add          s4, a1, t4
                  xor          tp, a3, tp
                  slti         sp, a1, 426
                  divu         a7, s4, t2
                  c.or         a2, s0
                  srli         s4, s3, 13
                  c.sub        a0, a1
                  c.andi       a3, 13
                  auipc        tp, 368653
                  mul          s7, t5, a5
                  srli         s4, s3, 13
                  c.add        a2, t6
                  xori         sp, ra, -1938
                  sra          a3, t2, s2
                  or           t1, a5, t0
                  xor          tp, a3, tp
                  slti         sp, a1, 426
                  auipc        tp, 368653
                  c.sub        a0, a1
                  add          s4, a1, t4
                  slli         t1, ra, 5
                  remu         sp, s3, s7
                  divu         a7, s4, t2
                  mulhu        a5, a3, t5
                  c.andi       a3, 13
                  c.sub        a0, a1
                  rem          t1, s7, s2
                  c.mv         s6, s5
                  c.xor        a0, s1
                  xori         sp, ra, -1938
                  c.andi       a3, 13
                  c.slli       tp, 29
                  remu         sp, s3, s7
                  nop
                  c.sub        a0, a1
                  mulhu        a5, a3, t5
                  c.xor        a0, s1
                  c.li         s3, 9
                  srli         s4, s3, 13
                  srl          t4, s1, t1
                  c.srai       s0, 8
                  remu         sp, s3, s7
                  c.add        a2, t6
                  sll          t2, gp, a3
                  div          t3, sp, t0
                  c.srli       a0, 16
                  sub          sp, t0, a2
                  c.srai       s0, 8
                  c.addi4spn   a0, sp, 368
                  sltiu        a6, ra, -900
                  andi         a4, a7, -1410
                  slt          s3, a6, a0
                  mul          s7, t5, a5
                  slt          s3, a6, a0
                  and          s3, a6, s7
                  sll          t2, gp, a3
                  li           s0, 0xffffffff #start riscv_int_numeric_corner_stream_30
                  li           a2, 0x80000000
                  li           t1, 0x0
                  li           s8, 0xffffffff
                  li           a4, 0x0
                  li           t4, 0xffffffff
                  li           a0, 0x80000000
                  li           s10, 0x0
                  li           s4, 0x0
                  li           a6, 0x80000000
                  addi         a0, a0, -1824
                  mulhsu       s0, s8, a6
                  sub          a0, a6, s4
                  rem          s4, s8, a0
                  mul          a6, a6, s8
                  mulhu        a2, s8, s10
                  mulhu        a2, s8, s10
                  remu         a0, a2, s8
                  mulhu        a2, s8, s10
                  mulh         s4, t1, a4
                  add          a2, s4, s4
                  div          a4, a0, a6
                  div          a4, a0, a6
                  mulhu        a2, s8, s10
                  nop
                  mulhu        a2, s8, s10 #end riscv_int_numeric_corner_stream_30
                  nop
                  c.addi16sp   sp, 256
                  c.or         a2, s0
                  c.srai       s0, 8
                  divu         a7, s4, t2
                  sltu         s6, s9, sp
                  c.addi16sp   sp, 256
                  c.addi       s7, -1
                  and          s3, a6, s7
                  slli         t1, ra, 5
                  divu         a7, s4, t2
                  nop
                  andi         a4, a7, -1410
                  c.sub        a0, a1
                  c.addi       s7, -1
                  rem          t1, s7, s2
                  c.addi       s7, -1
                  c.andi       a3, 13
                  c.nop
                  nop
                  slt          s3, a6, a0
                  c.srli       a0, 16
                  and          s3, a6, s7
                  sub          sp, t0, a2
                  c.addi       s7, -1
                  slt          s3, a6, a0
                  c.addi16sp   sp, 256
                  c.or         a2, s0
                  andi         a4, a7, -1410
                  mulhsu       ra, t3, a0
                  c.srai       s0, 8
                  c.andi       a3, 13
                  c.add        a2, t6
                  c.li         s3, 9
                  c.xor        a0, s1
                  srai         a4, ra, 3
                  c.addi16sp   sp, 256
                  c.add        a2, t6
                  c.addi       s7, -1
                  c.lui        s10, 18
                  c.addi16sp   sp, 256
                  slti         sp, a1, 426
                  c.addi4spn   a0, sp, 368
                  addi         s3, s2, -1824
                  c.addi       s7, -1
                  c.addi4spn   a0, sp, 368
                  divu         a7, s4, t2
                  remu         sp, s3, s7
                  c.sub        a0, a1
                  rem          t1, s7, s2
                  div          t3, sp, t0
                  add          s4, a1, t4
                  sub          sp, t0, a2
                  mulhsu       ra, t3, a0
                  c.addi16sp   sp, 256
                  mulhu        a5, a3, t5
                  mulhu        a5, a3, t5
                  mul          s7, t5, a5
                  andi         a4, a7, -1410
                  andi         a4, a7, -1410
                  mulhu        a5, a3, t5
                  ori          a6, t4, 27
                  add          s4, a1, t4
                  c.srli       a0, 16
                  addi         s3, s2, -1824
                  c.andi       a3, 13
                  c.or         a2, s0
                  slti         sp, a1, 426
                  or           t1, a5, t0
                  rem          t1, s7, s2
                  addi         s3, s2, -1824
                  c.srai       s0, 8
                  or           t1, a5, t0
                  c.add        a2, t6
                  c.lui        s10, 18
                  xori         sp, ra, -1938
                  auipc        tp, 368653
                  slti         sp, a1, 426
                  and          s3, a6, s7
                  c.addi       s7, -1
                  c.or         a2, s0
                  c.lui        s10, 18
                  slli         t1, ra, 5
                  mulh         s8, zero, tp
                  lui          a7, 1036702
                  lui          a7, 1036702
                  mulhu        a5, a3, t5
                  sltiu        a6, ra, -900
                  c.li         s3, 9
                  ori          a6, t4, 27
                  sll          t2, gp, a3
                  xor          tp, a3, tp
                  mul          s7, t5, a5
                  add          s4, a1, t4
                  c.add        a2, t6
                  mulh         s8, zero, tp
                  c.sub        a0, a1
                  addi         s3, s2, -1824
                  c.lui        s10, 18
                  sll          t2, gp, a3
                  sltiu        a6, ra, -900
                  c.slli       tp, 29
                  xor          tp, a3, tp
                  lui          a7, 1036702
                  sltiu        a6, ra, -900
                  c.andi       a3, 13
                  c.mv         s6, s5
                  c.li         s3, 9
                  c.lui        s10, 18
                  c.sub        a0, a1
                  sra          a3, t2, s2
                  ori          a6, t4, 27
                  slt          s3, a6, a0
                  c.srli       a0, 16
                  c.and        a0, s0
                  addi         s3, s2, -1824
                  srl          t4, s1, t1
                  c.lui        s10, 18
                  srli         s4, s3, 13
                  xor          tp, a3, tp
                  add          s4, a1, t4
                  srl          t4, s1, t1
                  slti         sp, a1, 426
                  c.mv         s6, s5
                  ori          a6, t4, 27
                  c.nop
                  mulhsu       ra, t3, a0
                  ori          a6, t4, 27
                  c.lui        s10, 18
                  ori          a6, t4, 27
                  c.srli       a0, 16
                  slti         sp, a1, 426
                  srli         s4, s3, 13
                  slti         sp, a1, 426
                  xori         sp, ra, -1938
                  divu         a7, s4, t2
                  c.addi16sp   sp, 256
                  srli         s4, s3, 13
                  c.sub        a0, a1
                  c.xor        a0, s1
                  c.li         s3, 9
                  slt          s3, a6, a0
                  sra          a3, t2, s2
                  or           t1, a5, t0
                  c.mv         s6, s5
                  xor          tp, a3, tp
                  c.mv         s6, s5
                  mulh         s8, zero, tp
                  andi         a4, a7, -1410
                  xori         sp, ra, -1938
                  addi         s3, s2, -1824
                  sra          a3, t2, s2
                  c.add        a2, t6
                  sltiu        a6, ra, -900
                  srl          t4, s1, t1
                  andi         a4, a7, -1410
                  c.srli       a0, 16
                  c.addi4spn   a0, sp, 368
                  c.slli       tp, 29
                  slli         t1, ra, 5
                  slli         t1, ra, 5
                  slt          s3, a6, a0
                  c.mv         s6, s5
                  sltiu        a6, ra, -900
                  xori         sp, ra, -1938
                  mulhu        a5, a3, t5
                  sll          t2, gp, a3
                  remu         sp, s3, s7
                  c.and        a0, s0
                  div          t3, sp, t0
                  c.li         s3, 9
                  or           t1, a5, t0
                  c.srai       s0, 8
                  add          s4, a1, t4
                  c.andi       a3, 13
                  addi         s3, s2, -1824
                  sub          sp, t0, a2
                  add          s4, a1, t4
                  add          s4, a1, t4
                  c.slli       tp, 29
                  c.addi16sp   sp, 256
                  la x21, test_done
                  jalr x0, x21, 0
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
mmode_intr_vector_1:
                  addi x30, x30, -4
                  sw  x11, (x30)
                  add x11, x30, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x30, x11, zero
                  csrr x4, 0x342 # MCAUSE
                  srli x4, x4, 0x1f
                  beqz x4, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_2:
                  addi x30, x30, -4
                  sw  x11, (x30)
                  add x11, x30, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x30, x11, zero
                  csrr x4, 0x342 # MCAUSE
                  srli x4, x4, 0x1f
                  beqz x4, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_3:
                  addi x30, x30, -4
                  sw  x11, (x30)
                  add x11, x30, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x30, x11, zero
                  csrr x4, 0x342 # MCAUSE
                  srli x4, x4, 0x1f
                  beqz x4, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_4:
                  addi x30, x30, -4
                  sw  x11, (x30)
                  add x11, x30, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x30, x11, zero
                  csrr x4, 0x342 # MCAUSE
                  srli x4, x4, 0x1f
                  beqz x4, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_5:
                  addi x30, x30, -4
                  sw  x11, (x30)
                  add x11, x30, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x30, x11, zero
                  csrr x4, 0x342 # MCAUSE
                  srli x4, x4, 0x1f
                  beqz x4, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_6:
                  addi x30, x30, -4
                  sw  x11, (x30)
                  add x11, x30, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x30, x11, zero
                  csrr x4, 0x342 # MCAUSE
                  srli x4, x4, 0x1f
                  beqz x4, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_7:
                  addi x30, x30, -4
                  sw  x11, (x30)
                  add x11, x30, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x30, x11, zero
                  csrr x4, 0x342 # MCAUSE
                  srli x4, x4, 0x1f
                  beqz x4, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_8:
                  addi x30, x30, -4
                  sw  x11, (x30)
                  add x11, x30, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x30, x11, zero
                  csrr x4, 0x342 # MCAUSE
                  srli x4, x4, 0x1f
                  beqz x4, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_9:
                  addi x30, x30, -4
                  sw  x11, (x30)
                  add x11, x30, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x30, x11, zero
                  csrr x4, 0x342 # MCAUSE
                  srli x4, x4, 0x1f
                  beqz x4, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_10:
                  addi x30, x30, -4
                  sw  x11, (x30)
                  add x11, x30, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x30, x11, zero
                  csrr x4, 0x342 # MCAUSE
                  srli x4, x4, 0x1f
                  beqz x4, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_11:
                  addi x30, x30, -4
                  sw  x11, (x30)
                  add x11, x30, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x30, x11, zero
                  csrr x4, 0x342 # MCAUSE
                  srli x4, x4, 0x1f
                  beqz x4, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_12:
                  addi x30, x30, -4
                  sw  x11, (x30)
                  add x11, x30, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x30, x11, zero
                  csrr x4, 0x342 # MCAUSE
                  srli x4, x4, 0x1f
                  beqz x4, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_13:
                  addi x30, x30, -4
                  sw  x11, (x30)
                  add x11, x30, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x30, x11, zero
                  csrr x4, 0x342 # MCAUSE
                  srli x4, x4, 0x1f
                  beqz x4, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_14:
                  addi x30, x30, -4
                  sw  x11, (x30)
                  add x11, x30, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x30, x11, zero
                  csrr x4, 0x342 # MCAUSE
                  srli x4, x4, 0x1f
                  beqz x4, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_15:
                  addi x30, x30, -4
                  sw  x11, (x30)
                  add x11, x30, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x30, x11, zero
                  csrr x4, 0x342 # MCAUSE
                  srli x4, x4, 0x1f
                  beqz x4, 1f
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

.align           4
mtvec_handler:    
                  .option norvc;
                  j mmode_exception_handler
                  j mmode_intr_vector_1
                  j mmode_intr_vector_2
                  j mmode_intr_vector_3
                  j mmode_intr_vector_4
                  j mmode_intr_vector_5
                  j mmode_intr_vector_6
                  j mmode_intr_vector_7
                  j mmode_intr_vector_8
                  j mmode_intr_vector_9
                  j mmode_intr_vector_10
                  j mmode_intr_vector_11
                  j mmode_intr_vector_12
                  j mmode_intr_vector_13
                  j mmode_intr_vector_14
                  j mmode_intr_vector_15
                  .option rvc;

mmode_exception_handler:
                  addi x30, x30, -4
                  sw  x11, (x30)
                  add x11, x30, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x30, x11, zero
                  csrr x4, 0x341 # MEPC
                  csrr x4, 0x342 # MCAUSE
                  li x24, 0x3 # BREAKPOINT
                  beq x4, x24, ebreak_handler
                  li x24, 0x8 # ECALL_UMODE
                  beq x4, x24, ecall_handler
                  li x24, 0x9 # ECALL_SMODE
                  beq x4, x24, ecall_handler
                  li x24, 0xb # ECALL_MMODE
                  beq x4, x24, ecall_handler
                  li x24, 0x1
                  beq x4, x24, instr_fault_handler
                  li x24, 0x5
                  beq x4, x24, load_fault_handler
                  li x24, 0x7
                  beq x4, x24, store_fault_handler
                  li x24, 0xc
                  beq x4, x24, pt_fault_handler
                  li x24, 0xd
                  beq x4, x24, pt_fault_handler
                  li x24, 0xf
                  beq x4, x24, pt_fault_handler
                  li x24, 0x2 # ILLEGAL_INSTRUCTION
                  beq x4, x24, illegal_instr_handler
                  csrr x24, 0x343 # MTVAL
                  1: la x21, test_done
                  jalr x1, x21, 0

ecall_handler:    
                  la x4, _start
                  sw x0, 0(x4)
                  sw x1, 4(x4)
                  sw x2, 8(x4)
                  sw x3, 12(x4)
                  sw x4, 16(x4)
                  sw x5, 20(x4)
                  sw x6, 24(x4)
                  sw x7, 28(x4)
                  sw x8, 32(x4)
                  sw x9, 36(x4)
                  sw x10, 40(x4)
                  sw x11, 44(x4)
                  sw x12, 48(x4)
                  sw x13, 52(x4)
                  sw x14, 56(x4)
                  sw x15, 60(x4)
                  sw x16, 64(x4)
                  sw x17, 68(x4)
                  sw x18, 72(x4)
                  sw x19, 76(x4)
                  sw x20, 80(x4)
                  sw x21, 84(x4)
                  sw x22, 88(x4)
                  sw x23, 92(x4)
                  sw x24, 96(x4)
                  sw x25, 100(x4)
                  sw x26, 104(x4)
                  sw x27, 108(x4)
                  sw x28, 112(x4)
                  sw x29, 116(x4)
                  sw x30, 120(x4)
                  sw x31, 124(x4)
                  la x21, write_tohost
                  jalr x0, x21, 0

instr_fault_handler:
                  add x11, x30, zero
                  lw  x1, 4(x11)
                  lw  x2, 8(x11)
                  lw  x3, 12(x11)
                  lw  x4, 16(x11)
                  lw  x5, 20(x11)
                  lw  x6, 24(x11)
                  lw  x7, 28(x11)
                  lw  x8, 32(x11)
                  lw  x9, 36(x11)
                  lw  x10, 40(x11)
                  lw  x11, 44(x11)
                  lw  x12, 48(x11)
                  lw  x13, 52(x11)
                  lw  x14, 56(x11)
                  lw  x15, 60(x11)
                  lw  x16, 64(x11)
                  lw  x17, 68(x11)
                  lw  x18, 72(x11)
                  lw  x19, 76(x11)
                  lw  x20, 80(x11)
                  lw  x21, 84(x11)
                  lw  x22, 88(x11)
                  lw  x23, 92(x11)
                  lw  x24, 96(x11)
                  lw  x25, 100(x11)
                  lw  x26, 104(x11)
                  lw  x27, 108(x11)
                  lw  x28, 112(x11)
                  lw  x29, 116(x11)
                  lw  x30, 120(x11)
                  lw  x31, 124(x11)
                  addi x11, x11, 128
                  add x30, x11, zero
                  lw  x11, (x30)
                  addi x30, x30, 4
                  mret

load_fault_handler:
                  add x11, x30, zero
                  lw  x1, 4(x11)
                  lw  x2, 8(x11)
                  lw  x3, 12(x11)
                  lw  x4, 16(x11)
                  lw  x5, 20(x11)
                  lw  x6, 24(x11)
                  lw  x7, 28(x11)
                  lw  x8, 32(x11)
                  lw  x9, 36(x11)
                  lw  x10, 40(x11)
                  lw  x11, 44(x11)
                  lw  x12, 48(x11)
                  lw  x13, 52(x11)
                  lw  x14, 56(x11)
                  lw  x15, 60(x11)
                  lw  x16, 64(x11)
                  lw  x17, 68(x11)
                  lw  x18, 72(x11)
                  lw  x19, 76(x11)
                  lw  x20, 80(x11)
                  lw  x21, 84(x11)
                  lw  x22, 88(x11)
                  lw  x23, 92(x11)
                  lw  x24, 96(x11)
                  lw  x25, 100(x11)
                  lw  x26, 104(x11)
                  lw  x27, 108(x11)
                  lw  x28, 112(x11)
                  lw  x29, 116(x11)
                  lw  x30, 120(x11)
                  lw  x31, 124(x11)
                  addi x11, x11, 128
                  add x30, x11, zero
                  lw  x11, (x30)
                  addi x30, x30, 4
                  mret

store_fault_handler:
                  add x11, x30, zero
                  lw  x1, 4(x11)
                  lw  x2, 8(x11)
                  lw  x3, 12(x11)
                  lw  x4, 16(x11)
                  lw  x5, 20(x11)
                  lw  x6, 24(x11)
                  lw  x7, 28(x11)
                  lw  x8, 32(x11)
                  lw  x9, 36(x11)
                  lw  x10, 40(x11)
                  lw  x11, 44(x11)
                  lw  x12, 48(x11)
                  lw  x13, 52(x11)
                  lw  x14, 56(x11)
                  lw  x15, 60(x11)
                  lw  x16, 64(x11)
                  lw  x17, 68(x11)
                  lw  x18, 72(x11)
                  lw  x19, 76(x11)
                  lw  x20, 80(x11)
                  lw  x21, 84(x11)
                  lw  x22, 88(x11)
                  lw  x23, 92(x11)
                  lw  x24, 96(x11)
                  lw  x25, 100(x11)
                  lw  x26, 104(x11)
                  lw  x27, 108(x11)
                  lw  x28, 112(x11)
                  lw  x29, 116(x11)
                  lw  x30, 120(x11)
                  lw  x31, 124(x11)
                  addi x11, x11, 128
                  add x30, x11, zero
                  lw  x11, (x30)
                  addi x30, x30, 4
                  mret

ebreak_handler:   
                  csrr  x4, 0x341
                  addi  x4, x4, 4
                  csrw  0x341, x4
                  add x11, x30, zero
                  lw  x1, 4(x11)
                  lw  x2, 8(x11)
                  lw  x3, 12(x11)
                  lw  x4, 16(x11)
                  lw  x5, 20(x11)
                  lw  x6, 24(x11)
                  lw  x7, 28(x11)
                  lw  x8, 32(x11)
                  lw  x9, 36(x11)
                  lw  x10, 40(x11)
                  lw  x11, 44(x11)
                  lw  x12, 48(x11)
                  lw  x13, 52(x11)
                  lw  x14, 56(x11)
                  lw  x15, 60(x11)
                  lw  x16, 64(x11)
                  lw  x17, 68(x11)
                  lw  x18, 72(x11)
                  lw  x19, 76(x11)
                  lw  x20, 80(x11)
                  lw  x21, 84(x11)
                  lw  x22, 88(x11)
                  lw  x23, 92(x11)
                  lw  x24, 96(x11)
                  lw  x25, 100(x11)
                  lw  x26, 104(x11)
                  lw  x27, 108(x11)
                  lw  x28, 112(x11)
                  lw  x29, 116(x11)
                  lw  x30, 120(x11)
                  lw  x31, 124(x11)
                  addi x11, x11, 128
                  add x30, x11, zero
                  lw  x11, (x30)
                  addi x30, x30, 4
                  mret

illegal_instr_handler:
                  csrr  x4, 0x341
                  addi  x4, x4, 4
                  csrw  0x341, x4
                  add x11, x30, zero
                  lw  x1, 4(x11)
                  lw  x2, 8(x11)
                  lw  x3, 12(x11)
                  lw  x4, 16(x11)
                  lw  x5, 20(x11)
                  lw  x6, 24(x11)
                  lw  x7, 28(x11)
                  lw  x8, 32(x11)
                  lw  x9, 36(x11)
                  lw  x10, 40(x11)
                  lw  x11, 44(x11)
                  lw  x12, 48(x11)
                  lw  x13, 52(x11)
                  lw  x14, 56(x11)
                  lw  x15, 60(x11)
                  lw  x16, 64(x11)
                  lw  x17, 68(x11)
                  lw  x18, 72(x11)
                  lw  x19, 76(x11)
                  lw  x20, 80(x11)
                  lw  x21, 84(x11)
                  lw  x22, 88(x11)
                  lw  x23, 92(x11)
                  lw  x24, 96(x11)
                  lw  x25, 100(x11)
                  lw  x26, 104(x11)
                  lw  x27, 108(x11)
                  lw  x28, 112(x11)
                  lw  x29, 116(x11)
                  lw  x30, 120(x11)
                  lw  x31, 124(x11)
                  addi x11, x11, 128
                  add x30, x11, zero
                  lw  x11, (x30)
                  addi x30, x30, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x4, 0x300 # MSTATUS;
                  csrr  x4, 0x304 # MIE;
                  csrr  x4, 0x344 # MIP;
                  csrrc x4, 0x344, x4 # MIP;
                  add x11, x30, zero
                  lw  x1, 4(x11)
                  lw  x2, 8(x11)
                  lw  x3, 12(x11)
                  lw  x4, 16(x11)
                  lw  x5, 20(x11)
                  lw  x6, 24(x11)
                  lw  x7, 28(x11)
                  lw  x8, 32(x11)
                  lw  x9, 36(x11)
                  lw  x10, 40(x11)
                  lw  x11, 44(x11)
                  lw  x12, 48(x11)
                  lw  x13, 52(x11)
                  lw  x14, 56(x11)
                  lw  x15, 60(x11)
                  lw  x16, 64(x11)
                  lw  x17, 68(x11)
                  lw  x18, 72(x11)
                  lw  x19, 76(x11)
                  lw  x20, 80(x11)
                  lw  x21, 84(x11)
                  lw  x22, 88(x11)
                  lw  x23, 92(x11)
                  lw  x24, 96(x11)
                  lw  x25, 100(x11)
                  lw  x26, 104(x11)
                  lw  x27, 108(x11)
                  lw  x28, 112(x11)
                  lw  x29, 116(x11)
                  lw  x30, 120(x11)
                  lw  x31, 124(x11)
                  addi x11, x11, 128
                  add x30, x11, zero
                  lw  x11, (x30)
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
