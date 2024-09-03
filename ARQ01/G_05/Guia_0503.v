/* 
Guia_0503.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0503.vvp Guia_0503.v
vvp Guia_0503.vvp
*/


// Modulo expressao base
//----------------------------------------
module f_base (output s,
             input a, b);
       assign s = ~(~a | b) ;

endmodule
//----------------------------------------
// Previsão de testes:
//
// | a | b | ~(~a | b) |
// |---|---|-----------|
// | 0 | 0 |         0 |
// | 0 | 1 |         0 |
// | 1 | 0 |         1 |
// | 1 | 1 |         0 |
//
//_______________________________________


// Modulo expressao equivalente
//
// ~(~a | b)
// ~(~(a | a) | b)
//
//----------------------------------------
module f_eq (output s,
             input a, b);

// Dados locais
wire not_a;

// Portas
nor NOT1 	(not_a,     a,     a);
nor NOR_MAIN 	(    s, not_a,     b);

endmodule
//----------------------------------------
// Previsão de testes:
//
// | a | b | ~(~(a | a) | b) |
// |---|---|-----------------|
// | 0 | 0 |               0 |
// | 0 | 1 |               0 |
// | 1 | 0 |               1 |
// | 1 | 1 |               0 |
//
//_______________________________________



// Modulo principal
module Guia_0503; 

// Definir dados
reg a, b;
wire w1, w2;
f_base f_1 (w1, a, b);
f_eq   f_2 (w2, a, b);

 initial
  begin
   a = 1'b0;
   b = 1'b0;
  end


// Main 
initial 
begin : main 

$display ( "Guia_0503" );

/*	Mostrar valores e os atualizar quando mudarem		*/
$display ( "| a | b || ~(~a | b) || ~(~(a | a) | b) ||" );
$display ( "|---|---||-----------||-----------------||" );
$monitor ( "| %b | %b ||         %b ||               %b ||",
               a, b, w1, w2 );
/*								*/

/*	Atualizar valores (até 3)	*/

#1  b = 1'b1;
#1  b = 1'b0; a = 1'b1;
#1  b = 1'b1;

/*					*/




end // main 

endmodule // Guia_0503
