// test loadhix
// r1 accumulates the result
    loadi 0
    store r1

    loadi 0x12
	loadhi 0x23
	loadh2i 0x45
	loadh3i 0x78
	store r2

	load r2
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	subi 0x23
	andi 0xff
	add r1
	store r1

	load r2
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	subi 0x45
	andi 0xff
	add r1
	store r1

	load r2
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	subi 0x78
	add r1
	store r1


	load r1
	scall 0
