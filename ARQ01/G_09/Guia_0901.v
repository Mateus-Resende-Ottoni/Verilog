/* 
Guia_0901.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_0901.vvp Guia_0901.v
vvp Guia_0901.vvp
*/



// Clock
//----------------------------------------
module clock (output signal);

// Dados
reg signal;

// Processo
initial
  begin
    signal = 1'b0;
  end

  always
    begin
      #12 signal = ~signal;
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
always @ ( clock )
  begin
      signal = 1'b1;
  #3  signal = 1'b0;
  #3  signal = 1'b1;
  #3  signal = 1'b0;
  end


endmodule
//----------------------------------------

// Trigger
//----------------------------------------
module trigger (output signal,
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





// Modulo principal
module Guia_0901; 

// Definir dados
reg key;
wire clock, pulse1, trigger1;

// Modulos iniciais
clock clk (clock);
pulse p1 (pulse1, clock);
trigger t1 (trigger1, key, clock);


initial
  begin
    key     = 1'b0;
  end


// Main 
initial 
begin : main 

  $dumpfile ("Guia_0901.vcd");
  $dumpvars ( 1, clock, pulse1, key, trigger1);

  //$display ( "Guia_0901" );
  //$display ( "" );


  #060 key = 1'b1;
  #120 key = 1'b0;
  #180 key = 1'b1;
  #240 key = 1'b0;
  #300 key = 1'b1;
  #360 key = 1'b0;
  #376 $finish;


end // main 

endmodule // Guia_0901

