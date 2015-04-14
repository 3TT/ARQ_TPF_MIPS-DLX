`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:41:06 04/10/2015
// Design Name:   MIPS_DLX
// Module Name:   /home/laryc05/Workspace.arq/TPF_MIPS_dlx/MIPS_DLX_tb.v
// Project Name:  TPF_MIPS_dlx
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
	reg PC_sel;
	reg [31:0] busw;

	// Outputs
	wire [3:0] EX_control;
	wire [3:0] M_control;
	wire [1:0] WB_control;
	wire [31:0] busa;
	wire [31:0] busb;
	wire [31:0] immed_ext;

	// Instantiate the Unit Under Test (UUT)
	MIPS_DLX uut (
		.clock(clock), 
		.PC_sel(PC_sel), 
		.busw(busw), 
		.EX_control(EX_control), 
		.M_control(M_control), 
		.WB_control(WB_control), 
		.busa(busa), 
		.busb(busb), 
		.immed_ext(immed_ext)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		PC_sel = 1;
		busw = 0;
		
		/*registro[0] = 99;
		registro[1] = 666;
		registro[2] = 444;
		registro[3] = 888;
		registro[4] = 9;*/

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always
		#10	clock = !clock;
      
endmodule

