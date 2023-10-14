module alu(
	input [1:0] ALUControl,
	input [31:0] SrcA,
	input [31:0] SrcB,
	output reg [31:0] ALUResult,
	output reg [3:0] ALUFlags// N, Z, V, C
);

	always @(*) begin 
		case(ALUControl)
			2'b00: ALUResult = SrcA + SrcB;
			2'b01: ALUResult = SrcA - SrcB;
			2'b10: ALUResult = SrcA & SrcB; // bitwise operation
			2'b11: ALUResult = SrcA | SrcB; // bitwise operation
		endcase

		// Set ALUFlags

		// N Flag
		if (ALUResult[31] == 1) begin
			ALUFlags[3] = 1'b1; // N
		end else begin
			ALUFlags[3] = 1'b0;
		end

		// Z Flag
		if (ALUResult == 0) begin
			ALUFlags[2] = 1'b1; // Z
		end else begin
			ALUFlags[2] = 1'b0;
		end

		// V Flag
		// http://teaching.idallen.com/dat2343/10f/notes/040_overflow.txt
		// Overflow occurs when A and B are the same sign, but the result is a different sign
		if (SrcA > 0 && SrcB > 0 && ALUResult < 0) begin
			ALUFlags[1] = 1'b1; // V
		end else if (SrcA < 0 && SrcB < 0 && ALUResult > 0) begin
			ALUFlags[1] = 1'b1; // V
		end else begin
			ALUFlags[1] = 1'b0;
		end

		// C Flag
		// C Flag is set when the result of an unsigned operation is greater than the operands
		// Note this might not work for subtraction Borrow Flag
		if (ALUResult < SrcA || ALUResult < SrcB) begin
			ALUFlags[0] = 1'b1; // C
		end else begin
			ALUFlags[0] = 1'b0;
		end
	end
endmodule
