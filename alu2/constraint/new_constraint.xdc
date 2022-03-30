set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR NO [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 1 [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
set_property PACKAGE_PIN T13 [get_ports {player[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {player[0]}]
set_property PACKAGE_PIN T12 [get_ports {player[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {player[1]}]
set_property PACKAGE_PIN R11 [get_ports {player[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {player[2]}]
set_property PACKAGE_PIN P10 [get_ports {player[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {player[3]}]
set_property PACKAGE_PIN N11 [get_ports {player[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {player[4]}]
set_property PACKAGE_PIN N13 [get_ports {player[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {player[5]}]
set_property PACKAGE_PIN P11 [get_ports {player[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {player[6]}]
set_property PACKAGE_PIN N12 [get_ports {player[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {player[7]}]
set_property PACKAGE_PIN P13 [get_ports {player[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {player[8]}]
set_property PACKAGE_PIN D1 [get_ports {pattern[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pattern[0]}]
set_property PACKAGE_PIN A2 [get_ports {pattern[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pattern[1]}]
set_property PACKAGE_PIN E1 [get_ports {pattern[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pattern[2]}]
set_property PACKAGE_PIN C1 [get_ports {pattern[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pattern[3]}]
set_property PACKAGE_PIN C3 [get_ports {pattern[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pattern[4]}]
set_property PACKAGE_PIN E3 [get_ports {pattern[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pattern[5]}]
set_property PACKAGE_PIN B1 [get_ports {pattern[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pattern[6]}]
set_property PACKAGE_PIN C2 [get_ports {pattern[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pattern[7]}]
set_property PACKAGE_PIN D3 [get_ports {pattern[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pattern[8]}]
set_property PACKAGE_PIN T8 [get_ports {button[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {button[0]}]
set_property PULLDOWN true [get_ports {button[0]}]
set_property PACKAGE_PIN T5 [get_ports {button[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {button[1]}]
set_property PULLDOWN true [get_ports {button[1]}]
set_property PACKAGE_PIN R8 [get_ports {button[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {button[2]}]
set_property PULLDOWN true [get_ports {button[2]}]
set_property PACKAGE_PIN T9 [get_ports {button[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {button[3]}]
set_property PULLDOWN true [get_ports {button[3]}]
set_property PACKAGE_PIN R7 [get_ports {button[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {button[4]}]
set_property PULLDOWN true [get_ports {button[4]}]
set_property PACKAGE_PIN N9 [get_ports {button[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {button[5]}]
set_property PULLDOWN true [get_ports {button[5]}]
set_property PACKAGE_PIN T10 [get_ports {button[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {button[6]}]
set_property PULLDOWN true [get_ports {button[6]}]
set_property PACKAGE_PIN R6 [get_ports {button[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {button[7]}]
set_property PULLDOWN true [get_ports {button[7]}]
set_property PACKAGE_PIN P9 [get_ports {button[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {button[8]}]
set_property PULLDOWN true [get_ports {button[8]}]
set_property PACKAGE_PIN T7 [get_ports {clear_button}]
set_property IOSTANDARD LVCMOS33 [get_ports {clear_button}]
set_property PULLDOWN true [get_ports {clear_button}]
set_property PACKAGE_PIN P8 [get_ports {reset_button}]
set_property IOSTANDARD LVCMOS33 [get_ports {reset_button}]
set_property PULLDOWN true [get_ports {reset_button}]
set_property PACKAGE_PIN R5 [get_ports {pass_button}]
set_property IOSTANDARD LVCMOS33 [get_ports {pass_button}]
set_property PULLDOWN true [get_ports {pass_button}]
set_property SEVERITY {Warning} [get_drc_checks NSTD-1]
set_property SEVERITY {Warning} [get_drc_checks UCIO-1]
set_property BITSTREAM.General.UnconstrainedPins {Allow} [current_design]