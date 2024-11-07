/* 
Guia_1105.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_1105.vvp Guia_1105.v
vvp Guia_1105.vvp
*/



`include "Clock.v"


// Constantes
`define found     1
`define notfound  0



// FSM
//----------------------------------------
module fsm_nointersec ( y, x, clock, reset );

// Definir dados
output y;
input x;
input clock; input reset;

reg y;

// Parâmetros para identificar estado
parameter
  start = 2'b00,
  id1   = 2'b01,
  id10  = 2'b10,
  id100 = 2'b11;


// Estado atual e próximo
reg [1:0] E1;
reg [1:0] E2;



// Lógica de transição de estado
//__________
always @( x or E1 )
  begin
    y = `notfound;
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
          begin
            E2 = start;
            y = `found;
          end
        else
          begin
            E2 = start;
            y = `notfound;
          end

      default:
        E2 = 2'bxx;

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


endmodule
//----------------------------------------






// Modulo principal
module Guia_1105; 

// Definir dados
wire out;
wire clock;
reg reset, x;

// Modulos iniciais
clock clk (clock);
fsm_nointersec fsm ( out, x, clock, reset );


// Valores iniciais
initial
  begin
    reset   = 0;
    x       = 0;
  end


// Main 
initial 
  begin // : main 

    $dumpfile ("Guia_1105.vcd");
    $dumpvars ( 1, clock, reset, x, out );

    $display ( "Guia_1105" );
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


endmodule // Guia_1105

/* Previsão de Teste

VCD info: dumpfile Guia_1105.vcd opened for output.
Guia_1105

 Time     X     FSM

    5     0      0
   15     1      0
   25     0      0
   35     0      0
   45     1      1
   55     0      0
   65     0      0
   75     1      0
   85     0      0
   95     0      0
  105     1      1
  115     0      0
  125     0      0
  135     0      0
  145     0      0

Guia_1105.v:159: $finish called at 150 (1s)

*/