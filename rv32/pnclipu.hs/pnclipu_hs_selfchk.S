  .section .text
  .globl _start

_start:
  li a0, 0xff3800c8
  li a1, 0x08070605
  li a2, 0x00000003
  li a3, 0x00000004
  li a4, 0x0c0b0a09
  li a5, 0x100f0e0d
  li t0, 0xffffffff
  pnclipu.hs a2, a0, a4

  la t1, result_area
  sw a0, 0(t1)
  sw a1, 4(t1)
  sw a4, 8(t1)
  sw a2, 12(t1)
  sw t0, 16(t1)

  bne a2, t0, fail

pass:
  li t2, 0x00000001
  sw t2, 20(t1)
1:
  j 1b

fail:
  li t2, 0xffffffff
  sw t2, 20(t1)
2:
  j 2b

  .balign 4
result_area:
  .word 0
  .word 0
  .word 0
  .word 0
  .word 0
  .word 0

