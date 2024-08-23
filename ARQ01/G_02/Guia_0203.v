/* 
Guia_0203.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0203.vvp Guia_0203.v
vvp Guia_0203.vvp
*/ 

module Guia_0203; 

// define data 
reg [7:0]	a = 8'b01111000;	// binary
reg [7:0]	b = 8'b10100100;	// binary
reg [7:0]	c = 8'b10011000;	// binary
reg [7:0]	d = 8'b11101100;	// binary
reg [7:0]	d_int = 8'b00000001; 	// binary
reg [7:0]	e = 8'b10010000;	// binary
reg [7:0]	e_int = 8'b00001101; 	// binary


// actions 
initial 
begin : main 

$display ( "Guia_0203" ); 

 

/*	a	*/

  $display ( "a = 0.%8b", a );

  $display ( "a = 0.%o%o%o%o (4) ", a[7:6], a[5:4], a[3:2], a[1:0] );

/*		*/




/*	b	*/

  $display ( "b = 0.%8b", b );

  $display ( "b = 0.%o%o%o (8) ", b[7:5], b[4:2], b[1:0] );

/*		*/




/*	c	*/

  $display ( "c = 0.%8b", c );

  $display ( "c = 0.%x%x (16)", c[7:4], c[3:0] );

/*		*/




/*	d	*/

  $display ( "d = %8b.%8b", d_int, d );

  $display ( "d = %o.%o%o%o (8) ", d_int[2:0], d[7:5], d[4:2], d[1:0] );

/*		*/




/*	e	*/

  $display ( "e = %8b.%8b", e_int, e );

  $display ( "e = %x.%x%x (16)", e_int[3:0], e[7:4], e[3:0] );

/*		*/

end // main 

endmodule // Guia_0203
