//TB ROM
module ROM_TB;
    parameter DATA_WIDTH=32; 
    parameter MEMORY_DEPTH=64;

    reg clk;
    reg [(DATA_WIDTH-1):0] Address_i;
    wire [(DATA_WIDTH-1):0] Instruction_o;
   
ROM_32 #(.DATA_WIDTH(DATA_WIDTH), .MEMORY_DEPTH(MEMORY_DEPTH)) UUT(.Address_i(Address_i), .Instruction_o(Instruction_o));

    initial begin
    forever #1 clk = ~clk;
    end
    initial begin
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