/* 
Guia_1106.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_1106.vvp Guia_1106.v
vvp Guia_1106.vvp
*/



`include "Clock.v"


// Constantes
`define found     1
`define notfound  0



// FSM
//----------------------------------------
module fsm_intersec ( y, x, clock, reset );

// Definir dados
output y;
input x;
input clock; input reset;

reg y;

// Parâmetros para identificar estado
parameter
  start  = 3'b000,
  id1    = 3'b001,
  id10   = 3'b010,
  id100  = 3'b011,
  id1001 = 3'b101; // Sinal final

// Estado atual e próximo
reg [2:0] E1;
reg [2:0] E2;


// Lógica de transição de estado
//__________
always @( x or E1 )
  begin
    case ( E1 )

      start:
        if ( x )
          E2 = id1;
        else
          E2 = start;

      id1:
        if ( x )
          E2 = id1;
        else
          E2 = id10;

      id10:
        if ( x )
          E2 = id1;
        else
          E2 = id100;

      id100:
        if ( x )
          E2 = id1001;
        else
          E2 = start;

      id1001:
        if ( x )
          E2 = id1;
        else
          E2 = id10;

      default:
        E2 = 3'bxxx;

    endcase
  end
//__________


// Variáveis
//__________
always @ ( posedge clock or negedge reset )
  begin
    if ( reset )
      E1 = E2;
    else
      E1 = 0;
  end
//__________


// Output
//__________
always @ ( E1 )
  begin
    y = E1[2];
  end
//__________


endmodule
//----------------------------------------






// Modulo principal
module Guia_1106; 

// Definir dados
wire out;
wire clock;
reg reset, x;

// Modulos iniciais
clock clk (clock);
fsm_intersec fsm ( out, x, clock, reset );


// Valores iniciais
initial
  begin
    reset   = 0;
    x       = 0;
  end


// Main 
initial 
  begin // : main 

    $dumpfile ("Guia_1106.vcd");
    $dumpvars ( 1, clock, reset, x, out );

    $display ( "Guia_1106" );
    $display ( "" );
    $display ( " Time     X     FSM" );
    $display ( "" );

    // Mudança de valores
    #5;  reset = 1;
    #10; x = 1;
    #10; x = 0;

    #20; x = 1;
    #10; x = 0;

    #20; x = 1;
    #10; x = 0;

    #20; x = 1;
    #10; x = 0;

    #30;
    #5 $display ( "" );
    $finish;
  end

always @ ( posedge clock )
  begin
    $display ( " %4d  %4b   %4b", $time, x, out ); 
  end


endmodule // Guia_1106


/* Previsão de Teste

VCD info: dumpfile Guia_1106.vcd opened for output.
Guia_1106

 Time     X     FSM

    5     0      0
   15     1      0
   25     0      0
   35     0      0
   45     1      0
   55     0      1
   65     0      0
   75     1      0
   85     0      1
   95     0      0
  105     1      0
  115     0      1
  125     0      0
  135     0      0
  145     0      0

Guia_1106.v:166: $finish called at 150 (1s)

*/