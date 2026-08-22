v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 770 -780 770 -720 {lab=#net1}
N 770 -780 870 -780 {lab=#net1}
N 770 -660 770 -630 {lab=0}
N 770 -630 1010 -630 {lab=0}
N 1010 -660 1010 -630 {lab=0}
N 1010 -780 1010 -720 {lab=vout}
N 930 -780 1010 -780 {lab=vout}
C {res.sym} 900 -780 3 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {capa.sym} 1010 -690 0 0 {name=C1
m=1
value=10u
footprint=1206
device="ceramic capacitor"}
C {vsource.sym} 770 -690 0 0 {name=V1
value="AC 1"}
C {gnd.sym} 770 -630 0 0 {name=l1 lab=0}
C {lab_pin.sym} 1010 -780 2 0 {name=p1 sig_type=std_logic lab=vout}
C {code.sym} 550 -780 0 0 {name=s1
only_toplevel=false
value="
.control
  set color1=black
  ac dec 20 1 100k
  run
  let vdb = db(vout)
  let dc_gain = vdb[0]
  meas ac f_3db when vdb=dc_gain-3
  plot db(vout)
.endc
"}
