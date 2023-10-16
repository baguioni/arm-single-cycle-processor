module tb_extend;
	reg [1:0] ImmSrc;
	reg [23:0] Extend_in;
	wire [31:0] ExtImm;
	
	extend extend_uut(
		.ImmSrc(ImmSrc), 
		.Extend_in(Extend_in), 
		.ExtImm(ExtImm)
	);

	initial begin
		ImmSrc = 2'b00; Extend_in = 24'b000000000000000000001010; #10;
		if (ExtImm == 32'b00000000000000000000000000001010) $display("Passed: ExtImm = %b", ExtImm);
		else $display("Failed: ExtImm = %b", ExtImm);

		ImmSrc = 2'b01; Extend_in = 24'b100000100100000100011010; #10;
		if (ExtImm == 32'b00000000000000000000000100011010) $display("Passed: ExtImm = %b", ExtImm);
		else $display("Failed: ExtImm = %b", ExtImm);

		ImmSrc = 2'b10; Extend_in = 24'b100000100100000100011010; #10;
		if (ExtImm == 32'b11111110000010010000010001101000) $display("Passed: ExtImm = %b", ExtImm);
		else $display("Failed: ExtImm = %b", ExtImm);
	end
endmodule
