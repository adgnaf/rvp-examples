  .section .text
  .globl _start

_start:
  li a0, 0x40302010
  li a1, 0x10100804

  li t0, 0x18100c06
  pasub.b a2, a0, a1

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
