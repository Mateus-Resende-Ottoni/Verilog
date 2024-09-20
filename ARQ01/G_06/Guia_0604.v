/* 
Guia_0604.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0604.vvp Guia_0604.v
vvp Guia_0604.vvp
*/



// Modulos letra a
//----------------------------------------
module f04_a_base (output s,
                   input a, b, c, d);
       assign s = (a | b | ~c | d) & (a | ~b | ~c | d) & (a | ~b | ~c | ~d)
		  & (~a | ~b | ~c | d);

endmodule
//----------------------------------------
module f04_a (output s,
              input a, b, c, d);
       assign s = ((a & ~b) | ~c | d) & (a | ~b | ~c) ;

endmodule
//----------------------------------------



// Modulos letra b
//----------------------------------------
module f04_b_base (output s,
                   input a, b, c, d);
       assign s = (a | ~b | c | d) & (a | ~b | c | ~d) & (~a | b | c | ~d)
		  & (~a | ~b | c | ~d) & (~a | ~b | ~c | d);

endmodule
//----------------------------------------
module f04_b (output s,
              input a, b, c, d);
       assign s = (~a | ~b | ~c | d) & (a | ~b | c) & (~a | c | ~d) ;

endmodule
//----------------------------------------



// Modulos letra c
//----------------------------------------
module f04_c_base (output s,
                   input a, b, c, d);
       assign s = (a | ~b | c | d) & (a | ~b | ~c | ~d) & (~a | b | c | d)
		  & (~a | ~b | c | ~d) & (~a | ~b | ~c | ~d);

endmodule
//----------------------------------------
module f04_c (output s,
              input a, b, c, d);
       assign s = ((a & b) | (~a & ~b) | c | d) & ((~a & ~c) | ~b | ~d) ;

endmodule
//----------------------------------------



// Modulos letra d
//----------------------------------------
module f04_d_base (output s,
                   input a, b, c, d);
       assign s = (a | b | c | ~d) & (a | ~b | c | ~d) & (~a | b | c | ~d)
		  & (~a | b | ~c | ~d) & (~a | ~b | ~c | d) & (~a | ~b | ~c | ~d);

endmodule
//----------------------------------------
module f04_d (output s,
              input a, b, c, d);
       assign s = (a | c | ~d) & (~a | b | ~d) & (~a | ~b | ~c);

endmodule
//----------------------------------------



// Modulos letra e
//----------------------------------------
module f04_e_base (output s,
                   input a, b, c, d);
       assign s = (a | b | ~c | d) & (a | ~b | c | ~d) & (a | ~b | ~c | d)
		  & (a | ~b | ~c | ~d) & (~a | b | ~c | ~d) & (~a | ~b | c | ~d)
		  & (~a | ~b | ~c | ~d);;

endmodule
//----------------------------------------
module f04_e (output s,
              input a, b, c, d);
       assign s = (~b | ~d) & (~a | ~c | ~d) & (a | ~c | d) ;

endmodule
//----------------------------------------



// Modulo principal
module Guia_0604; 

// Definir dados
reg a1, b1, c1, d1;
wire wa1, wa2;
f04_a_base f04_a1 (wa1, a1, b1, c1, d1);
f04_a      f04_a2 (wa2, a1, b1, c1, d1);

reg a2, b2, c2, d2;
wire wb1, wb2;
f04_b_base f04_b1 (wb1, a2, b2, c2, d2);
f04_b      f04_b2 (wb2, a2, b2, c2, d2);

reg a3, b3, c3, d3;
wire wc1, wc2;
f04_c_base f04_c1 (wc1, a3, b3, c3, d3);
f04_c      f04_c2 (wc2, a3, b3, c3, d3);

reg a4, b4, c4, d4;
wire wd1, wd2;
f04_d_base f04_d1 (wd1, a4, b4, c4, d4);
f04_d      f04_d2 (wd2, a4, b4, c4, d4);

reg a5, b5, c5, d5;
wire we1, we2;
f04_e_base f04_e1 (we1, a5, b5, c5, d5);
f04_e      f04_e2 (we2, a5, b5, c5, d5);


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

$display ( "Guia_0604" );

/*	Mostrar valores em tabela (letra a)			*/
$display ( "Letra a: " );
$display ( "__________________________________________________________________" );
$display ( "| a | b | c | d || PoS(2,6,7,14) || (a*b' + c' + d) * (a+b'+c') ||" );
$display ( "|---|---|---|---||---------------||-----------------------------||" );
$monitor ( "| %b | %b | %b | %b ||             %b ||                           %b ||",
              a1,  b1,  c1,  d1,              wa1,                            wa2 );
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
$display ( "_____________________________________________________________________________" );
$display ( "| a | b | c | d || PoS(4,5,9,13,14) || (a'+b'+c'+d) * (a+b'+c) * (a'+c+d') ||" );
$display ( "|---|---|---|---||------------------||-------------------------------------||" );
$monitor ( "| %b | %b | %b | %b ||                %b ||                                   %b ||",
              a2,  b2,  c2,  d2,                 wb1,                                    wb2 );
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
$display ( "___________________________________________________________________________________" );
$display ( "| a | b | c | d || PoS(4,7,8,13,15) || (a*b + a'*b' + c + d) * (a'*c' + b' + d') ||" );
$display ( "|---|---|---|---||------------------||-------------------------------------------||" );
$monitor ( "| %b | %b | %b | %b ||                %b ||                                         %b ||",
              a3,  b3,  c3,  d3,                        wc1,                                    wc2 );
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
$display ( "______________________________________________________________________________" );
$display ( "| a | b | c | d || PoS(1,5,9,11,14,15) || (a+c+d') * (a'+b+d') * (a'+b'+c') ||" );
$display ( "|---|---|---|---||---------------------||-----------------------------------||" );
$monitor ( "| %b | %b | %b | %b ||                   %b ||                                 %b ||",
              a4,  b4,  c4,  d4,                      wd1,                                wd2 );
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
$display ( "______________________________________________________________________________" );
$display ( "| a | b | c | d || PoS(2,5,6,7,11,13,15) || (b'+d') * (a'+c'+d') * (a+c'+d) ||" );
$display ( "|---|---|---|---||-----------------------||---------------------------------||" );
$monitor ( "| %b | %b | %b | %b ||                     %b ||                               %b ||",
              a5,  b5,  c5,  d5,                       we1,                               we2 );
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

endmodule // Guia_0604
