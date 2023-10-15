# ARM Single-Cycle Processor
- The microarchitecture is based on Chapter 7 of Harris, Sarah L., and David Harris. Digital design and computer
architecture ARM Edition. Morgan Kaufmann, 2015.

#### Goal
Design, simulate and test a simplified ARM single-cycle processor using verilog. This should be able to execute the following instructions: LDR, STR, ADD, SUB, ORR, AND, and B.

#### To do
- [x] Combine datapath and control unit
- [x] Design datapath
	- [x] program counter
	- [x] register file
	- [x] ALU
		- [x] Add flags
			- [ ] Carry is not so sure
	- [x] extend 
- [ ] Design memory
	- [x] instruction memory
	- [x] data memory
- [ ] Design control unit
	- [x] decoder
	- [x] conditional logic
- [x] Test bench for selected instructions
- [x] Add instructions to `instruction.mem` should be 32 bits

#### How to run testbench
```
$ iverilog -o dsn tb_${component}.v ${component}.v
$ vvp dsn
```
