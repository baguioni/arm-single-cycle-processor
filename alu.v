module alu(
	input [1:0] ALUControl,
	input [31:0] SrcA,
	input [31:0] SrcB,
	output wire [31:0] ALUResult
);

	case(ALUControl)
		2'b00: assign ALUResult = SrcA + SrcB;
		2'b01: assign ALUResult = SrcA = SrcB;
		2'b10: assign ALUResult = SrcA & SrcB; // bitwise operation
		2'b11: assign ALUResult = SrcA | SrcB; // bitwise operation
	endcase
endmodule
