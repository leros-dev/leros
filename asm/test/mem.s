// memory test: byte loads
// This memory test writes into the register file area (if it is mapped to memory), maybe OK just for the test

    // r1 contains sum of individual tests (hopefully not cancelling each other out)
    loadi 0x00
    store r1

	loadi 0x10
	ldaddr
	loadi 0x12
	loadhi 0x34
	loadh2i 0x56
	loadh3i 0x78
	stind 0
	loadi 0x01
	ldind 0
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	subi 0x34
	andi 0xff
	add r1
	store r1

	ldindb 0
	subi 0x12
	add r1
	store r1

	ldindb 1
	subi 0x34
	add r1
	store r1

	ldindb 2
	subi 0x56
	add r1
	store r1

	ldindb 3
	subi 0x78
	add r1
	store r1

	loadi 0x12
	ldaddr

	ldindb 0
	subi 0x56
	add r1
	store r1

	ldindb 1
	subi 0x78
	add r1
	store r1

	ldindb -1
	subi 0x34
	add r1
	store r1

	ldindb -2
	subi 0x12
	add r1
	store r1

	load r1
	scall 0
