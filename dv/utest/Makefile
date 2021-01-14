RTL_PATH=../../rtl/AHB_sys_0

all: sim
.PHONY: all

test.vvp:
	iverilog -o test.vvp -I $(RTL_PATH) -I .. amba_ahb_m2s2_tb.v

sim: test.vvp 
	./test.vvp

clean:
	rm *.vvp *.vcd
