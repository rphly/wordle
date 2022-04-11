# clk => 100000000Hz
create_clock -period 10.0 -name clk_0 -waveform {0.000 5.000} [get_ports clk]
set_property PACKAGE_PIN N14 [get_ports {clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]
set_property PACKAGE_PIN P6 [get_ports {rst_n}]
set_property IOSTANDARD LVCMOS33 [get_ports {rst_n}]
set_property PACKAGE_PIN J3 [get_ports {btnin}]
set_property IOSTANDARD LVCMOS33 [get_ports {btnin}]
set_property PULLDOWN true [get_ports {btnin}]
set_property PACKAGE_PIN B6 [get_ports {io_led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {io_led[0]}]
set_property PACKAGE_PIN B5 [get_ports {io_led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {io_led[1]}]
set_property PACKAGE_PIN A5 [get_ports {io_led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {io_led[2]}]
set_property PACKAGE_PIN A4 [get_ports {io_led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {io_led[3]}]
set_property PACKAGE_PIN B4 [get_ports {io_led[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {io_led[4]}]
set_property PACKAGE_PIN A3 [get_ports {io_led[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {io_led[5]}]
set_property PACKAGE_PIN F4 [get_ports {io_led[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {io_led[6]}]
set_property PACKAGE_PIN F3 [get_ports {io_led[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {io_led[7]}]
set_property PACKAGE_PIN F2 [get_ports {io_led[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {io_led[8]}]
set_property PACKAGE_PIN E1 [get_ports {io_led[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {io_led[9]}]
set_property PACKAGE_PIN B2 [get_ports {io_led[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {io_led[10]}]
set_property PACKAGE_PIN A2 [get_ports {io_led[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {io_led[11]}]
set_property PACKAGE_PIN E2 [get_ports {io_led[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {io_led[12]}]
set_property PACKAGE_PIN D1 [get_ports {io_led[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {io_led[13]}]
set_property PACKAGE_PIN E6 [get_ports {io_led[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {io_led[14]}]
set_property PACKAGE_PIN K5 [get_ports {io_led[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {io_led[15]}]
set_property PACKAGE_PIN G2 [get_ports {io_led[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {io_led[16]}]
set_property PACKAGE_PIN G1 [get_ports {io_led[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {io_led[17]}]
set_property PACKAGE_PIN H2 [get_ports {io_led[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {io_led[18]}]
set_property PACKAGE_PIN H1 [get_ports {io_led[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {io_led[19]}]
set_property PACKAGE_PIN K1 [get_ports {io_led[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {io_led[20]}]
set_property PACKAGE_PIN J1 [get_ports {io_led[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {io_led[21]}]
set_property PACKAGE_PIN L3 [get_ports {io_led[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {io_led[22]}]
set_property PACKAGE_PIN L2 [get_ports {io_led[23]}]
set_property IOSTANDARD LVCMOS33 [get_ports {io_led[23]}]
set_property PACKAGE_PIN P15 [get_ports {usb_rx}]
set_property IOSTANDARD LVCMOS33 [get_ports {usb_rx}]
set_property PACKAGE_PIN P16 [get_ports {usb_tx}]
set_property IOSTANDARD LVCMOS33 [get_ports {usb_tx}]
