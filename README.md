# ARM Single-Cycle Processor
- The microarchitecture is based on Chapter 7 of Harris, Sarah L., and David Harris. Digital design and computer
architecture ARM Edition. Morgan Kaufmann, 2015.

#### Goal
Design, simulate and test a simplified ARM single-cycle processor using verilog. This should be able to execute the following instructions: LDR, STR, ADD, SUB, ORR, AND, and B.

#### To do
- [ ] Design datapath
	- [x] program counter
	- [x] register file
	- [x] ALU
	- [x] extend 
- [ ] Design memory
	- [x] instruction memory
	- [x] data memory
- [ ] Design control unit
	- [ ] decoder
	- [ ] conditional logic
- [ ] Test bench for selected instructions

#### How to run testbench
```
$ iverilog -o dsn tb_${component}.v ${component}.v
$ vvp dsn
```
