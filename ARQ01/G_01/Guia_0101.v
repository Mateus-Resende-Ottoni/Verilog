/* 
Guia_0101.v 
855842 - Mateus Resende Ottoni
*/ 

module Guia_0101; 

// define data 
integer   a = 26, b = 53, c = 713, d = 213, e = 365; 
reg [11:0] x =  0;  // binary   (bits - little endian) 

// actions 
initial 
begin : main 
$display ( "Guia_0101" );

	x = a;
	$display ( "a = %d(10) = %10b(2)" , a, x );

	x = b;
	$display ( "b = %d(10) = %10b(2)" , b, x );

	x = c;
	$display ( "c = %d(10) = %10b(2)" , c, x );

	x = d;
	$display ( "d = %d(10) = %10b(2)" , d, x );

	x = e;
	$display ( "e = %d(10) = %10b(2)" , e, x );

end // main 

endmodule // Guia_0101