# Commands to run testbenches in Icarus Verilog are below
Please make sure you are currently in the directory where the testbench resides

### For CU:
```
iverilog -g2012 -I ../../tranif -o CU ../../control_unit/control_unit.sv CU_tb.sv
vvp CU
gtkwave control.vcd
```

### For sram_2port_bank
```
iverilog -g2012 -I ../../tranif -o sram_bank ../../sram_2port_bank/netlist_updated.sv sram_2port_bank_tb.sv
vvp sram_bank
gtkwave sram_bank.vcd
```

### For sram1b_2port
```
iverilog -g2012 -I ../../tranif -o sram_cell ../../sram_2port_bank/netlist.sv sram1b_2port_tb.sv
vvp sram_cell
gtkwave sram.vcd
```