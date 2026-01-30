# SRAM Project Simulation Guide

This directory contains testbenches for various SRAM modules. Use the Makefile to streamline compilation with **Icarus Verilog** and visualization with **GTKWave**.

---

## Usage

To run a simulation, use the following `make` commands. 

### Available Targets:

| Command | Description | Output Waveform |
|:---|:---|:---|
| `make CU` | Control Unit simulation | `control.vcd` |
| `make sram_bank` | 2-port SRAM bank (Netlist) | `sram_bank.vcd` |
| `make sram_cell` | 1-bit 2-port SRAM cell | `sram.vcd` |
| `make sram_array` | Behavioral SRAM array model | `sram_array.vcd` |
| `make sram_decoder` | SRAM address decoder | `sram_decoder.vcd` |

---

## 🧹 Clean

To reset your directory and remove all generated binaries and waveform files, run:

```bash
make clean