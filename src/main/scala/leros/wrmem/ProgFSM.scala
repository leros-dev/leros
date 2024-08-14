package leros.wrmem

import chisel3._
import chisel3.util._

class ProgFSM(memAddrWidth : Int) extends Module {
  val io = IO(new Bundle {
    val channel = Flipped(new DecoupledIO(UInt(8.W)))
    val wrAddr = Output(UInt(memAddrWidth.W))
    val wrData = Output(UInt(16.W))
    val wrEna = Output(Bool())

    val busy = Output(Bool())
  })
  
  val PROGRAMMING_DONE = "h64".U(8.W)

  val idle :: sampleA :: sampleB :: writeMem :: Nil = Enum(4)
  val state = RegInit(idle)

  val wrAddr = RegInit(0.U(memAddrWidth.W))
  val increment = WireDefault(false.B)
  
  val wrDataA = RegInit(0.U(8.W))
  val wrDataB = RegInit(0.U(8.W))

  io.channel.ready := false.B
  io.wrEna := false.B
  io.busy := false.B

  switch(state) {
    is(idle) {
        io.wrEna := false.B
        io.channel.ready := false.B
        increment := false.B
        io.busy := false.B

        when(io.channel.valid) {
            state := sampleA
        }
    }

    is(sampleA) {
      io.wrEna := false.B
      io.channel.ready := true.B
      increment := false.B
      io.busy := true.B
        
      wrDataA := io.channel.bits
      
      when(wrDataA === PROGRAMMING_DONE) {
        state := idle
      }
      . elsewhen(io.channel.valid) {
        state := sampleB
      }
    }

    is(sampleB) {
      io.wrEna := false.B
      io.channel.ready := true.B
      increment := false.B
      io.busy := true.B

      wrDataB := io.channel.bits
    
      when(wrDataB === PROGRAMMING_DONE) {
        state := idle
      }
      . elsewhen(io.channel.valid) {
        state := writeMem
      }      
    }

    is(writeMem) {
      io.wrEna := true.B
      io.channel.ready := false.B
      increment := true.B
      io.busy := true.B

      state := sampleA     
    }
  }

  when(increment) {
    wrAddr := wrAddr + 1.U
  }

  // little endian
  io.wrData := wrDataB ## wrDataA
  io.wrAddr := wrAddr

}