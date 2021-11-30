module Memory_System_TB;

parameter MEMORY_DEPTH = 32;
parameter DATA_WIDTH = 32;
reg clk_tb = 0;
reg Write_en;
reg [(DATA_WIDTH-1):0] Address_i;
reg [(DATA_WIDTH-1):0] Write_Data;
wire [(DATA_WIDTH-1):0] Instruction_o;

Memory_System_Wrapper #(.MEMORY_DEPTH(MEMORY_DEPTH),.DATA_WIDTH(DATA_WIDTH))
UUT
(.Address_i(Address_i),.Instruction_o(Instruction_o), .Write_Data(Write_Data), .Write_Enable_i(Write_en), .clk(clk_tb));

/*********************************************************/
initial // Clock generator
  begin
    forever #2 clk_tb = !clk_tb;
  end

initial begin
	////RAM
	#0 Address_i      =  		1;
	#1 Write_en       = 		1;
	#1 Write_Data <=  32'hFFFFFFFF;

	#50 Write_Data <= 32'h00000000;
	#1 Address_i 	   = 32'h10010000;

	#50 Address_i	  = 32'h10010008;
	#1 Write_Data <= 32'h12345678;

	#50 Address_i	  = 32'h1001000c;
	#1 Write_Data <= 32'h98761234;
 
	#50 Address_i 	  = 32'h10010010;
	#1 Write_Data <= 32'hA0A0A0A0;

	#50 Address_i     = 32'h10010014;
	#1 Write_Data <= 32'hABCDEF12;

	#50 Write_en = 0; //CLEAR RAM

	
	////ROM	
        #0Address_i <= 32'h400000;
        #5Address_i <= 32'h400004; 
        #5Address_i <= 32'h400008;
        #5Address_i <= 32'h40000c;
        #5Address_i <= 32'h400010;
        #5Address_i <= 32'h400014;
        #5Address_i <= 32'h400018;
        #5Address_i <= 32'h40001c;
     end  
endmodule
