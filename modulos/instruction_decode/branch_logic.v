`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:33:54 04/17/2015 
// Design Name: 
// Module Name:    branch_logic 
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
module branch_logic(
							input [1:0] DE_control,
							input cmp,
							//input jump_sel,
							output reg PC_sel
							);

initial PC_sel=0;
always @(*)
PC_sel = ((DE_control[0] ~^ cmp) & DE_control[1]);
//PC_sel = (((DE_control[0] ~^ cmp) & DE_control[1]) || jump_sel);




endmodule
