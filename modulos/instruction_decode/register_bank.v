`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:53:51 03/30/2015 
// Design Name: 
// Module Name:    register_bank 
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
module register_bank(input reg_write,
							input [4:0] ra,
							input [4:0] rb,
							input [4:0] rw, //Si es cero lee los registros ra y rb, si es distinto de cero guarda en rw el dato de busw
							input [31:0] busw,
							output [31:0] busa,
							output [31:0] busb
    );
	 
reg [31:0] registro[0:31];

initial registro[0] = 1;
initial registro[1] = 666;
initial registro[2] = 444;
initial registro[3] = 888;
initial registro[4] = 9;

assign busa = registro[ra];
assign busb = registro[rb];

always @(posedge reg_write)
	begin
		registro[rw] = busw;
	end

endmodule
