package leros

object LerosConfig {
  val SIM_MODE = true

  val CLOCK_FREQ_HZ : Long = 100000000L
  val UART_BAUDRATE : Long = if (SIM_MODE) 50000000L  else 115200L

  val MEM_ADDR_WIDTH = 8
  val DATA_WIDTH = 32  
}

