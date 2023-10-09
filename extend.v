module extend(
	input [1:0] ImmSrc,
	input [23:0] Extend_in,
	output reg [31:0] ExtImm
);

	always @(*) begin
		case(ImmSrc)
			2'b00: ExtImm = {24'b0, Extend_in[7:0]}; // 8-bit unsigned immediate
			2'b01: ExtImm = {20'b0, Extend_in[11:0]}; // 12-bit unsigned immediate
			2'b10: ExtImm = {{6{Extend_in[23]}}, Extend_in[23:0], 2'b00}; // 24-bit two's complement shifted branch
			default: ExtImm = 32'bx; // undefined
		endcase
	end
endmodule
