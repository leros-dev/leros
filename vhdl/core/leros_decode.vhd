--
--  Copyright 2011 Martin Schoeberl <masca@imm.dtu.dk>,
--                 Technical University of Denmark, DTU Informatics. 
--  All rights reserved.
--
--  License: TBD, BSD style requested, decision pending.
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.leros_types.all;

-- decode logic

entity leros_decode is
	port  (
		instr : in std_logic_vector(7 downto 0);
		decode : out decode_type
	);
end leros_decode;

architecture rtl of leros_decode is

begin

process(instr)
begin
	-- some defaults
	decode.op <= op_and;
	decode.al_ena <= '0';
	decode.ah_ena <= '0';
	decode.log_add <= '0';
	decode.add_sub <= '0';
	decode.sel_imm <= '0';
	decode.store <= '0';
	decode.outp <= '0';
	
	-- used in decode, not in ex
	decode.br_op <= '0';
	decode.loadh <= '0';
	
	-- first level decode
	case instr(7 downto 4) is
		when "0000" =>
			decode.al_ena <= '1';
			decode.ah_ena <= '1';
		when "0001" =>
			decode.br_op <= '1';
		when "0010" =>   -- just a temporal out instruction
			decode.outp <= '1';
		when "0100" =>   -- store - a waste
			decode.store <= '1';
		when "0101" =>   -- waste for load high byte
			decode.loadh <= '1';
			decode.ah_ena <= '1';
		when "1111" =>   -- just a temporal nop
		when others =>
			null;
	end case;

	-- second level decode	
	-- logic
	case instr(1 downto 0) is
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
	
	decode.sel_imm <= instr(3);
	decode.log_add <= instr(2);

	-- arithmetics - one bit (8) left for shift...
	decode.add_sub <= instr(1);	
end process;

end rtl;