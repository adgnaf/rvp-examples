# RSIC-V P Extension Examples

## Usage 

### Assembly program

For each assembly program, `riscv32-unknown-elf-gcc` can be used to compile. 

```bash
riscv32-unknown-elf-gcc -march=rv32gcp -mabi=ilp32d -nostdlib -nostartfiles \
    -Wl,-Ttext=0x80000000 -Wl,-e,_start \
    -o <binary> <file>.S
```

Then use `qemu-system-riscv32` to launch the program

```bash
qemu-system-riscv32 -machine virt -cpu max,x-p=true -bios none -nographic \
    -kernel <binary> -S -gdb tcp::1234
```

Launch a gdb session to verify the result 

```bash
gdb-multiarch <binary>
(gdb) set architecture riscv:rv32
(gdb) target remote :1234
(gdb) b pass 
(gdb) b fail 
(gdb) c 
```
