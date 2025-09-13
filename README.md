# Int4-Quantized Linear Layer for LLMs

This project implements an **Int4-quantized Linear Layer** within a Large Language Model (LLM). It provides a ready-to-use hardware design flow on AMD FPGAs (tested on V80) with automated scripts to set up, customize, and build designs.

---

## 🚀 Quick Start

### 1. Launch Vivado GUI with Example Design
Run the following command:

```bash
./gen_design.py --gui --conf_json ./hw/amd_v80_gen5x8_23.2_exdes_1/conf_user.json
