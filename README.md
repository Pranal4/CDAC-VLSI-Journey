# CDAC VLSI Journey

My structured learning journey toward VLSI and semiconductor engineering, with a focus on Digital Design, Verilog/SystemVerilog, Computer Architecture, RTL Design, and FPGA/ASIC fundamentals.

## Month 1 — Verilog

### Week 1 — Combinational Logic

Implemented and simulated basic logic gates using Verilog.

#### Logic Gates

- AND Gate
- OR Gate
- NOT Gate
- NAND Gate
- NOR Gate
- XOR Gate
- XNOR Gate

#### Concepts Practiced

- Verilog module structure
- Input and output ports
- `wire` and `reg`
- Continuous assignment using `assign`
- Gate-level Boolean expressions
- Testbench creation
- `$display`
- `$dumpfile`
- `$dumpvars`
- VCD waveform generation
- Icarus Verilog compilation and simulation
- EPWave waveform analysis

#### Simulation Workflow

```text
Verilog Design
      ↓
Testbench
      ↓
Icarus Verilog
      ↓
VVP Simulation
      ↓
VCD Waveform
      ↓
Waveform Analysis
