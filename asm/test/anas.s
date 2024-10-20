// this is Anas

start:
    loadi 1     // 0x2101
    brnz A      // 0xA003
    loadi 0xFF  // 0x21FF
    br start    // 0x8FFD


A:
    loadi 1     // 0x2100
    scall 0     // 0xFF00