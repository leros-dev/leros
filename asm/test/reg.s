// register access

	loadi 0x34
	loadhi 0x12
	store r2
	loadi 0xff
	loadhi 0x00
	store r3
	loadi 0x01
	load r3
	and r2
	subi 0x34
	scall 0
