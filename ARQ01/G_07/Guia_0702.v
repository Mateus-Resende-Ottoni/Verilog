/* 
Guia_0702.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0702.vvp Guia_0702.v
vvp Guia_0702.vvp
*/



// Modulo
//----------------------------------------
module f02_s (output s,
                   input a, b, select);

// Dados locais
wire not_select, s1, s2;
wire s_or, s_nor;

   not  NOT1  ( not_select,   select);

// Porta 1 (NOR)
   nor  NOR1  (         s1,        a,        b);
   and  AND1  (      s_nor,       s1,        not_select);

// Porta 2 (OR)
   or   OR1   (         s2,        a,        b);
   and  AND2  (       s_or,       s2,        select);

// Resultado
   or   OR2   (          s,    s_nor,     s_or);


endmodule
//----------------------------------------




// Modulo principal
module Guia_0702; 

// Definir dados
reg a, b, chave;
wire ws1;

f02_s    f02 (ws1, a, b, chave);




 initial
  begin
   a     = 1'b0;
   b     = 1'b0;
   chave = 1'b0;
  end


// Main 
initial 
begin : main 

$display ( "Guia_0702" );

/*	Mostrar valores em tabela				*/
$display ( "" );
$display ( "________________________________" );
$display ( "| a | b || chave || resultado ||" );
$display ( "|---|---||-------||-----------||" );
$monitor ( "| %b | %b ||     %b ||         %b ||",
               a,   b,    chave,         ws1);
/*								*/

/*	Atualizar valores		*/

#1;  b = 1'b1;
#1;  b = 1'b0; a = 1'b1;
#1;  b = 1'b1;
#1;

/*					*/

/*	Separação			*/
$display ( "|---|---||-------||-----------||" );
#1;  b = 1'b0; a = 1'b0; chave = 1'b1;
/*					*/

/*	Atualizar valores		*/

#1;  b = 1'b1;
#1;  b = 1'b0; a = 1'b1;
#1;  b = 1'b1;
#1;

/*					*/

end // main 

endmodule // Guia_0702

/*	Previsão de Testes 		*/
/*
________________________________
| a | b || chave || resultado ||
|---|---||-------||-----------||
| 0 | 0 ||     0 ||         1 ||
| 0 | 1 ||     0 ||         0 ||
| 1 | 0 ||     0 ||         0 ||
| 1 | 1 ||     0 ||         0 ||
|---|---||-------||-----------||
| 0 | 0 ||     1 ||         0 ||
| 0 | 1 ||     1 ||         1 ||
| 1 | 0 ||     1 ||         1 ||
| 1 | 1 ||     1 ||         1 ||

*/
/*					*/
