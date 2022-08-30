#!/bin/bash
pcffile="../../Go_Board_Constraints.pcf"
vfile=$1
basefile=$(basename "${vfile%.*}")
yosys -p "read_verilog $vfile; synth_ice40 -json $basefile.json" && \
nextpnr-ice40 --hx1k --package vq100 --pcf $pcffile --json $basefile.json --asc $basefile.asc && \
icepack $basefile.asc $basefile.bin
