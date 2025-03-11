package leros

import chisel3._
import chisel3.util._
import leros.State._
import leros.shared.Constants._

/**
 * Leros top level.
 *
 * Sequential implementation with two states.
 */
class LerosTop(prog: String, size: Int = 32, memAddrWidth: Int = 8) extends Module {

  val io = IO(new Bundle {
    // val dout = Output(UInt(32.W))
    // val sw = Input(UInt(4.W))
    val led = Output(UInt(8.W))
  })

  val leros = Module(new Leros)
  // Fetch from instruction memory with an address register that is reset to 0
  val instrMem = Module(new InstrMem(memAddrWidth, prog))
  // Data memory, including the register memory
  // read in fetch, write in execute
  val dataMem = Module(new DataMem((memAddrWidth), false))

  instrMem.io <> leros.imemIO
  dataMem.io <> leros.dmemIO

  // TODO: LED and decoding for it
  val ledReg = RegInit(0.U(8.W))
  io.led := ledReg
  // IO is now mapped to 0x0f00, but wrAddr counts in 32-bit words
  when((leros.dmemIO.wrAddr === 0x03c0.U) &&  leros.dmemIO.wr) {
    ledReg := leros.dmemIO.wrData(7, 0)
    dataMem.io.wr := false.B
  }
}

object LerosTop extends App {
  emitVerilog(new LerosTop(args(0)), Array("--target-dir", "generated"))
}