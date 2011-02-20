library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.leros_types.all;

-- fetch and decode stage

entity leros_fedec is
	port  (
		clk : in std_logic;
		reset : in std_logic;
		din : in fedec_in_type;
		dout : out fedec_out_type
	);
end leros_fedec;

architecture rtl of leros_fedec is

	signal im_din : im_in_type;
	signal im_dout : im_out_type;
	
	signal pc : unsigned(IM_BITS-1 downto 0);
	signal ir : std_logic_vector(15 downto 0);

begin

	im_din.rdaddr <= std_logic_vector(pc);
	
	im: entity work.leros_im port map(
		clk, reset, im_din, im_dout
	);

	dout.data <= im_dout.data;
	
process(clk, reset)
begin
	if reset='1' then
		pc <= (others => '0');
	elsif rising_edge(clk) then
		pc <= pc+1;
		ir <= im_dout.data;
		if im_dout.data(8)='0' then
			dout.op <= op_add;
		else
			dout.op <= op_sub;
		end if;
		
	end if;
end process;

end rtl;