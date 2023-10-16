module tb_alu;
	reg [1:0] ALUControl;
	reg [31:0] SrcA;
	reg [31:0] SrcB;
	wire [31:0] ALUResult;
	wire [3:0] ALUFlags;
	
	alu alu_uut(
		.ALUControl(ALUControl),
		.SrcA(SrcA),
		.SrcB(SrcB),
		.ALUResult(ALUResult),
		.ALUFlags(ALUFlags)
	);
	
	initial begin
		ALUControl = 2'b00; SrcA = 32'b1; SrcB = 32'b0; #10;
		if (ALUResult == 32'b1) $display("Passed: ALUControl=%b SrcA=%b SrcB=%b ALUResult=%b ALUFlags=%b", ALUControl, SrcA, SrcB, ALUResult, ALUFlags); 
		else $display("Failed: ALUControl=%b SrcA=%b SrcB=%b ALUResult=%b ALUFlags=%b", ALUControl, SrcA, SrcB, ALUResult, ALUFlags); 

		ALUControl = 2'b00; SrcA = 32'b11111111111111111111111111111110; SrcB = 32'b11111111111111111111111111111111; #10;
		if (ALUResult == 32'b1) $display("Passed: ALUControl=%b SrcA=%b SrcB=%b ALUResult=%b ALUFlags=%b", ALUControl, SrcA, SrcB, ALUResult, ALUFlags); 
		else $display("Failed: ALUControl=%b SrcA=%b SrcB=%b ALUResult=%b ALUFlags=%b", ALUControl, SrcA, SrcB, ALUResult, ALUFlags); 

		ALUControl = 2'b01; SrcA = 32'b1; SrcB = 32'b1; #10;
		if (ALUResult == 32'b0) $display("Passed: ALUControl=%b SrcA=%b SrcB=%b ALUResult=%b ALUFlags=%b", ALUControl, SrcA, SrcB, ALUResult, ALUFlags); 
		else $display("Failed: ALUControl=%b SrcA=%b SrcB=%b ALUResult=%b ALUFlags=%b", ALUControl, SrcA, SrcB, ALUResult, ALUFlags); 

		ALUControl = 2'b01; SrcA = 32'b1; SrcB = 32'b10; #10;
		if (ALUResult == 32'b11111111111111111111111111111111) $display("Passed: ALUControl=%b SrcA=%b SrcB=%b ALUResult=%b ALUFlags=%b", ALUControl, SrcA, SrcB, ALUResult, ALUFlags); 
		else $display("Failed: ALUControl=%b SrcA=%b SrcB=%b ALUResult=%b ALUFlags=%b", ALUControl, SrcA, SrcB, ALUResult, ALUFlags); 

		ALUControl = 2'b10; SrcA = 32'b1; SrcB = 32'b1; #10;
		if (ALUResult == 32'b1) $display("Passed: ALUControl=%b SrcA=%b SrcB=%b ALUResult=%b ALUFlags=%b", ALUControl, SrcA, SrcB, ALUResult, ALUFlags); 
		else $display("Failed: ALUControl=%b SrcA=%b SrcB=%b ALUResult=%b ALUFlags=%b", ALUControl, SrcA, SrcB, ALUResult, ALUFlags); 

		ALUControl = 2'b11; SrcA = 32'b0; SrcB = 32'b1; #10;
		if (ALUResult == 32'b1) $display("Passed: ALUControl=%b SrcA=%b SrcB=%b ALUResult=%b ALUFlags=%b", ALUControl, SrcA, SrcB, ALUResult, ALUFlags); 
		else $display("Failed: ALUControl=%b SrcA=%b SrcB=%b ALUResult=%b ALUFlags=%b", ALUControl, SrcA, SrcB, ALUResult, ALUFlags); 
	end
endmodule
