#ifndef __BOOT_ASM_H__
#define __BOOT_ASM_H__

/* Assembler macros to create x86 segments 
  与x86保护模式的段访问方式相关的宏定义 */

/* Normal segment */
#define SEG_NULLASM                                             \
    .word 0, 0;                                                 \
    .byte 0, 0, 0, 0

#define SEG_ASM(type,base,lim)                                  \
    .word (((lim) >> 12) & 0xffff), ((base) & 0xffff);          \
    .byte (((base) >> 16) & 0xff), (0x90 | (type)),             \
        (0xC0 | (((lim) >> 28) & 0xf)), (((base) >> 24) & 0xff)


/* Application segment type bits 应用段类型位 */
#define STA_X       0x8     // Executable segment 可执行段
#define STA_E       0x4     // Expand down (non-executable segments) 扩展（非可执行段）
#define STA_C       0x4     // Conforming code segment (executable only) 符合代码段（可执行）
#define STA_W       0x2     // Writeable (non-executable segments) 可写的（非可执行段）
#define STA_R       0x2     // Readable (executable segments) 可读（可执行段）
#define STA_A       0x1     // Accessed 访问

#endif /* !__BOOT_ASM_H__ */

