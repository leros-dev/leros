# TODO

 - [ ] Get an overview of what is implemented (and add missing to TODO)
 - [x] Change tests to end with a 1 as OK
 - [ ] Fix cosimulation issues, still an issue with mem.s (now disabled)
 - [x] Change to arithmetic shift
 - [x] Have the Leros simulator as a submodule
 - [x] Use the simulator in GitHub actions (does not compile)
 - [x] Get GitHub CI green
 - [ ] Restructure with one state per instruction type (like in old CA books)
 - [ ] Decide on where the documentation is:
   - README here
   - Handbook on Leros
   - Leros web page
 - [x] Clarify and decide on the implementation of `ldaddr`
   - Morten loads form `Rn`, Martin from `A` - fixed now to `Rn`
 - Morten's simulator uses a single memory for all (code and data), but a dedicated register file
   - Loads .bin programs at address 0 
    - [x] Rewrite the test code for this
    - [ ] Write in the documentation about the different options
 - [ ] Have a writable instruction memory (for Edu4Chip)
   - [ ] Plus a small FSM to download via serial port and deassert reset
     - Poor man's JTAG
 - [ ] Implementation and assembler test for each instruction
   - [x] scall
   - [ ] add (test)
   - [ ] sub (test)
   - [ ] and (test)
   - [ ] or (test)
   - [ ] xor (test)
   - [ ] xori (test)
   - [ ] loadi (test for sign extension, also high versions)
   - [ ] out - needed?
   - [ ] in - needed?
   - [x] jal
   - [x] ldind
   - [x] ldindh
   - [x] ldindb/ldindh does sign extension
   - [ ] stind (offset broken now, as it counts for ldindb, test missing)
   - [ ] stindb
   - [ ] stindh
   - [x] br (test)
   - [x] fix backward branch
 - [ ] Check if write in Chisel/Verilog is not through a register
    * wondering on timing and layout in Quartus
 - [ ] Get rid of code duplication in Decode
 - [x] Do memory mapped IO
 - [ ] Be able to simulate source in asm
 - [x] Setup FPGA (Nexys A7)
   - [x] Use chipdesign1 for synthesis, OpenOCD for configuration
 - [x] get a blinking LED running
   - [x] move it out of test to avoid breaking CI
 - [ ] Memory: read in first state, write in second. Is this how we want to do it?
 - [ ] Take a note on: semantic changed to have opd in words, halfword, or bytes, but address in bytes
 - [ ] Looks like Morten's simulator/compiler sign extends ldindb/h, Check it
   - [ ] and document it
 - [ ] Explore Tjark's test generation (with cosimulation)
 - [ ] Use the C compiler 
 - [ ] Run C compiler tests 
 - [ ] Are half word load and stores used in the compiler? 
 - [ ] Any instruction not used by the compiler? 
 - [ ] load/store byte indirect 
 - [ ] Does subi sign extend? Do we need a subi? We could use addi with neg. values 
 - [x] Get a simple sequential version done 
 - [ ] Pipelined version follows after sequential 
 - [ ] Run Morten's C test programs 
 - [ ] gcc test suit as in Patmos
 - [ ] Shouldn't a cross-compiler have a prefix? Such as leros-clang?

## Documentation

 * Get text from paper into handbook, including the instruction figure
 * Or in the web page

## List of Instructions to be Tested

```aidl
+--------+----------+
|000010-0| add      |
|000010-1| addi     |
|000011-0| sub      |
|000011-1| subi     |
|00010---| shr      |
|00011---| -        |
|00100010| and      |
|00100011| andi     |
|00100100| or       |
|00100101| ori      |
|00100110| xor      |
|00100111| xori     |
|001110-?| out      |
|000001-?| in       |
|01000---| jal      |
|01001---| -        |
+--------+----------+
```

## Tested Instructions

```aidl
+--------+----------+
|00000---| nop      |
|00100000| load     |
|00100001| loadi    |
|00101001| loadhi   |
|00101010| loadh2i  |
|00101011| loadh3i  |
|00110---| store    |
|01010---| ldaddr   |
|01100-00| ldind    |
|01100-01| ldindb   |
|01100-10| ldindh   |
|01110-00| stind    |
|01110-01| stindb   |
|01110-10| stindh   |
|1000nnnn| br       |
|1001nnnn| brz      |
|1010nnnn| brnz     |
|1011nnnn| brp      |
|1100nnnn| brn      |
|11111111| scall    |
+--------+----------+
```
## Semantic Questions

 * Do add/sub immediate sign extend? I guess so.
 * Logic immediate operations shall not sign extend