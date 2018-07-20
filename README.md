# Leros, a Tiny Processor Core

An FPGA optimized tiny processor core for utility functions
(e.g., SW UART). The challenge is to get the resources below
500 LC and use just 2 RAM blocks. The processor is named after
the Greek island [Leros](https://en.wikipedia.org/wiki/Leros)
where the architecture was designed.

A start of a [TODO list](TODO.md)

Leros is documented in following two publications:

1. Martin Schoeberl.
[Leros: A Tiny Microcontroller for FPGAs](http://www.jopdesign.com/doc/leros.pdf).
In Proceedings of the 21st International Conference on Field Programmable Logic and Applications (FPL 2011), Chania, Crete, Greece, September 2011.
2. James Caska and Martin Schoeberl.
[Java dust: How small can embedded Java be?](http://www.jopdesign.com/doc/lerosjvm.pdf)
In Proceedings of the 9th International Workshop on Java Technologies for Real-Time and Embedded Systems (JTRES 2011), York, UK, ACM, September 2011.

## Architecture

Leros is an accumulator machine with a register file. Memory is accessed
via indirect load and store instructions.

## Instruction Set Architecture

The instructions of Leros can be categorized into following types:

 * ALU operation with the accumulator and an immediate
 * ALU operation with the accumulator and a register
 * Load and store
 * Indirect load and store
 * Conditional branches
 * Jump and link
 * Shift right
 * Input and output

Encoding:

Instructions are 16 bits wide. The higher byte is used to encode the
instruction, the lower byte contains either an immediate value, a
register number, or a branch offset.

```
+--------+--------+
|iiiiiiii|nnnnnnnn|
+--------+--------+
```

For example `00001001.00000010` is an add immediate instruction that
adds 2 to the accumulator, where `00001000.00000011` adds the content
of R3 to the accumulator.

Not all instruction bits are currently used (unused are marked with `-`).
Bit 0 selects between immediate and using a register. The following list
is the complete instruction set.


```
+--------+----------+
|00000--i| nop      |
|000010-i| add      |
|000011-i| sub      |
|00010--i| shr      |
|00011--i| unused   |
|0010000i| load     |
|0010001i| and      |
|0010010i| or       |
|0010011i| xor      |
|00101--i| loadh    |
|00110--i| store    |
|001110-i| out      |
|000001-i| in       |
|01000---| jal      |
|01001000| br       |
|01001001| brz      |
|01001010| brnz     |
|01001011| brp      |
|01001100| brn      |
|01010---| ldaddr   |
|01100---| load ind |
|01110---| store ind|
+--------+----------+
```

Comments:

`loadh` makes only sense for immediate values.
For 32 bits we just need two more immediate loads, could simply by as follows:

```
+--------+----------+
|0010100i| loadh    |
|0010101i| loadh2   |
|0010110i| loadh3   |
+--------+----------+
```

Can easily be extended to 64 bits when ignoring the immediate bit.
Load function from ALU could be dropped.

Load address and following load/store should be emitted as pair as they are
dependedent. Possible interrupts should be disabled between those two instructions.


## Leros Versions and Compilers

### Current Version

The initial version of Leros was designed as a 16-bit accumulator
machine and written in VHDL. Besides writing assembly programs
a Java JVM for microcontroller has been ported to support Leros.
Also a software simulator written in Java is available.

### Future Version

To provide a reasonable target for C programs we will extend Leros
to 32 bits and rewrite the hardware description in Chisel.
We will try to make Leros to be configurable being 16 or 32 bits.
LLVM will be adapted for Leros32 and feedback from this compiler
backend may result in changes in the instruction set.
This may break the compatibility with the VHDL version of Leros
and the Java compiler.

We aim to provide enough documentation and simulators so that this
version can be used in teaching of basic computer architecture.
