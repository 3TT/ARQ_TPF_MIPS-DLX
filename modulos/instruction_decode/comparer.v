`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:00:21 04/17/2015 
// Design Name: 
// Module Name:    suber 
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
module comparer(a,b,cmp_out);
parameter BUS_SIZE = 10;
input [BUS_SIZE-1:0] a,b;
output cmp_out;
assign cmp_out = (a == b);
endmodule
