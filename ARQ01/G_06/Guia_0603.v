/* 
Guia_0603.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0603.vvp Guia_0603.v
vvp Guia_0603.vvp
*/



// Modulos letra a
//----------------------------------------
module f03_a_base (output s,
                   input a, b, c, d);
       assign s = (~a & ~b & ~c & d) | (~a & ~b & c & ~d) | (~a & b & ~c & d)
		  | (a & ~b & ~c & ~d) | (a & b & ~c & ~d) | (a & b & ~c & d) ;

endmodule
//----------------------------------------
module f03_a (output s,
              input a, b, c, d);
       assign s = (~a & ((~b & c & ~d) | (~c & d))) | ((a & ~c) & (~d | b)) ;

endmodule
//----------------------------------------



// Modulos letra b
//----------------------------------------
module f03_b_base (output s,
                   input a, b, c, d);
       assign s = (~a & ~b & ~c & ~d) | (~a & ~b & ~c & d) | (~a & ~b & c & d)
		  | (~a & b & ~c & d) | (~a & b & c & d) | (a & b & ~c & d)
		  | (a & b & c & d) ;

endmodule
//----------------------------------------
module f03_b (output s,
              input a, b, c, d);
       assign s = (~a & ((~b & ~c) | d)) | (b & d) ;

endmodule
//----------------------------------------



// Modulos letra c
//----------------------------------------
module f03_c_base (output s,
                   input a, b, c, d);
       assign s = (~a & ~b & ~c & ~d) | (~a & ~b & ~c & d) | (~a & ~b & c & ~d)
		  | (~a & b & c & ~d) | (~a & b & c & d) | (a & ~b & c & ~d)
		  | (a & b & c & ~d) | (a & b & c & d) ;

endmodule
//----------------------------------------
module f03_c (output s,
              input a, b, c, d);
       assign s = (~a & ~b & ~c) | (c & (b | ~d)) ;

endmodule
//----------------------------------------



// Modulos letra d
//----------------------------------------
module f03_d_base (output s,
                   input a, b, c, d);
       assign s = (~a & ~b & c & ~d) | (~a & b & ~c & ~d) | (~a & b & c & ~d)
		  | (~a & b & c & d) | (a & ~b & c & ~d) | (a & b & ~c & d)
		  | (a & b & c & ~d) ;

endmodule
//----------------------------------------
module f03_d (output s,
              input a, b, c, d);
       assign s = (a & b & ~c & d) | ((~a & b) & (c | ~d)) | (c & ~d) ;

endmodule
//----------------------------------------



// Modulos letra e
//----------------------------------------
module f03_e_base (output s,
                   input a, b, c, d);
       assign s = (~a & ~b & ~c & ~d) | (~a & ~b & ~c & d) | (~a & ~b & c & d)
		  | (~a & b & c & d) | (a & ~b & ~c & ~d) | (a & ~b & ~c & d)
		  | (a & ~b & c & d) | (a & b & ~c & d) ;

endmodule
//----------------------------------------
module f03_e (output s,
              input a, b, c, d);
       assign s = (~b & (~c | d)) | (d & ((~a & c) | (a & ~c))) ;

endmodule
//----------------------------------------



// Modulo principal
module Guia_0603; 

// Definir dados
reg a1, b1, c1, d1;
wire wa1, wa2;
f03_a_base f03_a1 (wa1, a1, b1, c1, d1);
f03_a      f03_a2 (wa2, a1, b1, c1, d1);

reg a2, b2, c2, d2;
wire wb1, wb2;
f03_b_base f03_b1 (wb1, a2, b2, c2, d2);
f03_b      f03_b2 (wb2, a2, b2, c2, d2);

reg a3, b3, c3, d3;
wire wc1, wc2;
f03_c_base f03_c1 (wc1, a3, b3, c3, d3);
f03_c      f03_c2 (wc2, a3, b3, c3, d3);

reg a4, b4, c4, d4;
wire wd1, wd2;
f03_d_base f03_d1 (wd1, a4, b4, c4, d4);
f03_d      f03_d2 (wd2, a4, b4, c4, d4);

reg a5, b5, c5, d5;
wire we1, we2;
f03_e_base f03_e1 (we1, a5, b5, c5, d5);
f03_e      f03_e2 (we2, a5, b5, c5, d5);


 initial
  begin
   a1 = 1'b0;
   b1 = 1'b0;
   c1 = 1'b0;
   d1 = 1'b0;
   a2 = 1'b0;
   b2 = 1'b0;
   c2 = 1'b0;
   d2 = 1'b0;
   a3 = 1'b0;
   b3 = 1'b0;
   c3 = 1'b0;
   d3 = 1'b0;
   a4 = 1'b0;
   b4 = 1'b0;
   c4 = 1'b0;
   d4 = 1'b0;
   a5 = 1'b0;
   b5 = 1'b0;
   c5 = 1'b0;
   d5 = 1'b0;
  end


// Main 
initial 
begin : main 

$display ( "Guia_0603" );

/*	Mostrar valores em tabela (letra a)			*/
$display ( "Letra a: " );
$display ( "_________________________________________________________________________________" );
$display ( "| a | b | c | d || SoP(1,2,5,8,12,13) || a'*(b'*c*d' + c'*d) + (a*c')*(d' + b) ||" );
$display ( "|---|---|---|---||--------------------||---------------------------------------||" );
$monitor ( "| %b | %b | %b | %b ||                  %b ||                                     %b ||",
              a1,  b1,  c1,  d1,                   wa1,                                      wa2 );
/*								*/

/*	Atualizar valores		*/

#1  d1 = 1'b1;
#1  d1 = 1'b0; c1 = 1'b1;
#1  d1 = 1'b1;
#1  d1 = 1'b0; c1 = 1'b0; b1 = 1'b1;
#1  d1 = 1'b1;
#1  d1 = 1'b0; c1 = 1'b1;
#1  d1 = 1'b1;
#1  d1 = 1'b0; c1 = 1'b0; b1 = 1'b0; a1 = 1'b1;
#1  d1 = 1'b1;
#1  d1 = 1'b0; c1 = 1'b1;
#1  d1 = 1'b1;
#1  d1 = 1'b0; c1 = 1'b0; b1 = 1'b1;
#1  d1 = 1'b1;
#1  d1 = 1'b0; c1 = 1'b1;
#1  d1 = 1'b1;
#1

/*					*/

/*	Separação entre letras		*/
$display ( "" );
$display ( "" );
/*					*/

/*	Mostrar valores em tabela (letra b)			*/
$display ( "Letra b: " );
$display ( "__________________________________________________________________" );
$display ( "| a | b | c | d || SoP(0,1,3,5,7,13,15) || a'*(b'*c' + d) + b*d ||" );
$display ( "|---|---|---|---||----------------------||----------------------||" );
$monitor ( "| %b | %b | %b | %b ||                    %b ||                    %b ||",
              a2,  b2,  c2,  d2,                     wb1,                     wb2 );
/*								*/

/*	Atualizar valores		*/

#1  d2 = 1'b1;
#1  d2 = 1'b0; c2 = 1'b1;
#1  d2 = 1'b1;
#1  d2 = 1'b0; c2 = 1'b0; b2 = 1'b1;
#1  d2 = 1'b1;
#1  d2 = 1'b0; c2 = 1'b1;
#1  d2 = 1'b1;
#1  d2 = 1'b0; c2 = 1'b0; b2 = 1'b0; a2 = 1'b1;
#1  d2 = 1'b1;
#1  d2 = 1'b0; c2 = 1'b1;
#1  d2 = 1'b1;
#1  d2 = 1'b0; c2 = 1'b0; b2 = 1'b1;
#1  d2 = 1'b1;
#1  d2 = 1'b0; c2 = 1'b1;
#1  d2 = 1'b1;
#1

/*					*/

/*	Separação entre letras		*/
$display ( "" );
$display ( "" );
/*					*/

/*	Mostrar valores em tabela (letra c)			*/
$display ( "Letra c: " );
$display ( "________________________________________________________________________" );
$display ( "| a | b | c | d || SoP(0,1,2,6,7,10,14,15) || (a'*b'*c') + c*(b + d') ||" );
$display ( "|---|---|---|---||-------------------------||-------------------------||" );
$monitor ( "| %b | %b | %b | %b ||                       %b ||                       %b ||",
              a3,  b3,  c3,  d3,                        wc1,                        wc2 );
/*								*/

/*	Atualizar valores		*/

#1  d3 = 1'b1;
#1  d3 = 1'b0; c3 = 1'b1;
#1  d3 = 1'b1;
#1  d3 = 1'b0; c3 = 1'b0; b3 = 1'b1;
#1  d3 = 1'b1;
#1  d3 = 1'b0; c3 = 1'b1;
#1  d3 = 1'b1;
#1  d3 = 1'b0; c3 = 1'b0; b3 = 1'b0; a3 = 1'b1;
#1  d3 = 1'b1;
#1  d3 = 1'b0; c3 = 1'b1;
#1  d3 = 1'b1;
#1  d3 = 1'b0; c3 = 1'b0; b3 = 1'b1;
#1  d3 = 1'b1;
#1  d3 = 1'b0; c3 = 1'b1;
#1  d3 = 1'b1;
#1

/*					*/

/*	Separação entre letras		*/
$display ( "" );
$display ( "" );
/*					*/

/*	Mostrar valores em tabela (letra d)			*/
$display ( "Letra d: " );
$display ( "__________________________________________________________________________________" );
$display ( "| a | b | c | d || SoP(2,4,6,7,10,13,14) || (a*b*c'*d) + (a'*b)*(c + d') + c*d' ||" );
$display ( "|---|---|---|---||-----------------------||-------------------------------------||" );
$monitor ( "| %b | %b | %b | %b ||                     %b ||                                   %b ||",
              a4,  b4,  c4,  d4,                      wd1,                                    wd2 );
/*								*/

/*	Atualizar valores		*/

#1  d4 = 1'b1;
#1  d4 = 1'b0; c4 = 1'b1;
#1  d4 = 1'b1;
#1  d4 = 1'b0; c4 = 1'b0; b4 = 1'b1;
#1  d4 = 1'b1;
#1  d4 = 1'b0; c4 = 1'b1;
#1  d4 = 1'b1;
#1  d4 = 1'b0; c4 = 1'b0; b4 = 1'b0; a4 = 1'b1;
#1  d4 = 1'b1;
#1  d4 = 1'b0; c4 = 1'b1;
#1  d4 = 1'b1;
#1  d4 = 1'b0; c4 = 1'b0; b4 = 1'b1;
#1  d4 = 1'b1;
#1  d4 = 1'b0; c4 = 1'b1;
#1  d4 = 1'b1;
#1

/*					*/

/*	Separação entre letras		*/
$display ( "" );
$display ( "" );
/*					*/

/*	Mostrar valores em tabela (letra e)			*/
$display ( "Letra e: " );
$display ( "_____________________________________________________________________________" );
$display ( "| a | b | c | d || SoP(0,1,3,7,8,9,11,13) || b'*(c' + d) + d*(a'*c + a*c') ||" );
$display ( "|---|---|---|---||------------------------||-------------------------------||" );
$monitor ( "| %b | %b | %b | %b ||                      %b ||                             %b ||",
              a5,  b5,  c5,  d5,                       we1,                              we2 );
/*								*/

/*	Atualizar valores		*/

#1  d5 = 1'b1;
#1  d5 = 1'b0; c5 = 1'b1;
#1  d5 = 1'b1;
#1  d5 = 1'b0; c5 = 1'b0; b5 = 1'b1;
#1  d5 = 1'b1;
#1  d5 = 1'b0; c5 = 1'b1;
#1  d5 = 1'b1;
#1  d5 = 1'b0; c5 = 1'b0; b5 = 1'b0; a5 = 1'b1;
#1  d5 = 1'b1;
#1  d5 = 1'b0; c5 = 1'b1;
#1  d5 = 1'b1;
#1  d5 = 1'b0; c5 = 1'b0; b5 = 1'b1;
#1  d5 = 1'b1;
#1  d5 = 1'b0; c5 = 1'b1;
#1  d5 = 1'b1;
#1

/*					*/

/*	Separação entre letras		*/
$display ( "" );
$display ( "" );
/*					*/

end // main 

endmodule // Guia_0603
