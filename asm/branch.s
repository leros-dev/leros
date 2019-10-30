//
// test of branch conditions - should never loop
//
start:
	loadi 1
	loadi 0
	loadi 7 // branch condition
	loadi 0
	brnzi brnzok
	branchi start
brnzok:
	load 127
	load 0
	brz brzok
	branch start
brzok:
	load 0
	load -1
	brn brnok
	branch start
brnok:
	load -1
	load 5
	brp brpok
	branch start
brpok:
	branch brok
	branch start
brok:
    scall 0

