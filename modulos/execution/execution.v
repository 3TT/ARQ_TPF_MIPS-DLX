`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:32:00 04/15/2015 
// Design Name: 
// Module Name:    execution 
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
module execution(//inout  [1:0] WB_control,
						//inout  [3:0] MEM_control,
						input  [3:0] EX_control,
						//input [9:0] current_PC, //el sumador de direccion de salto se pasa a la etapa de decode
						input [31:0] busa,
						input [31:0] busb,
						input [31:0] immed_ext,
						input [31:0] instruc,
						output zero,
						output [31:0] ALU_out,
						output [31:0] data_write, //igual a busB
						output [4:0] WB_register //elige rt o rd como destino del Write Back
						//output WB_control, //añadir cuando exista el lacth
						//output MEM_control, //
    );

wire [3:0] ALU_ctrl;
wire [31:0] ALU_b;
assign data_write=busb;

alu ALU(.a(busa),
			.b(ALU_b),
			.op(ALU_ctrl),
			.rdo(ALU_out),
			.zero(zero)
			);

mux_2to1 #(32) mux_alu_src (
							.in_a(busb),
							.in_b(immed_ext),
							.sel(EX_control[2]),//(ALU_scr)
							.out(ALU_b)
							 );
							 
mux_2to1 #(5) mux_reg_dst (
							.in_a(instruc[20:16]),
							.in_b(instruc[15:11]),
							.sel(EX_control[3]),
							.out(WB_register)
							 );

ALU_ctrl alu_ctrl(.funct(instruc[5:0]),
			.ALU_op(EX_control[1:0]),
			.ALU_ctrl(ALU_ctrl)
    );

endmodule