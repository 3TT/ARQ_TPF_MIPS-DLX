`timescale 1ns / 1ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:58:30 04/24/2015
// Design Name:   latch
// Module Name:   /home/santi/workspace.ISE/TPF_MIPS-DLX/ARQ_TPF_MIPS-DLX/modulos/latch_tb.v
// Project Name:  TPF_MIPS-DLX
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: latch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module latch_tb;

	// Inputs
	reg enable;
	reg data_in;
	reg reset;

	// Outputs
	wire data_out;

	// Instantiate the Unit Under Test (UUT)
	latch #(10) uut (
		.enable(enable), 
		.data_in(data_in), 
		.reset(reset), 
		.data_out(data_out)
	);

	initial begin
		// Initialize Inputs
		enable = 1;
		data_in = 50;
		reset = 1'b1;

		// Wait 100 ns for global reset to finish
		 #100;
       data_in = 10;
		 #100;
       data_in = 20;
		 #100;
       data_in = 30;
		 #100;
       data_in = 40;
		 
		// Add stimulus here

	end
      always
		#10	enable = !enable;
endmodule

