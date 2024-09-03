/* 
Guia_0506.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0506.vvp Guia_0506.v
vvp Guia_0506.vvp
*/


// Modulo expressao base
//----------------------------------------
module f_base (output s,
             input a, b);
       assign s = (a ^ b) ;

endmodule
//----------------------------------------
// Previsão de testes:
//
// | a | b | (a ^ b) |
// |---|---|----------|
// | 0 | 0 |        0 |
// | 0 | 1 |        1 |
// | 1 | 0 |        1 |
// | 1 | 1 |        0 |
//
//_______________________________________



// Modulo expressao equivalente
//
// (a ^ b)
// O resultado que se busca (0,1,1,0)
// pode ser visto de 2 formas:
// 1 - negação de xnor
// 2 - and de nand(1,1,1,0) e or(0,1,1,1)
// Tomando como referência o 2
//
// (~(a & b) & (a | b))
// ~(~(~(a & b) & (a | b)))
// ~(~(~(a & b) & (a | b)) & ~(~(a & b) & (a | b)))
// ~(~(~(a & b) & ~(~a & ~b)) & ~(~(a & b) & ~(~a & ~b)))
// ~(~(~(a & b) & ~(~(a & a) & ~(b & b))) & ~(~(a & b) & ~(~(a & a) & ~(b & b))))
//
//----------------------------------------
module f_eq (output s,
             input a, b);

// Dados locais
wire not_a, not_b;
wire nand_not2, nand_a_b;
wire nand_1;

// Portas
nand NOT_1	(     not_a,        a,         a);
nand NOT_2	(     not_b,        b,         b);
nand NOT_BOTH	( nand_not2,    not_a,     not_b);
nand NAND_BOTH  (  nand_a_b,        a,         b);

nand NAND_1	(    nand_1, nand_a_b, nand_not2);

nand NAND_MAIN 	(         s,   nand_1,    nand_1);

endmodule
//----------------------------------------
// Previsão de testes:
//
// | a | b | ~(~(~(a & b) & ~(~(a & a) & ~(b & b))) & ~(~(a & b) & ~(~(a & a) & ~(b & b)))) |
// |---|---|--------------------------------------------------------------------------------|
// | 0 | 0 |                                                                              0 |
// | 0 | 1 |                                                                              1 |
// | 1 | 0 |                                                                              1 |
// | 1 | 1 |                                                                              0 |
//
//_______________________________________




// Modulo principal
module Guia_0506; 

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

$display ( "Guia_0506" );

/*	Mostrar valores e os atualizar quando mudarem		*/
$display ( "| a | b || (a ^ b) || ~(~(~(a & b) & ~(~(a & a) & ~(b & b))) & ~(~(a & b) & ~(~(a & a) & ~(b & b)))) ||" );
$display ( "|---|---||---------||--------------------------------------------------------------------------------||" );
$monitor ( "| %b | %b ||       %b ||                                                                              %b ||",
               a, b, w1, w2 );
/*								*/

/*	Atualizar valores (até 3)	*/

#1  b = 1'b1;
#1  b = 1'b0; a = 1'b1;
#1  b = 1'b1;

/*					*/




end // main 

endmodule // Guia_0506
