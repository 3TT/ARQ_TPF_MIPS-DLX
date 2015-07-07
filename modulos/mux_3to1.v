`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:03:28 06/30/2015 
// Design Name: 
// Module Name:    mux_3to1 
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
module mux_3to1(in_a,in_b,in_c,sel,out);

parameter bus_size = 10;

input [bus_size-1:0]in_a;
input [bus_size-1:0]in_b;
input [bus_size-1:0]in_c;
input [1:0]sel;
output reg [bus_size-1:0]out;

always@(sel,in_a,in_b, in_c)
begin
	case (sel)
	2'b00: out = in_a;	
	2'b10: out = in_b;
	2'b01: out = in_c;
	default: out = in_a;
	endcase
end


endmodule
