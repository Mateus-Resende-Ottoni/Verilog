/* 
Guia_0805.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0805.vvp Guia_0805.v
vvp Guia_0805.vvp
*/

// Meia Soma
//----------------------------------------
module half_adder (output s0, output s1,
                   input a, b);

// Saída 1
   xor XOR (	s0,	a,	b);

// Saída 2
   and AND (	s1,	a,	b);

endmodule
//----------------------------------------

// Soma completa
//----------------------------------------
module full_adder (output s0, output s1,
                   input a, b, c);

// Dados locais
wire w01, w11, w12;

// Processo
half_adder HA1 ( w01, w11,   a,   b);
half_adder HA2 (  s1, w12, w01,   c); // Saída s1
or         OR  (  s0,      w11, w12); // Saída s0



endmodule
//----------------------------------------

// Modulo de soma
//----------------------------------------
module full_adder_module
            (output s1, output s2, output s3,
            output s4, output s5, output s6,
            input  a0, a1, a2, a3, a4, a5);

// Dados locais
reg valor0 = 1'b0;
reg valor1 = 1'b1;
wire res01, res02, res03, res04, res05, excedente;

// Processo
full_adder FA1 (     res01, s1, a0, valor1, valor0); // Saída s1
full_adder FA2 (     res02, s2, a1, valor0,  res01); // Saída s2
full_adder FA3 (     res03, s3, a2, valor0,  res02); // Saída s3
full_adder FA4 (     res04, s4, a3, valor0,  res03); // Saída s4
full_adder FA5 (     res05, s5, a4, valor0,  res04); // Saída s5
full_adder FA6 ( excedente, s6, a5, valor0,  res05); // Saída s6 e excedente

endmodule
//----------------------------------------

// Complemento de 1
//----------------------------------------
module c_1 (output s1, output s2, output s3,
            output s4, output s5, output s6,
            input  a0, a1, a2, a3, a4, a5);

// Processo
not NOT1 ( s1, a0);
not NOT2 ( s2, a1);
not NOT3 ( s3, a2);
not NOT4 ( s4, a3);
not NOT5 ( s5, a4);
not NOT6 ( s6, a5);

endmodule
//----------------------------------------

// Complemento de 2
//----------------------------------------
module c_2 (output s1, output s2, output s3,
            output s4, output s5, output s6,
            input  a0, a1, a2, a3, a4, a5);

// Dados locais
wire w1, w2, w3, w4, w5, w6;

// Processo
c_1               C1  ( w1, w2, w3, w4, w5, w6, a0, a1, a2, a3, a4, a5);
full_adder_module SUM ( s1, s2, s3, s4, s5, s6, w1, w2, w3, w4, w5, w6);

endmodule
//----------------------------------------




// Modulo principal
module Guia_0805; 

// Definir dados
reg a0, a1, a2, a3, a4, a5;
wire w1, w2, w3, w4, w5, w6;

c_2    C2 (w1, w2, w3, w4, w5, w6,
             a0, a1, a2, a3, a4, a5);


 initial
  begin
   a0     = 1'b0;
   a1     = 1'b0;
   a2     = 1'b0;
   a3     = 1'b0;
   a4     = 1'b0;
   a5     = 1'b0;
  end


// Main 
initial 
begin : main 

$display ( "Guia_0805" );

/*	Mostrar valores em tabela				*/
$display ( "" );
$display ( "____________________________________" );
$display ( "||      a ||   complemento de 2   ||" );
$display ( "||--------||----------------------||" );
$monitor ( "|| %b%b%b%b%b%b ||               %b%b%b%b%b%b ||",
               a5, a4, a3, a2, a1, a0,
                                  w6, w5, w4, w3, w2, w1 );
/*								*/

/*	Atualizar valores		*/

#1;  a0 = 1'b1;
#1;  a0 = 1'b0; a1 = 1'b1;
#1;  a0 = 1'b1;
#1;  a0 = 1'b0; a1 = 1'b0; a2 = 1'b1;
#1;  a0 = 1'b1;
#1;  a0 = 1'b0; a1 = 1'b1;
#1;  a0 = 1'b1;
#1;  a0 = 1'b0; a1 = 1'b0; a2 = 1'b0; a3 = 1'b1;
#1;  a0 = 1'b1;
#1;  a0 = 1'b0; a1 = 1'b1;
#1;  a0 = 1'b1;
#1;  a0 = 1'b0; a1 = 1'b0; a2 = 1'b1;
#1;  a0 = 1'b1;
#1;  a0 = 1'b0; a1 = 1'b1;
#1;  a0 = 1'b1;

/*					*/



end // main 

endmodule // Guia_0805

/*	Previsão de Testes 		*/
/*

____________________________________
||      a ||   complemento de 2   ||
||--------||----------------------||
|| 000000 ||               000000 ||
|| 000001 ||               111111 ||
|| 000010 ||               111110 ||
|| 000011 ||               111101 ||
|| 000100 ||               111100 ||
|| 000101 ||               111011 ||
|| 000110 ||               111010 ||
|| 000111 ||               111001 ||
|| 001000 ||               111000 ||
|| 001001 ||               110111 ||
|| 001010 ||               110110 ||
|| 001011 ||               110101 ||
|| 001100 ||               110100 ||
|| 001101 ||               110011 ||
|| 001110 ||               110010 ||
|| 001111 ||               110001 ||


*/
/*					*/
