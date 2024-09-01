/* 
Guia_0302.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0302.vvp Guia_0302.v
vvp Guia_0302.vvp
*/ 

module Guia_0302; 

// define data
reg [5:0] a = 8'b0000_0000;
reg [5:0] a_result;

reg [7:0] b = 8'hb2;
reg [7:0] b_result;

reg [5:0] c = 8'b0000_0000;
reg [5:0] c_result;

reg [9:0] d = 10'o146;
reg [9:0] d_result;

reg [7:0] e = 8'h6f;
reg [7:0] e_result;

// actions 
initial 
begin : main 

$display ( "Guia_0302" ); 
a [1:0] = 1;
a [3:2] = 2;
a [5:4] = 3;

c [1:0] = 1;
c [3:2] = 3;
c [5:4] = 2;


/*	a	*/

a_result = ~a; 
$display ( "a = %d%d%d (4) -> a = %6b (2) -> C1(a) = %6b (2)", a[5:4], a[3:2], a[1:0], a, a_result);
/*		*/




/*	b	*/

b_result = ~b; 
$display ( "b = %h (16) -> b = %8b (2) -> C1(b) =  %8b (2)", b, b, b_result);


/*		*/




/*	c	*/

c_result = ~c + 1; 
$display ( "c = %d%d%d (4) -> c = %6b (2) -> C1(c) = %6b (2) -> C2(c) = %6b (2)", c[5:4], c[3:2], c[1:0], c, ~c, c_result); 


/*		*/




/*	d	*/ 

d_result = ~d + 1; 
$display ( "d = %o (8) -> d = %8b (2) -> C1(d) = %8b (2) -> C2(d) = %8b (2)", d, d, ~d, d_result);

/*		*/




/*	e	*/

e_result = ~e + 1; 
$display ( "e = %h (16) -> d = %8b (2) -> C1(e) = %8b (2) -> C2(e) = %8b (2)", e, e, ~e, e_result);

/*		*/

end // main 

endmodule // Guia_0302
