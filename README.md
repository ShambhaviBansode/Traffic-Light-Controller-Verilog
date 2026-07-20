# Traffic Light Controller using Verilog 

A Finite State Machine (FSM) based Traffic Light Controller designed using Verilog HDL. The controller manages traffic signals for multiple roads by transitioning through predefined states with configurable timing intervals. Functional simulation was performed using Xilinx Vivado.

---

## Features

- FSM-based traffic signal controller
- Six traffic light states
- Configurable timing parameters
- Modular Verilog implementation
- Functional simulation with testbench

---

## Project Files

| File | Description |
|------|-------------|
| traffic_light_controller.v | Main Verilog design |
| traffic_controller_tb.v | Testbench for simulation |
| simulation.png | Functional simulation waveform |

---

## State Diagram

```
S1 → S2 → S3 → S4 → S5 → S6 → S1
```

---

## Light Encoding

| Binary | Light |
|--------|-------|
| 001 | Green |
| 010 | Yellow |
| 100 | Red |

---

## Development Tools

- Verilog HDL
- Xilinx Vivado 2025.2

---

## Simulation Result

![Simulation Waveform](simulation.png)

The waveform verifies the correct sequence of traffic light transitions according to the designed FSM.

---

## Applications

- FPGA Design
- Digital System Design
- RTL Design Practice
- FSM Implementation
- Academic Verilog Projects

---

## Author

**Shambhavi Bansode**

Electronics and Communication Engineering  
National Institute of Technology Kurukshetra

---
