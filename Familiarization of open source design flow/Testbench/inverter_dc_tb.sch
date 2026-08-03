v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -170 -10 -170 30 {lab=Vdd}
N -120 -10 -120 30 {lab=Vin}
N 40 60 40 95 {lab=0}
N 55 -15 85 -15 {lab=Vdd}
N -15 20 -15 40 {lab=Vin}
N 130 25 180 25 {lab=Vout}
N 30 95 40 95 {lab=0}
N 40 -15 55 -15 {lab=Vdd}
N 125 25 130 25 {lab=Vout}
N -25 40 -15 40 {lab=Vin}
C {vsource.sym} -170 60 0 0 {name=Vdd value=1.8 savecurrent=false}
C {vsource.sym} -120 60 0 0 {name=Vin value=0 savecurrent=false}
C {lab_pin.sym} -170 -10 0 0 {name=p1 sig_type=std_logic lab=Vdd
}
C {lab_pin.sym} -120 -10 2 0 {name=p2 sig_type=std_logic lab=Vin
}
C {lab_pin.sym} -25 40 3 0 {name=p3 sig_type=std_logic lab=Vin
}
C {lab_pin.sym} 85 -15 2 0 {name=p4 sig_type=std_logic lab=Vdd
}
C {gnd.sym} 30 95 0 0 {name=l1 lab=0}
C {gnd.sym} -120 90 0 0 {name=l2 lab=0}
C {gnd.sym} -170 90 0 0 {name=l3 lab=0}
C {opin.sym} 180 25 0 0 {name=p5 lab=Vout
}
C {devices/code.sym} -200 -180 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {devices/code_shown.sym} 270 -310 0 0 {name=NGSPICE
only_toplevel=true
value="
.option savecurrents
.control
save all
dc Vin 0 1.8 0.1
plot v(Vin) v(Vout)
.endc
" }
C {inverter.sym} 75 35 0 0 {name=x1}
