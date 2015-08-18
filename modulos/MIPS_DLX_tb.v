`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:01:24 08/18/2015
// Design Name:   MIPS_DLX
// Module Name:   /home/laryc05/Workspace.arq/MIPS_enable/MIPS_DLX_tb.v
// Project Name:  MIPS_enable
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
	reg enable;

	// Outputs
	wire zero;
	wire [9:0] debug_signal;
	// Instantiate the Unit Under Test (UUT)
	MIPS_DLX uut (
		.clock(clock), 
		.enable(enable), 
		.zero(zero),
		.debug_signal(debug_signal)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		enable = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always #5 clock = !clock;
      
endmodule

