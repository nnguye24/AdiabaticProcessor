IVERILOG = iverilog
FLAGS    = -g2012 -I ../../tranif
NETLIST  = ../../mips/netlist.sv
NETLIST_PAD  = ../../mips/netlist_pad.sv



mips:
	$(IVERILOG) $(FLAGS) -o mips $(NETLIST_PAD) top_tb.sv
	vvp mips

mips-wave:
	$(IVERILOG) $(FLAGS) -o mips $(NETLIST_PAD) top_tb.sv
	vvp mips
	gtkwave mips.vcd

# Removes everything EXCEPT .sv files and the Makefile itself
clean:
	find . -type f ! -name "*.sv" ! -name "Makefile" -delete
	@echo "Cleaned all non-tb files."