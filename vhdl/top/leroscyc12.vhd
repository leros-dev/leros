--
--  Copyright 2011 Martin Schoeberl <masca@imm.dtu.dk>,
--                 Technical University of Denmark, DTU Informatics. 
--  All rights reserved.
--
--  License: TBD, BSD style requested, decision pending.
--
--	leroscyc12.vhd
--
--	top level for cycore borad with EP1C12
--
--	2011-02-20	creation
--
--


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.sc_pack.all;


entity leros_top is

generic (
	ram_cnt		: integer := 2		-- clock cycles for external ram
);

port (
	clk		: in std_logic;
--
--	serial interface
--
	ser_txd			: out std_logic;
	ser_rxd			: in std_logic;
	ser_ncts		: in std_logic;
	ser_nrts		: out std_logic;

--
--	watchdog
--
	wd		: out std_logic;
	freeio	: out std_logic;

--
--	two ram banks
--
-- 	rama_a		: out std_logic_vector(17 downto 0);
-- 	rama_d		: inout std_logic_vector(15 downto 0);
-- 	rama_ncs	: out std_logic;
-- 	rama_noe	: out std_logic;
-- 	rama_nlb	: out std_logic;
-- 	rama_nub	: out std_logic;
-- 	rama_nwe	: out std_logic;
-- 	ramb_a		: out std_logic_vector(17 downto 0);
-- 	ramb_d		: inout std_logic_vector(15 downto 0);
-- 	ramb_ncs	: out std_logic;
-- 	ramb_noe	: out std_logic;
-- 	ramb_nlb	: out std_logic;
-- 	ramb_nub	: out std_logic;
-- 	ramb_nwe	: out std_logic;

--
--	I/O pins of board
--
	io_b	: inout std_logic_vector(10 downto 1);
	io_l	: inout std_logic_vector(20 downto 1);
	io_r	: inout std_logic_vector(20 downto 1);
	io_t	: inout std_logic_vector(6 downto 1)
);
end leros_top;

architecture rtl of leros_top is


--
--	Signals
--
	signal clk_int			: std_logic;

	signal int_res			: std_logic;
	signal res_cnt			: unsigned(2 downto 0) := "000";	-- for the simulation

	attribute altera_attribute : string;
	attribute altera_attribute of res_cnt : signal is "POWER_UP_LEVEL=LOW";

--
--	leros connections
--
	signal sc_mem_out		: sc_out_type;
	signal sc_mem_in		: sc_in_type;
	signal sc_io_out		: sc_out_type;
	signal sc_io_in			: sc_in_type;

--
--	IO interface
--
	signal wd_out			: std_logic;

	-- for generation of internal reset

-- memory interface

	signal ram_addr			: std_logic_vector(17 downto 0);
	signal ram_dout			: std_logic_vector(31 downto 0);
	signal ram_din			: std_logic_vector(31 downto 0);
	signal ram_dout_en		: std_logic;
	signal ram_ncs			: std_logic;
	signal ram_noe			: std_logic;
	signal ram_nwe			: std_logic;
	
	signal outp 			: std_logic_vector(15 downto 0);
	
begin

	-- let's go for 200 MHz ;-)
	-- but for now 100 MHz is enough
	pll_inst : entity work.pll generic map(
		multiply_by => 5,
		divide_by => 1
	)
	port map (
		inclk0	 => clk,
		c0	 => clk_int
	);

--
--	internal reset generation
--	should include the PLL lock signal
--

process(clk_int)
begin
	if rising_edge(clk_int) then
		if (res_cnt/="111") then
			res_cnt <= res_cnt+1;
		end if;

		int_res <= not res_cnt(0) or not res_cnt(1) or not res_cnt(2);
	end if;
end process;

	wd <= wd_out;

	cpu: entity work.leros
		port map(clk_int, int_res,
			outp);
			
process(clk_int)
begin

	if rising_edge(clk_int) then
--		ram_addr(15 downto 0) <= outp;
		wd_out <= outp(0);
	end if;
end process;

-- 	io: entity work.scio 
-- 		port map (clk_int, int_res,
-- 			sc_io_out, sc_io_in,
-- 			irq_in, irq_out, exc_req,
-- 
-- 			txd => ser_txd,
-- 			rxd => ser_rxd,
-- 			ncts => ser_ncts,
-- 			nrts => ser_nrts,
-- 			wd => wd_out,
-- 			l => io_l,
-- 			r => io_r,
-- 			t => io_t,
-- 			b => io_b
-- 			-- remove the comment for RAM access counting
-- 			-- ram_cnt => ram_count
-- 		);

-- 	scm: entity work.sc_mem_if
-- 		generic map (
-- 			ram_ws => ram_cnt-1,
-- 			rom_ws => rom_cnt-1
-- 		)
-- 		port map (clk_int, int_res,
-- 			sc_mem_out, sc_mem_in,
-- 
-- 			ram_addr => ram_addr,
-- 			ram_dout => ram_dout,
-- 			ram_din => ram_din,
-- 			ram_dout_en	=> ram_dout_en,
-- 			ram_ncs => ram_ncs,
-- 			ram_noe => ram_noe,
-- 			ram_nwe => ram_nwe,
-- 
-- 			fl_a => fl_a,
-- 			fl_d => fl_d,
-- 			fl_ncs => fl_ncs,
-- 			fl_ncsb => fl_ncsb,
-- 			fl_noe => fl_noe,
-- 			fl_nwe => fl_nwe,
-- 			fl_rdy => fl_rdy
-- 
-- 		);
-- 
-- 	process(ram_dout_en, ram_dout)
-- 	begin
-- 		if ram_dout_en='1' then
-- 			rama_d <= ram_dout(15 downto 0);
-- 			ramb_d <= ram_dout(31 downto 16);
-- 		else
-- 			rama_d <= (others => 'Z');
-- 			ramb_d <= (others => 'Z');
-- 		end if;
-- 	end process;

-- 	ram_din <= ramb_d & rama_d;
	
-- remove the comment for RAM access counting
-- ram_count <= ram_ncs;


--
--	To put this RAM address in an output register
--	we have to make an assignment (FAST_OUTPUT_REGISTER)
--
-- 	rama_a <= ram_addr;
-- 	rama_ncs <= ram_ncs;
-- 	rama_noe <= ram_noe;
-- 	rama_nwe <= ram_nwe;
-- 	rama_nlb <= '0';
-- 	rama_nub <= '0';
-- 
-- 	ramb_a <= ram_addr;
-- 	ramb_ncs <= ram_ncs;
-- 	ramb_noe <= ram_noe;
-- 	ramb_nwe <= ram_nwe;
-- 	ramb_nlb <= '0';
-- 	ramb_nub <= '0';
-- 
-- 	freeio <= 'Z';

end rtl;
