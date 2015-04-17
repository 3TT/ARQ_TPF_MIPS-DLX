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
				input PC_sel,
				input [31:0] busw,
				input [4:0] rw,           	//Agregada porque todavia no esta en uso, de esta forma obligamos al ise a que no los conecte como se le cante.
				//input [9:0] jump_address,	//Agregada porque todavia no esta en uso, de esta forma obligamos al ise a que no los conecte como se le cante.
				//output [9:0] PC_plus_1,		//Agregada porque todavia no esta en uso, de esta forma obligamos al ise a que no los conecte como se le cante.
				output [3:0] M_control, //Agregamos un bit de control para los brach, es el bit menos significativo, es BOP (Brach Operation).
				output [1:0] WB_control,
				output zero,
				output [31:0] ALU_out,
				output [31:0] data_write,
				output [4:0] WB_register,
				output branch_sel_test
    );

wire [31:0] instruc_reg;
wire [9:0] PC_plus_1;
wire [9:0] jump_address;
instruction_fetch IF_instance(
		.PC_sel(PC_sel),
		.clock(clock),
		.jump_address(jump_address),
		.instruc_reg(instruc_reg),
		.PC_plus_1(PC_plus_1)
    );
	 
wire [31:0] bus_a, bus_b, immed_ext;
wire [3:0]EX_control;
instruction_decode ID_instance(.instruc(instruc_reg),
									//input reg_write, //Esto esta comentado porque el control unit tenemos que decidir si va afuera del modulo intruction decode o va adentro.
									.rw(rw),
									.current_PC(PC_plus_1),
									.busw(busw),
									.EX_control(EX_control),
									.M_control(M_control), //Agregamos un bit de control para los brach, es el bit menos significativo, es BOP (Brach Operation).
									.WB_control(WB_control),
									.busa(bus_a),
									.busb(bus_b),
									.immed_ext(immed_ext),
									.jump_address(jump_address),
									.branch_sel_test(branch_sel_test)
    );
	 
//wire [3:0]M_control;
//wire [1:0]WB_control;
	 
execution EX_instance(
							.EX_control(EX_control),
							.busa(bus_a),
							.busb(bus_b),
							.immed_ext(immed_ext),
							.instruc(instruc_reg),
							.zero(zero),
							.ALU_out(ALU_out),
							.data_write(data_write),
							.WB_register(WB_register)
							);
endmodule
