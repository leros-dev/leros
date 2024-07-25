package leros

import chisel3.ChiselEnum
object State extends ChiselEnum {
  val fetch, execute = Value
}