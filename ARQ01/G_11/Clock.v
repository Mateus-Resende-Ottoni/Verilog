/* 
Clock.v 
855842 - Mateus Resende Ottoni
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
      #5 signal = ~signal;
    end


endmodule
//----------------------------------------



