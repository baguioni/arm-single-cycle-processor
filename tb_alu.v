module tb_alu;
	reg [1:0] ALUControl;
	reg [31:0] SrcA;
	reg [31:0] SrcB;
	wire [31:0] ALUResult;
	
	alu alu_uut(
		.ALUControl(ALUControl),
		.SrcA(SrcA),
		.SrcB(SrcB),
		.ALUResult(ALUResult)
	);
	
	initial begin
		ALUControl = 2'b00; SrcA = 32'b1; SrcB = 32'b0; #10;
		if (ALUResult == 32'b1) $display("Passed: ALUControl=%b SrcA=%b SrcB=%b ALUResult=%b", ALUControl, SrcA, SrcB, ALUResult);
		else $display("Failed: ALUControl=%b SrcA=%b SrcB=%b ALUResult=%b", ALUControl, SrcA, SrcB, ALUResult);

		ALUControl = 2'b01; SrcA = 32'b1; SrcB = 32'b1; #10;
		if (ALUResult == 32'b0) $display("Passed: ALUControl=%b SrcA=%b SrcB=%b ALUResult=%b", ALUControl, SrcA, SrcB, ALUResult);
		else $display("Failed: ALUControl=%b SrcA=%b SrcB=%b ALUResult=%b", ALUControl, SrcA, SrcB, ALUResult);

		ALUControl = 2'b10; SrcA = 32'b1; SrcB = 32'b1; #10;
		if (ALUResult == 32'b1) $display("Passed: ALUControl=%b SrcA=%b SrcB=%b ALUResult=%b", ALUControl, SrcA, SrcB, ALUResult);
		else $display("Failed: ALUControl=%b SrcA=%b SrcB=%b ALUResult=%b", ALUControl, SrcA, SrcB, ALUResult);

		ALUControl = 2'b11; SrcA = 32'b0; SrcB = 32'b1; #10;
		if (ALUResult == 32'b1) $display("Passed: ALUControl=%b SrcA=%b SrcB=%b ALUResult=%b", ALUControl, SrcA, SrcB, ALUResult);
		else $display("Failed: ALUControl=%b SrcA=%b SrcB=%b ALUResult=%b", ALUControl, SrcA, SrcB, ALUResult);
	end
endmodule
