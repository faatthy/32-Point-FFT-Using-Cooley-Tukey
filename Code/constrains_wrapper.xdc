create_clock -period 10.000 -name clk -waveform {0.000 5.000} [get_ports clk]

set_input_delay -clock [get_clocks clk] -min -add_delay 3.500 [get_ports rst_n]
set_input_delay -clock [get_clocks clk] -max -add_delay 4.000 [get_ports rst_n]
set_input_delay -clock [get_clocks clk] -min -add_delay 3.500 [get_ports "ADC_in*"]
set_input_delay -clock [get_clocks clk] -max -add_delay 4.000 [get_ports "ADC_in*"]
