module control_unit(
	input [3:0] Cond, 
	input [1:0] Op,
	input [5:0] Funct, 
	input [3:0] Rd,
	output PCSrc, MemtoReg, MemWrite, ALUControl, ALUSrc, ImmSrc, RegWrite,
	output [1:0] RegSrc
);

endmodule
