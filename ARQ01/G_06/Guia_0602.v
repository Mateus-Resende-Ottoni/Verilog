/* 
Guia_0602.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0602.vvp Guia_0602.v
vvp Guia_0602.vvp
*/



// Modulos letra a
//----------------------------------------
module f02_a_base (output s,
                   input a, b, c);
       assign s = (a | b | ~c) & (~a | b | ~c) & (~a | ~b | ~c) ;

endmodule
//----------------------------------------
module f02_a (output s,
              input a, b, c);
       assign s =  (~a & b) | ~c ;

endmodule
//----------------------------------------



// Modulos letra b
//----------------------------------------
module f02_b_base (output s,
                   input a, b, c);
       assign s = (a | b | c) & (~a | b | c) & (~a | ~b | c) ;

endmodule
//----------------------------------------
module f02_b (output s,
              input a, b, c);
       assign s = (~a & b) | c ;

endmodule
//----------------------------------------



// Modulos letra c
//----------------------------------------
module f02_c_base (output s,
                   input a, b, c);
       assign s = (a | b | ~c) & (a | ~b | c) & (a | ~b | ~c) & (~a | b | ~c) ;

endmodule
//----------------------------------------
module f02_c (output s,
              input a, b, c);
       assign s = (a & (b | ~c)) | (~c & (a | ~b)) ;

endmodule
//----------------------------------------



// Modulos letra d
//----------------------------------------
module f02_d_base (output s,
                   input a, b, c);
       assign s = (a | b | c) & (a | ~b | ~c) & (~a | b | c) & (~a | ~b | ~c) ;

endmodule
//----------------------------------------
module f02_d (output s,
              input a, b, c);
       assign s = (b & ~c) | (~b & c) ;

endmodule
//----------------------------------------



// Modulos letra e
//----------------------------------------
module f02_e_base (output s,
                   input a, b, c);
       assign s = (a | ~b | c) & (a | ~b | ~c) & (~a | ~b | c) & (~a | ~b | ~c) ;

endmodule
//----------------------------------------
module f02_e (output s,
              input a, b, c);
       assign s = ~b ;

endmodule
//----------------------------------------



// Modulo principal
module Guia_0602; 

// Definir dados
reg a1, b1, c1;
wire wa1, wa2;
f02_a_base f02_a1 (wa1, a1, b1, c1);
f02_a      f02_a2 (wa2, a1, b1, c1);

reg a2, b2, c2;
wire wb1, wb2;
f02_b_base f02_b1 (wb1, a2, b2, c2);
f02_b      f02_b2 (wb2, a2, b2, c2);

reg a3, b3, c3;
wire wc1, wc2;
f02_c_base f02_c1 (wc1, a3, b3, c3);
f02_c      f02_c2 (wc2, a3, b3, c3);

reg a4, b4, c4;
wire wd1, wd2;
f02_d_base f02_d1 (wd1, a4, b4, c4);
f02_d      f02_d2 (wd2, a4, b4, c4);

reg a5, b5, c5;
wire we1, we2;
f02_e_base f02_e1 (we1, a5, b5, c5);
f02_e      f02_e2 (we2, a5, b5, c5);


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

$display ( "Guia_0602" );

/*	Mostrar valores em tabela (letra a)			*/
$display ( "Letra a: " );
$display ( "___________________________________________" );
$display ( "| a | b | c || PoS(1,5,7) || (A'*B) + C' ||" );
$display ( "|---|---|---||------------||-------------||" );
$monitor ( "| %b | %b | %b ||          %b ||           %b ||",
              a1,  b1,  c1,           wa1,            wa2 );
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
$display ( "| a | b | c || PoS(0,4,6) || (A'*B) + C ||" );
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
$display ( "__________________________________________________________" );
$display ( "| a | b | c || PoS(1,2,3,5) || A*(B + C') + C'*(A + B') ||" );
$display ( "|---|---|---||--------------||--------------------------||" );
$monitor ( "| %b | %b | %b ||            %b ||                        %b ||",
              a3,  b3,  c3,             wc1,                         wc2 );
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
$display ( "_________________________________________________" );
$display ( "| a | b | c || PoS(0,3,4,7) || (B*C') + (B'*C) ||" );
$display ( "|---|---|---||--------------||-----------------||" );
$monitor ( "| %b | %b | %b ||            %b ||               %b ||",
              a4,  b4,  c4,             wd1,                wd2 );
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
$display ( "_____________________________________" );
$display ( "| a | b | c || PoS(2,3,6,7) ||  B' ||" );
$display ( "|---|---|---||--------------||-----||" );
$monitor ( "| %b | %b | %b ||            %b ||   %b ||",
              a5,  b5,  c5,             we1,   we2 );
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

endmodule // Guia_0602
