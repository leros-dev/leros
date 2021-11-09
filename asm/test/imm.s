// Some immediate tests
	loadi 0x78
	loadhi 0x56
	loadh2i 0x35
	loadh3i 0x12
	store r1
	loadi 0xff
	loadh2i 0x01
	and r1
	store r2
	loadi 0xff
	loadh2i 0x00
	and r2
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	shr
    subi 0x56
	scall 0
