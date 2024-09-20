/* 
Guia_0601.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0601.vvp Guia_0601.v
vvp Guia_0601.vvp
*/



// Modulos letra a
//----------------------------------------
module f01_a_base (output s,
                   input a, b, c);
       assign s = (~a & ~b & c) | (a & b & ~c) | (a & b & c) ;

endmodule
//----------------------------------------
module f01_a (output s,
              input a, b, c);
       assign s = (~a & ~b & c) | (a & b) ;

endmodule
//----------------------------------------



// Modulos letra b
//----------------------------------------
module f01_b_base (output s,
                   input a, b, c);
       assign s = (~a & b & ~c) | (a & ~b & ~c) | (a & b & ~c) ;

endmodule
//----------------------------------------
module f01_b (output s,
              input a, b, c);
       assign s = (~c) & (b | a) ;

endmodule
//----------------------------------------



// Modulos letra c
//----------------------------------------
module f01_c_base (output s,
                   input a, b, c);
       assign s = (~a & ~b & c) | (~a & b & ~c) | (a & ~b & c) | (a & b & ~c) ;

endmodule
//----------------------------------------
module f01_c (output s,
              input a, b, c);
       assign s = (~b & c) | (b & ~c) ;

endmodule
//----------------------------------------



// Modulos letra d
//----------------------------------------
module f01_d_base (output s,
                   input a, b, c);
       assign s = (~a & ~b & c) | (~a & b & ~c) | (a & ~b & ~c) | (a & ~b & c) ;

endmodule
//----------------------------------------
module f01_d (output s,
              input a, b, c);
       assign s = (~a & b & ~c) | (~b & (c | a)) ;

endmodule
//----------------------------------------



// Modulos letra e
//----------------------------------------
module f01_e_base (output s,
                   input a, b, c);
       assign s = (~a & ~b & ~c) | (~a & b & c) | (a & b & ~c) | (a & b & c) ;

endmodule
//----------------------------------------
module f01_e (output s,
              input a, b, c);
       assign s = (~a & ~b & ~c) | (b & (a | c)) ;

endmodule
//----------------------------------------



// Modulo principal
module Guia_0601; 

// Definir dados
reg a1, b1, c1;
wire wa1, wa2;
f01_a_base f01_a1 (wa1, a1, b1, c1);
f01_a      f01_a2 (wa2, a1, b1, c1);

reg a2, b2, c2;
wire wb1, wb2;
f01_b_base f01_b1 (wb1, a2, b2, c2);
f01_b      f01_b2 (wb2, a2, b2, c2);

reg a3, b3, c3;
wire wc1, wc2;
f01_c_base f01_c1 (wc1, a3, b3, c3);
f01_c      f01_c2 (wc2, a3, b3, c3);

reg a4, b4, c4;
wire wd1, wd2;
f01_d_base f01_d1 (wd1, a4, b4, c4);
f01_d      f01_d2 (wd2, a4, b4, c4);

reg a5, b5, c5;
wire we1, we2;
f01_e_base f01_e1 (we1, a5, b5, c5);
f01_e      f01_e2 (we2, a5, b5, c5);


 initial
  begin
   a1 = 1'b0;
   b1 = 1'b0;
   c1 = 1'b0;
   a2 = 1'b0;
   b2 = 1'b0;
   c2 = 1'b0;
   a3 = 1'b0;
   b3 = 1'b0;
   c3 = 1'b0;
   a4 = 1'b0;
   b4 = 1'b0;
   c4 = 1'b0;
   a5 = 1'b0;
   b5 = 1'b0;
   c5 = 1'b0;
  end


// Main 
initial 
begin : main 

$display ( "Guia_0601" );

/*	Mostrar valores em tabela (letra a)			*/
$display ( "Letra a: " );
$display ( "_________________________________________________" );
$display ( "| a | b | c || SoP(1,6,7) || (a'*b'*c) + (a*b) ||" );
$display ( "|---|---|---||------------||-------------------||" );
$monitor ( "| %b | %b | %b ||          %b ||                 %b ||",
              a1,  b1,  c1,           wa1,                  wa2 );
/*								*/

/*	Atualizar valores		*/

#1  c1 = 1'b1;
#1  c1 = 1'b0; b1 = 1'b1;
#1  c1 = 1'b1;
#1  c1 = 1'b0; b1 = 1'b0; a1 = 1'b1;
#1  c1 = 1'b1;
#1  c1 = 1'b0; b1 = 1'b1;
#1  c1 = 1'b1;
#1

/*					*/

/*	Separação entre letras		*/
$display ( "" );
$display ( "" );
/*					*/

/*	Mostrar valores em tabela (letra b)			*/
$display ( "Letra b: " );
$display ( "__________________________________________" );
$display ( "| a | b | c || SoP(2,4,6) || c'*(b + a) ||" );
$display ( "|---|---|---||------------||------------||" );
$monitor ( "| %b | %b | %b ||          %b ||          %b ||",
              a2,  b2,  c2,           wb1,           wb2 );
/*								*/

/*	Atualizar valores		*/

#1  c2 = 1'b1;
#1  c2 = 1'b0; b2 = 1'b1;
#1  c2 = 1'b1;
#1  c2 = 1'b0; b2 = 1'b0; a2 = 1'b1;
#1  c2 = 1'b1;
#1  c2 = 1'b0; b2 = 1'b1;
#1  c2 = 1'b1;
#1

/*					*/

/*	Separação entre letras		*/
$display ( "" );
$display ( "" );
/*					*/

/*	Mostrar valores em tabela (letra c)			*/
$display ( "Letra c: " );
$display ( "_________________________________________________" );
$display ( "| a | b | c || SoP(1,2,5,6) || (b'*c) + (b*c') ||" );
$display ( "|---|---|---||--------------||-----------------||" );
$monitor ( "| %b | %b | %b ||            %b ||               %b ||",
              a3,  b3,  c3,             wc1,                wc2 );
/*								*/

/*	Atualizar valores		*/

#1  c3 = 1'b1;
#1  c3 = 1'b0; b3 = 1'b1;
#1  c3 = 1'b1;
#1  c3 = 1'b0; b3 = 1'b0; a3 = 1'b1;
#1  c3 = 1'b1;
#1  c3 = 1'b0; b3 = 1'b1;
#1  c3 = 1'b1;
#1

/*					*/

/*	Separação entre letras		*/
$display ( "" );
$display ( "" );
/*					*/

/*	Mostrar valores em tabela (letra d)			*/
$display ( "Letra d: " );
$display ( "________________________________________________________" );
$display ( "| a | b | c || SoP(1,2,4,5) || (a'*b*c') + b'*(c + a) ||" );
$display ( "|---|---|---||--------------||------------------------||" );
$monitor ( "| %b | %b | %b ||            %b ||                      %b ||",
              a4,  b4,  c4,             wd1,                       wd2 );
/*								*/

/*	Atualizar valores		*/

#1  c4 = 1'b1;
#1  c4 = 1'b0; b4 = 1'b1;
#1  c4 = 1'b1;
#1  c4 = 1'b0; b4 = 1'b0; a4 = 1'b1;
#1  c4 = 1'b1;
#1  c4 = 1'b0; b4 = 1'b1;
#1  c4 = 1'b1;
#1

/*					*/

/*	Separação entre letras		*/
$display ( "" );
$display ( "" );
/*					*/

/*	Mostrar valores em tabela (letra e)			*/
$display ( "Letra e: " );
$display ( "________________________________________________________" );
$display ( "| a | b | c || SoP(0,3,6,7) || (a'*b'*c') + b*(a + c) ||" );
$display ( "|---|---|---||--------------||------------------------||" );
$monitor ( "| %b | %b | %b ||            %b ||                      %b ||",
              a5,  b5,  c5,             we1,                       we2 );
/*								*/

/*	Atualizar valores		*/

#1  c5 = 1'b1;
#1  c5 = 1'b0; b5 = 1'b1;
#1  c5 = 1'b1;
#1  c5 = 1'b0; b5 = 1'b0; a5 = 1'b1;
#1  c5 = 1'b1;
#1  c5 = 1'b0; b5 = 1'b1;
#1  c5 = 1'b1;
#1

/*					*/

/*	Separação entre letras		*/
$display ( "" );
$display ( "" );
/*					*/

end // main 

endmodule // Guia_0601
