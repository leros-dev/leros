// test that logic function does not sign extend
	loadi 0x34
	loadhi 0x12
	andi 0xff
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	scall 0
