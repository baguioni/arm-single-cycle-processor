// 32-bit addressing
// 32-bit word size
module data_memory(
	input CLK, 
	input [31:0] Address, 
	input [31:0] WriteData, 
	input MemWrite, // write data
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

	// writes are synchronous operations
	always @(posedge CLK) begin
		if (MemWrite == 1'b1) begin
			memory[Address] <= WriteData;
		end
	end

	// reads are combinational operations
	assign ReadData = memory[Address];
	
endmodule
