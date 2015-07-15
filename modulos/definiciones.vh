`define BUS_DAT 32			//ancho del bus de datos 
`define BUS_DAT_MSB `BUS_DAT-1 	//ancho del bus de datos MENOS UNO
`define BUS_OP 4 				//cantidad de bits de operaciones
`define BUS_OP_MSB `BUS_OP-1 	//cantidad MENOS UNO de bits de operaciones

`define ADD  	`BUS_OP'b0010
//`define ADDI 	`BUS_OP'b0010
`define SUB  	`BUS_OP'b0110
`define AND  	`BUS_OP'b0000
//`define ANDI 	`BUS_OP'b0000
`define OR   	`BUS_OP'b0001
//`define ORI 		`BUS_OP'b0001
`define NOR 	`BUS_OP'b0011
`define XOR  	`BUS_OP'b0100
//`define XORI 	`BUS_OP'b0100

`define SLL  	`BUS_OP'b0101
`define SRL  	`BUS_OP'b1010
`define SRA  	`BUS_OP'b1100
`define SLLV 	`BUS_OP'b1001
`define SRLV 	`BUS_OP'b1011
`define SRAV 	`BUS_OP'b1101

`define ADDU 	`BUS_OP'b1110
`define SUBU 	`BUS_OP'b1111

`define SLT  	`BUS_OP'b0111
//`define SLTI 	`BUS_OP'b0111
`define SLTU 	`BUS_OP'b1000

`define J 			`BUS_OP'b100001//VER QUE VALOR VA ACA

/*
`define ADD  `BUS_OP'b100000
`define SUB  `BUS_OP'b100010
`define AND  `BUS_OP'b100100
`define OR   `BUS_OP'b100101
`define NOR  `BUS_OP'b100111
`define XOR  `BUS_OP'b100110

`define SLL  `BUS_OP'b000000
`define SRL  `BUS_OP'b000010
`define SRA  `BUS_OP'b000011
`define SLLV `BUS_OP'b000100
`define SRLV `BUS_OP'b000110
`define SRAV `BUS_OP'b000111

`define ADDU `BUS_OP'b100001
`define SUBU `BUS_OP'b100011

`define SLT `BUS_OP'b101010
`define SLTU `BUS_OP'b101011
*/

//`define JR `BUS_OP'b100001

//`define LB `BUS_OP'b100001
//`define LH `BUS_OP'b100001
//`define LW `BUS_OP'b100001
//`define LWU `BUS_OP'b100001
//`define LBU `BUS_OP'b100001
//`define LHU `BUS_OP'b100001
//`define SB `BUS_OP'b100001
//`define SH `BUS_OP'b100001
//`define SW `BUS_OP'b100001
//`define ADDI `BUS_OP'b100001
//`define ADDIU `BUS_OP'b100001
//`define ANDI `BUS_OP'b100001
//`define ORI `BUS_OP'b100001
//`define XORI `BUS_OP'b100001
//`define LUI `BUS_OP'b100001 // fuera del alu en el 'Sign Extended', en realidad si se hace dentro de la ALU (<<16) y se guarda el resultado en el registro 'rt'
//`define SLTI `BUS_OP'b100001// op equivalente SLT el inmediato es signed
//`define SLTIU `BUS_OP'b100001//op equivalente SLT el inmediato es unsigned

//`define BEQ `BUS_OP'b000100
//`define BNE `BUS_OP'b000101
//`define J `BUS_OP'b100001//no entra en la alu, se ocupa el shifter (>>2) y el adder superior o de salto
//`define JAL `BUS_OP'b100001//
//`define JALR `BUS_OP'b100001//