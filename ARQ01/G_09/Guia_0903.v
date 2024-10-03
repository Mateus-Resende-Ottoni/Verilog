/* 
Guia_0903.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0903.vvp Guia_0903.v
vvp Guia_0903.vvp
*/

`include "Clock.v"


// Pulse
//----------------------------------------
module pulse (output signal,
                   input clock);

// Dados
reg signal;

// Processo
always @ ( posedge clock )
  begin
      signal = 1'b1;
  #36 signal = 1'b0;
  #36 signal = 1'b1;
  end


endmodule
//----------------------------------------







// Modulo principal
module Guia_0903; 

// Definir dados
wire clock, pulse;

// Modulos iniciais
clock clk (clock);
pulse p1 (pulse, clock);



// Main 
initial 
begin : main 

  $dumpfile ("Guia_0903.vcd");
  $dumpvars ( 1, clock, pulse);

  //$display ( "Guia_0903" );
  //$display ( "" );

  #480 $finish;


end // main 

endmodule // Guia_0903

