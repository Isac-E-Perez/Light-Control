# In this file, I map the I/O's of the circuit to physical FPGA pins. 
# In the board, many FPGA pins are wired to specific components (LEDs, switches, buttons, ect.)
# The I/O standard and pin name must be specified for every I/O port. 
# Pin names are case sensitive and must match the port names as specified in the VHDL entity.

# Inputs
set_property PACKAGE_PIN M13 [get_ports {a}]
  set_property IOSTANDARD LVCMOS33 [get_ports {a}]
  
set_property PACKAGE_PIN L16 [get_ports {b}]
  set_property IOSTANDARD LVCMOS33 [get_ports {b}]
  
set_property PACKAGE_PIN J15 [get_ports {c}]
  set_property IOSTANDARD LVCMOS33 [get_ports {c}]
  
# Outputs
set_property PACKAGE_PIN H17 [get_ports {f}]
  set_property IOSTANDARD LVCMOS33 [get_ports {f}]
