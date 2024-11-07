/* 
Mealy_1101.v 
855842 - Mateus Resende Ottoni
*/

// Constantes
`define found     1
`define notfound  0


// Modulo principal _ Máquina de Mealy
module mealy_1101 ( y, x, clock, reset ) ;

// Definir dados
output y;
input x;
input clock; input reset;

reg y;

// Parâmetros para identificar estado
parameter
  start = 2'b00,
  id1   = 2'b01,
  id11  = 2'b11,
  id110 = 2'b10;


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
          begin
            E2 = id1;
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



endmodule // Mealy_1101

