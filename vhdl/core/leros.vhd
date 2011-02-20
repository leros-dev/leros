
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
		alu_in : in std_logic_vector(15 downto 0);
		alu_out : out std_logic_vector(15 downto 0)
	);
end leros;

architecture rtl of leros is

	signal ain : ex_in_type;
	signal aout : ex_out_type;
	
	signal inreg1, inreg2, inreg3a, inreg3b : std_logic_vector(15 downto 0);
	signal outreg1, outreg2, outreg3 : std_logic_vector(15 downto 0);

begin

-- relax all I/O pin pathes
process(clk)
begin

	-- plain register assignments generate something strange 
	if rising_edge(clk) then
		inreg1 <= alu_in;
		inreg2 <= not inreg1;
		inreg3a <= inreg2;
		inreg3b <= inreg2;
		alu_out <= outreg3;
		outreg3 <= not outreg2;
		outreg2 <= outreg1;
	end if;
end process;

	ain.imm <= inreg3a(7 downto 0);
	ain.op <= op_add when inreg3a(8)='0' else op_sub;
	ain.sel_imm <= inreg3a(9);
	ain.wren <= inreg3a(10);
	ain.dm_rdaddr <= inreg3b(7 downto 0);
	ain.dm_wraddr <= inreg3b(15 downto 8);
	
	outreg1 <= aout.result;
	
	c1: entity work.leros_ex port map(
		clk, reset, ain, aout
	);
	
end rtl;