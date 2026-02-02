IVERILOG = iverilog
FLAGS    = -g2012 -I ../../tranif
NETLIST  = ../../sram_2port_bank/netlist_updated.sv

CU:
	$(IVERILOG) $(FLAGS) -o CU ../../control_unit/control_unit.sv CU_tb.sv
	vvp CU
	gtkwave control.vcd

sram_bank:
	$(IVERILOG) $(FLAGS) -o sram_bank $(NETLIST) sram_2port_bank_tb.sv
	vvp sram_bank
	gtkwave sram_bank.vcd

sram_cell:
	$(IVERILOG) $(FLAGS) -o sram_cell $(NETLIST) sram1b_2port_tb.sv
	vvp sram_cell
	gtkwave sram.vcd

sram_array:
	$(IVERILOG) $(FLAGS) -o sram_array ../../sram_2port_bank/sram_array.sv sram_array_tb.sv
	vvp sram_array
	gtkwave sram_array.vcd

sram_decoder:
	$(IVERILOG) $(FLAGS) -o sram_decoder $(NETLIST) sram_decoder_tb.sv
	vvp sram_decoder
	gtkwave sram_decoder.vcd

# --- Maintenance ---

# Removes everything EXCEPT .sv files and the Makefile itself
clean:
	find . -type f ! -name "*.sv" ! -name "Makefile" -delete
	@echo "Cleaned all non-tb files."

.PHONY: CU sram_bank sram_cell sram_array sram_decoder clean