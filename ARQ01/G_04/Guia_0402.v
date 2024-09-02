/* 
Guia_0402.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0402.vvp Guia_0402.v
vvp Guia_0402.vvp
*/


// Modulos letra a
module f02a (output s,
             input x1, y1);
       assign s = x1 & ~(~x1 | y1) ;

endmodule

module f02a_s (output s,
             input x1, y1);
       assign s = x1 & ~y1;

endmodule

// Modulos letra b
module f02b (output s,
             input x1, y1);
       assign s = (~x1 | y1) | (~x1 & y1) ;

endmodule

module f02b_s (output s,
             input x1, y1);
       assign s = ~x1 | y1;

endmodule

// Modulos letra c
module f02c (output s,
             input x1, y1);
       assign s = ~(~x1 & ~y1) & (x1 | y1) ;

endmodule

module f02c_s (output s,
             input x1, y1);
       assign s = x1 | y1;

endmodule

// Modulos letra d
module f02d (output s,
             input x2, y2);
       assign s = ~(~x2 & y2) | ~(~x2 | y2);

endmodule

module f02d_s (output s,
             input x2, y2);
       assign s = x2 | ~y2;

endmodule

// Modulos letra e
module f02e (output s,
             input x2, y2);
       assign s = (y2 | ~x2) & ~(~y2 | x2) ;

endmodule

module f02e_s (output s,
             input x2, y2);
       assign s = y2 & ~x2;

endmodule



// Modulo principal
module Guia_0402; 

// Definir dados
reg x1, y1, x2, y2;
wire wa1, wa2, wb1, wb2, wc1, wc2, wd1, wd2, we1, we2;
f02a f02_a (wa1, x1, y1);
f02a_s f02_as (wa2, x1, y1);
f02b f02_b (wb1, x1, y1);
f02b_s f02_bs (wb2, x1, y1);
f02c f02_c (wc1, x1, y1);
f02c_s f02_cs (wc2, x1, y1);
f02d f02_d (wd1, x2, y2);
f02d_s f02_ds (wd2, x2, y2);
f02e f02_e (we1, x2, y2);
f02e_s f02_es (we2, x2, y2);

 initial
  begin
   x1 = 1'b0;
   y1 = 1'b0;
   x2 = 1'b0;
   y2 = 1'b0;
  end


// Main 
initial 
begin : main 

$display ( "Guia_0402" );
$display ( " " );

/*	Mostrar valores e os atualizar quando mudarem (letra a,b e c)		*/
$display ( "Letras a, b e c" );
$display ( "|| x | y || x*(x'+y)' | x*y' || (x'+y)+(x'*y) | x'+y|| (x'*y')'*(x+y) | x+y ||" );
$display ( "||---|---||-----------|------||---------------|-----||----------------|-----||" );
$monitor ( "|| %b | %b ||         %b |   %b  ||             %b |   %b ||              %b |   %b ||",
               x1, y1, wa1, wa2, wb1, wb2, wc1, wc2 );
/*								*/

/*	Atualizar valores (até 3)	*/

#1  y1 = 1'b1;
#1  y1 = 1'b0; x1 = 1'b1;
#1  y1 = 1'b1;
#1

/*					*/



/*	Mostrar valores e os atualizar quando mudarem (letra d e e) 	*/
$display ( " " );
$display ( "Letras d e e " );
$display ( "|| x | y || (x'*y)'+(x'*y)' | x'*y || (y+x')&(y'+x)' | y*x' ||" );
$display ( "||---|---||-----------------|------||----------------|------||" );
$monitor ( "|| %b | %b ||               %b |    %b ||              %b |    %b ||",
               x2, y2, wd1, wd2, we1, we2 );
/*								*/

/*	Atualizar valores (até 3)	*/

#1  y2 = 1'b1;
#1  y2 = 1'b0; x2 = 1'b1;
#1  y2 = 1'b1;

/*					*/

end // main 

endmodule // Guia_0402
