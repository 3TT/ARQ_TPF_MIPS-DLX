`timescale 1ns / 1ps
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
							output reg [2:0] M_control,
							output reg [1:0] WB_control
    );

always@(opcode)
begin
	case (opcode)
	6'b100011: 
		begin
			EX_control = 4'b0100;
			M_control = 3'b100;
			WB_control = 'b10;
		end
	6'b101011: 
		begin
			EX_control = 4'bX100;
			M_control = 3'b010;
			WB_control = 'b0X;
		end
	6'b000100: 
		begin
			EX_control = 4'bX001;
			M_control = 3'b001;
			WB_control = 'b0X;
		end
	6'b000000: 
		begin
			EX_control = 4'b1010;
			M_control = 3'b000;
			WB_control = 'b11;
		end
	endcase
end

endmodule
