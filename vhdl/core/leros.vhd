--
--  Copyright 2011 Martin Schoeberl <masca@imm.dtu.dk>,
--                 Technical University of Denmark, DTU Informatics. 
--  All rights reserved.
--
--  License: TBD, BSD style requested, decision pending.
--
-- top level of the Leros CPU
-- That should be instanziated in a FPGA specific top level


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.leros_types.all;

entity leros is
	port  (
		clk : in std_logic;
		reset : in std_logic;
		out_port : out std_logic_vector(15 downto 0)
	);
end leros;

architecture rtl of leros is

	signal fdin : fedec_in_type;
	signal fdout : fedec_out_type;
	
	signal exout : ex_out_type;

	signal outreg1, outreg2, outreg3 : std_logic_vector(15 downto 0);

begin

-- relax all I/O pin pathes
process(clk)
begin

	-- plain register assignments generate something strange 
	if rising_edge(clk) then
		out_port <= outreg3;
		outreg3 <= not outreg2;
		outreg2 <= outreg1;
	end if;
end process;

	fdin.accu <= exout.accu;
	
	outreg1 <= exout.outp;
	
	fd: entity work.leros_fedec port map (
		clk, reset, fdin, fdout
	);
	ex: entity work.leros_ex port map(
		clk, reset, fdout, exout
	);
	
end rtl;