/* 
Guia_0501.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0501.vvp Guia_0501.v
vvp Guia_0501.vvp
*/


// Modulo expressao base
//----------------------------------------
module f01_base (output s,
             input a, b);
       assign s = (~a & b) ;

endmodule
//----------------------------------------
// Previsão de testes:
//
// | a | b | (~a & b) |
// |---|---|----------|
// | 0 | 0 |        0 |
// | 0 | 1 |        1 |
// | 1 | 0 |        0 |
// | 1 | 1 |        0 |
//
//_______________________________________


// Modulo expressao equivalente
//
// (~a & b)
// ~(a | ~b)
// ~(a | ~(b | b))
//
//----------------------------------------
module f01_eq (output s,
             input a, b);

// Dados locais
wire not_b;

// Portas
nor NOT1 	(not_b,     b,     b);
nor NOR_MAIN 	(    s,     a, not_b);

endmodule
//----------------------------------------
// Previsão de testes:
//
// | a | b | ~(a | ~(b | b)) |
// |---|---|-----------------|
// | 0 | 0 |               0 |
// | 0 | 1 |               1 |
// | 1 | 0 |               0 |
// | 1 | 1 |               0 |
//
//_______________________________________



// Modulo principal
module Guia_0501; 

// Definir dados
reg a, b;
wire w1, w2;
f01_base f01_1 (w1, a, b);
f01_eq   f01_2 (w2, a, b);

 initial
  begin
   a = 1'b0;
   b = 1'b0;
  end


// Main 
initial 
begin : main 

$display ( "Guia_0501" );

/*	Mostrar valores e os atualizar quando mudarem		*/
$display ( "| a | b || ~a & b || ~(a | ~(b | b)) ||" );
$display ( "|---|---||--------||-----------------||" );
$monitor ( "| %b | %b ||      %b ||               %b ||",
               a, b, w1, w2 );
/*								*/

/*	Atualizar valores (até 3)	*/

#1  b = 1'b1;
#1  b = 1'b0; a = 1'b1;
#1  b = 1'b1;

/*					*/




end // main 

endmodule // Guia_0501
