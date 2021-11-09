// test loadhi does not change low immediate
    loadi 0x12
	loadhi 0x0
	subi 0x12
	scall 0
