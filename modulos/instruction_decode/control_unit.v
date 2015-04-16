`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:54:34 03/31/2015 
// Design Name: 
// Module Name:    control_unit 
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
module control_unit(input [5:0] opcode,
							output reg [3:0] EX_control,
							output reg [3:0] M_control, //Agregamos un bit de control para los brach, es el bit menos significativo, es BOP (Brach Operation).
							output reg [1:0] WB_control
    );

always@(opcode)
begin
	case (opcode)
	6'b100011: //LW
		begin
			EX_control = 4'b0100;
			M_control = 4'b100X;
			WB_control = 2'b10;
		end
	6'b101011:  //SW
		begin
			EX_control = 4'bX100;
			M_control = 4'b010X;
			WB_control = 2'b0X;
		end
	6'b000100: //BEQ 
		begin
			EX_control = 4'bX001;
			M_control = 4'b0011;
			WB_control = 2'b0X;
		end
	6'b000101: //BNE 
		begin
			EX_control = 4'bX001;
			M_control = 4'b0010;
			WB_control = 2'b0X;
		end
	6'b000000: //Tipo R
		begin
			EX_control = 4'b1010;
			M_control = 4'b000X;
			WB_control = 2'b11;
		end
	6'b001000: //ADDI
		begin
			EX_control = 4'b1110;
			M_control = 4'b000X;
			WB_control = 2'b11;
		end	
	6'b001100: //ANDI
		begin
			EX_control = 4'b1110;
			M_control = 4'b000X;
			WB_control = 2'b11;
		end	
	6'b001010: //SLTI
		begin
			EX_control = 4'b1110;
			M_control = 4'b000X;
			WB_control = 2'b11;
		end	
	6'b001101: //ORI
		begin
			EX_control = 4'b1110;
			M_control = 4'b000X;
			WB_control = 2'b11;
		end	
	6'b001110: //XORI
		begin
			EX_control = 4'b1110;
			M_control = 4'b000X;
			WB_control = 2'b11;
		end	
	default: 
		begin
			EX_control = 4'b0000;
			M_control = 4'b0000;
			WB_control = 2'b00;
		end
	endcase
end

endmodule
