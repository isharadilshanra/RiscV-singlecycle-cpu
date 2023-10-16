`timescale 1ns / 1ps



module alu#(
        parameter DATA_WIDTH = 32,
        parameter OPCODE_LENGTH = 5
        )(
        input logic [DATA_WIDTH-1:0]    SrcA,
        input logic [DATA_WIDTH-1:0]    SrcB,

        input logic [OPCODE_LENGTH-1:0]    Operation,
        output logic[DATA_WIDTH-1:0] ALUResult,
        output logic Con_BLT, 
        output logic Con_BGT,
        output logic zero
        );

        integer      i;
        always_comb
        begin
            ALUResult = 'd0;
            Con_BLT = 'b0;
            Con_BGT = 'b0;
            zero = 'b0;
            case(Operation)
            4'b00000:        // AND
                    ALUResult = SrcA & SrcB;
            4'b00001:        //OR
                    ALUResult = SrcA | SrcB;
            4'b00011:        //XOR
                    ALUResult = SrcA ^ SrcB;
            4'b00010:        //ADD
                    ALUResult = SrcA + SrcB;
            4'b00110: begin       //Subtract
                    ALUResult = $signed(SrcA) - $signed(SrcB);
                    Con_BLT = ($signed(ALUResult) < $signed(1'd0));
                    Con_BGT = ($signed(ALUResult) > $signed(1'd0));
                    zero = ($signed(ALUResult) == $signed(1'd0));
                    end
            4'b00100:        //SLL
                    ALUResult = SrcA << SrcB;
            4'b00101:
                    ALUResult = SrcA < SrcB;
            4'b01010:
                    ALUResult = ($signed(SrcA)<$signed(SrcB));
            4'b00111:
                    begin       //unsigned branch
                    ALUResult = SrcA - SrcB;
                    Con_BLT = SrcA < SrcB;
                    Con_BGT = SrcA > SrcB;
                    zero = (ALUResult == 1'd0);
                    end
            4'b01000:        //SRL
                    ALUResult = SrcA >> SrcB;
            4'b01100:        //SRA
                    ALUResult = $signed(SrcA) >>> SrcB;
						  
				4'b10010:        // multiplication 16 bit
                    ALUResult = SrcA[15:0] * SrcB[15:0];
						  
            default: 
                    ALUResult = 'b0;
            endcase
        end
endmodule

