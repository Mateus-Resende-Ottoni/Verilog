/* 
Guia_0904.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0904.vvp Guia_0904.v
vvp Guia_0904.vvp
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
  #3; signal = 1'b0;
  #3; signal = 1'b1;
  #3; signal = 1'b0;
  #3; signal = 1'b1;
  #3; signal = 1'b0;
  #3; signal = 1'b1;
  #3; signal = 1'b0;
  end


endmodule
//----------------------------------------







// Modulo principal
module Guia_0904; 

// Definir dados
wire clock, pulse;

// Modulos iniciais
clock clk (clock);
pulse p1 (pulse, clock);



// Main 
initial 
begin : main 

  $dumpfile ("Guia_0904.vcd");
  $dumpvars ( 1, clock, pulse);

  //$display ( "Guia_0904" );
  //$display ( "" );

  #480 $finish;


end // main 

endmodule // Guia_0904

