# TODO

 * Assemler test for each instruction
   * Get an overview of what is implemented (and add to TODO)
 * Fix cosimulation issues
 * Get rid oc code duplication in Decode
 * Memory: read in first state, write in second. Is this how we want to do it?
 * Take a note on: semantic changed to have opd in words, halfword, or bytes, but address in bytes
 * Looks like Morten's simulator/compiler sign extends ldindb/h, Check it
   * and document it
 * Explore Tjark's test generation (with cosimulation)
 * Use the C compiler
 * Run C compiler tests
 * Are half word load stores used in the compiler?
   * Any instruction not used by theb compiler 
 * Accu byte enables
 * load/store byte indirect
 * Does subi sign extend? Do we need a subi? We could use addi with neg. values
 * Get a simple sequential version done
   * Pipelined version follows
 * Run Morten's C test programs
 * gcc test suit as in Patmos
 * Shouldn't a cross-compiler have a prefix? Such as leros-clang?

## Documentation

 * Get text from paper into handbook, including the instruction figure

## Missing Instructions (tests and/or implementation)

* add (test)
* sub (test)
* and (test)
* or (test)
* xor (test)
* xori (test)
* loadi (test for sign extension, also high versions)
* out
* in
* jal
* ldind (offset broken now, as it counts for ldindb, test missing)
* ldindh
* stind (offset broken now, as it counts for ldindb, test missing)
* stindb
* stindh
* br
* brz
* brnz
* brp
* brn

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