/*
 * Copyright: 2014-2018, Technical University of Denmark, DTU Compute
 * Author: Martin Schoeberl (martin@jopdesign.com)
 * License: Simplified BSD License
 *
 * A UART is a serial port, also called an RS232 interface.
 *
 */

package leros.uart

import chisel3._
import chisel3.util._
import java.nio.file._
import leros.LerosConfig.PROGRAMMING_DONE

/**
 * Transmit part of the UART.
 * A minimal version without any additional buffering.
 * Use a ready/valid handshaking.
 */
class Tx(frequency: Long, baudRate: Long) extends Module {
  val io = IO(new Bundle {
    val txd = Output(UInt(1.W))
    val channel = Flipped(new UartIO())
  })

  val BIT_CNT = ((frequency + baudRate / 2) / baudRate - 1).asUInt

  val shiftReg = RegInit(0x7ff.U)
  val cntReg = RegInit(0.U(20.W))
  val bitsReg = RegInit(0.U(4.W))

  io.channel.ready := (cntReg === 0.U) && (bitsReg === 0.U)
  io.txd := shiftReg(0)

  when(cntReg === 0.U) {

    cntReg := BIT_CNT
    when(bitsReg =/= 0.U) {
      val shift = shiftReg >> 1
      shiftReg := 1.U ## shift(9, 0)
      bitsReg := bitsReg - 1.U
    } .otherwise {
      when(io.channel.valid) {
        // two stop bits, data, one start bit
        shiftReg := 3.U ## io.channel.bits ## 0.U
        bitsReg := 11.U
      } .otherwise {
        shiftReg := 0x7ff.U
      }
    }

  } .otherwise {
    cntReg := cntReg - 1.U
  }
}


/**
 * A transmitter with a single buffer.
 */
class BufferedTx(frequency: Long, baudRate: Long) extends Module {
  val io = IO(new Bundle {
    val txd = Output(UInt(1.W))
    val channel = Flipped(new UartIO())
  })
  val tx = Module(new Tx(frequency, baudRate))
  val buf = Module(new Buffer())

  buf.io.in <> io.channel
  tx.io.channel <> buf.io.out
  io.txd <> tx.io.txd
}

/**
 * Send a string.
 */
class Sender(frequency: Long, baudRate: Long, txFile : String) extends Module {
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

  when(instr === PROGRAMMING_DONE.U) {
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
