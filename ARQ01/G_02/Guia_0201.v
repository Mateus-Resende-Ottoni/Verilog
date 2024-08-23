/* 
Guia_0201.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0201.vvp Guia_0201.v
vvp Guia_0201.vvp
*/ 

module Guia_0201; 

// define data 
real		decimal =   0 ; // decimal 
real		power2 = 1.0; // power of 2 
integer		y =   7 ; // counter
reg [7:0]	a = 8'b00011000; // binary (only fraction part, Big Endian)
reg [7:0]	b = 8'b01001000;
reg [7:0]	c = 8'b10101000;
reg [7:0]	d = 8'b11101000;
reg [7:0]	e = 8'b11001000;
reg [7:0]	d_int = 8'b00000001;
reg [7:0]	e_int = 8'b00000011;


// actions 
initial 
begin : main 

$display ( "Guia_0201" ); 

 

/*	a	*/
   $display ( "a (2)  = 0.%8b", a );
	while ( y >= 0 ) 
	 begin 
	   power2 = power2 / 2.0; 

	   if ( a[y] == 1 ) 
	    begin 
	      decimal = decimal + power2; 
	    end 

	   y=y-1; 
	 end // end while 
   $display ( "a (10) = %f", decimal ); 
/*		*/



decimal = 0;
y = 7;
power2 = 1.0;

/*	b	*/
   $display ( "b (2)  = 0.%8b", b );
	while ( y >= 0 ) 
	 begin 
	   power2 = power2 / 2.0; 

	   if ( b[y] == 1 ) 
	    begin 
	      decimal = decimal + power2; 
	    end 

	   y=y-1; 
	 end // end while 
   $display ( "b (10) = %f", decimal ); 
/*		*/



decimal = 0;
y = 7;
power2 = 1.0;

/*	c	*/
   $display ( "c (2)  = 0.%8b", c );
	while ( y >= 0 ) 
	 begin 
	   power2 = power2 / 2.0; 

	   if ( c[y] == 1 ) 
	    begin 
	      decimal = decimal + power2; 
	    end 

	   y=y-1; 
	 end // end while 
   $display ( "c (10) = %f", decimal ); 
/*		*/



decimal = 0;
y = 7;
power2 = 1.0;

/*	d	*/
   $display ( "d (2)  = 1.%8b", d );
	while ( y >= 0 ) 
	 begin 
	   power2 = power2 / 2.0; 

	   if ( d[y] == 1 ) 
	    begin 
	      decimal = decimal + power2; 
	    end 

	   y=y-1; 
	 end // end while 
   $display ( "d (10) = %f", (decimal+d_int) ); 
/*		*/



decimal = 0;
y = 7;
power2 = 1.0;

/*	e	*/
   $display ( "e (2)  = 11.%8b", e );
	while ( y >= 0 ) 
	 begin 
	   power2 = power2 / 2.0; 

	   if ( e[y] == 1 ) 
	    begin 
	      decimal = decimal + power2; 
	    end 

	   y=y-1; 
	 end // end while 
   $display ( "e (10) = %f", (decimal+e_int) ); 
/*		*/

end // main 

endmodule // Guia_0201
