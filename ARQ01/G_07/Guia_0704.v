/* 
Guia_0704.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0704.vvp Guia_0704.v
vvp Guia_0704.vvp
*/



// Modulo
//----------------------------------------
module f04_s (output s,
                   input a, b, chave1, chave2);


   not   NOT1   ( not_chave1,   chave1);
   not   NOT2   ( not_chave2,   chave2);

// Porta 1 e 2 (NOR e OR)
   nor   NOR1   (        s_1,        a,           b);
   and   AND1   (      s_nor,      s_1,  not_chave1); // Seleção com uso da chave
   or    OR1    (        s_2,        a,           b);
   and   AND2   (       s_or,      s_2,      chave1); // Seleção com uso da chave
   or    OR2    (       s_g1,    s_nor,        s_or);

// Porta 3 e 4 (XOR e XNOR)
   xor   XOR1   (        s_3,        a,           b);
   and   AND3   (      s_xor,      s_3,  not_chave1); // Seleção com uso da chave
   xnor  XNOR1  (        s_4,        a,           b);
   and   AND4   (     s_xnor,      s_4,      chave1); // Seleção com uso da chave
   or    OR3    (       s_g2,    s_xor,      s_xnor);

// Resultado
   and   AND6   (       s_xo,     s_g1,  not_chave2);
   and   AND7   (        s_o,     s_g2,      chave2);
   or    OR4    (          s,     s_xo,         s_o);


endmodule
//----------------------------------------




// Modulo principal
module Guia_0704; 

// Definir dados
reg a, b, chave1, chave2;
wire w_lu;

f04_s    f04 (w_lu, a, b, chave1, chave2);




 initial
  begin
   a      = 1'b0;
   b      = 1'b0;
   chave1 = 1'b0;
   chave2 = 1'b0;
  end


// Main 
initial 
begin : main 

$display ( "Guia_0704" );

/*	Mostrar valores em tabela				*/
$display ( "" );
$display ( "____________________________________________" );
$display ( "| a | b || chave 1 | chave 2 || resultado ||" );
$display ( "|---|---||---------|---------||-----------||" );
$monitor ( "| %b | %b ||       %b |       %b ||         %b ||",
               a,   b,     chave1,     chave2,        w_lu );
/*								*/

/*	Atualizar valores		*/

#1;  b = 1'b1;
#1;  b = 1'b0; a = 1'b1;
#1;  b = 1'b1;
#1;

/*					*/

/*	Separação			*/
$display ( "|---|---||---------|---------||-----------||" );
#1;  b = 1'b0; a = 1'b0; chave1 = 1'b1;
/*					*/

/*	Atualizar valores		*/

#1;  b = 1'b1;
#1;  b = 1'b0; a = 1'b1;
#1;  b = 1'b1;
#1;

/*					*/

/*	Separação			*/
$display ( "|---|---||---------|---------||-----------||" );
#1;  b = 1'b0; a = 1'b0; chave1 = 1'b0; chave2 = 1'b1;
/*					*/

/*	Atualizar valores		*/

#1;  b = 1'b1;
#1;  b = 1'b0; a = 1'b1;
#1;  b = 1'b1;
#1;

/*					*/

/*	Separação			*/
$display ( "|---|---||---------|---------||-----------||" );
#1;  b = 1'b0; a = 1'b0; chave1 = 1'b1;
/*					*/

/*	Atualizar valores		*/

#1;  b = 1'b1;
#1;  b = 1'b0; a = 1'b1;
#1;  b = 1'b1;
#1;

/*					*/

end // main 

endmodule // Guia_0704

/*	Previsão de Testes 		*/
/*
____________________________________________
| a | b || chave 1 | chave 2 || resultado ||
|---|---||---------|---------||-----------||
| 0 | 0 ||       0 |       0 ||         1 ||
| 0 | 1 ||       0 |       0 ||         0 ||
| 1 | 0 ||       0 |       0 ||         0 ||
| 1 | 1 ||       0 |       0 ||         0 ||
|---|---||---------|---------||-----------||
| 0 | 0 ||       1 |       0 ||         0 ||
| 0 | 1 ||       1 |       0 ||         1 ||
| 1 | 0 ||       1 |       0 ||         1 ||
| 1 | 1 ||       1 |       0 ||         1 ||
|---|---||---------|---------||-----------||
| 0 | 0 ||       0 |       1 ||         0 ||
| 0 | 1 ||       0 |       1 ||         1 ||
| 1 | 0 ||       0 |       1 ||         1 ||
| 1 | 1 ||       0 |       1 ||         0 ||
|---|---||---------|---------||-----------||
| 0 | 0 ||       1 |       1 ||         1 ||
| 0 | 1 ||       1 |       1 ||         0 ||
| 1 | 0 ||       1 |       1 ||         0 ||
| 1 | 1 ||       1 |       1 ||         1 ||

*/
/*					*/
