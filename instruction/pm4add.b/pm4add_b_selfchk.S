  .section .text
  .globl _start

_start:
  li a0, 0x04030201
  li a1, 0x08070605

  li t0, 0x00000046
  pm4add.b a2, a0, a1

  la t1, result_area
  sw a0, 0(t1)
  sw a1, 4(t1)
  sw a2, 8(t1)
  sw t0, 12(t1)

  bne a2, t0, fail

pass:
  li t2, 0x00000001
  sw t2, 16(t1)
1:
  j 1b

fail:
  li t2, 0xffffffff
  sw t2, 16(t1)
2:
  j 2b

  .balign 4
result_area:
  .word 0
  .word 0
  .word 0
  .word 0
  .word 0
