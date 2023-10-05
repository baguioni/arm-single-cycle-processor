// 32-bit addressing
// 32-bit word size
module instruction_memory(
	input [31:0] Address, 
	input [31:0] WriteData, 
	output wire [31:0] ReadData 
);
	// 32-bit wide word
	// 8 words deep
	reg [31:0] memory [7:0];

	// initialize memory values to 0
	integer i;
	initial begin
		$display("Initializing memory");
		for(i=0; i< 7; i=i+1) begin
			memory[i] = 32'b0;
		end
	end

	// reads are combinational operations
	assign ReadData = memory[Address];
	
endmodule
