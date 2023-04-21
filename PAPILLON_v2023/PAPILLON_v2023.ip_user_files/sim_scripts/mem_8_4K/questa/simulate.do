onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib mem_8_4K_opt

do {wave.do}

view wave
view structure
view signals

do {mem_8_4K.udo}

run -all

quit -force
