`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:11:32 03/27/2015 
// Design Name: 
// Module Name:    mux_2to1 
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

module mux_2to1(in_a,in_b,sel,out);

parameter bus_size = 10;

input [bus_size-1:0]in_a;
input [bus_size-1:0]in_b;
input sel;
output reg [bus_size-1:0]out;

initial out = 0;

always@(sel,in_a,in_b)
begin
	case (sel)
	2'b0: out = in_a;	
	2'b1: out = in_b;
	endcase
end

endmodule
