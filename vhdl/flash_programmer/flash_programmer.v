module flash_programmer(
input i_clk,
input i_rst_n,
output prog_done,
//Serial communication
input rs232_rxd,
output rs232_txd,
// flash memory
output [22:0] fl_addr,
inout [7:0] fl_dq,
output fl_ce_n,
output fl_oe_n,
output fl_we_n,
output fl_wp_n,
output fl_rst_n,
input fl_ry,
// programming indicators
output [17:0] led_r,
output [6:0] hex7_n,
output [6:0] hex6_n,
output [6:0] hex5_n,
output [6:0] hex4_n,
output [6:0] hex3_n,
output [6:0] hex2_n,
output [6:0] hex1_n,
output [6:0] hex0_n
);
//-- System
wire sys_clk;
wire sys_rst_n;
reg r_prog_done;

//-- Flash signal control
reg [22:0] r_fl_addr;			// address to Flash
reg [7:0] r_fl_data;			// data to Flash
reg [3:0] r_fl_ctrl;			// control to Flash
wire [7:0] w_fl_o_data;			// data from Flash
wire w_fl_ready;				// ready from Flash

//-- Serial communication
// receiver
reg r_ack_data;
wire w_rx_rdy;
wire [7:0] w_rx_data; //receive command data, first 7:4 used to control state machine, 3:0 for data
wire [7:0] w_tx_data; //send output data
//transmitter
reg r_tx_stb;

//-- Other functions
reg [5:0]r_str_fl_addr; //6 states of store address
reg [1:0]r_str_fl_data; //2 states of store data
reg r_str_fl_ctrl;
reg r_tx_mux;


//-- State Machine
reg [3:0] r_state;
reg [3:0] r_next_state;

`define WAIT_RX			4'd0  
`define READ_RX			4'd1
`define STR_ADDR_0		4'd2 
`define STR_ADDR_1		4'd3
`define STR_ADDR_2		4'd4
`define STR_ADDR_3		4'd5
`define STR_ADDR_4		4'd6
`define STR_ADDR_5		4'd7
`define STR_DATA_0		4'd8
`define STR_DATA_1   	4'd9
`define STR_CTRL		4'd10
`define GET_DATA		4'd11
`define GET_READY		4'd12

//--------------------------------------
// module instances
//--------------------------------------

clk_rst clk_rst_1(
.clk_in(i_clk),
.rst_in_n(i_rst_n),
.clk(sys_clk),
.rst(sys_rst_n)
);
// rcvbuf.v -- serial line receiver buffer
rcvbuf rcvbuf_1(
.clk(sys_clk),
.reset(sys_rst_n),
.read(r_ack_data), //set 1 when reading command 
.ready(w_rx_rdy), // polling ready = 0, waiting for command else  ready = 1, need to reading command
.data_out(w_rx_data[7:0]),
.serial_in(rs232_rxd)
);

// xmtbuf.v -- serial line transmitter buffer
xmtbuf xmtbuf_1(
.clk(sys_clk),
.reset(sys_rst_n),
.write(r_tx_stb), //set 1 when sending output
.ready(),
.data_in(w_tx_data[7:0]),
.serial_out(rs232_txd)
);

//--------------------------------------
// Register
//--------------------------------------

always @(posedge sys_clk) begin
	if (sys_rst_n) begin
	  r_fl_addr <= 8'd0;
	end else begin
		if(r_str_fl_addr[0]) begin 
			r_fl_addr[3:0] <= w_rx_data[3:0];//4LSB used for data
		end
		else if(r_str_fl_addr[1]) begin
			r_fl_addr[7:4] <= w_rx_data[3:0];//4LSB used for data
		end
		else if(r_str_fl_addr[2]) begin
			r_fl_addr[11:8] <= w_rx_data[3:0];//4LSB used for data
		end
		else if(r_str_fl_addr[3]) begin
			r_fl_addr[15:12] <= w_rx_data[3:0];//4LSB used for data
		end
		else if(r_str_fl_addr[4]) begin
			r_fl_addr[19:16] <= w_rx_data[3:0];//4LSB used for data
		end
		else if(r_str_fl_addr[5]) begin
			r_fl_addr[22:20] <= w_rx_data[2:0];//4LSB used for data
		end
		else r_fl_addr <= r_fl_addr;
	end
end

always @(posedge sys_clk) begin
	if (sys_rst_n) begin
	  r_fl_data <= 8'd0;
	end else begin
		if(r_str_fl_data[0]) begin
			r_fl_data[3:0] <= w_rx_data[3:0];//4LSB used for data
		end
		else if(r_str_fl_data[1]) begin
			r_fl_data[7:4] <= w_rx_data[3:0];//4LSB used for data
		end
		else r_fl_data <= r_fl_data;
	end
end

always @(posedge sys_clk) begin
	if (sys_rst_n) begin
			// ce    oe    we    rst
	  r_fl_ctrl <= {1'b1,1'b1,1'b1,1'b1};
	end else begin
		if(r_str_fl_ctrl) r_fl_ctrl <= w_rx_data[3:0];//4LSB used for data
		else r_fl_ctrl <= r_fl_ctrl;
	end
end

always @(posedge sys_clk) begin
	if (sys_rst_n) begin
	  r_prog_done <= 1'b0;
	end else begin
		if((r_fl_addr == 22'h3FF) &(~w_rx_data[2] & r_fl_ctrl[2])) r_prog_done <= 1'b1;
		else r_prog_done <= r_prog_done;
	end
end

//--------------------------------------
// State machine
//--------------------------------------

always @(posedge sys_clk) begin
	if (sys_rst_n) begin
	  r_state <= `WAIT_RX;
	end else begin
	  r_state <= r_next_state;
	end
end

always @(*) begin
	case(r_state)
		`WAIT_RX: begin
			if(~w_rx_rdy) r_next_state = `WAIT_RX;
			else r_next_state = `READ_RX;
			r_ack_data = 1'b0; //set 1 when reading command 
			r_tx_stb = 1'b0; //set 1 when sending output
			r_tx_mux = 1'b0;

			//register control signal
			r_str_fl_addr = 6'b000000; //6 states of store address
			r_str_fl_data = 2'b00; //2 states of store data
			r_str_fl_ctrl = 1'b0;
		end
	
		`READ_RX: begin
			case(w_rx_data[7:4]) //4MSB used for control state machine - this should be the same case in C code
				4'h0:  r_next_state = `STR_ADDR_0;  
				4'h1:  r_next_state = `STR_ADDR_1;
				4'h2:  r_next_state = `STR_ADDR_2;
				4'h3:  r_next_state = `STR_ADDR_3;
				4'h4:  r_next_state = `STR_ADDR_4;
				4'h5:  r_next_state = `STR_ADDR_5;
				4'h6:  r_next_state = `STR_DATA_0;
				4'h7:  r_next_state = `STR_DATA_1;
				4'h8:  r_next_state = `STR_CTRL;
				4'h9:  r_next_state = `GET_DATA;
				4'hA:  r_next_state = `GET_READY;
				default: r_next_state = `WAIT_RX;
			endcase
			r_ack_data = 1'b1; //set 1 when reading command 
			r_tx_stb = 1'b0; //set 1 when sending 
			r_tx_mux = 1'b0;
			
			//register control signal
			r_str_fl_addr = 6'b000000; //6 states of store address
			r_str_fl_data = 2'b00; //2 states of store data
			r_str_fl_ctrl = 1'b0;
		end
		
		`STR_ADDR_0: begin
			r_next_state = `WAIT_RX;
			
			r_ack_data = 1'b0; //set 1 when reading command 
			r_tx_stb = 1'b0; //set 1 when sending 
			r_tx_mux = 1'b0;
			
			//register control signal
			r_str_fl_addr = 6'b00001; //6 states of store address
			r_str_fl_data = 2'b00; //2 states of store data
			r_str_fl_ctrl = 1'b0;
		end
		
		`STR_ADDR_1: begin
			r_next_state = `WAIT_RX;
			
			r_ack_data = 1'b0; //set 1 when reading command 
			r_tx_stb = 1'b0; //set 1 when sending 
			r_tx_mux = 1'b0;
			
			//register control signal
			r_str_fl_addr = 6'b000010; //6 states of store address
			r_str_fl_data = 2'b00; //2 states of store data
			r_str_fl_ctrl = 1'b0;
		end
		
		`STR_ADDR_2: begin
			r_next_state = `WAIT_RX;
			
			r_ack_data = 1'b0; //set 1 when reading command 
			r_tx_stb = 1'b0; //set 1 when sending 
			r_tx_mux = 1'b0;
			
			//register control signal
			r_str_fl_addr = 6'b000100; //6 states of store address
			r_str_fl_data = 2'b00; //2 states of store data
			r_str_fl_ctrl = 1'b0;
		end
		
		`STR_ADDR_3: begin
			r_next_state = `WAIT_RX;
			
			r_ack_data = 1'b0; //set 1 when reading command 
			r_tx_stb = 1'b0; //set 1 when sending 
			r_tx_mux = 1'b0;
			
			//register control signal
			r_str_fl_addr = 6'b001000; //6 states of store address
			r_str_fl_data = 2'b00; //2 states of store data
			r_str_fl_ctrl = 1'b0;
		end
		
		`STR_ADDR_4: begin
			r_next_state = `WAIT_RX;
			
			r_ack_data = 1'b0; //set 1 when reading command 
			r_tx_stb = 1'b0; //set 1 when sending 
			r_tx_mux = 1'b0;
			
			//register control signal
			r_str_fl_addr = 6'b010000; //6 states of store address
			r_str_fl_data = 2'b00; //2 states of store data
			r_str_fl_ctrl = 1'b0;
		end
		
		`STR_ADDR_5: begin
			r_next_state = `WAIT_RX;
			
			r_ack_data = 1'b0; //set 1 when reading command 
			r_tx_stb = 1'b0; //set 1 when sending 
			r_tx_mux = 1'b0;
			
			//register control signal
			r_str_fl_addr = 6'b100000; //6 states of store address
			r_str_fl_data = 2'b00; //2 states of store data
			r_str_fl_ctrl = 1'b0;
		end
		
		`STR_DATA_0: begin
			r_next_state = `WAIT_RX;
			
			r_ack_data = 1'b0; //set 1 when reading command 
			r_tx_stb = 1'b0; //set 1 when sending 
			r_tx_mux = 1'b0;
			
			//register control signal
			r_str_fl_addr = 6'b000000; //6 states of store address
			r_str_fl_data = 2'b01; //2 states of store data
			r_str_fl_ctrl = 1'b0;
		end
		
		`STR_DATA_1: begin
			r_next_state = `WAIT_RX;
			
			r_ack_data = 1'b0; //set 1 when reading command 
			r_tx_stb = 1'b0; //set 1 when sending 
			r_tx_mux = 1'b0;
			
			//register control signal
			r_str_fl_addr = 6'b000000; //6 states of store address
			r_str_fl_data = 2'b10; //2 states of store data
			r_str_fl_ctrl = 1'b0;
		end
		
		`STR_CTRL: begin
			r_next_state = `WAIT_RX;
			
			r_ack_data = 1'b0; //set 1 when reading command 
			r_tx_stb = 1'b0; //set 1 when sending 
			r_tx_mux = 1'b0;
			
			//register control signal
			r_str_fl_addr = 6'b000000; //6 states of store address
			r_str_fl_data = 2'b00; //2 states of store data
			r_str_fl_ctrl = 1'b1;
		end
		
		`GET_DATA: begin
			r_next_state = `WAIT_RX;
			
			r_ack_data = 1'b0; //set 1 when reading command 
			r_tx_stb = 1'b1; //set 1 when sending 
			r_tx_mux = 1'b0;
			
			//register control signal
			r_str_fl_addr = 6'b000000; //6 states of store address
			r_str_fl_data = 2'b00; //2 states of store data
			r_str_fl_ctrl = 1'b0;
		end
		
		`GET_READY: begin
			r_next_state = `WAIT_RX;
			
			r_ack_data = 1'b0; //set 1 when reading command 
			r_tx_stb = 1'b1; //set 1 when sending 
			r_tx_mux = 1'b1;
			
			//register control signal
			r_str_fl_addr = 6'b000000; //6 states of store address
			r_str_fl_data = 2'b00; //2 states of store data
			r_str_fl_ctrl = 1'b0;
		end
	endcase
end
assign w_fl_ready = fl_ry;

assign w_tx_data = (r_tx_mux)? { 7'b0, w_fl_ready } : w_fl_o_data[7:0]; //mux output data for flash data and ready
assign w_fl_o_data = fl_dq; //flash data output mode
assign fl_dq   = (~r_fl_ctrl[3] & ~r_fl_ctrl[2] & r_fl_ctrl[1]) ? 8'hzz : r_fl_data; // if flash is in output mode, put data path to tri-state

assign fl_addr = r_fl_addr;
assign fl_ce_n = r_fl_ctrl[3];
assign fl_oe_n = r_fl_ctrl[2];
assign fl_we_n = r_fl_ctrl[1];
assign fl_wp_n = 1'b1;
assign fl_rst_n = r_fl_ctrl[0];

assign prog_done = r_prog_done;

//--------------------------------------
// programming indicators
//--------------------------------------
// programming indicators
wire [3:0] aux_addr;


assign led_r[17:7] = 14'h0000;
assign led_r[5] = w_fl_ready;
assign led_r[6] = r_prog_done;
assign led_r[4] = 1'b0; 
assign led_r[3:0] = r_fl_ctrl[3:0];
assign aux_addr[3:0] = { 1'b0, r_fl_addr[22:20] };

hexdrv hexdrv_0(
.in(r_fl_addr[3:0]),
.out(hex0_n[6:0])
);

hexdrv hexdrv_1(
.in(r_fl_addr[7:4]),
.out(hex1_n[6:0])
);

hexdrv hexdrv_2(
.in(r_fl_addr[11:8]),
.out(hex2_n[6:0])
);

hexdrv hexdrv_3(
.in(r_fl_addr[15:12]),
.out(hex3_n[6:0])
);

hexdrv hexdrv_4(
.in(r_fl_addr[19:16]),
.out(hex4_n[6:0])
);

hexdrv hexdrv_5(
.in(aux_addr),
.out(hex5_n[6:0])
);

hexdrv hexdrv_6(
.in(r_fl_data[3:0]),
.out(hex6_n[6:0])
);

hexdrv hexdrv_7(
.in(r_fl_data[7:4]),
.out(hex7_n[6:0])
);

endmodule


