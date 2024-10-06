package leros.wrmem

import chisel3._
import chisel3.util._
import java.nio.file._
import leros.shared.Constants._
import leros.uart._

/**
 * Sends content of a file over uart
 * frequency: clock frequency in hz
 * baudrate: baudrate in baud/s
 * txFile: path to file to be sent
 * Stops programming upon instruction 0xFFFF (scall 0xFF)
 * Resumes programming once lerosExit flag is raised
 */
class Programmer(frequency: Long, baudRate: Long, txFile : String) extends Module {
  val io = IO(new Bundle {
    val txd = Output(UInt(1.W))
    val lerosExit = Input(Bool())
  })

  val tx = Module(new BufferedTx(frequency, baudRate))

  io.txd := tx.io.txd

  val txDataFile = Files.readAllBytes(Paths.get(txFile))
  val txData = VecInit(txDataFile.map(_.S(8.W)))
  val len = txData.length
  val cntReg = RegInit(0.U(log2Ceil(len).W))

  val instr = txData(cntReg).asUInt ## txData(cntReg-1.U).asUInt
  val enable = RegInit(true.B)

  when(instr === (SCALL.U ## SCALL_PROGRAM.U) && cntReg(0) === 1.U(1.W)) {
    when(tx.io.channel.ready) {
        enable := false.B
    }
  }

  when(enable) {
    tx.io.channel.bits := txData(cntReg).asUInt
    tx.io.channel.valid := cntReg =/= len.U

    when(tx.io.channel.ready && cntReg =/= len.U) {        
      cntReg := cntReg + 1.U
    }
  }
  . otherwise {
    tx.io.channel.bits := 0.U
    tx.io.channel.valid := false.B

    when(io.lerosExit) {
        enable := true.B
    }
  }

}