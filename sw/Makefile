GCC_PATH := /ef/apps/bin
name := test

%.hex: $(name).c n5_drv.c crt0.S link.ld
	$(GCC_PATH)/riscv32-unknown-elf-gcc -Wall  -falign-functions=4 -march=rv32i -mabi=ilp32 -nostdlib -mstrict-align -T link.ld -o $(name).elf -lgcc crt0.S n5_drv.c $(name).c  -lgcc
	$(GCC_PATH)/riscv32-unknown-elf-objcopy -O binary $(name).elf $(name).bin
	$(GCC_PATH)/riscv32-unknown-elf-objcopy -O verilog $(name).elf $(name).hex
	$(GCC_PATH)/riscv32-unknown-elf-objdump -D $(name).elf > $(name).lst

all: $(name).hex