module tb_arm();
	reg CLK;
	reg [31:0] Result;

	// Instantiate the Unit Under Test (UUT)
	arm uut (
		.CLK(CLK),
		.Result(Result)
	);
	
initial
// generate clock to sequence tests always
begin
	clk <= 1; # 5; clk <= 0; # 5; 
end

// check that 7 gets written to address 0x64 // at end of program
always @(negedge clk) begin
	$display("Result = %b", Result);
end
endmodule
