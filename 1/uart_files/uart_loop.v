module uart_loop(
  input  wire       clock,
  input  wire       reset,
  input  wire       rx,
  output wire       tx,
  output reg  [7:0] led);

  wire        [7:0] data_in;
  reg               busy_rx_delay;
  wire              receive;
  wire              busy_rx;
  wire              busy_tx;

  assign receive = busy_rx_delay & ~busy_rx;

  always@(posedge clock)
    if (reset) busy_rx_delay <= 1'b0;
    else busy_rx_delay <= busy_rx;

  always@(posedge clock)
    if (receive) led <= data_in;
  
  uart_rx u1 (
    .clock(clock),
    .reset(reset),
    .rx(rx),
    .data(data_in),
    .busy(busy_rx));
  
  uart_tx u2 (
    .clock(clock),
    .reset(reset),
    .data(data_in),
    .send(receive),
    .tx(tx),
    .busy(busy_tx));

endmodule
