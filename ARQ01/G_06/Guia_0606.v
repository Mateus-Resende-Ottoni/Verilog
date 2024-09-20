/* 
Guia_0606.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0606.vvp Guia_0606.v
vvp Guia_0606.vvp
*/



// Modulos
//----------------------------------------
module f06_base (output s,
                   input a, b, c, d);
       assign s = (~(~a | ~b | c) & ~(a & b & ~c)) | ~((b & c & d) | ~a) ;

endmodule
//----------------------------------------
module f06 (output s,
              input a, b, c, d);
       assign s = ~((b & c & d) | ~a) ;

endmodule
//----------------------------------------


// Modulo principal
module Guia_0606; 

// Definir dados
reg a, b, c, d;
wire w1, w2;
f06_base f06_1 (w1, a, b, c, d);
f06      f06_2 (w2, a, b, c, d);


 initial
  begin
   a = 1'b0;
   b = 1'b0;
   c = 1'b0;
   d = 1'b0;
  end


// Main 
initial 
begin : main 

$display ( "Guia_0606" );

/*	Mostrar valores em tabela 				*/
$display ( "" );
$display ( "___________________________________________________________________________________" );
$display ( "| a | b | c | d || ((a'+b'+c)' * (a*b*c')') + ((b*c*d) + a')' || ((b*c*d) + a')' ||" );
$display ( "|---|---|---|---||--------------------------------------------||-----------------||" );
$monitor ( "| %b | %b | %b | %b ||                                          %b ||               %b ||",
               a,   b,   c,   d,                                            w1,                 w2 );
/*								*/

/*	Atualizar valores		*/

#1  d = 1'b1;
#1  d = 1'b0; c = 1'b1;
#1  d = 1'b1;
#1  d = 1'b0; c = 1'b0; b = 1'b1;
#1  d = 1'b1;
#1  d = 1'b0; c = 1'b1;
#1  d = 1'b1;
#1  d = 1'b0; c = 1'b0; b = 1'b0; a = 1'b1;
#1  d = 1'b1;
#1  d = 1'b0; c = 1'b1;
#1  d = 1'b1;
#1  d = 1'b0; c = 1'b0; b = 1'b1;
#1  d = 1'b1;
#1  d = 1'b0; c = 1'b1;
#1  d = 1'b1;

/*					*/


end // main 

endmodule // Guia_0606
