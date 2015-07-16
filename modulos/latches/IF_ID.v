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
				 input IF_ID_write,
				 input branch_taken,
				 input jump_sel,
				 output reg[31:0]instruc_out,
				 output reg[9:0]PC_plus_1_out
    );
initial instruc_out=0;
initial PC_plus_1_out=0;

always@(posedge enable, negedge reset, negedge IF_ID_write)
begin

	if(!reset || branch_taken || jump_sel) //El or con brahc_taken es para hacer el flush del latch
	begin
		instruc_out <= 0;
		PC_plus_1_out <= 0;
	end
	else
	begin
		if(enable)
		begin
			if(!IF_ID_write)
			begin
				instruc_out <= instruc_out;
				PC_plus_1_out <= PC_plus_1_out;
			end
			else
			begin
				instruc_out <= instruc_in;
				PC_plus_1_out <= PC_plus_1_in - 1;//ESTE MENOS UNO ES PARA QUE CONICIDAN EL ORDEN DEL PC Y LA INTRUCCION.
			end
		end
	end
end


endmodule
