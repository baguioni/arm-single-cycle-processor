// 32-bit addressing
// 32-bit word size
module instruction_memory(
	input [31:0] Address, 
	output wire [31:0] ReadData 
);
	// 32-bit wide word
	// 8 words deep
	reg [31:0] memory [7:0];

	// initialize memory values to 0
	integer i;
	initial begin
		$display("Initializing memory");

		$readmemb("instruction.mem", memory);

	end

	// reads are combinational operations
	assign ReadData = memory[Address];
	
endmodule
