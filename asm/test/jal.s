// Test jal

    loadi <function
    loadhi >function
    jal r3
    load r1
    subi 5
    scall 0

function:
    loadi 5
    store r1
    load r3
    jal r3