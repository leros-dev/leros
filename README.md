# Leros, a Tiny Processor Core

An FPGA optimized tiny processor core for embedded systems.
See more documentation on the github.io website for [Leros](https://leros-dev.github.io/).


## Implementation Notes

Pipeline discussion:

 * Maybe decoding and sign extension into fetch
 * Play around with the pipeline registers when (1) more complete ALU and (2) longer programs (= block RAM)
 * Several different pipeline organizations might be interesting
 
### Fmax

We target a very high fmax in an FPGA to compensate for the more instructions
execute.

Inital measurement on DE2-115 with almost no function and debug output (e.g., accu)
in registers: 184 MHz. Could be better.
