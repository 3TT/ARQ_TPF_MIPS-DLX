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
	 
//initial rb = 0;

assign data_from_ALU=ALU_out; //ESTO PODRIA PASAR DE LATCH A LATCH

memory_data dm_reg (
    .clock(clock), 
    .address(ALU_out[9:0]), 
    .data_write(data_write), 
    .mem_write(M_control[0]), 
    .data_read(data_from_mem)
    );

/*data_mem dm(
  .clka(clock),
  .wea(M_control[0]),//La memoria lee con esta senial en 0 y escribe con la senial en 1
  .addra(ALU_out[9:0]),
  .dina(data_write),
  .douta(data_from_mem)
);*/

/*register_bank instance_name (
    .reg_write(M_control[0]), 
    .clock(clock), 
    .ra(ALU_out[5:0]), //Direccion de lectura
    .rb(rb), //NO se usa
    .rw(ALU_out[5:0]), //Direccion de escritura
    .busw(data_write), //Dato escrito
    .bus_a(data_from_mem), //Dato leido
    .bus_b(bus_b) //No se usa
    );*/

endmodule
