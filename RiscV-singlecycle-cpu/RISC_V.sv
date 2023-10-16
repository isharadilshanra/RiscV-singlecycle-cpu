`timescale 1ns / 1ps

module riscv #(
    parameter DATA_W = 32)
    (input logic clk, reset, // clock and reset signals
    output logic [31:0] WB_Data,// The ALU_Result
	 output logic [6:0] opcode_ins,// opcode of each instruction
	 output logic [1:0] ALUop_ins, // alu operation selection output
	 output logic [6:0] Funct7_ins,// fun 7 out
	 output logic [2:0] Funct3_ins,// fun 3 out
	 output logic [4:0] Operation_ins// alu operation out
	 
	 //output logic ALUSrc_in, MemtoReg_in,RegtoMem_in, RegWrite_in, MemRead_in, MemWrite_in, Con_Jalr_in,
    //output logic Con_beq_in, Con_bnq_in, Con_bgt_in, Con_blt_in, Con_Jal_in,Branch_in, Mem_in,OpI_in,AUIPC_in,LUI_in
	 
    );

logic [6:0] opcode;
logic ALUSrc, MemtoReg,RegtoMem, RegWrite, MemRead, MemWrite, Con_Jalr;
logic Con_beq, Con_bnq, Con_bgt, Con_blt, Con_Jal,Branch, Mem,OpI,AUIPC,LUI;

logic [1:0] ALUop;
logic [6:0] Funct7;
logic [2:0] Funct3;
logic [4:0] Operation; 
	
    Controller c(opcode, ALUSrc, MemtoReg,RegtoMem, RegWrite, MemRead, MemWrite, Branch, ALUop, Con_Jalr,Con_Jal,Mem, OpI, AUIPC, LUI);
    
    ALUController ac(ALUop, Funct7, Funct3, Branch,Mem,OpI,AUIPC, Operation, Con_beq, Con_bnq, Con_blt, Con_bgt);

    Datapath dp(clk, reset, RegWrite , MemtoReg, RegtoMem, ALUSrc , MemWrite, MemRead, Con_beq, Con_bnq, Con_bgt, Con_blt, Con_Jalr,Con_Jal, AUIPC, LUI,Operation, opcode, Funct7, Funct3, WB_Data,opcode_ins);
    
	 // output control signals
//	 assign ALUSrc_in = ALUSrc;
//	 assign MemtoReg_in = MemtoReg;
//	 assign RegtoMem_in = RegtoMem;
//	 assign RegWrite_in = RegWrite;
//	 assign MemRead_in = MemRead;
//	 assign MemWrite_in = MemWrite;
//	 assign Con_Jalr_in = Con_Jalr;
//	 assign Con_beq_in = Con_beq;
//	 assign Con_bnq_in = Con_bnq;
//	 assign Con_bgt_in = Con_bgt;
//	 assign Con_blt_in = Con_blt;
//	 assign Con_Jal_in = Con_Jal;
//	 assign Branch_in = Branch;
//	 assign Mem_in = Mem;
//	 assign OpI_in = OpI;
//	 assign AUIPC_in = AUIPC;
//	 assign LUI_in = LUI;

	// output fun7 ,fun3 ,operation ,alu ope selection
	
	 assign ALUop_ins = ALUop;
	 assign Funct7_ins = Funct7;
	 assign Funct3_ins = Funct3;
	 assign Operation_ins = Operation;
	 
endmodule
