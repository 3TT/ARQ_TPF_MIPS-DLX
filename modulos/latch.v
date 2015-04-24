`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:22:32 04/24/2015 
// Design Name: 
// Module Name:    latch 
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
module latch( enable,
				  data_in,
				  reset,
				  data_out
				 );
parameter BUS_SIZE=32;

input [BUS_SIZE-1:0] data_in;
output reg [BUS_SIZE-1:0] data_out;
input enable,reset;

always @(enable or reset or data_in)
	if (!reset)
		begin
			data_out=0;
		end
	else
		if(enable)
			begin
				data_out=data_in;
			end	
		

/*	 
latch ( .enable(),
				  .data_in(),
				  .reset(),
				  .data_out()
				 );	 
*/
		

endmodule
