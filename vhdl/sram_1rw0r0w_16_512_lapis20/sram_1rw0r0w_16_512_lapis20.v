// OpenRAM SRAM model
// Words: 512
// Word size: 16

module sram_1rw0r0w_16_512_lapis20(
//`ifdef USE_POWER_PINS
//    vdd,
//    gnd,
//`endif
// Port 0: RW
    clk0,csb0,web0,addr0,din0,dout0
  );

  parameter DATA_WIDTH = 16 ;
  parameter ADDR_WIDTH = 9 ;
  parameter RAM_DEPTH = 1 << ADDR_WIDTH;
  // FIXME: This delay is arbitrary.
//  parameter DELAY = 3 ;
//  parameter VERBOSE = 1 ; //Set to 0 to only display warnings
//  parameter T_HOLD = 1 ; //Delay to hold dout value after posedge. Value is arbitrary

//`ifdef USE_POWER_PINS
//    inout vdd;
//    inout gnd;
//`endif
  input  clk0; // clock
  input   csb0; // active low chip select
  input  web0; // active low write control
  input [ADDR_WIDTH-1:0]  addr0;
  input [DATA_WIDTH-1:0]  din0;
  output [DATA_WIDTH-1:0] dout0;

  reg [DATA_WIDTH-1:0]    mem [RAM_DEPTH-1:0];

  
//  initial begin
//		mem[0] = 16'b0000000000000000;
//		mem[1] = 16'b0100100000011001;
//		mem[2] = 16'b0010000001000111;
//		mem[3] = 16'b0011000001011100;
//		mem[4] = 16'b0011000001001001;
//		mem[5] = 16'b0011000001011100;
//		mem[6] = 16'b0000000000000000;
//		mem[7] = 16'b0000000000000000;
//		mem[8] = 16'b0100100100001111;
//		mem[9] = 16'b0010000101100100;
//		mem[10] = 16'b0011000001001011;
//		mem[11] = 16'b0011000001011100;
//		mem[12] = 16'b0000000000000000;
//		mem[13] = 16'b0000000000000000;
//		mem[14] = 16'b0100100100000101;
//		mem[15] = 16'b0010000001001011;
//		mem[16] = 16'b0000110100000001;
//		mem[17] = 16'b0011000001001011;
//		mem[18] = 16'b0100100011111001;
//		mem[19] = 16'b0010000001001001;
//		mem[20] = 16'b0000110100000001;
//		mem[21] = 16'b0011000001001001;
//		mem[22] = 16'b0100100011101111;
//		mem[23] = 16'b0010000000000001;
//		mem[24] = 16'b0000000000000000;
//		mem[25] = 16'b0100000000000001;
//		mem[26] = 16'b0010000100000000;
//		mem[27] = 16'b0011000000110011;
//		mem[28] = 16'b0011100000000000;
//		mem[29] = 16'b0010000100000000;
//		mem[30] = 16'b0011000000011110;
//		mem[31] = 16'b0011000000110011;
//		mem[32] = 16'b0010000100000000;
//		mem[33] = 16'b0010100101111101;
//		mem[34] = 16'b0011000000110101;
//		mem[35] = 16'b0000110000110011;
//		mem[36] = 16'b0000000000000000;
//		mem[37] = 16'b0000000000000000;
//		mem[38] = 16'b0100110000010011;
//		mem[39] = 16'b0010000100000000;
//		mem[40] = 16'b0011000000100000;
//		mem[41] = 16'b0011000000110011;
//		mem[42] = 16'b0010000111001000;
//		mem[43] = 16'b0010100100000000;
//		mem[44] = 16'b0011000000110101;
//		mem[45] = 16'b0000110000110011;
//		mem[46] = 16'b0000000000000000;
//		mem[47] = 16'b0000000000000000;
//		mem[48] = 16'b0100110000000101;
//		mem[49] = 16'b0010000100000001;
//		mem[50] = 16'b0000100000100000;
//		mem[51] = 16'b0011000000100000;
//		mem[52] = 16'b0100100011110101;
//		mem[53] = 16'b0010000100000001;
//		mem[54] = 16'b0000100000011110;
//		mem[55] = 16'b0011000000011110;
//		mem[56] = 16'b0100100011100111;
//		mem[57] = 16'b0010000100000001;
//		mem[58] = 16'b0011000000110011;
//		mem[59] = 16'b0011100000000000;
//		mem[60] = 16'b0010000100000000;
//		mem[61] = 16'b0011000000011110;
//		mem[62] = 16'b0011000000110011;
//		mem[63] = 16'b0010000100000000;
//		mem[64] = 16'b0010100101111101;
//		mem[65] = 16'b0011000000110101;
//		mem[66] = 16'b0000110000110011;
//		mem[67] = 16'b0000000000000000;
//		mem[68] = 16'b0000000000000000;
//		mem[69] = 16'b0100110000010101;
//		mem[70] = 16'b0010000100000000;
//		mem[71] = 16'b0011000000100000;
//		mem[72] = 16'b0011000000110011;
//		mem[73] = 16'b0010000111001000;
//		mem[74] = 16'b0010100100000000;
//		mem[75] = 16'b0011000000110101;
//		mem[76] = 16'b0000110000110011;
//		mem[77] = 16'b0000000000000000;
//		mem[78] = 16'b0000000000000000;
//		mem[79] = 16'b0100110000000101;
//		mem[80] = 16'b0010000100000001;
//		mem[81] = 16'b0000100000100000;
//		mem[82] = 16'b0011000000100000;
//		mem[83] = 16'b0100100011110101;
//		mem[84] = 16'b0010000100000001;
//		mem[85] = 16'b0000100000011110;
//		mem[86] = 16'b0011000000011110;
//		mem[87] = 16'b0100100000000010;
//		mem[88] = 16'b0100100010101101;
//		mem[89] = 16'b0100100011100101;
//		mem[90] = 16'b0100100011000000;
//  end
  
  
  reg  csb0_reg;
  reg  web0_reg;
  reg [ADDR_WIDTH-1:0]  addr0_reg;
  reg [DATA_WIDTH-1:0]  din0_reg;
  reg [DATA_WIDTH-1:0]  dout0;

  // All inputs are registers
  always @(posedge clk0)
  begin
    csb0_reg = csb0;
    web0_reg = web0;
    addr0_reg = addr0;
    din0_reg = din0;
//    #(T_HOLD) dout0 = 16'bx;
//    if ( !csb0_reg && web0_reg && VERBOSE )
//      $display($time," Reading %m addr0=%b dout0=%b",addr0_reg,mem[addr0_reg]);
//    if ( !csb0_reg && !web0_reg && VERBOSE )
//      $display($time," Writing %m addr0=%b din0=%b",addr0_reg,din0_reg);
  end


  // Memory Write Block Port 0
  // Write Operation : When web0 = 0, csb0 = 0
  always @ (negedge clk0)
  begin : MEM_WRITE0
    if ( !csb0_reg && !web0_reg ) begin
        mem[addr0_reg][15:0] = din0_reg[15:0];
    end
  end

  // Memory Read Block Port 0
  // Read Operation : When web0 = 1, csb0 = 0
  always @ (negedge clk0)
  begin : MEM_READ0
    if (!csb0_reg && web0_reg)
//       dout0 <= #(DELAY) mem[addr0_reg];
		 dout0 <= mem[addr0_reg];
  end

endmodule
