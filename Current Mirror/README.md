# Current Mirror

Design, simulation, and comparison of Simple and Cascode NMOS Current Mirrors using Cadence Virtuoso and Spectre simulator on the **gpdk090** ($90\text{ nm}$) process node.

---

## Device Sizing & Topologies

Derived from the $g_m/I_D = 15\text{ V}^{-1}$ characterization curve:

### 1. Simple Current Mirror
* **1 mA Output ($1:1$ Mirror Ratio):**
  * $I_{ref} = 1\text{ mA}$
  * Reference Device ($M_1$): $W = 34.7\ \mu\text{m}$, $nf = 2$
  * Mirror Device ($M_2$): $W = 34.7\ \mu\text{m}$, $nf = 2$
* **2 mA Output ($1:2$ Mirror Ratio):**
  * $I_{ref} = 1\text{ mA}$
  * Reference Device ($M_1$): $W = 34.7\ \mu\text{m}$, $nf = 2$
  * Mirror Device ($M_2$): $W = 69.4\ \mu\text{m}$, $nf = 4$

---

### 2. Cascode Current Mirror
* **1 mA Output ($1:1$ Mirror Ratio):**
  * $I_{ref} = 1\text{ mA}$
  * Reference Leg ($NM_1, NM_2$): $W = 34.7\ \mu\text{m}$, $nf = 2$
  * Output Leg ($NM_0, NM_3$): $W = 34.7\ \mu\text{m}$, $nf = 2$
* **2 mA Output ($1:2$ Mirror Ratio):**
  * $I_{ref} = 1\text{ mA}$
  * Reference Leg ($NM_1, NM_2$): $W = 34.7\ \mu\text{m}$, $nf = 2$
  * Output Leg ($NM_0, NM_3$): $W = 69.4\ \mu\text{m}$, $nf = 4$

---

## Performance Comparison

| Parameter | Simple Current Mirror | Cascode Current Mirror |
| :--- | :--- | :--- |
| **Output Resistance ($R_{out}$)** | Moderate ($r_o$) | Extremely High ($\approx g_m r_o^2$) |
| **Channel-Length Modulation** | High impact on $I_{out}$ accuracy | Suppressed (Bottom device shielded) |
| **Current Mirroring Precision** | Moderate | High |

---

## Key Takeaways & Inference

1. **Output Resistance:** The addition of cascode transistors increases the small-signal output impedance by approximately $g_m r_o$, making the output current almost invariant to $V_{DS}$ sweeps.
2. **Current Scaling:** Scaling the output current from $1\text{ mA}$ to $2\text{ mA}$ while maintaining a constant $1\text{ mA}$ reference current was cleanly achieved by doubling the transistor width ($W$) and finger count ($nf$) in the output leg without changing the $g_m/I_D$ operating point.
