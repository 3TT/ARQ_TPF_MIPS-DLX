`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:39:59 04/17/2015 
// Design Name: 
// Module Name:    memory_date 
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
module data_memory(
						input clock,
						input [1:0]M_control,
						//inout [1:0]WB_control, //entrada-salida
						//input zero,//no hace falta
						//input [31:0]address,
						input [31:0]data_write,
						input [31:0]ALU_out,	//salida puenteada de la etapa anterior(igual a address)
						//inout [4:0]reg_write,	//quitado porque va entre latches				
						//output [31:0]data_register,
						output [31:0]data_from_mem,
						output [31:0]data_from_ALU

    );

assign data_from_ALU=ALU_out;

data_mem dm(
  .clka(clock),
  .wea(M_control[0]),
  .addra(ALU_out[9:0]),
  .dina(data_write),
  .douta(data_from_mem)
);


endmodule
