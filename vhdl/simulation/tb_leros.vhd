--
--  Copyright 2011 Martin Schoeberl <masca@imm.dtu.dk>,
--                 Technical University of Denmark, DTU Informatics. 
--  All rights reserved.
--
--  License: TBD, BSD style requested, decision pending.
--
--
--	leros_tb.vhd
--
--	top level for simulation
--
--	2011-02-21	creation
--
--


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- use work.sc_pack.all;


entity tb_leros is

end tb_leros;

architecture rtl of tb_leros is

	signal clk : std_logic := '1';
	signal reset : std_logic := '1';
	signal outp : std_logic_vector(15 downto 0);
	
begin

--	100 MHz clock		
process
begin
   wait for 5 ns; clk  <= not clk;
end process;
-- reset
process
begin
	wait for 15 ns;
	reset <= '0';
	wait;
end process;
	

	cpu: entity work.leros
		port map(clk, reset,
			outp);
			

end rtl;
