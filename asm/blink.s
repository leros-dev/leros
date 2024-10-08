// Blinking LEDs

// We need 2.500.000 iterations for a 100 ms tick
//

// set the IO base address to 0x0f00 (in bytes)
    loadhi 0x0f
    store r2
    ldaddr r2
// the counter
    loadi 0
    store r2
loop:

    loadi 255
    loadhi 255
    loadh2i 38
l1:
    subi 1
    brnz l1  // one loop iteration is 4 cc
    load r2
    stind 0
    addi 1
    store r2
    br loop