module spi_master_ctrl(
/* control signal */
input i_clk,
input i_rst_n,
input [7:0] i_addr,
input i_wen,
input i_ren,
input [15:0] i_data,
output o_ready,
/* spi master interface */
output o_spi_cs,
output o_spi_clk,
output o_spi_mosi,
output o_spi_miso
);

/* control spi */
wire w_dv;
wire w_ready;

spi_master SPI_MASTER(
.i_rst_n(i_rst_n),
.i_clk(i_clk),
// TX (MOSI) Signals
.i_mosi_byte(i_data[7:0]), // Byte to transmit on MOSI
.i_mosi_dv(w_dv),          // Data Valid Pulse with i_mosi_byte
.o_mosi_ready(w_ready),    // Transmit Ready for next byte
// RX (MISO) Signals -- not use
.o_miso_dv(),     // Data Valid pulse (1 clock cycle)
.o_miso_byte(),   // Byte received on MISO
// SPI Interface
.o_spi_cs(o_spi_cs),
.o_spi_clk(o_spi_clk),
.o_spi_mosi(o_spi_mosi),
.i_spi_miso(o_spi_miso)
);

/**address from software
*   SPI_CTRL = 4
*   SPI_DATA = 5
*   SPI_FLAG = 6
*/
assign w_dv = ((i_addr == 8'd5) & i_wen)? 1'b1 : 1'b0;
assign o_ready =  ((i_addr == 8'd4) & i_ren)? w_ready : 1'b0;

endmodule