# REQUIRES: msp430
# RUN: llvm-mc -filetype=obj -triple=msp430-elf %s -o %t

## Check an empty section w/o region is allowed.

# RUN: echo "MEMORY { ram (!rx) : ORIGIN = 0x8000, LENGTH = 8K } \
# RUN: SECTIONS { \
# RUN:   .text : { *(.text) } > ram \
# RUN:   .stack (ORIGIN(ram) + LENGTH(ram)) : { PROVIDE(__stack = .); *(.stack) } \
# RUN: }" > %t.script
# RUN: ld.lld -o %t2 --script %t.script %t 2>&1

.text
.global _start
_start:
  mov __stack, sp
