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
		din : in ex_in_type;
		dout : out ex_out_type
	);
end leros_ex;

architecture rtl of leros_ex is

	-- the accu
	signal res, accu, opd  : unsigned(15 downto 0);
	
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
		opd(7 downto 0) <= unsigned(din.imm);
		opd(15 downto 8) <= (others => '0');
	else
		-- a MUX for IO will be added
		opd <= unsigned(rddata);
	end if;
end process;

	-- a MUX for PC? will be added
	wrdata <= std_logic_vector(accu);
	wraddr <= din.dm_wraddr;
	rdaddr <= din.dm_rdaddr;
	
process(din, accu, opd)
begin
	case din.dec.op is
		when op_load =>
			res <= opd;
		when op_add =>
			res <= accu + opd;
		when op_sub =>
			res <= accu - opd;
		when others =>
			null;
	end case;
end process;

process(clk, reset)
begin
	if reset='1' then
		accu <= (others => '0');
	elsif rising_edge(clk) then
		if din.dec.acc_en = '1' then
			accu <= res;
		end if;
	end if;
end process;

-- the data memory (DM)
-- read during write is usually undefined in an FPGA,
-- but that is not modelled
process (clk)
begin
	if rising_edge(clk) then
		if din.wren='1' then
			dm(to_integer(unsigned(wraddr))) <= wrdata;
		end if;
		rddata <= dm(to_integer(unsigned(rdaddr)));
		
	end if;
end process;

	
end rtl;