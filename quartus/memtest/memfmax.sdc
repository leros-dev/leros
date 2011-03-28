###########################################################################
# SDC files for Cycore based boards
###########################################################################
 
 
# Clock in input pin (20 MHz)
create_clock -period 50.0 [get_ports clk]
# Create generated clocks based on PLLs
derive_pll_clocks
derive_clock_uncertainty

