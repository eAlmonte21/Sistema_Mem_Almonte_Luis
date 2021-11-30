/*
* Description
*	MUX 2 to 1.
* Author:
*	Ing. Luis Eduardo Almonte De Luna
* Date:
*	28/11/2021
*/
module MUX
#(
	parameter DATA_WIDTH = 32
	
 )
	
(
	 input  [DATA_WIDTH-1:0] 	  x, y,
    input  								sel,
    output [DATA_WIDTH-1:0] Data_out
	 
);
	  
	 assign Data_out = sel ? x:y;
	 
endmodule
