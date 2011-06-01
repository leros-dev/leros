// A small hello world


// first instruction is not executed
	nop
// second instruction is executed twice


start:
	load 76
	out 1
	load 101
	out 1
	load 114
	out 1
	load 111
	out 1
	load 115
	out 1
	load 13
	out 1
	load 10
	out 1

	branch start

