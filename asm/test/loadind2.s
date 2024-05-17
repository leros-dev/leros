// test loadind offsets

    // r1 contains sum of individual tests (hopefully not cancelling each other out)
    loadi 0x00
    store r1

	loadi 0x20
	ldaddr
	loadi 0x11
	stindb 0
	loadi 0x22
	stindb 1
	loadi 0x33
	stindb 2
	loadi 0x44
	stindb 3
	loadi 0x55
	stindb 4
	loadi 0x66
	stindb 5
	loadi 0x77
	stindb 6
	loadi 0x88
	stindb 7


	ldind 0
	andi 0xff
	subi 0x11
	add r1
    store r1

    ldind 1
    andi 0xff
    subi 0x55
    add r1
    store r1

    ldindh 0
	andi 0xff
	subi 0x11
	add r1
    store r1

    ldindh 1
	andi 0xff
	subi 0x33
	add r1
    store r1

    ldindb 3
	andi 0xff
	subi 0x44
	add r1
    store r1

    ldindb 4
	andi 0xff
	subi 0x55
	add r1
    store r1

    ldindb 7
	subi 0x88 // does sign extend immediates to negative numbers?
	andi 0xff
	add r1
    store r1

    load r1
	scall 0