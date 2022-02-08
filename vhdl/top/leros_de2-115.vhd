--
--  Copyright 2011 Martin Schoeberl <masca@imm.dtu.dk>,
--                 Technical University of Denmark, DTU Informatics. 
--  All rights reserved.
--
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are met:
-- 
--    1. Redistributions of source code must retain the above copyright notice,
--       this list of conditions and the following disclaimer.
-- 
--    2. Redistributions in binary form must reproduce the above copyright
--       notice, this list of conditions and the following disclaimer in the
--       documentation and/or other materials provided with the distribution.
-- 
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER ``AS IS'' AND ANY EXPRESS
-- OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
-- OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN
-- NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY
-- DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
-- (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
-- LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
-- ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-- (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
-- THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-- 
-- The views and conclusions contained in the software and documentation are
-- those of the authors and should not be interpreted as representing official
-- policies, either expressed or implied, of the copyright holder.
-- 


--
--	leros_de2-115.vhd
--
--	top level for Altera DE2-115 board
--
--	2018-07-17	adapted from DE2-70 top level
--
--


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.leros_types.all;


entity leros_top_de2 is

port (
	clk : in std_logic;
	oLEDG : out std_logic_vector(7 downto 0);
--	ser_txd			: out std_logic;
--	ser_rxd			: in std_logic;
	--new signal--
	cpu_rst_n: in std_logic; --reset only the CPU, program in SRAM remains
	sys_rst_n: in std_logic; --reset everything, start to load from FLASH into SRAM again
	sram_write: out std_logic;
	sram_addr: out std_logic_vector(8 downto 0);
	sram_data: out std_logic_vector(15 downto 0);
	
	--To outside world--
	--Serial communication
	rs232_rxd: in std_logic;
	rs232_txd: out std_logic;
	
	--External flash interface--
	fl_addr: out std_logic_vector(22 downto 0);
	fl_dq: inout std_logic_vector(7 downto 0);
	fl_ce_n: out std_logic;
	fl_oe_n: out std_logic;
	fl_we_n: out std_logic;
	fl_wp_n: out std_logic;
	fl_rst_n: out std_logic;
	fl_ry: in std_logic;
	
	--Programming indicators
	led_r: out std_logic_vector(17 downto 0);
	hex7_n: out std_logic_vector(6 downto 0);
	hex6_n: out std_logic_vector(6 downto 0);
	hex5_n: out std_logic_vector(6 downto 0);
	hex4_n: out std_logic_vector(6 downto 0);
	hex3_n: out std_logic_vector(6 downto 0);
	hex2_n: out std_logic_vector(6 downto 0);
	hex1_n: out std_logic_vector(6 downto 0);
	hex0_n: out std_logic_vector(6 downto 0);
   --SRAM loaded--
	SRAM_loaded: out std_logic --active High
);
end leros_top_de2;

architecture rtl of leros_top_de2 is

	--Connect to external FLASH, create rs232 interface to program the FLASH
	component my_boot_flash is
	port(
	i_clk: in std_logic;
	i_rst_n: in std_logic;
	prog_done: out std_logic;
	--Serial communication
	rs232_rxd: in std_logic;
	rs232_txd: out std_logic;
	--FLASH memory
	fl_addr: out std_logic_vector(22 downto 0);
	fl_dq: inout std_logic_vector(7 downto 0); --todo change to input only for data
	fl_ce_n: out std_logic;
	fl_oe_n: out std_logic;
	fl_we_n: out std_logic;
	fl_wp_n: out std_logic;
	fl_rst_n: out std_logic;
	fl_ry: in std_logic;
	--Programming indicators--
	led_r: out std_logic_vector(17 downto 0);
	hex7_n: out std_logic_vector(6 downto 0);
	hex6_n: out std_logic_vector(6 downto 0);
	hex5_n: out std_logic_vector(6 downto 0);
	hex4_n: out std_logic_vector(6 downto 0);
	hex3_n: out std_logic_vector(6 downto 0);
	hex2_n: out std_logic_vector(6 downto 0);
	hex1_n: out std_logic_vector(6 downto 0);
	hex0_n: out std_logic_vector(6 downto 0)
	);
	end component my_boot_flash;

	--After the FLASH is programmed, read from the FLASH and write to internal SRAM
	component prog_controller is
	port (
	--system
	i_clk: in std_logic;
	i_rst_n: in std_logic;
	fl_prog_done: in std_logic;
	--Connect to FLASH read interface
	fl_addr:out std_logic_vector(22 downto 0);
	fl_data: in std_logic_vector(7 downto 0);
	fl_ce_n: out std_logic;
	fl_oe_n: out std_logic;
	fl_we_n: out std_logic;
	fl_rst_n: out std_logic;
	
	--Connect to IM write interface
	sram_addr: out std_logic_vector(8 downto 0);
	sram_data: out std_logic_vector(15 downto 0);
	sram_wen: out std_logic;
	--to GPIO - indicator loaded to SRAM
	finished: out std_logic
	);
	end component prog_controller;

	
	signal clk_int			: std_logic;
	-- for generation of internal reset
	signal int_res			: std_logic;
--	signal res_cnt			: unsigned(2 downto 0) := "000";	-- for the simulation
--	attribute altera_attribute : string;
--	attribute altera_attribute of res_cnt : signal is "POWER_UP_LEVEL=LOW";
	signal ioout : io_out_type;
	signal ioin : io_in_type;
	signal outp : std_logic_vector(15 downto 0);
	signal ser_txd: std_logic;
	signal ser_rxd: std_logic;
	
	--new signal--
	--write port to ROM--
	signal wrsram: im_in_type;
	
	--boot loader to flash connection
	signal b_addr: std_logic_vector(22 downto 0);
	signal b_ce_n: std_logic;
	signal b_oe_n: std_logic;
	signal b_we_n: std_logic;
	signal b_rst_n: std_logic;
	signal b_ry: std_logic;
	signal FLASH_loaded: std_logic;
	
	-- alias b_addr is fl_addr;
	-- alias b_data is fl_dq;
	-- alias b_ce_n is fl_ce_n;
	-- alias b_oe_n is fl_oe_n;
	-- alias b_we_n is fl_we_n;
	-- alias b_rst_n is fl_rst_n;
	-- alias b_ry is fl_ry;
	
	--controller to flash connection
	signal c_addr: std_logic_vector(22 downto 0);
	signal c_ce_n: std_logic;
	signal c_oe_n: std_logic;
	signal c_we_n: std_logic;
	signal c_rst_n: std_logic;
	signal c_sram_loaded: std_logic;
	
begin



--TODO: use 50MHz for SRAM to work
	clk_int <= clk;
	-- clk input is 50 MHz
	-- for now 100 MHz is enough
--	pll_inst : entity work.pll generic map(
--		multiply_by => 2,
--		divide_by => 1
--	)
--	port map (
--		inclk0	 => clk,
--		c0	 => clk_int
--	);


-- TODO: boot flash and flash to sram controller
boot_flash: my_boot_flash port map(
i_clk => clk_int,
i_rst_n => sys_rst_n,
prog_done => FLASH_loaded,
--Serial communication
rs232_rxd => rs232_rxd,
rs232_txd => rs232_txd,
--FLASH memory
fl_addr => b_addr,
fl_dq => fl_dq,
fl_ce_n => b_ce_n,
fl_oe_n => b_oe_n,
fl_we_n => b_we_n,
fl_wp_n => fl_wp_n,
fl_rst_n => b_rst_n,
fl_ry => b_ry,
--Programming indicators--
led_r => led_r,
hex7_n => hex7_n,
hex6_n => hex6_n,
hex5_n => hex5_n,
hex4_n => hex4_n,
hex3_n => hex3_n,
hex2_n => hex2_n,
hex1_n => hex1_n,
hex0_n => hex0_n
);

controller: prog_controller port map(
--system--
i_clk => clk_int,
i_rst_n => sys_rst_n,
fl_prog_done => FLASH_loaded,
--Connect to FLASH read interface
fl_addr => c_addr,
fl_data => fl_dq,
fl_ce_n => c_ce_n, 
fl_oe_n => c_oe_n,
fl_we_n => c_we_n,
fl_rst_n => c_rst_n,
--Connect to IM write interface
sram_addr => wrsram.wraddr,
sram_data => wrsram.wrdata,
sram_wen => wrsram.wren,
--to GPIO - indicator loaded to SRAM
finished => c_sram_loaded --active High
);

--==============================================================--
--Assignment from external to internal
--==============================================================--

sram_write <= wrsram.wren;
sram_addr <= wrsram.wraddr;
sram_data <= wrsram.wrdata;

b_ry <= fl_ry;
SRAM_loaded <= c_sram_loaded;
-- end process;

--Switch between boot loader and controller to interact with FLASH
--If FLASH is loaded or the cpu is not reseting, the controller takes the bus
--If FLASH is not loaded or the cpu is reseting, the boot loader takes the bus
process(FLASH_loaded) begin
	if(FLASH_loaded = '1') then
		fl_addr <= c_addr;
		fl_ce_n <= c_ce_n;
		fl_oe_n <= c_oe_n;
		fl_we_n <= c_we_n;
		fl_rst_n <= c_rst_n;
	else 
		fl_addr <= b_addr;
		fl_ce_n <= b_ce_n;
		fl_oe_n <= b_oe_n;
		fl_we_n <= b_we_n;
		fl_rst_n <= b_rst_n;
	end if;
end process;



-- TODO: external reset and programmer reset
process(clk_int, cpu_rst_n, c_sram_loaded) begin
	if rising_edge(clk_int) then
		if (sys_rst_n ='0' or cpu_rst_n ='0' or c_sram_loaded='0') then --hold system reset when external reset or SRAM is writing
			int_res <= '1';
		else
			int_res <= '0';
		end if;
	end if; --rising clk_int
end process;

--
--	internal reset generation
--	should include the PLL lock signal
--
--process(clk_int)
--begin
--	if rising_edge(clk_int) then
--		if (res_cnt/="111") then
--			res_cnt <= res_cnt+1;
--		end if;
--		int_res <= not res_cnt(0) or not res_cnt(1) or not res_cnt(2);
--	end if;
--end process;


	cpu: entity work.leros
		port map(clk_int, int_res, ioout, ioin, wrsram);

--	ioin.rddata(15 downto 4) <= (others => '0');
	
	ua: entity work.uart generic map (
		clk_freq => 100000000,
		baud_rate => 115200,
		txf_depth => 1,
		rxf_depth => 1
	)
	port map(
		clk => clk_int,
		reset => int_res,

		address => ioout.addr(0),
		wr_data => ioout.wrdata,
		rd => ioout.rd,
		wr => ioout.wr,
		rd_data => ioin.rddata,

		txd	 => ser_txd,
		rxd	 => ser_rxd
	);
				
process(clk_int)
begin

	if rising_edge(clk_int) then
		if ioout.wr='1' then
			outp <= ioout.wrdata;
		end if;
		oLEDG <= outp(7 downto 0);
--		ioin.rddata(3 downto 0) <= not btn_reg;
	end if;
end process;

end rtl;
