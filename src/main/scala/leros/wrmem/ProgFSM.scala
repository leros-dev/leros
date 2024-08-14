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
  
  val PROGRAMMING_DONE = "h2121".U(16.W)

  val idle :: sampleA :: sampleB :: writeMem :: waitNext :: Nil = Enum(5)
  val state = RegInit(idle)

  val wrAddr = RegInit(0.U(memAddrWidth.W))
  val rxData = RegNext(io.channel.bits)

  val wrDataA = RegInit(0.U(8.W))
  val wrDataB = RegInit(0.U(8.W))
  val wrData = wrDataB ## wrDataA // little endian

  io.wrEna := false.B
  io.channel.ready := false.B
  io.busy := false.B
  io.wrData := wrData
  io.wrAddr := wrAddr

  switch(state) {
    is(idle) {
        io.wrEna := false.B
        io.channel.ready := true.B
        io.busy := false.B

        when(io.channel.valid) {                      
            state := sampleA
        }
    }

    is(sampleA) {
      io.wrEna := false.B
      io.channel.ready := true.B
      io.busy := true.B    

      wrDataA := rxData                

      when(io.channel.valid) {    
        state := sampleB
      }
    }

    is(sampleB) {
      io.wrEna := false.B
      io.channel.ready := true.B
      io.busy := true.B      
    
      wrDataB := rxData

      state := writeMem
    }

    is(writeMem) {
      io.busy := true.B
      io.channel.ready := true.B
      
      when(wrData === PROGRAMMING_DONE) {
        io.wrEna := false.B
        state := idle
      }
      . otherwise {
        io.wrEna := true.B
        wrAddr := wrAddr + 1.U 
        state := waitNext
      }                 
    }
    
    is(waitNext) {
        io.busy := true.B
        io.channel.ready := true.B
        io.wrEna := false.B
        
        when(io.channel.valid) {
            state := sampleA
        }
      }
  }
}