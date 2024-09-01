/* 
Guia_0301.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0301.vvp Guia_0301.v
vvp Guia_0301.vvp
*/ 

module Guia_0301; 

// define data
reg [5:0] a = 6'b00_1010;
reg [5:0] a_result;

reg [7:0] b = 8'b0000_1101;
reg [7:0] b_result;

reg [5:0] c = 6'b10_1001;
reg [5:0] c_result;

reg [6:0] d = 7'b010_1111;
reg [6:0] d_result;

reg [7:0] e = 8'b0011_0100;
reg [7:0] e_result;

// actions 
initial 
begin : main 

$display ( "Guia_0301" ); 


/*	a	*/

a_result = ~a; 
$display ( "a = %8b -> C1(a) = %8b", a, a_result);
/*		*/




/*	b	*/

b_result = ~b; 
$display ( "b = %8b -> C1(b) =  %8b", b, b_result);


/*		*/




/*	c	*/

c_result = ~c + 1; 
$display ( "c = %8b -> C1(c) = %8b -> C2(c) = %8b", c, ~c, c_result); 


/*		*/




/*	d	*/ 

d_result = ~d + 1; 
$display ( "d = %8b -> C1(d) = %8b -> C2(d) = %8b", d, ~d, d_result);

/*		*/




/*	e	*/

e_result = ~e + 1; 
$display ( "e = %8b -> C1(e) = %8b -> C2(e) = %8b", e, ~e, e_result);

/*		*/

end // main 

endmodule // Guia_0301
