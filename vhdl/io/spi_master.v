module spi_master
#(parameter SPI_MODE = 0,
  parameter CLKS_PER_HALF_BIT = 2
)(
// Control/Data Signals,
input        i_rst_n,     // FPGA Reset
input        i_clk,       // FPGA Clock

// TX (MOSI) Signals
input [7:0]  i_mosi_byte,        // Byte to transmit on MOSI
input        i_mosi_dv,          // Data Valid Pulse with i_mosi_byte
output reg   o_mosi_ready,       // Transmit Ready for next byte

// RX (MISO) Signals
output reg       o_miso_dv,     // Data Valid pulse (1 clock cycle)
output reg [7:0] o_miso_byte,   // Byte received on MISO

// SPI Interface
output reg o_spi_clk,
input      i_spi_miso,
output reg o_spi_mosi,
output reg o_spi_cs
);

// SPI Interface (All Runs at SPI Clock Domain)
wire w_CPOL;     // Clock polarity
wire w_CPHA;     // Clock phase

reg [$clog2(CLKS_PER_HALF_BIT*2)-1:0] r_SPi_clk_Count;
reg r_SPi_clk;
reg [4:0] r_SPi_clk_Edges;
reg r_Leading_Edge;
reg r_Trailing_Edge;
reg       r_MOSI_DV;
reg [7:0] r_TX_Byte;

reg [2:0] r_RX_Bit_Count;
reg [2:0] r_TX_Bit_Count;

// CPOL: Clock Polarity
// CPOL=0 means clock idles at 0, leading edge is rising edge.
// CPOL=1 means clock idles at 1, leading edge is falling edge.
assign w_CPOL  = (SPI_MODE == 2) | (SPI_MODE == 3);
// assign w_CPOL  = 0;

// CPHA: Clock Phase
// CPHA=0 means the "out" side changes the data on trailing edge of clock
//              the "in" side captures data on leading edge of clock
// CPHA=1 means the "out" side changes the data on leading edge of clock
//              the "in" side captures data on the trailing edge of clock
assign w_CPHA  = (SPI_MODE == 1) | (SPI_MODE == 3);
// assign w_CPHA  = 0;

/* execute only on mosi data valid rising edge */
wire w_MOSI_DV_rising;
always @(posedge i_clk) begin
  if(~i_rst_n) begin
    r_MOSI_DV <= 1'b0;
  end
  else begin
    r_MOSI_DV <= i_mosi_dv;
  end
end
assign w_MOSI_DV_rising = i_mosi_dv & ~r_MOSI_DV;



// Purpose: Generate SPI Clock correct number of times when DV pulse comes
always @(posedge i_clk) begin
  if (~i_rst_n) begin
    o_mosi_ready    <= 1'b0;
    o_spi_cs       <= 1'b1;
    r_SPi_clk_Edges <= 0;
    r_Leading_Edge  <= 1'b0;
    r_Trailing_Edge <= 1'b0;
    r_SPi_clk       <= w_CPOL; // assign default state to idle state
    r_SPi_clk_Count <= 0;
  end
  else begin
    // Default assignments
    r_Leading_Edge  <= 1'b0;
    r_Trailing_Edge <= 1'b0;
    
    if (w_MOSI_DV_rising) begin
      o_mosi_ready      <= 1'b0;
      o_spi_cs         <= 1'b0; //pull CS down when data valid
      r_SPi_clk_Edges <= 16;  // Total # edges in one byte ALWAYS 16
    end
    else if (r_SPi_clk_Edges != 0) begin //origial >
      o_mosi_ready <= 1'b0;
      o_spi_cs    <= 1'b0; //still hold cs down
      
      if (r_SPi_clk_Count == CLKS_PER_HALF_BIT*2-1) begin
        r_SPi_clk_Edges <= r_SPi_clk_Edges - 1;
        r_Trailing_Edge <= 1'b1;
        r_SPi_clk_Count <= 0;
        r_SPi_clk       <= ~r_SPi_clk;
      end
      else if (r_SPi_clk_Count == CLKS_PER_HALF_BIT-1) begin
        r_SPi_clk_Edges <= r_SPi_clk_Edges - 1;
        r_Leading_Edge  <= 1'b1;
        r_SPi_clk_Count <= r_SPi_clk_Count + 1;
        r_SPi_clk       <= ~r_SPi_clk;
      end
      else begin
        r_SPi_clk_Count <= r_SPi_clk_Count + 1;
      end
    end  
    else begin
      o_mosi_ready <= 1'b1;
      o_spi_cs    <= 1'b1; //set cs high, complete transmit
    end
  end // else: !if(~i_rst_n)
end // always @ (posedge i_clk or negedge i_rst_n)


// Purpose: Register i_mosi_byte when Data Valid is pulsed.
// Keeps local storage of byte in case higher level module changes the data
always @(posedge i_clk) begin
  if (~i_rst_n) begin
    r_TX_Byte <= 8'h00;
  end
  else begin
      if (w_MOSI_DV_rising) begin
        r_TX_Byte <= i_mosi_byte;
      end
    end // else: !if(~i_rst_n)
end // always @ (posedge i_clk or negedge i_rst_n)


// Purpose: Generate MOSI data
// Works with both CPHA=0 and CPHA=1
always @(posedge i_clk) begin
  if (~i_rst_n) begin
    o_spi_mosi     <= 1'b0;
    r_TX_Bit_Count <= 3'b111; // send MSb first
  end
  else begin
    // If ready is high, reset bit counts to default
    if (o_mosi_ready) begin
      r_TX_Bit_Count <= 3'b111;
    end
    // Catch the case where we start transaction and CPHA = 0
    else if (r_MOSI_DV & ~w_CPHA) begin
      o_spi_mosi     <= r_TX_Byte[3'b111];
      r_TX_Bit_Count <= 3'b110;
    end
    else if ((r_Leading_Edge & w_CPHA) | (r_Trailing_Edge & ~w_CPHA)) begin
      r_TX_Bit_Count <= r_TX_Bit_Count - 1;
      o_spi_mosi     <= r_TX_Byte[r_TX_Bit_Count];
    end
  end
end


// Purpose: Read in MISO data.
always @(posedge i_clk) begin
  if (~i_rst_n) begin
    o_miso_byte      <= 8'h00;
    o_miso_dv        <= 1'b0;
    r_RX_Bit_Count <= 3'b111;
  end
  else begin
    // Default Assignments
    o_miso_dv   <= 1'b0;

    if (o_mosi_ready) begin // Check if ready is high, if so reset bit count to default 
      r_RX_Bit_Count <= 3'b111;
    end
    else if ((r_Leading_Edge & ~w_CPHA) | (r_Trailing_Edge & w_CPHA)) begin
      o_miso_byte[r_RX_Bit_Count] <= i_spi_miso;  // Sample data
      r_RX_Bit_Count            <= r_RX_Bit_Count - 1;
      if (r_RX_Bit_Count == 3'b000) begin
        o_miso_dv   <= 1'b1;   // Byte done, pulse Data Valid
      end
    end
  end
end


// Purpose: Add clock delay to signals for alignment.
always @(posedge i_clk) begin
  if (~i_rst_n) begin
    o_spi_clk  <= w_CPOL;
  end
  else begin
    o_spi_clk <= r_SPi_clk;
  end // else: !if(~i_rst_n)
end // always @ (posedge i_clk or negedge i_rst_n)


endmodule // SPI_Master