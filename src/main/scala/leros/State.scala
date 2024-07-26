package leros

import chisel3.ChiselEnum
object State extends ChiselEnum {
  val init, fetch,
  loadAddr, loadInd,
  store, storeInd, storeIndB, storeIndH,
  branch, jal, scall = Value
}