/* 
Guia_1103.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_1103.vvp Guia_1103.v
vvp Guia_1103.vvp
*/

`include "Clock.v"
`include "Mealy_1101.v"
`include "Moore_1102.v"


// Modulo principal
module Guia_1103; 

// Definir dados
wire m1, m2;
wire clock;
reg reset, x;

// Modulos iniciais
clock clk (clock);
mealy_1101 mealy ( m1, x, clock, reset );
moore_1102 moore ( m2, x, clock, reset );


// Valores iniciais
initial
  begin
    reset   = 0;
    x       = 0;
  end


// Main 
initial 
  begin // : main 

    $dumpfile ("Guia_1103.vcd");
    $dumpvars ( 1, clock, reset, x, m1, m2 );

    $display ( "Guia_1103" );
    $display ( "" );
    $display ( " Time     X    Mealy   Moore" );
    $display ( "" );

    // Mudança de valores
    #5;  reset = 1;
    #10; x = 1;
    #10; x = 0;
    #10; x = 1;
    #20; x = 0;
    #10; x = 1;
    #10; x = 1;
    #10; x = 0;
    #10; x = 1;

    #30;
    #5 $display ( "" );
    $finish;
  end

always @ ( posedge clock )
  begin
    $display ( " %4d  %4b   %4b   %5b", $time, x, m1, m2 ); 
  end


endmodule // Guia_1103

