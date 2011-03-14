--
--  Copyright 2011 Martin Schoeberl <masca@imm.dtu.dk>,
--                 Technical University of Denmark, DTU Informatics. 
--  All rights reserved.
--
--  License: TBD, BSD style requested, decision pending.
--
--	leros_de2-70.vhd
--
--	top level for Altera DE2-70 board
--
--	2011-02-20	creation
--
--


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.leros_types.all;
use work.sc_pack.all;


entity leros_top_de2 is

port (
	clk : in std_logic;
	oLEDG : out std_logic_vector(7 downto 0);
	iKEY : in std_logic_vector(3 downto 0);	
	ser_txd			: out std_logic;
	ser_rxd			: in std_logic
);
end leros_top_de2;

architecture rtl of leros_top_de2 is

	signal clk_int			: std_logic;

	-- for generation of internal reset
	signal int_res			: std_logic;
	signal res_cnt			: unsigned(2 downto 0) := "000";	-- for the simulation

	attribute altera_attribute : string;
	attribute altera_attribute of res_cnt : signal is "POWER_UP_LEVEL=LOW";

	signal ioout : io_out_type;
	signal ioin : io_in_type;

	signal outp : std_logic_vector(15 downto 0);
	signal btn_reg : std_logic_vector(3 downto 0);
	
	
begin

	-- clk input is 50 MHz
	-- for now 100 MHz is enough
	pll_inst : entity work.pll generic map(
		multiply_by => 2,
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


	cpu: entity work.leros
		port map(clk_int, int_res, ioout, ioin);

	ioin.rddata(15 downto 4) <= (others => '0');
				
process(clk_int)
begin

	if rising_edge(clk_int) then
		if ioout.wr='1' then
			outp <= ioout.wrdata;
		end if;
		oLEDG <= outp(7 downto 0);
		btn_reg <= iKEY;
		ioin.rddata(3 downto 0) <= not btn_reg;
	end if;
end process;

end rtl;
