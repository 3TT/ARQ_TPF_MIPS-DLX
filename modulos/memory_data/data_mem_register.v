`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:02:30 06/02/2015 
// Design Name: 
// Module Name:    memory_data 
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
module memory_data(input clock,
						input [9:0] address,
						input [31:0] data_write,
						input mem_write,
						output reg [31:0] data_read
    );
	 
reg [31:0] registro[0:1023];
integer i;
 
initial 
	begin
		registro[0]=0;
		for (i = 1; i < 1023; i = i+1) //No se toma el cero porque segun el Negro el registro cero tiene que ir conectado a tierra para que sea cero.
			registro[i] = i;
	end

//assign data_read = registro[address];

always @(negedge clock)//--> Preguntarle al profe porq quitando el posedge tira latches para cada uno de los bits de los regitros del banco de registro.
	begin
		if(mem_write == 1)
			registro[address] = data_write;
		else
			data_read = registro[address];
	end

endmodule
