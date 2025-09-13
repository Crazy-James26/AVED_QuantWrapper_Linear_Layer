# Int4-Quantized Linear Layer for LLMs

This project implements an **Int4-quantized Linear Layer** for Large Language Models (LLMs).  
It provides a ready-to-use hardware design flow targeting AMD FPGAs (tested on **V80**) and integrates with the **AVED** design base logic.

---

## 🚀 Quick Start

### 1. Launch Vivado GUI with Example Design
Use the provided script to generate and open the example design:

```bash
./gen_design.py --gui --conf_json ./hw/amd_v80_gen5x8_23.2_exdes_1/conf_user.json
```

This command will:
- Launch Vivado in **GUI mode**.
- Instantiate the **AVED base design logic**.
- Insert the **Int4 Quantized Linear Layer module**.

After this step, you can:
- Explore and customize the block design.
- Adjust **clock frequencies**.
- Validate that the design passes clean checks.

---

### 2. Build the Design
When the design is ready for implementation, open the Vivado **TCL console** and run:

```tcl
do_aved_build
```

This procedure will:
- Run **synthesis** and **implementation**.
- Generate a final block design Tcl script via `write_bd_tcl`.

The generated Tcl script will be located at:

```
<output_directory>/bd_gen/create_bd_design_final.tcl
```

---

### 3. Persist Your Updates
If you want your design changes to be reused in future runs:

1. Copy the generated script:
   ```bash
   cp <output_directory>/bd_gen/create_bd_design_final.tcl <sources>/bd/create_bd_design.tcl
   ```
2. Now, whenever you run `./gen_design.py`, the updated block design will be included automatically.

---

## 📂 Repository Structure

```
.
├── hw/                        # Hardware configuration files (Vivado configs, JSONs)
│   └── amd_v80_gen5x8_23.2_exdes_1/
│       └── conf_user.json
├── src/                       # HDL sources for quantized linear layer
├── scripts/                   # Helper scripts
├── gen_design.py              # Entry point to generate and open design
└── README.md                  # This file
```

---

## 🛠 Requirements

- **Vivado** 2023.2+ (tested with AVED flows)  
- **Python 3.8+** for running helper scripts  

---

