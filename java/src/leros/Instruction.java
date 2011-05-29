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

package leros;

import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

public class Instruction {

	public String name;
	public int opcode;
	public int opdSize;
	public Type type;
	
	enum Type {
		ALU, BRANCH, INDLDST, IO, NOP
	};

	public Instruction(String s, int opc, int ops, Type t) {
		name = s;
		opcode = opc;
		opdSize = ops;
		type = t;
	}

	private static Instruction[] ia = new Instruction[] {
		new Instruction("nop",   0x0000, 0, Type.NOP),
		new Instruction("add",   0x0800, 8, Type.ALU),
		new Instruction("sub",   0x0c00, 8, Type.ALU),
		new Instruction("shr",   0x1000, 8, Type.ALU),
		new Instruction("load",  0x2000, 8, Type.ALU),
		new Instruction("and",   0x2200, 8, Type.ALU),
		new Instruction("or",    0x2400, 8, Type.ALU),
		new Instruction("xor",   0x2600, 8, Type.ALU),
		new Instruction("loadh", 0x2800, 8, Type.ALU),
		new Instruction("store", 0x3000, 8, Type.NOP),
		new Instruction("out",   0x3800, 8, Type.IO),
		new Instruction("in",    0x3c00, 8, Type.IO),
		new Instruction("brnz",  0x4800, 8, Type.BRANCH),
	};

	public static Map<String, Instruction> map = new HashMap<String, Instruction>();
	public static Map<Integer, Instruction> imap = new TreeMap<Integer, Instruction>();

	static {
		for (int i = 0; i < ia.length; ++i) {
			map.put(ia[i].name, ia[i]);
			imap.put(ia[i].opcode, ia[i]);
		}
	}

	public static Instruction get(String name) {
		return map.get(name);
	}

	public static Instruction get(int opcode) {
		return imap.get(opcode);
	}

	/**
	 * Return immediate encoding if supported.
	 * @return
	 */
	public int setImmediate() {
		int op = opcode;
		if (opdSize==0) {
			throw new Error("Immediate not supported for "+this);			
		}
		if (type==Type.ALU) {
			op |= 0x0100;
		}
		return op;
	}

	public String toString() {
		return name;
	}
}
