/* 
Guia_0605.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0605.vvp Guia_0605.v
vvp Guia_0605.vvp
*/



// Modulos
//----------------------------------------
module f05_base (output s,
                   input a, b, c);
       assign s = (~(~a | ~b) & ~(a & b)) | ~((b & c) | ~a) ;

endmodule
//----------------------------------------
module f05 (output s,
              input a, b, c);
       assign s = ~((b & c) | ~a) ;

endmodule
//----------------------------------------


// Modulo principal
module Guia_0605; 

// Definir dados
reg a, b, c;
wire w1, w2;
f05_base f05_1 (w1, a, b, c);
f05      f05_2 (w2, a, b, c);


 initial
  begin
   a = 1'b0;
   b = 1'b0;
   c = 1'b0;
  end


// Main 
initial 
begin : main 

$display ( "Guia_0605" );

/*	Mostrar valores em tabela 				*/
$display ( "" );
$display ( "______________________________________________________________________" );
$display ( "| a | b | c || ((a'+b')' * (a*b)') + ((b*c) + a')' || ((b*c) + a')' ||" );
$display ( "|---|---|---||-------------------------------------||---------------||" );
$monitor ( "| %b | %b | %b ||                                   %b ||             %b ||",
               a,   b,   c,                                     w1,               w2 );
/*								*/

/*	Atualizar valores		*/

#1  c = 1'b1;
#1  c = 1'b0; b = 1'b1;
#1  c = 1'b1;
#1  c = 1'b0; b = 1'b0; a = 1'b1;
#1  c = 1'b1;
#1  c = 1'b0; b = 1'b1;
#1  c = 1'b1;

/*					*/


end // main 

endmodule // Guia_0605
