
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
	
	signal exin : ex_in_type;
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

	exin.imm <= fdout.imm;
	exin.dec <= fdout.dec;
	exin.wren <= fdout.data(10);
	exin.dm_rdaddr <= fdout.data(7 downto 0); -- this is the smae as imm at the moment
	exin.dm_wraddr <= fdout.data(15 downto 8);
	
	fdin.accu <= exout.accu;
	fdin.zf <= exout.zf;
	
	outreg1 <= exout.outp;
	
	fd: entity work.leros_fedec port map (
		clk, reset, fdin, fdout
	);
	ex: entity work.leros_ex port map(
		clk, reset, exin, exout
	);
	
end rtl;