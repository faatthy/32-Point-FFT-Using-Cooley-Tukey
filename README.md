
# 🔧 System Design
![image](https://github.com/user-attachments/assets/db7025bf-4a2c-4852-878a-779681c741ef)

## Algorithm
- Uses radix-2 DIT FFT with 5 stages (since log₂(32) = 5).
- Each stage uses butterfly units for complex arithmetic.
- Time-sharing is employed with **16 butterfly units**, reused over 5 cycles.
![image](https://github.com/user-attachments/assets/d0b9e4ec-e768-4e9b-9963-2c10cc0c6451)

## Processing Unit
- Core unit is the **butterfly**, which performs complex multiplications and additions.
- A single-stage, time-multiplexed architecture is used to **save area**.

## Fixed-Point Analysis
- Input is **8-bit fixed-point (S(7,0))**.
- Twiddle factors and output formats tested for optimal **SQNR (Signal-to-Quantization-Noise Ratio)**.
- **Chosen butterfly output format**: **S(12,0)** for a balance of precision and hardware simplicity.

---

# 🧱 Hardware Architecture

## Main Components
- 16 MAC units (for multiply-accumulate operations)
- MUX selection stage
- 3 register banks (input, output, intermediate)
- Control unit (counter-based)

## Clocking
- Operates at **100 MHz**, with I/O operating effectively at **20 MHz**  
- Uses **enable signals** instead of separate clock domains

---

# ⚙️ Design Details

## MAC Optimization
- Reduces 4 complex multiplications to **3** using algebraic transformations
![image](https://github.com/user-attachments/assets/2b812913-ae76-4fe9-ac8a-60016bd0109f)

## Fixed-Point Pipeline
- Input: 8-bit integer  
- Twiddle: S(1,6)  
- Multiplier Output: S(15,6)  
- Final rounded and saturated output: **S(12,0)**  

---

# 🧪 Simulation & Verification

## Pre-synthesis Simulation
- Verified using a Python-generated testbench
- Output compared against expected FFT results with **zero errors**
- Special test case: **Pulse input yielded rectangular output** as expected

---

# 🔬 FPGA Implementation

**Platform**: Xilinx Zynq UltraScale+ ZCU106  

## Modules Synthesized
- Matches high-level architecture exactly
![image](https://github.com/user-attachments/assets/3ecf0e88-6e0f-4849-8c9e-9dbe198d5b7c)

## Resource Utilization
- Very low: ≤ **3% DSP**, **2% LUTs**, **1% FF**
- IO bottlenecks can be reduced using **serial protocols like AXI stream**
![image](https://github.com/user-attachments/assets/8f0311ad-934d-43ff-83f3-f78bb97dcb94)

---

# ⏱️ Timing & Power Analysis

## Timing
- **Setup slack**: 4.003 ns  
- **Hold slack**: 0.053 ns  
- **Critical path**: From **MUX to MAC unit**
![image](https://github.com/user-attachments/assets/395b003f-5c98-4804-aeb8-c81621e77c2e)

## Power
- Based on a **1080 ns SAIF file (Switching Activity Interchange Format)**
![image](https://github.com/user-attachments/assets/6c8c2b53-ba5d-4b58-b26a-5df099c00014)

---

# ✅ Conclusion

- Efficient **area and power-optimized 32-point FFT** implementation  
- Validated through simulation and successfully synthesized for FPGA  
- Met design goals with **low error**, **good SQNR**, and **minimal resource usage**
