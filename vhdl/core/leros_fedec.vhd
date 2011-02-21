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
	decode.acc_en <= '1';
	decode.op <= op_add;
	decode.sel_imm <= '0';
	
	case imout.data(15 downto 12) is
		when "0000" =>
			decode.op <= op_add;
		when "0001" =>
			decode.op <= op_sub;
		when "0010" =>
			decode.op <= op_load;
		when "0011" =>
		when "0100" =>
			decode.op <= op_add;
			decode.sel_imm <= '1';
		when "0101" =>
			decode.op <= op_sub;
			decode.sel_imm <= '1';
		when "0110" =>
			decode.op <= op_load;
			decode.sel_imm <= '1';
		when others =>
			decode.acc_en <= '0';
	end case;
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