package leros.shared

/*
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
 */

// Shall we keep this immediate bit in one position and do more complex decoding?
// Or would a simple table just do it?
// If we simple enumerate the 27 instructions, we would just decode 5 bits, freeing another 3 bits
// We could use this to get larger constants in, e.g. up to 15 bits. Useful?
object Constants {
  val NOP = 0x00 // useless
  val ADD = 0x08
  val ADDI = 0x09
  val SUB = 0x0c
  val SUBI = 0x0d // shall we really have a subi?
  val SHR = 0x10
  val LD = 0x20
  val LDI = 0x21
  val AND = 0x22
  val ANDI = 0x23
  val OR = 0x24
  val ORI = 0x25
  val XOR = 0x26
  val XORI = 0x27
  val LOADH = 0x29 // only immediate useful
  val ST = 0x30
  val OUT = 0x39 // is IN/OUT immediate only?
  val IN = 0x05
  val JAL = 0x40
  val BR = 0x48
  val BRZ = 0x49
  val BRNZ = 0x4a
  val BRP = 0x4b
  val BRN = 0x4c
  val LDADDR = 0x50
  val LDIND = 0x60
  val STIND = 0x70
  val SCALL = 0xff // 0 is simulator exit
}
