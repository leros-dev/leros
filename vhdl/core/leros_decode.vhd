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
		dec : out decode_type
	);
end leros_decode;

architecture rtl of leros_decode is

begin

process(instr)
begin
	-- some defaults
	dec.op <= op_ld;
	dec.al_ena <= '0';
	dec.ah_ena <= '0';
	dec.log_add <= '0';
	dec.add_sub <= '0';
	dec.sel_imm <= '0';
	dec.store <= '0';
	dec.outp <= '0';
	
	-- used in decode, not in ex
	dec.br_op <= '0';
	dec.loadh <= '0';
	
	-- log = '0'
	dec.log_add <= '0';
	-- add = '0'
	dec.add_sub <= '0';	
	
	dec.add_sub <= not instr(2);

	dec.sel_imm <= instr(0);
	-- bit 1 and 2 partially unused
	case instr(7 downto 3) is
		when "00000" =>		-- nop
		when "00001" =>		-- add, sub
			dec.al_ena <= '1';
			dec.ah_ena <= '1';
			dec.log_add <= '1';
		when "00010" =>		-- reserved
			null;
		when "00011" =>		-- reserved for shr
			null;
		when "00100" =>		-- 
			dec.al_ena <= '1';
			dec.ah_ena <= '1';
		when "00101" =>		-- loadh
			dec.loadh <= '1';
			dec.ah_ena <= '1';
		when "00110" =>		-- store
			dec.store <= '1';
		when "00111" =>		-- I/O (ld/st indirect)
			dec.outp <= '1';
		when "01000" =>		-- brl
			null;
		when "01001" =>		-- branch conditional
			dec.br_op <= '1';
		when others =>
			null;
	end case;

	case instr(2 downto 1) is
		when "00" =>
			dec.op <= op_ld;
		when "01" =>
			dec.op <= op_and;
		when "10" =>
			dec.op <= op_or;
		when "11" =>
			dec.op <= op_xor;
		when others =>
			null;
	end case;
end process;


-- process(instr)
-- begin
-- 	-- some defaults
-- 	decode.op <= op_and;
-- 	decode.al_ena <= '0';
-- 	decode.ah_ena <= '0';
-- 	decode.log_add <= '0';
-- 	decode.add_sub <= '0';
-- 	decode.sel_imm <= '0';
-- 	decode.store <= '0';
-- 	decode.outp <= '0';
-- 	
-- 	-- used in decode, not in ex
-- 	decode.br_op <= '0';
-- 	decode.loadh <= '0';
-- 	
-- 	-- first level decode
-- 	case instr(7 downto 4) is
-- 		when "0000" =>
-- 			decode.al_ena <= '1';
-- 			decode.ah_ena <= '1';
-- 		when "0001" =>
-- 			decode.br_op <= '1';
-- 		when "0010" =>   -- just a temporal out instruction
-- 			decode.outp <= '1';
-- 		when "0100" =>   -- store - a waste
-- 			decode.store <= '1';
-- 		when "0101" =>   -- waste for load high byte
-- 			decode.loadh <= '1';
-- 			decode.ah_ena <= '1';
-- 		when "1111" =>   -- just a temporal nop
-- 		when others =>
-- 			null;
-- 	end case;
-- 
-- 	-- second level decode	
-- 	-- logic
-- 	case instr(1 downto 0) is
-- 		when "00" =>
-- 			decode.op <= op_ld;
-- 		when "01" =>
-- 			decode.op <= op_and;
-- 		when "10" =>
-- 			decode.op <= op_or;
-- 		when "11" =>
-- 			decode.op <= op_xor;
-- 		when others =>
-- 			null;
-- 	end case;
-- 	
-- 	decode.sel_imm <= instr(3);
-- 	decode.log_add <= instr(2);
-- 
-- 	-- arithmetics - one bit (8) left for shift...
-- 	decode.add_sub <= instr(1);	
-- end process;

end rtl;