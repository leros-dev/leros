module loader(
//system
input i_clk,
input i_rst_n,
input fl_prog_done,
//flash interface
output [22:0] fl_addr,
input [7:0] fl_data,
output fl_ce_n,
output fl_oe_n,
output fl_we_n,
output fl_rst_n,
//sram interface
output [9:0] sram_addr,
output [15:0] sram_data,
output sram_wen,
//to GPIO - indicator
output finished
);

//flash control
reg [9:0]  r_addr;
reg [15:0] r_data;
reg [3:0]  r_ctrl;
reg [7:0]  r_cnt; //do nothing to make sure output data from flash is stable

//sram control
reg r_wen;
reg [8:0] r_sram_addr;


//state machine
`define IDLE 	2'b00
`define WAIT	2'b01
`define SEND	2'b10

reg r_fl_prog_done;
wire w_fl_prog_done_rising;
reg r_finished;
reg [1:0] r_state;
reg [1:0] r_next_state;


//--------------------------------------
// Register
//--------------------------------------

always @(posedge i_clk) begin
	if (~i_rst_n) begin
	  r_fl_prog_done <= 1'b0;
	end else begin
	  r_fl_prog_done <= fl_prog_done;
	end
end

always @(posedge i_clk) begin
	if (~i_rst_n) begin
	  r_finished <= 1'b0;
	end else begin
	  if(&r_addr) r_finished <= 1'b1;
	  else 		  r_finished <= r_finished;
	end
end

always @(posedge i_clk) begin
	if (~i_rst_n) begin
	  r_addr <= 10'd0;
	end else begin
	  if((r_cnt==8'd128) |(r_state[1] & ~r_next_state[1])) r_addr <= r_addr + 1'b1; //increase when state changes from SEND to WAIT or get the first 8-bit data
	  else 		  						                 r_addr <= r_addr;
	end
end

always @(posedge i_clk) begin
	if (~i_rst_n) begin
	  r_sram_addr <= 9'd0;
	end else begin
	  if((r_cnt==8'd0) & (r_state[1] & ~r_next_state[1])) r_sram_addr <= r_sram_addr + 1'b1; //increase when state changes from SEND to WAIT or get the first 8-bit data
	  else 		  						                 r_sram_addr <= r_sram_addr;
	end
end


always @(posedge i_clk) begin
	if (~i_rst_n) begin
	  r_data <= 16'd0;
	end else begin
	  if(~r_cnt[7]) r_data[15:8] <= fl_data; //half of counter time is for each 8bit of data
	  else       r_data[7:0]  <= fl_data;
	end
end

always @(posedge i_clk) begin
	if (~i_rst_n | (r_state == `SEND)) begin
	  r_cnt <= 8'd0;
	end else begin
	  if(r_state == `WAIT)  r_cnt <= r_cnt + 1'b1;
	  else 					r_cnt <= r_cnt;
	end
end

//--------------------------------------
// State machine
//--------------------------------------


always @(posedge i_clk) begin
	if (~i_rst_n) begin
	  r_state <= `IDLE;
	end else begin
	  r_state <= r_next_state;
	end
end

always @(*) begin
	case(r_state)
		`IDLE: begin
			if(w_fl_prog_done_rising) r_next_state = `WAIT; //start when FLASH is programmed
			else r_next_state = `IDLE;
			r_ctrl = 4'b1111;
			r_wen = 1'b1;
		end
		
		`WAIT: begin
			if(&r_cnt) r_next_state = `SEND; //change to send when store full 16b data
			else	 r_next_state = `WAIT;
			r_ctrl = 4'b1100;
			r_wen = 1'b1;
		end
		
		`SEND: begin
			if(&r_addr) r_next_state = `IDLE; //finished 
			else r_next_state = `WAIT; //need only 1 clock cycle to store to SRAM
			r_ctrl = 4'b1100;
			r_wen = 1'b0;
		end
		default: begin
			r_next_state = `IDLE;
			r_ctrl = 4'b1111;
			r_wen = 1'b1;
		end
	endcase
end

assign w_fl_prog_done_rising = ~r_fl_prog_done & fl_prog_done;
assign fl_addr = {13'd0,r_addr};
assign fl_ce_n = r_ctrl[0];
assign fl_oe_n = r_ctrl[1];
assign fl_we_n = r_ctrl[2];
assign fl_rst_n = r_ctrl[3];

assign sram_addr = r_sram_addr;
assign sram_data = r_data;
assign sram_wen = r_wen;
assign finished = r_finished;
endmodule
