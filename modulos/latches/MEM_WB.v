`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:23:07 04/24/2015 
// Design Name: 
// Module Name:    MEM_WB 
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
module MEM_WB( 
									input clock,
									input enable,
									input [1:0] WB_control_in,
									input [31:0] data_from_mem_in,
									input [31:0] data_from_ALU_in,
									input [4:0] rw_in,
									output reg[1:0] WB_control_out,
									output reg[31:0] data_from_mem_out,
									output reg[31:0] data_from_ALU_out,
									output reg [4:0] rw_out
									);
initial WB_control_out = 0;
initial data_from_mem_out = 0;
initial data_from_ALU_out=0;
initial rw_out = 0;

always@(posedge clock)
	begin
		if(enable)
			begin
				WB_control_out <= WB_control_in;
				data_from_mem_out <= data_from_mem_in;
				data_from_ALU_out <= data_from_ALU_in;
				rw_out <= rw_in;
			end
		else
			begin
				WB_control_out <= WB_control_out;
				data_from_mem_out <= data_from_mem_out;
				data_from_ALU_out <= data_from_ALU_out;
				rw_out <= rw_out;
			end
	end

endmodule
