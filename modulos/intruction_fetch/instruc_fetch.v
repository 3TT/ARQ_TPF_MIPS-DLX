`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:51:54 03/27/2015 
// Design Name: 
// Module Name:    instruc_fetch 
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

module instruction_fetch(
												input clock,
												input enable,
												input PC_sel,
												input jump_sel,
												input PC_write,
												input [`PC_SIZE:0] branch_address,
												input [`PC_SIZE:0] jump_address,
												//input [9:0]PC_IF_ID,
												output [31:0]instruc,
												output [`PC_SIZE:0]PC_current
												);

wire [`PC_SIZE:0] PC;
wire [`PC_SIZE:0] PC_plus_1;
wire PC_enable;
//wire jump_sel; //Tira un warning de redeclaracion

/*instruc_mem im(
							  .clka(clock),
							  .wea(1'b0),
							  .addra(PC_current),
							  .dina(0),
							  .douta(instruc)
								);*/
								
/*instruc_memory im (
										.clka(clock), // input clka
										.wea(1'b0), // input [3 : 0] wea
										.addra(PC_current), // input [31 : 0] addra
										.dina(0), // input [31 : 0] dina
										.douta(instruc) // output [31 : 0] douta
										);*/

memoria_instruc im (
										.clka(clock), // input clka
										.wea(1'b0), // input [0 : 0] wea
										.addra(PC_current), // input [5 : 0] addra
										.dina(0), // input [31 : 0] dina
										.douta(instruc) // output [31 : 0] douta
										);										

mux_3to1 #(`PC_SIZE+1) mux_PC (
    .in_a(PC_plus_1), 
    .in_b(branch_address), 
    .in_c(jump_address), 
    .sel({PC_sel,jump_sel}), 
    .out(PC)
    );

//wire [9:0]PC_or_jump_address;

 /*mux_2to1 #(10) mux_jump (
														.in_a(PC_plus_1),
														.in_b(instruc[9:0]),
														.sel(jump_sel),
														.out(PC_or_jump_address)
														 );
		
mux_2to1 #(10) mux_branch (
														.in_a(PC_or_jump_address),
														.in_b(branch_address),
														.sel(PC_sel),
														.out(PC)
														 );*/
	 
PC pc_reg(
					.clock(clock),
					.enable(enable),
					.PC_write(PC_write),
					.PC_new(PC),			//direccion que entra al PC, es la que sale del sumador o que viene desde un jump
					.PC_current(PC_current)		//direccion que sale del PC, es la que va la Memoria de Instrucciones.
					 );
					 
adder #(`PC_SIZE+1) add_1(
									.in_a(PC_current),
									.in_b(10'b1),
									.sum(PC_plus_1)
									 );
	 
/*jump_decode jump_decode (
													 .opcode(instruc[31:26]), 
													 .jump_sel(jump_sel)
													 );*/
	 
endmodule
