`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:05:37 06/30/2015 
// Design Name: 
// Module Name:    forwarding_unit 
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
module forwarding_unit(input [4:0] rt,
							  input [4:0] rs,
							  input [4:0] rw_EX_MEM,
							  input [4:0] rw_MEM_WB,
							  input mem_read_MEM_ctrl,
							  input write_reg_WB_ctrl,
							  output reg [1:0] mux_ALU_a,
							  output reg [1:0] mux_ALU_b);

//initial mux_ALU_a = 2'b00;
//initial mux_ALU_b = 2'b00;

	always @ (*)
	begin
		//mux_ALU_a = mux_ALU_a;
		//mux_ALU_b = mux_ALU_b;
		if((write_reg_WB_ctrl == 1)
		&& (rw_EX_MEM !=0) 
		&& (rw_EX_MEM == rs))
			mux_ALU_a = 2'b10;
		else if((mem_read_MEM_ctrl == 0) //Compara con cero porque con 1 escribe en memoria y con cero lee
				&& (rw_MEM_WB !=0) 
				&& (rw_EX_MEM != rs)//Control para los hazards de memoria cuando el resultado depende de la unidad de ejecución
				&& (rw_MEM_WB == rs))
					mux_ALU_a = 2'b01;
		else 
			mux_ALU_a = 2'b00;
			
		if(write_reg_WB_ctrl 
			&& (rw_EX_MEM !=0) 
			&& (rw_EX_MEM == rt))
			mux_ALU_b = 2'b10;
		else if(mem_read_MEM_ctrl 
			&& (rw_MEM_WB !=0)
			&& (rw_EX_MEM != rt)//Control para los hazards de memoria cuando el resultado depende de la unidad de ejecución
			&& (rw_MEM_WB == rt))
			mux_ALU_b = 2'b01;
		else
			mux_ALU_b = 2'b00;	
			
	end
endmodule
