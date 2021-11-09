// test that logic function does not sign extend
	loadi 0x84
	loadhi 0x12
	loadi 0x73
	andi 0xff
    subi 0x73
	scall 0
