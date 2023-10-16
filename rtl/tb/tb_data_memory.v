`timescale 1ns / 1ps

module tb_data_memory;
	reg CLK = 0;
	reg MemWrite, MemRead;
	reg [31:0] Address;
	reg [31:0] WriteData;
	wire [31:0] ReadData;

	data_memory uut(
		.CLK(CLK),
		.Address(Address), 
		.WriteData(WriteData), 
		.MemWrite(MemWrite), 
		.ReadData(ReadData)
	);

	initial begin
		CLK = 1'b0;
		forever begin
			#10 CLK = ~CLK;
		end
	end

	initial begin
		Address= 32'b0; WriteData=32'b111; MemWrite=1;       // write data
		$display("Write: time=%3d CLK=%b Address=%b WriteData=%b MemWrite=%b ", $time, CLK, Address, WriteData, MemWrite);
		#10
		$display("Read: time=%3d CLK=%b Address=%b ReadData=%b", $time, CLK, Address, ReadData);
		#10
		Address= 32'b0; WriteData=32'b000; MemWrite=0;       // cant write data
		$display("Write: time=%3d CLK=%b Address=%b WriteData=%b MemWrite=%b ", $time, CLK, Address, WriteData, MemWrite);
		#10
		$display("Read: time=%3d CLK=%b Address=%b ReadData=%b", $time, CLK, Address, ReadData);

		$finish;
	end

endmodule
