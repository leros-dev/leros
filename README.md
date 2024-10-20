
![CI](https://github.com/leros-dev/leros/actions/workflows/scala.yml/badge.svg)

# Leros, a Tiny Processor Core

An FPGA optimized tiny processor core for embedded systems.
See more documentation on the [website for Leros](https://leros-dev.github.io/).

This repository contains two versions of Leros: the initial 16-bit version in VHDL and
the redesign of 16/32/64-bit version in Chisel. The two versions are in the same spirit,
but not compatible. The initial version exposes the pipeline to the programmer.
The initial version is supported by a small Java runtime (muvium).

The new version is pipeline agnostic and also has a slightly different ISA. The new
version is supported by a C compiler (LLVM port.)

Note that this project includes a submodule. Therefore, you need to update with:

```
git submodule init
git submodule update
```

## Testing

The tests are in the `asm/test` directory. The tests are written in ScalaTest and
run with the SBT build tool. To run the tests, use:

```  
sbt test
```

or use `make`

```
make test
```

The assembler tests are written to exit with 1 in the accumulator if they pass.


## Questions

See also [TODO.md](TODO.md).

 * Is load immediate sign extending? Is the high form sign extending?
   * Yes, it is. Needs tests and documentation.
 * What else is sign extending?
 * byte order:
   * Morten's simulator (and presumable compiler) is little-endian
   * Martin's ISA simulator is little-endian (not yet)
   * Patmos is probably big-endian
   * Internet is big-endian
   * RISC-V is little-endian

## Implementation Notes (Leros 16)

Pipeline discussion:

 * Maybe decoding and sign extension into fetch
 * Play around with the pipeline registers when (1) more complete ALU and (2) longer programs (= block RAM)
 * Several different pipeline organizations might be interesting
 
### Fmax

We target a very high fmax in an FPGA to compensate for the more instructions
execute.

Initial measurement on DE2-115 with almost no function and debug output (e.g., accu)
in registers: 184 MHz. Could be better.
