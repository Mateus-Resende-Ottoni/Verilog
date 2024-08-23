/* 
Guia_0104.v 
855842 - Mateus Resende Ottoni
*/ 

module Guia_0104; 

// define data 
reg [7:0]  a = 6'b010100;
reg [7:0]  b = 6'b011010;
reg [7:0]  c = 6'b100111;
reg [7:0]  d = 6'b100101;
reg [7:0]  e = 6'b101101; 
reg [8:0] x =  0;

// actions 
initial 
begin : main 
$display ( "Guia_0104" );

	x = a;
	$display ( "a = [%2b] [%2b] [%2b] [%2b] = %d %d %d %d", x[7:6], x[5:4], x[3:2], x[1:0], x[7:6], x[5:4], x[3:2], x[1:0]); 

	x = b;
	$display ( "b = [%3b] [%3b] [%3b] = %o %o %o", x[8:6], x[5:3], x[2:0], x[8:6], x[5:3], x[2:0] ); 

	x = c;
	$display ( "c = [%4b] [%4b] = %x %x", x[7:4], x[3:0], x[7:4], x[3:0] ); 

	x = d;
	$display ( "d = [%3b] [%3b] [%3b] = %o %o %o", x[8:6], x[5:3], x[2:0], x[8:6], x[5:3], x[2:0] ); 

	x = e;
	$display ( "e = [%2b] [%2b] [%2b] [%2b] = %d %d %d %d", x[7:6], x[5:4], x[3:2], x[1:0], x[7:6], x[5:4], x[3:2], x[1:0]); 

end // main 

endmodule // Guia_0104