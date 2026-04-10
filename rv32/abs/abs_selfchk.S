  .section .text
  .globl _start

_start:
  li a0, -37

  li t0, 37
  abs a2, a0

  la t1, result_area
  sw a0, 0(t1)
  sw a2, 4(t1)
  sw t0, 8(t1)

  bne a2, t0, fail

pass:
  li t2, 0x00000001
  sw t2, 12(t1)
1:
  j 1b

fail:
  li t2, 0xffffffff
  sw t2, 12(t1)
2:
  j 2b

  .balign 4
result_area:
  .word 0
  .word 0
  .word 0
  .word 0
