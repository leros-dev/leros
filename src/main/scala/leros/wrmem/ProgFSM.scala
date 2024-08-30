package leros.wrmem

import chisel3._
import chisel3.util._
import leros.LerosConfig.PROGRAMMING_DONE

class ProgFSM(memAddrWidth : Int) extends Module {
  val io = IO(new Bundle {
    val channel = Flipped(new DecoupledIO(UInt(8.W)))
    val wrAddr = Output(UInt(memAddrWidth.W))
    val wrData = Output(UInt(16.W))
    val wrEna = Output(Bool())

    val busy = Output(Bool())
  })

  val idle :: sampleA :: sampleB :: writeMem :: waitNext :: clearMem :: Nil = Enum(6)
  val state = RegInit(idle)

  val wrAddr = RegInit(0.U(memAddrWidth.W))
  val rxData = RegNext(io.channel.bits)

  val wrDataA = RegInit(0.U(8.W))
  val wrDataB = RegInit(0.U(8.W))
  val wrData = wrDataB ## wrDataA // little endian

  val topAddr = (scala.math.pow(2, memAddrWidth) - 1).toInt

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

        wrAddr := 0.U

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
      
      wrAddr := wrAddr + 1.U 
      
      when(wrData === PROGRAMMING_DONE.U(16.W)) {
        wrDataA := 0.U
        wrDataB := 0.U
        
        io.wrEna := true.B
        
        state := clearMem
      }
      . otherwise {
        io.wrEna := true.B        
        state := waitNext
      }                 
    }

    is(clearMem) {
        io.busy := true.B

        // If a valid signal is received in this state a new file is being programmed
        // Therefore cut the current programming sequence and begin the new one
        io.channel.ready := true.B
        when(io.channel.valid) {
            io.wrEna := false.B
            
            wrAddr := 0.U
            state := sampleA
        }
        . otherwise {
            io.wrEna := true.B

            wrAddr := wrAddr + 1.U
            when(wrAddr === topAddr.U) {
                state := idle
            }
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