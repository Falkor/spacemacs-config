# -*- mode: fpga-xilinx-vivado-xdc; -*-
# `(file-name-nondirectory (file-name-sans-extension (buffer-file-name)))`.xdc - Xilinx Design Constraints (XDC)
# ------------------------------------------------------------------------------
# Target FPGA board: $0 Spartan-7 CMOD S7
# Reference Manual:
#  https://digilent.com/reference/reference/programmable-logic/cmod-s7/reference-manual
# Schematics
#
# ------------------------------------------------------------------------------
# Note: LVCMOS33: I/O standard - Low Voltage Complementary Metal Oxide Semiconductor

# 12 MHz System Clock
set_property -dict { PACKAGE_PIN M9    IOSTANDARD LVCMOS33 } [get_ports { clk }];
create_clock -add -name sys_clk_pin -period 83.33 -waveform {0 41.66} [get_ports { clk }];
#                                           ^^^^^            ^^^^^^^^
# 12 MHz oscillator => period (in ns) 1/(12*10^6)            | 50% duty clock
#                                     = 83.33 ns             |    +----+
#                                                            |____|    |____

### Map below your GPIOs
# #
# # Push Buttons - cf. BTN0 in reference manual  IO_L6P_T0_34 Sch=btn[0]
# #
# set_property -dict { PACKAGE_PIN D2    IOSTANDARD LVCMOS33 } [get_ports { rst }];

# #
# # 4 LEDs
# #
# set_property -dict { PACKAGE_PIN E2  IOSTANDARD LVCMOS33 } [get_ports { leds[0] }];
# set_property -dict { PACKAGE_PIN K1  IOSTANDARD LVCMOS33 } [get_ports { leds[1] }];
# set_property -dict { PACKAGE_PIN J1  IOSTANDARD LVCMOS33 } [get_ports { leds[2] }];
# set_property -dict { PACKAGE_PIN E1  IOSTANDARD LVCMOS33 } [get_ports { leds[3] }];

# #
# # LED Tri-chromie RGB
# #
# set_property -dict { PACKAGE_PIN F1  IOSTANDARD LVCMOS33  PULLUP TRUE } [get_ports { rgb[0] }];
# set_property -dict { PACKAGE_PIN D3  IOSTANDARD LVCMOS33  PULLUP TRUE } [get_ports { rgb[1] }];
# set_property -dict { PACKAGE_PIN F2  IOSTANDARD LVCMOS33  PULLUP TRUE } [get_ports { rgb[2] }];
