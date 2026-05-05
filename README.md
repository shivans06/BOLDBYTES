# BOLDBYTES - Peak Detector System

## Project Overview

**BOLDBYTES** is a digital hardware design project that implements a **Peak Detection System** for continuous data streams. The objective is to design and verify a system that detects peak (local maximum) values in real-time data input.

## Project Description

This project demonstrates the design and verification of a peak detector module written in **Verilog HDL**. The system analyzes incoming data and identifies local maxima values in the stream by comparing consecutive data points.

### Key Characteristics:
- **Language**: Verilog HDL
- **Architecture**: Sequential peak detection logic
- **Input Data Width**: 8-bit
- **Operating Mode**: Synchronous (clock-driven)
- **Reset Type**: Asynchronous reset

## How It Works

The peak detector operates on a simple principle:
- It maintains three registers: `prev` (previous value), `curr` (current value), and `peak` (output flag)
- On each clock cycle, it shifts incoming data through these registers
- A peak is detected when: **current value > previous value AND current value > next incoming value**
- When a peak is detected, the `peak` output is set to `1` for one clock cycle

### Algorithm Logic:
```
if (current > previous) AND (current > data_in) then
    peak = 1
else
    peak = 0
```

## Module Architecture

### Main Module: `peak_detector.v`

**Port Definitions:**
| Port | Type | Width | Description |
|------|------|-------|-------------|
| `clk` | Input | 1-bit | System clock |
| `rst` | Input | 1-bit | Asynchronous reset (active high) |
| `data_in` | Input | 8-bit | Incoming data stream |
| `peak` | Output | 1-bit | Peak detection flag |

**Internal Registers:**
- `prev[7:0]`: Previous data value
- `curr[7:0]`: Current data value
- `peak`: Peak detection output

### Testbench: `tb_PEAK_DETECTOR.v`

The testbench instantiates the peak detector and applies test vectors:

**Test Sequence:**
1. Initialize: Set clock, reset, and data inputs to 0
2. Release reset after 10 time units
3. Apply data sequence with expected peaks at:
   - Peak 1: value = 22 (22 > 12 and 22 > 16)
   - Peak 2: value = 32 (32 > 27 and 32 > 30)
   - Peak 3: value = 5 (5 > 4 and 5 > 3)

**Simulation Parameters:**
- Clock period: 10 time units (5 units half-period)
- Total simulation time: Extended for complete test execution
- Output monitoring: Real-time `$monitor` displays time, data_in, and peak values

## Project Files

```
shivans06/BOLDBYTES/
├── PEAK_DETECTOR.v                              # Main peak detector module
├── tb_PEAK_DETECTOR.v                           # Testbench module
├── PEAKDETECTOR(SIMULATION).png                 # Simulation results
├── PEAK_DETECTOR(TESTBENCH SIMULATION AND SCHEMATICS).png  # Detailed schematics
├── PEAK_DETECTOR(WAVEFORM).png                  # Waveform analysis
├── simvision11618.diag                          # Simulation visualization file
└── README.md                                    # This file
```

## Simulation Results

The project includes detailed simulation outputs:
- **Waveform Analysis**: Visual representation of data_in and peak signals over time
- **Testbench Simulation**: Complete simulation with timing and signal states
- **Schematics**: Hardware implementation schematics and signal flow diagrams

## Usage & Simulation

### Prerequisites:
- Verilog HDL simulator (e.g., ModelSim, VCS, Icarus Verilog)
- Standard Verilog synthesis tools

### Running Simulation:
```bash
# Compile the modules
iverilog -o peak_detector PEAK_DETECTOR.v tb_PEAK_DETECTOR.v

# Run simulation
vvp peak_detector
```

### Expected Output:
The testbench will display a table showing:
- Simulation time
- Input data value
- Peak detection flag (1 when peak detected, 0 otherwise)

## Technical Specifications

| Parameter | Value |
|-----------|-------|
| Input Data Width | 8 bits (0-255) |
| Clock Type | Synchronous |
| Reset Type | Asynchronous (Active High) |
| Peak Output Duration | 1 clock cycle |
| Module Type | Combinational Logic + Sequential Logic |

## Design Considerations

1. **Latency**: The detector requires 2 clock cycles to detect a peak due to data pipeline
2. **Edge Cases**: Peaks at data stream boundaries require special handling
3. **Data Range**: Works with 8-bit unsigned integers (0-255)
4. **Reset Behavior**: Asynchronous reset clears all registers immediately

## Verification & Testing

The testbench verifies:
- ✓ Correct peak detection at local maxima
- ✓ Reset functionality
- ✓ Clock synchronization
- ✓ Data pipeline behavior
- ✓ Output timing and duration

## Author

**BOLDBYTES** - Digital Hardware Design Project  
Repository: [shivans06/BOLDBYTES](https://github.com/shivans06/BOLDBYTES)

## License

This project is open source and available on GitHub.

---

**Last Updated**: May 5, 2026