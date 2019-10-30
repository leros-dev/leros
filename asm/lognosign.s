// test that logic function does not sign extend
	loadi 0x84
	loadhi 0x12
	andi 0xff
	// FIXME: the following does not give 0, correct?
    // subi 0x84
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
	scall 0
