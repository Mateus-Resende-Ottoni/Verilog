/* 
Guia_0404.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0404.vvp Guia_0404.v
vvp Guia_0404.vvp
*/


// Modulo letra a _ PoS ( 1, 2, 6, 7 )
module f04a (output s,
             input x, y, z);
       assign s = (x | y | ~z) & (x | ~y | z) & (~x | ~y | z) &
              (~x | ~y | ~z) ;

endmodule


// Modulos letra b _ PoS ( 0, 3, 4, 7 )
module f04b (output s,
             input x, y, z);
       assign s = (x | y | z) & (x | ~y | ~z) & (~x | y | z) &
              (~x | ~y | ~z) ;

endmodule


// Modulos letra c _ PoS ( 0, 1, 2, 4, 6, 8, 11, 12 )

module f04c (output s,
             input x, y, w, z);
       assign s = (x | y | w | z) & (x | y | w | ~z) & (x | y | ~w | z) &
              (x | ~y | w | z) & (x | ~y | ~w | z) & (~x | y | w | z) &
              (~x | y | ~w | ~z) & (~x | ~y | w | z) ;

endmodule


// Modulos letra d _ SoP PoS ( 1, 2, 4, 7, 8, 9, 15 )

module f04d (output s,
             input x, y, w, z);
       assign s = (x | y | w | ~z) & (x | y | ~w | z) & (x | ~y | w | z) &
              (x | ~y | ~w | ~z) & (~x | y | w | z) & (~x | y | w | ~z) &
              (~x | ~y | ~w | ~z) ;

endmodule


// Modulos letra e _ PoS ( 0, 1, 2, 4, 5, 10, 13 )
module f04e (output s,
             input x, y, w, z);
       assign s = (x | y | w | z) & (x | y | w | ~z) & (x | y | ~w | z) &
              (x | ~y | w | z) & (x | ~y | w | ~z) & (~x | y | ~w | z) &
              (~x | ~y | w | ~z) ;

endmodule




// Modulo principal
module Guia_0404; 

// Definir dados
reg x1, y1, z1, x2, y2, w2, z2;
wire wa, wb, wc, wd, we;
f04a f04_a (wa, x1, y1, z1);
f04b f04_b (wb, x1, y1, z1);
f04c f04_c (wc, x2, y2, w2, z2);
f04d f04_d (wd, x2, y2, w2, z2);
f04e f04_e (we, x2, y2, w2, z2);

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

$display ( "Guia_0404" );
$display ( " " );

/*	Mostrar valores e os atualizar quando mudarem (letra a e b)		*/
$display ( "Letras a e b" );
$display ( "|| x | y | z || PoS(1,2,6,7) || PoS(0,3,4,7) ||" );
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
$display ( "|| x | y | w | z || PoS(0,1,2,4,6,8,11,12) || PoS(1,2,4,7,8,9,15) || PoS(0,1,2,4,5,10,13) ||" );
$display ( "||---|---|---|---||------------------------||---------------------||----------------------||" );
$monitor ( "|| %b | %b | %b | %b ||                      %b ||                  %b  ||                   %b  ||",
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

endmodule // Guia_0404
