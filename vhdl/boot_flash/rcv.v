//
// rcv.v -- serial line receiver
//


`timescale 1ns/10ps
`default_nettype none


module rcv(clk, reset, full, parallel_out, serial_in);
    input clk;
    input reset;
    output reg full;
    output [7:0] parallel_out;
    input serial_in;

  reg serial_p;
  reg serial_s;
  reg [3:0] state;
  reg [8:0] shift;
  reg [10:0] count;

  assign parallel_out[7:0] = shift[7:0];

  always @(posedge clk) begin
    serial_p <= serial_in;
    serial_s <= serial_p;
  end

  always @(posedge clk) begin
    if (reset) begin
      state <= 4'h0;
      full <= 1'b0;
    end else begin
      if (state == 4'h0) begin
        full <= 1'b0;
        if (serial_s == 1'b0) begin
          state <= 4'h1;
          count <= 11'd651;
        end
      end else
      if (state == 4'hb) begin
        state <= 4'h0;
        full <= 1'b1;
      end else begin
        if (count == 11'd0) begin
          state <= state + 4'h1;
          shift[8:0] <= { serial_s, shift[8:1] };
          count <= 11'd1302;
        end else begin
          count <= count - 11'd1;
        end
      end
    end
  end

endmodule
