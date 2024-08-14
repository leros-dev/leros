Leros is little endian
Instructions are 16 bits wide. Higher byte is used to encode instruction and lower byte contains immediate, register number, branch etc. 
The programming FSM expects data over UART to be little endian also