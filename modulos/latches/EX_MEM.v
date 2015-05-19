`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:03:23 04/24/2015 
// Design Name: 
// Module Name:    EX_MEM 
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
module EX_MEM(
					input enable,
					input reset,
					input [1:0] M_control_in,
					input [1:0] WB_control_in,
					input [31:0] ALU_out_in,
					input [31:0] data_write_in,
					input [4:0] rw_in,
					output reg [1:0] M_control_out,
					output reg [1:0] WB_control_out,
					output reg [31:0] ALU_out_out,
					output reg [31:0] data_write_out,
					output reg [4:0] rw_out
    );

initial ALU_out_out=0;
initial data_write_out=0;

always@(posedge enable or negedge reset)
begin
	if(!reset)
	begin
		M_control_out <= 0;
		WB_control_out <= 0;
		ALU_out_out <= 0;
		data_write_out <= 0;
		rw_out <= 0;
	end
	else
		if(enable)
		begin
			M_control_out <= M_control_in;
			WB_control_out <= WB_control_in;
			ALU_out_out <= ALU_out_in;
			data_write_out <= data_write_in;
			rw_out <= rw_in;
		end
end
endmodule
