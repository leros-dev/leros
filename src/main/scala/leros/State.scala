package leros

import chisel3.ChiselEnum
object State extends ChiselEnum {
  val fetch, execute,
  loadAddr, loadInd,
  store, storeInd, storeindB, storeIndH,
  branch, jal = Value
}