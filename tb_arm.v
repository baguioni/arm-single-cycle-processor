module tb_arm();
	reg CLK, RST;
	reg [3:0] counter;
	wire [31:0] Result, Instr, PC_out, ALUResult ;
	wire [1:0] ALUControl;

	// Instantiate the Unit Under Test (UUT)
	arm uut (
		.CLK(CLK),
		.RST(RST),
		.Result(Result),
		.Instr(Instr),
		.PC_out(PC_out),
		.ALUResult(ALUResult),
		.ALUControl(ALUControl)
	);
	
	initial
	begin
		RST <= 1; # 22; RST <= 0; 
	end

	// generate clock to sequence tests always
	always
	begin
		CLK <= 1; # 5; CLK <= 0; # 5; 
	end

	// check that 7 gets written to address 0x64 // at end of program
	integer i;
	always @(negedge CLK) begin
		if(Instr== 'hE0000000) begin
			$display("Simulation succeeded");
			$finish;
		end else begin
			   if (RST)
      				counter <= 4'b0;
   				else
      				counter <= counter + 1;
			
		$display("Instr = %h ALUControl = %b ALUResult = %b", Instr, ALUControl, ALUResult);
		end
	end
endmodule
