/* 
Guia_0204.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0204.vvp Guia_0204.v
vvp Guia_0204.vvp
*/ 

module Guia_0204; 

// define data 
integer		a [3:0];
real		a_r = 0.321;
integer		b [3:0];
real		b_r = 0.3131;
integer		c [3:0];
real		c_r = 0.751;
integer		d [3:0];
integer		d_int = 7;
real		d_r = 7.345;
integer		e [3:0];
integer		e_int = 15;
real		e_r = 15.10514;

reg [7:0] 	x = 8'b1010_0000  ;	// binary
reg [15:0] 	y = 16'b0000_0000_0000_0000  ; 
integer 	q [3:0]; 


// actions 
initial 
begin : main 

$display ( "Guia_0204" ); 
 a[2] = 3;  a[1] = 2;  a[0] = 1;
 b[2] = 3;  b[1] = 13; b[0] = 2;
 c[2] = 7;  c[1] = 5;  c[0] = 1;
 d[2] = 3;  d[1] = 4;  d[0] = 5;
 e[2] = 10; e[1] = 5;  e[0] = 14;

/*	a	*/

  x [7:6] = a[2];
  x [5:4] = a[1];
  x [3:2] = a[0];

  $display ( "a = %f", a_r ); 

  $display ( "a = 0.%2b%2b%2b%2b (2)", x[7:6], x[5:4], x[3:2], x[1:0] ); 

/*		*/




/*	b	*/

  y [15:12] =  b[2];
  y [11:8]  =  b[1];
  y [7:5]   =  b[0];

  $display ( "b = 0.3d2" ); 

  $display ( "b = 0.%d%d%d%d%d%d (4)", y[15:14], y[13:12], y[11:10], y[9:8], y[7:6], y[5:4] ); 

/*		*/




/*	c	*/

  y [8:6] = c[2];
  y [5:3] = c[1];
  y [2:0] = c[0];

  $display ( "c = %f", c_r ); 

  $display ( "c = 0.%3b%3b%3b (2)", y[8:6], y[5:3], y[2:0] ); 


/*		*/




/*	d	*/ 

  x = 0; 
  x [2:0] = d_int;

  y [9:7] = d[2];
  y [6:4] = d[1];
  y [3:1] = d[0];
  y [0] = 0;

  $display ( "d = %f", d_r );

  $display ( "d = %d%d.%d%d%d%d%d (4)", x[3:2], x[1:0], y[9:8], y[7:6], y[5:4], y[3:2], y[1:0] );  

/*		*/




/*	e	*/

  x = 0; 
  x [3:0] = e_int;

  y [15:12] =  e[2];
  y [11:8]  =  e[1];
  y [7:5]   =  e[0];

  $display ( "e = f.a5e" ); 

  $display ( "e = %d%d.%d%d%d%d%d%d (4)", x[3:2], x[1:0], y[15:14], y[13:12], y[11:10], y[9:8], y[7:6], y[5:4] ); 


/*		*/

end // main 

endmodule // Guia_0204
