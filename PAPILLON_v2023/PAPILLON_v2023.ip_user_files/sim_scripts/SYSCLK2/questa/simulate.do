onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib SYSCLK2_opt

do {wave.do}

view wave
view structure
view signals

do {SYSCLK2.udo}

run -all

quit -force
