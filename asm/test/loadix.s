// Test various load immediate instructions
// Collect result in r2

    loadi 0
    store r2

    // sign extension?
    loadi -1
    sra
    sra
    sra
    sra
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
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    andi 0x80
    sra
    subi 0x40
    add r2
    store r2

    // clear upper bytes after sign extension
    loadi -1
    loadhi 0x00
    sra
    subi 0x7f
    add r2
    store r2

    // 3rd byte
    loadh2i 0x12
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    subi 0x12
    add r2
    store r2

    // 3rd byte sign extension
    loadh2i 0xff
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    andi 0x80
    sra
    subi 0x40
    add r2
    store r2

    // 4th byte
    loadh3i 0x34
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    sra
    subi 0x34
    add r2
    store r2

    // final result
    loadi 1
    load r2
    scall 0
    scall 0xFF