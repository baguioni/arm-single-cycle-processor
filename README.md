# ARM Single-Cycle Processor
- The microarchitecture is based on Chapter 7 of Harris, Sarah L., and David Harris. Digital design and computer
architecture ARM Edition. Morgan Kaufmann, 2015.

#### Goal
Design, simulate and test a simplified ARM single-cycle processor using verilog. This should be able to execute the following instructions: LDR, STR, ADD, SUB, ORR, AND, and B.

#### To do
- [ ] Combine datapath and control unit
- [ ] Design datapath
	- [x] program counter
	- [x] register file
	- [x] ALU
		- [ ] Add flags
	- [x] extend 
- [ ] Design memory
	- [x] instruction memory
	- [x] data memory
- [ ] Design control unit
	- [x] decoder
	- [x] conditional logic
- [ ] Test bench for selected instructions
- [ ] Test bench for each component
- [ ] Add instructions to `instruction.mem` should be 32 bits

#### How to run testbench
```
$ iverilog -o dsn tb_${component}.v ${component}.v
$ vvp dsn
```
