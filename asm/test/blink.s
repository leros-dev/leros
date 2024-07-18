// work in progress
// branch does not yet work!!!

    loadi 0
    scall 0
    store r2
loop:
    loadi 127
// loadhi ...
l1:
    subi 1
    nop
    brnz l1


    loadi 0
    store r5
start:
	loadi 0
//     loadhi 2
	store r0
ll1:
    loadi 127
// loadhi 255
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

	load r5
	addi 3
	store r5
	// loadi 0
	stind 0

	// loadi 1
    // nop
    // brnz start

	loadi 0
//  loadhi 2
	store r0
ll3:
	loadi 255
// loadhi 255
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

	loadi 2
	stind 0

	loadi 1
	nop
	nop
	nop
	brnz start

	loadi 2
	nop
	nop
	nop

    loadi 0
	    scall 0

