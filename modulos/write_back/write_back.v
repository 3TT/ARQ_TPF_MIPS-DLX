`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:09:42 04/17/2015 
// Design Name: 
// Module Name:    write_back 
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
module write_back(
						input WB_control,
						input [31:0]data_from_mem,
						input [31:0]data_from_ALU,
						output [31:0]bus_w
    );

mux_2to1 #(32) mux (
	.in_a(data_from_mem),
	.in_b(data_from_ALU),
	.sel(WB_control),
	.out(bus_w)
    );

endmodule
