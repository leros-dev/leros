// signe extend test

	loadi 0x10
	ldaddr
	loadi 0x40
	addi 0x40
	stind 0
	loadi 0x01
	ldindb 0
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	shr
	andi 0xff
	shr
	subi 0x7f
	scall 0
