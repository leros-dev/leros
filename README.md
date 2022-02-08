[![Build Status](https://travis-ci.com/leros-dev/leros.svg?branch=master)](https://travis-ci.com/leros-dev/leros)

# My work on Leros
The goal of my work is implementing Leros on ASIC and making it control simple module (in this case, a LoRa Module).
## Load program to Leros from FLASH
  * DM and IM are replaced by SRAM (Synthesizable and PnR on ASIC):
    * DM: 1 read + 1 write port, 16-bit width, 8-bit depth (256B).
    * IM: 1 read/write port, 16-bit width, 9-bit depth (512B).
  * The FLASH programmer:
    * Using 8-MB FLASH on DE2-115 (if using different FLASH, modify this programmer)
    * A LOADER is implemented to read from FLASH (after programmed), then write to IM.
    * FLASH programmer and LOADER's reset is separated from Leros reset.

## TODO:
  * Add SPI peripheral to control LoRa Module.
  * Synthesis and PnR everything in ASIC.

# Leros, a Tiny Processor Core

An FPGA optimized tiny processor core for embedded systems.
See more documentation on the github.io website for [Leros](https://leros-dev.github.io/).

This repository contains two versions of Leros: the initial 16-bit version in VHDL and
the redesign of 16/32/64-bit version in Chisel. The two versions are in the same spirit,
but not compatible. The initial version exposes the pipeline to the programmer.
The initial version is supported by a small Java runtime (muvium).

The new version is pipeline agnostic and also has a slightly different ISA. The new
version is supported by a C compiler (LLVM port.)

## Questions

 * Is load immediate sign extending?
 * What is sign extending?
 * byte order:
   * Morten's simulator (and presumable compiler) is little-endian
   * Martin's ISA simulator is little-endian
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
