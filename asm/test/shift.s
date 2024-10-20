// test sra
// TODO: test sign extension
    loadi 0
    store r2

    loadi 0x01
    sra
    add r2
    store r2

    loadi 0x02
    sra
    sra
    add r2
    store r2

    loadi 0x32
    sra
    sra
    sra
    sra
    subi 0x03
    add r2
    store r2



    // final result
    loadi 1
    load r2
    addi 1
    scall 0
