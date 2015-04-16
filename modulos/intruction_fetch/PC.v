`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:26:24 03/30/2015 
// Design Name: 
// Module Name:    PC 
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
module PC(
	input [9:0]PC_new,			//direccion que entra al PC, es la que sale del sumador o que viene desde un jump
	input clock,
	output reg [9:0]PC_current		//direccion que sale del PC, es la que va la Memoria de Instrucciones.
    );

initial PC_current = 0;
always@ (posedge clock)
	begin
	PC_current=PC_new;
	end


endmodule
