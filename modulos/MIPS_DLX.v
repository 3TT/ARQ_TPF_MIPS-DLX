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
module MIPS_DLX(input clock,
				//input [9:0] jump_address,	//Agregada porque todavia no esta en uso, de esta forma obligamos al ise a que no los conecte como se le cante.
				//output [9:0] PC_plus_1,		//Agregada porque todavia no esta en uso, de esta forma obligamos al ise a que no los conecte como se le cante.
				input reset,
				output zero
    );


wire [31:0] instruc;
wire [9:0] PC_plus_1;
wire [9:0] jump_address;
wire PC_sel;

instruction_fetch IF_instance(
		.PC_sel(PC_sel),
		.clock(clock),
		.jump_address(jump_address),
		.instruc(instruc),
		.PC_plus_1(PC_plus_1)
    );

wire [31:0] instruc_latch_IF_ID;
wire [9:0] PC_plus_1_latch;


IF_ID IF_ID_latch(.enable(clock),
				 .reset(reset),
				 .instruc_in(instruc),
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


instruction_decode ID_instance(.instruc(instruc_latch_IF_ID),
									.clock(clock),
									//input reg_write, //Esto esta comentado porque el control unit tenemos que decidir si va afuera del modulo intruction decode o va adentro.
									.rw(rw_latch_MEM_WB),
									.current_PC(PC_plus_1_latch),
									.busw(busw),
									.reg_write(WB_control_latch_MEM_WB[1]),
									.EX_control(EX_control),
									.M_control(M_control), //Agregamos un bit de control para los brach, es el bit menos significativo, es BOP (Brach Operation).
									.WB_control(WB_control),
									.bus_a(bus_a),
									.bus_b(bus_b),
									.immed_ext(immed_ext),
									.jump_address(jump_address),
									.branch_sel(PC_sel)
    );

wire [31:0] instruc_latch_ID_EX;
//wire [4:0] rw_latch;
wire [31:0] bus_a_latch, bus_b_latch, immed_ext_latch;
wire [3:0]EX_control_latch;
wire [31:0] busw_latch;
wire [1:0]M_control_latch_ID_EX;
wire [1:0]WB_control_latch_ID_EX; 

ID_EX ID_EX_latch (
    .enable(clock), 
    .reset(reset), 
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
    .enable(clock), 
    .reset(reset), 
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
    .enable(clock), 
    .reset(reset), 
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
	 
endmodule
