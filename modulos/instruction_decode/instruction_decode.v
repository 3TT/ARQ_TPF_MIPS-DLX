`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:44:34 03/31/2015 
// Design Name: 
// Module Name:    instruction_decode 
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
module instruction_decode(
									input [31:0] instruc,
									input clock,
									//input reg_write, //Esto esta comentado porque el control unit tenemos que decidir si va afuera del modulo intruction decode o va adentro.
									input [9:0] current_PC,
									input [4:0] rw,
									input reg_write,
									input [31:0] busw,
									input mux_ctrl_signal_sel,
									output [3:0] EX_control,
									output [1:0] M_control,
									output [1:0] WB_control,
									output [31:0] bus_a,
									output [31:0] bus_b,
									output reg [31:0] immed_ext,
									output [9:0] branch_address,
									output [9:0] jump_address,
									output branch_sel,//Esto va a ser PC_sel...
									output jump_sel
									);




	 
/*wire [3:0] EX_control;
wire [3:0] M_control;
wire [1:0] WB_control;*/

always @(instruc) //Este es el de la extension de signo.
begin
	immed_ext = {{16{instruc[15]}},{instruc[15:0]}};
end

wire cmp_out;
wire jump_sel;
wire [1:0] DE_control;

comparer #(32) branch_cmp(
														.a(bus_a),
														.b(bus_b),
														.cmp_out(cmp_out)
														);
								  
branch_logic branch_log(
							.DE_control(DE_control),
							.cmp(cmp_out),
							//.jump_sel(jump_sel),
							.PC_sel(branch_sel)
							);

adder #(10) add(
								.in_a(current_PC),
								.in_b(immed_ext[9:0]),
								.sum(branch_address)
								 );
	
/*jump_decode jump_decode (
													 .opcode(instruc[31:26]), 
													 .jump_sel(jump_sel)
													 );
				
assign jump_address = instruc[9:0];*/		
		
/*mux_2to1 instance_name (
												 .in_a(branch_address), 
												 .in_b(instruc[9:0]), 
												 .sel(sel), 
												 .out(targe_address)
												 );*/

	 
register_bank registers(
							//.reg_write(WB_control[1]),
							.reg_write(reg_write),
							.clock(clock),
							.ra(instruc[25:21]),
							.rb(instruc[20:16]),
							.rw(rw), //Si es cero lee los registros ra y rb, si es distinto de cero guarda en rw el dato de busw
							.busw(busw),
							.bus_a(bus_a),
							.bus_b(bus_b)
    );
	 
wire [3:0] EX_control_out;
wire [1:0] M_control_out;
wire [1:0] WB_control_out;

control_unit ctrl_unit( .opcode(instruc[31:26]),
							.DE_control(DE_control),
							.EX_control(EX_control_out),
							.M_control(M_control_out),
							.WB_control(WB_control_out)
    );

wire [7:0] control;

mux_2to1 #(8) mux_ctrl_signal (
    .in_a(8'b0), 
    .in_b({EX_control_out,M_control_out,WB_control_out}), 
    .sel(mux_ctrl_signal_sel), 
    .out(control)
    );
	 
assign EX_control = control[7:4];
assign M_control = control[3:2];
assign WB_control = control[1:0];

jump_decode jump_decode (
													 .opcode(instruc[31:26]), 
													 .jump_sel(jump_sel)
													 );
													 
assign jump_address = instruc[9:0];


endmodule
