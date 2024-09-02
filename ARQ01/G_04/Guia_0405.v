/* 
Guia_0405.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0405.vvp Guia_0405.v
vvp Guia_0405.vvp
*/


// Modulos letra a _ SoP(2), PoS(0, 1, 3)
module f05a_SOP (output s, input x, y) ;
       assign s = (x & ~y) ;

endmodule

module f05a_POS (output s, input x, y);
       assign s = (x | y) & (x | ~y) & (~x | ~y) ;

endmodule


// Modulos letra b _ SoP(1, 3), PoS(0, 2)
module f05b_SOP (output s, input x, y) ;
       assign s = (~x & y) | (x & y) ;

endmodule

module f05b_POS (output s, input x, y) ;
       assign s = (x | y) & (~x | y) ;

endmodule


// Modulos letra c _ SoP(0, 3, 4, 5, 7), PoS(1, 2, 6)

module f05c_SOP (output s, input x, y, z);
       assign s = (~x & ~y & ~z) | (~x & y & z) |
              (x & ~y & ~z) | (x & ~y & z) | (x & y & z) ;

endmodule

module f05c_POS (output s, input x, y, z);
       assign s = (x | y | ~z) & (x | ~y | z) &
              (~x | ~y | z) ;

endmodule


// Modulos letra d _ SoP(0, 1, 2, 4, 5, 6), PoS(3, 7)

module f05d_SOP (output s, input x, y, z);
       assign s = (~x & ~y & ~z) | (~x & ~y & z) |
              (~x & y & ~z) | (x & ~y & ~z) | (x & ~y & z) |
              (x & y & ~z);

endmodule

module f05d_POS (output s, input x, y, z);
       assign s = (x | ~y | ~z) & (~x | ~y | ~z) ;

endmodule


// Modulos letra e _ SoP(0, 1, 3, 5, 6, 8, 9, 10, 12, 14, 15), PoS(2, 4, 7, 11, 13)

module f05e_SOP (output s, input x, y, w, z);
       assign s = (~x & ~y & ~w & ~z) | (~x & ~y & ~w & z) |
              (~x & ~y & w & z) | (~x & y & ~w & z) | (~x & y & w & ~z) |
              (x & ~y & ~w & ~z) |(x & ~y & ~w & z) | (x & ~y & w & ~z) |
              (x & y & ~w & ~z) | (x & y & w & ~z) | (x & y & w & z) ;

endmodule

module f05e_POS (output s, input x, y, w, z);
       assign s = (x | y | ~w | z) & (x | ~y | w | z) &
              (x | ~y | ~w | ~z) & (~x | y | ~w | ~z) & (~x | ~y | w | ~z) ;

endmodule


// Modulo principal
module Guia_0405; 

/*	Definir dados		 */

// Letra a
reg x1, y1;		wire wa1, wa2;
f05a_SOP fo5a_s (wa1, x1, y1);
f05a_POS fo5a_p (wa2, x1, y1);

// Letra b
reg x2, y2;		wire wb1, wb2;
f05b_SOP fo5b_s (wb1, x2, y2);
f05b_POS fo5b_p (wb2, x2, y2);

// Letra c
reg x3, y3, z3;		wire wc1, wc2;
f05c_SOP fo5c_s (wc1, x3, y3, z3);
f05c_POS fo5c_p (wc2, x3, y3, z3);

// Letra d
reg x4, y4, z4;		wire wd1, wd2;
f05d_SOP fo5d_s (wd1, x4, y4, z4);
f05d_POS fo5d_p (wd2, x4, y4, z4);

// Letra e
reg x5, y5, w5, z5;	wire we1, we2;
f05e_SOP fo5e_s (we1, x5, y5, w5, z5);
f05e_POS fo5e_p (we2, x5, y5, w5, z5);

// Iniciar valores
 initial
  begin
   x1 = 1'b0; y1 = 1'b0;
   x2 = 1'b0; y2 = 1'b0;
   x3 = 1'b0; y3 = 1'b0; z3= 1'b0;
   x4 = 1'b0; y4 = 1'b0; z4= 1'b0;
   x5 = 1'b0; y5 = 1'b0; w5= 1'b0; z5= 1'b0;
  end
/* */

// Main 
initial 
begin : main 

$display ( "Guia_0405" );
$display ( " " ); $display ( " " );


/* 			Letra a 			*/
$display ( "Letra a" );


$display ( "|| x | y || SoP(2) | PoS(0,1,3) ||" );
$display ( "||---|---||--------|------------||" );
$monitor ( "|| %b | %b ||      %b |         %b  ||",
               x1, y1, wa1, wa2 );


// Atualizar valores (até 3)
#1  y1 = 1'b1;
#1  y1 = 1'b0; x1 = 1'b1;
#1  y1 = 1'b1;
#1
/* 							*/


$display ( " " ); $display ( " " );


/* 			Letra b 			*/
$display ( "Letra b" );


$display ( "|| x | y || SoP(1,3) | PoS(0,2) ||" );
$display ( "||---|---||----------|----------||" );
$monitor ( "|| %b | %b ||        %b |       %b  ||",
               x2, y2, wb1, wb2 );

// Atualizar valores (até 3)
#1  y2 = 1'b1;
#1  y2 = 1'b0; x2 = 1'b1;
#1  y2 = 1'b1;
#1
/* 							*/


$display ( " " ); $display ( " " );


/* 			Letra c 			*/
$display ( "Letra c" );


$display ( "|| x | y | z || SoP(0,3,4,5,7) | PoS(1,2,6) ||" );
$display ( "||---|---|---||----------------|------------||" );
$monitor ( "|| %b | %b | %b ||              %b |         %b  ||",
               x3, y3, z3, wc1, wc2 );


// Atualizar valores (até 7)
#1  z3 = 1'b1;
#1  z3 = 1'b0; y3 = 1'b1;
#1  z3 = 1'b1;
#1  z3 = 1'b0; y3 = 1'b0; x3 = 1'b1;
#1  z3 = 1'b1;
#1  z3 = 1'b0; y3 = 1'b1;
#1  z3 = 1'b1;
#1
/* 							*/


$display ( " " ); $display ( " " );


/* 			Letra d 			*/
$display ( "Letra d" );


$display ( "|| x | y | z || SoP(0,1,2,4,5,6) | PoS(3,7) ||" );
$display ( "||---|---|---||------------------|----------||" );
$monitor ( "|| %b | %b | %b ||                %b |       %b  ||",
               x4, y4, z4, wd1, wd2 );


// Atualizar valores (até 7)
#1  z4 = 1'b1;
#1  z4 = 1'b0; y4 = 1'b1;
#1  z4 = 1'b1;
#1  z4 = 1'b0; y4 = 1'b0; x4 = 1'b1;
#1  z4 = 1'b1;
#1  z4 = 1'b0; y4 = 1'b1;
#1  z4 = 1'b1;
#1
/* 							*/


$display ( " " ); $display ( " " );


/* 			Letra e 			*/
$display ( "Letra e" );


$display ( "|| x | y | w | z || SoP(0,1,3,5,6,8,9,10,12,14,15) | PoS(2,4,7,11,13) ||" );
$display ( "||---|---|---|---||--------------------------------|------------------||" );
$monitor ( "|| %b | %b | %b | %b ||                              %b |               %b  ||",
               x5, y5, w5, z5, we1, we2 );


// Atualizar valores (até 15)
#1  z5 = 1'b1;
#1  z5 = 1'b0; w5 = 1'b1;
#1  z5 = 1'b1;
#1  z5 = 1'b0; w5 = 1'b0; y5 = 1'b1;
#1  z5 = 1'b1;
#1  z5 = 1'b0; w5 = 1'b1;
#1  z5 = 1'b1;
#1  z5 = 1'b0; w5 = 1'b0; y5 = 1'b0; x5 = 1'b1;
#1  z5 = 1'b1;
#1  z5 = 1'b0; w5 = 1'b1;
#1  z5 = 1'b1;
#1  z5 = 1'b0; w5 = 1'b0; y5 = 1'b1;
#1  z5 = 1'b1;
#1  z5 = 1'b0; w5 = 1'b1;
#1  z5 = 1'b1;
/* 							*/


end // main 

endmodule // Guia_0405
