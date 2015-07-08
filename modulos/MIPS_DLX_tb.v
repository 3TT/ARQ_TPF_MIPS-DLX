`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:05:15 05/13/2015
// Design Name:   MIPS_DLX
// Module Name:   /home/santi/workspace.ISE/TPF_MIPS-DLX/MIPS_DLX_tb.v
// Project Name:  TPF_MIPS-DLX
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MIPS_DLX
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MIPS_DLX_tb;

	// Inputs
	reg clock;
	reg reset;

	// Outputs
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	MIPS_DLX uut (
		.clock(clock), 
		.reset(reset), 
		.zero(zero)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 1'b1;

		// Wait 100 ns for global reset to finish
		#15;
        
		// Add stimulus here

	end
	
      always #5 clock=!clock;
		
		initial 
		#500  $finish; 
		
endmodule

