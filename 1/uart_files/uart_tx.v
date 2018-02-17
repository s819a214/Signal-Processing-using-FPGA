module uart_tx(
  input  wire        clock,
  input  wire        reset,
  input  wire  [7:0] data,
  input  wire        send,
  output wire        tx,
  output reg         busy);

endmodule
