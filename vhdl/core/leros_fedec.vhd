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

	signal imin : im_in_type;
	signal imout : im_out_type;
	
	signal alu_op, br_op : std_logic;
	
	signal pc, feaddr : unsigned(IM_BITS-1 downto 0);
	signal ir : std_logic_vector(15 downto 0);
	signal decode : decode_type;

begin

	imin.rdaddr <= std_logic_vector(pc);
	
	im: entity work.leros_im port map(
		clk, reset, imin, imout
	);

	dout.data <= imout.data;
	
-- decode process
process(imout.data)
begin
	-- some defaults
	decode.op <= op_and;
	decode.al_ena <= '1';
	decode.ah_ena <= '1';
	decode.log_add <= '0';
	decode.add_sub <= '0';
	decode.sel_imm <= '0';
	
	decode.al_ena <= '1';
	decode.ah_ena <= '1';
	
	-- more defaults
	alu_op <= '0';
	br_op <= '0';
	
	-- first level decode
	case imout.data(15 downto 12) is
		when "0000" =>
			alu_op <= '1';
		when "0001" =>
			br_op <= '1';
		when others =>
			null;
	end case;

	decode.sel_imm <= imout.data(11);
	decode.log_add <= imout.data(10);

	-- second level decode	
	-- logic
	case imout.data(9 downto 8) is
		when "00" =>
			decode.op <= op_ld;
		when "01" =>
			decode.op <= op_and;
		when "10" =>
			decode.op <= op_or;
		when "11" =>
			decode.op <= op_xor;
		when others =>
			null;
	end case;
	
	-- arithmetics - one bit (8) left for shift...
	decode.add_sub <= imout.data(9);
	
end process;
	

process(clk, reset)
begin
	if reset='1' then
		pc <= (others => '0');
	elsif rising_edge(clk) then
		pc <= pc+1;
		ir <= imout.data;
		dout.dec <= decode;
		dout.imm <= imout.data(7 downto 0);
		
	end if;
end process;

end rtl;