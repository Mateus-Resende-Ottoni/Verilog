/* 
Guia_0304.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0304.vvp Guia_0304.v
vvp Guia_0304.vvp
*/ 

module Guia_0304; 

// define data
reg signed [5:0] a1 = 6'b011001;
reg signed [5:0] a2 = 6'b001101;
reg signed [5:0] a_result;

reg signed [6:0] b1 = 7'b1011101;
reg signed [6:0] b2 = 7'b0100100;
reg signed [6:0] b_result;

reg signed [5:0] c1;
reg signed [5:0] c2;
reg signed [5:0] c_result;

reg signed [8:0] d1 = 9'o376;
reg signed [8:0] d2 = 9'o267;
reg signed [8:0] d_result;

reg signed [11:0] e1 = 12'h7d2;
reg signed [11:0] e2 = 12'ha51;
reg signed [11:0] e_result;

// actions 
initial 
begin : main 

$display ( "Guia_0304" );
c1 [5:4] = 3;
c1 [3:2] = 1;
c1 [1:0] = 2;

c2 [5:4] = 2;
c2 [3:2] = 3;
c2 [1:0] = 1;


/*	a	*/

a_result = a1 - a2;
$display("a = %6b - %6b = %6b (2)", a1, a2, a_result);


/*		*/




/*	b	*/

b_result = b1 - b2;
$display("b = %3b.%4b - %3b.%4b = %3b.%4b (2)", b1[6:4], b1[3:0], b2[6:4], b1[3:0], b_result[6:4], b_result [3:0] );


/*		*/




/*	c	*/

c_result = c1 - c2;
$display("c = %d%d%d - %d%d%d = %d%d%d (4)", c1 [5:4], c1 [3:2], c1 [1:0], c2 [5:4], c2 [3:2], c2 [1:0], c_result [5:4], c_result [3:2], c_result [1:0]);

/*		*/




/*	d	*/ 

d_result = d1 - d2;
$display("d = %o - %o = %o (8)", d1, d2, d_result);

/*		*/




/*	e	*/

e_result = e1 - e2;
$display("e = %h - %h = %h (16)", e1, e2, e_result);

/*		*/

end // main 

endmodule // Guia_0304
