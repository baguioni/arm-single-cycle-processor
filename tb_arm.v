module tb_arm();
	reg CLK;
	wire [31:0] Result, Instr;

	// Instantiate the Unit Under Test (UUT)
	arm uut (
		.CLK(CLK),
		.Result(Result),
		.Instr(Instr)
	);
	
	initial
	// generate clock to sequence tests always
	begin
		CLK <= 1; # 5; CLK <= 0; # 5; 
	end

	// check that 7 gets written to address 0x64 // at end of program
	always @(posedge CLK) begin
		$display("Result = %b Instr = %b", Result, Instr);
	end
endmodule
