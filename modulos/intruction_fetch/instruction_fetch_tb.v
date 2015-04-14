`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:56:33 03/30/2015
// Design Name:   instruction_fetch
// Module Name:   /home/santi-xub/workspace.ISE/instruc_fetch/instruction_fetch_tb.v
// Project Name:  instruc_fetch
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: instruction_fetch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module instruction_fetch_tb;

	// Inputs
	reg PC_sel;
	reg clock;
	reg [9:0] jump_address;

	// Outputs
	wire [31:0] instruc_reg;
	wire [9:0] PC_plus_1;

	// Instantiate the Unit Under Test (UUT)
	instruction_fetch uut (
		.PC_sel(PC_sel), 
		.clock(clock), 
		.jump_address(jump_address), 
		.instruc_reg(instruc_reg), 
		.PC_plus_1(PC_plus_1)
	);

	initial begin
		// Initialize Inputs
		PC_sel = 1;
		clock = 0;
		jump_address = 0;


		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
	end
	
	always  
       #5  clock = !clock;
 
	initial 
		#100  $finish;  
		
endmodule

