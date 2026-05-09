# AdiabaticProcessor

Design and verification of an adiabatic Bennett-clocked MIPS microprocessor, including block-level and top-level verification.

Simulations are done through Icarus Verilog and/or Cadence Xcelium.

---

## Project Structure

```
AdiabaticProcessor/
├── bennettclock/            # Bennett clock generators
│   ├── bennettClock.sv          # Original Bennett clock (sinusoidal phases)
│   ├── bennettClock_noX.sv      # X-free variant
│   └── bennettClock_square.sv   # Square-wave variant (used in testbenches)
├── control_unit/            # Control unit structural netlist
│   └── control_unit.sv
├── mips/                    # MIPS processor netlists
│   ├── netlist.sv               # Base netlist (all inout ports)
│   ├── netlist_pad.sv           # Pad-driver netlist (input/output port directions)
│   └── random.sv                # Instruction data register + datapath netlist
├── modules/                 # Adiabatic gate-level cell library (original)
├── src/                     # Adiabatic gate-level cell library (copy used by control_unit includes)
├── sram_2port_bank/         # SRAM subsystem
│   ├── netlist.sv               # Structural SRAM bank netlist
│   ├── netlist_updated.sv       # Updated structural SRAM bank netlist
│   └── sram_array.sv            # Behavioral SRAM array model
├── tranif/                  # Custom pass-transistor (ctranif) primitive
│   └── custom_tranif.sv
├── tb/                      # Testbenches
│   ├── CU/                      # Control unit testbench
│   │   └── CU_tb.sv
│   ├── mips/                    # Top-level MIPS testbench
│   │   └── top_tb.sv
│   └── sram_2port_bank/         # SRAM subsystem testbenches
│       ├── sram_2port_bank_tb.sv
│       ├── sram_2port_bank_og_tb.sv
│       ├── sram_array_tb.sv
│       ├── sram_decoder_tb.sv
│       ├── sram_write_driver_tb.sv
│       ├── sram1b_2port_tb.sv
│       └── inv_fo4_tb.sv
└── Makefile                 # Top-level build targets
```

## Architecture Overview

The processor is a **multi-cycle MIPS** design built entirely from adiabatic (energy-recovering) logic gates. Clocking is provided by a **Bennett clock** that generates overlapping trapezoidal/square-wave phases, enabling reversible charge transfer between pipeline stages.

Key components:
- **Bennett Clock** — generates 10-phase overlapping clock signals (`clkpos[0:9]`) plus a master clock (`Mclk`) and instruction flag (`instFlag`/`Fclk`).
- **Control Unit** — FSM-based multicycle controller with states: Fetch1, Fetch2, Decode, and instruction-specific execute/writeback states (R-type, ADDI, Load, Store, BEQ, Jump).
- **Datapath** — 16-bit data path with PC, instruction register, register file (SRAM-based), ALU, and memory interface.
- **SRAM Bank** — 32x16-bit register file using a 2-port SRAM array with address decoders and write drivers.
- **Custom Tranif** — pass-transistor primitive (`ctranif0`/`ctranif1`) used throughout the structural netlists.

## Building and Running

### Prerequisites

- [Icarus Verilog](http://iverilog.icarus.com/) (`iverilog`, `vvp`)
- [GTKWave](http://gtkwave.sourceforge.net/) (optional, for waveform viewing)

### Make Targets

Run from the project root:

| Command | Description | Waveform |
|:---|:---|:---|
| `make cu` | Control unit testbench | `tb/CU/control.vcd` |
| `make cu-wave` | Run CU tb + open GTKWave | — |
| `make mips` | Top-level MIPS testbench | `tb/mips/mips.vcd` |
| `make mips-wave` | Run MIPS tb + open GTKWave | — |
| `make sram_bank` | SRAM bank testbench | `tb/sram_2port_bank/sram_bank.vcd` |
| `make sram_bank-wave` | Run SRAM tb + open GTKWave | — |
| `make all` | Run all testbenches | — |
| `make clean` | Remove generated binaries and VCDs | — |
