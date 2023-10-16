`include "conditional_logic.v"
`include "decoder.v"

module control_unit(
	input CLK,
	input [3:0] Cond, ALUFlags,
	input [1:0] Op,
	input [5:0] Funct, 
	input [3:0] Rd,
	output PCSrc, RegWrite, MemWrite, MemtoReg, ALUSrc, 
	output [1:0] ImmSrc, RegSrc, ALUControl
);

	wire PCS, RegW, MemW;
	wire [1:0] FlagW;

	conditional_logic conditional_logic_unit(
		.CLK(CLK),
		.Cond(Cond),
		.ALUFlags(ALUFlags),
		.FlagW(FlagW),
		.PCS(PCS),
		.RegW(RegW),
		.MemW(MemW),
		.PCSrc(PCSrc),
		.RegWrite(RegWrite),
		.MemWrite(MemWrite)
	);
  
	decoder decoder_unit(
		.Op(Op),
		.Funct(Funct),
		.Rd(Rd),
		.FlagW(FlagW),
		.PCS(PCS),
		.RegW(RegW),
		.MemW(MemW),
		.MemtoReg(MemtoReg),
		.ALUSrc(ALUSrc),
		.ImmSrc(ImmSrc),
		.RegSrc(RegSrc),
		.ALUControl(ALUControl)
	);

endmodule
  
