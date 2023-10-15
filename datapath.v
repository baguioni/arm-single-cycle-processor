`include "program_counter.v"
`include "instruction_memory.v"
`include "register_file.v"
`include "extend.v"
`include "alu.v"
`include "data_memory.v"
`include "mux2-1.v"

module datapath(
	input CLK, PCSrc, MemtoReg, MemWrite, ALUSrc, RegWrite,
	input [1:0] RegSrc, ImmSrc, ALUControl, 
	output [3:0] ALUFlags,
	output [31:0] Result, Instr
);
	wire [31:0] PC_in, PC_out, PCPlus4, PCPlus8, ExtImm, SrcA, SrcB, ALUResult, ReadData, RD1, RD2;
	wire [3:0] RA1, RA2;

	mux2x1 #(
		.WIDTH(32)
	) mux2x1_PC (
		.a(Result),
		.b(PCPlus4),
		.sel(PCSrc),
		.out(PC_in)
	);	

	program_counter program_counter_unit(
		.CLK(CLK),
		.PC_in(PC_in),
		.PC_out(PC_out)
	);

	assign PCPlus4 = PC_out + 4;
	assign PCPlus8 = PC_out + 8;

	instruction_memory instruction_memory_unit(
		.Address(PC_out),
		.ReadData(Instr)
	);

	mux2x1 #(
		.WIDTH(4)
	) mux2x1_RA1 (
		.a(Instr[19:16]),
		.b(4'b1111),
		.sel(RegSrc[0]),
		.out(RA1)
	);	

	mux2x1 #(
		.WIDTH(4)
	) mux2x1_RA2 (
		.a(Instr[3:0]),
		.b(Instr[15:12]),
		.sel(RegSrc[1]),
		.out(RA2)
	);	

	register_file register_file_unit(
		.CLK(CLK),
		.WE3(MemWrite),
		.A1(RA1),
		.A2(RA2),
		.A3(Instr[15:12]),
		.WD3(Result),
		.R15(PCPlus8),
		.RD1(RD1),
		.RD2(RD2)
	);

	extend extend_unit(
		.ImmSrc(ImmSrc),
		.Extend_in(Instr[23:0]),
		.ExtImm(ExtImm)
	);

	mux2x1 #(
		.WIDTH(32)
	) mux2x1_SrcB (
		.a(RD2),
		.b(ExtImm),
		.sel(ALUSrc),
		.out(SrcB)
	);	

	alu alu_unit(
		.ALUControl(ALUControl),
		.SrcA(RD1),
		.SrcB(SrcB),
		.ALUResult(ALUResult),
		.ALUFlags(ALUFlags)
	);

	data_memory data_memory_unit(
		.CLK(CLK),
		.Address(ALUResult),
		.WriteData(RD2),
		.MemWrite(MemWrite),
		.ReadData(ReadData)
	);

	mux2x1 #(
		.WIDTH(32)
	) mux2x1_4 (
		.a(ALUResult),
		.b(ReadData),
		.sel(MemtoReg),
		.out(Result)
	);	

endmodule