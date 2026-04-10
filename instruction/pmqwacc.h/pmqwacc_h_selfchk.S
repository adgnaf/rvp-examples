  .section .text
  .globl _start

_start:
  li a0, 0x20004000
  li a1, 0x40004000
  li a2, 0x00000001
  li a3, 0x00000002

  li t0, 0x00002001
  li t3, 0x00001002
  pmqwacc.h a2, a0, a1

  la t1, result_area
  sw a0, 0(t1)
  sw a1, 4(t1)
  sw a2, 8(t1)
  sw a3, 12(t1)
  sw t0, 16(t1)
  sw t3, 20(t1)

  bne a2, t0, fail
  bne a3, t3, fail

pass:
  li t2, 0x00000001
  sw t2, 24(t1)
1:
  j 1b

fail:
  li t2, 0xffffffff
  sw t2, 24(t1)
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
  .word 0
