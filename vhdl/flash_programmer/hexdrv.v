module hexdrv(in, out);
input [3:0] in;
output reg [6:0] out;

always @(*) begin
case (in[3:0])
					// 6543210
  4'h0: out[6:0] = ~7'b0111111;
  4'h1: out[6:0] = ~7'b0000110;
  4'h2: out[6:0] = ~7'b1011011;
  4'h3: out[6:0] = ~7'b1001111;
  4'h4: out[6:0] = ~7'b1100110;
  4'h5: out[6:0] = ~7'b1101101;
  4'h6: out[6:0] = ~7'b1111101;
  4'h7: out[6:0] = ~7'b0000111;
  4'h8: out[6:0] = ~7'b1111111;
  4'h9: out[6:0] = ~7'b1100111;
  4'hA: out[6:0] = ~7'b1110111;
  4'hB: out[6:0] = ~7'b1111100;
  4'hC: out[6:0] = ~7'b0111001;
  4'hD: out[6:0] = ~7'b1011110;
  4'hE: out[6:0] = ~7'b1111001;
  4'hF: out[6:0] = ~7'b1110001;
endcase
end

endmodule