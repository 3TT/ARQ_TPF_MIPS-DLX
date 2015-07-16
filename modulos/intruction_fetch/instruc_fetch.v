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
module instruction_fetch(
												input PC_sel,
												input jump_sel,
												input clock,
												input PC_write,
												input [9:0] branch_address,
												input [9:0] jump_address,
												//input [9:0]PC_IF_ID,
												output [31:0]instruc,
												output [9:0]PC_current
												);

wire [9:0] PC;
wire [9:0] PC_plus_1;
wire PC_enable;
wire jump_sel;

instruc_mem im(
							  .clka(clock),
							  .wea(1'b0),
							  .addra(PC_current),
							  .dina(0),
							  .douta(instruc)
								);

mux_3to1 #(10) mux_PC (
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
					.PC_write(PC_write),
					.PC_new(PC),			//direccion que entra al PC, es la que sale del sumador o que viene desde un jump
					.clock(clock),
					.PC_current(PC_current)		//direccion que sale del PC, es la que va la Memoria de Instrucciones.
					 );
					 
adder #(10) add_1(
									.in_a(PC_current),
									.in_b(10'b1),
									.sum(PC_plus_1)
									 );
	 
/*jump_decode jump_decode (
													 .opcode(instruc[31:26]), 
													 .jump_sel(jump_sel)
													 );*/
	 
endmodule
