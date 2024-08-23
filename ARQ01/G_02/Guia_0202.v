/* 
Guia_0202.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0202.vvp Guia_0202.v
vvp Guia_0202.vvp
*/ 

module Guia_0202; 

// define data 
real		a = 0.37500; // decimal
real		b = 0.12500;
integer		b_int = 2;
real		c = 0.62500;
integer		c_int = 3;
real		d = 0.03125;
integer		d_int = 5;
real		e = 0.75000;
integer		e_int = 6;
integer		y = 7  ;    // counter 
reg [7:0]	x = 0  ;   // binary 


// actions 
initial 
begin : main 

$display ( "Guia_0202" ); 

 

/*	a	*/
  $display ( "a = %f", a );

	while ( a > 0 && y >= 0 ) 
	 begin

	   if ( a*2 >= 1 ) 
	    begin 
	      x[y] = 1; 
	      a = a*2.0 - 1.0; 
	    end

	   else
	    begin 
	      x[y] = 0; 
	      a = a*2.0; 
	    end // end if

	   y=y-1;

	end // end while

  $display ( "a = 0.%8b", x );
/*		*/



y = 7;
x = 0;

/*	b	*/
  $display ( "b = %f", (b+b_int) );

	while ( b > 0 && y >= 0 ) 
	 begin

	   if ( b*2 >= 1 ) 
	    begin 
	      x[y] = 1; 
	      b = b*2.0 - 1.0; 
	    end

	   else
	    begin 
	      x[y] = 0; 
	      b = b*2.0; 
	    end // end if

	   y=y-1;

	end // end while

  $display ( "b = %4b.%8b", b_int, x );
/*		*/



y = 7;
x = 0;

/*	c	*/
  $display ( "c = %f", (c+c_int) );

	while ( c > 0 && y >= 0 ) 
	 begin

	   if ( c*2 >= 1 ) 
	    begin 
	      x[y] = 1; 
	      c = c*2.0 - 1.0; 
	    end

	   else
	    begin 
	      x[y] = 0; 
	      c = c*2.0; 
	    end // end if

	   y=y-1;

	end // end while

  $display ( "c = %4b.%8b", c_int, x );
/*		*/



y = 7;
x = 0;

/*	d	*/
  $display ( "d = %f", (d+d_int) );

	while ( d > 0 && y >= 0 ) 
	 begin

	   if ( d*2 >= 1 ) 
	    begin 
	      x[y] = 1; 
	      d = d*2.0 - 1.0; 
	    end

	   else
	    begin 
	      x[y] = 0; 
	      d = d*2.0; 
	    end // end if

	   y=y-1;

	end // end while

  $display ( "d = %4b.%8b", d_int, x );
/*		*/



y = 7;
x = 0;

/*	e	*/
  $display ( "e = %f", (e+e_int) );

	while ( e > 0 && y >= 0 ) 
	 begin

	   if ( e*2 >= 1 ) 
	    begin 
	      x[y] = 1; 
	      e = e*2.0 - 1.0; 
	    end

	   else
	    begin 
	      x[y] = 0; 
	      e = e*2.0; 
	    end // end if

	   y=y-1;

	end // end while

  $display ( "e = %4b.%8b", e_int, x );
/*		*/

end // main 

endmodule // Guia_0202
