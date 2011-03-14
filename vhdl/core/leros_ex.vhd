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

-- Some fmax number with Cyclone EP1C12C6
--
--	Memory is with rdaddr in clock process, rddata combinational
--		which is the 'normal' memory configuration, but Quartus
--		adds path through logic for read during write
--	fully registered on-chip memory 256 MHz
--	only input registers, output goes to a LC register (with reset): 165 MHz
--	plus a 16-bit adder: 147 MHz
--	more in ALU + opd mux: 135 MHz
--
--	Memory with rddata in clock process, rdaddr combinational
--		what does this model in read during write? Probably the
--		old value.
--	only input registers, output goes to a LC register (with reset): 256 MHz
--	plus a 16-bit adder: 166 MHz
--	more in ALU (add/sub) and opd mux between imm and DM output: 148 MHz


entity leros_ex is
	port  (
		clk : in std_logic;
		reset : in std_logic;
		din : in fedec_out_type;
		ioin : in io_in_type;
		dout : out ex_out_type
	);
end leros_ex;

architecture rtl of leros_ex is

	-- the accu
	signal accu, opd  : unsigned(15 downto 0);
	signal log, arith, a_mux : unsigned (15 downto 0);
	
	-- the data ram
	constant nwords : integer := 2 ** DM_BITS;
	type ram_type is array(0 to nwords-1) of std_logic_vector(15 downto 0);

	-- 0 initialization is for simulation only
	-- Xilinx and Altera FPGA initialize memory blocks to 0
	signal dm : ram_type := (others => (others => '0'));
	
	signal wrdata, rddata : std_logic_vector(15 downto 0);
	signal wraddr, rdaddr : std_logic_vector(DM_BITS-1 downto 0);
	

begin

	dout.accu <= std_logic_vector(accu);
	
process(din, rddata)
begin
	if din.dec.sel_imm='1' then
		opd <= unsigned(din.imm);
	else
		-- a MUX for IO will be added
		opd <= unsigned(rddata);
	end if;
end process;

-- that's the ALU	
process(din, accu, opd, log, arith, ioin)
begin
	if din.dec.add_sub='0' then
		arith <= accu + opd;
	else
		arith <= accu - opd;
	end if;

	case din.dec.op is
		when op_ld =>
			log <= opd;
		when op_and =>
			log <= accu and opd;
		when op_or =>
			log <= accu or opd;
		when op_xor =>
			log <= accu xor opd;
		when others =>
			null;
	end case;
	
	if din.dec.log_add='0' then
		if din.dec.shr='1' then
			a_mux <= '0' & accu(15 downto 1);
		else
			if din.dec.inp='1' then
				a_mux <= unsigned(ioin.rddata);
			else
				a_mux <= log;
			end if;
		end if;
	else
		a_mux <= arith;
	end if;
		
end process;

	-- a MUX for PC (jal ?) will be added
	wrdata <= std_logic_vector(accu);
	-- a MUX for indirect read/write will be added
	wraddr <= din.imm(DM_BITS-1 downto 0);
	-- MUX for indirect read needed
	-- If DM > 256 zero extend the varidx
	rdaddr <= din.varidx(DM_BITS-1 downto 0);
	

process(clk, reset)
begin
	if reset='1' then
		accu <= (others => '0');
--		dout.outp <= (others => '0');
	elsif rising_edge(clk) then
		if din.dec.al_ena = '1' then
			accu(7 downto 0) <= a_mux(7 downto 0);
		end if;
		if din.dec.ah_ena = '1' then
			accu(15 downto 8) <= a_mux(15 downto 8);
		end if;
		-- a simple output port for the hello world example
--		if din.dec.outp='1' then
--			dout.outp <= std_logic_vector(accu);
--		end if;
	end if;
end process;

-- the data memory (DM)
-- read during write is usually undefined in an FPGA,
-- but that is not modelled
process (clk)
begin
	if rising_edge(clk) then
		-- is store overloaded?
		-- now we have only 'register' read and write
		if din.dec.store='1' then
			dm(to_integer(unsigned(wraddr))) <= wrdata;
		end if;
		rddata <= dm(to_integer(unsigned(rdaddr)));
		
	end if;
end process;

	
end rtl;