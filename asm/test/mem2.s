// memory test: byte stores
// This memory test writes into the register file area, maybe OK just for the test

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
	loadi 0x1a
	stindb 0

	loadi 0x01
	ldindbu 0
	subi 0x1a
    add r1
    store r1

// TODO: load from 2nd byte will fail

    // ldindbu 1
    // subi 0x34
    // add r1
    // store r1


	load r1
	scall 0
