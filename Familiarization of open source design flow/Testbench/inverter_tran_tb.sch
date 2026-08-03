v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {The inverter switches cleanly and correctly — output goes low when input is high and vice versa,
with sharp transitions, full 0–1.8V swing, and a small propagation delay from the transistors charging/discharging 
the output node.} -480 150 0 0 0.4 0.4 {}
N -170 -10 -170 30 {lab=Vdd}
N -120 -10 -120 30 {lab=Vin}
N 140 70 140 105 {lab=0}
N 140 -5 170 -5 {lab=Vdd}
N 85 30 85 50 {lab=Vin}
N 225 35 270 35 {lab=Vout}
C {vsource.sym} -170 60 0 0 {name=Vdd value=1.8 savecurrent=false}
C {vsource.sym} -120 60 0 0 {name=Vin value="pulse(0 1.8 0 0.1n 0.1n 5n 10n)"}
C {lab_pin.sym} -170 -10 0 0 {name=p1 sig_type=std_logic lab=Vdd
}
C {lab_pin.sym} -120 -10 2 0 {name=p2 sig_type=std_logic lab=Vin
}
C {inverter.sym} 175 45 0 0 {name=x1}
C {lab_pin.sym} 85 50 3 0 {name=p3 sig_type=std_logic lab=Vin
}
C {lab_pin.sym} 170 -5 2 0 {name=p4 sig_type=std_logic lab=Vdd
}
C {gnd.sym} 140 105 0 0 {name=l1 lab=0}
C {gnd.sym} -120 90 0 0 {name=l2 lab=0}
C {gnd.sym} -170 90 0 0 {name=l3 lab=0}
C {opin.sym} 270 35 0 0 {name=p5 lab=Vout
}
C {devices/code.sym} -200 -180 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {devices/code_shown.sym} 280 -140 0 0 {name=NGSPICE
only_toplevel=true
value="
.option savecurrents
.control
save all
tran 0.1n 50n
plot v(Vin)
plot v(Vout)
.endc
" }
