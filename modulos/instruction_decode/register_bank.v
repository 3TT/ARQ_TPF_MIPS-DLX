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
integer i; 
initial 
	begin 
		for (i = 1; i < 32; i = i+1) //No se toma el cero porque segun el Negro el registro cero tiene que ir conectado a tierra para que sea cero.
			registro[i] = i;
	end

assign busa = registro[ra];
assign busb = registro[rb];

always @(posedge reg_write)
	begin
		registro[rw] = busw;
	end

endmodule
