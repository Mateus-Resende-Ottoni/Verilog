/* 
Guia_0905.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0905.vvp Guia_0905.v
vvp Guia_0905.vvp
*/

`include "Clock.v"


// Gerador 
//----------------------------------------
module gerador (output signal,
                   input on, clock);

// Dados
reg signal;

// Processo
always @ ( posedge clock & on )
  begin
  #60 signal = 1'b1;
  #60 signal = 1'b0;
  end


endmodule
//----------------------------------------


// Pulse
//----------------------------------------
module pulse (output signal,
                   input clock);

// Dados
reg signal;

// Processo
always @ ( posedge clock )
  begin
  #4  signal = 1'b1;
  #4  signal = 1'b0;
  #4  signal = 1'b1;
  #4  signal = 1'b0;
  end


endmodule
//----------------------------------------







// Modulo principal
module Guia_0905; 

// Definir dados
wire clock;
wire pulse;
wire gerador;
reg key;

// Modulos iniciais
clock clk (clock);
pulse p1 (pulse, clock);
gerador g1 (gerador, key, clock);


initial
  begin
    key     = 1'b0;
  end


// Main 
initial 
begin : main 

  $dumpfile ("Guia_0905.vcd");
  $dumpvars ( 1, clock, key, gerador, pulse);

  //$display ( "Guia_0905" );
  //$display ( "" );

  #060 key = 1'b1;
  #120 key = 1'b0;
  #180 key = 1'b1;
  #240 key = 1'b0;
  #300 key = 1'b1;
  #360 key = 1'b0;
  #420 key = 1'b1;
  #480 $finish;


end // main 

endmodule // Guia_0905

