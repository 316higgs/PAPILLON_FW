onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib SYSCLK0_opt

do {wave.do}

view wave
view structure
view signals

do {SYSCLK0.udo}

run -all

quit -force
