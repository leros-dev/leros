// test shr
    loadi 0
    store r2

    loadi 0x01
    shr
    add r2
    store r2

    loadi 0x02
    shr
    shr
    add r2
    store r2

    loadi 0x32
    shr
    shr
    shr
    shr
    subi 0x03
    add r2
    store r2



    // final result
    loadi 1
    load r2
    scall 0