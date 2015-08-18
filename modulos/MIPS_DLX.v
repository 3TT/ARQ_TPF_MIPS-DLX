`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:58:17 04/10/2015 
// Design Name: 
// Module Name:    IF-ID 
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
`include "definiciones.vh"

//`define	DEBUG 321 //+1

module MIPS_DLX(
									input clock,
									input enable,
									//input [9:0] jump_address,	//Agregada porque todavia no esta en uso, de esta forma obligamos al ise a que no los conecte como se le cante.
									//output [9:0] PC_plus_1,		//Agregada porque todavia no esta en uso, de esta forma obligamos al ise a que no los conecte como se le cante.
									output zero,
									output  [`DEBUG:0] debug_signal
									//output [9:0] PC_plus_1
									);


wire [31:0] instruc;
wire [`PC_SIZE:0] PC_plus_1;
wire [`PC_SIZE:0] branch_address;
wire [`PC_SIZE:0] jump_address;
wire PC_sel;
wire jump_sel;
wire PC_write;

//reg [`DEBUG-2:0] valor = 40'h41424344454647484950515253545556575859604142434445464748495051525354555657585960;
//assign debug_signal = {valor,2'b00};
//assign debug_signal = { 0, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2'b00};
/*												2'h41,
												2'h40,
												2'h39,
												2'h38,
												2'h37,
												2'h36,
												2'h35,
												2'h34,
												2'h33,
												2'h32,
												2'h31,
												2'h30,
												2'h29,
												2'h28,
												2'h27,
												2'h26,
												2'h25,
												2'h24,
												2'h23,
												2'h22,
												2'h21,
												2'h20,
												2'h19,
												2'h18,
												2'h17,
												2'h16,
												2'h15,
												2'h14,
												2'h13,
												2'h12,
												2'h11,
												2'h10,
												2'h09,
												2'h08,
												2'h07,
												2'h06,
												2'h05,
												2'h04,
												2'h03,
												2'h02,
												2'h01,
												2'b00	//ESTOS SON DOS BITS, EN LA DEBUG UNIT SE COMPLETA PARA LLEGAR A 41 BYTES
												};*/
												
assign debug_signal = {//SALIDA IF_ID
											PC_plus_1_latch					//10
											};
/*
assign debug_signal = {//SALIDA IF_ID
											PC_plus_1_latch,					//10
											instruc_latch_IF_ID,				//32
											//SALIDA ID_EX
											EX_control_latch, 					//4
											M_control_latch_ID_EX, 		//2
											WB_control_latch_ID_EX, 	//2
											bus_a_latch, 							//32
											bus_b_latch, 							//32
											immed_ext_latch, 					//32
											instruc_latch_ID_EX,				//32
											//SALIDA EX_MEM
											M_control_latch_EX_MEM, 	//2
											WB_control_latch_EX_MEM, //2
											ALU_out_latch, 						//32
											data_write_latch, 					//32
											rw_latch_EX_MEM,					//5
											//SALIDA MEM_WB			
											 WB_control_latch_MEM_WB,// 2
											 data_from_mem_latch, 		//32
											 data_from_ALU_latch, 		//32
											 rw_latch_MEM_WB				//5
											};
	*/										
											

/*instruction_fetch IF_instance(
		.PC_write(PC_write),
		.PC_sel(PC_sel),
		.clock(clock),
		.branch_address(branch_address),
		.instruc(instruc),
		.PC_current(PC_plus_1)
    );*/
	 
instruction_fetch IF_instance (
														.clock(clock),
														.enable(enable),
														.PC_sel(PC_sel), 
														.jump_sel(jump_sel), 
														.PC_write(PC_write), 
														.branch_address(branch_address), 
														.jump_address(jump_address), 
														.instruc(instruc), 
														.PC_current(PC_plus_1)
														);


wire [31:0] instruc_latch_IF_ID;
wire [`PC_SIZE:0] PC_plus_1_latch;

wire IF_ID_write;
//wire IF_ID_clock = clock && IF_ID_write;
IF_ID IF_ID_latch(
								.clock(clock),
								.enable(enable),
								.instruc_in(instruc),
								.IF_ID_write(IF_ID_write),
								.branch_taken(PC_sel),
								.jump_sel(jump_sel),
								.PC_plus_1_in(PC_plus_1),
								.instruc_out(instruc_latch_IF_ID),
								.PC_plus_1_out(PC_plus_1_latch)
								);
	 
//wire [4:0] rw;
wire [31:0] bus_a, bus_b, immed_ext;
wire [3:0]EX_control;
wire [1:0]M_control;
wire [1:0]WB_control;
wire [31:0] busw;
wire [4:0] rw_latch_MEM_WB;
wire [1:0] WB_control_latch_MEM_WB; 
wire mux_ctrl_signal_sel;

instruction_decode ID_instance(
									.instruc(instruc_latch_IF_ID),
									.clock(clock),
									//input reg_write, //Esto esta comentado porque el control unit tenemos que decidir si va afuera del modulo intruction decode o va adentro.
									.rw(rw_latch_MEM_WB),
									.current_PC(PC_plus_1_latch),
									.busw(busw),
									.mux_ctrl_signal_sel(mux_ctrl_signal_sel),
									.reg_write(WB_control_latch_MEM_WB[1]),
									.EX_control(EX_control),
									.M_control(M_control), //Agregamos un bit de control para los brach, es el bit menos significativo, es BOP (Brach Operation).
									.WB_control(WB_control),
									.bus_a(bus_a),
									.bus_b(bus_b),
									.immed_ext(immed_ext),
									.branch_address(branch_address), 
									.jump_address(jump_address),
									.branch_sel(PC_sel),
									.jump_sel(jump_sel)
    );


wire [31:0] instruc_latch_ID_EX;
//wire [4:0] rw_latch;
wire [31:0] bus_a_latch, bus_b_latch, immed_ext_latch;
wire [3:0]EX_control_latch;
wire [31:0] busw_latch;
wire [1:0]M_control_latch_ID_EX;
wire [1:0]WB_control_latch_ID_EX; 

ID_EX ID_EX_latch (
									.clock(clock),
									.enable(enable), 
									.EX_control_in(EX_control), 
									.M_control_in(M_control), 
									.WB_control_in(WB_control), 
									.bus_a_in(bus_a), 
									.bus_b_in(bus_b), 
									.immed_ext_in(immed_ext), 
									.instruc_in(instruc_latch_IF_ID), 
									.EX_control_out(EX_control_latch), 
									.M_control_out(M_control_latch_ID_EX), 
									.WB_control_out(WB_control_latch_ID_EX), 
									.bus_a_out(bus_a_latch), 
									.bus_b_out(bus_b_latch), 
									.immed_ext_out(immed_ext_latch), 
									.instruc_out(instruc_latch_ID_EX)
									);
	 
//wire [3:0]M_control;
//wire [1:0]WB_control;
wire [31:0] data_write;
wire [31:0]ALU_out;
wire [31:0] ALU_out_latch;		
wire [4:0] rw;
wire [1:0] forward_sel_a;
wire [1:0] forward_sel_b;

/*execution EX_instance(
							.EX_control(EX_control_latch),
							.bus_a(bus_a_latch),
							.bus_b(bus_b_latch),
							.immed_ext(immed_ext_latch),
							.instruc(instruc_latch_ID_EX),
							.zero(zero),
							.ALU_out(ALU_out),
							.data_write(data_write),
							.WB_register(rw)
							);*/
							
execution EX_instance (
							 .EX_control(EX_control_latch), 
							 .sel_a_forwarding(forward_sel_a), 
							 .sel_b_forwarding(forward_sel_b), 
							 .bus_a(bus_a_latch), 
							 .bus_b(bus_b_latch), 
							 .alu_out_forwarded(ALU_out_latch), 
							 .bus_w_forwarded(busw), 
							 .immed_ext(immed_ext_latch), 
							 .instruc(instruc_latch_ID_EX), 
							 .zero(zero), 
							 .ALU_out(ALU_out), 
							 .data_write(data_write), 
							 .WB_register(rw)
							 );


//wire [3:0]M_control;
//wire [1:0]WB_control;

wire [31:0] data_write_latch;
wire [1:0] M_control_latch_EX_MEM;
wire [1:0] WB_control_latch_EX_MEM; 
wire [4:0] rw_latch_EX_MEM;

EX_MEM EX_MEM_latch (
												.clock(clock),
												.enable(enable), 
												.M_control_in(M_control_latch_ID_EX), 
												.WB_control_in(WB_control_latch_ID_EX), 
												.ALU_out_in(ALU_out), 
												.data_write_in(data_write), 
												.rw_in(rw), 
												.M_control_out(M_control_latch_EX_MEM), 
												.WB_control_out(WB_control_latch_EX_MEM), 
												.ALU_out_out(ALU_out_latch), 
												.data_write_out(data_write_latch), 
												.rw_out(rw_latch_EX_MEM)
												);

							
//wire [31:0] data_write; 
wire[31:0]data_from_mem;
wire[31:0]data_from_ALU;
		
data_memory DM_instance(
													.clock(clock),
													.M_control(M_control_latch_EX_MEM),
													.data_write(data_write_latch),
													.ALU_out(ALU_out_latch),	//salida puenteada de la etapa anterior(igual a address)
													.data_from_mem(data_from_mem),
													.data_from_ALU(data_from_ALU)
													);							

//wire [31:0] data_write; 
wire[31:0] data_from_mem_latch;
wire[31:0] data_from_ALU_latch;
							
MEM_WB MEM_WB_latch  (
													.clock(clock),
													.enable(enable), 
													.WB_control_in(WB_control_latch_EX_MEM), 
													.data_from_mem_in(data_from_mem), 
													.data_from_ALU_in(data_from_ALU), 
													.rw_in(rw_latch_EX_MEM), 
													.WB_control_out(WB_control_latch_MEM_WB), 
													.data_from_mem_out(data_from_mem_latch), 
													.data_from_ALU_out(data_from_ALU_latch), 
													.rw_out(rw_latch_MEM_WB)
													);
							
write_back WB_instance(
												.WB_control(WB_control_latch_MEM_WB[0]),
												.data_from_mem(data_from_mem_latch),
												.data_from_ALU(data_from_ALU_latch),
												.bus_w(busw)
												);

forwarding_unit forward_unit (
														 .rt(instruc_latch_ID_EX[20:16]), 
														 .rs(instruc_latch_ID_EX[25:21]), 
														 .rw_EX_MEM(rw_latch_EX_MEM), 
														 .rw_MEM_WB(rw_latch_MEM_WB), 
														 .mem_read_MEM_ctrl(M_control_latch_EX_MEM[1]), 
														 .write_reg_WB_ctrl(WB_control_latch_MEM_WB[1]), 
														 .mux_ALU_a(forward_sel_a), 
														 .mux_ALU_b(forward_sel_b)
														 );

hazard_detection_unit hazard_detection_unit (
																					 .mem_read_MEM_ctrl(M_control_latch_ID_EX[1]),
																					 .rs_IF_ID(instruc_latch_IF_ID[25:21]),
																					 .rt_IF_ID(instruc_latch_IF_ID[20:16]),
																					 .rt_ID_EX(instruc_latch_ID_EX[20:16]),
																					 .PC_write(PC_write),
																					 .mux_ctrl_signal_sel(mux_ctrl_signal_sel),
																					 .IF_ID_write(IF_ID_write)
																					 );
																					 
/*UART uart(.clk(clock),
			.rd(read),
			.wr(write),
			.w_data(transmitir),
			.rx(rx),
			.tx(tx),
			.r_data(recibido),
			.rx_empty(empty),
			.tx_full(full)
 );*/																					 

endmodule
