// Test code

// first instruction is not executed
	nop
// second instruction is executed twice

// conditional branch has one cycle delay
// for the condition
start:
	load 1
	load 0
	load 0
	load 7 // branch condidition
	load 0
	brnz start
	load 127



