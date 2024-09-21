/* 
Guia_0705.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0705.vvp Guia_0705.v
vvp Guia_0705.vvp
*/



// Modulo
//----------------------------------------
module f05_s (output s,
              input a, b, chave1, chave2, chave3);

// Dados locais
wire s_g1, s_g2, s_g3, s_g4;
wire s_n,  s_a, s_o, s_xo;
wire s_g1_2, s_g3_4;
wire s_q1, s_q2;

wire s_not1, s_not2;
wire s_and, s_nand;
wire s_or, s_nor;
wire s_xor, s_xnor;

wire s_1, s_2, s_3, s_4, s_5, s_6, s_, s_8;

   not   NOT1   ( not_chave1,   chave1);
   not   NOT2   ( not_chave2,   chave2);
   not   NOT3   ( not_chave3,   chave3);

// Porta 1 e 2 (NOT)
   not   NOT4   (        s_1,        a);
   and   AND1   (     s_not1,      s_1,  not_chave1); // Seleção com uso da chave
   not   NOT5   (        s_2,        b);
   and   AND2   (     s_not2,      s_2,      chave1); // Seleção com uso da chave
   or    OR1    (       s_g1,   s_not1,      s_not2);

// Porta 3 e 4 (AND e NAND)
   and   AND3   (        s_3,        a,           b);
   and   AND4   (      s_and,      s_3,  not_chave1); // Seleção com uso da chave
   nand  NAND1  (        s_4,        a,           b);
   and   AND5   (     s_nand,      s_4,      chave1); // Seleção com uso da chave
   or    OR2    (       s_g2,    s_and,      s_nand);

// Porta 5 e 6 (OR e NOR)
   or    NOR1   (        s_5,        a,           b);
   and   AND6   (       s_or,      s_5,  not_chave1); // Seleção com uso da chave
   nor   OR3    (        s_6,        a,           b);
   and   AND7   (      s_nor,      s_6,      chave1); // Seleção com uso da chave
   or    OR4    (       s_g3,    s_nor,        s_or);

// Porta 7 e 8 (XOR e XNOR)
   xor   XOR1   (        s_7,        a,           b);
   and   AND8   (      s_xor,      s_7,  not_chave1); // Seleção com uso da chave
   xnor  XNOR1  (        s_8,        a,           b);
   and   AND9   (     s_xnor,      s_8,      chave1); // Seleção com uso da chave
   or    OR5    (       s_g4,    s_xor,      s_xnor);

// Resultado
   // Quadra 1
   and   AND10  (        s_n,     s_g1,  not_chave2);
   and   AND11  (        s_a,     s_g2,      chave2);
   or    OR6    (     s_g1_2,      s_n,         s_a);
   and   AND12  (       s_q1,   s_g1_2,  not_chave3);
   // Quadra 2
   and   AND13  (        s_o,     s_g3,  not_chave2);
   and   AND14  (       s_xo,     s_g4,      chave2);
   or    OR7    (     s_g3_4,      s_o,        s_xo);
   and   AND15  (       s_q2,   s_g3_4,      chave3);

   or    OR8    (          s,     s_q1,        s_q2);


endmodule
//----------------------------------------




// Modulo principal
module Guia_0705; 

// Definir dados
reg a, b, chave1, chave2, chave3;
wire w_lu;

f05_s    f05 (w_lu, a, b, chave1, chave2, chave3);




 initial
  begin
   a      = 1'b0;
   b      = 1'b0;
   chave1 = 1'b0;
   chave2 = 1'b0;
   chave3 = 1'b0;
  end


// Main 
initial 
begin : main 

$display ( "Guia_0705" );

/*	Mostrar valores em tabela				*/
$display ( "" );
$display ( "______________________________________________________" );
$display ( "| a | b || chave 1 | chave 2 | chave 3 || resultado ||" );
$display ( "|---|---||---------|---------|---------||-----------||" );
$monitor ( "| %b | %b ||       %b |       %b |       %b ||         %b ||",
               a,   b,     chave1,     chave2,   chave3,        w_lu );
/*								*/

/*	Atualizar valores		*/

#1;  b = 1'b1;
#1;  b = 1'b0; a = 1'b1;
#1;  b = 1'b1;
#1;

/*					*/

/*	Separação			*/
$display ( "|---|---||---------|---------|---------||-----------||" );
#1;  b = 1'b0; a = 1'b0; chave1 = 1'b1;
/*					*/

/*	Atualizar valores		*/

#1;  b = 1'b1;
#1;  b = 1'b0; a = 1'b1;
#1;  b = 1'b1;
#1;

/*					*/

/*	Separação			*/
$display ( "|---|---||---------|---------|---------||-----------||" );
#1;  b = 1'b0; a = 1'b0; chave1 = 1'b0; chave2 = 1'b1;
/*					*/

/*	Atualizar valores		*/

#1;  b = 1'b1;
#1;  b = 1'b0; a = 1'b1;
#1;  b = 1'b1;
#1;

/*					*/

/*	Separação			*/
$display ( "|---|---||---------|---------|---------||-----------||" );
#1;  b = 1'b0; a = 1'b0; chave1 = 1'b1;
/*					*/

/*	Atualizar valores		*/

#1;  b = 1'b1;
#1;  b = 1'b0; a = 1'b1;
#1;  b = 1'b1;
#1;

/*					*/

/*	Separação			*/
$display ( "|---|---||---------|---------|---------||-----------||" );
#1;  b = 1'b0; a = 1'b0; chave1 = 1'b0; chave2 = 1'b0; chave3 = 1'b1;
/*					*/

/*	Atualizar valores		*/

#1;  b = 1'b1;
#1;  b = 1'b0; a = 1'b1;
#1;  b = 1'b1;
#1;

/*					*/

/*					*/

/*	Separação			*/
$display ( "|---|---||---------|---------|---------||-----------||" );
#1;  b = 1'b0; a = 1'b0; chave1 = 1'b1;
/*					*/

/*	Atualizar valores		*/

#1;  b = 1'b1;
#1;  b = 1'b0; a = 1'b1;
#1;  b = 1'b1;
#1;

/*					*/

/*	Separação			*/
$display ( "|---|---||---------|---------|---------||-----------||" );
#1;  b = 1'b0; a = 1'b0; chave1 = 1'b0; chave2 = 1'b1;
/*					*/

/*	Atualizar valores		*/

#1;  b = 1'b1;
#1;  b = 1'b0; a = 1'b1;
#1;  b = 1'b1;
#1;

/*					*/

/*	Separação			*/
$display ( "|---|---||---------|---------|---------||-----------||" );
#1;  b = 1'b0; a = 1'b0; chave1 = 1'b1;
/*					*/

/*	Atualizar valores		*/

#1;  b = 1'b1;
#1;  b = 1'b0; a = 1'b1;
#1;  b = 1'b1;
#1;

/*					*/

end // main 

endmodule // Guia_0705

/*	Previsão de Testes 		*/
/*
______________________________________________________
| a | b || chave 1 | chave 2 | chave 3 || resultado ||
|---|---||---------|---------|---------||-----------||
| 0 | 0 ||       0 |       0 |       0 ||         1 ||
| 0 | 1 ||       0 |       0 |       0 ||         1 ||
| 1 | 0 ||       0 |       0 |       0 ||         0 ||
| 1 | 1 ||       0 |       0 |       0 ||         0 ||
|---|---||---------|---------|---------||-----------||
| 0 | 0 ||       1 |       0 |       0 ||         1 ||
| 0 | 1 ||       1 |       0 |       0 ||         0 ||
| 1 | 0 ||       1 |       0 |       0 ||         1 ||
| 1 | 1 ||       1 |       0 |       0 ||         0 ||
|---|---||---------|---------|---------||-----------||
| 0 | 0 ||       0 |       1 |       0 ||         0 ||
| 0 | 1 ||       0 |       1 |       0 ||         0 ||
| 1 | 0 ||       0 |       1 |       0 ||         0 ||
| 1 | 1 ||       0 |       1 |       0 ||         1 ||
|---|---||---------|---------|---------||-----------||
| 0 | 0 ||       1 |       1 |       0 ||         1 ||
| 0 | 1 ||       1 |       1 |       0 ||         1 ||
| 1 | 0 ||       1 |       1 |       0 ||         1 ||
| 1 | 1 ||       1 |       1 |       0 ||         0 ||
|---|---||---------|---------|---------||-----------||
| 0 | 0 ||       0 |       0 |       1 ||         0 ||
| 0 | 1 ||       0 |       0 |       1 ||         1 ||
| 1 | 0 ||       0 |       0 |       1 ||         1 ||
| 1 | 1 ||       0 |       0 |       1 ||         1 ||
|---|---||---------|---------|---------||-----------||
| 0 | 0 ||       1 |       0 |       1 ||         1 ||
| 0 | 1 ||       1 |       0 |       1 ||         0 ||
| 1 | 0 ||       1 |       0 |       1 ||         0 ||
| 1 | 1 ||       1 |       0 |       1 ||         0 ||
|---|---||---------|---------|---------||-----------||
| 0 | 0 ||       0 |       1 |       1 ||         0 ||
| 0 | 1 ||       0 |       1 |       1 ||         1 ||
| 1 | 0 ||       0 |       1 |       1 ||         1 ||
| 1 | 1 ||       0 |       1 |       1 ||         0 ||
|---|---||---------|---------|---------||-----------||
| 0 | 0 ||       1 |       1 |       1 ||         1 ||
| 0 | 1 ||       1 |       1 |       1 ||         0 ||
| 1 | 0 ||       1 |       1 |       1 ||         0 ||
| 1 | 1 ||       1 |       1 |       1 ||         1 ||

*/
/*					*/
