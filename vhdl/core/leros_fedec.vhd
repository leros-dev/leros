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
	
	signal alu_op, br_op, nop : std_logic;
	
	signal pc, pc_next : unsigned(IM_BITS-1 downto 0);
	signal ir, immr : std_logic_vector(15 downto 0);
	signal decode : decode_type;

begin

	imin.rdaddr <= std_logic_vector(pc_next);
	
	im: entity work.leros_im port map(
		clk, reset, imin, imout
	);

	-- what is that used for?
	dout.data <= imout.data;
	dout.imm <= immr;
	
-- decode process
process(br_op, din, immr, imout, pc)
begin
	-- some defaults
	decode.op <= op_and;
	decode.al_ena <= '1';
	decode.ah_ena <= '1';
	decode.log_add <= '0';
	decode.add_sub <= '0';
	decode.sel_imm <= '0';
	decode.outp <= '0';
	
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
			decode.al_ena <= '0';
			decode.ah_ena <= '0';
		when "0010" =>   -- just a temporal out instruction
			decode.al_ena <= '0';
			decode.ah_ena <= '0';
			decode.outp <= '1';
		when "1111" =>   -- just a temporal nop
			nop <= '1';
			decode.al_ena <= '0';
			decode.ah_ena <= '0';
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
	
	-- branch
	pc_next <= pc+1;
	-- perhaps move the zf decetion into this stage to avoid
	-- a critical path in ex
	if br_op='1' and din.zf='0' then
		-- now just do a bnz
		pc_next <= pc + unsigned(resize(signed(imout.data(7 downto 0)), IM_BITS));
	end if;
	
end process;
	

process(clk, reset)
begin
	if reset='1' then
		pc <= (others => '0');
	elsif rising_edge(clk) then
		pc <= pc_next;
		ir <= imout.data;
		dout.dec <= decode;
--		if decode.add_sub='1' then
			immr <= std_logic_vector(resize(signed(imout.data(7 downto 0)), 16));
--		else
--			immr(7 downto 0) <= imout.data(7 downto 0);
--			immr(15 downto 0) <= (others => '0');
--		end if;
	end if;
end process;

end rtl;