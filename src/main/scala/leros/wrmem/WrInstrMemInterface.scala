package leros.wrmem

import chisel3._
import chisel3.util._

class WrInstrMemInterface(memAddrWidth : Int) extends Bundle() {
    val pc = Input(UInt(memAddrWidth.W))
    val instr = Output(UInt(16.W))
}