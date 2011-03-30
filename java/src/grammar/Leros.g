//
// Grammar and lexical rules for the Leros assembler
// Start with a copy of Patmos

grammar Leros;

@header {
package leros.asm.generated;

import java.util.HashMap;
import java.util.List;

}

@lexer::header {package leros.asm.generated;}


@members {
/** Map symbol to Integer object holding the value or address */
HashMap symbols = new HashMap();
// Mapping of register names
HashMap reg = new HashMap();
int pc = 0;
int code[];
boolean pass2 = false;

static {
	// some default names for registers
	for (int i=0; i<16; ++i) {
//		reg.put("r"+i, new Integer(i));
	}
}

public static String niceHex(int val) {
	String s = Integer.toHexString(val);
	while (s.length() < 4) {
		s = "0"+s;
	}
	s = "0x"+s;
	return s;
}
}

pass1: statement+;

dump: {System.out.println(symbols);};

// Don't know how to return a simple int array :-(
pass2 returns [List mem]
@init{
	System.out.println(pc+" "+symbols);
	code = new int[pc];
	pc = 0;
	pass2 = true;
}
	: statement+ {
	$mem = new ArrayList(pc);
	for (int i=0; i<pc; ++i) {
		$mem.add(new Integer(code[i]));
	}
	}; 

statement: (label)? (directive | instruction)? (COMMENT)? NEWLINE;

label:  ID ':' {symbols.put($ID.text, new Integer(pc));};

// just a dummy example
directive: '.start';

instruction: simple | alu_reg | alu_imm | branch | io_op;

// TODO: is there a simpler way to use the $opc value
// for the individual instruction types and have one
// place to fill the array?

simple returns [int opc] : no_opd
	{
		$opc = $no_opd.value;
		System.out.println(pc+" "+niceHex($opc));
		if (pass2) { code[pc] = $opc; }
		++pc;
	};


alu_reg returns [int opc]
	: alu register
	{
		$opc = $alu.value + $register.value;
		System.out.println(pc+" "+niceHex($opc));
		if (pass2) { code[pc] = $opc; }
		++pc;
	};

alu_imm returns [int opc]
	: alu imm_val
	{
		$opc = $alu.value + $imm_val.value;
		$opc |= 0x0100;
		System.out.println(pc+" "+niceHex($opc));
		if (pass2) { code[pc] = $opc; }
		++pc;
	};

io_op returns [int opc]
	: io imm_val
	{
		$opc = $io.value + $imm_val.value;
		System.out.println(pc+" "+niceHex($opc));
		if (pass2) { code[pc] = $opc; }
		++pc;
	};


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
		if (pass2) { code[pc] = $opc; }
		++pc;
	};

// shall use register symbols form the HashMap
register returns [int value]
	: REG {$value = Integer.parseInt($REG.text.substring(1));
		if ($value<0 || $value>31) throw new Error("Wrong register name");};

imm_val returns [int value]
	: INT {$value = Integer.parseInt($INT.text);
//		if ($value<-128 || $value>127) throw new Error("Wrong immediate");};
		if ($value<-128 || $value>255) throw new Error("Wrong immediate");};

//		new Instruction("nop",   0x0000, 0, Type.NOP),
//		new Instruction("add",   0x0800, 8, Type.ALU),
//		new Instruction("sub",   0x0c00, 8, Type.ALU),
//		new Instruction("shr",   0x1000, 8, Type.ALU),
//		new Instruction("load",  0x2000, 8, Type.ALU),
//		new Instruction("and",   0x2200, 8, Type.ALU),
//		new Instruction("or",    0x2400, 8, Type.ALU),
//		new Instruction("xor",   0x2600, 8, Type.ALU),
//		new Instruction("loadh", 0x2800, 8, Type.ALU),
//		new Instruction("store", 0x3000, 8, Type.NOP),
//		new Instruction("out",   0x3800, 8, Type.IO),
//		new Instruction("in",    0x3c00, 8, Type.IO),
//		new Instruction("brnz",  0x4800, 8, Type.BRANCH),


alu returns [int value]: 
	'add'    {$value = 0x8000;} |
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

no_opd returns [int value] :
	'nop'    {$value = 0x0000;} |
	'shr'    {$value = 0x1000;}
	;


/* Lexer rules (start with upper case) */

INT :   '0'..'9'+ ;
REG: 'r' INT;
PRD: 'p' INT;
TO: '->';

ID: ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'_' | '0'..'9')*;

COMMENT: '//' ~('\n'|'\r')* ;

NEWLINE: '\r'? '\n' ;
WHITSPACE:   (' '|'\t')+ {skip();} ;

