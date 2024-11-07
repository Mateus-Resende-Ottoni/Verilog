/* 
Moore_1102.v 
855842 - Mateus Resende Ottoni
*/

// Constantes
`define found     1
`define notfound  0


// Modulo principal _ Máquina de Moore
module moore_1102 ( y, x, clock, reset ) ;

// Definir dados
output y;
input x;
input clock; input reset;

reg y;

// Parâmetros para identificar estado
parameter
  start  = 3'b000,
  id1    = 3'b001,
  id11   = 3'b011,
  id110  = 3'b010,
  id1101 = 3'b110; // Sinal final


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
          E2 = id11;
        else
          E2 = start;

      id11:
        if ( x )
          E2 = id11;
        else
          E2 = id110;

      id110:
        if ( x )
          E2 = id1101;
        else
          E2 = start;

      id1101:
        if ( x )
          E2 = id11;
        else
          E2 = start;

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



endmodule // Moore_1102

