#include <x86.h>
#include <intr.h>

// irq: Interrupt Reques 中断请求
/* intr_enable - enable irq interrupt 使能中断*/
void
intr_enable(void) {
    sti();
}

/* intr_disable - disable irq interrupt 屏蔽中断*/
void
intr_disable(void) {
    cli();
}

