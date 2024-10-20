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
	sra
	sra
	sra
	sra
	sra
	sra
	sra
	sra
    subi 0x56
    addi 1
	scall 0
