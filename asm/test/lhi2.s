// test loadhi does not change low immediate
    loadi 0x12
	loadhi 0x0
	subi 0x12
	addi 1
	scall 0
