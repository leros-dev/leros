//
// clk_rst.v -- clock and reset generator
//


`timescale 1ns/10ps
`default_nettype none


module clk_rst(clk_in, rst_in_n,
               clk, rst);
    input clk_in;
    input rst_in_n;
    output clk;
    output rst;

  reg rst_p_n;
  reg rst_s_n;
  reg [23:0] rst_counter;
  wire rst_counting;

  //------------------------------------------------------------

  assign clk = clk_in;

  //------------------------------------------------------------

  assign rst_counting = (rst_counter == 24'hFFFFFF) ? 1'b0 : 1'b1;

  always @(posedge clk_in) begin
    rst_p_n <= rst_in_n;
    rst_s_n <= rst_p_n;
    if (~rst_s_n) begin
      rst_counter <= 24'h000000;
    end else begin
      if (rst_counting) begin
        rst_counter <= rst_counter + 24'h000001;
      end
    end
  end

  assign rst = rst_counting;

endmodule
