
bin/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 18             	sub    $0x18,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	ba 80 fd 10 00       	mov    $0x10fd80,%edx
  10000b:	b8 16 ea 10 00       	mov    $0x10ea16,%eax
  100010:	29 c2                	sub    %eax,%edx
  100012:	89 d0                	mov    %edx,%eax
  100014:	83 ec 04             	sub    $0x4,%esp
  100017:	50                   	push   %eax
  100018:	6a 00                	push   $0x0
  10001a:	68 16 ea 10 00       	push   $0x10ea16
  10001f:	e8 36 32 00 00       	call   10325a <memset>
  100024:	83 c4 10             	add    $0x10,%esp

    cons_init();                // init the console 控制台
  100027:	e8 a3 14 00 00       	call   1014cf <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  10002c:	c7 45 f4 e0 33 10 00 	movl   $0x1033e0,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100033:	83 ec 08             	sub    $0x8,%esp
  100036:	ff 75 f4             	pushl  -0xc(%ebp)
  100039:	68 fc 33 10 00       	push   $0x1033fc
  10003e:	e8 be 02 00 00       	call   100301 <cprintf>
  100043:	83 c4 10             	add    $0x10,%esp

    print_kerninfo();
  100046:	e8 c2 07 00 00       	call   10080d <print_kerninfo>

    grade_backtrace();
  10004b:	e8 76 00 00 00       	call   1000c6 <grade_backtrace>

    pmm_init();                 // init physical memory management 物理内存管理
  100050:	e8 05 29 00 00       	call   10295a <pmm_init>

   pic_init();                 // init interrupt controller 中断控制器
  100055:	e8 b9 15 00 00       	call   101613 <pic_init>
    idt_init();                 // init interrupt descriptor table 中断描述符表
  10005a:	e8 fa 16 00 00       	call   101759 <idt_init>

    clock_init();               // init clock interrupt 时钟中断
  10005f:	e8 ba 0c 00 00       	call   100d1e <clock_init>
    intr_enable();              // enable irq interrupt 使能中断
  100064:	e8 20 15 00 00       	call   101589 <intr_enable>

    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test() 注释
    // user/kernel mode switch test
    lab1_switch_test();
  100069:	e8 45 01 00 00       	call   1001b3 <lab1_switch_test>

    /* do nothing */
    while (1);
  10006e:	eb fe                	jmp    10006e <kern_init+0x6e>

00100070 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100070:	55                   	push   %ebp
  100071:	89 e5                	mov    %esp,%ebp
  100073:	83 ec 08             	sub    $0x8,%esp
    mon_backtrace(0, NULL, NULL);
  100076:	83 ec 04             	sub    $0x4,%esp
  100079:	6a 00                	push   $0x0
  10007b:	6a 00                	push   $0x0
  10007d:	6a 00                	push   $0x0
  10007f:	e8 cb 0b 00 00       	call   100c4f <mon_backtrace>
  100084:	83 c4 10             	add    $0x10,%esp
}
  100087:	c9                   	leave  
  100088:	c3                   	ret    

00100089 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100089:	55                   	push   %ebp
  10008a:	89 e5                	mov    %esp,%ebp
  10008c:	53                   	push   %ebx
  10008d:	83 ec 04             	sub    $0x4,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  100090:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  100093:	8b 55 0c             	mov    0xc(%ebp),%edx
  100096:	8d 5d 08             	lea    0x8(%ebp),%ebx
  100099:	8b 45 08             	mov    0x8(%ebp),%eax
  10009c:	51                   	push   %ecx
  10009d:	52                   	push   %edx
  10009e:	53                   	push   %ebx
  10009f:	50                   	push   %eax
  1000a0:	e8 cb ff ff ff       	call   100070 <grade_backtrace2>
  1000a5:	83 c4 10             	add    $0x10,%esp
}
  1000a8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000ab:	c9                   	leave  
  1000ac:	c3                   	ret    

001000ad <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000ad:	55                   	push   %ebp
  1000ae:	89 e5                	mov    %esp,%ebp
  1000b0:	83 ec 08             	sub    $0x8,%esp
    grade_backtrace1(arg0, arg2);
  1000b3:	83 ec 08             	sub    $0x8,%esp
  1000b6:	ff 75 10             	pushl  0x10(%ebp)
  1000b9:	ff 75 08             	pushl  0x8(%ebp)
  1000bc:	e8 c8 ff ff ff       	call   100089 <grade_backtrace1>
  1000c1:	83 c4 10             	add    $0x10,%esp
}
  1000c4:	c9                   	leave  
  1000c5:	c3                   	ret    

001000c6 <grade_backtrace>:

void
grade_backtrace(void) {
  1000c6:	55                   	push   %ebp
  1000c7:	89 e5                	mov    %esp,%ebp
  1000c9:	83 ec 08             	sub    $0x8,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000cc:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000d1:	83 ec 04             	sub    $0x4,%esp
  1000d4:	68 00 00 ff ff       	push   $0xffff0000
  1000d9:	50                   	push   %eax
  1000da:	6a 00                	push   $0x0
  1000dc:	e8 cc ff ff ff       	call   1000ad <grade_backtrace0>
  1000e1:	83 c4 10             	add    $0x10,%esp
}
  1000e4:	c9                   	leave  
  1000e5:	c3                   	ret    

001000e6 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  1000e6:	55                   	push   %ebp
  1000e7:	89 e5                	mov    %esp,%ebp
  1000e9:	83 ec 18             	sub    $0x18,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  1000ec:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  1000ef:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  1000f2:	8c 45 f2             	mov    %es,-0xe(%ebp)
  1000f5:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  1000f8:	66 8b 45 f6          	mov    -0xa(%ebp),%ax
  1000fc:	0f b7 c0             	movzwl %ax,%eax
  1000ff:	83 e0 03             	and    $0x3,%eax
  100102:	89 c2                	mov    %eax,%edx
  100104:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100109:	83 ec 04             	sub    $0x4,%esp
  10010c:	52                   	push   %edx
  10010d:	50                   	push   %eax
  10010e:	68 01 34 10 00       	push   $0x103401
  100113:	e8 e9 01 00 00       	call   100301 <cprintf>
  100118:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  cs = %x\n", round, reg1);
  10011b:	66 8b 45 f6          	mov    -0xa(%ebp),%ax
  10011f:	0f b7 d0             	movzwl %ax,%edx
  100122:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100127:	83 ec 04             	sub    $0x4,%esp
  10012a:	52                   	push   %edx
  10012b:	50                   	push   %eax
  10012c:	68 0f 34 10 00       	push   $0x10340f
  100131:	e8 cb 01 00 00       	call   100301 <cprintf>
  100136:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ds = %x\n", round, reg2);
  100139:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10013c:	0f b7 d0             	movzwl %ax,%edx
  10013f:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100144:	83 ec 04             	sub    $0x4,%esp
  100147:	52                   	push   %edx
  100148:	50                   	push   %eax
  100149:	68 1d 34 10 00       	push   $0x10341d
  10014e:	e8 ae 01 00 00       	call   100301 <cprintf>
  100153:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  es = %x\n", round, reg3);
  100156:	66 8b 45 f2          	mov    -0xe(%ebp),%ax
  10015a:	0f b7 d0             	movzwl %ax,%edx
  10015d:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100162:	83 ec 04             	sub    $0x4,%esp
  100165:	52                   	push   %edx
  100166:	50                   	push   %eax
  100167:	68 2b 34 10 00       	push   $0x10342b
  10016c:	e8 90 01 00 00       	call   100301 <cprintf>
  100171:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ss = %x\n", round, reg4);
  100174:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100177:	0f b7 d0             	movzwl %ax,%edx
  10017a:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  10017f:	83 ec 04             	sub    $0x4,%esp
  100182:	52                   	push   %edx
  100183:	50                   	push   %eax
  100184:	68 39 34 10 00       	push   $0x103439
  100189:	e8 73 01 00 00       	call   100301 <cprintf>
  10018e:	83 c4 10             	add    $0x10,%esp
    round ++;
  100191:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100196:	40                   	inc    %eax
  100197:	a3 20 ea 10 00       	mov    %eax,0x10ea20
}
  10019c:	c9                   	leave  
  10019d:	c3                   	ret    

0010019e <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  10019e:	55                   	push   %ebp
  10019f:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
    asm volatile (
  1001a1:	83 ec 08             	sub    $0x8,%esp
  1001a4:	cd 78                	int    $0x78
  1001a6:	89 ec                	mov    %ebp,%esp
        "int %0 \n"
        "movl %%ebp, %%esp"  //ebp是在内核态时的ebp
        : 
        : "i"(T_SWITCH_TOU)   //120
    );
}
  1001a8:	5d                   	pop    %ebp
  1001a9:	c3                   	ret    

001001aa <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001aa:	55                   	push   %ebp
  1001ab:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
    asm volatile (
  1001ad:	cd 79                	int    $0x79
  1001af:	89 ec                	mov    %ebp,%esp
        "int %0 \n"    //这里是在USER，int就切到了kernel，这个int和上面那个int不一样，它暗藏了一个sub 0x08,%%esp
        "movl %%ebp, %%esp \n"
        : 
        : "i"(T_SWITCH_TOK)
    );
}
  1001b1:	5d                   	pop    %ebp
  1001b2:	c3                   	ret    

001001b3 <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001b3:	55                   	push   %ebp
  1001b4:	89 e5                	mov    %esp,%ebp
  1001b6:	83 ec 08             	sub    $0x8,%esp
    lab1_print_cur_status();
  1001b9:	e8 28 ff ff ff       	call   1000e6 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001be:	83 ec 0c             	sub    $0xc,%esp
  1001c1:	68 48 34 10 00       	push   $0x103448
  1001c6:	e8 36 01 00 00       	call   100301 <cprintf>
  1001cb:	83 c4 10             	add    $0x10,%esp
    lab1_switch_to_user();
  1001ce:	e8 cb ff ff ff       	call   10019e <lab1_switch_to_user>
    lab1_print_cur_status();
  1001d3:	e8 0e ff ff ff       	call   1000e6 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001d8:	83 ec 0c             	sub    $0xc,%esp
  1001db:	68 68 34 10 00       	push   $0x103468
  1001e0:	e8 1c 01 00 00       	call   100301 <cprintf>
  1001e5:	83 c4 10             	add    $0x10,%esp
    lab1_switch_to_kernel();
  1001e8:	e8 bd ff ff ff       	call   1001aa <lab1_switch_to_kernel>
    lab1_print_cur_status();
  1001ed:	e8 f4 fe ff ff       	call   1000e6 <lab1_print_cur_status>
}
  1001f2:	c9                   	leave  
  1001f3:	c3                   	ret    

001001f4 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  1001f4:	55                   	push   %ebp
  1001f5:	89 e5                	mov    %esp,%ebp
  1001f7:	83 ec 18             	sub    $0x18,%esp
    if (prompt != NULL) {
  1001fa:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1001fe:	74 13                	je     100213 <readline+0x1f>
        cprintf("%s", prompt);
  100200:	83 ec 08             	sub    $0x8,%esp
  100203:	ff 75 08             	pushl  0x8(%ebp)
  100206:	68 87 34 10 00       	push   $0x103487
  10020b:	e8 f1 00 00 00       	call   100301 <cprintf>
  100210:	83 c4 10             	add    $0x10,%esp
    }
    int i = 0, c;
  100213:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  10021a:	e8 6b 01 00 00       	call   10038a <getchar>
  10021f:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100222:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100226:	79 0a                	jns    100232 <readline+0x3e>
            return NULL;
  100228:	b8 00 00 00 00       	mov    $0x0,%eax
  10022d:	e9 81 00 00 00       	jmp    1002b3 <readline+0xbf>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100232:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  100236:	7e 2b                	jle    100263 <readline+0x6f>
  100238:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  10023f:	7f 22                	jg     100263 <readline+0x6f>
            cputchar(c);
  100241:	83 ec 0c             	sub    $0xc,%esp
  100244:	ff 75 f0             	pushl  -0x10(%ebp)
  100247:	e8 db 00 00 00       	call   100327 <cputchar>
  10024c:	83 c4 10             	add    $0x10,%esp
            buf[i ++] = c;
  10024f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100252:	8d 50 01             	lea    0x1(%eax),%edx
  100255:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100258:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10025b:	88 90 40 ea 10 00    	mov    %dl,0x10ea40(%eax)
  100261:	eb 4b                	jmp    1002ae <readline+0xba>
        }
        else if (c == '\b' && i > 0) {
  100263:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  100267:	75 19                	jne    100282 <readline+0x8e>
  100269:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10026d:	7e 13                	jle    100282 <readline+0x8e>
            cputchar(c);
  10026f:	83 ec 0c             	sub    $0xc,%esp
  100272:	ff 75 f0             	pushl  -0x10(%ebp)
  100275:	e8 ad 00 00 00       	call   100327 <cputchar>
  10027a:	83 c4 10             	add    $0x10,%esp
            i --;
  10027d:	ff 4d f4             	decl   -0xc(%ebp)
  100280:	eb 2c                	jmp    1002ae <readline+0xba>
        }
        else if (c == '\n' || c == '\r') {
  100282:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  100286:	74 06                	je     10028e <readline+0x9a>
  100288:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  10028c:	75 20                	jne    1002ae <readline+0xba>
            cputchar(c);
  10028e:	83 ec 0c             	sub    $0xc,%esp
  100291:	ff 75 f0             	pushl  -0x10(%ebp)
  100294:	e8 8e 00 00 00       	call   100327 <cputchar>
  100299:	83 c4 10             	add    $0x10,%esp
            buf[i] = '\0';
  10029c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10029f:	05 40 ea 10 00       	add    $0x10ea40,%eax
  1002a4:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1002a7:	b8 40 ea 10 00       	mov    $0x10ea40,%eax
  1002ac:	eb 05                	jmp    1002b3 <readline+0xbf>
        }
    }
  1002ae:	e9 67 ff ff ff       	jmp    10021a <readline+0x26>
}
  1002b3:	c9                   	leave  
  1002b4:	c3                   	ret    

001002b5 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1002b5:	55                   	push   %ebp
  1002b6:	89 e5                	mov    %esp,%ebp
  1002b8:	83 ec 08             	sub    $0x8,%esp
    cons_putc(c);
  1002bb:	83 ec 0c             	sub    $0xc,%esp
  1002be:	ff 75 08             	pushl  0x8(%ebp)
  1002c1:	e8 39 12 00 00       	call   1014ff <cons_putc>
  1002c6:	83 c4 10             	add    $0x10,%esp
    (*cnt) ++;
  1002c9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002cc:	8b 00                	mov    (%eax),%eax
  1002ce:	8d 50 01             	lea    0x1(%eax),%edx
  1002d1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002d4:	89 10                	mov    %edx,(%eax)
}
  1002d6:	c9                   	leave  
  1002d7:	c3                   	ret    

001002d8 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  1002d8:	55                   	push   %ebp
  1002d9:	89 e5                	mov    %esp,%ebp
  1002db:	83 ec 18             	sub    $0x18,%esp
    int cnt = 0;
  1002de:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  1002e5:	ff 75 0c             	pushl  0xc(%ebp)
  1002e8:	ff 75 08             	pushl  0x8(%ebp)
  1002eb:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1002ee:	50                   	push   %eax
  1002ef:	68 b5 02 10 00       	push   $0x1002b5
  1002f4:	e8 10 28 00 00       	call   102b09 <vprintfmt>
  1002f9:	83 c4 10             	add    $0x10,%esp
    return cnt;
  1002fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1002ff:	c9                   	leave  
  100300:	c3                   	ret    

00100301 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  100301:	55                   	push   %ebp
  100302:	89 e5                	mov    %esp,%ebp
  100304:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100307:	8d 45 0c             	lea    0xc(%ebp),%eax
  10030a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  10030d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100310:	83 ec 08             	sub    $0x8,%esp
  100313:	50                   	push   %eax
  100314:	ff 75 08             	pushl  0x8(%ebp)
  100317:	e8 bc ff ff ff       	call   1002d8 <vcprintf>
  10031c:	83 c4 10             	add    $0x10,%esp
  10031f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  100322:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100325:	c9                   	leave  
  100326:	c3                   	ret    

00100327 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100327:	55                   	push   %ebp
  100328:	89 e5                	mov    %esp,%ebp
  10032a:	83 ec 08             	sub    $0x8,%esp
    cons_putc(c);
  10032d:	83 ec 0c             	sub    $0xc,%esp
  100330:	ff 75 08             	pushl  0x8(%ebp)
  100333:	e8 c7 11 00 00       	call   1014ff <cons_putc>
  100338:	83 c4 10             	add    $0x10,%esp
}
  10033b:	c9                   	leave  
  10033c:	c3                   	ret    

0010033d <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  10033d:	55                   	push   %ebp
  10033e:	89 e5                	mov    %esp,%ebp
  100340:	83 ec 18             	sub    $0x18,%esp
    int cnt = 0;
  100343:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  10034a:	eb 14                	jmp    100360 <cputs+0x23>
        cputch(c, &cnt);
  10034c:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  100350:	83 ec 08             	sub    $0x8,%esp
  100353:	8d 55 f0             	lea    -0x10(%ebp),%edx
  100356:	52                   	push   %edx
  100357:	50                   	push   %eax
  100358:	e8 58 ff ff ff       	call   1002b5 <cputch>
  10035d:	83 c4 10             	add    $0x10,%esp
 * */
int
cputs(const char *str) {
    int cnt = 0;
    char c;
    while ((c = *str ++) != '\0') {
  100360:	8b 45 08             	mov    0x8(%ebp),%eax
  100363:	8d 50 01             	lea    0x1(%eax),%edx
  100366:	89 55 08             	mov    %edx,0x8(%ebp)
  100369:	8a 00                	mov    (%eax),%al
  10036b:	88 45 f7             	mov    %al,-0x9(%ebp)
  10036e:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  100372:	75 d8                	jne    10034c <cputs+0xf>
        cputch(c, &cnt);
    }
    cputch('\n', &cnt);
  100374:	83 ec 08             	sub    $0x8,%esp
  100377:	8d 45 f0             	lea    -0x10(%ebp),%eax
  10037a:	50                   	push   %eax
  10037b:	6a 0a                	push   $0xa
  10037d:	e8 33 ff ff ff       	call   1002b5 <cputch>
  100382:	83 c4 10             	add    $0x10,%esp
    return cnt;
  100385:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  100388:	c9                   	leave  
  100389:	c3                   	ret    

0010038a <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  10038a:	55                   	push   %ebp
  10038b:	89 e5                	mov    %esp,%ebp
  10038d:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  100390:	e8 99 11 00 00       	call   10152e <cons_getc>
  100395:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100398:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10039c:	74 f2                	je     100390 <getchar+0x6>
        /* do nothing */;
    return c;
  10039e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1003a1:	c9                   	leave  
  1003a2:	c3                   	ret    

001003a3 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1003a3:	55                   	push   %ebp
  1003a4:	89 e5                	mov    %esp,%ebp
  1003a6:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1003a9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003ac:	8b 00                	mov    (%eax),%eax
  1003ae:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1003b1:	8b 45 10             	mov    0x10(%ebp),%eax
  1003b4:	8b 00                	mov    (%eax),%eax
  1003b6:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1003b9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1003c0:	e9 c9 00 00 00       	jmp    10048e <stab_binsearch+0xeb>
        int true_m = (l + r) / 2, m = true_m;
  1003c5:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1003c8:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1003cb:	01 d0                	add    %edx,%eax
  1003cd:	89 c2                	mov    %eax,%edx
  1003cf:	c1 ea 1f             	shr    $0x1f,%edx
  1003d2:	01 d0                	add    %edx,%eax
  1003d4:	d1 f8                	sar    %eax
  1003d6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1003d9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1003dc:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1003df:	eb 03                	jmp    1003e4 <stab_binsearch+0x41>
            m --;
  1003e1:	ff 4d f0             	decl   -0x10(%ebp)

    while (l <= r) {
        int true_m = (l + r) / 2, m = true_m;

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1003e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003e7:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1003ea:	7c 1e                	jl     10040a <stab_binsearch+0x67>
  1003ec:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1003ef:	89 d0                	mov    %edx,%eax
  1003f1:	01 c0                	add    %eax,%eax
  1003f3:	01 d0                	add    %edx,%eax
  1003f5:	c1 e0 02             	shl    $0x2,%eax
  1003f8:	89 c2                	mov    %eax,%edx
  1003fa:	8b 45 08             	mov    0x8(%ebp),%eax
  1003fd:	01 d0                	add    %edx,%eax
  1003ff:	8a 40 04             	mov    0x4(%eax),%al
  100402:	0f b6 c0             	movzbl %al,%eax
  100405:	3b 45 14             	cmp    0x14(%ebp),%eax
  100408:	75 d7                	jne    1003e1 <stab_binsearch+0x3e>
            m --;
        }
        if (m < l) {    // no match in [l, m]
  10040a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10040d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100410:	7d 09                	jge    10041b <stab_binsearch+0x78>
            l = true_m + 1;
  100412:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100415:	40                   	inc    %eax
  100416:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  100419:	eb 73                	jmp    10048e <stab_binsearch+0xeb>
        }

        // actual binary search
        any_matches = 1;
  10041b:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  100422:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100425:	89 d0                	mov    %edx,%eax
  100427:	01 c0                	add    %eax,%eax
  100429:	01 d0                	add    %edx,%eax
  10042b:	c1 e0 02             	shl    $0x2,%eax
  10042e:	89 c2                	mov    %eax,%edx
  100430:	8b 45 08             	mov    0x8(%ebp),%eax
  100433:	01 d0                	add    %edx,%eax
  100435:	8b 40 08             	mov    0x8(%eax),%eax
  100438:	3b 45 18             	cmp    0x18(%ebp),%eax
  10043b:	73 11                	jae    10044e <stab_binsearch+0xab>
            *region_left = m;
  10043d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100440:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100443:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100445:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100448:	40                   	inc    %eax
  100449:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10044c:	eb 40                	jmp    10048e <stab_binsearch+0xeb>
        } else if (stabs[m].n_value > addr) {
  10044e:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100451:	89 d0                	mov    %edx,%eax
  100453:	01 c0                	add    %eax,%eax
  100455:	01 d0                	add    %edx,%eax
  100457:	c1 e0 02             	shl    $0x2,%eax
  10045a:	89 c2                	mov    %eax,%edx
  10045c:	8b 45 08             	mov    0x8(%ebp),%eax
  10045f:	01 d0                	add    %edx,%eax
  100461:	8b 40 08             	mov    0x8(%eax),%eax
  100464:	3b 45 18             	cmp    0x18(%ebp),%eax
  100467:	76 14                	jbe    10047d <stab_binsearch+0xda>
            *region_right = m - 1;
  100469:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10046c:	8d 50 ff             	lea    -0x1(%eax),%edx
  10046f:	8b 45 10             	mov    0x10(%ebp),%eax
  100472:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  100474:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100477:	48                   	dec    %eax
  100478:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10047b:	eb 11                	jmp    10048e <stab_binsearch+0xeb>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  10047d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100480:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100483:	89 10                	mov    %edx,(%eax)
            l = m;
  100485:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100488:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  10048b:	ff 45 18             	incl   0x18(%ebp)
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
    int l = *region_left, r = *region_right, any_matches = 0;

    while (l <= r) {
  10048e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100491:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  100494:	0f 8e 2b ff ff ff    	jle    1003c5 <stab_binsearch+0x22>
            l = m;
            addr ++;
        }
    }

    if (!any_matches) {
  10049a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10049e:	75 0f                	jne    1004af <stab_binsearch+0x10c>
        *region_right = *region_left - 1;
  1004a0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004a3:	8b 00                	mov    (%eax),%eax
  1004a5:	8d 50 ff             	lea    -0x1(%eax),%edx
  1004a8:	8b 45 10             	mov    0x10(%ebp),%eax
  1004ab:	89 10                	mov    %edx,(%eax)
  1004ad:	eb 3d                	jmp    1004ec <stab_binsearch+0x149>
    }
    else {
        // find rightmost region containing 'addr'
        l = *region_right;
  1004af:	8b 45 10             	mov    0x10(%ebp),%eax
  1004b2:	8b 00                	mov    (%eax),%eax
  1004b4:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1004b7:	eb 03                	jmp    1004bc <stab_binsearch+0x119>
  1004b9:	ff 4d fc             	decl   -0x4(%ebp)
  1004bc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004bf:	8b 00                	mov    (%eax),%eax
  1004c1:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004c4:	7d 1e                	jge    1004e4 <stab_binsearch+0x141>
  1004c6:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004c9:	89 d0                	mov    %edx,%eax
  1004cb:	01 c0                	add    %eax,%eax
  1004cd:	01 d0                	add    %edx,%eax
  1004cf:	c1 e0 02             	shl    $0x2,%eax
  1004d2:	89 c2                	mov    %eax,%edx
  1004d4:	8b 45 08             	mov    0x8(%ebp),%eax
  1004d7:	01 d0                	add    %edx,%eax
  1004d9:	8a 40 04             	mov    0x4(%eax),%al
  1004dc:	0f b6 c0             	movzbl %al,%eax
  1004df:	3b 45 14             	cmp    0x14(%ebp),%eax
  1004e2:	75 d5                	jne    1004b9 <stab_binsearch+0x116>
            /* do nothing */;
        *region_left = l;
  1004e4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004e7:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004ea:	89 10                	mov    %edx,(%eax)
    }
}
  1004ec:	c9                   	leave  
  1004ed:	c3                   	ret    

001004ee <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  1004ee:	55                   	push   %ebp
  1004ef:	89 e5                	mov    %esp,%ebp
  1004f1:	83 ec 38             	sub    $0x38,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  1004f4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004f7:	c7 00 8c 34 10 00    	movl   $0x10348c,(%eax)
    info->eip_line = 0;
  1004fd:	8b 45 0c             	mov    0xc(%ebp),%eax
  100500:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  100507:	8b 45 0c             	mov    0xc(%ebp),%eax
  10050a:	c7 40 08 8c 34 10 00 	movl   $0x10348c,0x8(%eax)
    info->eip_fn_namelen = 9;
  100511:	8b 45 0c             	mov    0xc(%ebp),%eax
  100514:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  10051b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10051e:	8b 55 08             	mov    0x8(%ebp),%edx
  100521:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100524:	8b 45 0c             	mov    0xc(%ebp),%eax
  100527:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  10052e:	c7 45 f4 ec 3c 10 00 	movl   $0x103cec,-0xc(%ebp)
    stab_end = __STAB_END__;
  100535:	c7 45 f0 3c b3 10 00 	movl   $0x10b33c,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  10053c:	c7 45 ec 3d b3 10 00 	movl   $0x10b33d,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100543:	c7 45 e8 28 d3 10 00 	movl   $0x10d328,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  10054a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10054d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100550:	76 0a                	jbe    10055c <debuginfo_eip+0x6e>
  100552:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100555:	48                   	dec    %eax
  100556:	8a 00                	mov    (%eax),%al
  100558:	84 c0                	test   %al,%al
  10055a:	74 0a                	je     100566 <debuginfo_eip+0x78>
        return -1;
  10055c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100561:	e9 a5 02 00 00       	jmp    10080b <debuginfo_eip+0x31d>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100566:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10056d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100570:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100573:	29 c2                	sub    %eax,%edx
  100575:	89 d0                	mov    %edx,%eax
  100577:	c1 f8 02             	sar    $0x2,%eax
  10057a:	89 c2                	mov    %eax,%edx
  10057c:	89 d0                	mov    %edx,%eax
  10057e:	c1 e0 02             	shl    $0x2,%eax
  100581:	01 d0                	add    %edx,%eax
  100583:	c1 e0 02             	shl    $0x2,%eax
  100586:	01 d0                	add    %edx,%eax
  100588:	c1 e0 02             	shl    $0x2,%eax
  10058b:	01 d0                	add    %edx,%eax
  10058d:	89 c1                	mov    %eax,%ecx
  10058f:	c1 e1 08             	shl    $0x8,%ecx
  100592:	01 c8                	add    %ecx,%eax
  100594:	89 c1                	mov    %eax,%ecx
  100596:	c1 e1 10             	shl    $0x10,%ecx
  100599:	01 c8                	add    %ecx,%eax
  10059b:	01 c0                	add    %eax,%eax
  10059d:	01 d0                	add    %edx,%eax
  10059f:	48                   	dec    %eax
  1005a0:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  1005a3:	ff 75 08             	pushl  0x8(%ebp)
  1005a6:	6a 64                	push   $0x64
  1005a8:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1005ab:	50                   	push   %eax
  1005ac:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1005af:	50                   	push   %eax
  1005b0:	ff 75 f4             	pushl  -0xc(%ebp)
  1005b3:	e8 eb fd ff ff       	call   1003a3 <stab_binsearch>
  1005b8:	83 c4 14             	add    $0x14,%esp
    if (lfile == 0)
  1005bb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005be:	85 c0                	test   %eax,%eax
  1005c0:	75 0a                	jne    1005cc <debuginfo_eip+0xde>
        return -1;
  1005c2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1005c7:	e9 3f 02 00 00       	jmp    10080b <debuginfo_eip+0x31d>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1005cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005cf:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1005d2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1005d5:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1005d8:	ff 75 08             	pushl  0x8(%ebp)
  1005db:	6a 24                	push   $0x24
  1005dd:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1005e0:	50                   	push   %eax
  1005e1:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1005e4:	50                   	push   %eax
  1005e5:	ff 75 f4             	pushl  -0xc(%ebp)
  1005e8:	e8 b6 fd ff ff       	call   1003a3 <stab_binsearch>
  1005ed:	83 c4 14             	add    $0x14,%esp

    if (lfun <= rfun) {
  1005f0:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1005f3:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1005f6:	39 c2                	cmp    %eax,%edx
  1005f8:	7f 7c                	jg     100676 <debuginfo_eip+0x188>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  1005fa:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1005fd:	89 c2                	mov    %eax,%edx
  1005ff:	89 d0                	mov    %edx,%eax
  100601:	01 c0                	add    %eax,%eax
  100603:	01 d0                	add    %edx,%eax
  100605:	c1 e0 02             	shl    $0x2,%eax
  100608:	89 c2                	mov    %eax,%edx
  10060a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10060d:	01 d0                	add    %edx,%eax
  10060f:	8b 00                	mov    (%eax),%eax
  100611:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  100614:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100617:	29 d1                	sub    %edx,%ecx
  100619:	89 ca                	mov    %ecx,%edx
  10061b:	39 d0                	cmp    %edx,%eax
  10061d:	73 22                	jae    100641 <debuginfo_eip+0x153>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  10061f:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100622:	89 c2                	mov    %eax,%edx
  100624:	89 d0                	mov    %edx,%eax
  100626:	01 c0                	add    %eax,%eax
  100628:	01 d0                	add    %edx,%eax
  10062a:	c1 e0 02             	shl    $0x2,%eax
  10062d:	89 c2                	mov    %eax,%edx
  10062f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100632:	01 d0                	add    %edx,%eax
  100634:	8b 10                	mov    (%eax),%edx
  100636:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100639:	01 c2                	add    %eax,%edx
  10063b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10063e:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  100641:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100644:	89 c2                	mov    %eax,%edx
  100646:	89 d0                	mov    %edx,%eax
  100648:	01 c0                	add    %eax,%eax
  10064a:	01 d0                	add    %edx,%eax
  10064c:	c1 e0 02             	shl    $0x2,%eax
  10064f:	89 c2                	mov    %eax,%edx
  100651:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100654:	01 d0                	add    %edx,%eax
  100656:	8b 50 08             	mov    0x8(%eax),%edx
  100659:	8b 45 0c             	mov    0xc(%ebp),%eax
  10065c:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  10065f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100662:	8b 40 10             	mov    0x10(%eax),%eax
  100665:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  100668:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10066b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  10066e:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100671:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100674:	eb 15                	jmp    10068b <debuginfo_eip+0x19d>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  100676:	8b 45 0c             	mov    0xc(%ebp),%eax
  100679:	8b 55 08             	mov    0x8(%ebp),%edx
  10067c:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  10067f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100682:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  100685:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100688:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  10068b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10068e:	8b 40 08             	mov    0x8(%eax),%eax
  100691:	83 ec 08             	sub    $0x8,%esp
  100694:	6a 3a                	push   $0x3a
  100696:	50                   	push   %eax
  100697:	e8 4c 2a 00 00       	call   1030e8 <strfind>
  10069c:	83 c4 10             	add    $0x10,%esp
  10069f:	89 c2                	mov    %eax,%edx
  1006a1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006a4:	8b 40 08             	mov    0x8(%eax),%eax
  1006a7:	29 c2                	sub    %eax,%edx
  1006a9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006ac:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1006af:	83 ec 0c             	sub    $0xc,%esp
  1006b2:	ff 75 08             	pushl  0x8(%ebp)
  1006b5:	6a 44                	push   $0x44
  1006b7:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1006ba:	50                   	push   %eax
  1006bb:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1006be:	50                   	push   %eax
  1006bf:	ff 75 f4             	pushl  -0xc(%ebp)
  1006c2:	e8 dc fc ff ff       	call   1003a3 <stab_binsearch>
  1006c7:	83 c4 20             	add    $0x20,%esp
    if (lline <= rline) {
  1006ca:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1006cd:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1006d0:	39 c2                	cmp    %eax,%edx
  1006d2:	7f 24                	jg     1006f8 <debuginfo_eip+0x20a>
        info->eip_line = stabs[rline].n_desc;
  1006d4:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1006d7:	89 c2                	mov    %eax,%edx
  1006d9:	89 d0                	mov    %edx,%eax
  1006db:	01 c0                	add    %eax,%eax
  1006dd:	01 d0                	add    %edx,%eax
  1006df:	c1 e0 02             	shl    $0x2,%eax
  1006e2:	89 c2                	mov    %eax,%edx
  1006e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006e7:	01 d0                	add    %edx,%eax
  1006e9:	66 8b 40 06          	mov    0x6(%eax),%ax
  1006ed:	0f b7 d0             	movzwl %ax,%edx
  1006f0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006f3:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  1006f6:	eb 11                	jmp    100709 <debuginfo_eip+0x21b>
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
    if (lline <= rline) {
        info->eip_line = stabs[rline].n_desc;
    } else {
        return -1;
  1006f8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1006fd:	e9 09 01 00 00       	jmp    10080b <debuginfo_eip+0x31d>
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  100702:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100705:	48                   	dec    %eax
  100706:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  100709:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10070c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10070f:	39 c2                	cmp    %eax,%edx
  100711:	7c 54                	jl     100767 <debuginfo_eip+0x279>
           && stabs[lline].n_type != N_SOL
  100713:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100716:	89 c2                	mov    %eax,%edx
  100718:	89 d0                	mov    %edx,%eax
  10071a:	01 c0                	add    %eax,%eax
  10071c:	01 d0                	add    %edx,%eax
  10071e:	c1 e0 02             	shl    $0x2,%eax
  100721:	89 c2                	mov    %eax,%edx
  100723:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100726:	01 d0                	add    %edx,%eax
  100728:	8a 40 04             	mov    0x4(%eax),%al
  10072b:	3c 84                	cmp    $0x84,%al
  10072d:	74 38                	je     100767 <debuginfo_eip+0x279>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  10072f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100732:	89 c2                	mov    %eax,%edx
  100734:	89 d0                	mov    %edx,%eax
  100736:	01 c0                	add    %eax,%eax
  100738:	01 d0                	add    %edx,%eax
  10073a:	c1 e0 02             	shl    $0x2,%eax
  10073d:	89 c2                	mov    %eax,%edx
  10073f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100742:	01 d0                	add    %edx,%eax
  100744:	8a 40 04             	mov    0x4(%eax),%al
  100747:	3c 64                	cmp    $0x64,%al
  100749:	75 b7                	jne    100702 <debuginfo_eip+0x214>
  10074b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10074e:	89 c2                	mov    %eax,%edx
  100750:	89 d0                	mov    %edx,%eax
  100752:	01 c0                	add    %eax,%eax
  100754:	01 d0                	add    %edx,%eax
  100756:	c1 e0 02             	shl    $0x2,%eax
  100759:	89 c2                	mov    %eax,%edx
  10075b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10075e:	01 d0                	add    %edx,%eax
  100760:	8b 40 08             	mov    0x8(%eax),%eax
  100763:	85 c0                	test   %eax,%eax
  100765:	74 9b                	je     100702 <debuginfo_eip+0x214>
        lline --;
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  100767:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10076a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10076d:	39 c2                	cmp    %eax,%edx
  10076f:	7c 46                	jl     1007b7 <debuginfo_eip+0x2c9>
  100771:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100774:	89 c2                	mov    %eax,%edx
  100776:	89 d0                	mov    %edx,%eax
  100778:	01 c0                	add    %eax,%eax
  10077a:	01 d0                	add    %edx,%eax
  10077c:	c1 e0 02             	shl    $0x2,%eax
  10077f:	89 c2                	mov    %eax,%edx
  100781:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100784:	01 d0                	add    %edx,%eax
  100786:	8b 00                	mov    (%eax),%eax
  100788:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  10078b:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10078e:	29 d1                	sub    %edx,%ecx
  100790:	89 ca                	mov    %ecx,%edx
  100792:	39 d0                	cmp    %edx,%eax
  100794:	73 21                	jae    1007b7 <debuginfo_eip+0x2c9>
        info->eip_file = stabstr + stabs[lline].n_strx;
  100796:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100799:	89 c2                	mov    %eax,%edx
  10079b:	89 d0                	mov    %edx,%eax
  10079d:	01 c0                	add    %eax,%eax
  10079f:	01 d0                	add    %edx,%eax
  1007a1:	c1 e0 02             	shl    $0x2,%eax
  1007a4:	89 c2                	mov    %eax,%edx
  1007a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007a9:	01 d0                	add    %edx,%eax
  1007ab:	8b 10                	mov    (%eax),%edx
  1007ad:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007b0:	01 c2                	add    %eax,%edx
  1007b2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007b5:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1007b7:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1007ba:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1007bd:	39 c2                	cmp    %eax,%edx
  1007bf:	7d 45                	jge    100806 <debuginfo_eip+0x318>
        for (lline = lfun + 1;
  1007c1:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1007c4:	40                   	inc    %eax
  1007c5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1007c8:	eb 16                	jmp    1007e0 <debuginfo_eip+0x2f2>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  1007ca:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007cd:	8b 40 14             	mov    0x14(%eax),%eax
  1007d0:	8d 50 01             	lea    0x1(%eax),%edx
  1007d3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007d6:	89 50 14             	mov    %edx,0x14(%eax)
    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
  1007d9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007dc:	40                   	inc    %eax
  1007dd:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1007e0:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007e3:	8b 45 d8             	mov    -0x28(%ebp),%eax
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
  1007e6:	39 c2                	cmp    %eax,%edx
  1007e8:	7d 1c                	jge    100806 <debuginfo_eip+0x318>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1007ea:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007ed:	89 c2                	mov    %eax,%edx
  1007ef:	89 d0                	mov    %edx,%eax
  1007f1:	01 c0                	add    %eax,%eax
  1007f3:	01 d0                	add    %edx,%eax
  1007f5:	c1 e0 02             	shl    $0x2,%eax
  1007f8:	89 c2                	mov    %eax,%edx
  1007fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007fd:	01 d0                	add    %edx,%eax
  1007ff:	8a 40 04             	mov    0x4(%eax),%al
  100802:	3c a0                	cmp    $0xa0,%al
  100804:	74 c4                	je     1007ca <debuginfo_eip+0x2dc>
             lline ++) {
            info->eip_fn_narg ++;
        }
    }
    return 0;
  100806:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10080b:	c9                   	leave  
  10080c:	c3                   	ret    

0010080d <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  10080d:	55                   	push   %ebp
  10080e:	89 e5                	mov    %esp,%ebp
  100810:	83 ec 08             	sub    $0x8,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  100813:	83 ec 0c             	sub    $0xc,%esp
  100816:	68 96 34 10 00       	push   $0x103496
  10081b:	e8 e1 fa ff ff       	call   100301 <cprintf>
  100820:	83 c4 10             	add    $0x10,%esp
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100823:	83 ec 08             	sub    $0x8,%esp
  100826:	68 00 00 10 00       	push   $0x100000
  10082b:	68 af 34 10 00       	push   $0x1034af
  100830:	e8 cc fa ff ff       	call   100301 <cprintf>
  100835:	83 c4 10             	add    $0x10,%esp
    cprintf("  etext  0x%08x (phys)\n", etext);
  100838:	83 ec 08             	sub    $0x8,%esp
  10083b:	68 de 33 10 00       	push   $0x1033de
  100840:	68 c7 34 10 00       	push   $0x1034c7
  100845:	e8 b7 fa ff ff       	call   100301 <cprintf>
  10084a:	83 c4 10             	add    $0x10,%esp
    cprintf("  edata  0x%08x (phys)\n", edata);
  10084d:	83 ec 08             	sub    $0x8,%esp
  100850:	68 16 ea 10 00       	push   $0x10ea16
  100855:	68 df 34 10 00       	push   $0x1034df
  10085a:	e8 a2 fa ff ff       	call   100301 <cprintf>
  10085f:	83 c4 10             	add    $0x10,%esp
    cprintf("  end    0x%08x (phys)\n", end);
  100862:	83 ec 08             	sub    $0x8,%esp
  100865:	68 80 fd 10 00       	push   $0x10fd80
  10086a:	68 f7 34 10 00       	push   $0x1034f7
  10086f:	e8 8d fa ff ff       	call   100301 <cprintf>
  100874:	83 c4 10             	add    $0x10,%esp
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  100877:	b8 80 fd 10 00       	mov    $0x10fd80,%eax
  10087c:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  100882:	b8 00 00 10 00       	mov    $0x100000,%eax
  100887:	29 c2                	sub    %eax,%edx
  100889:	89 d0                	mov    %edx,%eax
  10088b:	85 c0                	test   %eax,%eax
  10088d:	79 05                	jns    100894 <print_kerninfo+0x87>
  10088f:	05 ff 03 00 00       	add    $0x3ff,%eax
  100894:	c1 f8 0a             	sar    $0xa,%eax
  100897:	83 ec 08             	sub    $0x8,%esp
  10089a:	50                   	push   %eax
  10089b:	68 10 35 10 00       	push   $0x103510
  1008a0:	e8 5c fa ff ff       	call   100301 <cprintf>
  1008a5:	83 c4 10             	add    $0x10,%esp
}
  1008a8:	c9                   	leave  
  1008a9:	c3                   	ret    

001008aa <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1008aa:	55                   	push   %ebp
  1008ab:	89 e5                	mov    %esp,%ebp
  1008ad:	81 ec 28 01 00 00    	sub    $0x128,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1008b3:	83 ec 08             	sub    $0x8,%esp
  1008b6:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1008b9:	50                   	push   %eax
  1008ba:	ff 75 08             	pushl  0x8(%ebp)
  1008bd:	e8 2c fc ff ff       	call   1004ee <debuginfo_eip>
  1008c2:	83 c4 10             	add    $0x10,%esp
  1008c5:	85 c0                	test   %eax,%eax
  1008c7:	74 15                	je     1008de <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1008c9:	83 ec 08             	sub    $0x8,%esp
  1008cc:	ff 75 08             	pushl  0x8(%ebp)
  1008cf:	68 3a 35 10 00       	push   $0x10353a
  1008d4:	e8 28 fa ff ff       	call   100301 <cprintf>
  1008d9:	83 c4 10             	add    $0x10,%esp
  1008dc:	eb 63                	jmp    100941 <print_debuginfo+0x97>
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1008de:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1008e5:	eb 1a                	jmp    100901 <print_debuginfo+0x57>
            fnname[j] = info.eip_fn_name[j];
  1008e7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1008ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008ed:	01 d0                	add    %edx,%eax
  1008ef:	8a 00                	mov    (%eax),%al
  1008f1:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  1008f7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1008fa:	01 ca                	add    %ecx,%edx
  1008fc:	88 02                	mov    %al,(%edx)
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1008fe:	ff 45 f4             	incl   -0xc(%ebp)
  100901:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100904:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  100907:	7f de                	jg     1008e7 <print_debuginfo+0x3d>
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
  100909:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  10090f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100912:	01 d0                	add    %edx,%eax
  100914:	c6 00 00             	movb   $0x0,(%eax)
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
  100917:	8b 45 ec             	mov    -0x14(%ebp),%eax
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  10091a:	8b 55 08             	mov    0x8(%ebp),%edx
  10091d:	89 d1                	mov    %edx,%ecx
  10091f:	29 c1                	sub    %eax,%ecx
  100921:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100924:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100927:	83 ec 0c             	sub    $0xc,%esp
  10092a:	51                   	push   %ecx
  10092b:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100931:	51                   	push   %ecx
  100932:	52                   	push   %edx
  100933:	50                   	push   %eax
  100934:	68 56 35 10 00       	push   $0x103556
  100939:	e8 c3 f9 ff ff       	call   100301 <cprintf>
  10093e:	83 c4 20             	add    $0x20,%esp
                fnname, eip - info.eip_fn_addr);
    }
}
  100941:	c9                   	leave  
  100942:	c3                   	ret    

00100943 <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100943:	55                   	push   %ebp
  100944:	89 e5                	mov    %esp,%ebp
  100946:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100949:	8b 45 04             	mov    0x4(%ebp),%eax
  10094c:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  10094f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100952:	c9                   	leave  
  100953:	c3                   	ret    

00100954 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100954:	55                   	push   %ebp
  100955:	89 e5                	mov    %esp,%ebp
  100957:	83 ec 28             	sub    $0x28,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  10095a:	89 e8                	mov    %ebp,%eax
  10095c:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return ebp;
  10095f:	8b 45 e0             	mov    -0x20(%ebp),%eax
        （3.5）弹出一个调用栈帧堆栈
                注意：调用函数的返回地址EIP = SS：[ebp+ 4 ]
                调用函数的EBP = SS：[ebp]
	*/

    uint32_t ebp = read_ebp(), eip = read_eip();    //初始化ebp，eip
  100962:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100965:	e8 d9 ff ff ff       	call   100943 <read_eip>
  10096a:	89 45 f0             	mov    %eax,-0x10(%ebp)

    int i, j;
    for (i = 0; ebp != 0 && i < STACKFRAME_DEPTH; i ++) {   //从0到STACKFRAME_DEPTH,ebp不能为0
  10096d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  100974:	e9 89 00 00 00       	jmp    100a02 <print_stackframe+0xae>
        cprintf("ebp:0x%08x eip:0x%08x args:", ebp, eip);   //打印EBP EIP的值
  100979:	83 ec 04             	sub    $0x4,%esp
  10097c:	ff 75 f0             	pushl  -0x10(%ebp)
  10097f:	ff 75 f4             	pushl  -0xc(%ebp)
  100982:	68 68 35 10 00       	push   $0x103568
  100987:	e8 75 f9 ff ff       	call   100301 <cprintf>
  10098c:	83 c4 10             	add    $0x10,%esp
        uint32_t *args = (uint32_t *)ebp + 2;   //args指针所表示的地址值
  10098f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100992:	83 c0 08             	add    $0x8,%eax
  100995:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        for (j = 0; j < 4; j ++) {
  100998:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  10099f:	eb 25                	jmp    1009c6 <print_stackframe+0x72>
            cprintf("0x%08x ", args[j]);
  1009a1:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009a4:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  1009ab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1009ae:	01 d0                	add    %edx,%eax
  1009b0:	8b 00                	mov    (%eax),%eax
  1009b2:	83 ec 08             	sub    $0x8,%esp
  1009b5:	50                   	push   %eax
  1009b6:	68 84 35 10 00       	push   $0x103584
  1009bb:	e8 41 f9 ff ff       	call   100301 <cprintf>
  1009c0:	83 c4 10             	add    $0x10,%esp

    int i, j;
    for (i = 0; ebp != 0 && i < STACKFRAME_DEPTH; i ++) {   //从0到STACKFRAME_DEPTH,ebp不能为0
        cprintf("ebp:0x%08x eip:0x%08x args:", ebp, eip);   //打印EBP EIP的值
        uint32_t *args = (uint32_t *)ebp + 2;   //args指针所表示的地址值
        for (j = 0; j < 4; j ++) {
  1009c3:	ff 45 e8             	incl   -0x18(%ebp)
  1009c6:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  1009ca:	7e d5                	jle    1009a1 <print_stackframe+0x4d>
            cprintf("0x%08x ", args[j]);
        }
        cprintf("\n");
  1009cc:	83 ec 0c             	sub    $0xc,%esp
  1009cf:	68 8c 35 10 00       	push   $0x10358c
  1009d4:	e8 28 f9 ff ff       	call   100301 <cprintf>
  1009d9:	83 c4 10             	add    $0x10,%esp
        print_debuginfo(eip - 1);       //ucore提供了print_debuginfo()函数来打印函数的信息
  1009dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1009df:	48                   	dec    %eax
  1009e0:	83 ec 0c             	sub    $0xc,%esp
  1009e3:	50                   	push   %eax
  1009e4:	e8 c1 fe ff ff       	call   1008aa <print_debuginfo>
  1009e9:	83 c4 10             	add    $0x10,%esp
        eip = ((uint32_t *)ebp)[1];
  1009ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009ef:	83 c0 04             	add    $0x4,%eax
  1009f2:	8b 00                	mov    (%eax),%eax
  1009f4:	89 45 f0             	mov    %eax,-0x10(%ebp)
        ebp = ((uint32_t *)ebp)[0];
  1009f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009fa:	8b 00                	mov    (%eax),%eax
  1009fc:	89 45 f4             	mov    %eax,-0xc(%ebp)
	*/

    uint32_t ebp = read_ebp(), eip = read_eip();    //初始化ebp，eip

    int i, j;
    for (i = 0; ebp != 0 && i < STACKFRAME_DEPTH; i ++) {   //从0到STACKFRAME_DEPTH,ebp不能为0
  1009ff:	ff 45 ec             	incl   -0x14(%ebp)
  100a02:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100a06:	74 0a                	je     100a12 <print_stackframe+0xbe>
  100a08:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100a0c:	0f 8e 67 ff ff ff    	jle    100979 <print_stackframe+0x25>
        cprintf("\n");
        print_debuginfo(eip - 1);       //ucore提供了print_debuginfo()函数来打印函数的信息
        eip = ((uint32_t *)ebp)[1];
        ebp = ((uint32_t *)ebp)[0];
    }
}
  100a12:	c9                   	leave  
  100a13:	c3                   	ret    

00100a14 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100a14:	55                   	push   %ebp
  100a15:	89 e5                	mov    %esp,%ebp
  100a17:	83 ec 18             	sub    $0x18,%esp
    int argc = 0;
  100a1a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a21:	eb 0c                	jmp    100a2f <parse+0x1b>
            *buf ++ = '\0';
  100a23:	8b 45 08             	mov    0x8(%ebp),%eax
  100a26:	8d 50 01             	lea    0x1(%eax),%edx
  100a29:	89 55 08             	mov    %edx,0x8(%ebp)
  100a2c:	c6 00 00             	movb   $0x0,(%eax)
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a2f:	8b 45 08             	mov    0x8(%ebp),%eax
  100a32:	8a 00                	mov    (%eax),%al
  100a34:	84 c0                	test   %al,%al
  100a36:	74 1d                	je     100a55 <parse+0x41>
  100a38:	8b 45 08             	mov    0x8(%ebp),%eax
  100a3b:	8a 00                	mov    (%eax),%al
  100a3d:	0f be c0             	movsbl %al,%eax
  100a40:	83 ec 08             	sub    $0x8,%esp
  100a43:	50                   	push   %eax
  100a44:	68 10 36 10 00       	push   $0x103610
  100a49:	e8 6a 26 00 00       	call   1030b8 <strchr>
  100a4e:	83 c4 10             	add    $0x10,%esp
  100a51:	85 c0                	test   %eax,%eax
  100a53:	75 ce                	jne    100a23 <parse+0xf>
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
  100a55:	8b 45 08             	mov    0x8(%ebp),%eax
  100a58:	8a 00                	mov    (%eax),%al
  100a5a:	84 c0                	test   %al,%al
  100a5c:	75 02                	jne    100a60 <parse+0x4c>
            break;
  100a5e:	eb 62                	jmp    100ac2 <parse+0xae>
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100a60:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100a64:	75 12                	jne    100a78 <parse+0x64>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100a66:	83 ec 08             	sub    $0x8,%esp
  100a69:	6a 10                	push   $0x10
  100a6b:	68 15 36 10 00       	push   $0x103615
  100a70:	e8 8c f8 ff ff       	call   100301 <cprintf>
  100a75:	83 c4 10             	add    $0x10,%esp
        }
        argv[argc ++] = buf;
  100a78:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a7b:	8d 50 01             	lea    0x1(%eax),%edx
  100a7e:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100a81:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100a88:	8b 45 0c             	mov    0xc(%ebp),%eax
  100a8b:	01 c2                	add    %eax,%edx
  100a8d:	8b 45 08             	mov    0x8(%ebp),%eax
  100a90:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100a92:	eb 03                	jmp    100a97 <parse+0x83>
            buf ++;
  100a94:	ff 45 08             	incl   0x8(%ebp)
        // save and scan past next arg
        if (argc == MAXARGS - 1) {
            cprintf("Too many arguments (max %d).\n", MAXARGS);
        }
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100a97:	8b 45 08             	mov    0x8(%ebp),%eax
  100a9a:	8a 00                	mov    (%eax),%al
  100a9c:	84 c0                	test   %al,%al
  100a9e:	74 1d                	je     100abd <parse+0xa9>
  100aa0:	8b 45 08             	mov    0x8(%ebp),%eax
  100aa3:	8a 00                	mov    (%eax),%al
  100aa5:	0f be c0             	movsbl %al,%eax
  100aa8:	83 ec 08             	sub    $0x8,%esp
  100aab:	50                   	push   %eax
  100aac:	68 10 36 10 00       	push   $0x103610
  100ab1:	e8 02 26 00 00       	call   1030b8 <strchr>
  100ab6:	83 c4 10             	add    $0x10,%esp
  100ab9:	85 c0                	test   %eax,%eax
  100abb:	74 d7                	je     100a94 <parse+0x80>
            buf ++;
        }
    }
  100abd:	e9 5f ff ff ff       	jmp    100a21 <parse+0xd>
    return argc;
  100ac2:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100ac5:	c9                   	leave  
  100ac6:	c3                   	ret    

00100ac7 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100ac7:	55                   	push   %ebp
  100ac8:	89 e5                	mov    %esp,%ebp
  100aca:	83 ec 58             	sub    $0x58,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100acd:	83 ec 08             	sub    $0x8,%esp
  100ad0:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100ad3:	50                   	push   %eax
  100ad4:	ff 75 08             	pushl  0x8(%ebp)
  100ad7:	e8 38 ff ff ff       	call   100a14 <parse>
  100adc:	83 c4 10             	add    $0x10,%esp
  100adf:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100ae2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100ae6:	75 0a                	jne    100af2 <runcmd+0x2b>
        return 0;
  100ae8:	b8 00 00 00 00       	mov    $0x0,%eax
  100aed:	e9 81 00 00 00       	jmp    100b73 <runcmd+0xac>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100af2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100af9:	eb 57                	jmp    100b52 <runcmd+0x8b>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100afb:	8b 55 b0             	mov    -0x50(%ebp),%edx
  100afe:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  100b01:	89 c8                	mov    %ecx,%eax
  100b03:	01 c0                	add    %eax,%eax
  100b05:	01 c8                	add    %ecx,%eax
  100b07:	c1 e0 02             	shl    $0x2,%eax
  100b0a:	05 00 e0 10 00       	add    $0x10e000,%eax
  100b0f:	8b 00                	mov    (%eax),%eax
  100b11:	83 ec 08             	sub    $0x8,%esp
  100b14:	52                   	push   %edx
  100b15:	50                   	push   %eax
  100b16:	e8 05 25 00 00       	call   103020 <strcmp>
  100b1b:	83 c4 10             	add    $0x10,%esp
  100b1e:	85 c0                	test   %eax,%eax
  100b20:	75 2d                	jne    100b4f <runcmd+0x88>
            return commands[i].func(argc - 1, argv + 1, tf);
  100b22:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b25:	89 d0                	mov    %edx,%eax
  100b27:	01 c0                	add    %eax,%eax
  100b29:	01 d0                	add    %edx,%eax
  100b2b:	c1 e0 02             	shl    $0x2,%eax
  100b2e:	05 00 e0 10 00       	add    $0x10e000,%eax
  100b33:	8b 40 08             	mov    0x8(%eax),%eax
  100b36:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100b39:	4a                   	dec    %edx
  100b3a:	83 ec 04             	sub    $0x4,%esp
  100b3d:	ff 75 0c             	pushl  0xc(%ebp)
  100b40:	8d 4d b0             	lea    -0x50(%ebp),%ecx
  100b43:	83 c1 04             	add    $0x4,%ecx
  100b46:	51                   	push   %ecx
  100b47:	52                   	push   %edx
  100b48:	ff d0                	call   *%eax
  100b4a:	83 c4 10             	add    $0x10,%esp
  100b4d:	eb 24                	jmp    100b73 <runcmd+0xac>
    int argc = parse(buf, argv);
    if (argc == 0) {
        return 0;
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b4f:	ff 45 f4             	incl   -0xc(%ebp)
  100b52:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b55:	83 f8 02             	cmp    $0x2,%eax
  100b58:	76 a1                	jbe    100afb <runcmd+0x34>
        if (strcmp(commands[i].name, argv[0]) == 0) {
            return commands[i].func(argc - 1, argv + 1, tf);
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100b5a:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100b5d:	83 ec 08             	sub    $0x8,%esp
  100b60:	50                   	push   %eax
  100b61:	68 33 36 10 00       	push   $0x103633
  100b66:	e8 96 f7 ff ff       	call   100301 <cprintf>
  100b6b:	83 c4 10             	add    $0x10,%esp
    return 0;
  100b6e:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100b73:	c9                   	leave  
  100b74:	c3                   	ret    

00100b75 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100b75:	55                   	push   %ebp
  100b76:	89 e5                	mov    %esp,%ebp
  100b78:	83 ec 18             	sub    $0x18,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100b7b:	83 ec 0c             	sub    $0xc,%esp
  100b7e:	68 4c 36 10 00       	push   $0x10364c
  100b83:	e8 79 f7 ff ff       	call   100301 <cprintf>
  100b88:	83 c4 10             	add    $0x10,%esp
    cprintf("Type 'help' for a list of commands.\n");
  100b8b:	83 ec 0c             	sub    $0xc,%esp
  100b8e:	68 74 36 10 00       	push   $0x103674
  100b93:	e8 69 f7 ff ff       	call   100301 <cprintf>
  100b98:	83 c4 10             	add    $0x10,%esp

    if (tf != NULL) {
  100b9b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100b9f:	74 0e                	je     100baf <kmonitor+0x3a>
        print_trapframe(tf);
  100ba1:	83 ec 0c             	sub    $0xc,%esp
  100ba4:	ff 75 08             	pushl  0x8(%ebp)
  100ba7:	e8 4e 0d 00 00       	call   1018fa <print_trapframe>
  100bac:	83 c4 10             	add    $0x10,%esp
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100baf:	83 ec 0c             	sub    $0xc,%esp
  100bb2:	68 99 36 10 00       	push   $0x103699
  100bb7:	e8 38 f6 ff ff       	call   1001f4 <readline>
  100bbc:	83 c4 10             	add    $0x10,%esp
  100bbf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100bc2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100bc6:	74 17                	je     100bdf <kmonitor+0x6a>
            if (runcmd(buf, tf) < 0) {
  100bc8:	83 ec 08             	sub    $0x8,%esp
  100bcb:	ff 75 08             	pushl  0x8(%ebp)
  100bce:	ff 75 f4             	pushl  -0xc(%ebp)
  100bd1:	e8 f1 fe ff ff       	call   100ac7 <runcmd>
  100bd6:	83 c4 10             	add    $0x10,%esp
  100bd9:	85 c0                	test   %eax,%eax
  100bdb:	79 02                	jns    100bdf <kmonitor+0x6a>
                break;
  100bdd:	eb 02                	jmp    100be1 <kmonitor+0x6c>
            }
        }
    }
  100bdf:	eb ce                	jmp    100baf <kmonitor+0x3a>
}
  100be1:	c9                   	leave  
  100be2:	c3                   	ret    

00100be3 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100be3:	55                   	push   %ebp
  100be4:	89 e5                	mov    %esp,%ebp
  100be6:	83 ec 18             	sub    $0x18,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100be9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100bf0:	eb 3c                	jmp    100c2e <mon_help+0x4b>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100bf2:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100bf5:	89 d0                	mov    %edx,%eax
  100bf7:	01 c0                	add    %eax,%eax
  100bf9:	01 d0                	add    %edx,%eax
  100bfb:	c1 e0 02             	shl    $0x2,%eax
  100bfe:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c03:	8b 50 04             	mov    0x4(%eax),%edx
  100c06:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  100c09:	89 c8                	mov    %ecx,%eax
  100c0b:	01 c0                	add    %eax,%eax
  100c0d:	01 c8                	add    %ecx,%eax
  100c0f:	c1 e0 02             	shl    $0x2,%eax
  100c12:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c17:	8b 00                	mov    (%eax),%eax
  100c19:	83 ec 04             	sub    $0x4,%esp
  100c1c:	52                   	push   %edx
  100c1d:	50                   	push   %eax
  100c1e:	68 9d 36 10 00       	push   $0x10369d
  100c23:	e8 d9 f6 ff ff       	call   100301 <cprintf>
  100c28:	83 c4 10             	add    $0x10,%esp

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c2b:	ff 45 f4             	incl   -0xc(%ebp)
  100c2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c31:	83 f8 02             	cmp    $0x2,%eax
  100c34:	76 bc                	jbe    100bf2 <mon_help+0xf>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
    }
    return 0;
  100c36:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c3b:	c9                   	leave  
  100c3c:	c3                   	ret    

00100c3d <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100c3d:	55                   	push   %ebp
  100c3e:	89 e5                	mov    %esp,%ebp
  100c40:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100c43:	e8 c5 fb ff ff       	call   10080d <print_kerninfo>
    return 0;
  100c48:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c4d:	c9                   	leave  
  100c4e:	c3                   	ret    

00100c4f <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100c4f:	55                   	push   %ebp
  100c50:	89 e5                	mov    %esp,%ebp
  100c52:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100c55:	e8 fa fc ff ff       	call   100954 <print_stackframe>
    return 0;
  100c5a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c5f:	c9                   	leave  
  100c60:	c3                   	ret    

00100c61 <__panic>:
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * __panic 是无法解决的致命错误。它打印 "panic: 'message'" ，然后进入内核监视器。
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  100c61:	55                   	push   %ebp
  100c62:	89 e5                	mov    %esp,%ebp
  100c64:	83 ec 18             	sub    $0x18,%esp
    if (is_panic) {
  100c67:	a1 40 ee 10 00       	mov    0x10ee40,%eax
  100c6c:	85 c0                	test   %eax,%eax
  100c6e:	74 02                	je     100c72 <__panic+0x11>
        goto panic_dead;
  100c70:	eb 48                	jmp    100cba <__panic+0x59>
    }
    is_panic = 1;
  100c72:	c7 05 40 ee 10 00 01 	movl   $0x1,0x10ee40
  100c79:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  100c7c:	8d 45 14             	lea    0x14(%ebp),%eax
  100c7f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100c82:	83 ec 04             	sub    $0x4,%esp
  100c85:	ff 75 0c             	pushl  0xc(%ebp)
  100c88:	ff 75 08             	pushl  0x8(%ebp)
  100c8b:	68 a6 36 10 00       	push   $0x1036a6
  100c90:	e8 6c f6 ff ff       	call   100301 <cprintf>
  100c95:	83 c4 10             	add    $0x10,%esp
    vcprintf(fmt, ap);
  100c98:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c9b:	83 ec 08             	sub    $0x8,%esp
  100c9e:	50                   	push   %eax
  100c9f:	ff 75 10             	pushl  0x10(%ebp)
  100ca2:	e8 31 f6 ff ff       	call   1002d8 <vcprintf>
  100ca7:	83 c4 10             	add    $0x10,%esp
    cprintf("\n");
  100caa:	83 ec 0c             	sub    $0xc,%esp
  100cad:	68 c2 36 10 00       	push   $0x1036c2
  100cb2:	e8 4a f6 ff ff       	call   100301 <cprintf>
  100cb7:	83 c4 10             	add    $0x10,%esp
    va_end(ap);

panic_dead:
    intr_disable();
  100cba:	e8 d0 08 00 00       	call   10158f <intr_disable>
    while (1) {
        kmonitor(NULL);
  100cbf:	83 ec 0c             	sub    $0xc,%esp
  100cc2:	6a 00                	push   $0x0
  100cc4:	e8 ac fe ff ff       	call   100b75 <kmonitor>
  100cc9:	83 c4 10             	add    $0x10,%esp
    }
  100ccc:	eb f1                	jmp    100cbf <__panic+0x5e>

00100cce <__warn>:
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100cce:	55                   	push   %ebp
  100ccf:	89 e5                	mov    %esp,%ebp
  100cd1:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    va_start(ap, fmt);
  100cd4:	8d 45 14             	lea    0x14(%ebp),%eax
  100cd7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100cda:	83 ec 04             	sub    $0x4,%esp
  100cdd:	ff 75 0c             	pushl  0xc(%ebp)
  100ce0:	ff 75 08             	pushl  0x8(%ebp)
  100ce3:	68 c4 36 10 00       	push   $0x1036c4
  100ce8:	e8 14 f6 ff ff       	call   100301 <cprintf>
  100ced:	83 c4 10             	add    $0x10,%esp
    vcprintf(fmt, ap);
  100cf0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cf3:	83 ec 08             	sub    $0x8,%esp
  100cf6:	50                   	push   %eax
  100cf7:	ff 75 10             	pushl  0x10(%ebp)
  100cfa:	e8 d9 f5 ff ff       	call   1002d8 <vcprintf>
  100cff:	83 c4 10             	add    $0x10,%esp
    cprintf("\n");
  100d02:	83 ec 0c             	sub    $0xc,%esp
  100d05:	68 c2 36 10 00       	push   $0x1036c2
  100d0a:	e8 f2 f5 ff ff       	call   100301 <cprintf>
  100d0f:	83 c4 10             	add    $0x10,%esp
    va_end(ap);
}
  100d12:	c9                   	leave  
  100d13:	c3                   	ret    

00100d14 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100d14:	55                   	push   %ebp
  100d15:	89 e5                	mov    %esp,%ebp
    return is_panic;
  100d17:	a1 40 ee 10 00       	mov    0x10ee40,%eax
}
  100d1c:	5d                   	pop    %ebp
  100d1d:	c3                   	ret    

00100d1e <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d1e:	55                   	push   %ebp
  100d1f:	89 e5                	mov    %esp,%ebp
  100d21:	83 ec 18             	sub    $0x18,%esp
  100d24:	66 c7 45 f6 43 00    	movw   $0x43,-0xa(%ebp)
  100d2a:	c6 45 f5 34          	movb   $0x34,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d2e:	8a 45 f5             	mov    -0xb(%ebp),%al
  100d31:	66 8b 55 f6          	mov    -0xa(%ebp),%dx
  100d35:	ee                   	out    %al,(%dx)
  100d36:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d3c:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
  100d40:	8a 45 f1             	mov    -0xf(%ebp),%al
  100d43:	66 8b 55 f2          	mov    -0xe(%ebp),%dx
  100d47:	ee                   	out    %al,(%dx)
  100d48:	66 c7 45 ee 40 00    	movw   $0x40,-0x12(%ebp)
  100d4e:	c6 45 ed 2e          	movb   $0x2e,-0x13(%ebp)
  100d52:	8a 45 ed             	mov    -0x13(%ebp),%al
  100d55:	66 8b 55 ee          	mov    -0x12(%ebp),%dx
  100d59:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100d5a:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  100d61:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100d64:	83 ec 0c             	sub    $0xc,%esp
  100d67:	68 e2 36 10 00       	push   $0x1036e2
  100d6c:	e8 90 f5 ff ff       	call   100301 <cprintf>
  100d71:	83 c4 10             	add    $0x10,%esp
    pic_enable(IRQ_TIMER);
  100d74:	83 ec 0c             	sub    $0xc,%esp
  100d77:	6a 00                	push   $0x0
  100d79:	e8 6a 08 00 00       	call   1015e8 <pic_enable>
  100d7e:	83 c4 10             	add    $0x10,%esp
}
  100d81:	c9                   	leave  
  100d82:	c3                   	ret    

00100d83 <delay>:
#include <trap.h>

//串口和键盘的中断
/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100d83:	55                   	push   %ebp
  100d84:	89 e5                	mov    %esp,%ebp
  100d86:	83 ec 10             	sub    $0x10,%esp
  100d89:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100d8f:	66 8b 45 fe          	mov    -0x2(%ebp),%ax
  100d93:	89 c2                	mov    %eax,%edx
  100d95:	ec                   	in     (%dx),%al
  100d96:	88 45 fd             	mov    %al,-0x3(%ebp)
  100d99:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100d9f:	66 8b 45 fa          	mov    -0x6(%ebp),%ax
  100da3:	89 c2                	mov    %eax,%edx
  100da5:	ec                   	in     (%dx),%al
  100da6:	88 45 f9             	mov    %al,-0x7(%ebp)
  100da9:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100daf:	66 8b 45 f6          	mov    -0xa(%ebp),%ax
  100db3:	89 c2                	mov    %eax,%edx
  100db5:	ec                   	in     (%dx),%al
  100db6:	88 45 f5             	mov    %al,-0xb(%ebp)
  100db9:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
  100dbf:	66 8b 45 f2          	mov    -0xe(%ebp),%ax
  100dc3:	89 c2                	mov    %eax,%edx
  100dc5:	ec                   	in     (%dx),%al
  100dc6:	88 45 f1             	mov    %al,-0xf(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100dc9:	c9                   	leave  
  100dca:	c3                   	ret    

00100dcb <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100dcb:	55                   	push   %ebp
  100dcc:	89 e5                	mov    %esp,%ebp
  100dce:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100dd1:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100dd8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ddb:	66 8b 00             	mov    (%eax),%ax
  100dde:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100de2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100de5:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100dea:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ded:	66 8b 00             	mov    (%eax),%ax
  100df0:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100df4:	74 12                	je     100e08 <cga_init+0x3d>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100df6:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100dfd:	66 c7 05 66 ee 10 00 	movw   $0x3b4,0x10ee66
  100e04:	b4 03 
  100e06:	eb 13                	jmp    100e1b <cga_init+0x50>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100e08:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100e0b:	66 8b 45 fa          	mov    -0x6(%ebp),%ax
  100e0f:	66 89 02             	mov    %ax,(%edx)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100e12:	66 c7 05 66 ee 10 00 	movw   $0x3d4,0x10ee66
  100e19:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100e1b:	66 a1 66 ee 10 00    	mov    0x10ee66,%ax
  100e21:	0f b7 c0             	movzwl %ax,%eax
  100e24:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  100e28:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e2c:	8a 45 f1             	mov    -0xf(%ebp),%al
  100e2f:	66 8b 55 f2          	mov    -0xe(%ebp),%dx
  100e33:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100e34:	66 a1 66 ee 10 00    	mov    0x10ee66,%ax
  100e3a:	40                   	inc    %eax
  100e3b:	0f b7 c0             	movzwl %ax,%eax
  100e3e:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e42:	66 8b 45 ee          	mov    -0x12(%ebp),%ax
  100e46:	89 c2                	mov    %eax,%edx
  100e48:	ec                   	in     (%dx),%al
  100e49:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100e4c:	8a 45 ed             	mov    -0x13(%ebp),%al
  100e4f:	0f b6 c0             	movzbl %al,%eax
  100e52:	c1 e0 08             	shl    $0x8,%eax
  100e55:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100e58:	66 a1 66 ee 10 00    	mov    0x10ee66,%ax
  100e5e:	0f b7 c0             	movzwl %ax,%eax
  100e61:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  100e65:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e69:	8a 45 e9             	mov    -0x17(%ebp),%al
  100e6c:	66 8b 55 ea          	mov    -0x16(%ebp),%dx
  100e70:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100e71:	66 a1 66 ee 10 00    	mov    0x10ee66,%ax
  100e77:	40                   	inc    %eax
  100e78:	0f b7 c0             	movzwl %ax,%eax
  100e7b:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e7f:	66 8b 45 e6          	mov    -0x1a(%ebp),%ax
  100e83:	89 c2                	mov    %eax,%edx
  100e85:	ec                   	in     (%dx),%al
  100e86:	88 45 e5             	mov    %al,-0x1b(%ebp)
    return data;
  100e89:	8a 45 e5             	mov    -0x1b(%ebp),%al
  100e8c:	0f b6 c0             	movzbl %al,%eax
  100e8f:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100e92:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e95:	a3 60 ee 10 00       	mov    %eax,0x10ee60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100e9a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100e9d:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
}
  100ea3:	c9                   	leave  
  100ea4:	c3                   	ret    

00100ea5 <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100ea5:	55                   	push   %ebp
  100ea6:	89 e5                	mov    %esp,%ebp
  100ea8:	83 ec 38             	sub    $0x38,%esp
  100eab:	66 c7 45 f6 fa 03    	movw   $0x3fa,-0xa(%ebp)
  100eb1:	c6 45 f5 00          	movb   $0x0,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100eb5:	8a 45 f5             	mov    -0xb(%ebp),%al
  100eb8:	66 8b 55 f6          	mov    -0xa(%ebp),%dx
  100ebc:	ee                   	out    %al,(%dx)
  100ebd:	66 c7 45 f2 fb 03    	movw   $0x3fb,-0xe(%ebp)
  100ec3:	c6 45 f1 80          	movb   $0x80,-0xf(%ebp)
  100ec7:	8a 45 f1             	mov    -0xf(%ebp),%al
  100eca:	66 8b 55 f2          	mov    -0xe(%ebp),%dx
  100ece:	ee                   	out    %al,(%dx)
  100ecf:	66 c7 45 ee f8 03    	movw   $0x3f8,-0x12(%ebp)
  100ed5:	c6 45 ed 0c          	movb   $0xc,-0x13(%ebp)
  100ed9:	8a 45 ed             	mov    -0x13(%ebp),%al
  100edc:	66 8b 55 ee          	mov    -0x12(%ebp),%dx
  100ee0:	ee                   	out    %al,(%dx)
  100ee1:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100ee7:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
  100eeb:	8a 45 e9             	mov    -0x17(%ebp),%al
  100eee:	66 8b 55 ea          	mov    -0x16(%ebp),%dx
  100ef2:	ee                   	out    %al,(%dx)
  100ef3:	66 c7 45 e6 fb 03    	movw   $0x3fb,-0x1a(%ebp)
  100ef9:	c6 45 e5 03          	movb   $0x3,-0x1b(%ebp)
  100efd:	8a 45 e5             	mov    -0x1b(%ebp),%al
  100f00:	66 8b 55 e6          	mov    -0x1a(%ebp),%dx
  100f04:	ee                   	out    %al,(%dx)
  100f05:	66 c7 45 e2 fc 03    	movw   $0x3fc,-0x1e(%ebp)
  100f0b:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
  100f0f:	8a 45 e1             	mov    -0x1f(%ebp),%al
  100f12:	66 8b 55 e2          	mov    -0x1e(%ebp),%dx
  100f16:	ee                   	out    %al,(%dx)
  100f17:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100f1d:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
  100f21:	8a 45 dd             	mov    -0x23(%ebp),%al
  100f24:	66 8b 55 de          	mov    -0x22(%ebp),%dx
  100f28:	ee                   	out    %al,(%dx)
  100f29:	66 c7 45 da fd 03    	movw   $0x3fd,-0x26(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f2f:	66 8b 45 da          	mov    -0x26(%ebp),%ax
  100f33:	89 c2                	mov    %eax,%edx
  100f35:	ec                   	in     (%dx),%al
  100f36:	88 45 d9             	mov    %al,-0x27(%ebp)
    return data;
  100f39:	8a 45 d9             	mov    -0x27(%ebp),%al
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100f3c:	3c ff                	cmp    $0xff,%al
  100f3e:	0f 95 c0             	setne  %al
  100f41:	0f b6 c0             	movzbl %al,%eax
  100f44:	a3 68 ee 10 00       	mov    %eax,0x10ee68
  100f49:	66 c7 45 d6 fa 03    	movw   $0x3fa,-0x2a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f4f:	66 8b 45 d6          	mov    -0x2a(%ebp),%ax
  100f53:	89 c2                	mov    %eax,%edx
  100f55:	ec                   	in     (%dx),%al
  100f56:	88 45 d5             	mov    %al,-0x2b(%ebp)
  100f59:	66 c7 45 d2 f8 03    	movw   $0x3f8,-0x2e(%ebp)
  100f5f:	66 8b 45 d2          	mov    -0x2e(%ebp),%ax
  100f63:	89 c2                	mov    %eax,%edx
  100f65:	ec                   	in     (%dx),%al
  100f66:	88 45 d1             	mov    %al,-0x2f(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100f69:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  100f6e:	85 c0                	test   %eax,%eax
  100f70:	74 0d                	je     100f7f <serial_init+0xda>
        pic_enable(IRQ_COM1);
  100f72:	83 ec 0c             	sub    $0xc,%esp
  100f75:	6a 04                	push   $0x4
  100f77:	e8 6c 06 00 00       	call   1015e8 <pic_enable>
  100f7c:	83 c4 10             	add    $0x10,%esp
    }
}
  100f7f:	c9                   	leave  
  100f80:	c3                   	ret    

00100f81 <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100f81:	55                   	push   %ebp
  100f82:	89 e5                	mov    %esp,%ebp
  100f84:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100f87:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100f8e:	eb 08                	jmp    100f98 <lpt_putc_sub+0x17>
        delay();
  100f90:	e8 ee fd ff ff       	call   100d83 <delay>
}

static void
lpt_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100f95:	ff 45 fc             	incl   -0x4(%ebp)
  100f98:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  100f9e:	66 8b 45 fa          	mov    -0x6(%ebp),%ax
  100fa2:	89 c2                	mov    %eax,%edx
  100fa4:	ec                   	in     (%dx),%al
  100fa5:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  100fa8:	8a 45 f9             	mov    -0x7(%ebp),%al
  100fab:	84 c0                	test   %al,%al
  100fad:	78 09                	js     100fb8 <lpt_putc_sub+0x37>
  100faf:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  100fb6:	7e d8                	jle    100f90 <lpt_putc_sub+0xf>
        delay();
    }
    outb(LPTPORT + 0, c);
  100fb8:	8b 45 08             	mov    0x8(%ebp),%eax
  100fbb:	0f b6 c0             	movzbl %al,%eax
  100fbe:	66 c7 45 f6 78 03    	movw   $0x378,-0xa(%ebp)
  100fc4:	88 45 f5             	mov    %al,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fc7:	8a 45 f5             	mov    -0xb(%ebp),%al
  100fca:	66 8b 55 f6          	mov    -0xa(%ebp),%dx
  100fce:	ee                   	out    %al,(%dx)
  100fcf:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  100fd5:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
  100fd9:	8a 45 f1             	mov    -0xf(%ebp),%al
  100fdc:	66 8b 55 f2          	mov    -0xe(%ebp),%dx
  100fe0:	ee                   	out    %al,(%dx)
  100fe1:	66 c7 45 ee 7a 03    	movw   $0x37a,-0x12(%ebp)
  100fe7:	c6 45 ed 08          	movb   $0x8,-0x13(%ebp)
  100feb:	8a 45 ed             	mov    -0x13(%ebp),%al
  100fee:	66 8b 55 ee          	mov    -0x12(%ebp),%dx
  100ff2:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  100ff3:	c9                   	leave  
  100ff4:	c3                   	ret    

00100ff5 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  100ff5:	55                   	push   %ebp
  100ff6:	89 e5                	mov    %esp,%ebp
    if (c != '\b') {
  100ff8:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  100ffc:	74 0d                	je     10100b <lpt_putc+0x16>
        lpt_putc_sub(c);
  100ffe:	ff 75 08             	pushl  0x8(%ebp)
  101001:	e8 7b ff ff ff       	call   100f81 <lpt_putc_sub>
  101006:	83 c4 04             	add    $0x4,%esp
  101009:	eb 1e                	jmp    101029 <lpt_putc+0x34>
    }
    else {
        lpt_putc_sub('\b');
  10100b:	6a 08                	push   $0x8
  10100d:	e8 6f ff ff ff       	call   100f81 <lpt_putc_sub>
  101012:	83 c4 04             	add    $0x4,%esp
        lpt_putc_sub(' ');
  101015:	6a 20                	push   $0x20
  101017:	e8 65 ff ff ff       	call   100f81 <lpt_putc_sub>
  10101c:	83 c4 04             	add    $0x4,%esp
        lpt_putc_sub('\b');
  10101f:	6a 08                	push   $0x8
  101021:	e8 5b ff ff ff       	call   100f81 <lpt_putc_sub>
  101026:	83 c4 04             	add    $0x4,%esp
    }
}
  101029:	c9                   	leave  
  10102a:	c3                   	ret    

0010102b <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  10102b:	55                   	push   %ebp
  10102c:	89 e5                	mov    %esp,%ebp
  10102e:	53                   	push   %ebx
  10102f:	83 ec 24             	sub    $0x24,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  101032:	8b 45 08             	mov    0x8(%ebp),%eax
  101035:	b0 00                	mov    $0x0,%al
  101037:	85 c0                	test   %eax,%eax
  101039:	75 07                	jne    101042 <cga_putc+0x17>
        c |= 0x0700;
  10103b:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  101042:	8b 45 08             	mov    0x8(%ebp),%eax
  101045:	0f b6 c0             	movzbl %al,%eax
  101048:	83 f8 0a             	cmp    $0xa,%eax
  10104b:	74 44                	je     101091 <cga_putc+0x66>
  10104d:	83 f8 0d             	cmp    $0xd,%eax
  101050:	74 4e                	je     1010a0 <cga_putc+0x75>
  101052:	83 f8 08             	cmp    $0x8,%eax
  101055:	75 71                	jne    1010c8 <cga_putc+0x9d>
    case '\b':
        if (crt_pos > 0) {
  101057:	66 a1 64 ee 10 00    	mov    0x10ee64,%ax
  10105d:	66 85 c0             	test   %ax,%ax
  101060:	74 2d                	je     10108f <cga_putc+0x64>
            crt_pos --;
  101062:	66 a1 64 ee 10 00    	mov    0x10ee64,%ax
  101068:	48                   	dec    %eax
  101069:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  10106f:	8b 15 60 ee 10 00    	mov    0x10ee60,%edx
  101075:	66 a1 64 ee 10 00    	mov    0x10ee64,%ax
  10107b:	0f b7 c0             	movzwl %ax,%eax
  10107e:	01 c0                	add    %eax,%eax
  101080:	01 c2                	add    %eax,%edx
  101082:	8b 45 08             	mov    0x8(%ebp),%eax
  101085:	b0 00                	mov    $0x0,%al
  101087:	83 c8 20             	or     $0x20,%eax
  10108a:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  10108d:	eb 5e                	jmp    1010ed <cga_putc+0xc2>
  10108f:	eb 5c                	jmp    1010ed <cga_putc+0xc2>
    case '\n':
        crt_pos += CRT_COLS;
  101091:	66 a1 64 ee 10 00    	mov    0x10ee64,%ax
  101097:	83 c0 50             	add    $0x50,%eax
  10109a:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  1010a0:	66 8b 0d 64 ee 10 00 	mov    0x10ee64,%cx
  1010a7:	66 a1 64 ee 10 00    	mov    0x10ee64,%ax
  1010ad:	bb 50 00 00 00       	mov    $0x50,%ebx
  1010b2:	ba 00 00 00 00       	mov    $0x0,%edx
  1010b7:	66 f7 f3             	div    %bx
  1010ba:	89 d0                	mov    %edx,%eax
  1010bc:	29 c1                	sub    %eax,%ecx
  1010be:	89 c8                	mov    %ecx,%eax
  1010c0:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  1010c6:	eb 25                	jmp    1010ed <cga_putc+0xc2>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  1010c8:	8b 0d 60 ee 10 00    	mov    0x10ee60,%ecx
  1010ce:	66 a1 64 ee 10 00    	mov    0x10ee64,%ax
  1010d4:	8d 50 01             	lea    0x1(%eax),%edx
  1010d7:	66 89 15 64 ee 10 00 	mov    %dx,0x10ee64
  1010de:	0f b7 c0             	movzwl %ax,%eax
  1010e1:	01 c0                	add    %eax,%eax
  1010e3:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  1010e6:	8b 45 08             	mov    0x8(%ebp),%eax
  1010e9:	66 89 02             	mov    %ax,(%edx)
        break;
  1010ec:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  1010ed:	66 a1 64 ee 10 00    	mov    0x10ee64,%ax
  1010f3:	66 3d cf 07          	cmp    $0x7cf,%ax
  1010f7:	76 58                	jbe    101151 <cga_putc+0x126>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  1010f9:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1010fe:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  101104:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101109:	83 ec 04             	sub    $0x4,%esp
  10110c:	68 00 0f 00 00       	push   $0xf00
  101111:	52                   	push   %edx
  101112:	50                   	push   %eax
  101113:	e8 81 21 00 00       	call   103299 <memmove>
  101118:	83 c4 10             	add    $0x10,%esp
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  10111b:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  101122:	eb 15                	jmp    101139 <cga_putc+0x10e>
            crt_buf[i] = 0x0700 | ' ';
  101124:	8b 15 60 ee 10 00    	mov    0x10ee60,%edx
  10112a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10112d:	01 c0                	add    %eax,%eax
  10112f:	01 d0                	add    %edx,%eax
  101131:	66 c7 00 20 07       	movw   $0x720,(%eax)

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  101136:	ff 45 f4             	incl   -0xc(%ebp)
  101139:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  101140:	7e e2                	jle    101124 <cga_putc+0xf9>
            crt_buf[i] = 0x0700 | ' ';
        }
        crt_pos -= CRT_COLS;
  101142:	66 a1 64 ee 10 00    	mov    0x10ee64,%ax
  101148:	83 e8 50             	sub    $0x50,%eax
  10114b:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  101151:	66 a1 66 ee 10 00    	mov    0x10ee66,%ax
  101157:	0f b7 c0             	movzwl %ax,%eax
  10115a:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  10115e:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
  101162:	8a 45 f1             	mov    -0xf(%ebp),%al
  101165:	66 8b 55 f2          	mov    -0xe(%ebp),%dx
  101169:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  10116a:	66 a1 64 ee 10 00    	mov    0x10ee64,%ax
  101170:	66 c1 e8 08          	shr    $0x8,%ax
  101174:	0f b6 d0             	movzbl %al,%edx
  101177:	66 a1 66 ee 10 00    	mov    0x10ee66,%ax
  10117d:	40                   	inc    %eax
  10117e:	0f b7 c0             	movzwl %ax,%eax
  101181:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  101185:	88 55 ed             	mov    %dl,-0x13(%ebp)
  101188:	8a 45 ed             	mov    -0x13(%ebp),%al
  10118b:	66 8b 55 ee          	mov    -0x12(%ebp),%dx
  10118f:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  101190:	66 a1 66 ee 10 00    	mov    0x10ee66,%ax
  101196:	0f b7 c0             	movzwl %ax,%eax
  101199:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  10119d:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
  1011a1:	8a 45 e9             	mov    -0x17(%ebp),%al
  1011a4:	66 8b 55 ea          	mov    -0x16(%ebp),%dx
  1011a8:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  1011a9:	66 a1 64 ee 10 00    	mov    0x10ee64,%ax
  1011af:	0f b6 d0             	movzbl %al,%edx
  1011b2:	66 a1 66 ee 10 00    	mov    0x10ee66,%ax
  1011b8:	40                   	inc    %eax
  1011b9:	0f b7 c0             	movzwl %ax,%eax
  1011bc:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  1011c0:	88 55 e5             	mov    %dl,-0x1b(%ebp)
  1011c3:	8a 45 e5             	mov    -0x1b(%ebp),%al
  1011c6:	66 8b 55 e6          	mov    -0x1a(%ebp),%dx
  1011ca:	ee                   	out    %al,(%dx)
}
  1011cb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1011ce:	c9                   	leave  
  1011cf:	c3                   	ret    

001011d0 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  1011d0:	55                   	push   %ebp
  1011d1:	89 e5                	mov    %esp,%ebp
  1011d3:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  1011d6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1011dd:	eb 08                	jmp    1011e7 <serial_putc_sub+0x17>
        delay();
  1011df:	e8 9f fb ff ff       	call   100d83 <delay>
}

static void
serial_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  1011e4:	ff 45 fc             	incl   -0x4(%ebp)
  1011e7:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1011ed:	66 8b 45 fa          	mov    -0x6(%ebp),%ax
  1011f1:	89 c2                	mov    %eax,%edx
  1011f3:	ec                   	in     (%dx),%al
  1011f4:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  1011f7:	8a 45 f9             	mov    -0x7(%ebp),%al
  1011fa:	0f b6 c0             	movzbl %al,%eax
  1011fd:	83 e0 20             	and    $0x20,%eax
  101200:	85 c0                	test   %eax,%eax
  101202:	75 09                	jne    10120d <serial_putc_sub+0x3d>
  101204:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  10120b:	7e d2                	jle    1011df <serial_putc_sub+0xf>
        delay();
    }
    outb(COM1 + COM_TX, c);
  10120d:	8b 45 08             	mov    0x8(%ebp),%eax
  101210:	0f b6 c0             	movzbl %al,%eax
  101213:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  101219:	88 45 f5             	mov    %al,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10121c:	8a 45 f5             	mov    -0xb(%ebp),%al
  10121f:	66 8b 55 f6          	mov    -0xa(%ebp),%dx
  101223:	ee                   	out    %al,(%dx)
}
  101224:	c9                   	leave  
  101225:	c3                   	ret    

00101226 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  101226:	55                   	push   %ebp
  101227:	89 e5                	mov    %esp,%ebp
    if (c != '\b') {
  101229:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  10122d:	74 0d                	je     10123c <serial_putc+0x16>
        serial_putc_sub(c);
  10122f:	ff 75 08             	pushl  0x8(%ebp)
  101232:	e8 99 ff ff ff       	call   1011d0 <serial_putc_sub>
  101237:	83 c4 04             	add    $0x4,%esp
  10123a:	eb 1e                	jmp    10125a <serial_putc+0x34>
    }
    else {
        serial_putc_sub('\b');
  10123c:	6a 08                	push   $0x8
  10123e:	e8 8d ff ff ff       	call   1011d0 <serial_putc_sub>
  101243:	83 c4 04             	add    $0x4,%esp
        serial_putc_sub(' ');
  101246:	6a 20                	push   $0x20
  101248:	e8 83 ff ff ff       	call   1011d0 <serial_putc_sub>
  10124d:	83 c4 04             	add    $0x4,%esp
        serial_putc_sub('\b');
  101250:	6a 08                	push   $0x8
  101252:	e8 79 ff ff ff       	call   1011d0 <serial_putc_sub>
  101257:	83 c4 04             	add    $0x4,%esp
    }
}
  10125a:	c9                   	leave  
  10125b:	c3                   	ret    

0010125c <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  10125c:	55                   	push   %ebp
  10125d:	89 e5                	mov    %esp,%ebp
  10125f:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  101262:	eb 33                	jmp    101297 <cons_intr+0x3b>
        if (c != 0) {
  101264:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  101268:	74 2d                	je     101297 <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  10126a:	a1 84 f0 10 00       	mov    0x10f084,%eax
  10126f:	8d 50 01             	lea    0x1(%eax),%edx
  101272:	89 15 84 f0 10 00    	mov    %edx,0x10f084
  101278:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10127b:	88 90 80 ee 10 00    	mov    %dl,0x10ee80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  101281:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101286:	3d 00 02 00 00       	cmp    $0x200,%eax
  10128b:	75 0a                	jne    101297 <cons_intr+0x3b>
                cons.wpos = 0;
  10128d:	c7 05 84 f0 10 00 00 	movl   $0x0,0x10f084
  101294:	00 00 00 
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
    int c;
    while ((c = (*proc)()) != -1) {
  101297:	8b 45 08             	mov    0x8(%ebp),%eax
  10129a:	ff d0                	call   *%eax
  10129c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10129f:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  1012a3:	75 bf                	jne    101264 <cons_intr+0x8>
            if (cons.wpos == CONSBUFSIZE) {
                cons.wpos = 0;
            }
        }
    }
}
  1012a5:	c9                   	leave  
  1012a6:	c3                   	ret    

001012a7 <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  1012a7:	55                   	push   %ebp
  1012a8:	89 e5                	mov    %esp,%ebp
  1012aa:	83 ec 10             	sub    $0x10,%esp
  1012ad:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1012b3:	66 8b 45 fa          	mov    -0x6(%ebp),%ax
  1012b7:	89 c2                	mov    %eax,%edx
  1012b9:	ec                   	in     (%dx),%al
  1012ba:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  1012bd:	8a 45 f9             	mov    -0x7(%ebp),%al
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  1012c0:	0f b6 c0             	movzbl %al,%eax
  1012c3:	83 e0 01             	and    $0x1,%eax
  1012c6:	85 c0                	test   %eax,%eax
  1012c8:	75 07                	jne    1012d1 <serial_proc_data+0x2a>
        return -1;
  1012ca:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1012cf:	eb 29                	jmp    1012fa <serial_proc_data+0x53>
  1012d1:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1012d7:	66 8b 45 f6          	mov    -0xa(%ebp),%ax
  1012db:	89 c2                	mov    %eax,%edx
  1012dd:	ec                   	in     (%dx),%al
  1012de:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  1012e1:	8a 45 f5             	mov    -0xb(%ebp),%al
    }
    int c = inb(COM1 + COM_RX);
  1012e4:	0f b6 c0             	movzbl %al,%eax
  1012e7:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  1012ea:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  1012ee:	75 07                	jne    1012f7 <serial_proc_data+0x50>
        c = '\b';
  1012f0:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  1012f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1012fa:	c9                   	leave  
  1012fb:	c3                   	ret    

001012fc <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  1012fc:	55                   	push   %ebp
  1012fd:	89 e5                	mov    %esp,%ebp
  1012ff:	83 ec 08             	sub    $0x8,%esp
    if (serial_exists) {
  101302:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  101307:	85 c0                	test   %eax,%eax
  101309:	74 10                	je     10131b <serial_intr+0x1f>
        cons_intr(serial_proc_data);
  10130b:	83 ec 0c             	sub    $0xc,%esp
  10130e:	68 a7 12 10 00       	push   $0x1012a7
  101313:	e8 44 ff ff ff       	call   10125c <cons_intr>
  101318:	83 c4 10             	add    $0x10,%esp
    }
}
  10131b:	c9                   	leave  
  10131c:	c3                   	ret    

0010131d <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  10131d:	55                   	push   %ebp
  10131e:	89 e5                	mov    %esp,%ebp
  101320:	83 ec 28             	sub    $0x28,%esp
  101323:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101329:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10132c:	89 c2                	mov    %eax,%edx
  10132e:	ec                   	in     (%dx),%al
  10132f:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  101332:	8a 45 ef             	mov    -0x11(%ebp),%al
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  101335:	0f b6 c0             	movzbl %al,%eax
  101338:	83 e0 01             	and    $0x1,%eax
  10133b:	85 c0                	test   %eax,%eax
  10133d:	75 0a                	jne    101349 <kbd_proc_data+0x2c>
        return -1;
  10133f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101344:	e9 52 01 00 00       	jmp    10149b <kbd_proc_data+0x17e>
  101349:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10134f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101352:	89 c2                	mov    %eax,%edx
  101354:	ec                   	in     (%dx),%al
  101355:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  101358:	8a 45 eb             	mov    -0x15(%ebp),%al
    }

    data = inb(KBDATAP);
  10135b:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  10135e:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  101362:	75 17                	jne    10137b <kbd_proc_data+0x5e>
        // E0 escape character
        shift |= E0ESC;
  101364:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101369:	83 c8 40             	or     $0x40,%eax
  10136c:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101371:	b8 00 00 00 00       	mov    $0x0,%eax
  101376:	e9 20 01 00 00       	jmp    10149b <kbd_proc_data+0x17e>
    } else if (data & 0x80) {
  10137b:	8a 45 f3             	mov    -0xd(%ebp),%al
  10137e:	84 c0                	test   %al,%al
  101380:	79 44                	jns    1013c6 <kbd_proc_data+0xa9>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  101382:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101387:	83 e0 40             	and    $0x40,%eax
  10138a:	85 c0                	test   %eax,%eax
  10138c:	75 08                	jne    101396 <kbd_proc_data+0x79>
  10138e:	8a 45 f3             	mov    -0xd(%ebp),%al
  101391:	83 e0 7f             	and    $0x7f,%eax
  101394:	eb 03                	jmp    101399 <kbd_proc_data+0x7c>
  101396:	8a 45 f3             	mov    -0xd(%ebp),%al
  101399:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  10139c:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1013a0:	8a 80 40 e0 10 00    	mov    0x10e040(%eax),%al
  1013a6:	83 c8 40             	or     $0x40,%eax
  1013a9:	0f b6 c0             	movzbl %al,%eax
  1013ac:	f7 d0                	not    %eax
  1013ae:	89 c2                	mov    %eax,%edx
  1013b0:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1013b5:	21 d0                	and    %edx,%eax
  1013b7:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  1013bc:	b8 00 00 00 00       	mov    $0x0,%eax
  1013c1:	e9 d5 00 00 00       	jmp    10149b <kbd_proc_data+0x17e>
    } else if (shift & E0ESC) {
  1013c6:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1013cb:	83 e0 40             	and    $0x40,%eax
  1013ce:	85 c0                	test   %eax,%eax
  1013d0:	74 11                	je     1013e3 <kbd_proc_data+0xc6>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  1013d2:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  1013d6:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1013db:	83 e0 bf             	and    $0xffffffbf,%eax
  1013de:	a3 88 f0 10 00       	mov    %eax,0x10f088
    }

    shift |= shiftcode[data];
  1013e3:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1013e7:	8a 80 40 e0 10 00    	mov    0x10e040(%eax),%al
  1013ed:	0f b6 d0             	movzbl %al,%edx
  1013f0:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1013f5:	09 d0                	or     %edx,%eax
  1013f7:	a3 88 f0 10 00       	mov    %eax,0x10f088
    shift ^= togglecode[data];
  1013fc:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101400:	8a 80 40 e1 10 00    	mov    0x10e140(%eax),%al
  101406:	0f b6 d0             	movzbl %al,%edx
  101409:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10140e:	31 d0                	xor    %edx,%eax
  101410:	a3 88 f0 10 00       	mov    %eax,0x10f088

    c = charcode[shift & (CTL | SHIFT)][data];
  101415:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10141a:	83 e0 03             	and    $0x3,%eax
  10141d:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  101424:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101428:	01 d0                	add    %edx,%eax
  10142a:	8a 00                	mov    (%eax),%al
  10142c:	0f b6 c0             	movzbl %al,%eax
  10142f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  101432:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101437:	83 e0 08             	and    $0x8,%eax
  10143a:	85 c0                	test   %eax,%eax
  10143c:	74 22                	je     101460 <kbd_proc_data+0x143>
        if ('a' <= c && c <= 'z')
  10143e:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  101442:	7e 0c                	jle    101450 <kbd_proc_data+0x133>
  101444:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  101448:	7f 06                	jg     101450 <kbd_proc_data+0x133>
            c += 'A' - 'a';
  10144a:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  10144e:	eb 10                	jmp    101460 <kbd_proc_data+0x143>
        else if ('A' <= c && c <= 'Z')
  101450:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  101454:	7e 0a                	jle    101460 <kbd_proc_data+0x143>
  101456:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  10145a:	7f 04                	jg     101460 <kbd_proc_data+0x143>
            c += 'a' - 'A';
  10145c:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  101460:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101465:	f7 d0                	not    %eax
  101467:	83 e0 06             	and    $0x6,%eax
  10146a:	85 c0                	test   %eax,%eax
  10146c:	75 2a                	jne    101498 <kbd_proc_data+0x17b>
  10146e:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  101475:	75 21                	jne    101498 <kbd_proc_data+0x17b>
        cprintf("Rebooting!\n");
  101477:	83 ec 0c             	sub    $0xc,%esp
  10147a:	68 fd 36 10 00       	push   $0x1036fd
  10147f:	e8 7d ee ff ff       	call   100301 <cprintf>
  101484:	83 c4 10             	add    $0x10,%esp
  101487:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  10148d:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101491:	8a 45 e7             	mov    -0x19(%ebp),%al
  101494:	8b 55 e8             	mov    -0x18(%ebp),%edx
  101497:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  101498:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10149b:	c9                   	leave  
  10149c:	c3                   	ret    

0010149d <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  10149d:	55                   	push   %ebp
  10149e:	89 e5                	mov    %esp,%ebp
  1014a0:	83 ec 08             	sub    $0x8,%esp
    cons_intr(kbd_proc_data);
  1014a3:	83 ec 0c             	sub    $0xc,%esp
  1014a6:	68 1d 13 10 00       	push   $0x10131d
  1014ab:	e8 ac fd ff ff       	call   10125c <cons_intr>
  1014b0:	83 c4 10             	add    $0x10,%esp
}
  1014b3:	c9                   	leave  
  1014b4:	c3                   	ret    

001014b5 <kbd_init>:

static void
kbd_init(void) {
  1014b5:	55                   	push   %ebp
  1014b6:	89 e5                	mov    %esp,%ebp
  1014b8:	83 ec 08             	sub    $0x8,%esp
    // drain the kbd buffer
    kbd_intr();
  1014bb:	e8 dd ff ff ff       	call   10149d <kbd_intr>
    pic_enable(IRQ_KBD);
  1014c0:	83 ec 0c             	sub    $0xc,%esp
  1014c3:	6a 01                	push   $0x1
  1014c5:	e8 1e 01 00 00       	call   1015e8 <pic_enable>
  1014ca:	83 c4 10             	add    $0x10,%esp
}
  1014cd:	c9                   	leave  
  1014ce:	c3                   	ret    

001014cf <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  1014cf:	55                   	push   %ebp
  1014d0:	89 e5                	mov    %esp,%ebp
  1014d2:	83 ec 08             	sub    $0x8,%esp
    cga_init();
  1014d5:	e8 f1 f8 ff ff       	call   100dcb <cga_init>
    serial_init();
  1014da:	e8 c6 f9 ff ff       	call   100ea5 <serial_init>
    kbd_init();
  1014df:	e8 d1 ff ff ff       	call   1014b5 <kbd_init>
    if (!serial_exists) {
  1014e4:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  1014e9:	85 c0                	test   %eax,%eax
  1014eb:	75 10                	jne    1014fd <cons_init+0x2e>
        cprintf("serial port does not exist!!\n");
  1014ed:	83 ec 0c             	sub    $0xc,%esp
  1014f0:	68 09 37 10 00       	push   $0x103709
  1014f5:	e8 07 ee ff ff       	call   100301 <cprintf>
  1014fa:	83 c4 10             	add    $0x10,%esp
    }
}
  1014fd:	c9                   	leave  
  1014fe:	c3                   	ret    

001014ff <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  1014ff:	55                   	push   %ebp
  101500:	89 e5                	mov    %esp,%ebp
  101502:	83 ec 08             	sub    $0x8,%esp
    lpt_putc(c);
  101505:	ff 75 08             	pushl  0x8(%ebp)
  101508:	e8 e8 fa ff ff       	call   100ff5 <lpt_putc>
  10150d:	83 c4 04             	add    $0x4,%esp
    cga_putc(c);
  101510:	83 ec 0c             	sub    $0xc,%esp
  101513:	ff 75 08             	pushl  0x8(%ebp)
  101516:	e8 10 fb ff ff       	call   10102b <cga_putc>
  10151b:	83 c4 10             	add    $0x10,%esp
    serial_putc(c);
  10151e:	83 ec 0c             	sub    $0xc,%esp
  101521:	ff 75 08             	pushl  0x8(%ebp)
  101524:	e8 fd fc ff ff       	call   101226 <serial_putc>
  101529:	83 c4 10             	add    $0x10,%esp
}
  10152c:	c9                   	leave  
  10152d:	c3                   	ret    

0010152e <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  10152e:	55                   	push   %ebp
  10152f:	89 e5                	mov    %esp,%ebp
  101531:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  101534:	e8 c3 fd ff ff       	call   1012fc <serial_intr>
    kbd_intr();
  101539:	e8 5f ff ff ff       	call   10149d <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  10153e:	8b 15 80 f0 10 00    	mov    0x10f080,%edx
  101544:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101549:	39 c2                	cmp    %eax,%edx
  10154b:	74 35                	je     101582 <cons_getc+0x54>
        c = cons.buf[cons.rpos ++];
  10154d:	a1 80 f0 10 00       	mov    0x10f080,%eax
  101552:	8d 50 01             	lea    0x1(%eax),%edx
  101555:	89 15 80 f0 10 00    	mov    %edx,0x10f080
  10155b:	8a 80 80 ee 10 00    	mov    0x10ee80(%eax),%al
  101561:	0f b6 c0             	movzbl %al,%eax
  101564:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  101567:	a1 80 f0 10 00       	mov    0x10f080,%eax
  10156c:	3d 00 02 00 00       	cmp    $0x200,%eax
  101571:	75 0a                	jne    10157d <cons_getc+0x4f>
            cons.rpos = 0;
  101573:	c7 05 80 f0 10 00 00 	movl   $0x0,0x10f080
  10157a:	00 00 00 
        }
        return c;
  10157d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101580:	eb 05                	jmp    101587 <cons_getc+0x59>
    }
    return 0;
  101582:	b8 00 00 00 00       	mov    $0x0,%eax
}
  101587:	c9                   	leave  
  101588:	c3                   	ret    

00101589 <intr_enable>:
#include <intr.h>

// irq: Interrupt Reques 中断请求
/* intr_enable - enable irq interrupt 使能中断*/
void
intr_enable(void) {
  101589:	55                   	push   %ebp
  10158a:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  10158c:	fb                   	sti    
    sti();
}
  10158d:	5d                   	pop    %ebp
  10158e:	c3                   	ret    

0010158f <intr_disable>:

/* intr_disable - disable irq interrupt 屏蔽中断*/
void
intr_disable(void) {
  10158f:	55                   	push   %ebp
  101590:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  101592:	fa                   	cli    
    cli();
}
  101593:	5d                   	pop    %ebp
  101594:	c3                   	ret    

00101595 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  101595:	55                   	push   %ebp
  101596:	89 e5                	mov    %esp,%ebp
  101598:	83 ec 14             	sub    $0x14,%esp
  10159b:	8b 45 08             	mov    0x8(%ebp),%eax
  10159e:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  1015a2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1015a5:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  1015ab:	a1 8c f0 10 00       	mov    0x10f08c,%eax
  1015b0:	85 c0                	test   %eax,%eax
  1015b2:	74 32                	je     1015e6 <pic_setmask+0x51>
        outb(IO_PIC1 + 1, mask);
  1015b4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1015b7:	0f b6 c0             	movzbl %al,%eax
  1015ba:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  1015c0:	88 45 fd             	mov    %al,-0x3(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1015c3:	8a 45 fd             	mov    -0x3(%ebp),%al
  1015c6:	66 8b 55 fe          	mov    -0x2(%ebp),%dx
  1015ca:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  1015cb:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1015ce:	66 c1 e8 08          	shr    $0x8,%ax
  1015d2:	0f b6 c0             	movzbl %al,%eax
  1015d5:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  1015db:	88 45 f9             	mov    %al,-0x7(%ebp)
  1015de:	8a 45 f9             	mov    -0x7(%ebp),%al
  1015e1:	66 8b 55 fa          	mov    -0x6(%ebp),%dx
  1015e5:	ee                   	out    %al,(%dx)
    }
}
  1015e6:	c9                   	leave  
  1015e7:	c3                   	ret    

001015e8 <pic_enable>:

void
pic_enable(unsigned int irq) {
  1015e8:	55                   	push   %ebp
  1015e9:	89 e5                	mov    %esp,%ebp
    pic_setmask(irq_mask & ~(1 << irq));
  1015eb:	8b 45 08             	mov    0x8(%ebp),%eax
  1015ee:	ba 01 00 00 00       	mov    $0x1,%edx
  1015f3:	88 c1                	mov    %al,%cl
  1015f5:	d3 e2                	shl    %cl,%edx
  1015f7:	89 d0                	mov    %edx,%eax
  1015f9:	f7 d0                	not    %eax
  1015fb:	89 c2                	mov    %eax,%edx
  1015fd:	66 a1 50 e5 10 00    	mov    0x10e550,%ax
  101603:	21 d0                	and    %edx,%eax
  101605:	0f b7 c0             	movzwl %ax,%eax
  101608:	50                   	push   %eax
  101609:	e8 87 ff ff ff       	call   101595 <pic_setmask>
  10160e:	83 c4 04             	add    $0x4,%esp
}
  101611:	c9                   	leave  
  101612:	c3                   	ret    

00101613 <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  101613:	55                   	push   %ebp
  101614:	89 e5                	mov    %esp,%ebp
  101616:	83 ec 40             	sub    $0x40,%esp
    did_init = 1;
  101619:	c7 05 8c f0 10 00 01 	movl   $0x1,0x10f08c
  101620:	00 00 00 
  101623:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  101629:	c6 45 fd ff          	movb   $0xff,-0x3(%ebp)
  10162d:	8a 45 fd             	mov    -0x3(%ebp),%al
  101630:	66 8b 55 fe          	mov    -0x2(%ebp),%dx
  101634:	ee                   	out    %al,(%dx)
  101635:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  10163b:	c6 45 f9 ff          	movb   $0xff,-0x7(%ebp)
  10163f:	8a 45 f9             	mov    -0x7(%ebp),%al
  101642:	66 8b 55 fa          	mov    -0x6(%ebp),%dx
  101646:	ee                   	out    %al,(%dx)
  101647:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  10164d:	c6 45 f5 11          	movb   $0x11,-0xb(%ebp)
  101651:	8a 45 f5             	mov    -0xb(%ebp),%al
  101654:	66 8b 55 f6          	mov    -0xa(%ebp),%dx
  101658:	ee                   	out    %al,(%dx)
  101659:	66 c7 45 f2 21 00    	movw   $0x21,-0xe(%ebp)
  10165f:	c6 45 f1 20          	movb   $0x20,-0xf(%ebp)
  101663:	8a 45 f1             	mov    -0xf(%ebp),%al
  101666:	66 8b 55 f2          	mov    -0xe(%ebp),%dx
  10166a:	ee                   	out    %al,(%dx)
  10166b:	66 c7 45 ee 21 00    	movw   $0x21,-0x12(%ebp)
  101671:	c6 45 ed 04          	movb   $0x4,-0x13(%ebp)
  101675:	8a 45 ed             	mov    -0x13(%ebp),%al
  101678:	66 8b 55 ee          	mov    -0x12(%ebp),%dx
  10167c:	ee                   	out    %al,(%dx)
  10167d:	66 c7 45 ea 21 00    	movw   $0x21,-0x16(%ebp)
  101683:	c6 45 e9 03          	movb   $0x3,-0x17(%ebp)
  101687:	8a 45 e9             	mov    -0x17(%ebp),%al
  10168a:	66 8b 55 ea          	mov    -0x16(%ebp),%dx
  10168e:	ee                   	out    %al,(%dx)
  10168f:	66 c7 45 e6 a0 00    	movw   $0xa0,-0x1a(%ebp)
  101695:	c6 45 e5 11          	movb   $0x11,-0x1b(%ebp)
  101699:	8a 45 e5             	mov    -0x1b(%ebp),%al
  10169c:	66 8b 55 e6          	mov    -0x1a(%ebp),%dx
  1016a0:	ee                   	out    %al,(%dx)
  1016a1:	66 c7 45 e2 a1 00    	movw   $0xa1,-0x1e(%ebp)
  1016a7:	c6 45 e1 28          	movb   $0x28,-0x1f(%ebp)
  1016ab:	8a 45 e1             	mov    -0x1f(%ebp),%al
  1016ae:	66 8b 55 e2          	mov    -0x1e(%ebp),%dx
  1016b2:	ee                   	out    %al,(%dx)
  1016b3:	66 c7 45 de a1 00    	movw   $0xa1,-0x22(%ebp)
  1016b9:	c6 45 dd 02          	movb   $0x2,-0x23(%ebp)
  1016bd:	8a 45 dd             	mov    -0x23(%ebp),%al
  1016c0:	66 8b 55 de          	mov    -0x22(%ebp),%dx
  1016c4:	ee                   	out    %al,(%dx)
  1016c5:	66 c7 45 da a1 00    	movw   $0xa1,-0x26(%ebp)
  1016cb:	c6 45 d9 03          	movb   $0x3,-0x27(%ebp)
  1016cf:	8a 45 d9             	mov    -0x27(%ebp),%al
  1016d2:	66 8b 55 da          	mov    -0x26(%ebp),%dx
  1016d6:	ee                   	out    %al,(%dx)
  1016d7:	66 c7 45 d6 20 00    	movw   $0x20,-0x2a(%ebp)
  1016dd:	c6 45 d5 68          	movb   $0x68,-0x2b(%ebp)
  1016e1:	8a 45 d5             	mov    -0x2b(%ebp),%al
  1016e4:	66 8b 55 d6          	mov    -0x2a(%ebp),%dx
  1016e8:	ee                   	out    %al,(%dx)
  1016e9:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  1016ef:	c6 45 d1 0a          	movb   $0xa,-0x2f(%ebp)
  1016f3:	8a 45 d1             	mov    -0x2f(%ebp),%al
  1016f6:	66 8b 55 d2          	mov    -0x2e(%ebp),%dx
  1016fa:	ee                   	out    %al,(%dx)
  1016fb:	66 c7 45 ce a0 00    	movw   $0xa0,-0x32(%ebp)
  101701:	c6 45 cd 68          	movb   $0x68,-0x33(%ebp)
  101705:	8a 45 cd             	mov    -0x33(%ebp),%al
  101708:	66 8b 55 ce          	mov    -0x32(%ebp),%dx
  10170c:	ee                   	out    %al,(%dx)
  10170d:	66 c7 45 ca a0 00    	movw   $0xa0,-0x36(%ebp)
  101713:	c6 45 c9 0a          	movb   $0xa,-0x37(%ebp)
  101717:	8a 45 c9             	mov    -0x37(%ebp),%al
  10171a:	66 8b 55 ca          	mov    -0x36(%ebp),%dx
  10171e:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  10171f:	66 a1 50 e5 10 00    	mov    0x10e550,%ax
  101725:	66 83 f8 ff          	cmp    $0xffff,%ax
  101729:	74 12                	je     10173d <pic_init+0x12a>
        pic_setmask(irq_mask);
  10172b:	66 a1 50 e5 10 00    	mov    0x10e550,%ax
  101731:	0f b7 c0             	movzwl %ax,%eax
  101734:	50                   	push   %eax
  101735:	e8 5b fe ff ff       	call   101595 <pic_setmask>
  10173a:	83 c4 04             	add    $0x4,%esp
    }
}
  10173d:	c9                   	leave  
  10173e:	c3                   	ret    

0010173f <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  10173f:	55                   	push   %ebp
  101740:	89 e5                	mov    %esp,%ebp
  101742:	83 ec 08             	sub    $0x8,%esp
    cprintf("%d ticks\n",TICK_NUM);
  101745:	83 ec 08             	sub    $0x8,%esp
  101748:	6a 64                	push   $0x64
  10174a:	68 40 37 10 00       	push   $0x103740
  10174f:	e8 ad eb ff ff       	call   100301 <cprintf>
  101754:	83 c4 10             	add    $0x10,%esp
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  101757:	c9                   	leave  
  101758:	c3                   	ret    

00101759 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101759:	55                   	push   %ebp
  10175a:	89 e5                	mov    %esp,%ebp
  10175c:	83 ec 10             	sub    $0x10,%esp
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */

    extern uintptr_t __vectors[];
    int i;
    for (i = 0; i < sizeof(idt) / sizeof(struct gatedesc); i ++) {
  10175f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101766:	e9 b8 00 00 00       	jmp    101823 <idt_init+0xca>
        SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
  10176b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10176e:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  101775:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101778:	66 89 04 d5 a0 f0 10 	mov    %ax,0x10f0a0(,%edx,8)
  10177f:	00 
  101780:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101783:	66 c7 04 c5 a2 f0 10 	movw   $0x8,0x10f0a2(,%eax,8)
  10178a:	00 08 00 
  10178d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101790:	8a 14 c5 a4 f0 10 00 	mov    0x10f0a4(,%eax,8),%dl
  101797:	83 e2 e0             	and    $0xffffffe0,%edx
  10179a:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  1017a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1017a4:	8a 14 c5 a4 f0 10 00 	mov    0x10f0a4(,%eax,8),%dl
  1017ab:	83 e2 1f             	and    $0x1f,%edx
  1017ae:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  1017b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1017b8:	8a 14 c5 a5 f0 10 00 	mov    0x10f0a5(,%eax,8),%dl
  1017bf:	83 e2 f0             	and    $0xfffffff0,%edx
  1017c2:	83 ca 0e             	or     $0xe,%edx
  1017c5:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1017cc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1017cf:	8a 14 c5 a5 f0 10 00 	mov    0x10f0a5(,%eax,8),%dl
  1017d6:	83 e2 ef             	and    $0xffffffef,%edx
  1017d9:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1017e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1017e3:	8a 14 c5 a5 f0 10 00 	mov    0x10f0a5(,%eax,8),%dl
  1017ea:	83 e2 9f             	and    $0xffffff9f,%edx
  1017ed:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1017f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1017f7:	8a 14 c5 a5 f0 10 00 	mov    0x10f0a5(,%eax,8),%dl
  1017fe:	83 ca 80             	or     $0xffffff80,%edx
  101801:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  101808:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10180b:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  101812:	c1 e8 10             	shr    $0x10,%eax
  101815:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101818:	66 89 04 d5 a6 f0 10 	mov    %ax,0x10f0a6(,%edx,8)
  10181f:	00 
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */

    extern uintptr_t __vectors[];
    int i;
    for (i = 0; i < sizeof(idt) / sizeof(struct gatedesc); i ++) {
  101820:	ff 45 fc             	incl   -0x4(%ebp)
  101823:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101826:	3d ff 00 00 00       	cmp    $0xff,%eax
  10182b:	0f 86 3a ff ff ff    	jbe    10176b <idt_init+0x12>
        SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
    }
	// set for switch from user to kernel
    SETGATE(idt[T_SWITCH_TOK], 0, GD_KTEXT, __vectors[T_SWITCH_TOK], DPL_USER);
  101831:	a1 c4 e7 10 00       	mov    0x10e7c4,%eax
  101836:	66 a3 68 f4 10 00    	mov    %ax,0x10f468
  10183c:	66 c7 05 6a f4 10 00 	movw   $0x8,0x10f46a
  101843:	08 00 
  101845:	a0 6c f4 10 00       	mov    0x10f46c,%al
  10184a:	83 e0 e0             	and    $0xffffffe0,%eax
  10184d:	a2 6c f4 10 00       	mov    %al,0x10f46c
  101852:	a0 6c f4 10 00       	mov    0x10f46c,%al
  101857:	83 e0 1f             	and    $0x1f,%eax
  10185a:	a2 6c f4 10 00       	mov    %al,0x10f46c
  10185f:	a0 6d f4 10 00       	mov    0x10f46d,%al
  101864:	83 e0 f0             	and    $0xfffffff0,%eax
  101867:	83 c8 0e             	or     $0xe,%eax
  10186a:	a2 6d f4 10 00       	mov    %al,0x10f46d
  10186f:	a0 6d f4 10 00       	mov    0x10f46d,%al
  101874:	83 e0 ef             	and    $0xffffffef,%eax
  101877:	a2 6d f4 10 00       	mov    %al,0x10f46d
  10187c:	a0 6d f4 10 00       	mov    0x10f46d,%al
  101881:	83 c8 60             	or     $0x60,%eax
  101884:	a2 6d f4 10 00       	mov    %al,0x10f46d
  101889:	a0 6d f4 10 00       	mov    0x10f46d,%al
  10188e:	83 c8 80             	or     $0xffffff80,%eax
  101891:	a2 6d f4 10 00       	mov    %al,0x10f46d
  101896:	a1 c4 e7 10 00       	mov    0x10e7c4,%eax
  10189b:	c1 e8 10             	shr    $0x10,%eax
  10189e:	66 a3 6e f4 10 00    	mov    %ax,0x10f46e
  1018a4:	c7 45 f8 60 e5 10 00 	movl   $0x10e560,-0x8(%ebp)
    return ebp;
}

static inline void
lidt(struct pseudodesc *pd) {
    asm volatile ("lidt (%0)" :: "r" (pd));
  1018ab:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1018ae:	0f 01 18             	lidtl  (%eax)
	// load the IDT
    lidt(&idt_pd);  //load idt 告诉系统idt生成完毕

}
  1018b1:	c9                   	leave  
  1018b2:	c3                   	ret    

001018b3 <trapname>:

static const char *
trapname(int trapno) {
  1018b3:	55                   	push   %ebp
  1018b4:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  1018b6:	8b 45 08             	mov    0x8(%ebp),%eax
  1018b9:	83 f8 13             	cmp    $0x13,%eax
  1018bc:	77 0c                	ja     1018ca <trapname+0x17>
        return excnames[trapno];
  1018be:	8b 45 08             	mov    0x8(%ebp),%eax
  1018c1:	8b 04 85 a0 3a 10 00 	mov    0x103aa0(,%eax,4),%eax
  1018c8:	eb 18                	jmp    1018e2 <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  1018ca:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  1018ce:	7e 0d                	jle    1018dd <trapname+0x2a>
  1018d0:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  1018d4:	7f 07                	jg     1018dd <trapname+0x2a>
        return "Hardware Interrupt";
  1018d6:	b8 4a 37 10 00       	mov    $0x10374a,%eax
  1018db:	eb 05                	jmp    1018e2 <trapname+0x2f>
    }
    return "(unknown trap)";
  1018dd:	b8 5d 37 10 00       	mov    $0x10375d,%eax
}
  1018e2:	5d                   	pop    %ebp
  1018e3:	c3                   	ret    

001018e4 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  1018e4:	55                   	push   %ebp
  1018e5:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  1018e7:	8b 45 08             	mov    0x8(%ebp),%eax
  1018ea:	66 8b 40 3c          	mov    0x3c(%eax),%ax
  1018ee:	66 83 f8 08          	cmp    $0x8,%ax
  1018f2:	0f 94 c0             	sete   %al
  1018f5:	0f b6 c0             	movzbl %al,%eax
}
  1018f8:	5d                   	pop    %ebp
  1018f9:	c3                   	ret    

001018fa <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  1018fa:	55                   	push   %ebp
  1018fb:	89 e5                	mov    %esp,%ebp
  1018fd:	83 ec 18             	sub    $0x18,%esp
    cprintf("trapframe at %p\n", tf);
  101900:	83 ec 08             	sub    $0x8,%esp
  101903:	ff 75 08             	pushl  0x8(%ebp)
  101906:	68 9e 37 10 00       	push   $0x10379e
  10190b:	e8 f1 e9 ff ff       	call   100301 <cprintf>
  101910:	83 c4 10             	add    $0x10,%esp
    print_regs(&tf->tf_regs);
  101913:	8b 45 08             	mov    0x8(%ebp),%eax
  101916:	83 ec 0c             	sub    $0xc,%esp
  101919:	50                   	push   %eax
  10191a:	e8 bb 01 00 00       	call   101ada <print_regs>
  10191f:	83 c4 10             	add    $0x10,%esp
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101922:	8b 45 08             	mov    0x8(%ebp),%eax
  101925:	66 8b 40 2c          	mov    0x2c(%eax),%ax
  101929:	0f b7 c0             	movzwl %ax,%eax
  10192c:	83 ec 08             	sub    $0x8,%esp
  10192f:	50                   	push   %eax
  101930:	68 af 37 10 00       	push   $0x1037af
  101935:	e8 c7 e9 ff ff       	call   100301 <cprintf>
  10193a:	83 c4 10             	add    $0x10,%esp
    cprintf("  es   0x----%04x\n", tf->tf_es);
  10193d:	8b 45 08             	mov    0x8(%ebp),%eax
  101940:	66 8b 40 28          	mov    0x28(%eax),%ax
  101944:	0f b7 c0             	movzwl %ax,%eax
  101947:	83 ec 08             	sub    $0x8,%esp
  10194a:	50                   	push   %eax
  10194b:	68 c2 37 10 00       	push   $0x1037c2
  101950:	e8 ac e9 ff ff       	call   100301 <cprintf>
  101955:	83 c4 10             	add    $0x10,%esp
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101958:	8b 45 08             	mov    0x8(%ebp),%eax
  10195b:	66 8b 40 24          	mov    0x24(%eax),%ax
  10195f:	0f b7 c0             	movzwl %ax,%eax
  101962:	83 ec 08             	sub    $0x8,%esp
  101965:	50                   	push   %eax
  101966:	68 d5 37 10 00       	push   $0x1037d5
  10196b:	e8 91 e9 ff ff       	call   100301 <cprintf>
  101970:	83 c4 10             	add    $0x10,%esp
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101973:	8b 45 08             	mov    0x8(%ebp),%eax
  101976:	66 8b 40 20          	mov    0x20(%eax),%ax
  10197a:	0f b7 c0             	movzwl %ax,%eax
  10197d:	83 ec 08             	sub    $0x8,%esp
  101980:	50                   	push   %eax
  101981:	68 e8 37 10 00       	push   $0x1037e8
  101986:	e8 76 e9 ff ff       	call   100301 <cprintf>
  10198b:	83 c4 10             	add    $0x10,%esp
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  10198e:	8b 45 08             	mov    0x8(%ebp),%eax
  101991:	8b 40 30             	mov    0x30(%eax),%eax
  101994:	83 ec 0c             	sub    $0xc,%esp
  101997:	50                   	push   %eax
  101998:	e8 16 ff ff ff       	call   1018b3 <trapname>
  10199d:	83 c4 10             	add    $0x10,%esp
  1019a0:	89 c2                	mov    %eax,%edx
  1019a2:	8b 45 08             	mov    0x8(%ebp),%eax
  1019a5:	8b 40 30             	mov    0x30(%eax),%eax
  1019a8:	83 ec 04             	sub    $0x4,%esp
  1019ab:	52                   	push   %edx
  1019ac:	50                   	push   %eax
  1019ad:	68 fb 37 10 00       	push   $0x1037fb
  1019b2:	e8 4a e9 ff ff       	call   100301 <cprintf>
  1019b7:	83 c4 10             	add    $0x10,%esp
    cprintf("  err  0x%08x\n", tf->tf_err);
  1019ba:	8b 45 08             	mov    0x8(%ebp),%eax
  1019bd:	8b 40 34             	mov    0x34(%eax),%eax
  1019c0:	83 ec 08             	sub    $0x8,%esp
  1019c3:	50                   	push   %eax
  1019c4:	68 0d 38 10 00       	push   $0x10380d
  1019c9:	e8 33 e9 ff ff       	call   100301 <cprintf>
  1019ce:	83 c4 10             	add    $0x10,%esp
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  1019d1:	8b 45 08             	mov    0x8(%ebp),%eax
  1019d4:	8b 40 38             	mov    0x38(%eax),%eax
  1019d7:	83 ec 08             	sub    $0x8,%esp
  1019da:	50                   	push   %eax
  1019db:	68 1c 38 10 00       	push   $0x10381c
  1019e0:	e8 1c e9 ff ff       	call   100301 <cprintf>
  1019e5:	83 c4 10             	add    $0x10,%esp
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  1019e8:	8b 45 08             	mov    0x8(%ebp),%eax
  1019eb:	66 8b 40 3c          	mov    0x3c(%eax),%ax
  1019ef:	0f b7 c0             	movzwl %ax,%eax
  1019f2:	83 ec 08             	sub    $0x8,%esp
  1019f5:	50                   	push   %eax
  1019f6:	68 2b 38 10 00       	push   $0x10382b
  1019fb:	e8 01 e9 ff ff       	call   100301 <cprintf>
  101a00:	83 c4 10             	add    $0x10,%esp
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101a03:	8b 45 08             	mov    0x8(%ebp),%eax
  101a06:	8b 40 40             	mov    0x40(%eax),%eax
  101a09:	83 ec 08             	sub    $0x8,%esp
  101a0c:	50                   	push   %eax
  101a0d:	68 3e 38 10 00       	push   $0x10383e
  101a12:	e8 ea e8 ff ff       	call   100301 <cprintf>
  101a17:	83 c4 10             	add    $0x10,%esp

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101a1a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101a21:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101a28:	eb 43                	jmp    101a6d <print_trapframe+0x173>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101a2a:	8b 45 08             	mov    0x8(%ebp),%eax
  101a2d:	8b 50 40             	mov    0x40(%eax),%edx
  101a30:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101a33:	21 d0                	and    %edx,%eax
  101a35:	85 c0                	test   %eax,%eax
  101a37:	74 29                	je     101a62 <print_trapframe+0x168>
  101a39:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101a3c:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101a43:	85 c0                	test   %eax,%eax
  101a45:	74 1b                	je     101a62 <print_trapframe+0x168>
            cprintf("%s,", IA32flags[i]);
  101a47:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101a4a:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101a51:	83 ec 08             	sub    $0x8,%esp
  101a54:	50                   	push   %eax
  101a55:	68 4d 38 10 00       	push   $0x10384d
  101a5a:	e8 a2 e8 ff ff       	call   100301 <cprintf>
  101a5f:	83 c4 10             	add    $0x10,%esp
    cprintf("  eip  0x%08x\n", tf->tf_eip);
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
    cprintf("  flag 0x%08x ", tf->tf_eflags);

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101a62:	ff 45 f4             	incl   -0xc(%ebp)
  101a65:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101a68:	01 c0                	add    %eax,%eax
  101a6a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  101a6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101a70:	83 f8 17             	cmp    $0x17,%eax
  101a73:	76 b5                	jbe    101a2a <print_trapframe+0x130>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
            cprintf("%s,", IA32flags[i]);
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101a75:	8b 45 08             	mov    0x8(%ebp),%eax
  101a78:	8b 40 40             	mov    0x40(%eax),%eax
  101a7b:	25 00 30 00 00       	and    $0x3000,%eax
  101a80:	c1 e8 0c             	shr    $0xc,%eax
  101a83:	83 ec 08             	sub    $0x8,%esp
  101a86:	50                   	push   %eax
  101a87:	68 51 38 10 00       	push   $0x103851
  101a8c:	e8 70 e8 ff ff       	call   100301 <cprintf>
  101a91:	83 c4 10             	add    $0x10,%esp

    if (!trap_in_kernel(tf)) {
  101a94:	83 ec 0c             	sub    $0xc,%esp
  101a97:	ff 75 08             	pushl  0x8(%ebp)
  101a9a:	e8 45 fe ff ff       	call   1018e4 <trap_in_kernel>
  101a9f:	83 c4 10             	add    $0x10,%esp
  101aa2:	85 c0                	test   %eax,%eax
  101aa4:	75 32                	jne    101ad8 <print_trapframe+0x1de>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101aa6:	8b 45 08             	mov    0x8(%ebp),%eax
  101aa9:	8b 40 44             	mov    0x44(%eax),%eax
  101aac:	83 ec 08             	sub    $0x8,%esp
  101aaf:	50                   	push   %eax
  101ab0:	68 5a 38 10 00       	push   $0x10385a
  101ab5:	e8 47 e8 ff ff       	call   100301 <cprintf>
  101aba:	83 c4 10             	add    $0x10,%esp
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101abd:	8b 45 08             	mov    0x8(%ebp),%eax
  101ac0:	66 8b 40 48          	mov    0x48(%eax),%ax
  101ac4:	0f b7 c0             	movzwl %ax,%eax
  101ac7:	83 ec 08             	sub    $0x8,%esp
  101aca:	50                   	push   %eax
  101acb:	68 69 38 10 00       	push   $0x103869
  101ad0:	e8 2c e8 ff ff       	call   100301 <cprintf>
  101ad5:	83 c4 10             	add    $0x10,%esp
    }
}
  101ad8:	c9                   	leave  
  101ad9:	c3                   	ret    

00101ada <print_regs>:

void
print_regs(struct pushregs *regs) {
  101ada:	55                   	push   %ebp
  101adb:	89 e5                	mov    %esp,%ebp
  101add:	83 ec 08             	sub    $0x8,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101ae0:	8b 45 08             	mov    0x8(%ebp),%eax
  101ae3:	8b 00                	mov    (%eax),%eax
  101ae5:	83 ec 08             	sub    $0x8,%esp
  101ae8:	50                   	push   %eax
  101ae9:	68 7c 38 10 00       	push   $0x10387c
  101aee:	e8 0e e8 ff ff       	call   100301 <cprintf>
  101af3:	83 c4 10             	add    $0x10,%esp
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101af6:	8b 45 08             	mov    0x8(%ebp),%eax
  101af9:	8b 40 04             	mov    0x4(%eax),%eax
  101afc:	83 ec 08             	sub    $0x8,%esp
  101aff:	50                   	push   %eax
  101b00:	68 8b 38 10 00       	push   $0x10388b
  101b05:	e8 f7 e7 ff ff       	call   100301 <cprintf>
  101b0a:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101b0d:	8b 45 08             	mov    0x8(%ebp),%eax
  101b10:	8b 40 08             	mov    0x8(%eax),%eax
  101b13:	83 ec 08             	sub    $0x8,%esp
  101b16:	50                   	push   %eax
  101b17:	68 9a 38 10 00       	push   $0x10389a
  101b1c:	e8 e0 e7 ff ff       	call   100301 <cprintf>
  101b21:	83 c4 10             	add    $0x10,%esp
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101b24:	8b 45 08             	mov    0x8(%ebp),%eax
  101b27:	8b 40 0c             	mov    0xc(%eax),%eax
  101b2a:	83 ec 08             	sub    $0x8,%esp
  101b2d:	50                   	push   %eax
  101b2e:	68 a9 38 10 00       	push   $0x1038a9
  101b33:	e8 c9 e7 ff ff       	call   100301 <cprintf>
  101b38:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101b3b:	8b 45 08             	mov    0x8(%ebp),%eax
  101b3e:	8b 40 10             	mov    0x10(%eax),%eax
  101b41:	83 ec 08             	sub    $0x8,%esp
  101b44:	50                   	push   %eax
  101b45:	68 b8 38 10 00       	push   $0x1038b8
  101b4a:	e8 b2 e7 ff ff       	call   100301 <cprintf>
  101b4f:	83 c4 10             	add    $0x10,%esp
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101b52:	8b 45 08             	mov    0x8(%ebp),%eax
  101b55:	8b 40 14             	mov    0x14(%eax),%eax
  101b58:	83 ec 08             	sub    $0x8,%esp
  101b5b:	50                   	push   %eax
  101b5c:	68 c7 38 10 00       	push   $0x1038c7
  101b61:	e8 9b e7 ff ff       	call   100301 <cprintf>
  101b66:	83 c4 10             	add    $0x10,%esp
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101b69:	8b 45 08             	mov    0x8(%ebp),%eax
  101b6c:	8b 40 18             	mov    0x18(%eax),%eax
  101b6f:	83 ec 08             	sub    $0x8,%esp
  101b72:	50                   	push   %eax
  101b73:	68 d6 38 10 00       	push   $0x1038d6
  101b78:	e8 84 e7 ff ff       	call   100301 <cprintf>
  101b7d:	83 c4 10             	add    $0x10,%esp
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101b80:	8b 45 08             	mov    0x8(%ebp),%eax
  101b83:	8b 40 1c             	mov    0x1c(%eax),%eax
  101b86:	83 ec 08             	sub    $0x8,%esp
  101b89:	50                   	push   %eax
  101b8a:	68 e5 38 10 00       	push   $0x1038e5
  101b8f:	e8 6d e7 ff ff       	call   100301 <cprintf>
  101b94:	83 c4 10             	add    $0x10,%esp
}
  101b97:	c9                   	leave  
  101b98:	c3                   	ret    

00101b99 <trap_dispatch>:

struct trapframe switchk2u, *switchu2k;

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101b99:	55                   	push   %ebp
  101b9a:	89 e5                	mov    %esp,%ebp
  101b9c:	57                   	push   %edi
  101b9d:	56                   	push   %esi
  101b9e:	53                   	push   %ebx
  101b9f:	83 ec 1c             	sub    $0x1c,%esp
    char c;

    switch (tf->tf_trapno) {
  101ba2:	8b 45 08             	mov    0x8(%ebp),%eax
  101ba5:	8b 40 30             	mov    0x30(%eax),%eax
  101ba8:	83 f8 2f             	cmp    $0x2f,%eax
  101bab:	77 1d                	ja     101bca <trap_dispatch+0x31>
  101bad:	83 f8 2e             	cmp    $0x2e,%eax
  101bb0:	0f 83 d1 01 00 00    	jae    101d87 <trap_dispatch+0x1ee>
  101bb6:	83 f8 21             	cmp    $0x21,%eax
  101bb9:	74 7e                	je     101c39 <trap_dispatch+0xa0>
  101bbb:	83 f8 24             	cmp    $0x24,%eax
  101bbe:	74 52                	je     101c12 <trap_dispatch+0x79>
  101bc0:	83 f8 20             	cmp    $0x20,%eax
  101bc3:	74 1c                	je     101be1 <trap_dispatch+0x48>
  101bc5:	e9 87 01 00 00       	jmp    101d51 <trap_dispatch+0x1b8>
  101bca:	83 f8 78             	cmp    $0x78,%eax
  101bcd:	0f 84 8d 00 00 00    	je     101c60 <trap_dispatch+0xc7>
  101bd3:	83 f8 79             	cmp    $0x79,%eax
  101bd6:	0f 84 01 01 00 00    	je     101cdd <trap_dispatch+0x144>
  101bdc:	e9 70 01 00 00       	jmp    101d51 <trap_dispatch+0x1b8>
        /* LAB1代码：步骤3 */
        /*处理定时器中断*/ 
        /*（1）定时器中断后，你应该使用一个全局变量记录此事件（增加），如kern/driver/clock.c
          （2）每一tick_num周期，你可以使用一个函数打印一些信息，如print_ticks()。
          （3）太简单了吗？是的，我想是的！*/
        ticks ++;
  101be1:	a1 08 f9 10 00       	mov    0x10f908,%eax
  101be6:	40                   	inc    %eax
  101be7:	a3 08 f9 10 00       	mov    %eax,0x10f908
        if (ticks % TICK_NUM == 0) {
  101bec:	a1 08 f9 10 00       	mov    0x10f908,%eax
  101bf1:	b9 64 00 00 00       	mov    $0x64,%ecx
  101bf6:	ba 00 00 00 00       	mov    $0x0,%edx
  101bfb:	f7 f1                	div    %ecx
  101bfd:	89 d0                	mov    %edx,%eax
  101bff:	85 c0                	test   %eax,%eax
  101c01:	75 0a                	jne    101c0d <trap_dispatch+0x74>
            print_ticks();
  101c03:	e8 37 fb ff ff       	call   10173f <print_ticks>
        }
        break;
  101c08:	e9 7b 01 00 00       	jmp    101d88 <trap_dispatch+0x1ef>
  101c0d:	e9 76 01 00 00       	jmp    101d88 <trap_dispatch+0x1ef>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101c12:	e8 17 f9 ff ff       	call   10152e <cons_getc>
  101c17:	88 45 e7             	mov    %al,-0x19(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101c1a:	0f be 55 e7          	movsbl -0x19(%ebp),%edx
  101c1e:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
  101c22:	83 ec 04             	sub    $0x4,%esp
  101c25:	52                   	push   %edx
  101c26:	50                   	push   %eax
  101c27:	68 f4 38 10 00       	push   $0x1038f4
  101c2c:	e8 d0 e6 ff ff       	call   100301 <cprintf>
  101c31:	83 c4 10             	add    $0x10,%esp
        break;
  101c34:	e9 4f 01 00 00       	jmp    101d88 <trap_dispatch+0x1ef>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101c39:	e8 f0 f8 ff ff       	call   10152e <cons_getc>
  101c3e:	88 45 e7             	mov    %al,-0x19(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);     //kbd在这里输出
  101c41:	0f be 55 e7          	movsbl -0x19(%ebp),%edx
  101c45:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
  101c49:	83 ec 04             	sub    $0x4,%esp
  101c4c:	52                   	push   %edx
  101c4d:	50                   	push   %eax
  101c4e:	68 06 39 10 00       	push   $0x103906
  101c53:	e8 a9 e6 ff ff       	call   100301 <cprintf>
  101c58:	83 c4 10             	add    $0x10,%esp
        break;
  101c5b:	e9 28 01 00 00       	jmp    101d88 <trap_dispatch+0x1ef>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
        if (tf->tf_cs != USER_CS) {
  101c60:	8b 45 08             	mov    0x8(%ebp),%eax
  101c63:	66 8b 40 3c          	mov    0x3c(%eax),%ax
  101c67:	66 83 f8 1b          	cmp    $0x1b,%ax
  101c6b:	74 6b                	je     101cd8 <trap_dispatch+0x13f>
            switchk2u = *tf;   //trapframes
  101c6d:	8b 45 08             	mov    0x8(%ebp),%eax
  101c70:	ba 20 f9 10 00       	mov    $0x10f920,%edx
  101c75:	89 c3                	mov    %eax,%ebx
  101c77:	b8 13 00 00 00       	mov    $0x13,%eax
  101c7c:	89 d7                	mov    %edx,%edi
  101c7e:	89 de                	mov    %ebx,%esi
  101c80:	89 c1                	mov    %eax,%ecx
  101c82:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
            switchk2u.tf_cs = USER_CS;
  101c84:	66 c7 05 5c f9 10 00 	movw   $0x1b,0x10f95c
  101c8b:	1b 00 
            switchk2u.tf_ds = switchk2u.tf_es = switchk2u.tf_ss = USER_DS;
  101c8d:	66 c7 05 68 f9 10 00 	movw   $0x23,0x10f968
  101c94:	23 00 
  101c96:	66 a1 68 f9 10 00    	mov    0x10f968,%ax
  101c9c:	66 a3 48 f9 10 00    	mov    %ax,0x10f948
  101ca2:	66 a1 48 f9 10 00    	mov    0x10f948,%ax
  101ca8:	66 a3 4c f9 10 00    	mov    %ax,0x10f94c
            switchk2u.tf_esp = (uint32_t)tf + sizeof(struct trapframe) - 8;
  101cae:	8b 45 08             	mov    0x8(%ebp),%eax
  101cb1:	83 c0 44             	add    $0x44,%eax
  101cb4:	a3 64 f9 10 00       	mov    %eax,0x10f964
            //(uint32_t)tf + sizeof(struct trapframe) - 8 等同于tf->tf_esp
            //switchk2u是tf的一个接力，它的esp就是tf的esp，而SS是USER的DS
        
            // set eflags, make sure ucore can use io under user mode.
            // if CPL > IOPL, then cpu will generate a general protection.
            switchk2u.tf_eflags |= FL_IOPL_MASK;  //或就是补上，与非就是抹掉
  101cb9:	a1 60 f9 10 00       	mov    0x10f960,%eax
  101cbe:	80 cc 30             	or     $0x30,%ah
  101cc1:	a3 60 f9 10 00       	mov    %eax,0x10f960
            //FL_IOPL_MASK 0x00003000   I/O Privilege Level bitmask
            //EFLAGS(program status and control) register主要用于提供程序的状态及进行相应的控制
        
            // set temporary stack
            // then iret will jump to the right stack
            *((uint32_t *)tf - 1) = (uint32_t)&switchk2u;
  101cc6:	8b 45 08             	mov    0x8(%ebp),%eax
  101cc9:	83 e8 04             	sub    $0x4,%eax
  101ccc:	ba 20 f9 10 00       	mov    $0x10f920,%edx
  101cd1:	89 10                	mov    %edx,(%eax)
            //switchk2u的ESP指的是TF的iret
        }
        break;
  101cd3:	e9 b0 00 00 00       	jmp    101d88 <trap_dispatch+0x1ef>
  101cd8:	e9 ab 00 00 00       	jmp    101d88 <trap_dispatch+0x1ef>
    case T_SWITCH_TOK:
        if (tf->tf_cs != KERNEL_CS) {
  101cdd:	8b 45 08             	mov    0x8(%ebp),%eax
  101ce0:	66 8b 40 3c          	mov    0x3c(%eax),%ax
  101ce4:	66 83 f8 08          	cmp    $0x8,%ax
  101ce8:	74 65                	je     101d4f <trap_dispatch+0x1b6>
            tf->tf_cs = KERNEL_CS;
  101cea:	8b 45 08             	mov    0x8(%ebp),%eax
  101ced:	66 c7 40 3c 08 00    	movw   $0x8,0x3c(%eax)
            tf->tf_ds = tf->tf_es = KERNEL_DS; //这里的SS是不动的，因为在INT时已经发生了特权级切换，此时的SS已经压入栈中
  101cf3:	8b 45 08             	mov    0x8(%ebp),%eax
  101cf6:	66 c7 40 28 10 00    	movw   $0x10,0x28(%eax)
  101cfc:	8b 45 08             	mov    0x8(%ebp),%eax
  101cff:	66 8b 40 28          	mov    0x28(%eax),%ax
  101d03:	8b 55 08             	mov    0x8(%ebp),%edx
  101d06:	66 89 42 2c          	mov    %ax,0x2c(%edx)
            tf->tf_eflags &= ~FL_IOPL_MASK;//或就是补上，与非就是抹掉
  101d0a:	8b 45 08             	mov    0x8(%ebp),%eax
  101d0d:	8b 40 40             	mov    0x40(%eax),%eax
  101d10:	80 e4 cf             	and    $0xcf,%ah
  101d13:	89 c2                	mov    %eax,%edx
  101d15:	8b 45 08             	mov    0x8(%ebp),%eax
  101d18:	89 50 40             	mov    %edx,0x40(%eax)

            
            switchu2k = (struct trapframe *)(tf->tf_esp - (sizeof(struct trapframe) - 8));
  101d1b:	8b 45 08             	mov    0x8(%ebp),%eax
  101d1e:	8b 40 44             	mov    0x44(%eax),%eax
  101d21:	83 e8 44             	sub    $0x44,%eax
  101d24:	a3 6c f9 10 00       	mov    %eax,0x10f96c
            //看清楚了，这里是(sizeof(struct trapframe) - 8)，
            //(tf->tf_esp - (sizeof(struct trapframe) - 8)) 就是tf本身！！！已验证
            //所以此句可以直接忽略掉，甚至switchu2k也可以去掉，已经测试过了
            
            //memmove(void *dst, const void *src, size_t n)移动
            memmove(switchu2k, tf, sizeof(struct trapframe) - 8);  //此句无用！
  101d29:	a1 6c f9 10 00       	mov    0x10f96c,%eax
  101d2e:	83 ec 04             	sub    $0x4,%esp
  101d31:	6a 44                	push   $0x44
  101d33:	ff 75 08             	pushl  0x8(%ebp)
  101d36:	50                   	push   %eax
  101d37:	e8 5d 15 00 00       	call   103299 <memmove>
  101d3c:	83 c4 10             	add    $0x10,%esp
            *((uint32_t *)tf - 1) = (uint32_t)switchu2k;  //此句无用！
  101d3f:	8b 45 08             	mov    0x8(%ebp),%eax
  101d42:	83 e8 04             	sub    $0x4,%eax
  101d45:	8b 15 6c f9 10 00    	mov    0x10f96c,%edx
  101d4b:	89 10                	mov    %edx,(%eax)
        }
        break;
  101d4d:	eb 39                	jmp    101d88 <trap_dispatch+0x1ef>
  101d4f:	eb 37                	jmp    101d88 <trap_dispatch+0x1ef>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101d51:	8b 45 08             	mov    0x8(%ebp),%eax
  101d54:	66 8b 40 3c          	mov    0x3c(%eax),%ax
  101d58:	0f b7 c0             	movzwl %ax,%eax
  101d5b:	83 e0 03             	and    $0x3,%eax
  101d5e:	85 c0                	test   %eax,%eax
  101d60:	75 26                	jne    101d88 <trap_dispatch+0x1ef>
            print_trapframe(tf);
  101d62:	83 ec 0c             	sub    $0xc,%esp
  101d65:	ff 75 08             	pushl  0x8(%ebp)
  101d68:	e8 8d fb ff ff       	call   1018fa <print_trapframe>
  101d6d:	83 c4 10             	add    $0x10,%esp
            panic("unexpected trap in kernel.\n");
  101d70:	83 ec 04             	sub    $0x4,%esp
  101d73:	68 15 39 10 00       	push   $0x103915
  101d78:	68 e5 00 00 00       	push   $0xe5
  101d7d:	68 31 39 10 00       	push   $0x103931
  101d82:	e8 da ee ff ff       	call   100c61 <__panic>
        }
        break;
    case IRQ_OFFSET + IRQ_IDE1:
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
  101d87:	90                   	nop
        if ((tf->tf_cs & 3) == 0) {
            print_trapframe(tf);
            panic("unexpected trap in kernel.\n");
        }
    }
}
  101d88:	8d 65 f4             	lea    -0xc(%ebp),%esp
  101d8b:	5b                   	pop    %ebx
  101d8c:	5e                   	pop    %esi
  101d8d:	5f                   	pop    %edi
  101d8e:	5d                   	pop    %ebp
  101d8f:	c3                   	ret    

00101d90 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101d90:	55                   	push   %ebp
  101d91:	89 e5                	mov    %esp,%ebp
  101d93:	83 ec 08             	sub    $0x8,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101d96:	83 ec 0c             	sub    $0xc,%esp
  101d99:	ff 75 08             	pushl  0x8(%ebp)
  101d9c:	e8 f8 fd ff ff       	call   101b99 <trap_dispatch>
  101da1:	83 c4 10             	add    $0x10,%esp
}
  101da4:	c9                   	leave  
  101da5:	c3                   	ret    

00101da6 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  101da6:	1e                   	push   %ds
    pushl %es
  101da7:	06                   	push   %es
    pushl %fs
  101da8:	0f a0                	push   %fs
    pushl %gs
  101daa:	0f a8                	push   %gs
    pushal
  101dac:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  101dad:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  101db2:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  101db4:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  101db6:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  101db7:	e8 d4 ff ff ff       	call   101d90 <trap>

    # pop the pushed stack pointer
    popl %esp
  101dbc:	5c                   	pop    %esp

00101dbd <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  101dbd:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  101dbe:	0f a9                	pop    %gs
    popl %fs
  101dc0:	0f a1                	pop    %fs
    popl %es
  101dc2:	07                   	pop    %es
    popl %ds
  101dc3:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  101dc4:	83 c4 08             	add    $0x8,%esp
    iret
  101dc7:	cf                   	iret   

00101dc8 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101dc8:	6a 00                	push   $0x0
  pushl $0
  101dca:	6a 00                	push   $0x0
  jmp __alltraps
  101dcc:	e9 d5 ff ff ff       	jmp    101da6 <__alltraps>

00101dd1 <vector1>:
.globl vector1
vector1:
  pushl $0
  101dd1:	6a 00                	push   $0x0
  pushl $1
  101dd3:	6a 01                	push   $0x1
  jmp __alltraps
  101dd5:	e9 cc ff ff ff       	jmp    101da6 <__alltraps>

00101dda <vector2>:
.globl vector2
vector2:
  pushl $0
  101dda:	6a 00                	push   $0x0
  pushl $2
  101ddc:	6a 02                	push   $0x2
  jmp __alltraps
  101dde:	e9 c3 ff ff ff       	jmp    101da6 <__alltraps>

00101de3 <vector3>:
.globl vector3
vector3:
  pushl $0
  101de3:	6a 00                	push   $0x0
  pushl $3
  101de5:	6a 03                	push   $0x3
  jmp __alltraps
  101de7:	e9 ba ff ff ff       	jmp    101da6 <__alltraps>

00101dec <vector4>:
.globl vector4
vector4:
  pushl $0
  101dec:	6a 00                	push   $0x0
  pushl $4
  101dee:	6a 04                	push   $0x4
  jmp __alltraps
  101df0:	e9 b1 ff ff ff       	jmp    101da6 <__alltraps>

00101df5 <vector5>:
.globl vector5
vector5:
  pushl $0
  101df5:	6a 00                	push   $0x0
  pushl $5
  101df7:	6a 05                	push   $0x5
  jmp __alltraps
  101df9:	e9 a8 ff ff ff       	jmp    101da6 <__alltraps>

00101dfe <vector6>:
.globl vector6
vector6:
  pushl $0
  101dfe:	6a 00                	push   $0x0
  pushl $6
  101e00:	6a 06                	push   $0x6
  jmp __alltraps
  101e02:	e9 9f ff ff ff       	jmp    101da6 <__alltraps>

00101e07 <vector7>:
.globl vector7
vector7:
  pushl $0
  101e07:	6a 00                	push   $0x0
  pushl $7
  101e09:	6a 07                	push   $0x7
  jmp __alltraps
  101e0b:	e9 96 ff ff ff       	jmp    101da6 <__alltraps>

00101e10 <vector8>:
.globl vector8
vector8:
  pushl $8
  101e10:	6a 08                	push   $0x8
  jmp __alltraps
  101e12:	e9 8f ff ff ff       	jmp    101da6 <__alltraps>

00101e17 <vector9>:
.globl vector9
vector9:
  pushl $9
  101e17:	6a 09                	push   $0x9
  jmp __alltraps
  101e19:	e9 88 ff ff ff       	jmp    101da6 <__alltraps>

00101e1e <vector10>:
.globl vector10
vector10:
  pushl $10
  101e1e:	6a 0a                	push   $0xa
  jmp __alltraps
  101e20:	e9 81 ff ff ff       	jmp    101da6 <__alltraps>

00101e25 <vector11>:
.globl vector11
vector11:
  pushl $11
  101e25:	6a 0b                	push   $0xb
  jmp __alltraps
  101e27:	e9 7a ff ff ff       	jmp    101da6 <__alltraps>

00101e2c <vector12>:
.globl vector12
vector12:
  pushl $12
  101e2c:	6a 0c                	push   $0xc
  jmp __alltraps
  101e2e:	e9 73 ff ff ff       	jmp    101da6 <__alltraps>

00101e33 <vector13>:
.globl vector13
vector13:
  pushl $13
  101e33:	6a 0d                	push   $0xd
  jmp __alltraps
  101e35:	e9 6c ff ff ff       	jmp    101da6 <__alltraps>

00101e3a <vector14>:
.globl vector14
vector14:
  pushl $14
  101e3a:	6a 0e                	push   $0xe
  jmp __alltraps
  101e3c:	e9 65 ff ff ff       	jmp    101da6 <__alltraps>

00101e41 <vector15>:
.globl vector15
vector15:
  pushl $0
  101e41:	6a 00                	push   $0x0
  pushl $15
  101e43:	6a 0f                	push   $0xf
  jmp __alltraps
  101e45:	e9 5c ff ff ff       	jmp    101da6 <__alltraps>

00101e4a <vector16>:
.globl vector16
vector16:
  pushl $0
  101e4a:	6a 00                	push   $0x0
  pushl $16
  101e4c:	6a 10                	push   $0x10
  jmp __alltraps
  101e4e:	e9 53 ff ff ff       	jmp    101da6 <__alltraps>

00101e53 <vector17>:
.globl vector17
vector17:
  pushl $17
  101e53:	6a 11                	push   $0x11
  jmp __alltraps
  101e55:	e9 4c ff ff ff       	jmp    101da6 <__alltraps>

00101e5a <vector18>:
.globl vector18
vector18:
  pushl $0
  101e5a:	6a 00                	push   $0x0
  pushl $18
  101e5c:	6a 12                	push   $0x12
  jmp __alltraps
  101e5e:	e9 43 ff ff ff       	jmp    101da6 <__alltraps>

00101e63 <vector19>:
.globl vector19
vector19:
  pushl $0
  101e63:	6a 00                	push   $0x0
  pushl $19
  101e65:	6a 13                	push   $0x13
  jmp __alltraps
  101e67:	e9 3a ff ff ff       	jmp    101da6 <__alltraps>

00101e6c <vector20>:
.globl vector20
vector20:
  pushl $0
  101e6c:	6a 00                	push   $0x0
  pushl $20
  101e6e:	6a 14                	push   $0x14
  jmp __alltraps
  101e70:	e9 31 ff ff ff       	jmp    101da6 <__alltraps>

00101e75 <vector21>:
.globl vector21
vector21:
  pushl $0
  101e75:	6a 00                	push   $0x0
  pushl $21
  101e77:	6a 15                	push   $0x15
  jmp __alltraps
  101e79:	e9 28 ff ff ff       	jmp    101da6 <__alltraps>

00101e7e <vector22>:
.globl vector22
vector22:
  pushl $0
  101e7e:	6a 00                	push   $0x0
  pushl $22
  101e80:	6a 16                	push   $0x16
  jmp __alltraps
  101e82:	e9 1f ff ff ff       	jmp    101da6 <__alltraps>

00101e87 <vector23>:
.globl vector23
vector23:
  pushl $0
  101e87:	6a 00                	push   $0x0
  pushl $23
  101e89:	6a 17                	push   $0x17
  jmp __alltraps
  101e8b:	e9 16 ff ff ff       	jmp    101da6 <__alltraps>

00101e90 <vector24>:
.globl vector24
vector24:
  pushl $0
  101e90:	6a 00                	push   $0x0
  pushl $24
  101e92:	6a 18                	push   $0x18
  jmp __alltraps
  101e94:	e9 0d ff ff ff       	jmp    101da6 <__alltraps>

00101e99 <vector25>:
.globl vector25
vector25:
  pushl $0
  101e99:	6a 00                	push   $0x0
  pushl $25
  101e9b:	6a 19                	push   $0x19
  jmp __alltraps
  101e9d:	e9 04 ff ff ff       	jmp    101da6 <__alltraps>

00101ea2 <vector26>:
.globl vector26
vector26:
  pushl $0
  101ea2:	6a 00                	push   $0x0
  pushl $26
  101ea4:	6a 1a                	push   $0x1a
  jmp __alltraps
  101ea6:	e9 fb fe ff ff       	jmp    101da6 <__alltraps>

00101eab <vector27>:
.globl vector27
vector27:
  pushl $0
  101eab:	6a 00                	push   $0x0
  pushl $27
  101ead:	6a 1b                	push   $0x1b
  jmp __alltraps
  101eaf:	e9 f2 fe ff ff       	jmp    101da6 <__alltraps>

00101eb4 <vector28>:
.globl vector28
vector28:
  pushl $0
  101eb4:	6a 00                	push   $0x0
  pushl $28
  101eb6:	6a 1c                	push   $0x1c
  jmp __alltraps
  101eb8:	e9 e9 fe ff ff       	jmp    101da6 <__alltraps>

00101ebd <vector29>:
.globl vector29
vector29:
  pushl $0
  101ebd:	6a 00                	push   $0x0
  pushl $29
  101ebf:	6a 1d                	push   $0x1d
  jmp __alltraps
  101ec1:	e9 e0 fe ff ff       	jmp    101da6 <__alltraps>

00101ec6 <vector30>:
.globl vector30
vector30:
  pushl $0
  101ec6:	6a 00                	push   $0x0
  pushl $30
  101ec8:	6a 1e                	push   $0x1e
  jmp __alltraps
  101eca:	e9 d7 fe ff ff       	jmp    101da6 <__alltraps>

00101ecf <vector31>:
.globl vector31
vector31:
  pushl $0
  101ecf:	6a 00                	push   $0x0
  pushl $31
  101ed1:	6a 1f                	push   $0x1f
  jmp __alltraps
  101ed3:	e9 ce fe ff ff       	jmp    101da6 <__alltraps>

00101ed8 <vector32>:
.globl vector32
vector32:
  pushl $0
  101ed8:	6a 00                	push   $0x0
  pushl $32
  101eda:	6a 20                	push   $0x20
  jmp __alltraps
  101edc:	e9 c5 fe ff ff       	jmp    101da6 <__alltraps>

00101ee1 <vector33>:
.globl vector33
vector33:
  pushl $0
  101ee1:	6a 00                	push   $0x0
  pushl $33
  101ee3:	6a 21                	push   $0x21
  jmp __alltraps
  101ee5:	e9 bc fe ff ff       	jmp    101da6 <__alltraps>

00101eea <vector34>:
.globl vector34
vector34:
  pushl $0
  101eea:	6a 00                	push   $0x0
  pushl $34
  101eec:	6a 22                	push   $0x22
  jmp __alltraps
  101eee:	e9 b3 fe ff ff       	jmp    101da6 <__alltraps>

00101ef3 <vector35>:
.globl vector35
vector35:
  pushl $0
  101ef3:	6a 00                	push   $0x0
  pushl $35
  101ef5:	6a 23                	push   $0x23
  jmp __alltraps
  101ef7:	e9 aa fe ff ff       	jmp    101da6 <__alltraps>

00101efc <vector36>:
.globl vector36
vector36:
  pushl $0
  101efc:	6a 00                	push   $0x0
  pushl $36
  101efe:	6a 24                	push   $0x24
  jmp __alltraps
  101f00:	e9 a1 fe ff ff       	jmp    101da6 <__alltraps>

00101f05 <vector37>:
.globl vector37
vector37:
  pushl $0
  101f05:	6a 00                	push   $0x0
  pushl $37
  101f07:	6a 25                	push   $0x25
  jmp __alltraps
  101f09:	e9 98 fe ff ff       	jmp    101da6 <__alltraps>

00101f0e <vector38>:
.globl vector38
vector38:
  pushl $0
  101f0e:	6a 00                	push   $0x0
  pushl $38
  101f10:	6a 26                	push   $0x26
  jmp __alltraps
  101f12:	e9 8f fe ff ff       	jmp    101da6 <__alltraps>

00101f17 <vector39>:
.globl vector39
vector39:
  pushl $0
  101f17:	6a 00                	push   $0x0
  pushl $39
  101f19:	6a 27                	push   $0x27
  jmp __alltraps
  101f1b:	e9 86 fe ff ff       	jmp    101da6 <__alltraps>

00101f20 <vector40>:
.globl vector40
vector40:
  pushl $0
  101f20:	6a 00                	push   $0x0
  pushl $40
  101f22:	6a 28                	push   $0x28
  jmp __alltraps
  101f24:	e9 7d fe ff ff       	jmp    101da6 <__alltraps>

00101f29 <vector41>:
.globl vector41
vector41:
  pushl $0
  101f29:	6a 00                	push   $0x0
  pushl $41
  101f2b:	6a 29                	push   $0x29
  jmp __alltraps
  101f2d:	e9 74 fe ff ff       	jmp    101da6 <__alltraps>

00101f32 <vector42>:
.globl vector42
vector42:
  pushl $0
  101f32:	6a 00                	push   $0x0
  pushl $42
  101f34:	6a 2a                	push   $0x2a
  jmp __alltraps
  101f36:	e9 6b fe ff ff       	jmp    101da6 <__alltraps>

00101f3b <vector43>:
.globl vector43
vector43:
  pushl $0
  101f3b:	6a 00                	push   $0x0
  pushl $43
  101f3d:	6a 2b                	push   $0x2b
  jmp __alltraps
  101f3f:	e9 62 fe ff ff       	jmp    101da6 <__alltraps>

00101f44 <vector44>:
.globl vector44
vector44:
  pushl $0
  101f44:	6a 00                	push   $0x0
  pushl $44
  101f46:	6a 2c                	push   $0x2c
  jmp __alltraps
  101f48:	e9 59 fe ff ff       	jmp    101da6 <__alltraps>

00101f4d <vector45>:
.globl vector45
vector45:
  pushl $0
  101f4d:	6a 00                	push   $0x0
  pushl $45
  101f4f:	6a 2d                	push   $0x2d
  jmp __alltraps
  101f51:	e9 50 fe ff ff       	jmp    101da6 <__alltraps>

00101f56 <vector46>:
.globl vector46
vector46:
  pushl $0
  101f56:	6a 00                	push   $0x0
  pushl $46
  101f58:	6a 2e                	push   $0x2e
  jmp __alltraps
  101f5a:	e9 47 fe ff ff       	jmp    101da6 <__alltraps>

00101f5f <vector47>:
.globl vector47
vector47:
  pushl $0
  101f5f:	6a 00                	push   $0x0
  pushl $47
  101f61:	6a 2f                	push   $0x2f
  jmp __alltraps
  101f63:	e9 3e fe ff ff       	jmp    101da6 <__alltraps>

00101f68 <vector48>:
.globl vector48
vector48:
  pushl $0
  101f68:	6a 00                	push   $0x0
  pushl $48
  101f6a:	6a 30                	push   $0x30
  jmp __alltraps
  101f6c:	e9 35 fe ff ff       	jmp    101da6 <__alltraps>

00101f71 <vector49>:
.globl vector49
vector49:
  pushl $0
  101f71:	6a 00                	push   $0x0
  pushl $49
  101f73:	6a 31                	push   $0x31
  jmp __alltraps
  101f75:	e9 2c fe ff ff       	jmp    101da6 <__alltraps>

00101f7a <vector50>:
.globl vector50
vector50:
  pushl $0
  101f7a:	6a 00                	push   $0x0
  pushl $50
  101f7c:	6a 32                	push   $0x32
  jmp __alltraps
  101f7e:	e9 23 fe ff ff       	jmp    101da6 <__alltraps>

00101f83 <vector51>:
.globl vector51
vector51:
  pushl $0
  101f83:	6a 00                	push   $0x0
  pushl $51
  101f85:	6a 33                	push   $0x33
  jmp __alltraps
  101f87:	e9 1a fe ff ff       	jmp    101da6 <__alltraps>

00101f8c <vector52>:
.globl vector52
vector52:
  pushl $0
  101f8c:	6a 00                	push   $0x0
  pushl $52
  101f8e:	6a 34                	push   $0x34
  jmp __alltraps
  101f90:	e9 11 fe ff ff       	jmp    101da6 <__alltraps>

00101f95 <vector53>:
.globl vector53
vector53:
  pushl $0
  101f95:	6a 00                	push   $0x0
  pushl $53
  101f97:	6a 35                	push   $0x35
  jmp __alltraps
  101f99:	e9 08 fe ff ff       	jmp    101da6 <__alltraps>

00101f9e <vector54>:
.globl vector54
vector54:
  pushl $0
  101f9e:	6a 00                	push   $0x0
  pushl $54
  101fa0:	6a 36                	push   $0x36
  jmp __alltraps
  101fa2:	e9 ff fd ff ff       	jmp    101da6 <__alltraps>

00101fa7 <vector55>:
.globl vector55
vector55:
  pushl $0
  101fa7:	6a 00                	push   $0x0
  pushl $55
  101fa9:	6a 37                	push   $0x37
  jmp __alltraps
  101fab:	e9 f6 fd ff ff       	jmp    101da6 <__alltraps>

00101fb0 <vector56>:
.globl vector56
vector56:
  pushl $0
  101fb0:	6a 00                	push   $0x0
  pushl $56
  101fb2:	6a 38                	push   $0x38
  jmp __alltraps
  101fb4:	e9 ed fd ff ff       	jmp    101da6 <__alltraps>

00101fb9 <vector57>:
.globl vector57
vector57:
  pushl $0
  101fb9:	6a 00                	push   $0x0
  pushl $57
  101fbb:	6a 39                	push   $0x39
  jmp __alltraps
  101fbd:	e9 e4 fd ff ff       	jmp    101da6 <__alltraps>

00101fc2 <vector58>:
.globl vector58
vector58:
  pushl $0
  101fc2:	6a 00                	push   $0x0
  pushl $58
  101fc4:	6a 3a                	push   $0x3a
  jmp __alltraps
  101fc6:	e9 db fd ff ff       	jmp    101da6 <__alltraps>

00101fcb <vector59>:
.globl vector59
vector59:
  pushl $0
  101fcb:	6a 00                	push   $0x0
  pushl $59
  101fcd:	6a 3b                	push   $0x3b
  jmp __alltraps
  101fcf:	e9 d2 fd ff ff       	jmp    101da6 <__alltraps>

00101fd4 <vector60>:
.globl vector60
vector60:
  pushl $0
  101fd4:	6a 00                	push   $0x0
  pushl $60
  101fd6:	6a 3c                	push   $0x3c
  jmp __alltraps
  101fd8:	e9 c9 fd ff ff       	jmp    101da6 <__alltraps>

00101fdd <vector61>:
.globl vector61
vector61:
  pushl $0
  101fdd:	6a 00                	push   $0x0
  pushl $61
  101fdf:	6a 3d                	push   $0x3d
  jmp __alltraps
  101fe1:	e9 c0 fd ff ff       	jmp    101da6 <__alltraps>

00101fe6 <vector62>:
.globl vector62
vector62:
  pushl $0
  101fe6:	6a 00                	push   $0x0
  pushl $62
  101fe8:	6a 3e                	push   $0x3e
  jmp __alltraps
  101fea:	e9 b7 fd ff ff       	jmp    101da6 <__alltraps>

00101fef <vector63>:
.globl vector63
vector63:
  pushl $0
  101fef:	6a 00                	push   $0x0
  pushl $63
  101ff1:	6a 3f                	push   $0x3f
  jmp __alltraps
  101ff3:	e9 ae fd ff ff       	jmp    101da6 <__alltraps>

00101ff8 <vector64>:
.globl vector64
vector64:
  pushl $0
  101ff8:	6a 00                	push   $0x0
  pushl $64
  101ffa:	6a 40                	push   $0x40
  jmp __alltraps
  101ffc:	e9 a5 fd ff ff       	jmp    101da6 <__alltraps>

00102001 <vector65>:
.globl vector65
vector65:
  pushl $0
  102001:	6a 00                	push   $0x0
  pushl $65
  102003:	6a 41                	push   $0x41
  jmp __alltraps
  102005:	e9 9c fd ff ff       	jmp    101da6 <__alltraps>

0010200a <vector66>:
.globl vector66
vector66:
  pushl $0
  10200a:	6a 00                	push   $0x0
  pushl $66
  10200c:	6a 42                	push   $0x42
  jmp __alltraps
  10200e:	e9 93 fd ff ff       	jmp    101da6 <__alltraps>

00102013 <vector67>:
.globl vector67
vector67:
  pushl $0
  102013:	6a 00                	push   $0x0
  pushl $67
  102015:	6a 43                	push   $0x43
  jmp __alltraps
  102017:	e9 8a fd ff ff       	jmp    101da6 <__alltraps>

0010201c <vector68>:
.globl vector68
vector68:
  pushl $0
  10201c:	6a 00                	push   $0x0
  pushl $68
  10201e:	6a 44                	push   $0x44
  jmp __alltraps
  102020:	e9 81 fd ff ff       	jmp    101da6 <__alltraps>

00102025 <vector69>:
.globl vector69
vector69:
  pushl $0
  102025:	6a 00                	push   $0x0
  pushl $69
  102027:	6a 45                	push   $0x45
  jmp __alltraps
  102029:	e9 78 fd ff ff       	jmp    101da6 <__alltraps>

0010202e <vector70>:
.globl vector70
vector70:
  pushl $0
  10202e:	6a 00                	push   $0x0
  pushl $70
  102030:	6a 46                	push   $0x46
  jmp __alltraps
  102032:	e9 6f fd ff ff       	jmp    101da6 <__alltraps>

00102037 <vector71>:
.globl vector71
vector71:
  pushl $0
  102037:	6a 00                	push   $0x0
  pushl $71
  102039:	6a 47                	push   $0x47
  jmp __alltraps
  10203b:	e9 66 fd ff ff       	jmp    101da6 <__alltraps>

00102040 <vector72>:
.globl vector72
vector72:
  pushl $0
  102040:	6a 00                	push   $0x0
  pushl $72
  102042:	6a 48                	push   $0x48
  jmp __alltraps
  102044:	e9 5d fd ff ff       	jmp    101da6 <__alltraps>

00102049 <vector73>:
.globl vector73
vector73:
  pushl $0
  102049:	6a 00                	push   $0x0
  pushl $73
  10204b:	6a 49                	push   $0x49
  jmp __alltraps
  10204d:	e9 54 fd ff ff       	jmp    101da6 <__alltraps>

00102052 <vector74>:
.globl vector74
vector74:
  pushl $0
  102052:	6a 00                	push   $0x0
  pushl $74
  102054:	6a 4a                	push   $0x4a
  jmp __alltraps
  102056:	e9 4b fd ff ff       	jmp    101da6 <__alltraps>

0010205b <vector75>:
.globl vector75
vector75:
  pushl $0
  10205b:	6a 00                	push   $0x0
  pushl $75
  10205d:	6a 4b                	push   $0x4b
  jmp __alltraps
  10205f:	e9 42 fd ff ff       	jmp    101da6 <__alltraps>

00102064 <vector76>:
.globl vector76
vector76:
  pushl $0
  102064:	6a 00                	push   $0x0
  pushl $76
  102066:	6a 4c                	push   $0x4c
  jmp __alltraps
  102068:	e9 39 fd ff ff       	jmp    101da6 <__alltraps>

0010206d <vector77>:
.globl vector77
vector77:
  pushl $0
  10206d:	6a 00                	push   $0x0
  pushl $77
  10206f:	6a 4d                	push   $0x4d
  jmp __alltraps
  102071:	e9 30 fd ff ff       	jmp    101da6 <__alltraps>

00102076 <vector78>:
.globl vector78
vector78:
  pushl $0
  102076:	6a 00                	push   $0x0
  pushl $78
  102078:	6a 4e                	push   $0x4e
  jmp __alltraps
  10207a:	e9 27 fd ff ff       	jmp    101da6 <__alltraps>

0010207f <vector79>:
.globl vector79
vector79:
  pushl $0
  10207f:	6a 00                	push   $0x0
  pushl $79
  102081:	6a 4f                	push   $0x4f
  jmp __alltraps
  102083:	e9 1e fd ff ff       	jmp    101da6 <__alltraps>

00102088 <vector80>:
.globl vector80
vector80:
  pushl $0
  102088:	6a 00                	push   $0x0
  pushl $80
  10208a:	6a 50                	push   $0x50
  jmp __alltraps
  10208c:	e9 15 fd ff ff       	jmp    101da6 <__alltraps>

00102091 <vector81>:
.globl vector81
vector81:
  pushl $0
  102091:	6a 00                	push   $0x0
  pushl $81
  102093:	6a 51                	push   $0x51
  jmp __alltraps
  102095:	e9 0c fd ff ff       	jmp    101da6 <__alltraps>

0010209a <vector82>:
.globl vector82
vector82:
  pushl $0
  10209a:	6a 00                	push   $0x0
  pushl $82
  10209c:	6a 52                	push   $0x52
  jmp __alltraps
  10209e:	e9 03 fd ff ff       	jmp    101da6 <__alltraps>

001020a3 <vector83>:
.globl vector83
vector83:
  pushl $0
  1020a3:	6a 00                	push   $0x0
  pushl $83
  1020a5:	6a 53                	push   $0x53
  jmp __alltraps
  1020a7:	e9 fa fc ff ff       	jmp    101da6 <__alltraps>

001020ac <vector84>:
.globl vector84
vector84:
  pushl $0
  1020ac:	6a 00                	push   $0x0
  pushl $84
  1020ae:	6a 54                	push   $0x54
  jmp __alltraps
  1020b0:	e9 f1 fc ff ff       	jmp    101da6 <__alltraps>

001020b5 <vector85>:
.globl vector85
vector85:
  pushl $0
  1020b5:	6a 00                	push   $0x0
  pushl $85
  1020b7:	6a 55                	push   $0x55
  jmp __alltraps
  1020b9:	e9 e8 fc ff ff       	jmp    101da6 <__alltraps>

001020be <vector86>:
.globl vector86
vector86:
  pushl $0
  1020be:	6a 00                	push   $0x0
  pushl $86
  1020c0:	6a 56                	push   $0x56
  jmp __alltraps
  1020c2:	e9 df fc ff ff       	jmp    101da6 <__alltraps>

001020c7 <vector87>:
.globl vector87
vector87:
  pushl $0
  1020c7:	6a 00                	push   $0x0
  pushl $87
  1020c9:	6a 57                	push   $0x57
  jmp __alltraps
  1020cb:	e9 d6 fc ff ff       	jmp    101da6 <__alltraps>

001020d0 <vector88>:
.globl vector88
vector88:
  pushl $0
  1020d0:	6a 00                	push   $0x0
  pushl $88
  1020d2:	6a 58                	push   $0x58
  jmp __alltraps
  1020d4:	e9 cd fc ff ff       	jmp    101da6 <__alltraps>

001020d9 <vector89>:
.globl vector89
vector89:
  pushl $0
  1020d9:	6a 00                	push   $0x0
  pushl $89
  1020db:	6a 59                	push   $0x59
  jmp __alltraps
  1020dd:	e9 c4 fc ff ff       	jmp    101da6 <__alltraps>

001020e2 <vector90>:
.globl vector90
vector90:
  pushl $0
  1020e2:	6a 00                	push   $0x0
  pushl $90
  1020e4:	6a 5a                	push   $0x5a
  jmp __alltraps
  1020e6:	e9 bb fc ff ff       	jmp    101da6 <__alltraps>

001020eb <vector91>:
.globl vector91
vector91:
  pushl $0
  1020eb:	6a 00                	push   $0x0
  pushl $91
  1020ed:	6a 5b                	push   $0x5b
  jmp __alltraps
  1020ef:	e9 b2 fc ff ff       	jmp    101da6 <__alltraps>

001020f4 <vector92>:
.globl vector92
vector92:
  pushl $0
  1020f4:	6a 00                	push   $0x0
  pushl $92
  1020f6:	6a 5c                	push   $0x5c
  jmp __alltraps
  1020f8:	e9 a9 fc ff ff       	jmp    101da6 <__alltraps>

001020fd <vector93>:
.globl vector93
vector93:
  pushl $0
  1020fd:	6a 00                	push   $0x0
  pushl $93
  1020ff:	6a 5d                	push   $0x5d
  jmp __alltraps
  102101:	e9 a0 fc ff ff       	jmp    101da6 <__alltraps>

00102106 <vector94>:
.globl vector94
vector94:
  pushl $0
  102106:	6a 00                	push   $0x0
  pushl $94
  102108:	6a 5e                	push   $0x5e
  jmp __alltraps
  10210a:	e9 97 fc ff ff       	jmp    101da6 <__alltraps>

0010210f <vector95>:
.globl vector95
vector95:
  pushl $0
  10210f:	6a 00                	push   $0x0
  pushl $95
  102111:	6a 5f                	push   $0x5f
  jmp __alltraps
  102113:	e9 8e fc ff ff       	jmp    101da6 <__alltraps>

00102118 <vector96>:
.globl vector96
vector96:
  pushl $0
  102118:	6a 00                	push   $0x0
  pushl $96
  10211a:	6a 60                	push   $0x60
  jmp __alltraps
  10211c:	e9 85 fc ff ff       	jmp    101da6 <__alltraps>

00102121 <vector97>:
.globl vector97
vector97:
  pushl $0
  102121:	6a 00                	push   $0x0
  pushl $97
  102123:	6a 61                	push   $0x61
  jmp __alltraps
  102125:	e9 7c fc ff ff       	jmp    101da6 <__alltraps>

0010212a <vector98>:
.globl vector98
vector98:
  pushl $0
  10212a:	6a 00                	push   $0x0
  pushl $98
  10212c:	6a 62                	push   $0x62
  jmp __alltraps
  10212e:	e9 73 fc ff ff       	jmp    101da6 <__alltraps>

00102133 <vector99>:
.globl vector99
vector99:
  pushl $0
  102133:	6a 00                	push   $0x0
  pushl $99
  102135:	6a 63                	push   $0x63
  jmp __alltraps
  102137:	e9 6a fc ff ff       	jmp    101da6 <__alltraps>

0010213c <vector100>:
.globl vector100
vector100:
  pushl $0
  10213c:	6a 00                	push   $0x0
  pushl $100
  10213e:	6a 64                	push   $0x64
  jmp __alltraps
  102140:	e9 61 fc ff ff       	jmp    101da6 <__alltraps>

00102145 <vector101>:
.globl vector101
vector101:
  pushl $0
  102145:	6a 00                	push   $0x0
  pushl $101
  102147:	6a 65                	push   $0x65
  jmp __alltraps
  102149:	e9 58 fc ff ff       	jmp    101da6 <__alltraps>

0010214e <vector102>:
.globl vector102
vector102:
  pushl $0
  10214e:	6a 00                	push   $0x0
  pushl $102
  102150:	6a 66                	push   $0x66
  jmp __alltraps
  102152:	e9 4f fc ff ff       	jmp    101da6 <__alltraps>

00102157 <vector103>:
.globl vector103
vector103:
  pushl $0
  102157:	6a 00                	push   $0x0
  pushl $103
  102159:	6a 67                	push   $0x67
  jmp __alltraps
  10215b:	e9 46 fc ff ff       	jmp    101da6 <__alltraps>

00102160 <vector104>:
.globl vector104
vector104:
  pushl $0
  102160:	6a 00                	push   $0x0
  pushl $104
  102162:	6a 68                	push   $0x68
  jmp __alltraps
  102164:	e9 3d fc ff ff       	jmp    101da6 <__alltraps>

00102169 <vector105>:
.globl vector105
vector105:
  pushl $0
  102169:	6a 00                	push   $0x0
  pushl $105
  10216b:	6a 69                	push   $0x69
  jmp __alltraps
  10216d:	e9 34 fc ff ff       	jmp    101da6 <__alltraps>

00102172 <vector106>:
.globl vector106
vector106:
  pushl $0
  102172:	6a 00                	push   $0x0
  pushl $106
  102174:	6a 6a                	push   $0x6a
  jmp __alltraps
  102176:	e9 2b fc ff ff       	jmp    101da6 <__alltraps>

0010217b <vector107>:
.globl vector107
vector107:
  pushl $0
  10217b:	6a 00                	push   $0x0
  pushl $107
  10217d:	6a 6b                	push   $0x6b
  jmp __alltraps
  10217f:	e9 22 fc ff ff       	jmp    101da6 <__alltraps>

00102184 <vector108>:
.globl vector108
vector108:
  pushl $0
  102184:	6a 00                	push   $0x0
  pushl $108
  102186:	6a 6c                	push   $0x6c
  jmp __alltraps
  102188:	e9 19 fc ff ff       	jmp    101da6 <__alltraps>

0010218d <vector109>:
.globl vector109
vector109:
  pushl $0
  10218d:	6a 00                	push   $0x0
  pushl $109
  10218f:	6a 6d                	push   $0x6d
  jmp __alltraps
  102191:	e9 10 fc ff ff       	jmp    101da6 <__alltraps>

00102196 <vector110>:
.globl vector110
vector110:
  pushl $0
  102196:	6a 00                	push   $0x0
  pushl $110
  102198:	6a 6e                	push   $0x6e
  jmp __alltraps
  10219a:	e9 07 fc ff ff       	jmp    101da6 <__alltraps>

0010219f <vector111>:
.globl vector111
vector111:
  pushl $0
  10219f:	6a 00                	push   $0x0
  pushl $111
  1021a1:	6a 6f                	push   $0x6f
  jmp __alltraps
  1021a3:	e9 fe fb ff ff       	jmp    101da6 <__alltraps>

001021a8 <vector112>:
.globl vector112
vector112:
  pushl $0
  1021a8:	6a 00                	push   $0x0
  pushl $112
  1021aa:	6a 70                	push   $0x70
  jmp __alltraps
  1021ac:	e9 f5 fb ff ff       	jmp    101da6 <__alltraps>

001021b1 <vector113>:
.globl vector113
vector113:
  pushl $0
  1021b1:	6a 00                	push   $0x0
  pushl $113
  1021b3:	6a 71                	push   $0x71
  jmp __alltraps
  1021b5:	e9 ec fb ff ff       	jmp    101da6 <__alltraps>

001021ba <vector114>:
.globl vector114
vector114:
  pushl $0
  1021ba:	6a 00                	push   $0x0
  pushl $114
  1021bc:	6a 72                	push   $0x72
  jmp __alltraps
  1021be:	e9 e3 fb ff ff       	jmp    101da6 <__alltraps>

001021c3 <vector115>:
.globl vector115
vector115:
  pushl $0
  1021c3:	6a 00                	push   $0x0
  pushl $115
  1021c5:	6a 73                	push   $0x73
  jmp __alltraps
  1021c7:	e9 da fb ff ff       	jmp    101da6 <__alltraps>

001021cc <vector116>:
.globl vector116
vector116:
  pushl $0
  1021cc:	6a 00                	push   $0x0
  pushl $116
  1021ce:	6a 74                	push   $0x74
  jmp __alltraps
  1021d0:	e9 d1 fb ff ff       	jmp    101da6 <__alltraps>

001021d5 <vector117>:
.globl vector117
vector117:
  pushl $0
  1021d5:	6a 00                	push   $0x0
  pushl $117
  1021d7:	6a 75                	push   $0x75
  jmp __alltraps
  1021d9:	e9 c8 fb ff ff       	jmp    101da6 <__alltraps>

001021de <vector118>:
.globl vector118
vector118:
  pushl $0
  1021de:	6a 00                	push   $0x0
  pushl $118
  1021e0:	6a 76                	push   $0x76
  jmp __alltraps
  1021e2:	e9 bf fb ff ff       	jmp    101da6 <__alltraps>

001021e7 <vector119>:
.globl vector119
vector119:
  pushl $0
  1021e7:	6a 00                	push   $0x0
  pushl $119
  1021e9:	6a 77                	push   $0x77
  jmp __alltraps
  1021eb:	e9 b6 fb ff ff       	jmp    101da6 <__alltraps>

001021f0 <vector120>:
.globl vector120
vector120:
  pushl $0
  1021f0:	6a 00                	push   $0x0
  pushl $120
  1021f2:	6a 78                	push   $0x78
  jmp __alltraps
  1021f4:	e9 ad fb ff ff       	jmp    101da6 <__alltraps>

001021f9 <vector121>:
.globl vector121
vector121:
  pushl $0
  1021f9:	6a 00                	push   $0x0
  pushl $121
  1021fb:	6a 79                	push   $0x79
  jmp __alltraps
  1021fd:	e9 a4 fb ff ff       	jmp    101da6 <__alltraps>

00102202 <vector122>:
.globl vector122
vector122:
  pushl $0
  102202:	6a 00                	push   $0x0
  pushl $122
  102204:	6a 7a                	push   $0x7a
  jmp __alltraps
  102206:	e9 9b fb ff ff       	jmp    101da6 <__alltraps>

0010220b <vector123>:
.globl vector123
vector123:
  pushl $0
  10220b:	6a 00                	push   $0x0
  pushl $123
  10220d:	6a 7b                	push   $0x7b
  jmp __alltraps
  10220f:	e9 92 fb ff ff       	jmp    101da6 <__alltraps>

00102214 <vector124>:
.globl vector124
vector124:
  pushl $0
  102214:	6a 00                	push   $0x0
  pushl $124
  102216:	6a 7c                	push   $0x7c
  jmp __alltraps
  102218:	e9 89 fb ff ff       	jmp    101da6 <__alltraps>

0010221d <vector125>:
.globl vector125
vector125:
  pushl $0
  10221d:	6a 00                	push   $0x0
  pushl $125
  10221f:	6a 7d                	push   $0x7d
  jmp __alltraps
  102221:	e9 80 fb ff ff       	jmp    101da6 <__alltraps>

00102226 <vector126>:
.globl vector126
vector126:
  pushl $0
  102226:	6a 00                	push   $0x0
  pushl $126
  102228:	6a 7e                	push   $0x7e
  jmp __alltraps
  10222a:	e9 77 fb ff ff       	jmp    101da6 <__alltraps>

0010222f <vector127>:
.globl vector127
vector127:
  pushl $0
  10222f:	6a 00                	push   $0x0
  pushl $127
  102231:	6a 7f                	push   $0x7f
  jmp __alltraps
  102233:	e9 6e fb ff ff       	jmp    101da6 <__alltraps>

00102238 <vector128>:
.globl vector128
vector128:
  pushl $0
  102238:	6a 00                	push   $0x0
  pushl $128
  10223a:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  10223f:	e9 62 fb ff ff       	jmp    101da6 <__alltraps>

00102244 <vector129>:
.globl vector129
vector129:
  pushl $0
  102244:	6a 00                	push   $0x0
  pushl $129
  102246:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  10224b:	e9 56 fb ff ff       	jmp    101da6 <__alltraps>

00102250 <vector130>:
.globl vector130
vector130:
  pushl $0
  102250:	6a 00                	push   $0x0
  pushl $130
  102252:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  102257:	e9 4a fb ff ff       	jmp    101da6 <__alltraps>

0010225c <vector131>:
.globl vector131
vector131:
  pushl $0
  10225c:	6a 00                	push   $0x0
  pushl $131
  10225e:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  102263:	e9 3e fb ff ff       	jmp    101da6 <__alltraps>

00102268 <vector132>:
.globl vector132
vector132:
  pushl $0
  102268:	6a 00                	push   $0x0
  pushl $132
  10226a:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  10226f:	e9 32 fb ff ff       	jmp    101da6 <__alltraps>

00102274 <vector133>:
.globl vector133
vector133:
  pushl $0
  102274:	6a 00                	push   $0x0
  pushl $133
  102276:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  10227b:	e9 26 fb ff ff       	jmp    101da6 <__alltraps>

00102280 <vector134>:
.globl vector134
vector134:
  pushl $0
  102280:	6a 00                	push   $0x0
  pushl $134
  102282:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  102287:	e9 1a fb ff ff       	jmp    101da6 <__alltraps>

0010228c <vector135>:
.globl vector135
vector135:
  pushl $0
  10228c:	6a 00                	push   $0x0
  pushl $135
  10228e:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  102293:	e9 0e fb ff ff       	jmp    101da6 <__alltraps>

00102298 <vector136>:
.globl vector136
vector136:
  pushl $0
  102298:	6a 00                	push   $0x0
  pushl $136
  10229a:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  10229f:	e9 02 fb ff ff       	jmp    101da6 <__alltraps>

001022a4 <vector137>:
.globl vector137
vector137:
  pushl $0
  1022a4:	6a 00                	push   $0x0
  pushl $137
  1022a6:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  1022ab:	e9 f6 fa ff ff       	jmp    101da6 <__alltraps>

001022b0 <vector138>:
.globl vector138
vector138:
  pushl $0
  1022b0:	6a 00                	push   $0x0
  pushl $138
  1022b2:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  1022b7:	e9 ea fa ff ff       	jmp    101da6 <__alltraps>

001022bc <vector139>:
.globl vector139
vector139:
  pushl $0
  1022bc:	6a 00                	push   $0x0
  pushl $139
  1022be:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  1022c3:	e9 de fa ff ff       	jmp    101da6 <__alltraps>

001022c8 <vector140>:
.globl vector140
vector140:
  pushl $0
  1022c8:	6a 00                	push   $0x0
  pushl $140
  1022ca:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  1022cf:	e9 d2 fa ff ff       	jmp    101da6 <__alltraps>

001022d4 <vector141>:
.globl vector141
vector141:
  pushl $0
  1022d4:	6a 00                	push   $0x0
  pushl $141
  1022d6:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  1022db:	e9 c6 fa ff ff       	jmp    101da6 <__alltraps>

001022e0 <vector142>:
.globl vector142
vector142:
  pushl $0
  1022e0:	6a 00                	push   $0x0
  pushl $142
  1022e2:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  1022e7:	e9 ba fa ff ff       	jmp    101da6 <__alltraps>

001022ec <vector143>:
.globl vector143
vector143:
  pushl $0
  1022ec:	6a 00                	push   $0x0
  pushl $143
  1022ee:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  1022f3:	e9 ae fa ff ff       	jmp    101da6 <__alltraps>

001022f8 <vector144>:
.globl vector144
vector144:
  pushl $0
  1022f8:	6a 00                	push   $0x0
  pushl $144
  1022fa:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  1022ff:	e9 a2 fa ff ff       	jmp    101da6 <__alltraps>

00102304 <vector145>:
.globl vector145
vector145:
  pushl $0
  102304:	6a 00                	push   $0x0
  pushl $145
  102306:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  10230b:	e9 96 fa ff ff       	jmp    101da6 <__alltraps>

00102310 <vector146>:
.globl vector146
vector146:
  pushl $0
  102310:	6a 00                	push   $0x0
  pushl $146
  102312:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  102317:	e9 8a fa ff ff       	jmp    101da6 <__alltraps>

0010231c <vector147>:
.globl vector147
vector147:
  pushl $0
  10231c:	6a 00                	push   $0x0
  pushl $147
  10231e:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  102323:	e9 7e fa ff ff       	jmp    101da6 <__alltraps>

00102328 <vector148>:
.globl vector148
vector148:
  pushl $0
  102328:	6a 00                	push   $0x0
  pushl $148
  10232a:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  10232f:	e9 72 fa ff ff       	jmp    101da6 <__alltraps>

00102334 <vector149>:
.globl vector149
vector149:
  pushl $0
  102334:	6a 00                	push   $0x0
  pushl $149
  102336:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  10233b:	e9 66 fa ff ff       	jmp    101da6 <__alltraps>

00102340 <vector150>:
.globl vector150
vector150:
  pushl $0
  102340:	6a 00                	push   $0x0
  pushl $150
  102342:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  102347:	e9 5a fa ff ff       	jmp    101da6 <__alltraps>

0010234c <vector151>:
.globl vector151
vector151:
  pushl $0
  10234c:	6a 00                	push   $0x0
  pushl $151
  10234e:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  102353:	e9 4e fa ff ff       	jmp    101da6 <__alltraps>

00102358 <vector152>:
.globl vector152
vector152:
  pushl $0
  102358:	6a 00                	push   $0x0
  pushl $152
  10235a:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  10235f:	e9 42 fa ff ff       	jmp    101da6 <__alltraps>

00102364 <vector153>:
.globl vector153
vector153:
  pushl $0
  102364:	6a 00                	push   $0x0
  pushl $153
  102366:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  10236b:	e9 36 fa ff ff       	jmp    101da6 <__alltraps>

00102370 <vector154>:
.globl vector154
vector154:
  pushl $0
  102370:	6a 00                	push   $0x0
  pushl $154
  102372:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  102377:	e9 2a fa ff ff       	jmp    101da6 <__alltraps>

0010237c <vector155>:
.globl vector155
vector155:
  pushl $0
  10237c:	6a 00                	push   $0x0
  pushl $155
  10237e:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  102383:	e9 1e fa ff ff       	jmp    101da6 <__alltraps>

00102388 <vector156>:
.globl vector156
vector156:
  pushl $0
  102388:	6a 00                	push   $0x0
  pushl $156
  10238a:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  10238f:	e9 12 fa ff ff       	jmp    101da6 <__alltraps>

00102394 <vector157>:
.globl vector157
vector157:
  pushl $0
  102394:	6a 00                	push   $0x0
  pushl $157
  102396:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  10239b:	e9 06 fa ff ff       	jmp    101da6 <__alltraps>

001023a0 <vector158>:
.globl vector158
vector158:
  pushl $0
  1023a0:	6a 00                	push   $0x0
  pushl $158
  1023a2:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  1023a7:	e9 fa f9 ff ff       	jmp    101da6 <__alltraps>

001023ac <vector159>:
.globl vector159
vector159:
  pushl $0
  1023ac:	6a 00                	push   $0x0
  pushl $159
  1023ae:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  1023b3:	e9 ee f9 ff ff       	jmp    101da6 <__alltraps>

001023b8 <vector160>:
.globl vector160
vector160:
  pushl $0
  1023b8:	6a 00                	push   $0x0
  pushl $160
  1023ba:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  1023bf:	e9 e2 f9 ff ff       	jmp    101da6 <__alltraps>

001023c4 <vector161>:
.globl vector161
vector161:
  pushl $0
  1023c4:	6a 00                	push   $0x0
  pushl $161
  1023c6:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  1023cb:	e9 d6 f9 ff ff       	jmp    101da6 <__alltraps>

001023d0 <vector162>:
.globl vector162
vector162:
  pushl $0
  1023d0:	6a 00                	push   $0x0
  pushl $162
  1023d2:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  1023d7:	e9 ca f9 ff ff       	jmp    101da6 <__alltraps>

001023dc <vector163>:
.globl vector163
vector163:
  pushl $0
  1023dc:	6a 00                	push   $0x0
  pushl $163
  1023de:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1023e3:	e9 be f9 ff ff       	jmp    101da6 <__alltraps>

001023e8 <vector164>:
.globl vector164
vector164:
  pushl $0
  1023e8:	6a 00                	push   $0x0
  pushl $164
  1023ea:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  1023ef:	e9 b2 f9 ff ff       	jmp    101da6 <__alltraps>

001023f4 <vector165>:
.globl vector165
vector165:
  pushl $0
  1023f4:	6a 00                	push   $0x0
  pushl $165
  1023f6:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  1023fb:	e9 a6 f9 ff ff       	jmp    101da6 <__alltraps>

00102400 <vector166>:
.globl vector166
vector166:
  pushl $0
  102400:	6a 00                	push   $0x0
  pushl $166
  102402:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  102407:	e9 9a f9 ff ff       	jmp    101da6 <__alltraps>

0010240c <vector167>:
.globl vector167
vector167:
  pushl $0
  10240c:	6a 00                	push   $0x0
  pushl $167
  10240e:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  102413:	e9 8e f9 ff ff       	jmp    101da6 <__alltraps>

00102418 <vector168>:
.globl vector168
vector168:
  pushl $0
  102418:	6a 00                	push   $0x0
  pushl $168
  10241a:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  10241f:	e9 82 f9 ff ff       	jmp    101da6 <__alltraps>

00102424 <vector169>:
.globl vector169
vector169:
  pushl $0
  102424:	6a 00                	push   $0x0
  pushl $169
  102426:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  10242b:	e9 76 f9 ff ff       	jmp    101da6 <__alltraps>

00102430 <vector170>:
.globl vector170
vector170:
  pushl $0
  102430:	6a 00                	push   $0x0
  pushl $170
  102432:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  102437:	e9 6a f9 ff ff       	jmp    101da6 <__alltraps>

0010243c <vector171>:
.globl vector171
vector171:
  pushl $0
  10243c:	6a 00                	push   $0x0
  pushl $171
  10243e:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  102443:	e9 5e f9 ff ff       	jmp    101da6 <__alltraps>

00102448 <vector172>:
.globl vector172
vector172:
  pushl $0
  102448:	6a 00                	push   $0x0
  pushl $172
  10244a:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  10244f:	e9 52 f9 ff ff       	jmp    101da6 <__alltraps>

00102454 <vector173>:
.globl vector173
vector173:
  pushl $0
  102454:	6a 00                	push   $0x0
  pushl $173
  102456:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  10245b:	e9 46 f9 ff ff       	jmp    101da6 <__alltraps>

00102460 <vector174>:
.globl vector174
vector174:
  pushl $0
  102460:	6a 00                	push   $0x0
  pushl $174
  102462:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  102467:	e9 3a f9 ff ff       	jmp    101da6 <__alltraps>

0010246c <vector175>:
.globl vector175
vector175:
  pushl $0
  10246c:	6a 00                	push   $0x0
  pushl $175
  10246e:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  102473:	e9 2e f9 ff ff       	jmp    101da6 <__alltraps>

00102478 <vector176>:
.globl vector176
vector176:
  pushl $0
  102478:	6a 00                	push   $0x0
  pushl $176
  10247a:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  10247f:	e9 22 f9 ff ff       	jmp    101da6 <__alltraps>

00102484 <vector177>:
.globl vector177
vector177:
  pushl $0
  102484:	6a 00                	push   $0x0
  pushl $177
  102486:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  10248b:	e9 16 f9 ff ff       	jmp    101da6 <__alltraps>

00102490 <vector178>:
.globl vector178
vector178:
  pushl $0
  102490:	6a 00                	push   $0x0
  pushl $178
  102492:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  102497:	e9 0a f9 ff ff       	jmp    101da6 <__alltraps>

0010249c <vector179>:
.globl vector179
vector179:
  pushl $0
  10249c:	6a 00                	push   $0x0
  pushl $179
  10249e:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  1024a3:	e9 fe f8 ff ff       	jmp    101da6 <__alltraps>

001024a8 <vector180>:
.globl vector180
vector180:
  pushl $0
  1024a8:	6a 00                	push   $0x0
  pushl $180
  1024aa:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  1024af:	e9 f2 f8 ff ff       	jmp    101da6 <__alltraps>

001024b4 <vector181>:
.globl vector181
vector181:
  pushl $0
  1024b4:	6a 00                	push   $0x0
  pushl $181
  1024b6:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  1024bb:	e9 e6 f8 ff ff       	jmp    101da6 <__alltraps>

001024c0 <vector182>:
.globl vector182
vector182:
  pushl $0
  1024c0:	6a 00                	push   $0x0
  pushl $182
  1024c2:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  1024c7:	e9 da f8 ff ff       	jmp    101da6 <__alltraps>

001024cc <vector183>:
.globl vector183
vector183:
  pushl $0
  1024cc:	6a 00                	push   $0x0
  pushl $183
  1024ce:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  1024d3:	e9 ce f8 ff ff       	jmp    101da6 <__alltraps>

001024d8 <vector184>:
.globl vector184
vector184:
  pushl $0
  1024d8:	6a 00                	push   $0x0
  pushl $184
  1024da:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  1024df:	e9 c2 f8 ff ff       	jmp    101da6 <__alltraps>

001024e4 <vector185>:
.globl vector185
vector185:
  pushl $0
  1024e4:	6a 00                	push   $0x0
  pushl $185
  1024e6:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  1024eb:	e9 b6 f8 ff ff       	jmp    101da6 <__alltraps>

001024f0 <vector186>:
.globl vector186
vector186:
  pushl $0
  1024f0:	6a 00                	push   $0x0
  pushl $186
  1024f2:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  1024f7:	e9 aa f8 ff ff       	jmp    101da6 <__alltraps>

001024fc <vector187>:
.globl vector187
vector187:
  pushl $0
  1024fc:	6a 00                	push   $0x0
  pushl $187
  1024fe:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  102503:	e9 9e f8 ff ff       	jmp    101da6 <__alltraps>

00102508 <vector188>:
.globl vector188
vector188:
  pushl $0
  102508:	6a 00                	push   $0x0
  pushl $188
  10250a:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  10250f:	e9 92 f8 ff ff       	jmp    101da6 <__alltraps>

00102514 <vector189>:
.globl vector189
vector189:
  pushl $0
  102514:	6a 00                	push   $0x0
  pushl $189
  102516:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  10251b:	e9 86 f8 ff ff       	jmp    101da6 <__alltraps>

00102520 <vector190>:
.globl vector190
vector190:
  pushl $0
  102520:	6a 00                	push   $0x0
  pushl $190
  102522:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  102527:	e9 7a f8 ff ff       	jmp    101da6 <__alltraps>

0010252c <vector191>:
.globl vector191
vector191:
  pushl $0
  10252c:	6a 00                	push   $0x0
  pushl $191
  10252e:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  102533:	e9 6e f8 ff ff       	jmp    101da6 <__alltraps>

00102538 <vector192>:
.globl vector192
vector192:
  pushl $0
  102538:	6a 00                	push   $0x0
  pushl $192
  10253a:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  10253f:	e9 62 f8 ff ff       	jmp    101da6 <__alltraps>

00102544 <vector193>:
.globl vector193
vector193:
  pushl $0
  102544:	6a 00                	push   $0x0
  pushl $193
  102546:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  10254b:	e9 56 f8 ff ff       	jmp    101da6 <__alltraps>

00102550 <vector194>:
.globl vector194
vector194:
  pushl $0
  102550:	6a 00                	push   $0x0
  pushl $194
  102552:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  102557:	e9 4a f8 ff ff       	jmp    101da6 <__alltraps>

0010255c <vector195>:
.globl vector195
vector195:
  pushl $0
  10255c:	6a 00                	push   $0x0
  pushl $195
  10255e:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  102563:	e9 3e f8 ff ff       	jmp    101da6 <__alltraps>

00102568 <vector196>:
.globl vector196
vector196:
  pushl $0
  102568:	6a 00                	push   $0x0
  pushl $196
  10256a:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  10256f:	e9 32 f8 ff ff       	jmp    101da6 <__alltraps>

00102574 <vector197>:
.globl vector197
vector197:
  pushl $0
  102574:	6a 00                	push   $0x0
  pushl $197
  102576:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  10257b:	e9 26 f8 ff ff       	jmp    101da6 <__alltraps>

00102580 <vector198>:
.globl vector198
vector198:
  pushl $0
  102580:	6a 00                	push   $0x0
  pushl $198
  102582:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  102587:	e9 1a f8 ff ff       	jmp    101da6 <__alltraps>

0010258c <vector199>:
.globl vector199
vector199:
  pushl $0
  10258c:	6a 00                	push   $0x0
  pushl $199
  10258e:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  102593:	e9 0e f8 ff ff       	jmp    101da6 <__alltraps>

00102598 <vector200>:
.globl vector200
vector200:
  pushl $0
  102598:	6a 00                	push   $0x0
  pushl $200
  10259a:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  10259f:	e9 02 f8 ff ff       	jmp    101da6 <__alltraps>

001025a4 <vector201>:
.globl vector201
vector201:
  pushl $0
  1025a4:	6a 00                	push   $0x0
  pushl $201
  1025a6:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  1025ab:	e9 f6 f7 ff ff       	jmp    101da6 <__alltraps>

001025b0 <vector202>:
.globl vector202
vector202:
  pushl $0
  1025b0:	6a 00                	push   $0x0
  pushl $202
  1025b2:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  1025b7:	e9 ea f7 ff ff       	jmp    101da6 <__alltraps>

001025bc <vector203>:
.globl vector203
vector203:
  pushl $0
  1025bc:	6a 00                	push   $0x0
  pushl $203
  1025be:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  1025c3:	e9 de f7 ff ff       	jmp    101da6 <__alltraps>

001025c8 <vector204>:
.globl vector204
vector204:
  pushl $0
  1025c8:	6a 00                	push   $0x0
  pushl $204
  1025ca:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  1025cf:	e9 d2 f7 ff ff       	jmp    101da6 <__alltraps>

001025d4 <vector205>:
.globl vector205
vector205:
  pushl $0
  1025d4:	6a 00                	push   $0x0
  pushl $205
  1025d6:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  1025db:	e9 c6 f7 ff ff       	jmp    101da6 <__alltraps>

001025e0 <vector206>:
.globl vector206
vector206:
  pushl $0
  1025e0:	6a 00                	push   $0x0
  pushl $206
  1025e2:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  1025e7:	e9 ba f7 ff ff       	jmp    101da6 <__alltraps>

001025ec <vector207>:
.globl vector207
vector207:
  pushl $0
  1025ec:	6a 00                	push   $0x0
  pushl $207
  1025ee:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  1025f3:	e9 ae f7 ff ff       	jmp    101da6 <__alltraps>

001025f8 <vector208>:
.globl vector208
vector208:
  pushl $0
  1025f8:	6a 00                	push   $0x0
  pushl $208
  1025fa:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  1025ff:	e9 a2 f7 ff ff       	jmp    101da6 <__alltraps>

00102604 <vector209>:
.globl vector209
vector209:
  pushl $0
  102604:	6a 00                	push   $0x0
  pushl $209
  102606:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  10260b:	e9 96 f7 ff ff       	jmp    101da6 <__alltraps>

00102610 <vector210>:
.globl vector210
vector210:
  pushl $0
  102610:	6a 00                	push   $0x0
  pushl $210
  102612:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  102617:	e9 8a f7 ff ff       	jmp    101da6 <__alltraps>

0010261c <vector211>:
.globl vector211
vector211:
  pushl $0
  10261c:	6a 00                	push   $0x0
  pushl $211
  10261e:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  102623:	e9 7e f7 ff ff       	jmp    101da6 <__alltraps>

00102628 <vector212>:
.globl vector212
vector212:
  pushl $0
  102628:	6a 00                	push   $0x0
  pushl $212
  10262a:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  10262f:	e9 72 f7 ff ff       	jmp    101da6 <__alltraps>

00102634 <vector213>:
.globl vector213
vector213:
  pushl $0
  102634:	6a 00                	push   $0x0
  pushl $213
  102636:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  10263b:	e9 66 f7 ff ff       	jmp    101da6 <__alltraps>

00102640 <vector214>:
.globl vector214
vector214:
  pushl $0
  102640:	6a 00                	push   $0x0
  pushl $214
  102642:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  102647:	e9 5a f7 ff ff       	jmp    101da6 <__alltraps>

0010264c <vector215>:
.globl vector215
vector215:
  pushl $0
  10264c:	6a 00                	push   $0x0
  pushl $215
  10264e:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  102653:	e9 4e f7 ff ff       	jmp    101da6 <__alltraps>

00102658 <vector216>:
.globl vector216
vector216:
  pushl $0
  102658:	6a 00                	push   $0x0
  pushl $216
  10265a:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  10265f:	e9 42 f7 ff ff       	jmp    101da6 <__alltraps>

00102664 <vector217>:
.globl vector217
vector217:
  pushl $0
  102664:	6a 00                	push   $0x0
  pushl $217
  102666:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  10266b:	e9 36 f7 ff ff       	jmp    101da6 <__alltraps>

00102670 <vector218>:
.globl vector218
vector218:
  pushl $0
  102670:	6a 00                	push   $0x0
  pushl $218
  102672:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  102677:	e9 2a f7 ff ff       	jmp    101da6 <__alltraps>

0010267c <vector219>:
.globl vector219
vector219:
  pushl $0
  10267c:	6a 00                	push   $0x0
  pushl $219
  10267e:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  102683:	e9 1e f7 ff ff       	jmp    101da6 <__alltraps>

00102688 <vector220>:
.globl vector220
vector220:
  pushl $0
  102688:	6a 00                	push   $0x0
  pushl $220
  10268a:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  10268f:	e9 12 f7 ff ff       	jmp    101da6 <__alltraps>

00102694 <vector221>:
.globl vector221
vector221:
  pushl $0
  102694:	6a 00                	push   $0x0
  pushl $221
  102696:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  10269b:	e9 06 f7 ff ff       	jmp    101da6 <__alltraps>

001026a0 <vector222>:
.globl vector222
vector222:
  pushl $0
  1026a0:	6a 00                	push   $0x0
  pushl $222
  1026a2:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  1026a7:	e9 fa f6 ff ff       	jmp    101da6 <__alltraps>

001026ac <vector223>:
.globl vector223
vector223:
  pushl $0
  1026ac:	6a 00                	push   $0x0
  pushl $223
  1026ae:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  1026b3:	e9 ee f6 ff ff       	jmp    101da6 <__alltraps>

001026b8 <vector224>:
.globl vector224
vector224:
  pushl $0
  1026b8:	6a 00                	push   $0x0
  pushl $224
  1026ba:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  1026bf:	e9 e2 f6 ff ff       	jmp    101da6 <__alltraps>

001026c4 <vector225>:
.globl vector225
vector225:
  pushl $0
  1026c4:	6a 00                	push   $0x0
  pushl $225
  1026c6:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  1026cb:	e9 d6 f6 ff ff       	jmp    101da6 <__alltraps>

001026d0 <vector226>:
.globl vector226
vector226:
  pushl $0
  1026d0:	6a 00                	push   $0x0
  pushl $226
  1026d2:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  1026d7:	e9 ca f6 ff ff       	jmp    101da6 <__alltraps>

001026dc <vector227>:
.globl vector227
vector227:
  pushl $0
  1026dc:	6a 00                	push   $0x0
  pushl $227
  1026de:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  1026e3:	e9 be f6 ff ff       	jmp    101da6 <__alltraps>

001026e8 <vector228>:
.globl vector228
vector228:
  pushl $0
  1026e8:	6a 00                	push   $0x0
  pushl $228
  1026ea:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  1026ef:	e9 b2 f6 ff ff       	jmp    101da6 <__alltraps>

001026f4 <vector229>:
.globl vector229
vector229:
  pushl $0
  1026f4:	6a 00                	push   $0x0
  pushl $229
  1026f6:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  1026fb:	e9 a6 f6 ff ff       	jmp    101da6 <__alltraps>

00102700 <vector230>:
.globl vector230
vector230:
  pushl $0
  102700:	6a 00                	push   $0x0
  pushl $230
  102702:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  102707:	e9 9a f6 ff ff       	jmp    101da6 <__alltraps>

0010270c <vector231>:
.globl vector231
vector231:
  pushl $0
  10270c:	6a 00                	push   $0x0
  pushl $231
  10270e:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  102713:	e9 8e f6 ff ff       	jmp    101da6 <__alltraps>

00102718 <vector232>:
.globl vector232
vector232:
  pushl $0
  102718:	6a 00                	push   $0x0
  pushl $232
  10271a:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  10271f:	e9 82 f6 ff ff       	jmp    101da6 <__alltraps>

00102724 <vector233>:
.globl vector233
vector233:
  pushl $0
  102724:	6a 00                	push   $0x0
  pushl $233
  102726:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  10272b:	e9 76 f6 ff ff       	jmp    101da6 <__alltraps>

00102730 <vector234>:
.globl vector234
vector234:
  pushl $0
  102730:	6a 00                	push   $0x0
  pushl $234
  102732:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  102737:	e9 6a f6 ff ff       	jmp    101da6 <__alltraps>

0010273c <vector235>:
.globl vector235
vector235:
  pushl $0
  10273c:	6a 00                	push   $0x0
  pushl $235
  10273e:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  102743:	e9 5e f6 ff ff       	jmp    101da6 <__alltraps>

00102748 <vector236>:
.globl vector236
vector236:
  pushl $0
  102748:	6a 00                	push   $0x0
  pushl $236
  10274a:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  10274f:	e9 52 f6 ff ff       	jmp    101da6 <__alltraps>

00102754 <vector237>:
.globl vector237
vector237:
  pushl $0
  102754:	6a 00                	push   $0x0
  pushl $237
  102756:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  10275b:	e9 46 f6 ff ff       	jmp    101da6 <__alltraps>

00102760 <vector238>:
.globl vector238
vector238:
  pushl $0
  102760:	6a 00                	push   $0x0
  pushl $238
  102762:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  102767:	e9 3a f6 ff ff       	jmp    101da6 <__alltraps>

0010276c <vector239>:
.globl vector239
vector239:
  pushl $0
  10276c:	6a 00                	push   $0x0
  pushl $239
  10276e:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  102773:	e9 2e f6 ff ff       	jmp    101da6 <__alltraps>

00102778 <vector240>:
.globl vector240
vector240:
  pushl $0
  102778:	6a 00                	push   $0x0
  pushl $240
  10277a:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  10277f:	e9 22 f6 ff ff       	jmp    101da6 <__alltraps>

00102784 <vector241>:
.globl vector241
vector241:
  pushl $0
  102784:	6a 00                	push   $0x0
  pushl $241
  102786:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  10278b:	e9 16 f6 ff ff       	jmp    101da6 <__alltraps>

00102790 <vector242>:
.globl vector242
vector242:
  pushl $0
  102790:	6a 00                	push   $0x0
  pushl $242
  102792:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  102797:	e9 0a f6 ff ff       	jmp    101da6 <__alltraps>

0010279c <vector243>:
.globl vector243
vector243:
  pushl $0
  10279c:	6a 00                	push   $0x0
  pushl $243
  10279e:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  1027a3:	e9 fe f5 ff ff       	jmp    101da6 <__alltraps>

001027a8 <vector244>:
.globl vector244
vector244:
  pushl $0
  1027a8:	6a 00                	push   $0x0
  pushl $244
  1027aa:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  1027af:	e9 f2 f5 ff ff       	jmp    101da6 <__alltraps>

001027b4 <vector245>:
.globl vector245
vector245:
  pushl $0
  1027b4:	6a 00                	push   $0x0
  pushl $245
  1027b6:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  1027bb:	e9 e6 f5 ff ff       	jmp    101da6 <__alltraps>

001027c0 <vector246>:
.globl vector246
vector246:
  pushl $0
  1027c0:	6a 00                	push   $0x0
  pushl $246
  1027c2:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  1027c7:	e9 da f5 ff ff       	jmp    101da6 <__alltraps>

001027cc <vector247>:
.globl vector247
vector247:
  pushl $0
  1027cc:	6a 00                	push   $0x0
  pushl $247
  1027ce:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  1027d3:	e9 ce f5 ff ff       	jmp    101da6 <__alltraps>

001027d8 <vector248>:
.globl vector248
vector248:
  pushl $0
  1027d8:	6a 00                	push   $0x0
  pushl $248
  1027da:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  1027df:	e9 c2 f5 ff ff       	jmp    101da6 <__alltraps>

001027e4 <vector249>:
.globl vector249
vector249:
  pushl $0
  1027e4:	6a 00                	push   $0x0
  pushl $249
  1027e6:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  1027eb:	e9 b6 f5 ff ff       	jmp    101da6 <__alltraps>

001027f0 <vector250>:
.globl vector250
vector250:
  pushl $0
  1027f0:	6a 00                	push   $0x0
  pushl $250
  1027f2:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  1027f7:	e9 aa f5 ff ff       	jmp    101da6 <__alltraps>

001027fc <vector251>:
.globl vector251
vector251:
  pushl $0
  1027fc:	6a 00                	push   $0x0
  pushl $251
  1027fe:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  102803:	e9 9e f5 ff ff       	jmp    101da6 <__alltraps>

00102808 <vector252>:
.globl vector252
vector252:
  pushl $0
  102808:	6a 00                	push   $0x0
  pushl $252
  10280a:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  10280f:	e9 92 f5 ff ff       	jmp    101da6 <__alltraps>

00102814 <vector253>:
.globl vector253
vector253:
  pushl $0
  102814:	6a 00                	push   $0x0
  pushl $253
  102816:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  10281b:	e9 86 f5 ff ff       	jmp    101da6 <__alltraps>

00102820 <vector254>:
.globl vector254
vector254:
  pushl $0
  102820:	6a 00                	push   $0x0
  pushl $254
  102822:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  102827:	e9 7a f5 ff ff       	jmp    101da6 <__alltraps>

0010282c <vector255>:
.globl vector255
vector255:
  pushl $0
  10282c:	6a 00                	push   $0x0
  pushl $255
  10282e:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102833:	e9 6e f5 ff ff       	jmp    101da6 <__alltraps>

00102838 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  102838:	55                   	push   %ebp
  102839:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  10283b:	8b 45 08             	mov    0x8(%ebp),%eax
  10283e:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102841:	b8 23 00 00 00       	mov    $0x23,%eax
  102846:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  102848:	b8 23 00 00 00       	mov    $0x23,%eax
  10284d:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  10284f:	b8 10 00 00 00       	mov    $0x10,%eax
  102854:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  102856:	b8 10 00 00 00       	mov    $0x10,%eax
  10285b:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  10285d:	b8 10 00 00 00       	mov    $0x10,%eax
  102862:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102864:	ea 6b 28 10 00 08 00 	ljmp   $0x8,$0x10286b
}
  10286b:	5d                   	pop    %ebp
  10286c:	c3                   	ret    

0010286d <gdt_init>:
/* temporary kernel stack 临时内核栈*/
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  10286d:	55                   	push   %ebp
  10286e:	89 e5                	mov    %esp,%ebp
  102870:	83 ec 10             	sub    $0x10,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    //设置一个TSS可以使我们得到正确的堆栈，当我们从用户到kernel的中断。
    //但这里不安全，这只是一个暂时的值，它在lab2将被设置为 KSTACKTOP。
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102873:	b8 80 f9 10 00       	mov    $0x10f980,%eax
  102878:	05 00 04 00 00       	add    $0x400,%eax
  10287d:	a3 a4 f8 10 00       	mov    %eax,0x10f8a4
    ts.ts_ss0 = KERNEL_DS;
  102882:	66 c7 05 a8 f8 10 00 	movw   $0x10,0x10f8a8
  102889:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  10288b:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  102892:	68 00 
  102894:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102899:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  10289f:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  1028a4:	c1 e8 10             	shr    $0x10,%eax
  1028a7:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  1028ac:	a0 0d ea 10 00       	mov    0x10ea0d,%al
  1028b1:	83 e0 f0             	and    $0xfffffff0,%eax
  1028b4:	83 c8 09             	or     $0x9,%eax
  1028b7:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1028bc:	a0 0d ea 10 00       	mov    0x10ea0d,%al
  1028c1:	83 c8 10             	or     $0x10,%eax
  1028c4:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1028c9:	a0 0d ea 10 00       	mov    0x10ea0d,%al
  1028ce:	83 e0 9f             	and    $0xffffff9f,%eax
  1028d1:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1028d6:	a0 0d ea 10 00       	mov    0x10ea0d,%al
  1028db:	83 c8 80             	or     $0xffffff80,%eax
  1028de:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1028e3:	a0 0e ea 10 00       	mov    0x10ea0e,%al
  1028e8:	83 e0 f0             	and    $0xfffffff0,%eax
  1028eb:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1028f0:	a0 0e ea 10 00       	mov    0x10ea0e,%al
  1028f5:	83 e0 ef             	and    $0xffffffef,%eax
  1028f8:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1028fd:	a0 0e ea 10 00       	mov    0x10ea0e,%al
  102902:	83 e0 df             	and    $0xffffffdf,%eax
  102905:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  10290a:	a0 0e ea 10 00       	mov    0x10ea0e,%al
  10290f:	83 c8 40             	or     $0x40,%eax
  102912:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102917:	a0 0e ea 10 00       	mov    0x10ea0e,%al
  10291c:	83 e0 7f             	and    $0x7f,%eax
  10291f:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102924:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102929:	c1 e8 18             	shr    $0x18,%eax
  10292c:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  102931:	a0 0d ea 10 00       	mov    0x10ea0d,%al
  102936:	83 e0 ef             	and    $0xffffffef,%eax
  102939:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  10293e:	68 10 ea 10 00       	push   $0x10ea10
  102943:	e8 f0 fe ff ff       	call   102838 <lgdt>
  102948:	83 c4 04             	add    $0x4,%esp
  10294b:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
    asm volatile ("cli");
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102951:	66 8b 45 fe          	mov    -0x2(%ebp),%ax
  102955:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  102958:	c9                   	leave  
  102959:	c3                   	ret    

0010295a <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  10295a:	55                   	push   %ebp
  10295b:	89 e5                	mov    %esp,%ebp
    gdt_init();
  10295d:	e8 0b ff ff ff       	call   10286d <gdt_init>
}
  102962:	5d                   	pop    %ebp
  102963:	c3                   	ret    

00102964 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102964:	55                   	push   %ebp
  102965:	89 e5                	mov    %esp,%ebp
  102967:	83 ec 38             	sub    $0x38,%esp
  10296a:	8b 45 10             	mov    0x10(%ebp),%eax
  10296d:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102970:	8b 45 14             	mov    0x14(%ebp),%eax
  102973:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102976:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102979:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10297c:	89 45 e8             	mov    %eax,-0x18(%ebp)
  10297f:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102982:	8b 45 18             	mov    0x18(%ebp),%eax
  102985:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102988:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10298b:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10298e:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102991:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102994:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102997:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10299a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10299e:	74 1c                	je     1029bc <printnum+0x58>
  1029a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1029a3:	ba 00 00 00 00       	mov    $0x0,%edx
  1029a8:	f7 75 e4             	divl   -0x1c(%ebp)
  1029ab:	89 55 f4             	mov    %edx,-0xc(%ebp)
  1029ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1029b1:	ba 00 00 00 00       	mov    $0x0,%edx
  1029b6:	f7 75 e4             	divl   -0x1c(%ebp)
  1029b9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1029bc:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1029bf:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1029c2:	f7 75 e4             	divl   -0x1c(%ebp)
  1029c5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1029c8:	89 55 dc             	mov    %edx,-0x24(%ebp)
  1029cb:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1029ce:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1029d1:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1029d4:	89 55 ec             	mov    %edx,-0x14(%ebp)
  1029d7:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1029da:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  1029dd:	8b 45 18             	mov    0x18(%ebp),%eax
  1029e0:	ba 00 00 00 00       	mov    $0x0,%edx
  1029e5:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  1029e8:	77 3f                	ja     102a29 <printnum+0xc5>
  1029ea:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  1029ed:	72 05                	jb     1029f4 <printnum+0x90>
  1029ef:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  1029f2:	77 35                	ja     102a29 <printnum+0xc5>
        printnum(putch, putdat, result, base, width - 1, padc);
  1029f4:	8b 45 1c             	mov    0x1c(%ebp),%eax
  1029f7:	48                   	dec    %eax
  1029f8:	83 ec 04             	sub    $0x4,%esp
  1029fb:	ff 75 20             	pushl  0x20(%ebp)
  1029fe:	50                   	push   %eax
  1029ff:	ff 75 18             	pushl  0x18(%ebp)
  102a02:	ff 75 ec             	pushl  -0x14(%ebp)
  102a05:	ff 75 e8             	pushl  -0x18(%ebp)
  102a08:	ff 75 0c             	pushl  0xc(%ebp)
  102a0b:	ff 75 08             	pushl  0x8(%ebp)
  102a0e:	e8 51 ff ff ff       	call   102964 <printnum>
  102a13:	83 c4 20             	add    $0x20,%esp
  102a16:	eb 1a                	jmp    102a32 <printnum+0xce>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102a18:	83 ec 08             	sub    $0x8,%esp
  102a1b:	ff 75 0c             	pushl  0xc(%ebp)
  102a1e:	ff 75 20             	pushl  0x20(%ebp)
  102a21:	8b 45 08             	mov    0x8(%ebp),%eax
  102a24:	ff d0                	call   *%eax
  102a26:	83 c4 10             	add    $0x10,%esp
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
  102a29:	ff 4d 1c             	decl   0x1c(%ebp)
  102a2c:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102a30:	7f e6                	jg     102a18 <printnum+0xb4>
            putch(padc, putdat);
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  102a32:	8b 45 d8             	mov    -0x28(%ebp),%eax
  102a35:	05 70 3b 10 00       	add    $0x103b70,%eax
  102a3a:	8a 00                	mov    (%eax),%al
  102a3c:	0f be c0             	movsbl %al,%eax
  102a3f:	83 ec 08             	sub    $0x8,%esp
  102a42:	ff 75 0c             	pushl  0xc(%ebp)
  102a45:	50                   	push   %eax
  102a46:	8b 45 08             	mov    0x8(%ebp),%eax
  102a49:	ff d0                	call   *%eax
  102a4b:	83 c4 10             	add    $0x10,%esp
}
  102a4e:	c9                   	leave  
  102a4f:	c3                   	ret    

00102a50 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  102a50:	55                   	push   %ebp
  102a51:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102a53:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102a57:	7e 14                	jle    102a6d <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  102a59:	8b 45 08             	mov    0x8(%ebp),%eax
  102a5c:	8b 00                	mov    (%eax),%eax
  102a5e:	8d 48 08             	lea    0x8(%eax),%ecx
  102a61:	8b 55 08             	mov    0x8(%ebp),%edx
  102a64:	89 0a                	mov    %ecx,(%edx)
  102a66:	8b 50 04             	mov    0x4(%eax),%edx
  102a69:	8b 00                	mov    (%eax),%eax
  102a6b:	eb 30                	jmp    102a9d <getuint+0x4d>
    }
    else if (lflag) {
  102a6d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102a71:	74 16                	je     102a89 <getuint+0x39>
        return va_arg(*ap, unsigned long);
  102a73:	8b 45 08             	mov    0x8(%ebp),%eax
  102a76:	8b 00                	mov    (%eax),%eax
  102a78:	8d 48 04             	lea    0x4(%eax),%ecx
  102a7b:	8b 55 08             	mov    0x8(%ebp),%edx
  102a7e:	89 0a                	mov    %ecx,(%edx)
  102a80:	8b 00                	mov    (%eax),%eax
  102a82:	ba 00 00 00 00       	mov    $0x0,%edx
  102a87:	eb 14                	jmp    102a9d <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  102a89:	8b 45 08             	mov    0x8(%ebp),%eax
  102a8c:	8b 00                	mov    (%eax),%eax
  102a8e:	8d 48 04             	lea    0x4(%eax),%ecx
  102a91:	8b 55 08             	mov    0x8(%ebp),%edx
  102a94:	89 0a                	mov    %ecx,(%edx)
  102a96:	8b 00                	mov    (%eax),%eax
  102a98:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102a9d:	5d                   	pop    %ebp
  102a9e:	c3                   	ret    

00102a9f <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102a9f:	55                   	push   %ebp
  102aa0:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102aa2:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102aa6:	7e 14                	jle    102abc <getint+0x1d>
        return va_arg(*ap, long long);
  102aa8:	8b 45 08             	mov    0x8(%ebp),%eax
  102aab:	8b 00                	mov    (%eax),%eax
  102aad:	8d 48 08             	lea    0x8(%eax),%ecx
  102ab0:	8b 55 08             	mov    0x8(%ebp),%edx
  102ab3:	89 0a                	mov    %ecx,(%edx)
  102ab5:	8b 50 04             	mov    0x4(%eax),%edx
  102ab8:	8b 00                	mov    (%eax),%eax
  102aba:	eb 28                	jmp    102ae4 <getint+0x45>
    }
    else if (lflag) {
  102abc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102ac0:	74 12                	je     102ad4 <getint+0x35>
        return va_arg(*ap, long);
  102ac2:	8b 45 08             	mov    0x8(%ebp),%eax
  102ac5:	8b 00                	mov    (%eax),%eax
  102ac7:	8d 48 04             	lea    0x4(%eax),%ecx
  102aca:	8b 55 08             	mov    0x8(%ebp),%edx
  102acd:	89 0a                	mov    %ecx,(%edx)
  102acf:	8b 00                	mov    (%eax),%eax
  102ad1:	99                   	cltd   
  102ad2:	eb 10                	jmp    102ae4 <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  102ad4:	8b 45 08             	mov    0x8(%ebp),%eax
  102ad7:	8b 00                	mov    (%eax),%eax
  102ad9:	8d 48 04             	lea    0x4(%eax),%ecx
  102adc:	8b 55 08             	mov    0x8(%ebp),%edx
  102adf:	89 0a                	mov    %ecx,(%edx)
  102ae1:	8b 00                	mov    (%eax),%eax
  102ae3:	99                   	cltd   
    }
}
  102ae4:	5d                   	pop    %ebp
  102ae5:	c3                   	ret    

00102ae6 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102ae6:	55                   	push   %ebp
  102ae7:	89 e5                	mov    %esp,%ebp
  102ae9:	83 ec 18             	sub    $0x18,%esp
    va_list ap;

    va_start(ap, fmt);
  102aec:	8d 45 14             	lea    0x14(%ebp),%eax
  102aef:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  102af2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102af5:	50                   	push   %eax
  102af6:	ff 75 10             	pushl  0x10(%ebp)
  102af9:	ff 75 0c             	pushl  0xc(%ebp)
  102afc:	ff 75 08             	pushl  0x8(%ebp)
  102aff:	e8 05 00 00 00       	call   102b09 <vprintfmt>
  102b04:	83 c4 10             	add    $0x10,%esp
    va_end(ap);
}
  102b07:	c9                   	leave  
  102b08:	c3                   	ret    

00102b09 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102b09:	55                   	push   %ebp
  102b0a:	89 e5                	mov    %esp,%ebp
  102b0c:	56                   	push   %esi
  102b0d:	53                   	push   %ebx
  102b0e:	83 ec 20             	sub    $0x20,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102b11:	eb 18                	jmp    102b2b <vprintfmt+0x22>
            if (ch == '\0') {
  102b13:	85 db                	test   %ebx,%ebx
  102b15:	75 05                	jne    102b1c <vprintfmt+0x13>
                return;
  102b17:	e9 7c 03 00 00       	jmp    102e98 <vprintfmt+0x38f>
            }
            putch(ch, putdat);
  102b1c:	83 ec 08             	sub    $0x8,%esp
  102b1f:	ff 75 0c             	pushl  0xc(%ebp)
  102b22:	53                   	push   %ebx
  102b23:	8b 45 08             	mov    0x8(%ebp),%eax
  102b26:	ff d0                	call   *%eax
  102b28:	83 c4 10             	add    $0x10,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102b2b:	8b 45 10             	mov    0x10(%ebp),%eax
  102b2e:	8d 50 01             	lea    0x1(%eax),%edx
  102b31:	89 55 10             	mov    %edx,0x10(%ebp)
  102b34:	8a 00                	mov    (%eax),%al
  102b36:	0f b6 d8             	movzbl %al,%ebx
  102b39:	83 fb 25             	cmp    $0x25,%ebx
  102b3c:	75 d5                	jne    102b13 <vprintfmt+0xa>
            }
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
  102b3e:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  102b42:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102b49:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102b4c:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  102b4f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  102b56:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102b59:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102b5c:	8b 45 10             	mov    0x10(%ebp),%eax
  102b5f:	8d 50 01             	lea    0x1(%eax),%edx
  102b62:	89 55 10             	mov    %edx,0x10(%ebp)
  102b65:	8a 00                	mov    (%eax),%al
  102b67:	0f b6 d8             	movzbl %al,%ebx
  102b6a:	8d 43 dd             	lea    -0x23(%ebx),%eax
  102b6d:	83 f8 55             	cmp    $0x55,%eax
  102b70:	0f 87 fa 02 00 00    	ja     102e70 <vprintfmt+0x367>
  102b76:	8b 04 85 94 3b 10 00 	mov    0x103b94(,%eax,4),%eax
  102b7d:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  102b7f:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  102b83:	eb d7                	jmp    102b5c <vprintfmt+0x53>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  102b85:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  102b89:	eb d1                	jmp    102b5c <vprintfmt+0x53>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102b8b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  102b92:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102b95:	89 d0                	mov    %edx,%eax
  102b97:	c1 e0 02             	shl    $0x2,%eax
  102b9a:	01 d0                	add    %edx,%eax
  102b9c:	01 c0                	add    %eax,%eax
  102b9e:	01 d8                	add    %ebx,%eax
  102ba0:	83 e8 30             	sub    $0x30,%eax
  102ba3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  102ba6:	8b 45 10             	mov    0x10(%ebp),%eax
  102ba9:	8a 00                	mov    (%eax),%al
  102bab:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  102bae:	83 fb 2f             	cmp    $0x2f,%ebx
  102bb1:	7e 0a                	jle    102bbd <vprintfmt+0xb4>
  102bb3:	83 fb 39             	cmp    $0x39,%ebx
  102bb6:	7f 05                	jg     102bbd <vprintfmt+0xb4>
            padc = '0';
            goto reswitch;

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102bb8:	ff 45 10             	incl   0x10(%ebp)
                precision = precision * 10 + ch - '0';
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
  102bbb:	eb d5                	jmp    102b92 <vprintfmt+0x89>
            goto process_precision;
  102bbd:	eb 2e                	jmp    102bed <vprintfmt+0xe4>

        case '*':
            precision = va_arg(ap, int);
  102bbf:	8b 45 14             	mov    0x14(%ebp),%eax
  102bc2:	8d 50 04             	lea    0x4(%eax),%edx
  102bc5:	89 55 14             	mov    %edx,0x14(%ebp)
  102bc8:	8b 00                	mov    (%eax),%eax
  102bca:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  102bcd:	eb 1e                	jmp    102bed <vprintfmt+0xe4>

        case '.':
            if (width < 0)
  102bcf:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102bd3:	79 07                	jns    102bdc <vprintfmt+0xd3>
                width = 0;
  102bd5:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  102bdc:	e9 7b ff ff ff       	jmp    102b5c <vprintfmt+0x53>

        case '#':
            altflag = 1;
  102be1:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  102be8:	e9 6f ff ff ff       	jmp    102b5c <vprintfmt+0x53>

        process_precision:
            if (width < 0)
  102bed:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102bf1:	79 0d                	jns    102c00 <vprintfmt+0xf7>
                width = precision, precision = -1;
  102bf3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102bf6:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102bf9:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  102c00:	e9 57 ff ff ff       	jmp    102b5c <vprintfmt+0x53>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  102c05:	ff 45 e0             	incl   -0x20(%ebp)
            goto reswitch;
  102c08:	e9 4f ff ff ff       	jmp    102b5c <vprintfmt+0x53>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  102c0d:	8b 45 14             	mov    0x14(%ebp),%eax
  102c10:	8d 50 04             	lea    0x4(%eax),%edx
  102c13:	89 55 14             	mov    %edx,0x14(%ebp)
  102c16:	8b 00                	mov    (%eax),%eax
  102c18:	83 ec 08             	sub    $0x8,%esp
  102c1b:	ff 75 0c             	pushl  0xc(%ebp)
  102c1e:	50                   	push   %eax
  102c1f:	8b 45 08             	mov    0x8(%ebp),%eax
  102c22:	ff d0                	call   *%eax
  102c24:	83 c4 10             	add    $0x10,%esp
            break;
  102c27:	e9 67 02 00 00       	jmp    102e93 <vprintfmt+0x38a>

        // error message
        case 'e':
            err = va_arg(ap, int);
  102c2c:	8b 45 14             	mov    0x14(%ebp),%eax
  102c2f:	8d 50 04             	lea    0x4(%eax),%edx
  102c32:	89 55 14             	mov    %edx,0x14(%ebp)
  102c35:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  102c37:	85 db                	test   %ebx,%ebx
  102c39:	79 02                	jns    102c3d <vprintfmt+0x134>
                err = -err;
  102c3b:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  102c3d:	83 fb 06             	cmp    $0x6,%ebx
  102c40:	7f 0b                	jg     102c4d <vprintfmt+0x144>
  102c42:	8b 34 9d 54 3b 10 00 	mov    0x103b54(,%ebx,4),%esi
  102c49:	85 f6                	test   %esi,%esi
  102c4b:	75 19                	jne    102c66 <vprintfmt+0x15d>
                printfmt(putch, putdat, "error %d", err);
  102c4d:	53                   	push   %ebx
  102c4e:	68 81 3b 10 00       	push   $0x103b81
  102c53:	ff 75 0c             	pushl  0xc(%ebp)
  102c56:	ff 75 08             	pushl  0x8(%ebp)
  102c59:	e8 88 fe ff ff       	call   102ae6 <printfmt>
  102c5e:	83 c4 10             	add    $0x10,%esp
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  102c61:	e9 2d 02 00 00       	jmp    102e93 <vprintfmt+0x38a>
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
                printfmt(putch, putdat, "error %d", err);
            }
            else {
                printfmt(putch, putdat, "%s", p);
  102c66:	56                   	push   %esi
  102c67:	68 8a 3b 10 00       	push   $0x103b8a
  102c6c:	ff 75 0c             	pushl  0xc(%ebp)
  102c6f:	ff 75 08             	pushl  0x8(%ebp)
  102c72:	e8 6f fe ff ff       	call   102ae6 <printfmt>
  102c77:	83 c4 10             	add    $0x10,%esp
            }
            break;
  102c7a:	e9 14 02 00 00       	jmp    102e93 <vprintfmt+0x38a>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  102c7f:	8b 45 14             	mov    0x14(%ebp),%eax
  102c82:	8d 50 04             	lea    0x4(%eax),%edx
  102c85:	89 55 14             	mov    %edx,0x14(%ebp)
  102c88:	8b 30                	mov    (%eax),%esi
  102c8a:	85 f6                	test   %esi,%esi
  102c8c:	75 05                	jne    102c93 <vprintfmt+0x18a>
                p = "(null)";
  102c8e:	be 8d 3b 10 00       	mov    $0x103b8d,%esi
            }
            if (width > 0 && padc != '-') {
  102c93:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102c97:	7e 3e                	jle    102cd7 <vprintfmt+0x1ce>
  102c99:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  102c9d:	74 38                	je     102cd7 <vprintfmt+0x1ce>
                for (width -= strnlen(p, precision); width > 0; width --) {
  102c9f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102ca2:	83 ec 08             	sub    $0x8,%esp
  102ca5:	50                   	push   %eax
  102ca6:	56                   	push   %esi
  102ca7:	e8 d1 02 00 00       	call   102f7d <strnlen>
  102cac:	83 c4 10             	add    $0x10,%esp
  102caf:	8b 55 e8             	mov    -0x18(%ebp),%edx
  102cb2:	29 c2                	sub    %eax,%edx
  102cb4:	89 d0                	mov    %edx,%eax
  102cb6:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102cb9:	eb 16                	jmp    102cd1 <vprintfmt+0x1c8>
                    putch(padc, putdat);
  102cbb:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  102cbf:	83 ec 08             	sub    $0x8,%esp
  102cc2:	ff 75 0c             	pushl  0xc(%ebp)
  102cc5:	50                   	push   %eax
  102cc6:	8b 45 08             	mov    0x8(%ebp),%eax
  102cc9:	ff d0                	call   *%eax
  102ccb:	83 c4 10             	add    $0x10,%esp
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
                p = "(null)";
            }
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
  102cce:	ff 4d e8             	decl   -0x18(%ebp)
  102cd1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102cd5:	7f e4                	jg     102cbb <vprintfmt+0x1b2>
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102cd7:	eb 34                	jmp    102d0d <vprintfmt+0x204>
                if (altflag && (ch < ' ' || ch > '~')) {
  102cd9:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  102cdd:	74 1c                	je     102cfb <vprintfmt+0x1f2>
  102cdf:	83 fb 1f             	cmp    $0x1f,%ebx
  102ce2:	7e 05                	jle    102ce9 <vprintfmt+0x1e0>
  102ce4:	83 fb 7e             	cmp    $0x7e,%ebx
  102ce7:	7e 12                	jle    102cfb <vprintfmt+0x1f2>
                    putch('?', putdat);
  102ce9:	83 ec 08             	sub    $0x8,%esp
  102cec:	ff 75 0c             	pushl  0xc(%ebp)
  102cef:	6a 3f                	push   $0x3f
  102cf1:	8b 45 08             	mov    0x8(%ebp),%eax
  102cf4:	ff d0                	call   *%eax
  102cf6:	83 c4 10             	add    $0x10,%esp
  102cf9:	eb 0f                	jmp    102d0a <vprintfmt+0x201>
                }
                else {
                    putch(ch, putdat);
  102cfb:	83 ec 08             	sub    $0x8,%esp
  102cfe:	ff 75 0c             	pushl  0xc(%ebp)
  102d01:	53                   	push   %ebx
  102d02:	8b 45 08             	mov    0x8(%ebp),%eax
  102d05:	ff d0                	call   *%eax
  102d07:	83 c4 10             	add    $0x10,%esp
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102d0a:	ff 4d e8             	decl   -0x18(%ebp)
  102d0d:	89 f0                	mov    %esi,%eax
  102d0f:	8d 70 01             	lea    0x1(%eax),%esi
  102d12:	8a 00                	mov    (%eax),%al
  102d14:	0f be d8             	movsbl %al,%ebx
  102d17:	85 db                	test   %ebx,%ebx
  102d19:	74 0f                	je     102d2a <vprintfmt+0x221>
  102d1b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102d1f:	78 b8                	js     102cd9 <vprintfmt+0x1d0>
  102d21:	ff 4d e4             	decl   -0x1c(%ebp)
  102d24:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102d28:	79 af                	jns    102cd9 <vprintfmt+0x1d0>
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102d2a:	eb 13                	jmp    102d3f <vprintfmt+0x236>
                putch(' ', putdat);
  102d2c:	83 ec 08             	sub    $0x8,%esp
  102d2f:	ff 75 0c             	pushl  0xc(%ebp)
  102d32:	6a 20                	push   $0x20
  102d34:	8b 45 08             	mov    0x8(%ebp),%eax
  102d37:	ff d0                	call   *%eax
  102d39:	83 c4 10             	add    $0x10,%esp
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102d3c:	ff 4d e8             	decl   -0x18(%ebp)
  102d3f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102d43:	7f e7                	jg     102d2c <vprintfmt+0x223>
                putch(' ', putdat);
            }
            break;
  102d45:	e9 49 01 00 00       	jmp    102e93 <vprintfmt+0x38a>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  102d4a:	83 ec 08             	sub    $0x8,%esp
  102d4d:	ff 75 e0             	pushl  -0x20(%ebp)
  102d50:	8d 45 14             	lea    0x14(%ebp),%eax
  102d53:	50                   	push   %eax
  102d54:	e8 46 fd ff ff       	call   102a9f <getint>
  102d59:	83 c4 10             	add    $0x10,%esp
  102d5c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102d5f:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  102d62:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d65:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102d68:	85 d2                	test   %edx,%edx
  102d6a:	79 23                	jns    102d8f <vprintfmt+0x286>
                putch('-', putdat);
  102d6c:	83 ec 08             	sub    $0x8,%esp
  102d6f:	ff 75 0c             	pushl  0xc(%ebp)
  102d72:	6a 2d                	push   $0x2d
  102d74:	8b 45 08             	mov    0x8(%ebp),%eax
  102d77:	ff d0                	call   *%eax
  102d79:	83 c4 10             	add    $0x10,%esp
                num = -(long long)num;
  102d7c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d7f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102d82:	f7 d8                	neg    %eax
  102d84:	83 d2 00             	adc    $0x0,%edx
  102d87:	f7 da                	neg    %edx
  102d89:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102d8c:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  102d8f:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102d96:	e9 9f 00 00 00       	jmp    102e3a <vprintfmt+0x331>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  102d9b:	83 ec 08             	sub    $0x8,%esp
  102d9e:	ff 75 e0             	pushl  -0x20(%ebp)
  102da1:	8d 45 14             	lea    0x14(%ebp),%eax
  102da4:	50                   	push   %eax
  102da5:	e8 a6 fc ff ff       	call   102a50 <getuint>
  102daa:	83 c4 10             	add    $0x10,%esp
  102dad:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102db0:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  102db3:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102dba:	eb 7e                	jmp    102e3a <vprintfmt+0x331>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  102dbc:	83 ec 08             	sub    $0x8,%esp
  102dbf:	ff 75 e0             	pushl  -0x20(%ebp)
  102dc2:	8d 45 14             	lea    0x14(%ebp),%eax
  102dc5:	50                   	push   %eax
  102dc6:	e8 85 fc ff ff       	call   102a50 <getuint>
  102dcb:	83 c4 10             	add    $0x10,%esp
  102dce:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102dd1:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  102dd4:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  102ddb:	eb 5d                	jmp    102e3a <vprintfmt+0x331>

        // pointer
        case 'p':
            putch('0', putdat);
  102ddd:	83 ec 08             	sub    $0x8,%esp
  102de0:	ff 75 0c             	pushl  0xc(%ebp)
  102de3:	6a 30                	push   $0x30
  102de5:	8b 45 08             	mov    0x8(%ebp),%eax
  102de8:	ff d0                	call   *%eax
  102dea:	83 c4 10             	add    $0x10,%esp
            putch('x', putdat);
  102ded:	83 ec 08             	sub    $0x8,%esp
  102df0:	ff 75 0c             	pushl  0xc(%ebp)
  102df3:	6a 78                	push   $0x78
  102df5:	8b 45 08             	mov    0x8(%ebp),%eax
  102df8:	ff d0                	call   *%eax
  102dfa:	83 c4 10             	add    $0x10,%esp
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  102dfd:	8b 45 14             	mov    0x14(%ebp),%eax
  102e00:	8d 50 04             	lea    0x4(%eax),%edx
  102e03:	89 55 14             	mov    %edx,0x14(%ebp)
  102e06:	8b 00                	mov    (%eax),%eax
  102e08:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e0b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  102e12:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  102e19:	eb 1f                	jmp    102e3a <vprintfmt+0x331>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  102e1b:	83 ec 08             	sub    $0x8,%esp
  102e1e:	ff 75 e0             	pushl  -0x20(%ebp)
  102e21:	8d 45 14             	lea    0x14(%ebp),%eax
  102e24:	50                   	push   %eax
  102e25:	e8 26 fc ff ff       	call   102a50 <getuint>
  102e2a:	83 c4 10             	add    $0x10,%esp
  102e2d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e30:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  102e33:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  102e3a:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  102e3e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e41:	83 ec 04             	sub    $0x4,%esp
  102e44:	52                   	push   %edx
  102e45:	ff 75 e8             	pushl  -0x18(%ebp)
  102e48:	50                   	push   %eax
  102e49:	ff 75 f4             	pushl  -0xc(%ebp)
  102e4c:	ff 75 f0             	pushl  -0x10(%ebp)
  102e4f:	ff 75 0c             	pushl  0xc(%ebp)
  102e52:	ff 75 08             	pushl  0x8(%ebp)
  102e55:	e8 0a fb ff ff       	call   102964 <printnum>
  102e5a:	83 c4 20             	add    $0x20,%esp
            break;
  102e5d:	eb 34                	jmp    102e93 <vprintfmt+0x38a>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  102e5f:	83 ec 08             	sub    $0x8,%esp
  102e62:	ff 75 0c             	pushl  0xc(%ebp)
  102e65:	53                   	push   %ebx
  102e66:	8b 45 08             	mov    0x8(%ebp),%eax
  102e69:	ff d0                	call   *%eax
  102e6b:	83 c4 10             	add    $0x10,%esp
            break;
  102e6e:	eb 23                	jmp    102e93 <vprintfmt+0x38a>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  102e70:	83 ec 08             	sub    $0x8,%esp
  102e73:	ff 75 0c             	pushl  0xc(%ebp)
  102e76:	6a 25                	push   $0x25
  102e78:	8b 45 08             	mov    0x8(%ebp),%eax
  102e7b:	ff d0                	call   *%eax
  102e7d:	83 c4 10             	add    $0x10,%esp
            for (fmt --; fmt[-1] != '%'; fmt --)
  102e80:	ff 4d 10             	decl   0x10(%ebp)
  102e83:	eb 03                	jmp    102e88 <vprintfmt+0x37f>
  102e85:	ff 4d 10             	decl   0x10(%ebp)
  102e88:	8b 45 10             	mov    0x10(%ebp),%eax
  102e8b:	48                   	dec    %eax
  102e8c:	8a 00                	mov    (%eax),%al
  102e8e:	3c 25                	cmp    $0x25,%al
  102e90:	75 f3                	jne    102e85 <vprintfmt+0x37c>
                /* do nothing */;
            break;
  102e92:	90                   	nop
        }
    }
  102e93:	e9 79 fc ff ff       	jmp    102b11 <vprintfmt+0x8>
}
  102e98:	8d 65 f8             	lea    -0x8(%ebp),%esp
  102e9b:	5b                   	pop    %ebx
  102e9c:	5e                   	pop    %esi
  102e9d:	5d                   	pop    %ebp
  102e9e:	c3                   	ret    

00102e9f <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  102e9f:	55                   	push   %ebp
  102ea0:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  102ea2:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ea5:	8b 40 08             	mov    0x8(%eax),%eax
  102ea8:	8d 50 01             	lea    0x1(%eax),%edx
  102eab:	8b 45 0c             	mov    0xc(%ebp),%eax
  102eae:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  102eb1:	8b 45 0c             	mov    0xc(%ebp),%eax
  102eb4:	8b 10                	mov    (%eax),%edx
  102eb6:	8b 45 0c             	mov    0xc(%ebp),%eax
  102eb9:	8b 40 04             	mov    0x4(%eax),%eax
  102ebc:	39 c2                	cmp    %eax,%edx
  102ebe:	73 12                	jae    102ed2 <sprintputch+0x33>
        *b->buf ++ = ch;
  102ec0:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ec3:	8b 00                	mov    (%eax),%eax
  102ec5:	8d 48 01             	lea    0x1(%eax),%ecx
  102ec8:	8b 55 0c             	mov    0xc(%ebp),%edx
  102ecb:	89 0a                	mov    %ecx,(%edx)
  102ecd:	8b 55 08             	mov    0x8(%ebp),%edx
  102ed0:	88 10                	mov    %dl,(%eax)
    }
}
  102ed2:	5d                   	pop    %ebp
  102ed3:	c3                   	ret    

00102ed4 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  102ed4:	55                   	push   %ebp
  102ed5:	89 e5                	mov    %esp,%ebp
  102ed7:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  102eda:	8d 45 14             	lea    0x14(%ebp),%eax
  102edd:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  102ee0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ee3:	50                   	push   %eax
  102ee4:	ff 75 10             	pushl  0x10(%ebp)
  102ee7:	ff 75 0c             	pushl  0xc(%ebp)
  102eea:	ff 75 08             	pushl  0x8(%ebp)
  102eed:	e8 0b 00 00 00       	call   102efd <vsnprintf>
  102ef2:	83 c4 10             	add    $0x10,%esp
  102ef5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  102ef8:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102efb:	c9                   	leave  
  102efc:	c3                   	ret    

00102efd <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  102efd:	55                   	push   %ebp
  102efe:	89 e5                	mov    %esp,%ebp
  102f00:	83 ec 18             	sub    $0x18,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  102f03:	8b 45 08             	mov    0x8(%ebp),%eax
  102f06:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102f09:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f0c:	8d 50 ff             	lea    -0x1(%eax),%edx
  102f0f:	8b 45 08             	mov    0x8(%ebp),%eax
  102f12:	01 d0                	add    %edx,%eax
  102f14:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102f17:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  102f1e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102f22:	74 0a                	je     102f2e <vsnprintf+0x31>
  102f24:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102f27:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f2a:	39 c2                	cmp    %eax,%edx
  102f2c:	76 07                	jbe    102f35 <vsnprintf+0x38>
        return -E_INVAL;
  102f2e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  102f33:	eb 20                	jmp    102f55 <vsnprintf+0x58>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  102f35:	ff 75 14             	pushl  0x14(%ebp)
  102f38:	ff 75 10             	pushl  0x10(%ebp)
  102f3b:	8d 45 ec             	lea    -0x14(%ebp),%eax
  102f3e:	50                   	push   %eax
  102f3f:	68 9f 2e 10 00       	push   $0x102e9f
  102f44:	e8 c0 fb ff ff       	call   102b09 <vprintfmt>
  102f49:	83 c4 10             	add    $0x10,%esp
    // null terminate the buffer
    *b.buf = '\0';
  102f4c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102f4f:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  102f52:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102f55:	c9                   	leave  
  102f56:	c3                   	ret    

00102f57 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102f57:	55                   	push   %ebp
  102f58:	89 e5                	mov    %esp,%ebp
  102f5a:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102f5d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102f64:	eb 03                	jmp    102f69 <strlen+0x12>
        cnt ++;
  102f66:	ff 45 fc             	incl   -0x4(%ebp)
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
    size_t cnt = 0;
    while (*s ++ != '\0') {
  102f69:	8b 45 08             	mov    0x8(%ebp),%eax
  102f6c:	8d 50 01             	lea    0x1(%eax),%edx
  102f6f:	89 55 08             	mov    %edx,0x8(%ebp)
  102f72:	8a 00                	mov    (%eax),%al
  102f74:	84 c0                	test   %al,%al
  102f76:	75 ee                	jne    102f66 <strlen+0xf>
        cnt ++;
    }
    return cnt;
  102f78:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102f7b:	c9                   	leave  
  102f7c:	c3                   	ret    

00102f7d <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102f7d:	55                   	push   %ebp
  102f7e:	89 e5                	mov    %esp,%ebp
  102f80:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102f83:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102f8a:	eb 03                	jmp    102f8f <strnlen+0x12>
        cnt ++;
  102f8c:	ff 45 fc             	incl   -0x4(%ebp)
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
    while (cnt < len && *s ++ != '\0') {
  102f8f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102f92:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102f95:	73 0f                	jae    102fa6 <strnlen+0x29>
  102f97:	8b 45 08             	mov    0x8(%ebp),%eax
  102f9a:	8d 50 01             	lea    0x1(%eax),%edx
  102f9d:	89 55 08             	mov    %edx,0x8(%ebp)
  102fa0:	8a 00                	mov    (%eax),%al
  102fa2:	84 c0                	test   %al,%al
  102fa4:	75 e6                	jne    102f8c <strnlen+0xf>
        cnt ++;
    }
    return cnt;
  102fa6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102fa9:	c9                   	leave  
  102faa:	c3                   	ret    

00102fab <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102fab:	55                   	push   %ebp
  102fac:	89 e5                	mov    %esp,%ebp
  102fae:	57                   	push   %edi
  102faf:	56                   	push   %esi
  102fb0:	83 ec 20             	sub    $0x20,%esp
  102fb3:	8b 45 08             	mov    0x8(%ebp),%eax
  102fb6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102fb9:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fbc:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102fbf:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102fc2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102fc5:	89 d1                	mov    %edx,%ecx
  102fc7:	89 c2                	mov    %eax,%edx
  102fc9:	89 ce                	mov    %ecx,%esi
  102fcb:	89 d7                	mov    %edx,%edi
  102fcd:	ac                   	lods   %ds:(%esi),%al
  102fce:	aa                   	stos   %al,%es:(%edi)
  102fcf:	84 c0                	test   %al,%al
  102fd1:	75 fa                	jne    102fcd <strcpy+0x22>
  102fd3:	89 fa                	mov    %edi,%edx
  102fd5:	89 f1                	mov    %esi,%ecx
  102fd7:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102fda:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102fdd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102fe0:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_STRCPY
    return __strcpy(dst, src);
  102fe3:	90                   	nop
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102fe4:	83 c4 20             	add    $0x20,%esp
  102fe7:	5e                   	pop    %esi
  102fe8:	5f                   	pop    %edi
  102fe9:	5d                   	pop    %ebp
  102fea:	c3                   	ret    

00102feb <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102feb:	55                   	push   %ebp
  102fec:	89 e5                	mov    %esp,%ebp
  102fee:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102ff1:	8b 45 08             	mov    0x8(%ebp),%eax
  102ff4:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102ff7:	eb 1c                	jmp    103015 <strncpy+0x2a>
        if ((*p = *src) != '\0') {
  102ff9:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ffc:	8a 10                	mov    (%eax),%dl
  102ffe:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103001:	88 10                	mov    %dl,(%eax)
  103003:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103006:	8a 00                	mov    (%eax),%al
  103008:	84 c0                	test   %al,%al
  10300a:	74 03                	je     10300f <strncpy+0x24>
            src ++;
  10300c:	ff 45 0c             	incl   0xc(%ebp)
        }
        p ++, len --;
  10300f:	ff 45 fc             	incl   -0x4(%ebp)
  103012:	ff 4d 10             	decl   0x10(%ebp)
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
    char *p = dst;
    while (len > 0) {
  103015:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103019:	75 de                	jne    102ff9 <strncpy+0xe>
        if ((*p = *src) != '\0') {
            src ++;
        }
        p ++, len --;
    }
    return dst;
  10301b:	8b 45 08             	mov    0x8(%ebp),%eax
}
  10301e:	c9                   	leave  
  10301f:	c3                   	ret    

00103020 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  103020:	55                   	push   %ebp
  103021:	89 e5                	mov    %esp,%ebp
  103023:	57                   	push   %edi
  103024:	56                   	push   %esi
  103025:	83 ec 20             	sub    $0x20,%esp
  103028:	8b 45 08             	mov    0x8(%ebp),%eax
  10302b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10302e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103031:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCMP
#define __HAVE_ARCH_STRCMP
static inline int
__strcmp(const char *s1, const char *s2) {
    int d0, d1, ret;
    asm volatile (
  103034:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103037:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10303a:	89 d1                	mov    %edx,%ecx
  10303c:	89 c2                	mov    %eax,%edx
  10303e:	89 ce                	mov    %ecx,%esi
  103040:	89 d7                	mov    %edx,%edi
  103042:	ac                   	lods   %ds:(%esi),%al
  103043:	ae                   	scas   %es:(%edi),%al
  103044:	75 08                	jne    10304e <strcmp+0x2e>
  103046:	84 c0                	test   %al,%al
  103048:	75 f8                	jne    103042 <strcmp+0x22>
  10304a:	31 c0                	xor    %eax,%eax
  10304c:	eb 04                	jmp    103052 <strcmp+0x32>
  10304e:	19 c0                	sbb    %eax,%eax
  103050:	0c 01                	or     $0x1,%al
  103052:	89 fa                	mov    %edi,%edx
  103054:	89 f1                	mov    %esi,%ecx
  103056:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103059:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  10305c:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            "orb $1, %%al;"
            "3:"
            : "=a" (ret), "=&S" (d0), "=&D" (d1)
            : "1" (s1), "2" (s2)
            : "memory");
    return ret;
  10305f:	8b 45 ec             	mov    -0x14(%ebp),%eax
#ifdef __HAVE_ARCH_STRCMP
    return __strcmp(s1, s2);
  103062:	90                   	nop
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  103063:	83 c4 20             	add    $0x20,%esp
  103066:	5e                   	pop    %esi
  103067:	5f                   	pop    %edi
  103068:	5d                   	pop    %ebp
  103069:	c3                   	ret    

0010306a <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  10306a:	55                   	push   %ebp
  10306b:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  10306d:	eb 09                	jmp    103078 <strncmp+0xe>
        n --, s1 ++, s2 ++;
  10306f:	ff 4d 10             	decl   0x10(%ebp)
  103072:	ff 45 08             	incl   0x8(%ebp)
  103075:	ff 45 0c             	incl   0xc(%ebp)
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  103078:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10307c:	74 17                	je     103095 <strncmp+0x2b>
  10307e:	8b 45 08             	mov    0x8(%ebp),%eax
  103081:	8a 00                	mov    (%eax),%al
  103083:	84 c0                	test   %al,%al
  103085:	74 0e                	je     103095 <strncmp+0x2b>
  103087:	8b 45 08             	mov    0x8(%ebp),%eax
  10308a:	8a 10                	mov    (%eax),%dl
  10308c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10308f:	8a 00                	mov    (%eax),%al
  103091:	38 c2                	cmp    %al,%dl
  103093:	74 da                	je     10306f <strncmp+0x5>
        n --, s1 ++, s2 ++;
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  103095:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103099:	74 16                	je     1030b1 <strncmp+0x47>
  10309b:	8b 45 08             	mov    0x8(%ebp),%eax
  10309e:	8a 00                	mov    (%eax),%al
  1030a0:	0f b6 d0             	movzbl %al,%edx
  1030a3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030a6:	8a 00                	mov    (%eax),%al
  1030a8:	0f b6 c0             	movzbl %al,%eax
  1030ab:	29 c2                	sub    %eax,%edx
  1030ad:	89 d0                	mov    %edx,%eax
  1030af:	eb 05                	jmp    1030b6 <strncmp+0x4c>
  1030b1:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1030b6:	5d                   	pop    %ebp
  1030b7:	c3                   	ret    

001030b8 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  1030b8:	55                   	push   %ebp
  1030b9:	89 e5                	mov    %esp,%ebp
  1030bb:	83 ec 04             	sub    $0x4,%esp
  1030be:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030c1:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  1030c4:	eb 12                	jmp    1030d8 <strchr+0x20>
        if (*s == c) {
  1030c6:	8b 45 08             	mov    0x8(%ebp),%eax
  1030c9:	8a 00                	mov    (%eax),%al
  1030cb:	3a 45 fc             	cmp    -0x4(%ebp),%al
  1030ce:	75 05                	jne    1030d5 <strchr+0x1d>
            return (char *)s;
  1030d0:	8b 45 08             	mov    0x8(%ebp),%eax
  1030d3:	eb 11                	jmp    1030e6 <strchr+0x2e>
        }
        s ++;
  1030d5:	ff 45 08             	incl   0x8(%ebp)
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
    while (*s != '\0') {
  1030d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1030db:	8a 00                	mov    (%eax),%al
  1030dd:	84 c0                	test   %al,%al
  1030df:	75 e5                	jne    1030c6 <strchr+0xe>
        if (*s == c) {
            return (char *)s;
        }
        s ++;
    }
    return NULL;
  1030e1:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1030e6:	c9                   	leave  
  1030e7:	c3                   	ret    

001030e8 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  1030e8:	55                   	push   %ebp
  1030e9:	89 e5                	mov    %esp,%ebp
  1030eb:	83 ec 04             	sub    $0x4,%esp
  1030ee:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030f1:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  1030f4:	eb 0f                	jmp    103105 <strfind+0x1d>
        if (*s == c) {
  1030f6:	8b 45 08             	mov    0x8(%ebp),%eax
  1030f9:	8a 00                	mov    (%eax),%al
  1030fb:	3a 45 fc             	cmp    -0x4(%ebp),%al
  1030fe:	75 02                	jne    103102 <strfind+0x1a>
            break;
  103100:	eb 0c                	jmp    10310e <strfind+0x26>
        }
        s ++;
  103102:	ff 45 08             	incl   0x8(%ebp)
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
    while (*s != '\0') {
  103105:	8b 45 08             	mov    0x8(%ebp),%eax
  103108:	8a 00                	mov    (%eax),%al
  10310a:	84 c0                	test   %al,%al
  10310c:	75 e8                	jne    1030f6 <strfind+0xe>
        if (*s == c) {
            break;
        }
        s ++;
    }
    return (char *)s;
  10310e:	8b 45 08             	mov    0x8(%ebp),%eax
}
  103111:	c9                   	leave  
  103112:	c3                   	ret    

00103113 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  103113:	55                   	push   %ebp
  103114:	89 e5                	mov    %esp,%ebp
  103116:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  103119:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  103120:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  103127:	eb 03                	jmp    10312c <strtol+0x19>
        s ++;
  103129:	ff 45 08             	incl   0x8(%ebp)
strtol(const char *s, char **endptr, int base) {
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  10312c:	8b 45 08             	mov    0x8(%ebp),%eax
  10312f:	8a 00                	mov    (%eax),%al
  103131:	3c 20                	cmp    $0x20,%al
  103133:	74 f4                	je     103129 <strtol+0x16>
  103135:	8b 45 08             	mov    0x8(%ebp),%eax
  103138:	8a 00                	mov    (%eax),%al
  10313a:	3c 09                	cmp    $0x9,%al
  10313c:	74 eb                	je     103129 <strtol+0x16>
        s ++;
    }

    // plus/minus sign
    if (*s == '+') {
  10313e:	8b 45 08             	mov    0x8(%ebp),%eax
  103141:	8a 00                	mov    (%eax),%al
  103143:	3c 2b                	cmp    $0x2b,%al
  103145:	75 05                	jne    10314c <strtol+0x39>
        s ++;
  103147:	ff 45 08             	incl   0x8(%ebp)
  10314a:	eb 13                	jmp    10315f <strtol+0x4c>
    }
    else if (*s == '-') {
  10314c:	8b 45 08             	mov    0x8(%ebp),%eax
  10314f:	8a 00                	mov    (%eax),%al
  103151:	3c 2d                	cmp    $0x2d,%al
  103153:	75 0a                	jne    10315f <strtol+0x4c>
        s ++, neg = 1;
  103155:	ff 45 08             	incl   0x8(%ebp)
  103158:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  10315f:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103163:	74 06                	je     10316b <strtol+0x58>
  103165:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  103169:	75 20                	jne    10318b <strtol+0x78>
  10316b:	8b 45 08             	mov    0x8(%ebp),%eax
  10316e:	8a 00                	mov    (%eax),%al
  103170:	3c 30                	cmp    $0x30,%al
  103172:	75 17                	jne    10318b <strtol+0x78>
  103174:	8b 45 08             	mov    0x8(%ebp),%eax
  103177:	40                   	inc    %eax
  103178:	8a 00                	mov    (%eax),%al
  10317a:	3c 78                	cmp    $0x78,%al
  10317c:	75 0d                	jne    10318b <strtol+0x78>
        s += 2, base = 16;
  10317e:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  103182:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  103189:	eb 28                	jmp    1031b3 <strtol+0xa0>
    }
    else if (base == 0 && s[0] == '0') {
  10318b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10318f:	75 15                	jne    1031a6 <strtol+0x93>
  103191:	8b 45 08             	mov    0x8(%ebp),%eax
  103194:	8a 00                	mov    (%eax),%al
  103196:	3c 30                	cmp    $0x30,%al
  103198:	75 0c                	jne    1031a6 <strtol+0x93>
        s ++, base = 8;
  10319a:	ff 45 08             	incl   0x8(%ebp)
  10319d:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  1031a4:	eb 0d                	jmp    1031b3 <strtol+0xa0>
    }
    else if (base == 0) {
  1031a6:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1031aa:	75 07                	jne    1031b3 <strtol+0xa0>
        base = 10;
  1031ac:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  1031b3:	8b 45 08             	mov    0x8(%ebp),%eax
  1031b6:	8a 00                	mov    (%eax),%al
  1031b8:	3c 2f                	cmp    $0x2f,%al
  1031ba:	7e 19                	jle    1031d5 <strtol+0xc2>
  1031bc:	8b 45 08             	mov    0x8(%ebp),%eax
  1031bf:	8a 00                	mov    (%eax),%al
  1031c1:	3c 39                	cmp    $0x39,%al
  1031c3:	7f 10                	jg     1031d5 <strtol+0xc2>
            dig = *s - '0';
  1031c5:	8b 45 08             	mov    0x8(%ebp),%eax
  1031c8:	8a 00                	mov    (%eax),%al
  1031ca:	0f be c0             	movsbl %al,%eax
  1031cd:	83 e8 30             	sub    $0x30,%eax
  1031d0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1031d3:	eb 42                	jmp    103217 <strtol+0x104>
        }
        else if (*s >= 'a' && *s <= 'z') {
  1031d5:	8b 45 08             	mov    0x8(%ebp),%eax
  1031d8:	8a 00                	mov    (%eax),%al
  1031da:	3c 60                	cmp    $0x60,%al
  1031dc:	7e 19                	jle    1031f7 <strtol+0xe4>
  1031de:	8b 45 08             	mov    0x8(%ebp),%eax
  1031e1:	8a 00                	mov    (%eax),%al
  1031e3:	3c 7a                	cmp    $0x7a,%al
  1031e5:	7f 10                	jg     1031f7 <strtol+0xe4>
            dig = *s - 'a' + 10;
  1031e7:	8b 45 08             	mov    0x8(%ebp),%eax
  1031ea:	8a 00                	mov    (%eax),%al
  1031ec:	0f be c0             	movsbl %al,%eax
  1031ef:	83 e8 57             	sub    $0x57,%eax
  1031f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1031f5:	eb 20                	jmp    103217 <strtol+0x104>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  1031f7:	8b 45 08             	mov    0x8(%ebp),%eax
  1031fa:	8a 00                	mov    (%eax),%al
  1031fc:	3c 40                	cmp    $0x40,%al
  1031fe:	7e 3a                	jle    10323a <strtol+0x127>
  103200:	8b 45 08             	mov    0x8(%ebp),%eax
  103203:	8a 00                	mov    (%eax),%al
  103205:	3c 5a                	cmp    $0x5a,%al
  103207:	7f 31                	jg     10323a <strtol+0x127>
            dig = *s - 'A' + 10;
  103209:	8b 45 08             	mov    0x8(%ebp),%eax
  10320c:	8a 00                	mov    (%eax),%al
  10320e:	0f be c0             	movsbl %al,%eax
  103211:	83 e8 37             	sub    $0x37,%eax
  103214:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  103217:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10321a:	3b 45 10             	cmp    0x10(%ebp),%eax
  10321d:	7c 02                	jl     103221 <strtol+0x10e>
            break;
  10321f:	eb 19                	jmp    10323a <strtol+0x127>
        }
        s ++, val = (val * base) + dig;
  103221:	ff 45 08             	incl   0x8(%ebp)
  103224:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103227:	0f af 45 10          	imul   0x10(%ebp),%eax
  10322b:	89 c2                	mov    %eax,%edx
  10322d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103230:	01 d0                	add    %edx,%eax
  103232:	89 45 f8             	mov    %eax,-0x8(%ebp)
        // we don't properly detect overflow!
    }
  103235:	e9 79 ff ff ff       	jmp    1031b3 <strtol+0xa0>

    if (endptr) {
  10323a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  10323e:	74 08                	je     103248 <strtol+0x135>
        *endptr = (char *) s;
  103240:	8b 45 0c             	mov    0xc(%ebp),%eax
  103243:	8b 55 08             	mov    0x8(%ebp),%edx
  103246:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  103248:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  10324c:	74 07                	je     103255 <strtol+0x142>
  10324e:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103251:	f7 d8                	neg    %eax
  103253:	eb 03                	jmp    103258 <strtol+0x145>
  103255:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  103258:	c9                   	leave  
  103259:	c3                   	ret    

0010325a <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  10325a:	55                   	push   %ebp
  10325b:	89 e5                	mov    %esp,%ebp
  10325d:	57                   	push   %edi
  10325e:	83 ec 24             	sub    $0x24,%esp
  103261:	8b 45 0c             	mov    0xc(%ebp),%eax
  103264:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  103267:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  10326b:	8b 55 08             	mov    0x8(%ebp),%edx
  10326e:	89 55 f8             	mov    %edx,-0x8(%ebp)
  103271:	88 45 f7             	mov    %al,-0x9(%ebp)
  103274:	8b 45 10             	mov    0x10(%ebp),%eax
  103277:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  10327a:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  10327d:	8a 45 f7             	mov    -0x9(%ebp),%al
  103280:	8b 55 f8             	mov    -0x8(%ebp),%edx
  103283:	89 d7                	mov    %edx,%edi
  103285:	f3 aa                	rep stos %al,%es:(%edi)
  103287:	89 fa                	mov    %edi,%edx
  103289:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  10328c:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  10328f:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103292:	90                   	nop
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  103293:	83 c4 24             	add    $0x24,%esp
  103296:	5f                   	pop    %edi
  103297:	5d                   	pop    %ebp
  103298:	c3                   	ret    

00103299 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  103299:	55                   	push   %ebp
  10329a:	89 e5                	mov    %esp,%ebp
  10329c:	57                   	push   %edi
  10329d:	56                   	push   %esi
  10329e:	53                   	push   %ebx
  10329f:	83 ec 30             	sub    $0x30,%esp
  1032a2:	8b 45 08             	mov    0x8(%ebp),%eax
  1032a5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1032a8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032ab:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1032ae:	8b 45 10             	mov    0x10(%ebp),%eax
  1032b1:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  1032b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1032b7:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  1032ba:	73 42                	jae    1032fe <memmove+0x65>
  1032bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1032bf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1032c2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1032c5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1032c8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1032cb:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  1032ce:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1032d1:	c1 e8 02             	shr    $0x2,%eax
  1032d4:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  1032d6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1032d9:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1032dc:	89 d7                	mov    %edx,%edi
  1032de:	89 c6                	mov    %eax,%esi
  1032e0:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1032e2:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  1032e5:	83 e1 03             	and    $0x3,%ecx
  1032e8:	74 02                	je     1032ec <memmove+0x53>
  1032ea:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1032ec:	89 f0                	mov    %esi,%eax
  1032ee:	89 fa                	mov    %edi,%edx
  1032f0:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  1032f3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  1032f6:	89 45 d0             	mov    %eax,-0x30(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  1032f9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
#ifdef __HAVE_ARCH_MEMMOVE
    return __memmove(dst, src, n);
  1032fc:	eb 36                	jmp    103334 <memmove+0x9b>
    asm volatile (
            "std;"
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  1032fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103301:	8d 50 ff             	lea    -0x1(%eax),%edx
  103304:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103307:	01 c2                	add    %eax,%edx
  103309:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10330c:	8d 48 ff             	lea    -0x1(%eax),%ecx
  10330f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103312:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
        return __memcpy(dst, src, n);
    }
    int d0, d1, d2;
    asm volatile (
  103315:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103318:	89 c1                	mov    %eax,%ecx
  10331a:	89 d8                	mov    %ebx,%eax
  10331c:	89 d6                	mov    %edx,%esi
  10331e:	89 c7                	mov    %eax,%edi
  103320:	fd                   	std    
  103321:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103323:	fc                   	cld    
  103324:	89 f8                	mov    %edi,%eax
  103326:	89 f2                	mov    %esi,%edx
  103328:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  10332b:	89 55 c8             	mov    %edx,-0x38(%ebp)
  10332e:	89 45 c4             	mov    %eax,-0x3c(%ebp)
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
            : "memory");
    return dst;
  103331:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  103334:	83 c4 30             	add    $0x30,%esp
  103337:	5b                   	pop    %ebx
  103338:	5e                   	pop    %esi
  103339:	5f                   	pop    %edi
  10333a:	5d                   	pop    %ebp
  10333b:	c3                   	ret    

0010333c <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  10333c:	55                   	push   %ebp
  10333d:	89 e5                	mov    %esp,%ebp
  10333f:	57                   	push   %edi
  103340:	56                   	push   %esi
  103341:	83 ec 20             	sub    $0x20,%esp
  103344:	8b 45 08             	mov    0x8(%ebp),%eax
  103347:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10334a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10334d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103350:	8b 45 10             	mov    0x10(%ebp),%eax
  103353:	89 45 ec             	mov    %eax,-0x14(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  103356:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103359:	c1 e8 02             	shr    $0x2,%eax
  10335c:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  10335e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103361:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103364:	89 d7                	mov    %edx,%edi
  103366:	89 c6                	mov    %eax,%esi
  103368:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10336a:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  10336d:	83 e1 03             	and    $0x3,%ecx
  103370:	74 02                	je     103374 <memcpy+0x38>
  103372:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103374:	89 f0                	mov    %esi,%eax
  103376:	89 fa                	mov    %edi,%edx
  103378:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  10337b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  10337e:	89 45 e0             	mov    %eax,-0x20(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  103381:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_MEMCPY
    return __memcpy(dst, src, n);
  103384:	90                   	nop
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  103385:	83 c4 20             	add    $0x20,%esp
  103388:	5e                   	pop    %esi
  103389:	5f                   	pop    %edi
  10338a:	5d                   	pop    %ebp
  10338b:	c3                   	ret    

0010338c <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  10338c:	55                   	push   %ebp
  10338d:	89 e5                	mov    %esp,%ebp
  10338f:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  103392:	8b 45 08             	mov    0x8(%ebp),%eax
  103395:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  103398:	8b 45 0c             	mov    0xc(%ebp),%eax
  10339b:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  10339e:	eb 2a                	jmp    1033ca <memcmp+0x3e>
        if (*s1 != *s2) {
  1033a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1033a3:	8a 10                	mov    (%eax),%dl
  1033a5:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1033a8:	8a 00                	mov    (%eax),%al
  1033aa:	38 c2                	cmp    %al,%dl
  1033ac:	74 16                	je     1033c4 <memcmp+0x38>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  1033ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1033b1:	8a 00                	mov    (%eax),%al
  1033b3:	0f b6 d0             	movzbl %al,%edx
  1033b6:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1033b9:	8a 00                	mov    (%eax),%al
  1033bb:	0f b6 c0             	movzbl %al,%eax
  1033be:	29 c2                	sub    %eax,%edx
  1033c0:	89 d0                	mov    %edx,%eax
  1033c2:	eb 18                	jmp    1033dc <memcmp+0x50>
        }
        s1 ++, s2 ++;
  1033c4:	ff 45 fc             	incl   -0x4(%ebp)
  1033c7:	ff 45 f8             	incl   -0x8(%ebp)
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
    const char *s1 = (const char *)v1;
    const char *s2 = (const char *)v2;
    while (n -- > 0) {
  1033ca:	8b 45 10             	mov    0x10(%ebp),%eax
  1033cd:	8d 50 ff             	lea    -0x1(%eax),%edx
  1033d0:	89 55 10             	mov    %edx,0x10(%ebp)
  1033d3:	85 c0                	test   %eax,%eax
  1033d5:	75 c9                	jne    1033a0 <memcmp+0x14>
        if (*s1 != *s2) {
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
        }
        s1 ++, s2 ++;
    }
    return 0;
  1033d7:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1033dc:	c9                   	leave  
  1033dd:	c3                   	ret    
