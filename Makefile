IVERILOG = iverilog
VVP      = vvp
FLAGS    = -g2012 -I ../../tranif

# --- Control Unit ---
CU_DIR = tb/CU

cu:
	cd $(CU_DIR) && $(IVERILOG) $(FLAGS) -o CU ../../mips/netlist_pad.sv CU_tb.sv
	cd $(CU_DIR) && $(VVP) CU

cu-wave: cu
	gtkwave $(CU_DIR)/control.vcd

# --- MIPS ---
MIPS_DIR = tb/mips

mips:
	cd $(MIPS_DIR) && $(IVERILOG) $(FLAGS) -o mips ../../mips/netlist_pad.sv top_tb.sv
	cd $(MIPS_DIR) && $(VVP) mips

mips-wave: mips
	gtkwave $(MIPS_DIR)/mips.vcd

# --- SRAM Bank ---
SRAM_DIR = tb/sram_2port_bank

sram_bank:
	cd $(SRAM_DIR) && $(IVERILOG) $(FLAGS) -o sram_bank ../../sram_2port_bank/netlist_updated.sv sram_2port_bank_tb.sv
	cd $(SRAM_DIR) && $(VVP) sram_bank

sram_bank-wave: sram_bank
	gtkwave $(SRAM_DIR)/sram_bank.vcd

# --- Phase Detector with Fanout ---
PHASEDET_DIR = tb/phasedetFO

phasedetFO:
	cd $(PHASEDET_DIR) && $(IVERILOG) $(FLAGS) -o phasedetFO phasedetFO_tb.sv
	cd $(PHASEDET_DIR) && $(VVP) phasedetFO

phasedetFO-wave: phasedetFO
	gtkwave $(PHASEDET_DIR)/phasedetFO.vcd

# --- Conditional inverter (ALU) ---
COND_INV_DIR = tb/cond_inv

cond_inv:
	cd $(COND_INV_DIR) && $(IVERILOG) $(FLAGS) -o cond_inv ../../mips/netlist_pad.sv cond_inv_tb.sv
	cd $(COND_INV_DIR) && $(VVP) cond_inv

cond_inv-wave: cond_inv
	gtkwave $(COND_INV_DIR)/cond_inv.vcd

# --- Run all testbenches ---
all: cu mips sram_bank cond_inv phasedetFO

# --- Clean ---
clean:
	rm -f $(CU_DIR)/CU $(CU_DIR)/control.vcd
	rm -f $(MIPS_DIR)/mips $(MIPS_DIR)/mips.vcd
	rm -f $(SRAM_DIR)/sram_bank $(SRAM_DIR)/sram_bank.vcd
	rm -f $(COND_INV_DIR)/cond_inv $(COND_INV_DIR)/cond_inv.vcd
	rm -f $(PHASEDET_DIR)/phasedetFO $(PHASEDET_DIR)/phasedetFO.vcd
	@echo "Cleaned build artifacts."

.PHONY: cu cu-wave mips mips-wave sram_bank sram_bank-wave cond_inv cond_inv-wave phasedetFO phasedetFO-wave all clean
