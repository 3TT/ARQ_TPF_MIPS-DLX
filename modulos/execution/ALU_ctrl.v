`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:43:19 04/15/2015 
// Design Name: 
// Module Name:    ALU_ctrl 
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

module ALU_ctrl(//input [5:0] op,
					input [5:0] funct,
					input [1:0] ALU_op,
					output reg [3:0] ALU_ctrl
    );

always@(funct, ALU_op)
begin
	casex({funct,ALU_op})
	8'bXXXXXX00: //LOAD & STORE
		begin
			ALU_ctrl = `ADD;
		end
	8'bXXXXXX01: //BRANCHES
		begin
			ALU_ctrl = `SUB;
		end
	8'b10000010: //ADD
		begin
			ALU_ctrl = `ADD;
		end
	8'b10001010: //SUB
		begin
			ALU_ctrl = `SUB;
		end
	8'b10010010: //AND
		begin
			ALU_ctrl = `AND;
		end
	8'b10010110: //OR
		begin
			ALU_ctrl = `OR;
		end
	8'b10101010: //SLT
		begin
			ALU_ctrl = `SLT;
		end
	8'b00010010: //SLLV
		begin
			ALU_ctrl = `SLLV;
		end
	8'b10011110: //NOR
		begin
			ALU_ctrl = `NOR;
		end
	8'b10011010: //XOR
		begin
			ALU_ctrl = `XOR;
		end
	8'b00011010: //SRLV
		begin
			ALU_ctrl = `SRLV;
		end
	8'b00011110: //SRAV
		begin
			ALU_ctrl = `SRAV;
		end
	8'b00000010: //SLL
		begin
			ALU_ctrl = `SLL;
		end
	8'b00001010: //SRL
		begin
			ALU_ctrl = `SRL;
		end
	8'b00001110: //SRA
		begin
			ALU_ctrl = `SRA;
		end
	8'b10000110: //ADDU
		begin
			ALU_ctrl = `ADDU;
		end
	8'b10001110: //SUBU
		begin
			ALU_ctrl = `SUBU;
		end
	8'b10001110: //SLTU
		begin
			ALU_ctrl = `SLTU;
		end
	default: 
		begin
			ALU_ctrl = 4'b0000;//4'bXXXX;
		end
	endcase
end
endmodule
