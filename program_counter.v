module program_counter(
	input CLK,
	input [31:0] PC_in,
	output reg [31:0] PC_out
);
	always @(posedge CLK) begin
		PC_out <= PC_in;
	end

endmodule
