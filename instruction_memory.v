// 32-bit addressing
// 32-bit word size
module instruction_memory(
	input [31:0] Address, 
	output wire [31:0] ReadData 
);
	// 32-bit wide word
	reg [31:0] memory [63:0];
	integer i;

	// initialize memory values to 0
	initial begin
		$display("Initializing instruction memory");

		$readmemh("instruction.dat", memory);

		// display memory register using a for loop
		// for (i = 0; i < 64; i = i + 1) begin
		// 	$display("%d : %b", i, memory[i]);
		// end
	end

	// reads are combinational operations
	assign ReadData = memory[Address[31:2]];
	
endmodule
