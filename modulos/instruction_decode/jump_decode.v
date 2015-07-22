`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:53:15 07/15/2015 
// Design Name: 
// Module Name:    jump_decode 
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
module jump_decode(
											input [5:0] opcode,
											output reg jump_sel
										);

initial jump_sel = 0;

always@(opcode)
begin
	case (opcode)
	6'b000010: //J
		begin
			jump_sel = 1;
		end
	default: 
		begin
			jump_sel = 0;
		end
	endcase
end
/*always @(opcode)
begin
	if (opcode == 6'b000010)
		jump_sel = 1;
	else
		jump_sel = 0;
end*/

endmodule
