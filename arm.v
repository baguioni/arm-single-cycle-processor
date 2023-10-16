`include "datapath.v"
`include "control_unit.v"

module arm(
	input CLK, RST,
	output [31:0] Result, Instr, PC_out, ALUResult, 
	output [1:0] ALUControl
);
	wire [3:0] ALUFlags;
	// Input to control unit
	wire [3:0] Cond = Instr[31:28];
	wire [1:0] Op = Instr[27:26];
	wire [5:0] Funct = Instr[25:20];
	wire [3:0] Rd = Instr[15:12];

	wire PCSrc, RegWrite, MemWrite, MemtoReg, ALUSrc; 
	wire [1:0] ImmSrc, RegSrc;

	datapath datapath_uut(
		.CLK(CLK),
		.RST(RST),
		.PCSrc(PCSrc),
		.MemtoReg(MemtoReg),
		.MemWrite(MemWrite),
		.ALUSrc(ALUSrc),
		.RegWrite(RegWrite),
		.RegSrc(RegSrc),
		.ImmSrc(ImmSrc),
		.ALUControl(ALUControl),
		.ALUFlags(ALUFlags),
		.Result(Result),
		.Instr(Instr),
		.PC_out(PC_out),
		.ALUResult(ALUResult)
	);

	control_unit control_unit_uut(
		.CLK(CLK),
		.Cond(Cond), 
		.ALUFlags(ALUFlags),
		.Op(Op),
		.Funct(Funct),
		.Rd(Rd),
		.PCSrc(PCSrc),
		.RegWrite(RegWrite),
		.MemWrite(MemWrite),
		.MemtoReg(MemtoReg),
		.ALUSrc(ALUSrc),
		.ImmSrc(ImmSrc),
		.RegSrc(RegSrc),
		.ALUControl(ALUControl)
	);

endmodule
