# 32-Point FFT Using Cooley-Tukey

## 📌 Table of Contents
- [System Design](#system-design)
- [FFT Top-Level Architecture](#fft-top-level-architecture)
- [Pre-Synthesis Simulation](#pre-synthesis-simulation)
- [FPGA Flow](#fpga-flow)
- [Figures](#figures)

---

## 🧠 System Design

### Algorithm Description

The project implements a 32-point Fast Fourier Transform (FFT) using the **Decimation-In-Time (DIT)** Cooley-Tukey algorithm. It employs **5 stages** of butterfly operations and processes the input in time domain to output frequency domain data.

### Processing Units

- Uses 16 time-shared **butterfly units** (rather than 80 parallel units).
- Each butterfly performs operations on two complex inputs and a twiddle factor.

### Fixed-Point Analysis

- **Input**: `S(7,0)` (8 bits: 1 sign + 7 integer).
- **Twiddle Factor**: Best SQNR with `S(1,6)` (44.653 dB).
- **Butterfly Output**: Chose `S(12,0)` (44.196 dB) for balance between performance and hardware cost.

---

## 🧩 FFT Top-Level Architecture

### Components

- 16 **MAC units**
- 3 **Register Banks** (I/O and intermediate)
- **MUX Selection** unit
- **Control Unit**

All logic operates at 100 MHz. I/O updates every 5 cycles (equivalent to 20 MHz input rate) using an enable signal, avoiding clock domain crossing.

### MAC Optimization

Complex multiplication optimized using **3 real multipliers**:
```
Z1 × Z2 = (a + ib)(c + id) = (ac − bd) + i(ad + bc)
```

### Fixed-Point Pipeline

- Twiddle: `S(1,6)`
- Input: `S(12,0)`
- Mult Output: `S(15,6)`
- Final Output after Rounding/Saturation: `S(12,0)`

---

## 🧪 Pre-Synthesis Simulation

- Verification done using **Python model** (random input & expected output).
- Assertions included for error checking.
- Output appears correctly **after 5 cycles**.
- Special test with **pulse input** confirmed rectangular output shape.

---

## 🔧 FPGA Flow

### Target Board

- **Zynq UltraScale+ ZCU106**
- **Device**: `xczu7ev-ffvc1156-2-e`

### Observations

- **Post-Synthesis Output** matched pre-synthesis simulation.
- Utilization:
  - DSP: <3%
  - LUTs: <2%
  - FFs: <1%
  - IOs: High due to interface; suggested shift to serial (AXI Stream)
- **Timing Analysis**:
  - Setup Slack: `+4.003 ns`
  - Hold Slack: `+0.053 ns`
- **Critical Path**: MUX ➝ MAC ➝ Register input (due to complex operations)
- **Power Estimation**:
  - Performed with `saif` file over 1080ns simulation
  - Dynamic and total power calculated post simulation

---

## 🖼️ Figures

Figures include:
- Top-level architecture
- MAC/Butterfly/MUX unit designs
- Simulation waveforms
- Synthesis schematic
- Area/Timing/Power reports

(Refer to `report.pdf` or `/docs` directory for visuals)

---

## ✅ Conclusion

This 32-point FFT design demonstrates an area-optimized, fixed-point architecture suitable for FPGA implementation, achieving accurate output and efficient hardware utilization.

---

## 🛠️ Tools Used

- QuestaSim for simulation
- Vivado for synthesis and implementation
- Python for model verification

---

## 📎 License

This project is part of an academic submission and may not be used for commercial purposes without explicit permission.

---
