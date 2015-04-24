`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:30:59 04/24/2015 
// Design Name: 
// Module Name:    IF_ID 
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
module IF_ID(input enable,
				 input reset,
				 input [31:0]instruc_in,
				 input [9:0]PC_plus_1_in,
				 output reg[31:0]instruc_out,
				 output reg[9:0]PC_plus_1_out
    );
 
always@(enable or reset or instruc_in or PC_plus_1_in)
begin
	if(!reset)
	begin
		instruc_out <= 0;
		PC_plus_1_out <= 0;
	end
	else
		if(enable)
		begin
			instruc_out <= instruc_in;
			PC_plus_1_out <= PC_plus_1_in;
		end
end


endmodule
