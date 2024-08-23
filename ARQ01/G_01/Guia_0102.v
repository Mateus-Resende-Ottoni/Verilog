/* 
Guia_0102.v 
855842 - Mateus Resende Ottoni
*/ 

module Guia_0102; 

// define data 
reg [7:0]  a = 5'b10101;
reg [7:0]  b = 5'b11011;
reg [7:0]  c = 5'b10010;
reg [7:0]  d = 6'b101011;
reg [7:0]  e = 6'b110111; 
integer x =  0; 

// actions 
initial 
begin : main 
$display ( "Guia_0102" );

	x = a;
	$display ( "a = %8b(2) = %d(10)" , a, x );

	x = b;
	$display ( "b = %8b(2) = %d(10)" , b, x );

	x = c;
	$display ( "c = %8b(2) = %d(10)" , c, x );

	x = d;
	$display ( "d = %8b(2) = %d(10)" , d, x );

	x = e;
	$display ( "e = %8b(2) = %d(10)" , e, x );

end // main 

endmodule // Guia_0102