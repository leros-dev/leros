package leros

import chisel3._
import leros.util.Assembler


class DataMemIO(val memAddrWidth: Int) extends Bundle {
  val rdAddr = Input(UInt(memAddrWidth.W))
  val rdData = Output(UInt(32.W))
  val wrAddr = Input(UInt(memAddrWidth.W))
  val wrData = Input(UInt(32.W))
  val wr = Input(Bool())
  val wrMask = Input(UInt(4.W))
}

/**
 * Data memory.
 */
class DataMem(memAddrWidth: Int, debugMem: Boolean = false) extends Module {
  val io = IO(new DataMemIO(memAddrWidth))

  val entries = 1 << memAddrWidth
  val wrVec = Wire(Vec(4, UInt(8.W)))
  val wrMask = Wire(Vec(4, Bool()))
  for (i <- 0 until 4) {
    wrVec(i) := io.wrData(i * 8 + 7, i * 8)
    wrMask(i) := io.wrMask(i)
  }
  val rdVec = Wire(Vec(4, UInt(8.W)))

  if (debugMem) {
    val memReg = RegInit(VecInit(Seq.fill(entries)(VecInit(Seq.fill(4)(0.U(8.W))))))
    rdVec := memReg(RegNext(io.rdAddr))
    when (io.wr) {
      for (i <- 0 until 4) {
        when (wrMask(i)) {
          memReg(io.wrAddr)(i) := wrVec(i)
        }
      }
    }
  } else {
    val mem = SyncReadMem(entries, Vec(4, UInt(8.W)))
    rdVec := mem.read(io.rdAddr)
    when (io.wr) {
      mem.write(io.wrAddr, wrVec, wrMask)
      // printf("write into mem %x %x mask: %x %x %x %x\n", io.wrAddr, v, wrMask(3), wrMask(2), wrMask(1), wrMask(0))
    }
  }

  io.rdData := rdVec(3) ## rdVec(2) ## rdVec(1) ## rdVec(0)
}
