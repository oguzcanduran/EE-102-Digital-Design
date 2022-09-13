set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
set_property PACKAGE_PIN U18 [get_ports clr]
set_property IOSTANDARD LVCMOS33 [get_ports clr]
set_property PACKAGE_PIN V17 [get_ports {registerone[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {registerone[0]}]
set_property PACKAGE_PIN V16 [get_ports {registerone[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {registerone[1]}]
set_property PACKAGE_PIN W16 [get_ports {registerone[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {registerone[2]}]
set_property PACKAGE_PIN W17 [get_ports {registerone[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {registerone[3]}]
set_property PACKAGE_PIN W15 [get_ports {registerone[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {registerone[4]}]
set_property PACKAGE_PIN V15 [get_ports {registerone[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {registerone[5]}]
set_property PACKAGE_PIN W14 [get_ports {registerone[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {registerone[6]}]
set_property PACKAGE_PIN W13 [get_ports {registerone[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {registerone[7]}]
set_property PACKAGE_PIN V2 [get_ports {registertwo[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {registertwo[0]}]
set_property PACKAGE_PIN T3 [get_ports {registertwo[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {registertwo[1]}]
set_property PACKAGE_PIN T2 [get_ports {registertwo[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {registertwo[2]}]
set_property PACKAGE_PIN R3 [get_ports {registertwo[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {registertwo[3]}]
set_property PACKAGE_PIN W2 [get_ports {registertwo[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {registertwo[4]}]
set_property PACKAGE_PIN U1 [get_ports {registertwo[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {registertwo[5]}]
set_property PACKAGE_PIN T1 [get_ports {registertwo[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {registertwo[6]}]
set_property PACKAGE_PIN R2 [get_ports {registertwo[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {registertwo[7]}]
set_property PACKAGE_PIN V13 [get_ports {result[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {result[0]}]
set_property PACKAGE_PIN V3 [get_ports {result[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {result[1]}]
set_property PACKAGE_PIN W3 [get_ports {result[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {result[2]}]
set_property PACKAGE_PIN U3 [get_ports {result[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {result[3]}]
set_property PACKAGE_PIN P3 [get_ports {result[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {result[4]}]
set_property PACKAGE_PIN N3 [get_ports {result[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {result[5]}]
set_property PACKAGE_PIN P1 [get_ports {result[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {result[6]}]
set_property PACKAGE_PIN L1 [get_ports {result[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {result[7]}]