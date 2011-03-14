--
--  Copyright 2011 Martin Schoeberl <masca@imm.dtu.dk>,
--                 Technical University of Denmark, DTU Informatics. 
--  All rights reserved.
--
--  License: TBD, BSD style requested, decision pending.
--
-- 
-- 
--------------------------------------------------------------------------------
-- Entity: leros_types
--------------------------------------------------------------------------------
-- Copyright ... 2011
-- Filename          : leros_types.vhd
-- Creation date     : 2011-02-20
-- Author(s)         : martin
-- Version           : 1.00
-- Description       : <short description>
--------------------------------------------------------------------------------
-- File History:
-- Date         Version  Author   Comment
-- 2011-02-20   1.00     martin     Creation of File
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package leros_types is

	-- should this later go to a lerso_config package?
	constant DM_BITS : integer := 8;
	constant IM_BITS : integer := 8;

	type alu_log_type is (op_and, op_or, op_xor, op_ld);
	
	type decode_type is record
		op : alu_log_type;
		al_ena : std_logic;
		ah_ena : std_logic;
		log_add : std_logic;
		add_sub : std_logic;
		sel_imm : std_logic;
		store : std_logic;
		outp : std_logic;
		-- the following are used *in* the decode stage, not in the ex stage
		br_op : std_logic;
		loadh : std_logic;
	end record;

	type im_in_type is record
		rdaddr : std_logic_vector(IM_BITS-1 downto 0);
		wraddr : std_logic_vector(IM_BITS-1 downto 0);
		wrdata : std_logic_vector(15 downto 0);
		wren : std_logic;
	end record;

	type im_out_type is record
		data : std_logic_vector(15 downto 0);
	end record;

	type fedec_in_type is record
		accu : std_logic_vector(15 downto 0);
	end record;

	type fedec_out_type is record
		dec : decode_type;
		imm : std_logic_vector(15 downto 0);
		varidx : std_logic_vector(7 downto 0);
	end record;

-- 	type ex_in_type is record
-- 		dec : decode_type;
-- 		imm : std_logic_vector(15 downto 0);
-- 	end record;

	type ex_out_type is record
		accu : std_logic_vector(15 downto 0);
		outp : std_logic_vector(15 downto 0);
	end record;

end package;

