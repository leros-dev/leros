	nop
l0:	load 0
	sub 1
l1:	sub 1
	nop
	brnz l1
	nop
	load 1
	out 0
	load 0
	sub 1
l2:	sub 1
	nop
	brnz l2
	nop
	load 0
	out 0
	load 1
	nop
	brnz l0
