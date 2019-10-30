// test that logic function does not sign extend
// TODO: moved to lognosign, use this test for more immediate tests, after reg works
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
