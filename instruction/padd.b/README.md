# Self-check test for `padd.b`

## Build

```bash
riscv32-unknown-elf-gcc -march=rv32gcp -mabi=ilp32d -nostdlib -nostartfiles \
    -Wl,-Ttext=0x80000000 -Wl,-e,_start \
    -o padd_b_selfchk.elf padd_b_selfchk.S
```

## Run

```bash
qemu-system-riscv32 -machine virt -cpu max,x-p=true -bios none -nographic \
    -kernel padd_b_selfchk.elf
```

## What it checks

The program computes:

- `a0 = 0x00110022`
- `a1 = 0x00030004`
- expected `padd.b` result = `0x00140026`

It stores these words in `result_area`:

1. input `a0`
2. input `a1`
3. actual result from `padd.b`
4. expected result
5. status

Status values:

- `0x00000001`: pass
- `0xffffffff`: fail

After the check, the guest loops forever in either the `pass` loop or the `fail` loop. Under GDB, you can inspect the stored words or the current PC to determine whether the test passed.

## Senario 

```bash
$ qemu-system-riscv32 -machine virt -cpu max,x-p=true -nographic -bios none -kernel padd_b_selfchk.elf -S -gdb tcp::1234
```

```bash
gdb-multiarch padd_b_selfchk.elf
(gdb) set architecture riscv:rv32
(gdb) target remote :1234

(gdb) b pass
(gdb) b fail
(gdb) c
(gdb) info reg t2 a2 t0
(gdb) p/x $t2

(gdb) p/x &result_area
(gdb) x/5wx &result_area
```