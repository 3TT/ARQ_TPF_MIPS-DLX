`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:58:45 04/08/2015
// Design Name:   instruction_decode
// Module Name:   /home/laryc05/Workspace.arq/TPF_MIPS_dlx/instruction_decode_tb.v
// Project Name:  TPF_MIPS_dlx
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: instruction_decode
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module instruction_decode_tb;

	// Inputs
	reg [31:0] instruc;
	reg [4:0] rw;
	reg [31:0] busw;

	// Outputs
	wire [31:0] busa;
	wire [31:0] busb;
	wire [31:0] immed_ext;

	// Instantiate the Unit Under Test (UUT)
	instruction_decode uut (
		.instruc(instruc), 
		.rw(rw), 
		.busw(busw), 
		.busa(busa), 
		.busb(busb), 
		.immed_ext(immed_ext)
	);

	initial begin
		// Initialize Inputs
		instruc = 0;
		rw = 0;
		busw = 0;

		// Wait 100 ns for global reset to finish
		#100;
      
		// Add stimulus here
		instruc = 32'b00000000001000100001100000100000;

	end
      
endmodule

