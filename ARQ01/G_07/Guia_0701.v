/* 
Guia_0701.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0701.vvp Guia_0701.v
vvp Guia_0701.vvp
*/



// Modulo
//----------------------------------------
module f01_s (output s1, output s2,
                   input a, b, select);

// Dados locais
wire not_select, s_and, s_nand;

   not  NOT1  ( not_select,  select);

// Saída 1 (NAND)
   nand NAND1 (      snand,       a,            b);
   and  AND_1 (         s1,   snand,   not_select);

// Saída 2 (AND)
   and  AND1  (       sand,       a,            b);
   and  AND_2 (         s2,    sand,       select);

endmodule
//----------------------------------------




// Modulo principal
module Guia_0701; 

// Definir dados
reg a, b, chave;
wire ws1, ws2;

f01_s    f01 (ws1, ws2, a, b, chave);




 initial
  begin
   a     = 1'b0;
   b     = 1'b0;
   chave = 1'b0;
  end


// Main 
initial 
begin : main 

$display ( "Guia_0701" );

/*	Mostrar valores em tabela				*/
$display ( "" );
$display ( "____________________________________________" );
$display ( "| a | b || chave || nand(a,b) || and(a,b) ||" );
$display ( "|---|---||-------||-----------||----------||" );
$monitor ( "| %b | %b ||     %b ||         %b ||        %b ||",
               a,   b,    chave,         ws1,          ws2 );
/*								*/

/*	Atualizar valores		*/

#1;  b = 1'b1;
#1;  b = 1'b0; a = 1'b1;
#1;  b = 1'b1;
#1;

/*					*/

/*	Separação			*/
$display ( "|---|---||-------||-----------||----------||" );
#1;  b = 1'b0; a = 1'b0; chave = 1'b1;
/*					*/

/*	Atualizar valores		*/

#1;  b = 1'b1;
#1;  b = 1'b0; a = 1'b1;
#1;  b = 1'b1;
#1;

/*					*/

end // main 

endmodule // Guia_0701

/*	Previsão de Testes 		*/
/*
____________________________________________
| a | b || chave || nand(a,b) || and(a,b) ||
|---|---||-------||-----------||----------||
| 0 | 0 ||     0 ||         1 ||        0 ||
| 0 | 1 ||     0 ||         1 ||        0 ||
| 1 | 0 ||     0 ||         1 ||        0 ||
| 1 | 1 ||     0 ||         0 ||        0 ||
|---|---||-------||-----------||----------||
| 0 | 0 ||     1 ||         0 ||        0 ||
| 0 | 1 ||     1 ||         0 ||        0 ||
| 1 | 0 ||     1 ||         0 ||        0 ||
| 1 | 1 ||     1 ||         0 ||        1 ||

*/
/*					*/
