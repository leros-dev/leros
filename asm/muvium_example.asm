// Muvium Leros AOT Compiler
// Java Source: Hello
// first instruction is not executed
	nop // 
// second instruction is executed twice
// ******************************************************
// MEMORY MODEL
// ******************************************************
// Static Fields R5 to R24
// FRAME ROOT
// Local Refs R25 to R29
// Local Lits R30 to R49
// Operand Stack R50 to R65
// FRAME METHODCALL
// Local Refs R66 to R70
// Local Lits R71 to R90
// Operand Stack R91 to R106
// ******************************************************
// run()
	branch run
Start:
run:
Label15080:
// PushIntegerLiteral
	load 72 // Load Constant 
	store r51 // Store to Local
// wr( address, value ) 
	//(peephole)load r51 // Native.wr address=3
	out 3
// peep_iconst_istore_n
	load 0 // Load Constant 
	store r30 // Store to Local
Label15104:
// ILOAD
	//(peephole)load r30 // Load local literal slot 
	store r51 // Push onto Stack
// PushIntegerLiteral
	load 0 // Load Int 16bit Constant LSB
	loadh 125 // Load Int 16bit Constant MSB 
	store r53 // Push Literal Int onto Stack
// if_icmpge
	//(peephole)load r53 // load previus topmost
	sub r51 // sub topmost
	nop // wait branch delay1
	nop // wait branch delay2
	brn Label15128 // if greater than
// peep_iconst_istore_n
	load 0 // Load Constant 
	store r32 // Store to Local
Label15138:
// ILOAD
	//(peephole)load r32 // Load local literal slot 
	store r51 // Push onto Stack
// PushIntegerLiteral
	load 200 // Load Int 16bit Constant LSB
	loadh 0 // Load Int 16bit Constant MSB 
	store r53 // Push Literal Int onto Stack
// if_icmpge
	//(peephole)load r53 // load previus topmost
	sub r51 // sub topmost
	nop // wait branch delay1
	nop // wait branch delay2
	brn Label15162 // if greater than
// IINC
	load 1 // Inc local by 
	add r32 // Add to local 
	store r32 // Store Back to Local 
	branch Label15138 // GOTO
Label15162:
// IINC
	load 1 // Inc local by 
	add r30 // Add to local 
	store r30 // Store Back to Local 
	branch Label15104 // GOTO
Label15128:
// PushIntegerLiteral
	load 87 // Load Constant 
	store r51 // Store to Local
// wr( address, value ) 
	//(peephole)load r51 // Native.wr address=3
	out 3
// peep_iconst_istore_n
	load 0 // Load Constant 
	store r30 // Store to Local
Label15206:
// ILOAD
	//(peephole)load r30 // Load local literal slot 
	store r51 // Push onto Stack
// PushIntegerLiteral
	load 0 // Load Int 16bit Constant LSB
	loadh 125 // Load Int 16bit Constant MSB 
	store r53 // Push Literal Int onto Stack
// if_icmpge
	//(peephole)load r53 // load previus topmost
	sub r51 // sub topmost
	nop // wait branch delay1
	nop // wait branch delay2
	brn Label15224 // if greater than
// peep_iconst_istore_n
	load 0 // Load Constant 
	store r32 // Store to Local
Label15230:
// ILOAD
	//(peephole)load r32 // Load local literal slot 
	store r51 // Push onto Stack
// PushIntegerLiteral
	load 200 // Load Int 16bit Constant LSB
	loadh 0 // Load Int 16bit Constant MSB 
	store r53 // Push Literal Int onto Stack
// if_icmpge
	//(peephole)load r53 // load previus topmost
	sub r51 // sub topmost
	nop // wait branch delay1
	nop // wait branch delay2
	brn Label15248 // if greater than
// IINC
	load 1 // Inc local by 
	add r32 // Add to local 
	store r32 // Store Back to Local 
	branch Label15230 // GOTO
Label15248:
// IINC
	load 1 // Inc local by 
	add r30 // Add to local 
	store r30 // Store Back to Local 
	branch Label15206 // GOTO
Label15224:
	branch Label15080 // GOTO
