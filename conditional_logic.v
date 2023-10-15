module conditional_logic(
	input CLK,
	input [3:0] Cond, ALUFlags,
	input [1:0] FlagW,
	input PCS, RegW, MemW,
	output PCSrc, RegWrite, MemWrite
);
	assign {N, Z, V, C} = ALUFlags;

	reg  [1:0] Flags_NZ, Flags_VC;
	reg CondEx;

	always @(posedge CLK) begin
		if (FlagW[1] && CondEx) begin
			Flags_NZ <= {N, Z};
		end

		if (FlagW[0] && CondEx) begin
			Flags_VC <= {V, C};
		end
	end

	// Condition Check
	always @(*) begin
		case(Cond) 
			4'b0000: CondEx = Z;
			4'b0001: CondEx = ~Z;
			4'b0010: CondEx = C;
			4'b0011: CondEx = ~C;
			4'b0100: CondEx = N;
			4'b0101: CondEx = ~N;
			4'b0110: CondEx = V;
			4'b0111: CondEx = ~V;
			4'b1000: CondEx = C & ~Z;
			4'b1001: CondEx = ~C | Z;
			4'b1010: CondEx = N == V; // XNOR checks for equivalence
			4'b1011: CondEx = N != V; // XOR checks for inequivalence
			4'b1100: CondEx = ~Z & (N == V);
			4'b1101: CondEx = Z | (N != V);
			4'b1110: CondEx = 1'b1; // Always
		endcase
	end

	assign PCSrc = CondEx & PCS;
	assign RegWrite = CondEx & RegW;
	assign MemWrite = CondEx & MemW;

endmodule
