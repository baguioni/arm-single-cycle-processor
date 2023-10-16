# ARM Single-Cycle Processor
This repository contains the Verilog implementation of an ARM Single-Cycle Processor that can execute a subset of ARM instructions. The processor is designed to execute the following ARM instructions:

- Load (LDR)
- Store (STR)
- Add (ADD)
- Subtract (SUB)
- Logical OR (ORR)
- Logical AND (AND)
- Branch (B)

In addition to the processor design, this repository includes several testbenches to verify the correctness of the processor's operation. You can compile and run these testbenches using the Icarus Verilog simulator.

### Repository Structure
```
├── rtl
│   ├── arm.v    # Main ARM processor Verilog code
│   ├── control_unit.v  
│   ├── data_memory.v
│   ├── instruction_memory.v 
│   ├── ...
│   └── (Other Verilog modules)
│   ├── tb         # Testbenches subfolder
│       ├── test_arm.v     # Testbench for top-level module
│       ├── test_data_memory.v
│       ├── test_alu.v       
│       ├── ...
│       └── (Other Testbenches)
├── instruction.dat         # Instruction memory initialization file
├── arm_test_program.txt    # Expected outputs for each instruction
└── README.md               # This readme file
```
The instructions for the processor are manually set in the instruction.dat file. This file initializes the instruction memory with the desired program. Ensure that the instructions in this file match your intended program.

## Getting Started
### Prerequisites
Before you can compile and run the simulations, you need to have the Icarus Verilog (iverilog) simulator installed. If you don't have it installed, you can download it from the official website: [Icarus Verilog](https://github.com/steveicarus/iverilog).

### Setup
To compile and run the simulations for the ARM Single-Cycle Processor, follow these steps:
1. Clone the Repository:
```
git clone https://github.com/baguioni/arm-single-cycle-processor
cd arm-single-cycle-processor/rtl
```
2. Compile the Testbenches and Modules
```
iverilog -o dsn tb/tb_arm.v *.v
```
This will compile the top level testbench. If you want to run a testbench for a specific component, you can do so by running.
```
iverilog -o dsn tb_${component}.v ${component}.v
```
3. Run the Testbenches
```
vvp dsn
```
The testbenches will execute, and the simulation output will be compared to the expected outputs defined in `arm_test_program.txt` to verify the correctness of the processor's operation.

### Customization
If you want to modify the processor or add support for additional instructions, you can do so by editing the relevant Verilog files in the `rtl` directory. The control unit and datapath can be extended to support additional instructions.

## Acknowledgements
This ARM Single-Cycle Processor is based on the microarchitecture described in "Digital Design and Computer Architecture: ARM Edition" by Sarah L. Harris and David Harris. We acknowledge their work in providing the foundation for this project.

The `instruction.dat` file, which initializes the instruction memory, and the `arm_test_program.txt` file, defining the expected outputs for each instruction, are sourced from the exercises and examples in the "Digital Design and Computer Architecture: ARM Edition" book. We are grateful for their contribution to this project.
