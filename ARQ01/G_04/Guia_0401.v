/* 
Guia_0401.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0401.vvp Guia_0401.v
vvp Guia_0401.vvp
*/


// Modulo letra a
module f01a (output s,
             input x, y, z);
       assign s = ~x & ~(~y | z) ;

endmodule

// Modulo letra b
module f01b (output s,
             input x, y, z);
       assign s = ~(~x | ~y) &  z ;

endmodule

// Modulo letra c
module f01c (output s,
             input x, y, z);
       assign s = ~( x & ~y) & ~z ;

endmodule

// Modulo letra d
module f01d (output s,
             input x, y, z);
       assign s = ~(~x &  y) &  z;

endmodule

// Modulo letra e
module f01e (output s,
             input x, y, z);
       assign s = (~x |  y) & ~(~y |  z);

endmodule



// Modulo principal
module Guia_0401; 

// Definir dados
reg x, y, z;
wire w1, w2, w3, w4, w5;
f01a f01_a (w1, x, y, z);
f01b f01_b (w2, x, y, z);
f01c f01_c (w3, x, y, z);
f01d f01_d (w4, x, y, z);
f01e f01_e (w5, x, y, z);

 initial
  begin
   x = 1'b0;
   y = 1'b0;
   z = 1'b0;
  end


// Main 
initial 
begin : main 

$display ( "Guia_0401" );

/*	Mostrar valores e os atualizar quando mudarem		*/
$display ( "| x | y | z | 1a | 1b | 1c | 1d | 1e |" );
$display ( "|---|---|---|----|----|----|----|----|" );
$monitor ( "| %b | %b | %b |  %b |  %b |  %b |  %b |  %b |",
               x, y, z, w1, w2, w3, w4, w5 );
/*								*/

/*	Atualizar valores (até 8)	*/

#1  z = 1'b1;
#1  z = 1'b0; y = 1'b1;
#1  z = 1'b1;
#1  z = 1'b0; y = 1'b0; x = 1'b1;
#1  z = 1'b1;
#1  z = 1'b0; y = 1'b1;
#1  z = 1'b1;

/*					*/




end // main 

endmodule // Guia_0401
