/* 
Guia_0205.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0205.vvp Guia_0205.v
vvp Guia_0205.vvp
*/ 

module Guia_0205; 

// define data
reg [7:0] a1 = 8'b0010_1110;
reg [7:0] a1s = 8'b001_0111;
reg [7:0] a2 = 8'b0001_0011;
reg [7:0] a2s = 8'b0001_0011;
reg [7:0] a_result;

reg [7:0] b1 = 8'b0100_0101;
reg [7:0] b1s = 8'b0100_0101;
reg [7:0] b2 = 8'b0001_0010;
reg [7:0] b2s = 8'b0000_1001;
reg [7:0] b_result;

reg [7:0] c1 = 8'b0010_1101;
reg [7:0] c2 = 8'b0001_0101;
reg [15:0] c_result;

reg [7:0] d1 = 8'b1011_1010;
reg [7:0] d2 = 8'b0001_1011;
reg [7:0] d_result;

reg [7:0] e1 = 8'b0110_1011;
reg [7:0] e2 = 8'b0000_1101;
reg [7:0] e_result;

// actions 
initial 
begin : main 

$display ( "Guia_0205" ); 


/*	a	*/

a_result = a1+a2; 
$display ( "a = %6b.%2b + %5b.%3b = %5b.%3b", a1s[7:2], a1s[1:0], a2s[7:3], a2s[2:0], a_result[7:3], a_result[2:0] ); 

/*		*/




/*	b	*/

b_result = b1-b2; 
$display ( "b = %5b.%3b - %6b.%2b = %5b.%3b", b1s[7:3], b1s[2:0], b2s[7:2], b2s[1:0], b_result[7:3], b_result[2:0] );


/*		*/




/*	c	*/

c_result = c1*c2; 
$display ( "c = %5b.%3b %5b.%3b = %11b.%5b", c1[7:3], c1[2:0], c2[7:3], c2[2:0], c_result[15:5], c_result[4:0] ); 


/*		*/




/*	d	*/ 

d_result = d1/d2; 
$display ( "d = 10111,01 / 11,011 = %8b/%8b = %8b", d1, d2, d_result ); 

/*		*/




/*	e	*/

e_result = e1%e2; 
$display ( "e = %8b %% %8b = %8b", e1, e2, e_result );

/*		*/

end // main 

endmodule // Guia_0205
