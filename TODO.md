# TODO

 * Assemler test for each instruction
   * Get an overview of what is implemented (and add to TODO)
 * Accu byte enables
 * load/store byte indirect
 * Does subi sign extend? Do we need a subi? We could use addi with neg. values
 * Get a simple sequential version done
   * Pipelined version follows
 * Co-simulation setup (also against Morten's simulation)
 * Run Morten's C test programs
 * Constraint random testing (Tjark is working on it)
 * gcc test suit as in Patmos
 * Shouldn't a cross compiler have a prefix? Such as leros-clang?

## Documentation

 * Get text from paper into handbook, including the instruction figure

## List of Instructions to be Tested

```aidl
+--------+----------+
|000010-0| add      |
|000010-1| addi     |
|000011-0| sub      |
|000011-1| subi     |
|00010---| shr      |
|00011---| -        |
|00100000| load     |
|00100010| and      |
|00100011| andi     |
|00100100| or       |
|00100101| ori      |
|00100110| xor      |
|00100111| xori     |
|00110---| store    |
|001110-?| out      |
|000001-?| in       |
|01000---| jal      |
|01001---| -        |
|01010---| ldaddr   |
|01100--0| loadind  |
|01100--1| loadindbu|
|01110--0| storeind |
|01110--1| storeindb|
|1000nnnn| br       |
|1001nnnn| brz      |
|1010nnnn| brnz     |
|1011nnnn| brp      |
|1100nnnn| brn      |
|11111111| scall    |
+--------+----------+
```

## Tested Instructions

```aidl
+--------+----------+
|00000---| nop      |
|00100000| loadi    |
|00101001| loadhi   |
|00101010| loadh2i  |
|00101011| loadh3i  |
+--------+----------+
```
## Semantic Questions

 * Load immediate does not sign extend. Is this a good idea?
 * Do add/sub immediate sign extend? I guess so.
 * Logic immediate operations shall not sign extend