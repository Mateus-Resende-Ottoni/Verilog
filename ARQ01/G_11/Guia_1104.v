/* 
Guia_1104.v 
855842 - Mateus Resende Ottoni

iverilog -o Guia_1104.vvp Guia_1104.v
vvp Guia_1104.vvp
*/



`include "Clock.v"


// Constantes
`define found     1
`define notfound  0



// FSM
//----------------------------------------
module fsm_first ( y, x, clock, reset );

// Definir dados
output y;
input x;
input clock; input reset;

reg y;
reg found;

// Parâmetros para identificar estado
parameter
  start = 2'b00,
  id1   = 2'b01,
  id10  = 2'b10,
  id100 = 2'b11;


// Estado atual e próximo
reg [1:0] E1;
reg [1:0] E2;


// Valor inicial
initial
  begin
    y = `notfound;
    found = `notfound;
  end

// Lógica de transição de estado
//__________
always @( x or E1 )
  begin
    y = `notfound;
    if ( ~found )
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
              E2 = id1;
              y = `found;
              found = `found;
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
module Guia_1104; 

// Definir dados
wire out;
wire clock;
reg reset, x;

// Modulos iniciais
clock clk (clock);
fsm_first fsm ( out, x, clock, reset );


// Valores iniciais
initial
  begin
    reset   = 0;
    x       = 0;
  end


// Main 
initial 
  begin // : main 

    $dumpfile ("Guia_1104.vcd");
    $dumpvars ( 1, clock, reset, x, out );

    $display ( "Guia_1104" );
    $display ( "" );
    $display ( " Time     X    FSM" );
    $display ( "" );

    // Mudança de valores
    #5;  reset = 1;
    #10; x = 1;
    #10; x = 0;

    #20; x = 1;

    #20; x = 0;

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


endmodule // Guia_1104

/* Previsão de Teste

VCD info: dumpfile Guia_1104.vcd opened for output.
Guia_1104

 Time     X    FSM

    5     0      0
   15     1      0
   25     0      0
   35     0      0
   45     1      1
   55     1      0
   65     0      0
   75     0      0
   85     1      0
   95     0      0
  105     0      0
  115     0      0
  125     0      0

Guia_1104.v:166: $finish called at 130 (1s)

*/