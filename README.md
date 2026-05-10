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
│   ├── cond_inv/                # ALU conditional-inverter testbench
│   │   └── cond_inv_tb.sv
│   ├── phasedetFO/              # Phase detector with fanout testbench
│   │   └── phasedetFO_tb.sv
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
| `make cond_inv` | ALU conditional-inverter testbench | `tb/cond_inv/cond_inv.vcd` |
| `make cond_inv-wave` | Run cond_inv tb + open GTKWave | — |
| `make phasedetFO` | Phase detector with fanout testbench | `tb/phasedetFO/phasedetFO.vcd` |
| `make phasedetFO-wave` | Run phasedetFO tb + open GTKWave | — |
| `make all` | Run all testbenches | — |
| `make clean` | Remove generated binaries and VCDs | — |

---

## For Future Students

If you are picking this up in the lab, here is where things stand and where help is most needed.

### Known open issues

These bugs are documented in detail in [`cu_diagnosis.md`](cu_diagnosis.md):

1. **R-type OP encoding in `CU_tb.sv`** — The testbench drives `OP = 4'b0100` for the R-type test, which is the same encoding used for ADDI. The true R-type encoding is `4'b0000`. As a result, the `RTYPEX` and `RTYPEWR` states are never exercised.

2. **ADDI routes to `MEMADR` instead of `ADDIEX`** — There is no gate in the `Nout[4]` cone of `control_unit.sv` that fires on `(DECODE AND ADDI)`, so the state machine falls through to `MEMADR` when it should go to `ADDIEX`. This is a structural issue in the netlist.

3. **Secondary mis-routing** — Because ADDI lands in `MEMADR`, the circuit sees `out_Memadr AND out_Addi` simultaneously, which drives `out_other4` and incorrectly routes the machine to `ADDIWR` via a path that does not exist in the spec.

### Suggested contributions

- **Fix the CU testbench** — correct the R-type OP encoding in `CU_tb.sv` and add assertions for each FSM state transition.
- **Fix `control_unit.sv`** — add the missing `Nout[4]` logic so `ADDIEX` is reachable from `DECODE` when the ADDI op is active.
- **Add a full instruction-level MIPS testbench** — `tb/mips/top_tb.sv` is a start, but a self-checking test that loads a small program and verifies register/memory results would be a major step forward.
- **Document the cell library** — `modules/` has 25+ adiabatic gate primitives with no descriptions. Even a one-line comment per module (function, drive strength, `_irr` vs non-`_irr` variant) would help a lot.
- **Add waveform screenshots** — capture GTKWave screenshots of passing simulations and add them to `Adiabatic Docs/` so future readers can see expected behavior without running a simulation.
- **Write a simulation guide** — note any quirks with Icarus Verilog and the `inout`/`supply` port conventions used throughout the netlists (the switch from `netlist.sv` to `netlist_pad.sv` and `netlist_updated.sv` could use explanation).

## Note for Undergrads

Verilog is amazing and I think it's important to know what can be made with it. 

I've seen many groups in Digital Integrated Circuits tapeout simple state machines that fill up 10% of the die. I'm not sure if this is a good direction the class should be going and it feels like a waste of money. I personally think the reason why this happens is because students don't know what can be made with HDLs like Verilog. If you can think of a computation, the HDLs will be able to do it. 

I'll give you an example. Everyone's favorite computation right now is the matrix multiply. Here's a video of how systolic arrays can be used to accelerate matmuls: https://www.youtube.com/watch?v=2VrnkXd9QR8&t=27s

Very satisfying no? And this can all be done in Verilog. Here's a great blog I found online covering it: https://www.tinytpu.com/

At the end of the day, complex computations are just a bunch simple computations with movement. So please. Don't go into Digital Integrated Circuits to tapeout a simple state machine. Make a processor, or an accelerator, or a DSP chip. 

## My Opinions On Adiabatic Reversible Circuits(ARC)

### The Value in ARC
I think this research is really cool and has meaningful implications. To put it shortly, adiabatic circuits may be the only path to extend the current scaling laws in Si-based CMOS.

I've talked to an engineer at adiabatic computing startup Vaire Computing and they expressed "looking at IRDS viewpoints on continual shrinking and 3D ICs, it's clear that heat density is the largest limiting factor for both." For this reason, I think there will be a point where the industry doesn't have the choice to continue with conventional logic if they want to maintain scaling laws. There will be a fundamental shift in design paradigm in the future.

Here's an interesting thing this engineer said as well. He thinks we'll hit the thermal limit before we hit the device geometry limit. I need to look more into this as well. 

But overall, I think it's a reasonable bet to research this technology. Of course, there will be competing paradigms. I think spintronics is an exciting one. But clearly, there is some support behind adiabatic circuits as evident by the startup Vaire Computing. 

### Tooling
Having worked on this stuff for 2 years, it's blatant there needs to be better tooling for adiabatic circuits development. I think it's cool that we can manually layout adiabatic processors in our lab but it's definitely cooler if we can go from RTL to GDSII for adiabatic circuits. We'd also waste less time.

#### The following are unorganized thoughts I had around Synthesis and PNR for ARC.

A couple thoughts that are relevant for synthesis:
- adiabatic circuits are inherently sequential(power clocked)
- no need for conventional registers/timing closure of RTL
- what does clock tree synthesis look like for power clocks? 

Verification is honestly hell the way we do it in the Snider/Orlov lab. It's super slow because we're doing it directed and it doesn't cover many cases. Many bugs come up because the Verilog primitives don't mesh well with adiabatic netlists. 

Here's a gap I think we have. We have adiabatic standard cell layouts. We don't have RTL for them. So probably characterize each standard cell to generate a behavioral RTL model that models the cell's behavior accurately. In verification, we can use this behavioral RTL model because we trust that it models the logical behavior or the physical layout accurately.

But now how do we write RTL where synthesis can pattern match and substitute standard cell behavioral logic to it? What does Adiabatic RTL even look like? For Bennett Clocking this might be hell because we won't know how many bennett phases a design may need without laying down on schematic. Maybe it doesn't have to look different. Here are some more thoughts:
```
A tool would know how many bennett phases each standard cell takes in. Connects them together according to what patterns it sees in RTL.

If we write normal RTL(ie. with one periodic clock), a synthesis tool could treat bennett phases as another set of pins and probably piece together standard cells arbitrarily. The number of bennett phases would be calculated by adding up the number of phases on each gate on the longest logical path from input to output. 

In this sense, verification could just be on normal RTL(square wave clock). A synthesis tool would infer bennett phases by the process described above. And synthesis output would have more pins(from bennett clocks) than what was inputted to the tool. 
```

Even doing this doesn't feel right though... We'll have to do post-synthesis verification to confirm that our design is logically adiabatic. 

Ideally we'd like to do this pre-synthesis. But again, what does Adiabatic RTL even look like? I will think about this some more. 

PNR, in my naive opinion, doesn't need too much work??? At least for Bennett clocking, it seems to need a bit more heuristics to place Bennett phases in order. 

One more thing, I think I will explore other adiabatic logic families beyond SCRL. And other methods beyond Bennett Clocking. I think they might be better fitted to translate current EDA techniques from conventional logic over to adiabatic.

## Thank you Greg and Alexei. Working on this has been intellectually stimulating. 
