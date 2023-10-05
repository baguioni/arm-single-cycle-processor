module extend(
	input [11:0] Extend_in,
	output [31:0] ExtImm
);

	assign output = {{20{Extend_in[11]}}, Extend_in}

endmodule
