# RC Low-Pass Filter - AC Analysis

## Objective
Design an RC low-pass filter, simulate its frequency response in Xschem/Ngspice across three capacitance values (1 µF, 10 µF, 20 µF), and compare the simulated -3 dB cutoff frequencies against theoretical predictions.

## Circuit Configuration
- Resistor (R1): 1 kΩ
- Capacitor (C1): 1 µF, 10 µF, 20 µF
- AC Source (V1): 1 V AC

## Theoretical Model
The cutoff frequency (-3 dB point) is calculated using:

$f_c = \frac{1}{2\pi RC}$

### Theoretical Values
- C = 1 µF: $f_c$ = 159.15 Hz
- C = 10 µF: $f_c$ = 15.92 Hz
- C = 20 µF: $f_c$ = 7.96 Hz

## Simulation Setup
The simulation runs an AC logarithmic sweep from 1 Hz to 100 kHz with a parameter loop across all three capacitance values.

### Netlist Control Code
```spice
name=s1
only_toplevel=false
value="
.control
  alter C1 = 1u
  ac dec 20 1 100k
  setplot ac1
  let C_1uF = db(vout)

  alter C1 = 10u
  ac dec 20 1 100k
  setplot ac2
  let C_10uF = db(vout)

  alter C1 = 20u
  ac dec 20 1 100k
  setplot ac3
  let C_20uF = db(vout)

  plot ac1.C_1uF ac2.C_10uF ac3.C_20uF
.endc
"
