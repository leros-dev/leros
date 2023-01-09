package leros

import chisel3._
import leros.util.Assembler


/**
 * Data memory.
 */
class DataMem(memAddrWidth: Int) extends Module {
  val io = IO(new Bundle {
    val rdAddr = Input(UInt(memAddrWidth.W))
    val rdData = Output(UInt(32.W))
    val wrAddr = Input(UInt(memAddrWidth.W))
    val wrData = Input(UInt(32.W))
    val wr = Input(Bool())
    val wrMask = Input(UInt(4.W))
  })

  // TODO: use enable mask
  val mem = SyncReadMem(1 << memAddrWidth, UInt(32.W))
  io.rdData := mem.read(io.rdAddr)
  when (io.wr) {
    mem.write(io.wrAddr, io.wrData)
  }
  /*
  // for debugging
  val mem = Reg(Vec(4, UInt(32.W)))
  io.rdData := mem(RegNext(io.rdAddr))
  when(io.wr) {
    mem(io.wrAddr) := io.wrData
  }
  printf("DataMem: %x %x %x %x %x\n", io.wrAddr, io.wrData, io.wr, io.rdAddr, io.rdData)

   */
}
