`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:44:34 03/31/2015 
// Design Name: 
// Module Name:    instruction_decode 
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
module instruction_decode(input [31:0] instruc,
									input reg_write,
									input [4:0] rw,
									input [31:0] busw,
									output [31:0] busa,
									output [31:0] busb,
									output reg [31:0] immed_ext
    );
	 

always @(instruc)
begin
	immed_ext = {{16{instruc[15]}},{instruc[15:0]}};
end

register_bank registers(
							.reg_write(reg_write),
							.ra(instruc[25:21]),
							.rb(instruc[20:16]),
							.rw(rw), //Si es cero lee los registros ra y rb, si es distinto de cero guarda en rw el dato de busw
							.busw(busw),
							.busa(busa),
							.busb(busb)
    );
	 

endmodule
