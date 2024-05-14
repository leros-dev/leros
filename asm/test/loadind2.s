// test loadind offstes

    // r1 contains sum of individual tests (hopefully not cancelling each other out)
    loadi 0x00
    store r1

	loadi 0x20
	ldaddr
	loadi 0x78
	stindb 0
	loadi 0x56
	stindb 1
	loadi 0x34
	stindb 2
	loadi 0x12
	stindb 3

	ldind 0


    load r1
	scall 0