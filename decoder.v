// Composed of PC Logic, Main Decoder, ALU decoder
module decoder(
	input [1:0] Op, 
	input [5:0] Funct, 
	input [3:0] Rd,
	output reg [1:0] FlagW,
	output PCS,
	output reg RegW, MemW,
	output reg MemtoReg, ALUSrc,
	output reg [1:0] ImmSrc, RegSrc, ALUControl
);
	reg ALUOp, Branch;
	// Main decoder logic
	always @* begin
		if (Op == 2'b00 && Funct[5] == 0) begin
			assign Branch = 0;
			assign MemtoReg = 0;
			assign MemW = 0;
			assign ALUSrc = 0;
			assign ImmSrc = 2'bx;
			assign RegW = 1;
			assign RegSrc = 2'b00;
			assign ALUOp = 1;
		end else if (Op == 2'b00 && Funct[5] == 1) begin
			assign Branch = 0;
			assign MemtoReg = 0;
			assign MemW = 0;
			assign ALUSrc = 1;
			assign ImmSrc = 2'b00;
			assign RegW = 1;
			assign RegSrc = 2'bx0;
			assign ALUOp = 1;
		end else if (Op == 2'b01 && Funct[0] == 0) begin
			assign Branch = 0;
			assign MemtoReg = 1'bx;
			assign MemW = 1;
			assign ALUSrc = 1;
			assign ImmSrc = 2'b01;
			assign RegW = 0;
			assign RegSrc = 2'b10;
			assign ALUOp = 0;
		end else if (Op == 2'b01 && Funct[0] == 1) begin
			assign Branch = 0;
			assign MemtoReg = 1;
			assign MemW = 0;
			assign ALUSrc = 1;
			assign ImmSrc = 2'b01;
			assign RegW = 1;
			assign RegSrc = 2'bx0;
			assign ALUOp = 0;
		end else if (Op == 2'b10 && Funct[0] == 1) begin
			assign Branch = 1;
			assign MemtoReg = 0;
			assign MemW = 0;
			assign ALUSrc = 1;
			assign ImmSrc = 2'b10;
			assign RegW = 0;
			assign RegSrc = 2'bx1;
			assign ALUOp = 0;
		end

		// ALU Decoder logic
		if (ALUOp == 0) begin
			assign ALUControl = 2'b00;
			assign FlagW = 2'b00;
		end
		else begin 
			case(Funct[4:1])
				4'b0100: if (Funct[0] == 0) begin 
						assign ALUControl = 2'b00;
						assign FlagW = 2'b00;
					end else begin 
						assign ALUControl = 2'b00;
						assign FlagW = 2'b11;
					end
				4'b0010: if (Funct[0] == 0) begin 
						assign ALUControl = 2'b01;
						assign FlagW = 2'b00;
					end else begin 
						assign ALUControl = 2'b01;
						assign FlagW = 2'b11;
					end
				4'b0000: if (Funct[0] == 0) begin 
						assign ALUControl = 2'b10;
						assign FlagW = 2'b00;
					end else begin 
						assign ALUControl = 2'b10;
						assign FlagW = 2'b11;
					end
				4'b1100: if (Funct[0] == 0) begin 
						assign ALUControl = 2'b11;
						assign FlagW = 2'b00;
					end else begin 
						assign ALUControl = 2'b11;
						assign FlagW = 2'b11;
					end
			endcase
		end

	end
	
	// PC Logic
	assign PCS = ((Rd == 15) && RegW) || Branch;

endmodule
