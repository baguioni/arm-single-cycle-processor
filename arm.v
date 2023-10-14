module arm(
	input CLK,
	output [31:0] Result
);

	wire [3:0] ALUFlags;
	wire [31:0] Instr;

	// Input to control unit
	wire [3:0] Cond = Instr[31:28];
	wire [1:0] Op = Instr[27:26];
	wire [5:0] Funct = Instr[25:20];
	wire [3:0] Rd = Instr[15:12];


	wire PCSrc, RegWrite, MemWrite, MemtoReg, ALUSrc; 
	wire [1:0] ImmSrc, RegSrc, ALUControl;

	datapath datapath_uut(
		.CLK(CLK),
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
		.Instr(Instr)
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
