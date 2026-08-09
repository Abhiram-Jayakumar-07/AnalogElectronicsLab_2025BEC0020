# NMOS I-V Characteristics Analysis

### **Objective**
Characterization of an NMOS transistor ($W = 1\,\mu\text{m}$, $L = 100\,\text{nm}$) in Cadence Virtuoso using the GPDK 090nm process technology (`gpdk090`).

---

### **Circuit Configuration**
* **Library Name**: `AbhiAnalog`
* **Cell Name**: `nmos_chara`
* **DC Sources**: $V_{GS}$ ($V_0$) and $V_{DS}$ ($V_1$) applied relative to Ground (`gnd`)
* **Terminal Connections**: Transistor Source and Bulk terminals tied to Ground

---

### **Simulations Conducted**
* **Transfer Characteristics**: $I_D$ vs. $V_{GS}$ DC sweep
* **Output Characteristics**: $I_D$ vs. $V_{DS}$ DC sweep
* **Parametric Sweep**: $I_D$ vs. $V_{DS}$ family of curves across varying $V_{GS}$ levels
