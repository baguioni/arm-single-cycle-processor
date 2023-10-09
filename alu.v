module alu(
	input [1:0] ALUControl,
	input [31:0] SrcA,
	input [31:0] SrcB,
	output reg [31:0] ALUResult
);

	always @(*) begin 
		case(ALUControl)
			2'b00: ALUResult = SrcA + SrcB;
			2'b01: ALUResult = SrcA - SrcB;
			2'b10: ALUResult = SrcA & SrcB; // bitwise operation
			2'b11: ALUResult = SrcA | SrcB; // bitwise operation
		endcase
	end
endmodule
