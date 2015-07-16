`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:23:08 03/27/2015 
// Design Name: 
// Module Name:    adder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module adder(
							in_a,
							in_b,
							sum
							);
							
parameter width = 10;

input  [width-1:0]in_a;
input  [width-1:0]in_b;
output [width-1:0]sum;

assign sum = in_a + in_b;

endmodule
