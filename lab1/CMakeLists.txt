cmake_minimum_required(VERSION 3.3)
project(lab1)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

set(SOURCE_FILES
    boot/asm.h
    boot/bootmain.c
    kern/debug/assert.h
    kern/debug/kdebug.c
    kern/debug/kdebug.h
    kern/debug/kmonitor.c
    kern/debug/kmonitor.h
    kern/debug/panic.c
    kern/debug/stab.h
    kern/driver/clock.c
    kern/driver/clock.h
    kern/driver/console.c
    kern/driver/console.h
    kern/driver/intr.c
    kern/driver/intr.h
    kern/driver/kbdreg.h
    kern/driver/picirq.c
    kern/driver/picirq.h
    kern/init/init.c
    kern/libs/readline.c
    kern/libs/stdio.c
    kern/mm/memlayout.h
    kern/mm/mmu.h
    kern/mm/pmm.c
    kern/mm/pmm.h
    kern/trap/trap.c
    kern/trap/trap.h
    libs/defs.h
    libs/elf.h
    libs/error.h
    libs/printfmt.c
    libs/stdarg.h
    libs/stdio.h
    libs/string.c
    libs/string.h
    libs/x86.h
    tools/sign.c
    tools/vector.c)

add_executable(lab1 ${SOURCE_FILES})