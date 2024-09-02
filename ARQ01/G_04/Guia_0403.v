/* 
Guia_0403.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0403.vvp Guia_0403.v
vvp Guia_0403.vvp
*/


// Modulo letra a _ SoP ( 1, 5, 6, 7 )
module f03a (output s,
             input x, y, z);
       assign s = (~x & ~y & z) | (x & ~y & z) | (x & y & ~z) | (x & y & z);

endmodule


// Modulos letra b _ SoP ( 2, 5, 6, 7 )
module f03b (output s,
             input x, y, z);
       assign s = (~x & y & ~z) | (x & ~y & z) | (x & y & ~z) | (x & y & z);

endmodule


// Modulos letra c _ SoP ( 1, 2, 3, 6, 7, 11, 15 )
module f03c (output s,
             input x, y, w, z);
       assign s = (~x & ~y & ~w & z) | (~x & ~y & w & ~z) | (~x & ~y & w & z) |
              (~x & y & w & ~z) | (~x & y & w & z) | (x & ~y & w & z) | (x & y & w & z) ;

endmodule


// Modulos letra d _ SoP ( 1, 2, 6, 8, 10, 12, 14 )
module f03d (output s,
             input x, y, w, z);
       assign s = (~x & ~y & ~w & z) | (~x & ~y & w & ~z) | (~x & y & w & ~z) |
              (x & ~y & ~w & ~z) | (x & ~y & w & ~z) | (x & y & ~w & ~z) | (x & y & w & ~z) ;

endmodule


// Modulos letra e _ SoP ( 0, 2, 5, 7, 8, 11 )
module f03e (output s,
             input x, y, w, z);
       assign s = (~x & ~y & ~w & ~z) | (~x & ~y & w & ~z) | (~x & y & ~w & z) |
              (~x & y & w & z) | (x & ~y & ~w & ~z) | (x & ~y & w & z) ;

endmodule




// Modulo principal
module Guia_0403; 

// Definir dados
reg x1, y1, z1, x2, y2, w2, z2;
wire wa, wb, wc, wd, we;
f03a f03_a (wa, x1, y1, z1);
f03b f03_b (wb, x1, y1, z1);
f03c f03_c (wc, x2, y2, w2, z2);
f03d f03_d (wd, x2, y2, w2, z2);
f03e f03_e (we, x2, y2, w2, z2);

 initial
  begin
   x1 = 1'b0;
   y1 = 1'b0;
   z1 = 1'b0;
   x2 = 1'b0;
   y2 = 1'b0;
   w2 = 1'b0;
   z2 = 1'b0;
  end


// Main 
initial 
begin : main 

$display ( "Guia_0403" );
$display ( " " );

/*	Mostrar valores e os atualizar quando mudarem (letra a e b)		*/
$display ( "Letras a e b" );
$display ( "|| x | y | z || SoP(1,5,6,7) || SoP(2,5,6,7) ||" );
$display ( "||---|---|---||--------------||--------------||" );
$monitor ( "|| %b | %b | %b ||            %b ||           %b  ||",
               x1, y1, z1, wa, wb );
/*								*/

/*	Atualizar valores (até 7)	*/

#1  z1 = 1'b1;
#1  z1 = 1'b0; y1 = 1'b1;
#1  z1 = 1'b1;
#1  z1 = 1'b0; y1 = 1'b0; x1 = 1'b1;
#1  z1 = 1'b1;
#1  z1 = 1'b0; y1 = 1'b1;
#1  z1 = 1'b1;
#1

/*					*/



/*	Mostrar valores e os atualizar quando mudarem (letra c, d e e) 	*/
$display ( " " );
$display ( "Letras c, d e e " );
$display ( "|| x | y | w | z || SoP(1,2,3,6,7,11,15) || SoP(1,2,6,8,10,12,14) || SoP(0,2,5,7,8,11) ||" );
$display ( "||---|---|---|---||----------------------||-----------------------||-------------------||" );
$monitor ( "|| %b | %b | %b | %b ||                    %b ||                    %b  ||                %b  ||",
               x2, y2, w2, z2, wc, wd, we );
/*								*/

/*	Atualizar valores (até 15)	*/

#1  z2 = 1'b1;
#1  z2 = 1'b0; w2 = 1'b1;
#1  z2 = 1'b1;
#1  z2 = 1'b0; w2 = 1'b0; y2 = 1'b1;
#1  z2 = 1'b1;
#1  z2 = 1'b0; w2 = 1'b1;
#1  z2 = 1'b1;
#1  z2 = 1'b0; w2 = 1'b0; y2 = 1'b0; x2 = 1'b1;
#1  z2 = 1'b1;
#1  z2 = 1'b0; w2 = 1'b1;
#1  z2 = 1'b1;
#1  z2 = 1'b0; w2 = 1'b0; y2 = 1'b1;
#1  z2 = 1'b1;
#1  z2 = 1'b0; w2 = 1'b1;
#1  z2 = 1'b1;


/*					*/

end // main 

endmodule // Guia_0403
