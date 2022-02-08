word_size = 16
num_words = 256

num_rw_ports = 0
num_r_ports = 1
num_w_ports = 1


tech_name = "lapis20"
nominal_corner_only = False
process_corners = ["TT"]
supply_voltages = [1.8]
temperatures = [25]

route_supplies = "grid" # True # "tree"
supply_pin_type = "multiple" # "left", "right", "top", "bottom", "ring", "single"
check_lvsdrc = True
perimeter_pins = True
# nominal_corner_only = True
load_scales = [0.5, 1]
slew_scales = [0.5, 1]

output_name = "sram_{0}rw{1}r{2}w_{3}_{4}_{5}".format(num_rw_ports,
                                                      num_r_ports,
                                                      num_w_ports,
                                                      word_size,
                                                      num_words,
                                                      tech_name)
output_path = "macro/{}".format(output_name)

