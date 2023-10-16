module tb_instruction_memory;
	wire [31:0] ReadData; 
	reg [31: 0] Address;

	instruction_memory uut(
		.Address(Address),
		.ReadData(ReadData)
	);

	initial begin
		Address= 32'b0;       // write data
		$display("Address=%b ReadData=%b ", Address, ReadData);
		#10
		Address= 32'b100;       // write data
		$display("Address=%b ReadData=%b ", Address, ReadData);
		#10
		$finish;
	end

endmodule
