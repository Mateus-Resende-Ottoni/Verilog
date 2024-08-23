/* 
Guia_0103.v 
855842 - Mateus Resende Ottoni
*/ 

module Guia_0103; 

// define data 
integer   a = 61, b = 53, c = 77, d = 153, e = 753; 
reg [7:0] x =  0;
integer   y = 0, n = 0, temp = 1;

// actions 
initial 
begin : main 
$display ( "Guia_0103" );


	x = a; y = a;
	$display ( "a = %d(10) = %d%d%d(4) ", a, x[5:4], x[3:2], x[1:0] ); 

	x = b; y = b;
	$display ( "b = %d(10) = %o(8)", b, y ); 

	x = c; y = c;
	$display ( "c = %d(10) = %x(16)", c, y ); 

	x = d; y = d;
	$display ( "d = %d(10) = %x(16)", d, y ); 

	x = e; y = e;
	$display ( "e = %d(10) = %x(16)", e, y ); 

end // main 

endmodule // Guia_0103