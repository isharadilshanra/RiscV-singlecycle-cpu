`timescale 1ns / 1ps

module tb_top;

//clock and reset signal declaration
  logic tb_clk, reset;
  logic [31:0] tb_WB_Data;
  logic [6:0] tb_opcode_ins;// output opcoad
  logic [1:0] tb_ALUop_ins; // alu operation selection output
  logic [6:0] tb_Funct7_ins;// fun 7 out
  logic [2:0] tb_Funct3_ins;// fun 3 out
  logic [4:0] tb_Operation_ins;// alu operation out
  
  // output controlr signals
  //logic tb_ALUSrc_in, tb_MemtoReg_in,tb_RegtoMem_in, tb_RegWrite_in, tb_MemRead_in, tb_MemWrite_in, tb_Con_Jalr_in;
  //logic tb_Con_beq_in, tb_Con_bnq_in, tb_Con_bgt_in, tb_Con_blt_in, tb_Con_Jal_in,tb_Branch_in, tb_Mem_in,tb_OpI_in,tb_AUIPC_in,tb_LUI_in;
	 
  
    //clock generation
  always #100 tb_clk = ~tb_clk;
  
  //reset Generation
  initial begin
    tb_clk = 0;
    reset = 1;
    #25 reset =0;
  end
  
  
  riscv riscV(
      .clk(tb_clk),
      .reset(reset),
      .WB_Data(tb_WB_Data),
		.opcode_ins(tb_opcode_ins),// opcoade output
		.ALUop_ins(tb_ALUop_ins),// aluop output
		.Funct7_ins(tb_Funct7_ins),// fun7 output
		.Funct3_ins(tb_Funct3_ins),// fun3 output
		.Operation_ins(tb_Operation_ins)// operation output
		
//		.ALUSrc_in(tb_ALUSrc_in),// control signal output for rtl sim
//		.MemtoReg_in(tb_MemtoReg_in),
//		.RegtoMem_in(tb_RegtoMem_in),
//		.RegWrite_in(tb_RegWrite_in),
//		.MemRead_in(tb_MemRead_in),
//		.MemWrite_in(tb_MemWrite_in),
//		.Con_Jalr_in(tb_Con_Jalr_in),
//		.Con_beq_in(tb_Con_beq_in),
//		.Con_bnq_in(tb_Con_bnq_in),
//		.Con_bgt_in(tb_Con_bgt_in),
//		.Con_blt_in(tb_Con_blt_in),
//		.Con_Jal_in(tb_Con_Jal_in),
//		.Branch_in(tb_Branch_in),
//		.Mem_in(tb_Mem_in),
//		.OpI_in(tb_OpI_in),
//		.AUIPC_in(tb_AUIPC_in),
//		.LUI_in(tb_LUI_in)
		
     );

  initial begin
    #13000;
    $finish;
   end
endmodule
