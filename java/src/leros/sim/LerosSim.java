/*
   Copyright 2011 Martin Schoeberl <masca@imm.dtu.dk>,
                  Technical University of Denmark, DTU Informatics. 
   All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are met:

      1. Redistributions of source code must retain the above copyright notice,
         this list of conditions and the following disclaimer.

      2. Redistributions in binary form must reproduce the above copyright
         notice, this list of conditions and the following disclaimer in the
         documentation and/or other materials provided with the distribution.

   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER ``AS IS'' AND ANY EXPRESS
   OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
   OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN
   NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY
   DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
   (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
   LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
   ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
   THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

   The views and conclusions contained in the software and documentation are
   those of the authors and should not be interpreted as representing official
   policies, either expressed or implied, of the copyright holder.
 */

package leros.sim;

import java.io.*;

/**
 * A crude simulation of Leros. Pipeline effects (branch delay slots) are
 * currently ignored.
 * 
 * @author Martin Schoeberl
 * 
 */
public class LerosSim {

	String fname;
	// no real use of dstDir
	String dstDir = "./";
	String srcDir = "./";
	boolean log;

	LerosIO io;

	final static int IM_SIZE = 1024;
	final static int DM_SIZE = 1024;
	char im[] = new char[IM_SIZE];
	char dm[] = new char[DM_SIZE];
	int progSize = 0;

	int accu;
	int pc;

	public LerosSim(LerosIO io, String[] args) {

		this.io = io;
		
		String s = System.getProperty("log");
		if (s!=null) {
			log = s.equals("true");
		}
		
		srcDir = System.getProperty("user.dir");
		dstDir = System.getProperty("user.dir");
		processOptions(args);
		if (!srcDir.endsWith(File.separator))
			srcDir += File.separator;
		if (!dstDir.endsWith(File.separator))
			dstDir += File.separator;

		BufferedReader instr = null;
		try {
			instr = new BufferedReader(new FileReader(srcDir + fname));
			String l;
			while ((l = instr.readLine()) != null) {
				im[progSize] = (char) Integer.parseInt(l);
				++progSize;
			}
			System.out.println("Instruction memory " + (progSize * 2)
					+ " bytes");
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (instr != null) {
				try {
					instr.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

		}
	}

	private boolean processOptions(String clist[]) {
		boolean success = true;

		for (int i = 0; i < clist.length; i++) {
			if (clist[i].equals("-s")) {
				srcDir = clist[++i];
			} else if (clist[i].equals("-d")) {
				dstDir = clist[++i];
			} else {
				fname = clist[i];
			}
		}

		return success;
	}

	
/*
// Is this additional rule needed to get all values up to instruction?
instr returns [int opc] :
	simple {$opc = $simple.opc;} |
	alu register {$opc = $alu.value + $register.value;} |
	alu imm_val {$opc = $alu.value + $imm_val.value + 0x0100;} |
	branch {$opc = $branch.opc;} |
	io imm_val {$opc = $io.value + $imm_val.value;}
;

simple returns [int opc] :
	'nop'    {$opc = 0x0000;} |
	'shr'    {$opc = 0x1000;}
	;

alu returns [int value]: 
	'add'    {$value = 0x0800;} |
	'sub'    {$value = 0x0c00;} |
	'load'   {$value = 0x2000;} |
	'and'    {$value = 0x2200;} |
	'or'     {$value = 0x2400;} |
	'xor'    {$value = 0x2600;} |
	'loadh'  {$value = 0x2800;} |
	'store'  {$value = 0x3000;} // TODO: no immediate version
	;

io returns [int value]: 
	'out'    {$value = 0x3800;} |
	'in'     {$value = 0x3c00;}
	;

branch returns [int opc]
	: 'brnz' ID
	{
		int off = 0;
		if (pass2) {
			Integer v = (Integer) symbols.get($ID.text);
        		if ( v!=null ) {
				off = v.intValue();
		        } else {
				throw new Error("Undefined label "+$ID.text);
			}
			off = off - pc;
			// TODO test maximum offset
			// at the moment 8 bits offset
			off &= 0xff;
		}
		$opc = 0x4800 + off;
	};

	
	
 */
	/**
	 * Run the simulation.
	 * First instruction is not executed as in the hardware.
	 */
	public void simulate() {

		pc = 1;
		for (;;) {
			
			int next_pc = pc+1;
			if (pc>=progSize) {
				return;
			}
			int instr = im[pc];
			int val;
			// immediate value
			if ((instr & 0x0100)!=0) {
				// sign extension?
				val = instr & 0xff;
			} else {
				val = dm[instr & 0xff];
			}
		
			
			switch (instr & 0xfe00) {
			case 0x0000: // nop
				break;
			case 0x0800: // add
				accu += val;
				break;
			case 0x0c00: // sub
				accu -= val;
				break;
			case 0x1000: // shr
				accu >>>= 1;
				break;
			case 0x2000: // load --- sign extension or not?
				accu = val;
				break;
			case 0x2200: // and
				accu &= val;
				break;
			case 0x2400: // or
				accu |= val;
				break;
			case 0x2600: // xor
				accu ^= val;
				break;
			case 0x2800: // loadh
				accu = (accu & 0xff) + (val << 8);
				break;
			case 0x3000: // store
				dm[val] = (char) accu;
				break;
			case 0x3800: // out
				io.write(instr & 0xff, accu);
				break;
			case 0x3c00: // in
				accu = io.read(instr & 0xff);
				break;
			case 0x4800: // brnz
				if (accu != 0) {
					// at the moment just 8 bits offset (sign extension)
					next_pc = pc + ((instr<<24)>>24);
				}
				break;
//			case 7: // I/O (ld/st indirect)
//				break;
//			case 8: // brl
//				break;
//			case 9: // br conditional
//				break;
			default:
				throw new Error("Instruction "+instr+" at address "+pc+" not implemented");
			}
			
			// keep it in 16 bit
			accu &= 0xffff;
			
			if (log) {
				System.out.println("PC: "+pc+ " accu: "+accu);
			}
			pc = next_pc;;
		}
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		if (args.length < 1) {
			System.out.println("usage: java LerosSim [-s srcDir] filename");
			System.exit(-1);
		}
		LerosSim ls = new LerosSim(new LerosIO(), args);
		ls.simulate();
	}

}
