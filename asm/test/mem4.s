// half word tests

    loadi 0x00
    store r1

	loadi 0x70
	store r2
	ldaddr r2
	loadi 0x12
	loadhi 0x34
	loadh2i 0x56
	loadh3i 0x78
	stind 0
	loadi 0xcd

	ldindh 0
	andi 0xff
	subi 0x12
	add r1
    store r1

	ldindh 0
	sra
	sra
	sra
	sra
	sra
	sra
	sra
	sra
	andi 0xff
	subi 0x34
	add r1
    store r1

    ldindh 1
    andi 0xff
    subi 0x56
	add r1
    store r1

    loadi 0xcc
    stindb 1
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
	andi 0x0f
	subi 0x0f
	add r1
    store r1

    loadi 0
    stind 0
    loadi 0x89
    loadhi 0x34
    stindh 0
    loadi 0x21
    loadhi 0x56
    stindh 1
    loadi 0x1a
    ldindb 0
    subi 0x89
    andi 0xff
	add r1
    store r1
    ldindb 1
    subi 0x34
	add r1
    store r1
    ldindb 2
    subi 0x21
	add r1
    store r1
    ldindb 3
    subi 0x56
	add r1
    store r1


	load r1
	addi 1
    scall 0
