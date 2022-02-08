//
// rcvbuf.v -- serial line receiver buffer
//


`timescale 1ns/10ps
`default_nettype none


module rcvbuf(clk, reset, read, ready, data_out, serial_in);
    input clk;
    input reset;
    input read;
    output reg ready;
    output reg [7:0] data_out;
    input serial_in;

  wire full;
  wire [7:0] parallel_out;

  rcv rcv_1(clk, reset, full, parallel_out, serial_in);

  always @(posedge clk) begin
    if (reset) begin
      ready <= 1'b0;
    end else begin
      if (full) begin
        data_out <= parallel_out;
      end
      if (full | read) begin
        ready <= full;
      end
    end
  end

endmodule
