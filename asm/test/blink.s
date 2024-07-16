

start:
	loadi 0
	loadhi 2
	store r0
ll1:
    loadi 255
	loadhi 255
ll2:
    subi 1
	nop
	brnz ll2
	nop
	load r0
	subi 1
	store r0
	brnz ll1	
	nop

	loadi 0
	stind 0

	loadi 0
	loadhi 2
	store r0
ll3:
	loadi 255
	loadhi 255
ll4:
	subi 1
	nop
	brnz ll4
	nop
	load r0
	subi 1
	store r0
	brnz ll3	
	nop

	loadi 1
	stind 0

	loadi 1
	nop
	brnz start

