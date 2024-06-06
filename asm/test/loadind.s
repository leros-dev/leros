// test sign extension of loadind

    // r1 contains sum of individual tests (hopefully not cancelling each other out)
    loadi 0x00
    store r1

	loadi 0x70
	store r2
	ldaddr r2
	loadi 0xf0
	stind 0
	loadi 0x01
	ldindb 0
	sra
	sra
	sra
	sra
	sra
	sra
	sra
	sra
	andi 0x01
	subi 0x01
	add r1
    store r1

    loadi 0x12
    loadhi 0xf0
    stind 0
    ldindh 0
	sra
	sra
	sra
	sra
	sra
	sra
	sra
	sra
	sra
	sra
	sra
	sra
	sra
	sra
	sra
	sra
	andi 0x01
	subi 0x01
	add r1
    store r1

    load r1
	scall 0