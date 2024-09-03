/* 
Guia_0505.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0505.vvp Guia_0505.v
vvp Guia_0505.vvp
*/


// Modulo expressao base
//----------------------------------------
module f_base (output s,
             input a, b);
       assign s = ~(a ^ b) ;

endmodule
//----------------------------------------
// Previsão de testes:
//
// | a | b | ~(a ^ b) |
// |---|---|----------|
// | 0 | 0 |        1 |
// | 0 | 1 |        0 |
// | 1 | 0 |        0 |
// | 1 | 1 |        1 |
//
//_______________________________________



// Modulo expressao equivalente
//
// ~(a ^ b)
// O resultado que se busca é uma junção
// que dê 1 quando ambos valores forem
// 0 e 1 quando ambos forem 1
// Ou seja, uma junção de nor(a, b)
// e and(a, b)
//
// (~(a | b) | (a & b))
// ~((a | b) & ~(a & b))
// ~(~(~(a | b) | (a & b)))
// ~(~(~(a | b) | (a & b)) | ~(~(a | b) | (a & b)))
// ~(~(~(a | b) | ~(~a | ~b)) | ~(~(a | b) | ~(~a | ~b)))
// ~(~(~(a | b) | ~(~(a | a) | ~(b | b))) | ~(~(a | b) | ~(~(a | a) | ~(b | b))))
//
//----------------------------------------
module f_eq (output s,
             input a, b);

// Dados locais
wire not_a, not_b;
wire nor_not2, nor_a_b;
wire nor_1;

// Portas
nor NOT_1	(    not_a,       a,        a);
nor NOT_2	(    not_b,       b,        b);
nor NOT_BOTH	( nor_not2,   not_a,    not_b);
nor NOR_BOTH    (  nor_a_b,       a,        b);

nor NOR_1	(    nor_1, nor_a_b, nor_not2);

nor NOR_MAIN 	(        s,   nor_1,    nor_1);

endmodule
//----------------------------------------
// Previsão de testes:
//
// | a | b | ~(~(~(a | b) | ~(~(a | a) | ~(b | b))) | ~(~(a | b) | ~(~(a | a) | ~(b | b)))) |
// |---|---|--------------------------------------------------------------------------------|
// | 0 | 0 |                                                                              1 |
// | 0 | 1 |                                                                              0 |
// | 1 | 0 |                                                                              0 |
// | 1 | 1 |                                                                              1 |
//
//_______________________________________




// Modulo principal
module Guia_0505; 

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

$display ( "Guia_0505" );

/*	Mostrar valores e os atualizar quando mudarem		*/
$display ( "| a | b || ~(a ^ b) || ~(~(~(a | b) | ~(~(a | a) | ~(b | b))) | ~(~(a | b) | ~(~(a | a) | ~(b | b)))) ||" );
$display ( "|---|---||----------||--------------------------------------------------------------------------------||" );
$monitor ( "| %b | %b ||        %b ||                                                                              %b ||",
               a, b, w1, w2 );
/*								*/

/*	Atualizar valores (até 3)	*/

#1  b = 1'b1;
#1  b = 1'b0; a = 1'b1;
#1  b = 1'b1;

/*					*/




end // main 

endmodule // Guia_0505
