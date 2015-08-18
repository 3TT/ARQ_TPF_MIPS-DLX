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
`include "../definiciones.vh"


module PC(
					input clock,
					input enable,
					input PC_write,
					input [`PC_SIZE:0] PC_new,			//direccion que entra al PC, es la que sale del sumador o que viene desde un jump
					output reg [`PC_SIZE:0]PC_current		//direccion que sale del PC, es la que va la Memoria de Instrucciones.
					);

initial PC_current = 0;
//initial PC_new = 0;

always@ (negedge clock)
begin
	if(enable)
		begin
			if(PC_write)
				PC_current<=PC_new;
			else
				PC_current<=PC_current;
		end
	else
		begin
			PC_current<=PC_current;
		end
end

endmodule
