// Test various load immediate instructions
// Collect result in r2

    loadi 0
    store r2

    // sign extension?
    loadi -1
    shr
    shr
    shr
    shr
    andi 0x0f
    subi 0x0f
    add r2
    store r2

    // high immediate
    loadhi 0x12
    andi 0xff
    add r2
    store r2

    // high immediate sign extension
    loadhi 0xff
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    andi 0x80
    shr
    subi 0x40
    add r2
    store r2

    // clear upper bytes after sign extension
    loadi -1
    loadhi 0x00
    shr
    subi 0x7f
    add r2
    store r2

    // 3rd byte
    loadh2i 0x12
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    subi 0x12
    add r2
    store r2

    // 3rd byte sign extension
    loadh2i 0xff
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    andi 0x80
    shr
    subi 0x40
    add r2
    store r2

    // 4th byte
    loadh3i 0x34
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    shr
    subi 0x34
    add r2
    store r2

    // final result
    loadi 1
    load r2
    scall 0