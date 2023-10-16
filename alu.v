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

		case(ALUControl)
			2'b00: begin
				ALUFlags[1] = ((SrcA[31] & ~SrcB[31] & ALUResult[31]) | (SrcA[31] & SrcB[31] & ~ALUResult[31])); // V Flag
				ALUFlags[0] = (SrcA >= SrcB) ? 1'b0 : 1'b1; // C Flag
			end
			2'b01: begin	
				ALUFlags[1] = ((SrcA[31] & ~SrcB[31] & ALUResult[31]) | (~SrcA[31] & SrcB[31] & ALUResult[31])); // V Flag
				ALUFlags[0] = (SrcA < SrcB) ? 1'b1 : 1'b0; // C Flag
			end
			default begin
				ALUFlags[1] = 1'bx; // V Flag
				ALUFlags[0] = 1'bx; // C Flag
			end
		endcase
	end
endmodule
