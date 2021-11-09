// memory test

    // r1 contains sum of individual tests (hopefully not cancelling each other out)
    loadi 0x00
    store r1

	loadi 0x10
	ldaddr
	loadi 0x12
	loadhi 0x34
	stind 0
	loadi 0x01
	ldind 0
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	subi 0x34
	add r1
	store r1

    // TODO: byte enable in hardware (memory and accumulator)
	// ldindbu 0
	// subi 0x12
	// add r1
	// store r1

	// ldindbu 1
	// subi 0x34
	// add r1
	// store r1


	load r1
	scall 0
