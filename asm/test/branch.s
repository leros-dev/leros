//
// test of branch conditions - should never branch to error
//
// TODO: missing test for backward branch (was an error in the assembler)

    br testbr
    loadi 1
    scall 0
testbr:
	loadi 1
	loadi 0
	loadi 7 // branch condition
	brnz brnzok
	br error
brnzok:
	loadi 127
	loadi 0
	brz brzok
	br error
brzok:
	loadi 0
	loadi -1
	brn brnok
	br error
brnok:
	loadi -1
	loadi 5
	brp brpok
	br error
brpok:
	br brok
	br error
brok:
    loadi 1
    scall 0
error:
    loadi 2
    scall 0

