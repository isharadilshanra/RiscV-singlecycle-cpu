`timescale 1ns / 1ps

module datamemory#(
    parameter DM_ADDRESS = 9 ,
    parameter DATA_W = 32,
	 parameter copy_w = 7
    )(
    input logic clk,
	input logic MemRead , // comes from control unit
    input logic MemWrite , // Comes from control unit
    input logic [ DM_ADDRESS -1:0] a , // Read / Write address - 9 LSB bits of the ALU output
    input logic [ DATA_W -1:0] wd , // Write Data
	 
	 input logic [ DM_ADDRESS -1:0] copyaddresfrom, // adress to start copy
    input logic [ DM_ADDRESS -1:0] copyaddresto, // adress to copy
	 input logic memcopy, // copy anble
	 input logic [ DM_ADDRESS -1:0] copyoff, // offset to copy
	 
    output logic [ DATA_W -1:0] rd // Read Data
    );
    
    logic [DATA_W-1:0] mem [(2**DM_ADDRESS)-1:0];
	  
    
    always_comb
	 
    begin
	 rd = 32'b0;// defalt rd=0
       if(MemRead)
            rd = mem[a];
	end
    
    always @(posedge clk) begin
       if (MemWrite)
            mem[a] = wd;
	end
	always @(posedge clk) begin
		if (memcopy) // mem copy
			  
		     //mem[(copyaddresto+copyoff):copyaddresto] = mem[(copyaddresfrom+copyoff):copyaddresfrom];
            //for (int i = 0; i < 5; i++) begin
				mem[copyaddresto]=mem[copyaddresfrom];
					
    
  
	 
	 end
    
endmodule

