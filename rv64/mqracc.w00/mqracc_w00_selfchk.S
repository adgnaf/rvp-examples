  .section .text
  .globl _start

_start:
  li a0, 0x0807060504030201
  li a1, 0x100f0e0d0c0b0a09
  li a2, 0x0000000000000003
  li a3, 0x0000000000000004
  li a4, 0x1817161514131211
  li a5, 0x201f1e1d1c1b1a19
  li t0, 0x000000000060a0c6
  mqracc.w00 a2, a0, a1

  la t1, result_area
  sd a0, 0(t1)
  sd a1, 8(t1)
  sd a2, 16(t1)
  sd t0, 24(t1)

  bne a2, t0, fail

pass:
  li t2, 0x00000001
  sd t2, 32(t1)
1:
  j 1b

fail:
  li t2, 0xffffffff
  sd t2, 32(t1)
2:
  j 2b

  .balign 4
result_area:
  .dword 0
  .dword 0
  .dword 0
  .dword 0
  .dword 0

