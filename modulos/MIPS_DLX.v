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

wire [4:0] rw;
wire [31:0] bus_a, bus_b, immed_ext;
wire [3:0]EX_control;
wire [1:0]M_control;
wire [1:0]WB_control;
wire [31:0] busw;

instruction_decode ID_instance(.instruc(instruc),
									//input reg_write, //Esto esta comentado porque el control unit tenemos que decidir si va afuera del modulo intruction decode o va adentro.
									.rw(rw),
									.current_PC(PC_plus_1),
									.busw(busw),
									.EX_control(EX_control),
									.M_control(M_control), //Agregamos un bit de control para los brach, es el bit menos significativo, es BOP (Brach Operation).
									.WB_control(WB_control),
									.bus_a(bus_a),
									.bus_b(bus_b),
									.immed_ext(immed_ext),
									.jump_address(jump_address),
									.branch_sel(PC_sel)
    );
	 
//wire [3:0]M_control;
//wire [1:0]WB_control;
wire [31:0] data_write;
wire [31:0]ALU_out;		

execution EX_instance(
							.EX_control(EX_control),
							.bus_a(bus_a),
							.bus_b(bus_b),
							.immed_ext(immed_ext),
							.instruc(instruc),
							.zero(zero),
							.ALU_out(ALU_out),
							.data_write(data_write),
							.WB_register(rw)
							);
							
//wire [31:0] data_write; 
wire[31:0]data_from_mem;
wire[31:0]data_from_ALU;
					
data_memory DM_instance(
						.clock(clock),
						.M_control(M_control),
						.data_write(data_write),
						.ALU_out(ALU_out),	//salida puenteada de la etapa anterior(igual a address)
						.data_from_mem(data_from_mem),
						.data_from_ALU(data_from_ALU)

    );							
							

							
write_back WB_instance(
						.WB_control(WB_control),
						.data_from_mem(data_from_mem),
						.data_from_ALU(data_from_ALU),
						.bus_w(busw)
    );							
endmodule
