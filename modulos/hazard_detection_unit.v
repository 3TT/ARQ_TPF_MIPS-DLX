`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:44:21 07/07/2015 
// Design Name: 
// Module Name:    hazard_detector_unit 
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
module hazard_detection_unit(input mem_read_MEM_ctrl,
										input [4:0] rs_IF_ID,
										input [4:0] rt_IF_ID,
										input [4:0] rt_ID_EX,
										output reg PC_write,
										output reg mux_ctrl_signal_sel,
										output reg IF_ID_write
										);
										
initial mux_ctrl_signal_sel = 1;
initial PC_write = 1;
initial IF_ID_write = 1;

always @ *
begin
	if( mem_read_MEM_ctrl
	&& ((rt_ID_EX == rs_IF_ID)
	||(rt_ID_EX == rt_IF_ID)))
		begin
			PC_write <= 0;
			mux_ctrl_signal_sel <= 0;
			IF_ID_write <= 0;
		end
	else
		begin
			PC_write <= 1;
			mux_ctrl_signal_sel <= 1;
			IF_ID_write <= 1;
		end
end

endmodule