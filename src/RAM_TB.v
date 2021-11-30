module RAM_TB;

parameter MEMORY_DEPTH = 32;
parameter DATA_WIDTH = 32;
reg clk_tb = 0;
reg Write_en;
reg [(DATA_WIDTH-1):0] Address_i;
reg [(DATA_WIDTH-1):0] Instruction_o;
wire [(DATA_WIDTH-1):0] Read_Data;
  
RAM_32 #(.MEMORY_DEPTH(MEMORY_DEPTH), .DATA_WIDTH(DATA_WIDTH)) 
UUT(.Write_en(Write_en), .Address_i(Address_i), .Write_Data(Instruction_o), .Read_Data(Read_Data), .clk(clk_tb));

initial
  begin
    forever #2 clk_tb = !clk_tb;
  end

initial begin
	#0 Address_i      =  		1;
	#1 Write_en       = 		1;
	#1 Instruction_o <=  32'hFFFFFFFF;

	#50 Instruction_o <= 32'h00000000;
	#1 Address_i 	   = 32'h10010000;

	#50 Address_i	  = 32'h10010008;
	#1 Instruction_o <= 32'h12345678;

	#50 Address_i	  = 32'h1001000c;
	#1 Instruction_o <= 32'h98761234;
 
	#50 Address_i 	  = 32'h10010010;
	#1 Instruction_o <= 32'hA0A0A0A0;

	#50 Address_i     = 32'h10010014;
	#1 Instruction_o <= 32'hABCDEF12;


end
endmodule