/* 
Guia_0902.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0902.vvp Guia_0902.v
vvp Guia_0902.vvp
*/

`include "Clock.v"


// Pulse 1
//----------------------------------------
module pulse1 (output signal,
                   input clock);

// Dados
reg signal;

// Processo
always @ ( posedge clock )
  begin
      signal = 1'b1;
  #4  signal = 1'b0;
  #4  signal = 1'b1;
  #4  signal = 1'b0;
  #4  signal = 1'b1;
  #4  signal = 1'b0;
  end


endmodule
//----------------------------------------

// Pulse 2
//----------------------------------------
module pulse2 (output signal,
                   input clock);

// Dados
reg signal;

// Processo
always @ ( posedge clock )
  begin
      signal = 1'b1;
  #5  signal = 1'b0;
  end


endmodule
//----------------------------------------

// Pulse 3
//----------------------------------------
module pulse3 (output signal,
                   input clock);

// Dados
reg signal;

// Processo
always @ ( posedge clock )
  begin
      signal = 1'b1;
  #15 signal = 1'b0;
  #15 signal = 1'b1;
  end


endmodule
//----------------------------------------

// Pulse 4
//----------------------------------------
module pulse4 (output signal,
                   input clock);

// Dados
reg signal;

// Processo
always @ ( posedge clock )
  begin
      signal = 1'b1;
  #20 signal = 1'b0;
  #20 signal = 1'b1;
  #20 signal = 1'b0;
  end


endmodule
//----------------------------------------






// Modulo principal
module Guia_0902; 

// Definir dados
wire clock, pulse1, pulse2, pulse3, pulse4;

// Modulos iniciais
clock clk (clock);
pulse1 p1 (pulse1, clock);
pulse2 p2 (pulse2, clock);
pulse3 p3 (pulse3, clock);
pulse4 p4 (pulse4, clock);



// Main 
initial 
begin : main 

  $dumpfile ("Guia_0902.vcd");
  $dumpvars ( 1, clock, pulse1, pulse2, pulse3, pulse4);

  //$display ( "Guia_0902" );
  //$display ( "" );

  #480 $finish;


end // main 

endmodule // Guia_0902

