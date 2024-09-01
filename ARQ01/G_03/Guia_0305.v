/* 
Guia_0305.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0305.vvp Guia_0305.v
vvp Guia_0305.vvp
*/ 

module Guia_0305; 

// define data
reg signed [6:0] a1 = 7'b0110101;
reg signed [6:0] a2 = 7'b0001011;
reg signed [6:0] a_result;

reg signed [7:0] b1 = 8'b01011001;
reg signed [7:0] b2 = 8'b00000000;
reg signed [7:0] b_result;

reg signed [8:0] c1 = 9'b000000000;
reg signed [8:0] c2 = 9'h3d;
reg signed [8:0] c_result;

reg signed [8:0] d1 = 9'hc5;
reg signed [8:0] d2 = 9'b001011001;
reg signed [8:0] d_result;

reg signed [8:0] e1 = 9'h7e;
reg signed [8:0] e2 = 9'h2d;
reg signed [8:0] e_result;

// actions 
initial 
begin : main 

$display ( "Guia_0305" );
b2 [6:4] = 3;
b2 [3:1] = 1;

c1 [5:4] = 2;
c1 [3:2] = 1;
c1 [1:0] = 3;



/*	a	*/

a_result = a1 - a2;
$display( "a = %7b - %7b = %1b %6b (2)", a1, a2, a_result[6], a_result[5:0] );

/*		*/




/*	b	*/

b_result = b1 - b2;
$display( "b = %4b.%4b - %o.%o = %1b %3b.%4b (2)", b1[7:4], b1[3:0], b2[7:4], b2[3:1], b_result[7], b_result[6:4], b_result[3:0] );

/*		*/




/*	c	*/

c_result = c1 - c2;
$display( "c = %d%d%d - %h = %1b %8b (2)", c1[5:4], c1[3:2], c1[1:0], c2, c_result[8], c_result[7:0] );

/*		*/




/*	d	*/ 

d_result = d1 - d2;
$display( "d = %h - %9b = %1b %8b (2)", d1, d2, d_result[8], d_result[7:0] );

/*		*/




/*	e	*/

e_result = e1 - e2;
$display( "e = %h - %h = %1b %8b (2)", e1, e2, e_result[8], e_result[7:0] );

/*		*/

end // main 

endmodule // Guia_0305
