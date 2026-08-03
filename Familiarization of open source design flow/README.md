# Experiment: Open-Source LVS Flow & Parasitic Extraction

## Aim
To perform Layout Versus Schematic (LVS) verification and understand parasitic extraction for a CMOS inverter using open-source EDA tools (Magic, Netgen, and SkyWater 130nm PDK).

## Design Specifications
- **Technology Node:** SkyWater 130nm High-Density PDK (`sky130A`)
- **Supply Voltage ($V_{DD}$):** 1.8 V
- **Devices Used:**
  - PMOS: `sky130_fd_pr__pfet_01v8` ($W = 1.0\,\mu\text{m}$, $L = 0.15\,\mu\text{m}$)
  - NMOS: `sky130_fd_pr__nfet_01v8` ($W = 1.0\,\mu\text{m}$, $L = 0.15\,\mu\text{m}$)
- **Top-level Port Pin Configuration:** `VP`, `VN`, `A`, `Y`

## Circuit Description
The design consists of a standard CMOS inverter. The PMOS pull-up transistor has its gate connected to input `A`, source/body tied to `VP` ($V_{DD}$), and drain tied to output `Y`. The NMOS pull-down transistor has its gate connected to input `A`, source/body tied to `VN` ($V_{SS}$/GND), and drain connected to output `Y`. Parasitic capacitive extraction (`C0`–`C4`) models physical layout coupling between interconnect nets and supply rails.

## Simulation Procedure
1. **Extraction from Magic Layout:**
   - Extracted subcircuit netlist from physical layout (`.ext`) into SPICE format (`.spice`).
   - Performed parasitic capacitance extraction to generate layout-extracted netlist.
2. **LVS Clean Setup:**
   - Checked subcircuit definitions and port alignment across schematic and layout SPICE files.
   - Removed parasitic elements (`sed -i '/^[cC]/d'`) to isolate pure connectivity verification.
3. **Netgen LVS Execution:**
   - Ran batch LVS using Netgen with Sky130 setup scripts:
     ```bash
     netgen -batch lvs "inverter_sch.spice inverter" "inverter_lay.spice inverter" /foss/pdks/sky130A/libs.tech/netgen/sky130A_setup.tcl lvs_comp.out
     ```
4. **Log Inspection:**
   - Inspected comparison output (`lvs_comp.out`) for device count, net count, and port matching status.

## Results
- **Device Count:** 2 devices in Circuit 1 (Layout), 2 devices in Circuit 2 (Schematic)
- **Net Count:** 4 nets in Circuit 1, 4 nets in Circuit 2
- **LVS Comparison Output:** `Circuits match uniquely.`

## Observations
- Initial extraction included 5 parasitic capacitors ($C_0 - C_4$) in the extracted netlist representing parasitic capacitance across signal lines ($A, Y$) and supply lines ($VP, VN$).
- Netgen flags structural mismatches when parasitic components exist in one netlist but not the schematic netlist.
- Aligning port definitions and isolating pure circuit topology verified 1:1 equivalency between layout and schematic.

## Conclusion
The physical layout of the CMOS inverter successfully passed Layout Versus Schematic (LVS) verification against the schematic netlist using Netgen and SkyWater 130nm PDK rules. The LVS check confirmed 100% structural and pin connectivity match (`Circuits match uniquely`).
