
bin/kernel：     文件格式 elf32-i386


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
  100006:	ba 20 fd 10 00       	mov    $0x10fd20,%edx
  10000b:	b8 16 ea 10 00       	mov    $0x10ea16,%eax
  100010:	29 c2                	sub    %eax,%edx
  100012:	89 d0                	mov    %edx,%eax
  100014:	83 ec 04             	sub    $0x4,%esp
  100017:	50                   	push   %eax
  100018:	6a 00                	push   $0x0
  10001a:	68 16 ea 10 00       	push   $0x10ea16
  10001f:	e8 a8 2a 00 00       	call   102acc <memset>
  100024:	83 c4 10             	add    $0x10,%esp

    cons_init();                // init the console
  100027:	e8 1b 15 00 00       	call   101547 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  10002c:	c7 45 f4 80 32 10 00 	movl   $0x103280,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100033:	83 ec 08             	sub    $0x8,%esp
  100036:	ff 75 f4             	pushl  -0xc(%ebp)
  100039:	68 9c 32 10 00       	push   $0x10329c
  10003e:	e8 fa 01 00 00       	call   10023d <cprintf>
  100043:	83 c4 10             	add    $0x10,%esp

    print_kerninfo();
  100046:	e8 7c 08 00 00       	call   1008c7 <print_kerninfo>

    grade_backtrace();
  10004b:	e8 74 00 00 00       	call   1000c4 <grade_backtrace>

    pmm_init();                 // init physical memory management
  100050:	e8 3b 27 00 00       	call   102790 <pmm_init>

    pic_init();                 // init interrupt controller
  100055:	e8 30 16 00 00       	call   10168a <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005a:	e8 91 17 00 00       	call   1017f0 <idt_init>

    clock_init();               // init clock interrupt
  10005f:	e8 c8 0c 00 00       	call   100d2c <clock_init>
    intr_enable();              // enable irq interrupt
  100064:	e8 5e 17 00 00       	call   1017c7 <intr_enable>
    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();

    /* do nothing */
    while (1);
  100069:	eb fe                	jmp    100069 <kern_init+0x69>

0010006b <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  10006b:	55                   	push   %ebp
  10006c:	89 e5                	mov    %esp,%ebp
  10006e:	83 ec 08             	sub    $0x8,%esp
    mon_backtrace(0, NULL, NULL);
  100071:	83 ec 04             	sub    $0x4,%esp
  100074:	6a 00                	push   $0x0
  100076:	6a 00                	push   $0x0
  100078:	6a 00                	push   $0x0
  10007a:	e8 9b 0c 00 00       	call   100d1a <mon_backtrace>
  10007f:	83 c4 10             	add    $0x10,%esp
}
  100082:	90                   	nop
  100083:	c9                   	leave  
  100084:	c3                   	ret    

00100085 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100085:	55                   	push   %ebp
  100086:	89 e5                	mov    %esp,%ebp
  100088:	53                   	push   %ebx
  100089:	83 ec 04             	sub    $0x4,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  10008c:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  10008f:	8b 55 0c             	mov    0xc(%ebp),%edx
  100092:	8d 5d 08             	lea    0x8(%ebp),%ebx
  100095:	8b 45 08             	mov    0x8(%ebp),%eax
  100098:	51                   	push   %ecx
  100099:	52                   	push   %edx
  10009a:	53                   	push   %ebx
  10009b:	50                   	push   %eax
  10009c:	e8 ca ff ff ff       	call   10006b <grade_backtrace2>
  1000a1:	83 c4 10             	add    $0x10,%esp
}
  1000a4:	90                   	nop
  1000a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000a8:	c9                   	leave  
  1000a9:	c3                   	ret    

001000aa <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000aa:	55                   	push   %ebp
  1000ab:	89 e5                	mov    %esp,%ebp
  1000ad:	83 ec 08             	sub    $0x8,%esp
    grade_backtrace1(arg0, arg2);
  1000b0:	83 ec 08             	sub    $0x8,%esp
  1000b3:	ff 75 10             	pushl  0x10(%ebp)
  1000b6:	ff 75 08             	pushl  0x8(%ebp)
  1000b9:	e8 c7 ff ff ff       	call   100085 <grade_backtrace1>
  1000be:	83 c4 10             	add    $0x10,%esp
}
  1000c1:	90                   	nop
  1000c2:	c9                   	leave  
  1000c3:	c3                   	ret    

001000c4 <grade_backtrace>:

void
grade_backtrace(void) {
  1000c4:	55                   	push   %ebp
  1000c5:	89 e5                	mov    %esp,%ebp
  1000c7:	83 ec 08             	sub    $0x8,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000ca:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000cf:	83 ec 04             	sub    $0x4,%esp
  1000d2:	68 00 00 ff ff       	push   $0xffff0000
  1000d7:	50                   	push   %eax
  1000d8:	6a 00                	push   $0x0
  1000da:	e8 cb ff ff ff       	call   1000aa <grade_backtrace0>
  1000df:	83 c4 10             	add    $0x10,%esp
}
  1000e2:	90                   	nop
  1000e3:	c9                   	leave  
  1000e4:	c3                   	ret    

001000e5 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  1000e5:	55                   	push   %ebp
  1000e6:	89 e5                	mov    %esp,%ebp
  1000e8:	83 ec 18             	sub    $0x18,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  1000eb:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  1000ee:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  1000f1:	8c 45 f2             	mov    %es,-0xe(%ebp)
  1000f4:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  1000f7:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  1000fb:	0f b7 c0             	movzwl %ax,%eax
  1000fe:	83 e0 03             	and    $0x3,%eax
  100101:	89 c2                	mov    %eax,%edx
  100103:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100108:	83 ec 04             	sub    $0x4,%esp
  10010b:	52                   	push   %edx
  10010c:	50                   	push   %eax
  10010d:	68 a1 32 10 00       	push   $0x1032a1
  100112:	e8 26 01 00 00       	call   10023d <cprintf>
  100117:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  cs = %x\n", round, reg1);
  10011a:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10011e:	0f b7 d0             	movzwl %ax,%edx
  100121:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100126:	83 ec 04             	sub    $0x4,%esp
  100129:	52                   	push   %edx
  10012a:	50                   	push   %eax
  10012b:	68 af 32 10 00       	push   $0x1032af
  100130:	e8 08 01 00 00       	call   10023d <cprintf>
  100135:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ds = %x\n", round, reg2);
  100138:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  10013c:	0f b7 d0             	movzwl %ax,%edx
  10013f:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100144:	83 ec 04             	sub    $0x4,%esp
  100147:	52                   	push   %edx
  100148:	50                   	push   %eax
  100149:	68 bd 32 10 00       	push   $0x1032bd
  10014e:	e8 ea 00 00 00       	call   10023d <cprintf>
  100153:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  es = %x\n", round, reg3);
  100156:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10015a:	0f b7 d0             	movzwl %ax,%edx
  10015d:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100162:	83 ec 04             	sub    $0x4,%esp
  100165:	52                   	push   %edx
  100166:	50                   	push   %eax
  100167:	68 cb 32 10 00       	push   $0x1032cb
  10016c:	e8 cc 00 00 00       	call   10023d <cprintf>
  100171:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ss = %x\n", round, reg4);
  100174:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  100178:	0f b7 d0             	movzwl %ax,%edx
  10017b:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100180:	83 ec 04             	sub    $0x4,%esp
  100183:	52                   	push   %edx
  100184:	50                   	push   %eax
  100185:	68 d9 32 10 00       	push   $0x1032d9
  10018a:	e8 ae 00 00 00       	call   10023d <cprintf>
  10018f:	83 c4 10             	add    $0x10,%esp
    round ++;
  100192:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100197:	83 c0 01             	add    $0x1,%eax
  10019a:	a3 20 ea 10 00       	mov    %eax,0x10ea20
}
  10019f:	90                   	nop
  1001a0:	c9                   	leave  
  1001a1:	c3                   	ret    

001001a2 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001a2:	55                   	push   %ebp
  1001a3:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
}
  1001a5:	90                   	nop
  1001a6:	5d                   	pop    %ebp
  1001a7:	c3                   	ret    

001001a8 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001a8:	55                   	push   %ebp
  1001a9:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
}
  1001ab:	90                   	nop
  1001ac:	5d                   	pop    %ebp
  1001ad:	c3                   	ret    

001001ae <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001ae:	55                   	push   %ebp
  1001af:	89 e5                	mov    %esp,%ebp
  1001b1:	83 ec 08             	sub    $0x8,%esp
    lab1_print_cur_status();
  1001b4:	e8 2c ff ff ff       	call   1000e5 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001b9:	83 ec 0c             	sub    $0xc,%esp
  1001bc:	68 e8 32 10 00       	push   $0x1032e8
  1001c1:	e8 77 00 00 00       	call   10023d <cprintf>
  1001c6:	83 c4 10             	add    $0x10,%esp
    lab1_switch_to_user();
  1001c9:	e8 d4 ff ff ff       	call   1001a2 <lab1_switch_to_user>
    lab1_print_cur_status();
  1001ce:	e8 12 ff ff ff       	call   1000e5 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001d3:	83 ec 0c             	sub    $0xc,%esp
  1001d6:	68 08 33 10 00       	push   $0x103308
  1001db:	e8 5d 00 00 00       	call   10023d <cprintf>
  1001e0:	83 c4 10             	add    $0x10,%esp
    lab1_switch_to_kernel();
  1001e3:	e8 c0 ff ff ff       	call   1001a8 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  1001e8:	e8 f8 fe ff ff       	call   1000e5 <lab1_print_cur_status>
}
  1001ed:	90                   	nop
  1001ee:	c9                   	leave  
  1001ef:	c3                   	ret    

001001f0 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1001f0:	55                   	push   %ebp
  1001f1:	89 e5                	mov    %esp,%ebp
  1001f3:	83 ec 08             	sub    $0x8,%esp
    cons_putc(c);
  1001f6:	83 ec 0c             	sub    $0xc,%esp
  1001f9:	ff 75 08             	pushl  0x8(%ebp)
  1001fc:	e8 77 13 00 00       	call   101578 <cons_putc>
  100201:	83 c4 10             	add    $0x10,%esp
    (*cnt) ++;
  100204:	8b 45 0c             	mov    0xc(%ebp),%eax
  100207:	8b 00                	mov    (%eax),%eax
  100209:	8d 50 01             	lea    0x1(%eax),%edx
  10020c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10020f:	89 10                	mov    %edx,(%eax)
}
  100211:	90                   	nop
  100212:	c9                   	leave  
  100213:	c3                   	ret    

00100214 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  100214:	55                   	push   %ebp
  100215:	89 e5                	mov    %esp,%ebp
  100217:	83 ec 18             	sub    $0x18,%esp
    int cnt = 0;
  10021a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  100221:	ff 75 0c             	pushl  0xc(%ebp)
  100224:	ff 75 08             	pushl  0x8(%ebp)
  100227:	8d 45 f4             	lea    -0xc(%ebp),%eax
  10022a:	50                   	push   %eax
  10022b:	68 f0 01 10 00       	push   $0x1001f0
  100230:	e8 cd 2b 00 00       	call   102e02 <vprintfmt>
  100235:	83 c4 10             	add    $0x10,%esp
    return cnt;
  100238:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10023b:	c9                   	leave  
  10023c:	c3                   	ret    

0010023d <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  10023d:	55                   	push   %ebp
  10023e:	89 e5                	mov    %esp,%ebp
  100240:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100243:	8d 45 0c             	lea    0xc(%ebp),%eax
  100246:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100249:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10024c:	83 ec 08             	sub    $0x8,%esp
  10024f:	50                   	push   %eax
  100250:	ff 75 08             	pushl  0x8(%ebp)
  100253:	e8 bc ff ff ff       	call   100214 <vcprintf>
  100258:	83 c4 10             	add    $0x10,%esp
  10025b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10025e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100261:	c9                   	leave  
  100262:	c3                   	ret    

00100263 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100263:	55                   	push   %ebp
  100264:	89 e5                	mov    %esp,%ebp
  100266:	83 ec 08             	sub    $0x8,%esp
    cons_putc(c);
  100269:	83 ec 0c             	sub    $0xc,%esp
  10026c:	ff 75 08             	pushl  0x8(%ebp)
  10026f:	e8 04 13 00 00       	call   101578 <cons_putc>
  100274:	83 c4 10             	add    $0x10,%esp
}
  100277:	90                   	nop
  100278:	c9                   	leave  
  100279:	c3                   	ret    

0010027a <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  10027a:	55                   	push   %ebp
  10027b:	89 e5                	mov    %esp,%ebp
  10027d:	83 ec 18             	sub    $0x18,%esp
    int cnt = 0;
  100280:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  100287:	eb 14                	jmp    10029d <cputs+0x23>
        cputch(c, &cnt);
  100289:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  10028d:	83 ec 08             	sub    $0x8,%esp
  100290:	8d 55 f0             	lea    -0x10(%ebp),%edx
  100293:	52                   	push   %edx
  100294:	50                   	push   %eax
  100295:	e8 56 ff ff ff       	call   1001f0 <cputch>
  10029a:	83 c4 10             	add    $0x10,%esp
 * */
int
cputs(const char *str) {
    int cnt = 0;
    char c;
    while ((c = *str ++) != '\0') {
  10029d:	8b 45 08             	mov    0x8(%ebp),%eax
  1002a0:	8d 50 01             	lea    0x1(%eax),%edx
  1002a3:	89 55 08             	mov    %edx,0x8(%ebp)
  1002a6:	0f b6 00             	movzbl (%eax),%eax
  1002a9:	88 45 f7             	mov    %al,-0x9(%ebp)
  1002ac:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  1002b0:	75 d7                	jne    100289 <cputs+0xf>
        cputch(c, &cnt);
    }
    cputch('\n', &cnt);
  1002b2:	83 ec 08             	sub    $0x8,%esp
  1002b5:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1002b8:	50                   	push   %eax
  1002b9:	6a 0a                	push   $0xa
  1002bb:	e8 30 ff ff ff       	call   1001f0 <cputch>
  1002c0:	83 c4 10             	add    $0x10,%esp
    return cnt;
  1002c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  1002c6:	c9                   	leave  
  1002c7:	c3                   	ret    

001002c8 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  1002c8:	55                   	push   %ebp
  1002c9:	89 e5                	mov    %esp,%ebp
  1002cb:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1002ce:	e8 d5 12 00 00       	call   1015a8 <cons_getc>
  1002d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1002d6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1002da:	74 f2                	je     1002ce <getchar+0x6>
        /* do nothing */;
    return c;
  1002dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1002df:	c9                   	leave  
  1002e0:	c3                   	ret    

001002e1 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  1002e1:	55                   	push   %ebp
  1002e2:	89 e5                	mov    %esp,%ebp
  1002e4:	83 ec 18             	sub    $0x18,%esp
    if (prompt != NULL) {
  1002e7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1002eb:	74 13                	je     100300 <readline+0x1f>
        cprintf("%s", prompt);
  1002ed:	83 ec 08             	sub    $0x8,%esp
  1002f0:	ff 75 08             	pushl  0x8(%ebp)
  1002f3:	68 27 33 10 00       	push   $0x103327
  1002f8:	e8 40 ff ff ff       	call   10023d <cprintf>
  1002fd:	83 c4 10             	add    $0x10,%esp
    }
    int i = 0, c;
  100300:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100307:	e8 bc ff ff ff       	call   1002c8 <getchar>
  10030c:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  10030f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100313:	79 0a                	jns    10031f <readline+0x3e>
            return NULL;
  100315:	b8 00 00 00 00       	mov    $0x0,%eax
  10031a:	e9 82 00 00 00       	jmp    1003a1 <readline+0xc0>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  10031f:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  100323:	7e 2b                	jle    100350 <readline+0x6f>
  100325:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  10032c:	7f 22                	jg     100350 <readline+0x6f>
            cputchar(c);
  10032e:	83 ec 0c             	sub    $0xc,%esp
  100331:	ff 75 f0             	pushl  -0x10(%ebp)
  100334:	e8 2a ff ff ff       	call   100263 <cputchar>
  100339:	83 c4 10             	add    $0x10,%esp
            buf[i ++] = c;
  10033c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10033f:	8d 50 01             	lea    0x1(%eax),%edx
  100342:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100345:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100348:	88 90 40 ea 10 00    	mov    %dl,0x10ea40(%eax)
  10034e:	eb 4c                	jmp    10039c <readline+0xbb>
        }
        else if (c == '\b' && i > 0) {
  100350:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  100354:	75 1a                	jne    100370 <readline+0x8f>
  100356:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10035a:	7e 14                	jle    100370 <readline+0x8f>
            cputchar(c);
  10035c:	83 ec 0c             	sub    $0xc,%esp
  10035f:	ff 75 f0             	pushl  -0x10(%ebp)
  100362:	e8 fc fe ff ff       	call   100263 <cputchar>
  100367:	83 c4 10             	add    $0x10,%esp
            i --;
  10036a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  10036e:	eb 2c                	jmp    10039c <readline+0xbb>
        }
        else if (c == '\n' || c == '\r') {
  100370:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  100374:	74 06                	je     10037c <readline+0x9b>
  100376:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  10037a:	75 8b                	jne    100307 <readline+0x26>
            cputchar(c);
  10037c:	83 ec 0c             	sub    $0xc,%esp
  10037f:	ff 75 f0             	pushl  -0x10(%ebp)
  100382:	e8 dc fe ff ff       	call   100263 <cputchar>
  100387:	83 c4 10             	add    $0x10,%esp
            buf[i] = '\0';
  10038a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10038d:	05 40 ea 10 00       	add    $0x10ea40,%eax
  100392:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  100395:	b8 40 ea 10 00       	mov    $0x10ea40,%eax
  10039a:	eb 05                	jmp    1003a1 <readline+0xc0>
        }
    }
  10039c:	e9 66 ff ff ff       	jmp    100307 <readline+0x26>
}
  1003a1:	c9                   	leave  
  1003a2:	c3                   	ret    

001003a3 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  1003a3:	55                   	push   %ebp
  1003a4:	89 e5                	mov    %esp,%ebp
  1003a6:	83 ec 18             	sub    $0x18,%esp
    if (is_panic) {
  1003a9:	a1 40 ee 10 00       	mov    0x10ee40,%eax
  1003ae:	85 c0                	test   %eax,%eax
  1003b0:	75 4a                	jne    1003fc <__panic+0x59>
        goto panic_dead;
    }
    is_panic = 1;
  1003b2:	c7 05 40 ee 10 00 01 	movl   $0x1,0x10ee40
  1003b9:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  1003bc:	8d 45 14             	lea    0x14(%ebp),%eax
  1003bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  1003c2:	83 ec 04             	sub    $0x4,%esp
  1003c5:	ff 75 0c             	pushl  0xc(%ebp)
  1003c8:	ff 75 08             	pushl  0x8(%ebp)
  1003cb:	68 2a 33 10 00       	push   $0x10332a
  1003d0:	e8 68 fe ff ff       	call   10023d <cprintf>
  1003d5:	83 c4 10             	add    $0x10,%esp
    vcprintf(fmt, ap);
  1003d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003db:	83 ec 08             	sub    $0x8,%esp
  1003de:	50                   	push   %eax
  1003df:	ff 75 10             	pushl  0x10(%ebp)
  1003e2:	e8 2d fe ff ff       	call   100214 <vcprintf>
  1003e7:	83 c4 10             	add    $0x10,%esp
    cprintf("\n");
  1003ea:	83 ec 0c             	sub    $0xc,%esp
  1003ed:	68 46 33 10 00       	push   $0x103346
  1003f2:	e8 46 fe ff ff       	call   10023d <cprintf>
  1003f7:	83 c4 10             	add    $0x10,%esp
  1003fa:	eb 01                	jmp    1003fd <__panic+0x5a>
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
    if (is_panic) {
        goto panic_dead;
  1003fc:	90                   	nop
    vcprintf(fmt, ap);
    cprintf("\n");
    va_end(ap);

panic_dead:
    intr_disable();
  1003fd:	e8 cc 13 00 00       	call   1017ce <intr_disable>
    while (1) {
        kmonitor(NULL);
  100402:	83 ec 0c             	sub    $0xc,%esp
  100405:	6a 00                	push   $0x0
  100407:	e8 34 08 00 00       	call   100c40 <kmonitor>
  10040c:	83 c4 10             	add    $0x10,%esp
    }
  10040f:	eb f1                	jmp    100402 <__panic+0x5f>

00100411 <__warn>:
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100411:	55                   	push   %ebp
  100412:	89 e5                	mov    %esp,%ebp
  100414:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    va_start(ap, fmt);
  100417:	8d 45 14             	lea    0x14(%ebp),%eax
  10041a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  10041d:	83 ec 04             	sub    $0x4,%esp
  100420:	ff 75 0c             	pushl  0xc(%ebp)
  100423:	ff 75 08             	pushl  0x8(%ebp)
  100426:	68 48 33 10 00       	push   $0x103348
  10042b:	e8 0d fe ff ff       	call   10023d <cprintf>
  100430:	83 c4 10             	add    $0x10,%esp
    vcprintf(fmt, ap);
  100433:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100436:	83 ec 08             	sub    $0x8,%esp
  100439:	50                   	push   %eax
  10043a:	ff 75 10             	pushl  0x10(%ebp)
  10043d:	e8 d2 fd ff ff       	call   100214 <vcprintf>
  100442:	83 c4 10             	add    $0x10,%esp
    cprintf("\n");
  100445:	83 ec 0c             	sub    $0xc,%esp
  100448:	68 46 33 10 00       	push   $0x103346
  10044d:	e8 eb fd ff ff       	call   10023d <cprintf>
  100452:	83 c4 10             	add    $0x10,%esp
    va_end(ap);
}
  100455:	90                   	nop
  100456:	c9                   	leave  
  100457:	c3                   	ret    

00100458 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100458:	55                   	push   %ebp
  100459:	89 e5                	mov    %esp,%ebp
    return is_panic;
  10045b:	a1 40 ee 10 00       	mov    0x10ee40,%eax
}
  100460:	5d                   	pop    %ebp
  100461:	c3                   	ret    

00100462 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  100462:	55                   	push   %ebp
  100463:	89 e5                	mov    %esp,%ebp
  100465:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  100468:	8b 45 0c             	mov    0xc(%ebp),%eax
  10046b:	8b 00                	mov    (%eax),%eax
  10046d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100470:	8b 45 10             	mov    0x10(%ebp),%eax
  100473:	8b 00                	mov    (%eax),%eax
  100475:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100478:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  10047f:	e9 d2 00 00 00       	jmp    100556 <stab_binsearch+0xf4>
        int true_m = (l + r) / 2, m = true_m;
  100484:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100487:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10048a:	01 d0                	add    %edx,%eax
  10048c:	89 c2                	mov    %eax,%edx
  10048e:	c1 ea 1f             	shr    $0x1f,%edx
  100491:	01 d0                	add    %edx,%eax
  100493:	d1 f8                	sar    %eax
  100495:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100498:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10049b:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  10049e:	eb 04                	jmp    1004a4 <stab_binsearch+0x42>
            m --;
  1004a0:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)

    while (l <= r) {
        int true_m = (l + r) / 2, m = true_m;

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1004a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004a7:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004aa:	7c 1f                	jl     1004cb <stab_binsearch+0x69>
  1004ac:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004af:	89 d0                	mov    %edx,%eax
  1004b1:	01 c0                	add    %eax,%eax
  1004b3:	01 d0                	add    %edx,%eax
  1004b5:	c1 e0 02             	shl    $0x2,%eax
  1004b8:	89 c2                	mov    %eax,%edx
  1004ba:	8b 45 08             	mov    0x8(%ebp),%eax
  1004bd:	01 d0                	add    %edx,%eax
  1004bf:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004c3:	0f b6 c0             	movzbl %al,%eax
  1004c6:	3b 45 14             	cmp    0x14(%ebp),%eax
  1004c9:	75 d5                	jne    1004a0 <stab_binsearch+0x3e>
            m --;
        }
        if (m < l) {    // no match in [l, m]
  1004cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004ce:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004d1:	7d 0b                	jge    1004de <stab_binsearch+0x7c>
            l = true_m + 1;
  1004d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1004d6:	83 c0 01             	add    $0x1,%eax
  1004d9:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  1004dc:	eb 78                	jmp    100556 <stab_binsearch+0xf4>
        }

        // actual binary search
        any_matches = 1;
  1004de:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  1004e5:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004e8:	89 d0                	mov    %edx,%eax
  1004ea:	01 c0                	add    %eax,%eax
  1004ec:	01 d0                	add    %edx,%eax
  1004ee:	c1 e0 02             	shl    $0x2,%eax
  1004f1:	89 c2                	mov    %eax,%edx
  1004f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1004f6:	01 d0                	add    %edx,%eax
  1004f8:	8b 40 08             	mov    0x8(%eax),%eax
  1004fb:	3b 45 18             	cmp    0x18(%ebp),%eax
  1004fe:	73 13                	jae    100513 <stab_binsearch+0xb1>
            *region_left = m;
  100500:	8b 45 0c             	mov    0xc(%ebp),%eax
  100503:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100506:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100508:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10050b:	83 c0 01             	add    $0x1,%eax
  10050e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100511:	eb 43                	jmp    100556 <stab_binsearch+0xf4>
        } else if (stabs[m].n_value > addr) {
  100513:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100516:	89 d0                	mov    %edx,%eax
  100518:	01 c0                	add    %eax,%eax
  10051a:	01 d0                	add    %edx,%eax
  10051c:	c1 e0 02             	shl    $0x2,%eax
  10051f:	89 c2                	mov    %eax,%edx
  100521:	8b 45 08             	mov    0x8(%ebp),%eax
  100524:	01 d0                	add    %edx,%eax
  100526:	8b 40 08             	mov    0x8(%eax),%eax
  100529:	3b 45 18             	cmp    0x18(%ebp),%eax
  10052c:	76 16                	jbe    100544 <stab_binsearch+0xe2>
            *region_right = m - 1;
  10052e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100531:	8d 50 ff             	lea    -0x1(%eax),%edx
  100534:	8b 45 10             	mov    0x10(%ebp),%eax
  100537:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  100539:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10053c:	83 e8 01             	sub    $0x1,%eax
  10053f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100542:	eb 12                	jmp    100556 <stab_binsearch+0xf4>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  100544:	8b 45 0c             	mov    0xc(%ebp),%eax
  100547:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10054a:	89 10                	mov    %edx,(%eax)
            l = m;
  10054c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10054f:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  100552:	83 45 18 01          	addl   $0x1,0x18(%ebp)
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
    int l = *region_left, r = *region_right, any_matches = 0;

    while (l <= r) {
  100556:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100559:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  10055c:	0f 8e 22 ff ff ff    	jle    100484 <stab_binsearch+0x22>
            l = m;
            addr ++;
        }
    }

    if (!any_matches) {
  100562:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100566:	75 0f                	jne    100577 <stab_binsearch+0x115>
        *region_right = *region_left - 1;
  100568:	8b 45 0c             	mov    0xc(%ebp),%eax
  10056b:	8b 00                	mov    (%eax),%eax
  10056d:	8d 50 ff             	lea    -0x1(%eax),%edx
  100570:	8b 45 10             	mov    0x10(%ebp),%eax
  100573:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  100575:	eb 3f                	jmp    1005b6 <stab_binsearch+0x154>
    if (!any_matches) {
        *region_right = *region_left - 1;
    }
    else {
        // find rightmost region containing 'addr'
        l = *region_right;
  100577:	8b 45 10             	mov    0x10(%ebp),%eax
  10057a:	8b 00                	mov    (%eax),%eax
  10057c:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  10057f:	eb 04                	jmp    100585 <stab_binsearch+0x123>
  100581:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  100585:	8b 45 0c             	mov    0xc(%ebp),%eax
  100588:	8b 00                	mov    (%eax),%eax
  10058a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  10058d:	7d 1f                	jge    1005ae <stab_binsearch+0x14c>
  10058f:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100592:	89 d0                	mov    %edx,%eax
  100594:	01 c0                	add    %eax,%eax
  100596:	01 d0                	add    %edx,%eax
  100598:	c1 e0 02             	shl    $0x2,%eax
  10059b:	89 c2                	mov    %eax,%edx
  10059d:	8b 45 08             	mov    0x8(%ebp),%eax
  1005a0:	01 d0                	add    %edx,%eax
  1005a2:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1005a6:	0f b6 c0             	movzbl %al,%eax
  1005a9:	3b 45 14             	cmp    0x14(%ebp),%eax
  1005ac:	75 d3                	jne    100581 <stab_binsearch+0x11f>
            /* do nothing */;
        *region_left = l;
  1005ae:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005b1:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005b4:	89 10                	mov    %edx,(%eax)
    }
}
  1005b6:	90                   	nop
  1005b7:	c9                   	leave  
  1005b8:	c3                   	ret    

001005b9 <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  1005b9:	55                   	push   %ebp
  1005ba:	89 e5                	mov    %esp,%ebp
  1005bc:	83 ec 38             	sub    $0x38,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  1005bf:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005c2:	c7 00 68 33 10 00    	movl   $0x103368,(%eax)
    info->eip_line = 0;
  1005c8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005cb:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  1005d2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005d5:	c7 40 08 68 33 10 00 	movl   $0x103368,0x8(%eax)
    info->eip_fn_namelen = 9;
  1005dc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005df:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  1005e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005e9:	8b 55 08             	mov    0x8(%ebp),%edx
  1005ec:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  1005ef:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005f2:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  1005f9:	c7 45 f4 8c 3b 10 00 	movl   $0x103b8c,-0xc(%ebp)
    stab_end = __STAB_END__;
  100600:	c7 45 f0 10 b4 10 00 	movl   $0x10b410,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  100607:	c7 45 ec 11 b4 10 00 	movl   $0x10b411,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  10060e:	c7 45 e8 45 d4 10 00 	movl   $0x10d445,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  100615:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100618:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  10061b:	76 0d                	jbe    10062a <debuginfo_eip+0x71>
  10061d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100620:	83 e8 01             	sub    $0x1,%eax
  100623:	0f b6 00             	movzbl (%eax),%eax
  100626:	84 c0                	test   %al,%al
  100628:	74 0a                	je     100634 <debuginfo_eip+0x7b>
        return -1;
  10062a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10062f:	e9 91 02 00 00       	jmp    1008c5 <debuginfo_eip+0x30c>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100634:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10063b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10063e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100641:	29 c2                	sub    %eax,%edx
  100643:	89 d0                	mov    %edx,%eax
  100645:	c1 f8 02             	sar    $0x2,%eax
  100648:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  10064e:	83 e8 01             	sub    $0x1,%eax
  100651:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  100654:	ff 75 08             	pushl  0x8(%ebp)
  100657:	6a 64                	push   $0x64
  100659:	8d 45 e0             	lea    -0x20(%ebp),%eax
  10065c:	50                   	push   %eax
  10065d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  100660:	50                   	push   %eax
  100661:	ff 75 f4             	pushl  -0xc(%ebp)
  100664:	e8 f9 fd ff ff       	call   100462 <stab_binsearch>
  100669:	83 c4 14             	add    $0x14,%esp
    if (lfile == 0)
  10066c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10066f:	85 c0                	test   %eax,%eax
  100671:	75 0a                	jne    10067d <debuginfo_eip+0xc4>
        return -1;
  100673:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100678:	e9 48 02 00 00       	jmp    1008c5 <debuginfo_eip+0x30c>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  10067d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100680:	89 45 dc             	mov    %eax,-0x24(%ebp)
  100683:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100686:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  100689:	ff 75 08             	pushl  0x8(%ebp)
  10068c:	6a 24                	push   $0x24
  10068e:	8d 45 d8             	lea    -0x28(%ebp),%eax
  100691:	50                   	push   %eax
  100692:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100695:	50                   	push   %eax
  100696:	ff 75 f4             	pushl  -0xc(%ebp)
  100699:	e8 c4 fd ff ff       	call   100462 <stab_binsearch>
  10069e:	83 c4 14             	add    $0x14,%esp

    if (lfun <= rfun) {
  1006a1:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1006a4:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1006a7:	39 c2                	cmp    %eax,%edx
  1006a9:	7f 7c                	jg     100727 <debuginfo_eip+0x16e>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  1006ab:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006ae:	89 c2                	mov    %eax,%edx
  1006b0:	89 d0                	mov    %edx,%eax
  1006b2:	01 c0                	add    %eax,%eax
  1006b4:	01 d0                	add    %edx,%eax
  1006b6:	c1 e0 02             	shl    $0x2,%eax
  1006b9:	89 c2                	mov    %eax,%edx
  1006bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006be:	01 d0                	add    %edx,%eax
  1006c0:	8b 00                	mov    (%eax),%eax
  1006c2:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  1006c5:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1006c8:	29 d1                	sub    %edx,%ecx
  1006ca:	89 ca                	mov    %ecx,%edx
  1006cc:	39 d0                	cmp    %edx,%eax
  1006ce:	73 22                	jae    1006f2 <debuginfo_eip+0x139>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  1006d0:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006d3:	89 c2                	mov    %eax,%edx
  1006d5:	89 d0                	mov    %edx,%eax
  1006d7:	01 c0                	add    %eax,%eax
  1006d9:	01 d0                	add    %edx,%eax
  1006db:	c1 e0 02             	shl    $0x2,%eax
  1006de:	89 c2                	mov    %eax,%edx
  1006e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006e3:	01 d0                	add    %edx,%eax
  1006e5:	8b 10                	mov    (%eax),%edx
  1006e7:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1006ea:	01 c2                	add    %eax,%edx
  1006ec:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006ef:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  1006f2:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006f5:	89 c2                	mov    %eax,%edx
  1006f7:	89 d0                	mov    %edx,%eax
  1006f9:	01 c0                	add    %eax,%eax
  1006fb:	01 d0                	add    %edx,%eax
  1006fd:	c1 e0 02             	shl    $0x2,%eax
  100700:	89 c2                	mov    %eax,%edx
  100702:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100705:	01 d0                	add    %edx,%eax
  100707:	8b 50 08             	mov    0x8(%eax),%edx
  10070a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10070d:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100710:	8b 45 0c             	mov    0xc(%ebp),%eax
  100713:	8b 40 10             	mov    0x10(%eax),%eax
  100716:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  100719:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10071c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  10071f:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100722:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100725:	eb 15                	jmp    10073c <debuginfo_eip+0x183>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  100727:	8b 45 0c             	mov    0xc(%ebp),%eax
  10072a:	8b 55 08             	mov    0x8(%ebp),%edx
  10072d:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  100730:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100733:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  100736:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100739:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  10073c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10073f:	8b 40 08             	mov    0x8(%eax),%eax
  100742:	83 ec 08             	sub    $0x8,%esp
  100745:	6a 3a                	push   $0x3a
  100747:	50                   	push   %eax
  100748:	e8 f3 21 00 00       	call   102940 <strfind>
  10074d:	83 c4 10             	add    $0x10,%esp
  100750:	89 c2                	mov    %eax,%edx
  100752:	8b 45 0c             	mov    0xc(%ebp),%eax
  100755:	8b 40 08             	mov    0x8(%eax),%eax
  100758:	29 c2                	sub    %eax,%edx
  10075a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10075d:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  100760:	83 ec 0c             	sub    $0xc,%esp
  100763:	ff 75 08             	pushl  0x8(%ebp)
  100766:	6a 44                	push   $0x44
  100768:	8d 45 d0             	lea    -0x30(%ebp),%eax
  10076b:	50                   	push   %eax
  10076c:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  10076f:	50                   	push   %eax
  100770:	ff 75 f4             	pushl  -0xc(%ebp)
  100773:	e8 ea fc ff ff       	call   100462 <stab_binsearch>
  100778:	83 c4 20             	add    $0x20,%esp
    if (lline <= rline) {
  10077b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10077e:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100781:	39 c2                	cmp    %eax,%edx
  100783:	7f 24                	jg     1007a9 <debuginfo_eip+0x1f0>
        info->eip_line = stabs[rline].n_desc;
  100785:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100788:	89 c2                	mov    %eax,%edx
  10078a:	89 d0                	mov    %edx,%eax
  10078c:	01 c0                	add    %eax,%eax
  10078e:	01 d0                	add    %edx,%eax
  100790:	c1 e0 02             	shl    $0x2,%eax
  100793:	89 c2                	mov    %eax,%edx
  100795:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100798:	01 d0                	add    %edx,%eax
  10079a:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  10079e:	0f b7 d0             	movzwl %ax,%edx
  1007a1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007a4:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  1007a7:	eb 13                	jmp    1007bc <debuginfo_eip+0x203>
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
    if (lline <= rline) {
        info->eip_line = stabs[rline].n_desc;
    } else {
        return -1;
  1007a9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1007ae:	e9 12 01 00 00       	jmp    1008c5 <debuginfo_eip+0x30c>
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  1007b3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007b6:	83 e8 01             	sub    $0x1,%eax
  1007b9:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  1007bc:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007bf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007c2:	39 c2                	cmp    %eax,%edx
  1007c4:	7c 56                	jl     10081c <debuginfo_eip+0x263>
           && stabs[lline].n_type != N_SOL
  1007c6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007c9:	89 c2                	mov    %eax,%edx
  1007cb:	89 d0                	mov    %edx,%eax
  1007cd:	01 c0                	add    %eax,%eax
  1007cf:	01 d0                	add    %edx,%eax
  1007d1:	c1 e0 02             	shl    $0x2,%eax
  1007d4:	89 c2                	mov    %eax,%edx
  1007d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007d9:	01 d0                	add    %edx,%eax
  1007db:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1007df:	3c 84                	cmp    $0x84,%al
  1007e1:	74 39                	je     10081c <debuginfo_eip+0x263>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  1007e3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007e6:	89 c2                	mov    %eax,%edx
  1007e8:	89 d0                	mov    %edx,%eax
  1007ea:	01 c0                	add    %eax,%eax
  1007ec:	01 d0                	add    %edx,%eax
  1007ee:	c1 e0 02             	shl    $0x2,%eax
  1007f1:	89 c2                	mov    %eax,%edx
  1007f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007f6:	01 d0                	add    %edx,%eax
  1007f8:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1007fc:	3c 64                	cmp    $0x64,%al
  1007fe:	75 b3                	jne    1007b3 <debuginfo_eip+0x1fa>
  100800:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100803:	89 c2                	mov    %eax,%edx
  100805:	89 d0                	mov    %edx,%eax
  100807:	01 c0                	add    %eax,%eax
  100809:	01 d0                	add    %edx,%eax
  10080b:	c1 e0 02             	shl    $0x2,%eax
  10080e:	89 c2                	mov    %eax,%edx
  100810:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100813:	01 d0                	add    %edx,%eax
  100815:	8b 40 08             	mov    0x8(%eax),%eax
  100818:	85 c0                	test   %eax,%eax
  10081a:	74 97                	je     1007b3 <debuginfo_eip+0x1fa>
        lline --;
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  10081c:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10081f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100822:	39 c2                	cmp    %eax,%edx
  100824:	7c 46                	jl     10086c <debuginfo_eip+0x2b3>
  100826:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100829:	89 c2                	mov    %eax,%edx
  10082b:	89 d0                	mov    %edx,%eax
  10082d:	01 c0                	add    %eax,%eax
  10082f:	01 d0                	add    %edx,%eax
  100831:	c1 e0 02             	shl    $0x2,%eax
  100834:	89 c2                	mov    %eax,%edx
  100836:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100839:	01 d0                	add    %edx,%eax
  10083b:	8b 00                	mov    (%eax),%eax
  10083d:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  100840:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100843:	29 d1                	sub    %edx,%ecx
  100845:	89 ca                	mov    %ecx,%edx
  100847:	39 d0                	cmp    %edx,%eax
  100849:	73 21                	jae    10086c <debuginfo_eip+0x2b3>
        info->eip_file = stabstr + stabs[lline].n_strx;
  10084b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10084e:	89 c2                	mov    %eax,%edx
  100850:	89 d0                	mov    %edx,%eax
  100852:	01 c0                	add    %eax,%eax
  100854:	01 d0                	add    %edx,%eax
  100856:	c1 e0 02             	shl    $0x2,%eax
  100859:	89 c2                	mov    %eax,%edx
  10085b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10085e:	01 d0                	add    %edx,%eax
  100860:	8b 10                	mov    (%eax),%edx
  100862:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100865:	01 c2                	add    %eax,%edx
  100867:	8b 45 0c             	mov    0xc(%ebp),%eax
  10086a:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  10086c:	8b 55 dc             	mov    -0x24(%ebp),%edx
  10086f:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100872:	39 c2                	cmp    %eax,%edx
  100874:	7d 4a                	jge    1008c0 <debuginfo_eip+0x307>
        for (lline = lfun + 1;
  100876:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100879:	83 c0 01             	add    $0x1,%eax
  10087c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  10087f:	eb 18                	jmp    100899 <debuginfo_eip+0x2e0>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  100881:	8b 45 0c             	mov    0xc(%ebp),%eax
  100884:	8b 40 14             	mov    0x14(%eax),%eax
  100887:	8d 50 01             	lea    0x1(%eax),%edx
  10088a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10088d:	89 50 14             	mov    %edx,0x14(%eax)
    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
  100890:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100893:	83 c0 01             	add    $0x1,%eax
  100896:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100899:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10089c:	8b 45 d8             	mov    -0x28(%ebp),%eax
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
  10089f:	39 c2                	cmp    %eax,%edx
  1008a1:	7d 1d                	jge    1008c0 <debuginfo_eip+0x307>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1008a3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008a6:	89 c2                	mov    %eax,%edx
  1008a8:	89 d0                	mov    %edx,%eax
  1008aa:	01 c0                	add    %eax,%eax
  1008ac:	01 d0                	add    %edx,%eax
  1008ae:	c1 e0 02             	shl    $0x2,%eax
  1008b1:	89 c2                	mov    %eax,%edx
  1008b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008b6:	01 d0                	add    %edx,%eax
  1008b8:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1008bc:	3c a0                	cmp    $0xa0,%al
  1008be:	74 c1                	je     100881 <debuginfo_eip+0x2c8>
             lline ++) {
            info->eip_fn_narg ++;
        }
    }
    return 0;
  1008c0:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1008c5:	c9                   	leave  
  1008c6:	c3                   	ret    

001008c7 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  1008c7:	55                   	push   %ebp
  1008c8:	89 e5                	mov    %esp,%ebp
  1008ca:	83 ec 08             	sub    $0x8,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  1008cd:	83 ec 0c             	sub    $0xc,%esp
  1008d0:	68 72 33 10 00       	push   $0x103372
  1008d5:	e8 63 f9 ff ff       	call   10023d <cprintf>
  1008da:	83 c4 10             	add    $0x10,%esp
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  1008dd:	83 ec 08             	sub    $0x8,%esp
  1008e0:	68 00 00 10 00       	push   $0x100000
  1008e5:	68 8b 33 10 00       	push   $0x10338b
  1008ea:	e8 4e f9 ff ff       	call   10023d <cprintf>
  1008ef:	83 c4 10             	add    $0x10,%esp
    cprintf("  etext  0x%08x (phys)\n", etext);
  1008f2:	83 ec 08             	sub    $0x8,%esp
  1008f5:	68 63 32 10 00       	push   $0x103263
  1008fa:	68 a3 33 10 00       	push   $0x1033a3
  1008ff:	e8 39 f9 ff ff       	call   10023d <cprintf>
  100904:	83 c4 10             	add    $0x10,%esp
    cprintf("  edata  0x%08x (phys)\n", edata);
  100907:	83 ec 08             	sub    $0x8,%esp
  10090a:	68 16 ea 10 00       	push   $0x10ea16
  10090f:	68 bb 33 10 00       	push   $0x1033bb
  100914:	e8 24 f9 ff ff       	call   10023d <cprintf>
  100919:	83 c4 10             	add    $0x10,%esp
    cprintf("  end    0x%08x (phys)\n", end);
  10091c:	83 ec 08             	sub    $0x8,%esp
  10091f:	68 20 fd 10 00       	push   $0x10fd20
  100924:	68 d3 33 10 00       	push   $0x1033d3
  100929:	e8 0f f9 ff ff       	call   10023d <cprintf>
  10092e:	83 c4 10             	add    $0x10,%esp
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  100931:	b8 20 fd 10 00       	mov    $0x10fd20,%eax
  100936:	05 ff 03 00 00       	add    $0x3ff,%eax
  10093b:	ba 00 00 10 00       	mov    $0x100000,%edx
  100940:	29 d0                	sub    %edx,%eax
  100942:	99                   	cltd   
  100943:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
  100949:	01 d0                	add    %edx,%eax
  10094b:	c1 f8 0a             	sar    $0xa,%eax
  10094e:	83 ec 08             	sub    $0x8,%esp
  100951:	50                   	push   %eax
  100952:	68 ec 33 10 00       	push   $0x1033ec
  100957:	e8 e1 f8 ff ff       	call   10023d <cprintf>
  10095c:	83 c4 10             	add    $0x10,%esp
}
  10095f:	90                   	nop
  100960:	c9                   	leave  
  100961:	c3                   	ret    

00100962 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  100962:	55                   	push   %ebp
  100963:	89 e5                	mov    %esp,%ebp
  100965:	81 ec 28 01 00 00    	sub    $0x128,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  10096b:	83 ec 08             	sub    $0x8,%esp
  10096e:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100971:	50                   	push   %eax
  100972:	ff 75 08             	pushl  0x8(%ebp)
  100975:	e8 3f fc ff ff       	call   1005b9 <debuginfo_eip>
  10097a:	83 c4 10             	add    $0x10,%esp
  10097d:	85 c0                	test   %eax,%eax
  10097f:	74 15                	je     100996 <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  100981:	83 ec 08             	sub    $0x8,%esp
  100984:	ff 75 08             	pushl  0x8(%ebp)
  100987:	68 16 34 10 00       	push   $0x103416
  10098c:	e8 ac f8 ff ff       	call   10023d <cprintf>
  100991:	83 c4 10             	add    $0x10,%esp
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  100994:	eb 65                	jmp    1009fb <print_debuginfo+0x99>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100996:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10099d:	eb 1c                	jmp    1009bb <print_debuginfo+0x59>
            fnname[j] = info.eip_fn_name[j];
  10099f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1009a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009a5:	01 d0                	add    %edx,%eax
  1009a7:	0f b6 00             	movzbl (%eax),%eax
  1009aa:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  1009b0:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1009b3:	01 ca                	add    %ecx,%edx
  1009b5:	88 02                	mov    %al,(%edx)
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1009b7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1009bb:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009be:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  1009c1:	7f dc                	jg     10099f <print_debuginfo+0x3d>
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
  1009c3:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  1009c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009cc:	01 d0                	add    %edx,%eax
  1009ce:	c6 00 00             	movb   $0x0,(%eax)
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
  1009d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  1009d4:	8b 55 08             	mov    0x8(%ebp),%edx
  1009d7:	89 d1                	mov    %edx,%ecx
  1009d9:	29 c1                	sub    %eax,%ecx
  1009db:	8b 55 e0             	mov    -0x20(%ebp),%edx
  1009de:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1009e1:	83 ec 0c             	sub    $0xc,%esp
  1009e4:	51                   	push   %ecx
  1009e5:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  1009eb:	51                   	push   %ecx
  1009ec:	52                   	push   %edx
  1009ed:	50                   	push   %eax
  1009ee:	68 32 34 10 00       	push   $0x103432
  1009f3:	e8 45 f8 ff ff       	call   10023d <cprintf>
  1009f8:	83 c4 20             	add    $0x20,%esp
                fnname, eip - info.eip_fn_addr);
    }
}
  1009fb:	90                   	nop
  1009fc:	c9                   	leave  
  1009fd:	c3                   	ret    

001009fe <read_eip>:

static __noinline uint32_t
read_eip(void) {
  1009fe:	55                   	push   %ebp
  1009ff:	89 e5                	mov    %esp,%ebp
  100a01:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100a04:	8b 45 04             	mov    0x4(%ebp),%eax
  100a07:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100a0a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100a0d:	c9                   	leave  
  100a0e:	c3                   	ret    

00100a0f <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100a0f:	55                   	push   %ebp
  100a10:	89 e5                	mov    %esp,%ebp
  100a12:	83 ec 28             	sub    $0x28,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100a15:	89 e8                	mov    %ebp,%eax
  100a17:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return ebp;
  100a1a:	8b 45 e0             	mov    -0x20(%ebp),%eax
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
    uint32_t ebp = read_ebp(), eip = read_eip();
  100a1d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100a20:	e8 d9 ff ff ff       	call   1009fe <read_eip>
  100a25:	89 45 f0             	mov    %eax,-0x10(%ebp)

    int i, j;
    for (i = 0; ebp != 0 && i < STACKFRAME_DEPTH; i ++) {
  100a28:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  100a2f:	e9 8d 00 00 00       	jmp    100ac1 <print_stackframe+0xb2>
        cprintf("ebp:0x%08x eip:0x%08x args:", ebp, eip);
  100a34:	83 ec 04             	sub    $0x4,%esp
  100a37:	ff 75 f0             	pushl  -0x10(%ebp)
  100a3a:	ff 75 f4             	pushl  -0xc(%ebp)
  100a3d:	68 44 34 10 00       	push   $0x103444
  100a42:	e8 f6 f7 ff ff       	call   10023d <cprintf>
  100a47:	83 c4 10             	add    $0x10,%esp
        uint32_t *args = (uint32_t *)ebp + 2;
  100a4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a4d:	83 c0 08             	add    $0x8,%eax
  100a50:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        for (j = 0; j < 4; j ++) {
  100a53:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  100a5a:	eb 26                	jmp    100a82 <print_stackframe+0x73>
            cprintf("0x%08x ", args[j]);
  100a5c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a5f:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100a66:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100a69:	01 d0                	add    %edx,%eax
  100a6b:	8b 00                	mov    (%eax),%eax
  100a6d:	83 ec 08             	sub    $0x8,%esp
  100a70:	50                   	push   %eax
  100a71:	68 60 34 10 00       	push   $0x103460
  100a76:	e8 c2 f7 ff ff       	call   10023d <cprintf>
  100a7b:	83 c4 10             	add    $0x10,%esp

    int i, j;
    for (i = 0; ebp != 0 && i < STACKFRAME_DEPTH; i ++) {
        cprintf("ebp:0x%08x eip:0x%08x args:", ebp, eip);
        uint32_t *args = (uint32_t *)ebp + 2;
        for (j = 0; j < 4; j ++) {
  100a7e:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
  100a82:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  100a86:	7e d4                	jle    100a5c <print_stackframe+0x4d>
            cprintf("0x%08x ", args[j]);
        }
        cprintf("\n");
  100a88:	83 ec 0c             	sub    $0xc,%esp
  100a8b:	68 68 34 10 00       	push   $0x103468
  100a90:	e8 a8 f7 ff ff       	call   10023d <cprintf>
  100a95:	83 c4 10             	add    $0x10,%esp
        print_debuginfo(eip - 1);
  100a98:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a9b:	83 e8 01             	sub    $0x1,%eax
  100a9e:	83 ec 0c             	sub    $0xc,%esp
  100aa1:	50                   	push   %eax
  100aa2:	e8 bb fe ff ff       	call   100962 <print_debuginfo>
  100aa7:	83 c4 10             	add    $0x10,%esp
        eip = ((uint32_t *)ebp)[1];
  100aaa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100aad:	83 c0 04             	add    $0x4,%eax
  100ab0:	8b 00                	mov    (%eax),%eax
  100ab2:	89 45 f0             	mov    %eax,-0x10(%ebp)
        ebp = ((uint32_t *)ebp)[0];
  100ab5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ab8:	8b 00                	mov    (%eax),%eax
  100aba:	89 45 f4             	mov    %eax,-0xc(%ebp)
      *                   the calling funciton's ebp = ss:[ebp]
      */
    uint32_t ebp = read_ebp(), eip = read_eip();

    int i, j;
    for (i = 0; ebp != 0 && i < STACKFRAME_DEPTH; i ++) {
  100abd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  100ac1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100ac5:	74 0a                	je     100ad1 <print_stackframe+0xc2>
  100ac7:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100acb:	0f 8e 63 ff ff ff    	jle    100a34 <print_stackframe+0x25>
        cprintf("\n");
        print_debuginfo(eip - 1);
        eip = ((uint32_t *)ebp)[1];
        ebp = ((uint32_t *)ebp)[0];
    }
}
  100ad1:	90                   	nop
  100ad2:	c9                   	leave  
  100ad3:	c3                   	ret    

00100ad4 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100ad4:	55                   	push   %ebp
  100ad5:	89 e5                	mov    %esp,%ebp
  100ad7:	83 ec 18             	sub    $0x18,%esp
    int argc = 0;
  100ada:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100ae1:	eb 0c                	jmp    100aef <parse+0x1b>
            *buf ++ = '\0';
  100ae3:	8b 45 08             	mov    0x8(%ebp),%eax
  100ae6:	8d 50 01             	lea    0x1(%eax),%edx
  100ae9:	89 55 08             	mov    %edx,0x8(%ebp)
  100aec:	c6 00 00             	movb   $0x0,(%eax)
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100aef:	8b 45 08             	mov    0x8(%ebp),%eax
  100af2:	0f b6 00             	movzbl (%eax),%eax
  100af5:	84 c0                	test   %al,%al
  100af7:	74 1e                	je     100b17 <parse+0x43>
  100af9:	8b 45 08             	mov    0x8(%ebp),%eax
  100afc:	0f b6 00             	movzbl (%eax),%eax
  100aff:	0f be c0             	movsbl %al,%eax
  100b02:	83 ec 08             	sub    $0x8,%esp
  100b05:	50                   	push   %eax
  100b06:	68 ec 34 10 00       	push   $0x1034ec
  100b0b:	e8 fd 1d 00 00       	call   10290d <strchr>
  100b10:	83 c4 10             	add    $0x10,%esp
  100b13:	85 c0                	test   %eax,%eax
  100b15:	75 cc                	jne    100ae3 <parse+0xf>
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
  100b17:	8b 45 08             	mov    0x8(%ebp),%eax
  100b1a:	0f b6 00             	movzbl (%eax),%eax
  100b1d:	84 c0                	test   %al,%al
  100b1f:	74 69                	je     100b8a <parse+0xb6>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100b21:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100b25:	75 12                	jne    100b39 <parse+0x65>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100b27:	83 ec 08             	sub    $0x8,%esp
  100b2a:	6a 10                	push   $0x10
  100b2c:	68 f1 34 10 00       	push   $0x1034f1
  100b31:	e8 07 f7 ff ff       	call   10023d <cprintf>
  100b36:	83 c4 10             	add    $0x10,%esp
        }
        argv[argc ++] = buf;
  100b39:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b3c:	8d 50 01             	lea    0x1(%eax),%edx
  100b3f:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100b42:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100b49:	8b 45 0c             	mov    0xc(%ebp),%eax
  100b4c:	01 c2                	add    %eax,%edx
  100b4e:	8b 45 08             	mov    0x8(%ebp),%eax
  100b51:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100b53:	eb 04                	jmp    100b59 <parse+0x85>
            buf ++;
  100b55:	83 45 08 01          	addl   $0x1,0x8(%ebp)
        // save and scan past next arg
        if (argc == MAXARGS - 1) {
            cprintf("Too many arguments (max %d).\n", MAXARGS);
        }
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100b59:	8b 45 08             	mov    0x8(%ebp),%eax
  100b5c:	0f b6 00             	movzbl (%eax),%eax
  100b5f:	84 c0                	test   %al,%al
  100b61:	0f 84 7a ff ff ff    	je     100ae1 <parse+0xd>
  100b67:	8b 45 08             	mov    0x8(%ebp),%eax
  100b6a:	0f b6 00             	movzbl (%eax),%eax
  100b6d:	0f be c0             	movsbl %al,%eax
  100b70:	83 ec 08             	sub    $0x8,%esp
  100b73:	50                   	push   %eax
  100b74:	68 ec 34 10 00       	push   $0x1034ec
  100b79:	e8 8f 1d 00 00       	call   10290d <strchr>
  100b7e:	83 c4 10             	add    $0x10,%esp
  100b81:	85 c0                	test   %eax,%eax
  100b83:	74 d0                	je     100b55 <parse+0x81>
            buf ++;
        }
    }
  100b85:	e9 57 ff ff ff       	jmp    100ae1 <parse+0xd>
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
            break;
  100b8a:	90                   	nop
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
            buf ++;
        }
    }
    return argc;
  100b8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100b8e:	c9                   	leave  
  100b8f:	c3                   	ret    

00100b90 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100b90:	55                   	push   %ebp
  100b91:	89 e5                	mov    %esp,%ebp
  100b93:	83 ec 58             	sub    $0x58,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100b96:	83 ec 08             	sub    $0x8,%esp
  100b99:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100b9c:	50                   	push   %eax
  100b9d:	ff 75 08             	pushl  0x8(%ebp)
  100ba0:	e8 2f ff ff ff       	call   100ad4 <parse>
  100ba5:	83 c4 10             	add    $0x10,%esp
  100ba8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100bab:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100baf:	75 0a                	jne    100bbb <runcmd+0x2b>
        return 0;
  100bb1:	b8 00 00 00 00       	mov    $0x0,%eax
  100bb6:	e9 83 00 00 00       	jmp    100c3e <runcmd+0xae>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100bbb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100bc2:	eb 59                	jmp    100c1d <runcmd+0x8d>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100bc4:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100bc7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100bca:	89 d0                	mov    %edx,%eax
  100bcc:	01 c0                	add    %eax,%eax
  100bce:	01 d0                	add    %edx,%eax
  100bd0:	c1 e0 02             	shl    $0x2,%eax
  100bd3:	05 00 e0 10 00       	add    $0x10e000,%eax
  100bd8:	8b 00                	mov    (%eax),%eax
  100bda:	83 ec 08             	sub    $0x8,%esp
  100bdd:	51                   	push   %ecx
  100bde:	50                   	push   %eax
  100bdf:	e8 89 1c 00 00       	call   10286d <strcmp>
  100be4:	83 c4 10             	add    $0x10,%esp
  100be7:	85 c0                	test   %eax,%eax
  100be9:	75 2e                	jne    100c19 <runcmd+0x89>
            return commands[i].func(argc - 1, argv + 1, tf);
  100beb:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100bee:	89 d0                	mov    %edx,%eax
  100bf0:	01 c0                	add    %eax,%eax
  100bf2:	01 d0                	add    %edx,%eax
  100bf4:	c1 e0 02             	shl    $0x2,%eax
  100bf7:	05 08 e0 10 00       	add    $0x10e008,%eax
  100bfc:	8b 10                	mov    (%eax),%edx
  100bfe:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c01:	83 c0 04             	add    $0x4,%eax
  100c04:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100c07:	83 e9 01             	sub    $0x1,%ecx
  100c0a:	83 ec 04             	sub    $0x4,%esp
  100c0d:	ff 75 0c             	pushl  0xc(%ebp)
  100c10:	50                   	push   %eax
  100c11:	51                   	push   %ecx
  100c12:	ff d2                	call   *%edx
  100c14:	83 c4 10             	add    $0x10,%esp
  100c17:	eb 25                	jmp    100c3e <runcmd+0xae>
    int argc = parse(buf, argv);
    if (argc == 0) {
        return 0;
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c19:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100c1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c20:	83 f8 02             	cmp    $0x2,%eax
  100c23:	76 9f                	jbe    100bc4 <runcmd+0x34>
        if (strcmp(commands[i].name, argv[0]) == 0) {
            return commands[i].func(argc - 1, argv + 1, tf);
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100c25:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100c28:	83 ec 08             	sub    $0x8,%esp
  100c2b:	50                   	push   %eax
  100c2c:	68 0f 35 10 00       	push   $0x10350f
  100c31:	e8 07 f6 ff ff       	call   10023d <cprintf>
  100c36:	83 c4 10             	add    $0x10,%esp
    return 0;
  100c39:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c3e:	c9                   	leave  
  100c3f:	c3                   	ret    

00100c40 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100c40:	55                   	push   %ebp
  100c41:	89 e5                	mov    %esp,%ebp
  100c43:	83 ec 18             	sub    $0x18,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100c46:	83 ec 0c             	sub    $0xc,%esp
  100c49:	68 28 35 10 00       	push   $0x103528
  100c4e:	e8 ea f5 ff ff       	call   10023d <cprintf>
  100c53:	83 c4 10             	add    $0x10,%esp
    cprintf("Type 'help' for a list of commands.\n");
  100c56:	83 ec 0c             	sub    $0xc,%esp
  100c59:	68 50 35 10 00       	push   $0x103550
  100c5e:	e8 da f5 ff ff       	call   10023d <cprintf>
  100c63:	83 c4 10             	add    $0x10,%esp

    if (tf != NULL) {
  100c66:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100c6a:	74 0e                	je     100c7a <kmonitor+0x3a>
        print_trapframe(tf);
  100c6c:	83 ec 0c             	sub    $0xc,%esp
  100c6f:	ff 75 08             	pushl  0x8(%ebp)
  100c72:	e8 c6 0b 00 00       	call   10183d <print_trapframe>
  100c77:	83 c4 10             	add    $0x10,%esp
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100c7a:	83 ec 0c             	sub    $0xc,%esp
  100c7d:	68 75 35 10 00       	push   $0x103575
  100c82:	e8 5a f6 ff ff       	call   1002e1 <readline>
  100c87:	83 c4 10             	add    $0x10,%esp
  100c8a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100c8d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100c91:	74 e7                	je     100c7a <kmonitor+0x3a>
            if (runcmd(buf, tf) < 0) {
  100c93:	83 ec 08             	sub    $0x8,%esp
  100c96:	ff 75 08             	pushl  0x8(%ebp)
  100c99:	ff 75 f4             	pushl  -0xc(%ebp)
  100c9c:	e8 ef fe ff ff       	call   100b90 <runcmd>
  100ca1:	83 c4 10             	add    $0x10,%esp
  100ca4:	85 c0                	test   %eax,%eax
  100ca6:	78 02                	js     100caa <kmonitor+0x6a>
                break;
            }
        }
    }
  100ca8:	eb d0                	jmp    100c7a <kmonitor+0x3a>

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
            if (runcmd(buf, tf) < 0) {
                break;
  100caa:	90                   	nop
            }
        }
    }
}
  100cab:	90                   	nop
  100cac:	c9                   	leave  
  100cad:	c3                   	ret    

00100cae <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100cae:	55                   	push   %ebp
  100caf:	89 e5                	mov    %esp,%ebp
  100cb1:	83 ec 18             	sub    $0x18,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100cb4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100cbb:	eb 3c                	jmp    100cf9 <mon_help+0x4b>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100cbd:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100cc0:	89 d0                	mov    %edx,%eax
  100cc2:	01 c0                	add    %eax,%eax
  100cc4:	01 d0                	add    %edx,%eax
  100cc6:	c1 e0 02             	shl    $0x2,%eax
  100cc9:	05 04 e0 10 00       	add    $0x10e004,%eax
  100cce:	8b 08                	mov    (%eax),%ecx
  100cd0:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100cd3:	89 d0                	mov    %edx,%eax
  100cd5:	01 c0                	add    %eax,%eax
  100cd7:	01 d0                	add    %edx,%eax
  100cd9:	c1 e0 02             	shl    $0x2,%eax
  100cdc:	05 00 e0 10 00       	add    $0x10e000,%eax
  100ce1:	8b 00                	mov    (%eax),%eax
  100ce3:	83 ec 04             	sub    $0x4,%esp
  100ce6:	51                   	push   %ecx
  100ce7:	50                   	push   %eax
  100ce8:	68 79 35 10 00       	push   $0x103579
  100ced:	e8 4b f5 ff ff       	call   10023d <cprintf>
  100cf2:	83 c4 10             	add    $0x10,%esp

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100cf5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100cf9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cfc:	83 f8 02             	cmp    $0x2,%eax
  100cff:	76 bc                	jbe    100cbd <mon_help+0xf>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
    }
    return 0;
  100d01:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d06:	c9                   	leave  
  100d07:	c3                   	ret    

00100d08 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100d08:	55                   	push   %ebp
  100d09:	89 e5                	mov    %esp,%ebp
  100d0b:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100d0e:	e8 b4 fb ff ff       	call   1008c7 <print_kerninfo>
    return 0;
  100d13:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d18:	c9                   	leave  
  100d19:	c3                   	ret    

00100d1a <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100d1a:	55                   	push   %ebp
  100d1b:	89 e5                	mov    %esp,%ebp
  100d1d:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100d20:	e8 ea fc ff ff       	call   100a0f <print_stackframe>
    return 0;
  100d25:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d2a:	c9                   	leave  
  100d2b:	c3                   	ret    

00100d2c <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d2c:	55                   	push   %ebp
  100d2d:	89 e5                	mov    %esp,%ebp
  100d2f:	83 ec 18             	sub    $0x18,%esp
  100d32:	66 c7 45 f6 43 00    	movw   $0x43,-0xa(%ebp)
  100d38:	c6 45 ef 34          	movb   $0x34,-0x11(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d3c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
  100d40:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100d44:	ee                   	out    %al,(%dx)
  100d45:	66 c7 45 f4 40 00    	movw   $0x40,-0xc(%ebp)
  100d4b:	c6 45 f0 9c          	movb   $0x9c,-0x10(%ebp)
  100d4f:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
  100d53:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
  100d57:	ee                   	out    %al,(%dx)
  100d58:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d5e:	c6 45 f1 2e          	movb   $0x2e,-0xf(%ebp)
  100d62:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100d66:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100d6a:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100d6b:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  100d72:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100d75:	83 ec 0c             	sub    $0xc,%esp
  100d78:	68 82 35 10 00       	push   $0x103582
  100d7d:	e8 bb f4 ff ff       	call   10023d <cprintf>
  100d82:	83 c4 10             	add    $0x10,%esp
    pic_enable(IRQ_TIMER);
  100d85:	83 ec 0c             	sub    $0xc,%esp
  100d88:	6a 00                	push   $0x0
  100d8a:	e8 ce 08 00 00       	call   10165d <pic_enable>
  100d8f:	83 c4 10             	add    $0x10,%esp
}
  100d92:	90                   	nop
  100d93:	c9                   	leave  
  100d94:	c3                   	ret    

00100d95 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100d95:	55                   	push   %ebp
  100d96:	89 e5                	mov    %esp,%ebp
  100d98:	83 ec 10             	sub    $0x10,%esp
  100d9b:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100da1:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100da5:	89 c2                	mov    %eax,%edx
  100da7:	ec                   	in     (%dx),%al
  100da8:	88 45 f4             	mov    %al,-0xc(%ebp)
  100dab:	66 c7 45 fc 84 00    	movw   $0x84,-0x4(%ebp)
  100db1:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
  100db5:	89 c2                	mov    %eax,%edx
  100db7:	ec                   	in     (%dx),%al
  100db8:	88 45 f5             	mov    %al,-0xb(%ebp)
  100dbb:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100dc1:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100dc5:	89 c2                	mov    %eax,%edx
  100dc7:	ec                   	in     (%dx),%al
  100dc8:	88 45 f6             	mov    %al,-0xa(%ebp)
  100dcb:	66 c7 45 f8 84 00    	movw   $0x84,-0x8(%ebp)
  100dd1:	0f b7 45 f8          	movzwl -0x8(%ebp),%eax
  100dd5:	89 c2                	mov    %eax,%edx
  100dd7:	ec                   	in     (%dx),%al
  100dd8:	88 45 f7             	mov    %al,-0x9(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100ddb:	90                   	nop
  100ddc:	c9                   	leave  
  100ddd:	c3                   	ret    

00100dde <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100dde:	55                   	push   %ebp
  100ddf:	89 e5                	mov    %esp,%ebp
  100de1:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100de4:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100deb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100dee:	0f b7 00             	movzwl (%eax),%eax
  100df1:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100df5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100df8:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100dfd:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e00:	0f b7 00             	movzwl (%eax),%eax
  100e03:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100e07:	74 12                	je     100e1b <cga_init+0x3d>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100e09:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100e10:	66 c7 05 66 ee 10 00 	movw   $0x3b4,0x10ee66
  100e17:	b4 03 
  100e19:	eb 13                	jmp    100e2e <cga_init+0x50>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100e1b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e1e:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e22:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100e25:	66 c7 05 66 ee 10 00 	movw   $0x3d4,0x10ee66
  100e2c:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100e2e:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e35:	0f b7 c0             	movzwl %ax,%eax
  100e38:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
  100e3c:	c6 45 ea 0e          	movb   $0xe,-0x16(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e40:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
  100e44:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  100e48:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100e49:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e50:	83 c0 01             	add    $0x1,%eax
  100e53:	0f b7 c0             	movzwl %ax,%eax
  100e56:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e5a:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100e5e:	89 c2                	mov    %eax,%edx
  100e60:	ec                   	in     (%dx),%al
  100e61:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  100e64:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
  100e68:	0f b6 c0             	movzbl %al,%eax
  100e6b:	c1 e0 08             	shl    $0x8,%eax
  100e6e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100e71:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e78:	0f b7 c0             	movzwl %ax,%eax
  100e7b:	66 89 45 f0          	mov    %ax,-0x10(%ebp)
  100e7f:	c6 45 ec 0f          	movb   $0xf,-0x14(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e83:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  100e87:	0f b7 55 f0          	movzwl -0x10(%ebp),%edx
  100e8b:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100e8c:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e93:	83 c0 01             	add    $0x1,%eax
  100e96:	0f b7 c0             	movzwl %ax,%eax
  100e99:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e9d:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100ea1:	89 c2                	mov    %eax,%edx
  100ea3:	ec                   	in     (%dx),%al
  100ea4:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100ea7:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100eab:	0f b6 c0             	movzbl %al,%eax
  100eae:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100eb1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100eb4:	a3 60 ee 10 00       	mov    %eax,0x10ee60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100eb9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ebc:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
}
  100ec2:	90                   	nop
  100ec3:	c9                   	leave  
  100ec4:	c3                   	ret    

00100ec5 <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100ec5:	55                   	push   %ebp
  100ec6:	89 e5                	mov    %esp,%ebp
  100ec8:	83 ec 28             	sub    $0x28,%esp
  100ecb:	66 c7 45 f6 fa 03    	movw   $0x3fa,-0xa(%ebp)
  100ed1:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ed5:	0f b6 45 da          	movzbl -0x26(%ebp),%eax
  100ed9:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100edd:	ee                   	out    %al,(%dx)
  100ede:	66 c7 45 f4 fb 03    	movw   $0x3fb,-0xc(%ebp)
  100ee4:	c6 45 db 80          	movb   $0x80,-0x25(%ebp)
  100ee8:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  100eec:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
  100ef0:	ee                   	out    %al,(%dx)
  100ef1:	66 c7 45 f2 f8 03    	movw   $0x3f8,-0xe(%ebp)
  100ef7:	c6 45 dc 0c          	movb   $0xc,-0x24(%ebp)
  100efb:	0f b6 45 dc          	movzbl -0x24(%ebp),%eax
  100eff:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100f03:	ee                   	out    %al,(%dx)
  100f04:	66 c7 45 f0 f9 03    	movw   $0x3f9,-0x10(%ebp)
  100f0a:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
  100f0e:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f12:	0f b7 55 f0          	movzwl -0x10(%ebp),%edx
  100f16:	ee                   	out    %al,(%dx)
  100f17:	66 c7 45 ee fb 03    	movw   $0x3fb,-0x12(%ebp)
  100f1d:	c6 45 de 03          	movb   $0x3,-0x22(%ebp)
  100f21:	0f b6 45 de          	movzbl -0x22(%ebp),%eax
  100f25:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f29:	ee                   	out    %al,(%dx)
  100f2a:	66 c7 45 ec fc 03    	movw   $0x3fc,-0x14(%ebp)
  100f30:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
  100f34:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
  100f38:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
  100f3c:	ee                   	out    %al,(%dx)
  100f3d:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f43:	c6 45 e0 01          	movb   $0x1,-0x20(%ebp)
  100f47:	0f b6 45 e0          	movzbl -0x20(%ebp),%eax
  100f4b:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f4f:	ee                   	out    %al,(%dx)
  100f50:	66 c7 45 e8 fd 03    	movw   $0x3fd,-0x18(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f56:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
  100f5a:	89 c2                	mov    %eax,%edx
  100f5c:	ec                   	in     (%dx),%al
  100f5d:	88 45 e1             	mov    %al,-0x1f(%ebp)
    return data;
  100f60:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100f64:	3c ff                	cmp    $0xff,%al
  100f66:	0f 95 c0             	setne  %al
  100f69:	0f b6 c0             	movzbl %al,%eax
  100f6c:	a3 68 ee 10 00       	mov    %eax,0x10ee68
  100f71:	66 c7 45 e6 fa 03    	movw   $0x3fa,-0x1a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f77:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
  100f7b:	89 c2                	mov    %eax,%edx
  100f7d:	ec                   	in     (%dx),%al
  100f7e:	88 45 e2             	mov    %al,-0x1e(%ebp)
  100f81:	66 c7 45 e4 f8 03    	movw   $0x3f8,-0x1c(%ebp)
  100f87:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100f8b:	89 c2                	mov    %eax,%edx
  100f8d:	ec                   	in     (%dx),%al
  100f8e:	88 45 e3             	mov    %al,-0x1d(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100f91:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  100f96:	85 c0                	test   %eax,%eax
  100f98:	74 0d                	je     100fa7 <serial_init+0xe2>
        pic_enable(IRQ_COM1);
  100f9a:	83 ec 0c             	sub    $0xc,%esp
  100f9d:	6a 04                	push   $0x4
  100f9f:	e8 b9 06 00 00       	call   10165d <pic_enable>
  100fa4:	83 c4 10             	add    $0x10,%esp
    }
}
  100fa7:	90                   	nop
  100fa8:	c9                   	leave  
  100fa9:	c3                   	ret    

00100faa <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100faa:	55                   	push   %ebp
  100fab:	89 e5                	mov    %esp,%ebp
  100fad:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fb0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100fb7:	eb 09                	jmp    100fc2 <lpt_putc_sub+0x18>
        delay();
  100fb9:	e8 d7 fd ff ff       	call   100d95 <delay>
}

static void
lpt_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fbe:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100fc2:	66 c7 45 f4 79 03    	movw   $0x379,-0xc(%ebp)
  100fc8:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100fcc:	89 c2                	mov    %eax,%edx
  100fce:	ec                   	in     (%dx),%al
  100fcf:	88 45 f3             	mov    %al,-0xd(%ebp)
    return data;
  100fd2:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100fd6:	84 c0                	test   %al,%al
  100fd8:	78 09                	js     100fe3 <lpt_putc_sub+0x39>
  100fda:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  100fe1:	7e d6                	jle    100fb9 <lpt_putc_sub+0xf>
        delay();
    }
    outb(LPTPORT + 0, c);
  100fe3:	8b 45 08             	mov    0x8(%ebp),%eax
  100fe6:	0f b6 c0             	movzbl %al,%eax
  100fe9:	66 c7 45 f8 78 03    	movw   $0x378,-0x8(%ebp)
  100fef:	88 45 f0             	mov    %al,-0x10(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ff2:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
  100ff6:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  100ffa:	ee                   	out    %al,(%dx)
  100ffb:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  101001:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
  101005:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101009:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10100d:	ee                   	out    %al,(%dx)
  10100e:	66 c7 45 fa 7a 03    	movw   $0x37a,-0x6(%ebp)
  101014:	c6 45 f2 08          	movb   $0x8,-0xe(%ebp)
  101018:	0f b6 45 f2          	movzbl -0xe(%ebp),%eax
  10101c:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101020:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  101021:	90                   	nop
  101022:	c9                   	leave  
  101023:	c3                   	ret    

00101024 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  101024:	55                   	push   %ebp
  101025:	89 e5                	mov    %esp,%ebp
    if (c != '\b') {
  101027:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  10102b:	74 0d                	je     10103a <lpt_putc+0x16>
        lpt_putc_sub(c);
  10102d:	ff 75 08             	pushl  0x8(%ebp)
  101030:	e8 75 ff ff ff       	call   100faa <lpt_putc_sub>
  101035:	83 c4 04             	add    $0x4,%esp
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  101038:	eb 1e                	jmp    101058 <lpt_putc+0x34>
lpt_putc(int c) {
    if (c != '\b') {
        lpt_putc_sub(c);
    }
    else {
        lpt_putc_sub('\b');
  10103a:	6a 08                	push   $0x8
  10103c:	e8 69 ff ff ff       	call   100faa <lpt_putc_sub>
  101041:	83 c4 04             	add    $0x4,%esp
        lpt_putc_sub(' ');
  101044:	6a 20                	push   $0x20
  101046:	e8 5f ff ff ff       	call   100faa <lpt_putc_sub>
  10104b:	83 c4 04             	add    $0x4,%esp
        lpt_putc_sub('\b');
  10104e:	6a 08                	push   $0x8
  101050:	e8 55 ff ff ff       	call   100faa <lpt_putc_sub>
  101055:	83 c4 04             	add    $0x4,%esp
    }
}
  101058:	90                   	nop
  101059:	c9                   	leave  
  10105a:	c3                   	ret    

0010105b <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  10105b:	55                   	push   %ebp
  10105c:	89 e5                	mov    %esp,%ebp
  10105e:	53                   	push   %ebx
  10105f:	83 ec 14             	sub    $0x14,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  101062:	8b 45 08             	mov    0x8(%ebp),%eax
  101065:	b0 00                	mov    $0x0,%al
  101067:	85 c0                	test   %eax,%eax
  101069:	75 07                	jne    101072 <cga_putc+0x17>
        c |= 0x0700;
  10106b:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  101072:	8b 45 08             	mov    0x8(%ebp),%eax
  101075:	0f b6 c0             	movzbl %al,%eax
  101078:	83 f8 0a             	cmp    $0xa,%eax
  10107b:	74 4e                	je     1010cb <cga_putc+0x70>
  10107d:	83 f8 0d             	cmp    $0xd,%eax
  101080:	74 59                	je     1010db <cga_putc+0x80>
  101082:	83 f8 08             	cmp    $0x8,%eax
  101085:	0f 85 8a 00 00 00    	jne    101115 <cga_putc+0xba>
    case '\b':
        if (crt_pos > 0) {
  10108b:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101092:	66 85 c0             	test   %ax,%ax
  101095:	0f 84 a0 00 00 00    	je     10113b <cga_putc+0xe0>
            crt_pos --;
  10109b:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010a2:	83 e8 01             	sub    $0x1,%eax
  1010a5:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  1010ab:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1010b0:	0f b7 15 64 ee 10 00 	movzwl 0x10ee64,%edx
  1010b7:	0f b7 d2             	movzwl %dx,%edx
  1010ba:	01 d2                	add    %edx,%edx
  1010bc:	01 d0                	add    %edx,%eax
  1010be:	8b 55 08             	mov    0x8(%ebp),%edx
  1010c1:	b2 00                	mov    $0x0,%dl
  1010c3:	83 ca 20             	or     $0x20,%edx
  1010c6:	66 89 10             	mov    %dx,(%eax)
        }
        break;
  1010c9:	eb 70                	jmp    10113b <cga_putc+0xe0>
    case '\n':
        crt_pos += CRT_COLS;
  1010cb:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010d2:	83 c0 50             	add    $0x50,%eax
  1010d5:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  1010db:	0f b7 1d 64 ee 10 00 	movzwl 0x10ee64,%ebx
  1010e2:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  1010e9:	0f b7 c1             	movzwl %cx,%eax
  1010ec:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  1010f2:	c1 e8 10             	shr    $0x10,%eax
  1010f5:	89 c2                	mov    %eax,%edx
  1010f7:	66 c1 ea 06          	shr    $0x6,%dx
  1010fb:	89 d0                	mov    %edx,%eax
  1010fd:	c1 e0 02             	shl    $0x2,%eax
  101100:	01 d0                	add    %edx,%eax
  101102:	c1 e0 04             	shl    $0x4,%eax
  101105:	29 c1                	sub    %eax,%ecx
  101107:	89 ca                	mov    %ecx,%edx
  101109:	89 d8                	mov    %ebx,%eax
  10110b:	29 d0                	sub    %edx,%eax
  10110d:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  101113:	eb 27                	jmp    10113c <cga_putc+0xe1>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  101115:	8b 0d 60 ee 10 00    	mov    0x10ee60,%ecx
  10111b:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101122:	8d 50 01             	lea    0x1(%eax),%edx
  101125:	66 89 15 64 ee 10 00 	mov    %dx,0x10ee64
  10112c:	0f b7 c0             	movzwl %ax,%eax
  10112f:	01 c0                	add    %eax,%eax
  101131:	01 c8                	add    %ecx,%eax
  101133:	8b 55 08             	mov    0x8(%ebp),%edx
  101136:	66 89 10             	mov    %dx,(%eax)
        break;
  101139:	eb 01                	jmp    10113c <cga_putc+0xe1>
    case '\b':
        if (crt_pos > 0) {
            crt_pos --;
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
        }
        break;
  10113b:	90                   	nop
        crt_buf[crt_pos ++] = c;     // write the character
        break;
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  10113c:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101143:	66 3d cf 07          	cmp    $0x7cf,%ax
  101147:	76 59                	jbe    1011a2 <cga_putc+0x147>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  101149:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  10114e:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  101154:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101159:	83 ec 04             	sub    $0x4,%esp
  10115c:	68 00 0f 00 00       	push   $0xf00
  101161:	52                   	push   %edx
  101162:	50                   	push   %eax
  101163:	e8 a4 19 00 00       	call   102b0c <memmove>
  101168:	83 c4 10             	add    $0x10,%esp
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  10116b:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  101172:	eb 15                	jmp    101189 <cga_putc+0x12e>
            crt_buf[i] = 0x0700 | ' ';
  101174:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101179:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10117c:	01 d2                	add    %edx,%edx
  10117e:	01 d0                	add    %edx,%eax
  101180:	66 c7 00 20 07       	movw   $0x720,(%eax)

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  101185:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101189:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  101190:	7e e2                	jle    101174 <cga_putc+0x119>
            crt_buf[i] = 0x0700 | ' ';
        }
        crt_pos -= CRT_COLS;
  101192:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101199:	83 e8 50             	sub    $0x50,%eax
  10119c:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  1011a2:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  1011a9:	0f b7 c0             	movzwl %ax,%eax
  1011ac:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  1011b0:	c6 45 e8 0e          	movb   $0xe,-0x18(%ebp)
  1011b4:	0f b6 45 e8          	movzbl -0x18(%ebp),%eax
  1011b8:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1011bc:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  1011bd:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011c4:	66 c1 e8 08          	shr    $0x8,%ax
  1011c8:	0f b6 c0             	movzbl %al,%eax
  1011cb:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  1011d2:	83 c2 01             	add    $0x1,%edx
  1011d5:	0f b7 d2             	movzwl %dx,%edx
  1011d8:	66 89 55 f0          	mov    %dx,-0x10(%ebp)
  1011dc:	88 45 e9             	mov    %al,-0x17(%ebp)
  1011df:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1011e3:	0f b7 55 f0          	movzwl -0x10(%ebp),%edx
  1011e7:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  1011e8:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  1011ef:	0f b7 c0             	movzwl %ax,%eax
  1011f2:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  1011f6:	c6 45 ea 0f          	movb   $0xf,-0x16(%ebp)
  1011fa:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
  1011fe:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101202:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  101203:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10120a:	0f b6 c0             	movzbl %al,%eax
  10120d:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  101214:	83 c2 01             	add    $0x1,%edx
  101217:	0f b7 d2             	movzwl %dx,%edx
  10121a:	66 89 55 ec          	mov    %dx,-0x14(%ebp)
  10121e:	88 45 eb             	mov    %al,-0x15(%ebp)
  101221:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
  101225:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
  101229:	ee                   	out    %al,(%dx)
}
  10122a:	90                   	nop
  10122b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10122e:	c9                   	leave  
  10122f:	c3                   	ret    

00101230 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  101230:	55                   	push   %ebp
  101231:	89 e5                	mov    %esp,%ebp
  101233:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101236:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10123d:	eb 09                	jmp    101248 <serial_putc_sub+0x18>
        delay();
  10123f:	e8 51 fb ff ff       	call   100d95 <delay>
}

static void
serial_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101244:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101248:	66 c7 45 f8 fd 03    	movw   $0x3fd,-0x8(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10124e:	0f b7 45 f8          	movzwl -0x8(%ebp),%eax
  101252:	89 c2                	mov    %eax,%edx
  101254:	ec                   	in     (%dx),%al
  101255:	88 45 f7             	mov    %al,-0x9(%ebp)
    return data;
  101258:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  10125c:	0f b6 c0             	movzbl %al,%eax
  10125f:	83 e0 20             	and    $0x20,%eax
  101262:	85 c0                	test   %eax,%eax
  101264:	75 09                	jne    10126f <serial_putc_sub+0x3f>
  101266:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  10126d:	7e d0                	jle    10123f <serial_putc_sub+0xf>
        delay();
    }
    outb(COM1 + COM_TX, c);
  10126f:	8b 45 08             	mov    0x8(%ebp),%eax
  101272:	0f b6 c0             	movzbl %al,%eax
  101275:	66 c7 45 fa f8 03    	movw   $0x3f8,-0x6(%ebp)
  10127b:	88 45 f6             	mov    %al,-0xa(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10127e:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
  101282:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101286:	ee                   	out    %al,(%dx)
}
  101287:	90                   	nop
  101288:	c9                   	leave  
  101289:	c3                   	ret    

0010128a <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  10128a:	55                   	push   %ebp
  10128b:	89 e5                	mov    %esp,%ebp
    if (c != '\b') {
  10128d:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101291:	74 0d                	je     1012a0 <serial_putc+0x16>
        serial_putc_sub(c);
  101293:	ff 75 08             	pushl  0x8(%ebp)
  101296:	e8 95 ff ff ff       	call   101230 <serial_putc_sub>
  10129b:	83 c4 04             	add    $0x4,%esp
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  10129e:	eb 1e                	jmp    1012be <serial_putc+0x34>
serial_putc(int c) {
    if (c != '\b') {
        serial_putc_sub(c);
    }
    else {
        serial_putc_sub('\b');
  1012a0:	6a 08                	push   $0x8
  1012a2:	e8 89 ff ff ff       	call   101230 <serial_putc_sub>
  1012a7:	83 c4 04             	add    $0x4,%esp
        serial_putc_sub(' ');
  1012aa:	6a 20                	push   $0x20
  1012ac:	e8 7f ff ff ff       	call   101230 <serial_putc_sub>
  1012b1:	83 c4 04             	add    $0x4,%esp
        serial_putc_sub('\b');
  1012b4:	6a 08                	push   $0x8
  1012b6:	e8 75 ff ff ff       	call   101230 <serial_putc_sub>
  1012bb:	83 c4 04             	add    $0x4,%esp
    }
}
  1012be:	90                   	nop
  1012bf:	c9                   	leave  
  1012c0:	c3                   	ret    

001012c1 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  1012c1:	55                   	push   %ebp
  1012c2:	89 e5                	mov    %esp,%ebp
  1012c4:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  1012c7:	eb 33                	jmp    1012fc <cons_intr+0x3b>
        if (c != 0) {
  1012c9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1012cd:	74 2d                	je     1012fc <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  1012cf:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1012d4:	8d 50 01             	lea    0x1(%eax),%edx
  1012d7:	89 15 84 f0 10 00    	mov    %edx,0x10f084
  1012dd:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1012e0:	88 90 80 ee 10 00    	mov    %dl,0x10ee80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  1012e6:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1012eb:	3d 00 02 00 00       	cmp    $0x200,%eax
  1012f0:	75 0a                	jne    1012fc <cons_intr+0x3b>
                cons.wpos = 0;
  1012f2:	c7 05 84 f0 10 00 00 	movl   $0x0,0x10f084
  1012f9:	00 00 00 
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
    int c;
    while ((c = (*proc)()) != -1) {
  1012fc:	8b 45 08             	mov    0x8(%ebp),%eax
  1012ff:	ff d0                	call   *%eax
  101301:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101304:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  101308:	75 bf                	jne    1012c9 <cons_intr+0x8>
            if (cons.wpos == CONSBUFSIZE) {
                cons.wpos = 0;
            }
        }
    }
}
  10130a:	90                   	nop
  10130b:	c9                   	leave  
  10130c:	c3                   	ret    

0010130d <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  10130d:	55                   	push   %ebp
  10130e:	89 e5                	mov    %esp,%ebp
  101310:	83 ec 10             	sub    $0x10,%esp
  101313:	66 c7 45 f8 fd 03    	movw   $0x3fd,-0x8(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101319:	0f b7 45 f8          	movzwl -0x8(%ebp),%eax
  10131d:	89 c2                	mov    %eax,%edx
  10131f:	ec                   	in     (%dx),%al
  101320:	88 45 f7             	mov    %al,-0x9(%ebp)
    return data;
  101323:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  101327:	0f b6 c0             	movzbl %al,%eax
  10132a:	83 e0 01             	and    $0x1,%eax
  10132d:	85 c0                	test   %eax,%eax
  10132f:	75 07                	jne    101338 <serial_proc_data+0x2b>
        return -1;
  101331:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101336:	eb 2a                	jmp    101362 <serial_proc_data+0x55>
  101338:	66 c7 45 fa f8 03    	movw   $0x3f8,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10133e:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101342:	89 c2                	mov    %eax,%edx
  101344:	ec                   	in     (%dx),%al
  101345:	88 45 f6             	mov    %al,-0xa(%ebp)
    return data;
  101348:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  10134c:	0f b6 c0             	movzbl %al,%eax
  10134f:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  101352:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  101356:	75 07                	jne    10135f <serial_proc_data+0x52>
        c = '\b';
  101358:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  10135f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  101362:	c9                   	leave  
  101363:	c3                   	ret    

00101364 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  101364:	55                   	push   %ebp
  101365:	89 e5                	mov    %esp,%ebp
  101367:	83 ec 08             	sub    $0x8,%esp
    if (serial_exists) {
  10136a:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  10136f:	85 c0                	test   %eax,%eax
  101371:	74 10                	je     101383 <serial_intr+0x1f>
        cons_intr(serial_proc_data);
  101373:	83 ec 0c             	sub    $0xc,%esp
  101376:	68 0d 13 10 00       	push   $0x10130d
  10137b:	e8 41 ff ff ff       	call   1012c1 <cons_intr>
  101380:	83 c4 10             	add    $0x10,%esp
    }
}
  101383:	90                   	nop
  101384:	c9                   	leave  
  101385:	c3                   	ret    

00101386 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  101386:	55                   	push   %ebp
  101387:	89 e5                	mov    %esp,%ebp
  101389:	83 ec 18             	sub    $0x18,%esp
  10138c:	66 c7 45 ec 64 00    	movw   $0x64,-0x14(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101392:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101396:	89 c2                	mov    %eax,%edx
  101398:	ec                   	in     (%dx),%al
  101399:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  10139c:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  1013a0:	0f b6 c0             	movzbl %al,%eax
  1013a3:	83 e0 01             	and    $0x1,%eax
  1013a6:	85 c0                	test   %eax,%eax
  1013a8:	75 0a                	jne    1013b4 <kbd_proc_data+0x2e>
        return -1;
  1013aa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1013af:	e9 5d 01 00 00       	jmp    101511 <kbd_proc_data+0x18b>
  1013b4:	66 c7 45 f0 60 00    	movw   $0x60,-0x10(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013ba:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1013be:	89 c2                	mov    %eax,%edx
  1013c0:	ec                   	in     (%dx),%al
  1013c1:	88 45 ea             	mov    %al,-0x16(%ebp)
    return data;
  1013c4:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
    }

    data = inb(KBDATAP);
  1013c8:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  1013cb:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  1013cf:	75 17                	jne    1013e8 <kbd_proc_data+0x62>
        // E0 escape character
        shift |= E0ESC;
  1013d1:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1013d6:	83 c8 40             	or     $0x40,%eax
  1013d9:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  1013de:	b8 00 00 00 00       	mov    $0x0,%eax
  1013e3:	e9 29 01 00 00       	jmp    101511 <kbd_proc_data+0x18b>
    } else if (data & 0x80) {
  1013e8:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1013ec:	84 c0                	test   %al,%al
  1013ee:	79 47                	jns    101437 <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  1013f0:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1013f5:	83 e0 40             	and    $0x40,%eax
  1013f8:	85 c0                	test   %eax,%eax
  1013fa:	75 09                	jne    101405 <kbd_proc_data+0x7f>
  1013fc:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101400:	83 e0 7f             	and    $0x7f,%eax
  101403:	eb 04                	jmp    101409 <kbd_proc_data+0x83>
  101405:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101409:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  10140c:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101410:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  101417:	83 c8 40             	or     $0x40,%eax
  10141a:	0f b6 c0             	movzbl %al,%eax
  10141d:	f7 d0                	not    %eax
  10141f:	89 c2                	mov    %eax,%edx
  101421:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101426:	21 d0                	and    %edx,%eax
  101428:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  10142d:	b8 00 00 00 00       	mov    $0x0,%eax
  101432:	e9 da 00 00 00       	jmp    101511 <kbd_proc_data+0x18b>
    } else if (shift & E0ESC) {
  101437:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10143c:	83 e0 40             	and    $0x40,%eax
  10143f:	85 c0                	test   %eax,%eax
  101441:	74 11                	je     101454 <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  101443:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  101447:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10144c:	83 e0 bf             	and    $0xffffffbf,%eax
  10144f:	a3 88 f0 10 00       	mov    %eax,0x10f088
    }

    shift |= shiftcode[data];
  101454:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101458:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  10145f:	0f b6 d0             	movzbl %al,%edx
  101462:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101467:	09 d0                	or     %edx,%eax
  101469:	a3 88 f0 10 00       	mov    %eax,0x10f088
    shift ^= togglecode[data];
  10146e:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101472:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  101479:	0f b6 d0             	movzbl %al,%edx
  10147c:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101481:	31 d0                	xor    %edx,%eax
  101483:	a3 88 f0 10 00       	mov    %eax,0x10f088

    c = charcode[shift & (CTL | SHIFT)][data];
  101488:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10148d:	83 e0 03             	and    $0x3,%eax
  101490:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  101497:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10149b:	01 d0                	add    %edx,%eax
  10149d:	0f b6 00             	movzbl (%eax),%eax
  1014a0:	0f b6 c0             	movzbl %al,%eax
  1014a3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  1014a6:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014ab:	83 e0 08             	and    $0x8,%eax
  1014ae:	85 c0                	test   %eax,%eax
  1014b0:	74 22                	je     1014d4 <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  1014b2:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1014b6:	7e 0c                	jle    1014c4 <kbd_proc_data+0x13e>
  1014b8:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1014bc:	7f 06                	jg     1014c4 <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  1014be:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1014c2:	eb 10                	jmp    1014d4 <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  1014c4:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  1014c8:	7e 0a                	jle    1014d4 <kbd_proc_data+0x14e>
  1014ca:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  1014ce:	7f 04                	jg     1014d4 <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  1014d0:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  1014d4:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014d9:	f7 d0                	not    %eax
  1014db:	83 e0 06             	and    $0x6,%eax
  1014de:	85 c0                	test   %eax,%eax
  1014e0:	75 2c                	jne    10150e <kbd_proc_data+0x188>
  1014e2:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  1014e9:	75 23                	jne    10150e <kbd_proc_data+0x188>
        cprintf("Rebooting!\n");
  1014eb:	83 ec 0c             	sub    $0xc,%esp
  1014ee:	68 9d 35 10 00       	push   $0x10359d
  1014f3:	e8 45 ed ff ff       	call   10023d <cprintf>
  1014f8:	83 c4 10             	add    $0x10,%esp
  1014fb:	66 c7 45 ee 92 00    	movw   $0x92,-0x12(%ebp)
  101501:	c6 45 e9 03          	movb   $0x3,-0x17(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101505:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101509:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10150d:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  10150e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  101511:	c9                   	leave  
  101512:	c3                   	ret    

00101513 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  101513:	55                   	push   %ebp
  101514:	89 e5                	mov    %esp,%ebp
  101516:	83 ec 08             	sub    $0x8,%esp
    cons_intr(kbd_proc_data);
  101519:	83 ec 0c             	sub    $0xc,%esp
  10151c:	68 86 13 10 00       	push   $0x101386
  101521:	e8 9b fd ff ff       	call   1012c1 <cons_intr>
  101526:	83 c4 10             	add    $0x10,%esp
}
  101529:	90                   	nop
  10152a:	c9                   	leave  
  10152b:	c3                   	ret    

0010152c <kbd_init>:

static void
kbd_init(void) {
  10152c:	55                   	push   %ebp
  10152d:	89 e5                	mov    %esp,%ebp
  10152f:	83 ec 08             	sub    $0x8,%esp
    // drain the kbd buffer
    kbd_intr();
  101532:	e8 dc ff ff ff       	call   101513 <kbd_intr>
    pic_enable(IRQ_KBD);
  101537:	83 ec 0c             	sub    $0xc,%esp
  10153a:	6a 01                	push   $0x1
  10153c:	e8 1c 01 00 00       	call   10165d <pic_enable>
  101541:	83 c4 10             	add    $0x10,%esp
}
  101544:	90                   	nop
  101545:	c9                   	leave  
  101546:	c3                   	ret    

00101547 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  101547:	55                   	push   %ebp
  101548:	89 e5                	mov    %esp,%ebp
  10154a:	83 ec 08             	sub    $0x8,%esp
    cga_init();
  10154d:	e8 8c f8 ff ff       	call   100dde <cga_init>
    serial_init();
  101552:	e8 6e f9 ff ff       	call   100ec5 <serial_init>
    kbd_init();
  101557:	e8 d0 ff ff ff       	call   10152c <kbd_init>
    if (!serial_exists) {
  10155c:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  101561:	85 c0                	test   %eax,%eax
  101563:	75 10                	jne    101575 <cons_init+0x2e>
        cprintf("serial port does not exist!!\n");
  101565:	83 ec 0c             	sub    $0xc,%esp
  101568:	68 a9 35 10 00       	push   $0x1035a9
  10156d:	e8 cb ec ff ff       	call   10023d <cprintf>
  101572:	83 c4 10             	add    $0x10,%esp
    }
}
  101575:	90                   	nop
  101576:	c9                   	leave  
  101577:	c3                   	ret    

00101578 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  101578:	55                   	push   %ebp
  101579:	89 e5                	mov    %esp,%ebp
  10157b:	83 ec 08             	sub    $0x8,%esp
    lpt_putc(c);
  10157e:	ff 75 08             	pushl  0x8(%ebp)
  101581:	e8 9e fa ff ff       	call   101024 <lpt_putc>
  101586:	83 c4 04             	add    $0x4,%esp
    cga_putc(c);
  101589:	83 ec 0c             	sub    $0xc,%esp
  10158c:	ff 75 08             	pushl  0x8(%ebp)
  10158f:	e8 c7 fa ff ff       	call   10105b <cga_putc>
  101594:	83 c4 10             	add    $0x10,%esp
    serial_putc(c);
  101597:	83 ec 0c             	sub    $0xc,%esp
  10159a:	ff 75 08             	pushl  0x8(%ebp)
  10159d:	e8 e8 fc ff ff       	call   10128a <serial_putc>
  1015a2:	83 c4 10             	add    $0x10,%esp
}
  1015a5:	90                   	nop
  1015a6:	c9                   	leave  
  1015a7:	c3                   	ret    

001015a8 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1015a8:	55                   	push   %ebp
  1015a9:	89 e5                	mov    %esp,%ebp
  1015ab:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1015ae:	e8 b1 fd ff ff       	call   101364 <serial_intr>
    kbd_intr();
  1015b3:	e8 5b ff ff ff       	call   101513 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1015b8:	8b 15 80 f0 10 00    	mov    0x10f080,%edx
  1015be:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1015c3:	39 c2                	cmp    %eax,%edx
  1015c5:	74 36                	je     1015fd <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  1015c7:	a1 80 f0 10 00       	mov    0x10f080,%eax
  1015cc:	8d 50 01             	lea    0x1(%eax),%edx
  1015cf:	89 15 80 f0 10 00    	mov    %edx,0x10f080
  1015d5:	0f b6 80 80 ee 10 00 	movzbl 0x10ee80(%eax),%eax
  1015dc:	0f b6 c0             	movzbl %al,%eax
  1015df:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  1015e2:	a1 80 f0 10 00       	mov    0x10f080,%eax
  1015e7:	3d 00 02 00 00       	cmp    $0x200,%eax
  1015ec:	75 0a                	jne    1015f8 <cons_getc+0x50>
            cons.rpos = 0;
  1015ee:	c7 05 80 f0 10 00 00 	movl   $0x0,0x10f080
  1015f5:	00 00 00 
        }
        return c;
  1015f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1015fb:	eb 05                	jmp    101602 <cons_getc+0x5a>
    }
    return 0;
  1015fd:	b8 00 00 00 00       	mov    $0x0,%eax
}
  101602:	c9                   	leave  
  101603:	c3                   	ret    

00101604 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  101604:	55                   	push   %ebp
  101605:	89 e5                	mov    %esp,%ebp
  101607:	83 ec 14             	sub    $0x14,%esp
  10160a:	8b 45 08             	mov    0x8(%ebp),%eax
  10160d:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  101611:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101615:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  10161b:	a1 8c f0 10 00       	mov    0x10f08c,%eax
  101620:	85 c0                	test   %eax,%eax
  101622:	74 36                	je     10165a <pic_setmask+0x56>
        outb(IO_PIC1 + 1, mask);
  101624:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101628:	0f b6 c0             	movzbl %al,%eax
  10162b:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  101631:	88 45 fa             	mov    %al,-0x6(%ebp)
  101634:	0f b6 45 fa          	movzbl -0x6(%ebp),%eax
  101638:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  10163c:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  10163d:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101641:	66 c1 e8 08          	shr    $0x8,%ax
  101645:	0f b6 c0             	movzbl %al,%eax
  101648:	66 c7 45 fc a1 00    	movw   $0xa1,-0x4(%ebp)
  10164e:	88 45 fb             	mov    %al,-0x5(%ebp)
  101651:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
  101655:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  101659:	ee                   	out    %al,(%dx)
    }
}
  10165a:	90                   	nop
  10165b:	c9                   	leave  
  10165c:	c3                   	ret    

0010165d <pic_enable>:

void
pic_enable(unsigned int irq) {
  10165d:	55                   	push   %ebp
  10165e:	89 e5                	mov    %esp,%ebp
    pic_setmask(irq_mask & ~(1 << irq));
  101660:	8b 45 08             	mov    0x8(%ebp),%eax
  101663:	ba 01 00 00 00       	mov    $0x1,%edx
  101668:	89 c1                	mov    %eax,%ecx
  10166a:	d3 e2                	shl    %cl,%edx
  10166c:	89 d0                	mov    %edx,%eax
  10166e:	f7 d0                	not    %eax
  101670:	89 c2                	mov    %eax,%edx
  101672:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  101679:	21 d0                	and    %edx,%eax
  10167b:	0f b7 c0             	movzwl %ax,%eax
  10167e:	50                   	push   %eax
  10167f:	e8 80 ff ff ff       	call   101604 <pic_setmask>
  101684:	83 c4 04             	add    $0x4,%esp
}
  101687:	90                   	nop
  101688:	c9                   	leave  
  101689:	c3                   	ret    

0010168a <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  10168a:	55                   	push   %ebp
  10168b:	89 e5                	mov    %esp,%ebp
  10168d:	83 ec 30             	sub    $0x30,%esp
    did_init = 1;
  101690:	c7 05 8c f0 10 00 01 	movl   $0x1,0x10f08c
  101697:	00 00 00 
  10169a:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  1016a0:	c6 45 d6 ff          	movb   $0xff,-0x2a(%ebp)
  1016a4:	0f b6 45 d6          	movzbl -0x2a(%ebp),%eax
  1016a8:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1016ac:	ee                   	out    %al,(%dx)
  1016ad:	66 c7 45 fc a1 00    	movw   $0xa1,-0x4(%ebp)
  1016b3:	c6 45 d7 ff          	movb   $0xff,-0x29(%ebp)
  1016b7:	0f b6 45 d7          	movzbl -0x29(%ebp),%eax
  1016bb:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  1016bf:	ee                   	out    %al,(%dx)
  1016c0:	66 c7 45 fa 20 00    	movw   $0x20,-0x6(%ebp)
  1016c6:	c6 45 d8 11          	movb   $0x11,-0x28(%ebp)
  1016ca:	0f b6 45 d8          	movzbl -0x28(%ebp),%eax
  1016ce:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1016d2:	ee                   	out    %al,(%dx)
  1016d3:	66 c7 45 f8 21 00    	movw   $0x21,-0x8(%ebp)
  1016d9:	c6 45 d9 20          	movb   $0x20,-0x27(%ebp)
  1016dd:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  1016e1:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  1016e5:	ee                   	out    %al,(%dx)
  1016e6:	66 c7 45 f6 21 00    	movw   $0x21,-0xa(%ebp)
  1016ec:	c6 45 da 04          	movb   $0x4,-0x26(%ebp)
  1016f0:	0f b6 45 da          	movzbl -0x26(%ebp),%eax
  1016f4:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1016f8:	ee                   	out    %al,(%dx)
  1016f9:	66 c7 45 f4 21 00    	movw   $0x21,-0xc(%ebp)
  1016ff:	c6 45 db 03          	movb   $0x3,-0x25(%ebp)
  101703:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  101707:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
  10170b:	ee                   	out    %al,(%dx)
  10170c:	66 c7 45 f2 a0 00    	movw   $0xa0,-0xe(%ebp)
  101712:	c6 45 dc 11          	movb   $0x11,-0x24(%ebp)
  101716:	0f b6 45 dc          	movzbl -0x24(%ebp),%eax
  10171a:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10171e:	ee                   	out    %al,(%dx)
  10171f:	66 c7 45 f0 a1 00    	movw   $0xa1,-0x10(%ebp)
  101725:	c6 45 dd 28          	movb   $0x28,-0x23(%ebp)
  101729:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  10172d:	0f b7 55 f0          	movzwl -0x10(%ebp),%edx
  101731:	ee                   	out    %al,(%dx)
  101732:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  101738:	c6 45 de 02          	movb   $0x2,-0x22(%ebp)
  10173c:	0f b6 45 de          	movzbl -0x22(%ebp),%eax
  101740:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101744:	ee                   	out    %al,(%dx)
  101745:	66 c7 45 ec a1 00    	movw   $0xa1,-0x14(%ebp)
  10174b:	c6 45 df 03          	movb   $0x3,-0x21(%ebp)
  10174f:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
  101753:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
  101757:	ee                   	out    %al,(%dx)
  101758:	66 c7 45 ea 20 00    	movw   $0x20,-0x16(%ebp)
  10175e:	c6 45 e0 68          	movb   $0x68,-0x20(%ebp)
  101762:	0f b6 45 e0          	movzbl -0x20(%ebp),%eax
  101766:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10176a:	ee                   	out    %al,(%dx)
  10176b:	66 c7 45 e8 20 00    	movw   $0x20,-0x18(%ebp)
  101771:	c6 45 e1 0a          	movb   $0xa,-0x1f(%ebp)
  101775:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  101779:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
  10177d:	ee                   	out    %al,(%dx)
  10177e:	66 c7 45 e6 a0 00    	movw   $0xa0,-0x1a(%ebp)
  101784:	c6 45 e2 68          	movb   $0x68,-0x1e(%ebp)
  101788:	0f b6 45 e2          	movzbl -0x1e(%ebp),%eax
  10178c:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101790:	ee                   	out    %al,(%dx)
  101791:	66 c7 45 e4 a0 00    	movw   $0xa0,-0x1c(%ebp)
  101797:	c6 45 e3 0a          	movb   $0xa,-0x1d(%ebp)
  10179b:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
  10179f:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
  1017a3:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1017a4:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017ab:	66 83 f8 ff          	cmp    $0xffff,%ax
  1017af:	74 13                	je     1017c4 <pic_init+0x13a>
        pic_setmask(irq_mask);
  1017b1:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017b8:	0f b7 c0             	movzwl %ax,%eax
  1017bb:	50                   	push   %eax
  1017bc:	e8 43 fe ff ff       	call   101604 <pic_setmask>
  1017c1:	83 c4 04             	add    $0x4,%esp
    }
}
  1017c4:	90                   	nop
  1017c5:	c9                   	leave  
  1017c6:	c3                   	ret    

001017c7 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  1017c7:	55                   	push   %ebp
  1017c8:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  1017ca:	fb                   	sti    
    sti();
}
  1017cb:	90                   	nop
  1017cc:	5d                   	pop    %ebp
  1017cd:	c3                   	ret    

001017ce <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  1017ce:	55                   	push   %ebp
  1017cf:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  1017d1:	fa                   	cli    
    cli();
}
  1017d2:	90                   	nop
  1017d3:	5d                   	pop    %ebp
  1017d4:	c3                   	ret    

001017d5 <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  1017d5:	55                   	push   %ebp
  1017d6:	89 e5                	mov    %esp,%ebp
  1017d8:	83 ec 08             	sub    $0x8,%esp
    cprintf("%d ticks\n",TICK_NUM);
  1017db:	83 ec 08             	sub    $0x8,%esp
  1017de:	6a 64                	push   $0x64
  1017e0:	68 e0 35 10 00       	push   $0x1035e0
  1017e5:	e8 53 ea ff ff       	call   10023d <cprintf>
  1017ea:	83 c4 10             	add    $0x10,%esp
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  1017ed:	90                   	nop
  1017ee:	c9                   	leave  
  1017ef:	c3                   	ret    

001017f0 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  1017f0:	55                   	push   %ebp
  1017f1:	89 e5                	mov    %esp,%ebp
      *     Can you see idt[256] in this file? Yes, it's IDT! you can use SETGATE macro to setup each item of IDT
      * (3) After setup the contents of IDT, you will let CPU know where is the IDT by using 'lidt' instruction.
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
}
  1017f3:	90                   	nop
  1017f4:	5d                   	pop    %ebp
  1017f5:	c3                   	ret    

001017f6 <trapname>:

static const char *
trapname(int trapno) {
  1017f6:	55                   	push   %ebp
  1017f7:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  1017f9:	8b 45 08             	mov    0x8(%ebp),%eax
  1017fc:	83 f8 13             	cmp    $0x13,%eax
  1017ff:	77 0c                	ja     10180d <trapname+0x17>
        return excnames[trapno];
  101801:	8b 45 08             	mov    0x8(%ebp),%eax
  101804:	8b 04 85 40 39 10 00 	mov    0x103940(,%eax,4),%eax
  10180b:	eb 18                	jmp    101825 <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  10180d:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  101811:	7e 0d                	jle    101820 <trapname+0x2a>
  101813:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  101817:	7f 07                	jg     101820 <trapname+0x2a>
        return "Hardware Interrupt";
  101819:	b8 ea 35 10 00       	mov    $0x1035ea,%eax
  10181e:	eb 05                	jmp    101825 <trapname+0x2f>
    }
    return "(unknown trap)";
  101820:	b8 fd 35 10 00       	mov    $0x1035fd,%eax
}
  101825:	5d                   	pop    %ebp
  101826:	c3                   	ret    

00101827 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  101827:	55                   	push   %ebp
  101828:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  10182a:	8b 45 08             	mov    0x8(%ebp),%eax
  10182d:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101831:	66 83 f8 08          	cmp    $0x8,%ax
  101835:	0f 94 c0             	sete   %al
  101838:	0f b6 c0             	movzbl %al,%eax
}
  10183b:	5d                   	pop    %ebp
  10183c:	c3                   	ret    

0010183d <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  10183d:	55                   	push   %ebp
  10183e:	89 e5                	mov    %esp,%ebp
  101840:	83 ec 18             	sub    $0x18,%esp
    cprintf("trapframe at %p\n", tf);
  101843:	83 ec 08             	sub    $0x8,%esp
  101846:	ff 75 08             	pushl  0x8(%ebp)
  101849:	68 3e 36 10 00       	push   $0x10363e
  10184e:	e8 ea e9 ff ff       	call   10023d <cprintf>
  101853:	83 c4 10             	add    $0x10,%esp
    print_regs(&tf->tf_regs);
  101856:	8b 45 08             	mov    0x8(%ebp),%eax
  101859:	83 ec 0c             	sub    $0xc,%esp
  10185c:	50                   	push   %eax
  10185d:	e8 b8 01 00 00       	call   101a1a <print_regs>
  101862:	83 c4 10             	add    $0x10,%esp
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101865:	8b 45 08             	mov    0x8(%ebp),%eax
  101868:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  10186c:	0f b7 c0             	movzwl %ax,%eax
  10186f:	83 ec 08             	sub    $0x8,%esp
  101872:	50                   	push   %eax
  101873:	68 4f 36 10 00       	push   $0x10364f
  101878:	e8 c0 e9 ff ff       	call   10023d <cprintf>
  10187d:	83 c4 10             	add    $0x10,%esp
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101880:	8b 45 08             	mov    0x8(%ebp),%eax
  101883:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101887:	0f b7 c0             	movzwl %ax,%eax
  10188a:	83 ec 08             	sub    $0x8,%esp
  10188d:	50                   	push   %eax
  10188e:	68 62 36 10 00       	push   $0x103662
  101893:	e8 a5 e9 ff ff       	call   10023d <cprintf>
  101898:	83 c4 10             	add    $0x10,%esp
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  10189b:	8b 45 08             	mov    0x8(%ebp),%eax
  10189e:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  1018a2:	0f b7 c0             	movzwl %ax,%eax
  1018a5:	83 ec 08             	sub    $0x8,%esp
  1018a8:	50                   	push   %eax
  1018a9:	68 75 36 10 00       	push   $0x103675
  1018ae:	e8 8a e9 ff ff       	call   10023d <cprintf>
  1018b3:	83 c4 10             	add    $0x10,%esp
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  1018b6:	8b 45 08             	mov    0x8(%ebp),%eax
  1018b9:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  1018bd:	0f b7 c0             	movzwl %ax,%eax
  1018c0:	83 ec 08             	sub    $0x8,%esp
  1018c3:	50                   	push   %eax
  1018c4:	68 88 36 10 00       	push   $0x103688
  1018c9:	e8 6f e9 ff ff       	call   10023d <cprintf>
  1018ce:	83 c4 10             	add    $0x10,%esp
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  1018d1:	8b 45 08             	mov    0x8(%ebp),%eax
  1018d4:	8b 40 30             	mov    0x30(%eax),%eax
  1018d7:	83 ec 0c             	sub    $0xc,%esp
  1018da:	50                   	push   %eax
  1018db:	e8 16 ff ff ff       	call   1017f6 <trapname>
  1018e0:	83 c4 10             	add    $0x10,%esp
  1018e3:	89 c2                	mov    %eax,%edx
  1018e5:	8b 45 08             	mov    0x8(%ebp),%eax
  1018e8:	8b 40 30             	mov    0x30(%eax),%eax
  1018eb:	83 ec 04             	sub    $0x4,%esp
  1018ee:	52                   	push   %edx
  1018ef:	50                   	push   %eax
  1018f0:	68 9b 36 10 00       	push   $0x10369b
  1018f5:	e8 43 e9 ff ff       	call   10023d <cprintf>
  1018fa:	83 c4 10             	add    $0x10,%esp
    cprintf("  err  0x%08x\n", tf->tf_err);
  1018fd:	8b 45 08             	mov    0x8(%ebp),%eax
  101900:	8b 40 34             	mov    0x34(%eax),%eax
  101903:	83 ec 08             	sub    $0x8,%esp
  101906:	50                   	push   %eax
  101907:	68 ad 36 10 00       	push   $0x1036ad
  10190c:	e8 2c e9 ff ff       	call   10023d <cprintf>
  101911:	83 c4 10             	add    $0x10,%esp
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101914:	8b 45 08             	mov    0x8(%ebp),%eax
  101917:	8b 40 38             	mov    0x38(%eax),%eax
  10191a:	83 ec 08             	sub    $0x8,%esp
  10191d:	50                   	push   %eax
  10191e:	68 bc 36 10 00       	push   $0x1036bc
  101923:	e8 15 e9 ff ff       	call   10023d <cprintf>
  101928:	83 c4 10             	add    $0x10,%esp
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  10192b:	8b 45 08             	mov    0x8(%ebp),%eax
  10192e:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101932:	0f b7 c0             	movzwl %ax,%eax
  101935:	83 ec 08             	sub    $0x8,%esp
  101938:	50                   	push   %eax
  101939:	68 cb 36 10 00       	push   $0x1036cb
  10193e:	e8 fa e8 ff ff       	call   10023d <cprintf>
  101943:	83 c4 10             	add    $0x10,%esp
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101946:	8b 45 08             	mov    0x8(%ebp),%eax
  101949:	8b 40 40             	mov    0x40(%eax),%eax
  10194c:	83 ec 08             	sub    $0x8,%esp
  10194f:	50                   	push   %eax
  101950:	68 de 36 10 00       	push   $0x1036de
  101955:	e8 e3 e8 ff ff       	call   10023d <cprintf>
  10195a:	83 c4 10             	add    $0x10,%esp

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  10195d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101964:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  10196b:	eb 3f                	jmp    1019ac <print_trapframe+0x16f>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  10196d:	8b 45 08             	mov    0x8(%ebp),%eax
  101970:	8b 50 40             	mov    0x40(%eax),%edx
  101973:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101976:	21 d0                	and    %edx,%eax
  101978:	85 c0                	test   %eax,%eax
  10197a:	74 29                	je     1019a5 <print_trapframe+0x168>
  10197c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10197f:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101986:	85 c0                	test   %eax,%eax
  101988:	74 1b                	je     1019a5 <print_trapframe+0x168>
            cprintf("%s,", IA32flags[i]);
  10198a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10198d:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101994:	83 ec 08             	sub    $0x8,%esp
  101997:	50                   	push   %eax
  101998:	68 ed 36 10 00       	push   $0x1036ed
  10199d:	e8 9b e8 ff ff       	call   10023d <cprintf>
  1019a2:	83 c4 10             	add    $0x10,%esp
    cprintf("  eip  0x%08x\n", tf->tf_eip);
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
    cprintf("  flag 0x%08x ", tf->tf_eflags);

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  1019a5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1019a9:	d1 65 f0             	shll   -0x10(%ebp)
  1019ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1019af:	83 f8 17             	cmp    $0x17,%eax
  1019b2:	76 b9                	jbe    10196d <print_trapframe+0x130>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
            cprintf("%s,", IA32flags[i]);
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  1019b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1019b7:	8b 40 40             	mov    0x40(%eax),%eax
  1019ba:	25 00 30 00 00       	and    $0x3000,%eax
  1019bf:	c1 e8 0c             	shr    $0xc,%eax
  1019c2:	83 ec 08             	sub    $0x8,%esp
  1019c5:	50                   	push   %eax
  1019c6:	68 f1 36 10 00       	push   $0x1036f1
  1019cb:	e8 6d e8 ff ff       	call   10023d <cprintf>
  1019d0:	83 c4 10             	add    $0x10,%esp

    if (!trap_in_kernel(tf)) {
  1019d3:	83 ec 0c             	sub    $0xc,%esp
  1019d6:	ff 75 08             	pushl  0x8(%ebp)
  1019d9:	e8 49 fe ff ff       	call   101827 <trap_in_kernel>
  1019de:	83 c4 10             	add    $0x10,%esp
  1019e1:	85 c0                	test   %eax,%eax
  1019e3:	75 32                	jne    101a17 <print_trapframe+0x1da>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  1019e5:	8b 45 08             	mov    0x8(%ebp),%eax
  1019e8:	8b 40 44             	mov    0x44(%eax),%eax
  1019eb:	83 ec 08             	sub    $0x8,%esp
  1019ee:	50                   	push   %eax
  1019ef:	68 fa 36 10 00       	push   $0x1036fa
  1019f4:	e8 44 e8 ff ff       	call   10023d <cprintf>
  1019f9:	83 c4 10             	add    $0x10,%esp
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  1019fc:	8b 45 08             	mov    0x8(%ebp),%eax
  1019ff:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101a03:	0f b7 c0             	movzwl %ax,%eax
  101a06:	83 ec 08             	sub    $0x8,%esp
  101a09:	50                   	push   %eax
  101a0a:	68 09 37 10 00       	push   $0x103709
  101a0f:	e8 29 e8 ff ff       	call   10023d <cprintf>
  101a14:	83 c4 10             	add    $0x10,%esp
    }
}
  101a17:	90                   	nop
  101a18:	c9                   	leave  
  101a19:	c3                   	ret    

00101a1a <print_regs>:

void
print_regs(struct pushregs *regs) {
  101a1a:	55                   	push   %ebp
  101a1b:	89 e5                	mov    %esp,%ebp
  101a1d:	83 ec 08             	sub    $0x8,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101a20:	8b 45 08             	mov    0x8(%ebp),%eax
  101a23:	8b 00                	mov    (%eax),%eax
  101a25:	83 ec 08             	sub    $0x8,%esp
  101a28:	50                   	push   %eax
  101a29:	68 1c 37 10 00       	push   $0x10371c
  101a2e:	e8 0a e8 ff ff       	call   10023d <cprintf>
  101a33:	83 c4 10             	add    $0x10,%esp
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101a36:	8b 45 08             	mov    0x8(%ebp),%eax
  101a39:	8b 40 04             	mov    0x4(%eax),%eax
  101a3c:	83 ec 08             	sub    $0x8,%esp
  101a3f:	50                   	push   %eax
  101a40:	68 2b 37 10 00       	push   $0x10372b
  101a45:	e8 f3 e7 ff ff       	call   10023d <cprintf>
  101a4a:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101a4d:	8b 45 08             	mov    0x8(%ebp),%eax
  101a50:	8b 40 08             	mov    0x8(%eax),%eax
  101a53:	83 ec 08             	sub    $0x8,%esp
  101a56:	50                   	push   %eax
  101a57:	68 3a 37 10 00       	push   $0x10373a
  101a5c:	e8 dc e7 ff ff       	call   10023d <cprintf>
  101a61:	83 c4 10             	add    $0x10,%esp
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101a64:	8b 45 08             	mov    0x8(%ebp),%eax
  101a67:	8b 40 0c             	mov    0xc(%eax),%eax
  101a6a:	83 ec 08             	sub    $0x8,%esp
  101a6d:	50                   	push   %eax
  101a6e:	68 49 37 10 00       	push   $0x103749
  101a73:	e8 c5 e7 ff ff       	call   10023d <cprintf>
  101a78:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101a7b:	8b 45 08             	mov    0x8(%ebp),%eax
  101a7e:	8b 40 10             	mov    0x10(%eax),%eax
  101a81:	83 ec 08             	sub    $0x8,%esp
  101a84:	50                   	push   %eax
  101a85:	68 58 37 10 00       	push   $0x103758
  101a8a:	e8 ae e7 ff ff       	call   10023d <cprintf>
  101a8f:	83 c4 10             	add    $0x10,%esp
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101a92:	8b 45 08             	mov    0x8(%ebp),%eax
  101a95:	8b 40 14             	mov    0x14(%eax),%eax
  101a98:	83 ec 08             	sub    $0x8,%esp
  101a9b:	50                   	push   %eax
  101a9c:	68 67 37 10 00       	push   $0x103767
  101aa1:	e8 97 e7 ff ff       	call   10023d <cprintf>
  101aa6:	83 c4 10             	add    $0x10,%esp
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101aa9:	8b 45 08             	mov    0x8(%ebp),%eax
  101aac:	8b 40 18             	mov    0x18(%eax),%eax
  101aaf:	83 ec 08             	sub    $0x8,%esp
  101ab2:	50                   	push   %eax
  101ab3:	68 76 37 10 00       	push   $0x103776
  101ab8:	e8 80 e7 ff ff       	call   10023d <cprintf>
  101abd:	83 c4 10             	add    $0x10,%esp
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101ac0:	8b 45 08             	mov    0x8(%ebp),%eax
  101ac3:	8b 40 1c             	mov    0x1c(%eax),%eax
  101ac6:	83 ec 08             	sub    $0x8,%esp
  101ac9:	50                   	push   %eax
  101aca:	68 85 37 10 00       	push   $0x103785
  101acf:	e8 69 e7 ff ff       	call   10023d <cprintf>
  101ad4:	83 c4 10             	add    $0x10,%esp
}
  101ad7:	90                   	nop
  101ad8:	c9                   	leave  
  101ad9:	c3                   	ret    

00101ada <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101ada:	55                   	push   %ebp
  101adb:	89 e5                	mov    %esp,%ebp
  101add:	83 ec 18             	sub    $0x18,%esp
    char c;

    switch (tf->tf_trapno) {
  101ae0:	8b 45 08             	mov    0x8(%ebp),%eax
  101ae3:	8b 40 30             	mov    0x30(%eax),%eax
  101ae6:	83 f8 2f             	cmp    $0x2f,%eax
  101ae9:	77 1e                	ja     101b09 <trap_dispatch+0x2f>
  101aeb:	83 f8 2e             	cmp    $0x2e,%eax
  101aee:	0f 83 b4 00 00 00    	jae    101ba8 <trap_dispatch+0xce>
  101af4:	83 f8 21             	cmp    $0x21,%eax
  101af7:	74 3e                	je     101b37 <trap_dispatch+0x5d>
  101af9:	83 f8 24             	cmp    $0x24,%eax
  101afc:	74 15                	je     101b13 <trap_dispatch+0x39>
  101afe:	83 f8 20             	cmp    $0x20,%eax
  101b01:	0f 84 a4 00 00 00    	je     101bab <trap_dispatch+0xd1>
  101b07:	eb 69                	jmp    101b72 <trap_dispatch+0x98>
  101b09:	83 e8 78             	sub    $0x78,%eax
  101b0c:	83 f8 01             	cmp    $0x1,%eax
  101b0f:	77 61                	ja     101b72 <trap_dispatch+0x98>
  101b11:	eb 48                	jmp    101b5b <trap_dispatch+0x81>
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        break;
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101b13:	e8 90 fa ff ff       	call   1015a8 <cons_getc>
  101b18:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101b1b:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101b1f:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101b23:	83 ec 04             	sub    $0x4,%esp
  101b26:	52                   	push   %edx
  101b27:	50                   	push   %eax
  101b28:	68 94 37 10 00       	push   $0x103794
  101b2d:	e8 0b e7 ff ff       	call   10023d <cprintf>
  101b32:	83 c4 10             	add    $0x10,%esp
        break;
  101b35:	eb 75                	jmp    101bac <trap_dispatch+0xd2>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101b37:	e8 6c fa ff ff       	call   1015a8 <cons_getc>
  101b3c:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101b3f:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101b43:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101b47:	83 ec 04             	sub    $0x4,%esp
  101b4a:	52                   	push   %edx
  101b4b:	50                   	push   %eax
  101b4c:	68 a6 37 10 00       	push   $0x1037a6
  101b51:	e8 e7 e6 ff ff       	call   10023d <cprintf>
  101b56:	83 c4 10             	add    $0x10,%esp
        break;
  101b59:	eb 51                	jmp    101bac <trap_dispatch+0xd2>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101b5b:	83 ec 04             	sub    $0x4,%esp
  101b5e:	68 b5 37 10 00       	push   $0x1037b5
  101b63:	68 a2 00 00 00       	push   $0xa2
  101b68:	68 c5 37 10 00       	push   $0x1037c5
  101b6d:	e8 31 e8 ff ff       	call   1003a3 <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101b72:	8b 45 08             	mov    0x8(%ebp),%eax
  101b75:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101b79:	0f b7 c0             	movzwl %ax,%eax
  101b7c:	83 e0 03             	and    $0x3,%eax
  101b7f:	85 c0                	test   %eax,%eax
  101b81:	75 29                	jne    101bac <trap_dispatch+0xd2>
            print_trapframe(tf);
  101b83:	83 ec 0c             	sub    $0xc,%esp
  101b86:	ff 75 08             	pushl  0x8(%ebp)
  101b89:	e8 af fc ff ff       	call   10183d <print_trapframe>
  101b8e:	83 c4 10             	add    $0x10,%esp
            panic("unexpected trap in kernel.\n");
  101b91:	83 ec 04             	sub    $0x4,%esp
  101b94:	68 d6 37 10 00       	push   $0x1037d6
  101b99:	68 ac 00 00 00       	push   $0xac
  101b9e:	68 c5 37 10 00       	push   $0x1037c5
  101ba3:	e8 fb e7 ff ff       	call   1003a3 <__panic>
        panic("T_SWITCH_** ??\n");
        break;
    case IRQ_OFFSET + IRQ_IDE1:
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
  101ba8:	90                   	nop
  101ba9:	eb 01                	jmp    101bac <trap_dispatch+0xd2>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        break;
  101bab:	90                   	nop
        if ((tf->tf_cs & 3) == 0) {
            print_trapframe(tf);
            panic("unexpected trap in kernel.\n");
        }
    }
}
  101bac:	90                   	nop
  101bad:	c9                   	leave  
  101bae:	c3                   	ret    

00101baf <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101baf:	55                   	push   %ebp
  101bb0:	89 e5                	mov    %esp,%ebp
  101bb2:	83 ec 08             	sub    $0x8,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101bb5:	83 ec 0c             	sub    $0xc,%esp
  101bb8:	ff 75 08             	pushl  0x8(%ebp)
  101bbb:	e8 1a ff ff ff       	call   101ada <trap_dispatch>
  101bc0:	83 c4 10             	add    $0x10,%esp
}
  101bc3:	90                   	nop
  101bc4:	c9                   	leave  
  101bc5:	c3                   	ret    

00101bc6 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101bc6:	6a 00                	push   $0x0
  pushl $0
  101bc8:	6a 00                	push   $0x0
  jmp __alltraps
  101bca:	e9 67 0a 00 00       	jmp    102636 <__alltraps>

00101bcf <vector1>:
.globl vector1
vector1:
  pushl $0
  101bcf:	6a 00                	push   $0x0
  pushl $1
  101bd1:	6a 01                	push   $0x1
  jmp __alltraps
  101bd3:	e9 5e 0a 00 00       	jmp    102636 <__alltraps>

00101bd8 <vector2>:
.globl vector2
vector2:
  pushl $0
  101bd8:	6a 00                	push   $0x0
  pushl $2
  101bda:	6a 02                	push   $0x2
  jmp __alltraps
  101bdc:	e9 55 0a 00 00       	jmp    102636 <__alltraps>

00101be1 <vector3>:
.globl vector3
vector3:
  pushl $0
  101be1:	6a 00                	push   $0x0
  pushl $3
  101be3:	6a 03                	push   $0x3
  jmp __alltraps
  101be5:	e9 4c 0a 00 00       	jmp    102636 <__alltraps>

00101bea <vector4>:
.globl vector4
vector4:
  pushl $0
  101bea:	6a 00                	push   $0x0
  pushl $4
  101bec:	6a 04                	push   $0x4
  jmp __alltraps
  101bee:	e9 43 0a 00 00       	jmp    102636 <__alltraps>

00101bf3 <vector5>:
.globl vector5
vector5:
  pushl $0
  101bf3:	6a 00                	push   $0x0
  pushl $5
  101bf5:	6a 05                	push   $0x5
  jmp __alltraps
  101bf7:	e9 3a 0a 00 00       	jmp    102636 <__alltraps>

00101bfc <vector6>:
.globl vector6
vector6:
  pushl $0
  101bfc:	6a 00                	push   $0x0
  pushl $6
  101bfe:	6a 06                	push   $0x6
  jmp __alltraps
  101c00:	e9 31 0a 00 00       	jmp    102636 <__alltraps>

00101c05 <vector7>:
.globl vector7
vector7:
  pushl $0
  101c05:	6a 00                	push   $0x0
  pushl $7
  101c07:	6a 07                	push   $0x7
  jmp __alltraps
  101c09:	e9 28 0a 00 00       	jmp    102636 <__alltraps>

00101c0e <vector8>:
.globl vector8
vector8:
  pushl $8
  101c0e:	6a 08                	push   $0x8
  jmp __alltraps
  101c10:	e9 21 0a 00 00       	jmp    102636 <__alltraps>

00101c15 <vector9>:
.globl vector9
vector9:
  pushl $9
  101c15:	6a 09                	push   $0x9
  jmp __alltraps
  101c17:	e9 1a 0a 00 00       	jmp    102636 <__alltraps>

00101c1c <vector10>:
.globl vector10
vector10:
  pushl $10
  101c1c:	6a 0a                	push   $0xa
  jmp __alltraps
  101c1e:	e9 13 0a 00 00       	jmp    102636 <__alltraps>

00101c23 <vector11>:
.globl vector11
vector11:
  pushl $11
  101c23:	6a 0b                	push   $0xb
  jmp __alltraps
  101c25:	e9 0c 0a 00 00       	jmp    102636 <__alltraps>

00101c2a <vector12>:
.globl vector12
vector12:
  pushl $12
  101c2a:	6a 0c                	push   $0xc
  jmp __alltraps
  101c2c:	e9 05 0a 00 00       	jmp    102636 <__alltraps>

00101c31 <vector13>:
.globl vector13
vector13:
  pushl $13
  101c31:	6a 0d                	push   $0xd
  jmp __alltraps
  101c33:	e9 fe 09 00 00       	jmp    102636 <__alltraps>

00101c38 <vector14>:
.globl vector14
vector14:
  pushl $14
  101c38:	6a 0e                	push   $0xe
  jmp __alltraps
  101c3a:	e9 f7 09 00 00       	jmp    102636 <__alltraps>

00101c3f <vector15>:
.globl vector15
vector15:
  pushl $0
  101c3f:	6a 00                	push   $0x0
  pushl $15
  101c41:	6a 0f                	push   $0xf
  jmp __alltraps
  101c43:	e9 ee 09 00 00       	jmp    102636 <__alltraps>

00101c48 <vector16>:
.globl vector16
vector16:
  pushl $0
  101c48:	6a 00                	push   $0x0
  pushl $16
  101c4a:	6a 10                	push   $0x10
  jmp __alltraps
  101c4c:	e9 e5 09 00 00       	jmp    102636 <__alltraps>

00101c51 <vector17>:
.globl vector17
vector17:
  pushl $17
  101c51:	6a 11                	push   $0x11
  jmp __alltraps
  101c53:	e9 de 09 00 00       	jmp    102636 <__alltraps>

00101c58 <vector18>:
.globl vector18
vector18:
  pushl $0
  101c58:	6a 00                	push   $0x0
  pushl $18
  101c5a:	6a 12                	push   $0x12
  jmp __alltraps
  101c5c:	e9 d5 09 00 00       	jmp    102636 <__alltraps>

00101c61 <vector19>:
.globl vector19
vector19:
  pushl $0
  101c61:	6a 00                	push   $0x0
  pushl $19
  101c63:	6a 13                	push   $0x13
  jmp __alltraps
  101c65:	e9 cc 09 00 00       	jmp    102636 <__alltraps>

00101c6a <vector20>:
.globl vector20
vector20:
  pushl $0
  101c6a:	6a 00                	push   $0x0
  pushl $20
  101c6c:	6a 14                	push   $0x14
  jmp __alltraps
  101c6e:	e9 c3 09 00 00       	jmp    102636 <__alltraps>

00101c73 <vector21>:
.globl vector21
vector21:
  pushl $0
  101c73:	6a 00                	push   $0x0
  pushl $21
  101c75:	6a 15                	push   $0x15
  jmp __alltraps
  101c77:	e9 ba 09 00 00       	jmp    102636 <__alltraps>

00101c7c <vector22>:
.globl vector22
vector22:
  pushl $0
  101c7c:	6a 00                	push   $0x0
  pushl $22
  101c7e:	6a 16                	push   $0x16
  jmp __alltraps
  101c80:	e9 b1 09 00 00       	jmp    102636 <__alltraps>

00101c85 <vector23>:
.globl vector23
vector23:
  pushl $0
  101c85:	6a 00                	push   $0x0
  pushl $23
  101c87:	6a 17                	push   $0x17
  jmp __alltraps
  101c89:	e9 a8 09 00 00       	jmp    102636 <__alltraps>

00101c8e <vector24>:
.globl vector24
vector24:
  pushl $0
  101c8e:	6a 00                	push   $0x0
  pushl $24
  101c90:	6a 18                	push   $0x18
  jmp __alltraps
  101c92:	e9 9f 09 00 00       	jmp    102636 <__alltraps>

00101c97 <vector25>:
.globl vector25
vector25:
  pushl $0
  101c97:	6a 00                	push   $0x0
  pushl $25
  101c99:	6a 19                	push   $0x19
  jmp __alltraps
  101c9b:	e9 96 09 00 00       	jmp    102636 <__alltraps>

00101ca0 <vector26>:
.globl vector26
vector26:
  pushl $0
  101ca0:	6a 00                	push   $0x0
  pushl $26
  101ca2:	6a 1a                	push   $0x1a
  jmp __alltraps
  101ca4:	e9 8d 09 00 00       	jmp    102636 <__alltraps>

00101ca9 <vector27>:
.globl vector27
vector27:
  pushl $0
  101ca9:	6a 00                	push   $0x0
  pushl $27
  101cab:	6a 1b                	push   $0x1b
  jmp __alltraps
  101cad:	e9 84 09 00 00       	jmp    102636 <__alltraps>

00101cb2 <vector28>:
.globl vector28
vector28:
  pushl $0
  101cb2:	6a 00                	push   $0x0
  pushl $28
  101cb4:	6a 1c                	push   $0x1c
  jmp __alltraps
  101cb6:	e9 7b 09 00 00       	jmp    102636 <__alltraps>

00101cbb <vector29>:
.globl vector29
vector29:
  pushl $0
  101cbb:	6a 00                	push   $0x0
  pushl $29
  101cbd:	6a 1d                	push   $0x1d
  jmp __alltraps
  101cbf:	e9 72 09 00 00       	jmp    102636 <__alltraps>

00101cc4 <vector30>:
.globl vector30
vector30:
  pushl $0
  101cc4:	6a 00                	push   $0x0
  pushl $30
  101cc6:	6a 1e                	push   $0x1e
  jmp __alltraps
  101cc8:	e9 69 09 00 00       	jmp    102636 <__alltraps>

00101ccd <vector31>:
.globl vector31
vector31:
  pushl $0
  101ccd:	6a 00                	push   $0x0
  pushl $31
  101ccf:	6a 1f                	push   $0x1f
  jmp __alltraps
  101cd1:	e9 60 09 00 00       	jmp    102636 <__alltraps>

00101cd6 <vector32>:
.globl vector32
vector32:
  pushl $0
  101cd6:	6a 00                	push   $0x0
  pushl $32
  101cd8:	6a 20                	push   $0x20
  jmp __alltraps
  101cda:	e9 57 09 00 00       	jmp    102636 <__alltraps>

00101cdf <vector33>:
.globl vector33
vector33:
  pushl $0
  101cdf:	6a 00                	push   $0x0
  pushl $33
  101ce1:	6a 21                	push   $0x21
  jmp __alltraps
  101ce3:	e9 4e 09 00 00       	jmp    102636 <__alltraps>

00101ce8 <vector34>:
.globl vector34
vector34:
  pushl $0
  101ce8:	6a 00                	push   $0x0
  pushl $34
  101cea:	6a 22                	push   $0x22
  jmp __alltraps
  101cec:	e9 45 09 00 00       	jmp    102636 <__alltraps>

00101cf1 <vector35>:
.globl vector35
vector35:
  pushl $0
  101cf1:	6a 00                	push   $0x0
  pushl $35
  101cf3:	6a 23                	push   $0x23
  jmp __alltraps
  101cf5:	e9 3c 09 00 00       	jmp    102636 <__alltraps>

00101cfa <vector36>:
.globl vector36
vector36:
  pushl $0
  101cfa:	6a 00                	push   $0x0
  pushl $36
  101cfc:	6a 24                	push   $0x24
  jmp __alltraps
  101cfe:	e9 33 09 00 00       	jmp    102636 <__alltraps>

00101d03 <vector37>:
.globl vector37
vector37:
  pushl $0
  101d03:	6a 00                	push   $0x0
  pushl $37
  101d05:	6a 25                	push   $0x25
  jmp __alltraps
  101d07:	e9 2a 09 00 00       	jmp    102636 <__alltraps>

00101d0c <vector38>:
.globl vector38
vector38:
  pushl $0
  101d0c:	6a 00                	push   $0x0
  pushl $38
  101d0e:	6a 26                	push   $0x26
  jmp __alltraps
  101d10:	e9 21 09 00 00       	jmp    102636 <__alltraps>

00101d15 <vector39>:
.globl vector39
vector39:
  pushl $0
  101d15:	6a 00                	push   $0x0
  pushl $39
  101d17:	6a 27                	push   $0x27
  jmp __alltraps
  101d19:	e9 18 09 00 00       	jmp    102636 <__alltraps>

00101d1e <vector40>:
.globl vector40
vector40:
  pushl $0
  101d1e:	6a 00                	push   $0x0
  pushl $40
  101d20:	6a 28                	push   $0x28
  jmp __alltraps
  101d22:	e9 0f 09 00 00       	jmp    102636 <__alltraps>

00101d27 <vector41>:
.globl vector41
vector41:
  pushl $0
  101d27:	6a 00                	push   $0x0
  pushl $41
  101d29:	6a 29                	push   $0x29
  jmp __alltraps
  101d2b:	e9 06 09 00 00       	jmp    102636 <__alltraps>

00101d30 <vector42>:
.globl vector42
vector42:
  pushl $0
  101d30:	6a 00                	push   $0x0
  pushl $42
  101d32:	6a 2a                	push   $0x2a
  jmp __alltraps
  101d34:	e9 fd 08 00 00       	jmp    102636 <__alltraps>

00101d39 <vector43>:
.globl vector43
vector43:
  pushl $0
  101d39:	6a 00                	push   $0x0
  pushl $43
  101d3b:	6a 2b                	push   $0x2b
  jmp __alltraps
  101d3d:	e9 f4 08 00 00       	jmp    102636 <__alltraps>

00101d42 <vector44>:
.globl vector44
vector44:
  pushl $0
  101d42:	6a 00                	push   $0x0
  pushl $44
  101d44:	6a 2c                	push   $0x2c
  jmp __alltraps
  101d46:	e9 eb 08 00 00       	jmp    102636 <__alltraps>

00101d4b <vector45>:
.globl vector45
vector45:
  pushl $0
  101d4b:	6a 00                	push   $0x0
  pushl $45
  101d4d:	6a 2d                	push   $0x2d
  jmp __alltraps
  101d4f:	e9 e2 08 00 00       	jmp    102636 <__alltraps>

00101d54 <vector46>:
.globl vector46
vector46:
  pushl $0
  101d54:	6a 00                	push   $0x0
  pushl $46
  101d56:	6a 2e                	push   $0x2e
  jmp __alltraps
  101d58:	e9 d9 08 00 00       	jmp    102636 <__alltraps>

00101d5d <vector47>:
.globl vector47
vector47:
  pushl $0
  101d5d:	6a 00                	push   $0x0
  pushl $47
  101d5f:	6a 2f                	push   $0x2f
  jmp __alltraps
  101d61:	e9 d0 08 00 00       	jmp    102636 <__alltraps>

00101d66 <vector48>:
.globl vector48
vector48:
  pushl $0
  101d66:	6a 00                	push   $0x0
  pushl $48
  101d68:	6a 30                	push   $0x30
  jmp __alltraps
  101d6a:	e9 c7 08 00 00       	jmp    102636 <__alltraps>

00101d6f <vector49>:
.globl vector49
vector49:
  pushl $0
  101d6f:	6a 00                	push   $0x0
  pushl $49
  101d71:	6a 31                	push   $0x31
  jmp __alltraps
  101d73:	e9 be 08 00 00       	jmp    102636 <__alltraps>

00101d78 <vector50>:
.globl vector50
vector50:
  pushl $0
  101d78:	6a 00                	push   $0x0
  pushl $50
  101d7a:	6a 32                	push   $0x32
  jmp __alltraps
  101d7c:	e9 b5 08 00 00       	jmp    102636 <__alltraps>

00101d81 <vector51>:
.globl vector51
vector51:
  pushl $0
  101d81:	6a 00                	push   $0x0
  pushl $51
  101d83:	6a 33                	push   $0x33
  jmp __alltraps
  101d85:	e9 ac 08 00 00       	jmp    102636 <__alltraps>

00101d8a <vector52>:
.globl vector52
vector52:
  pushl $0
  101d8a:	6a 00                	push   $0x0
  pushl $52
  101d8c:	6a 34                	push   $0x34
  jmp __alltraps
  101d8e:	e9 a3 08 00 00       	jmp    102636 <__alltraps>

00101d93 <vector53>:
.globl vector53
vector53:
  pushl $0
  101d93:	6a 00                	push   $0x0
  pushl $53
  101d95:	6a 35                	push   $0x35
  jmp __alltraps
  101d97:	e9 9a 08 00 00       	jmp    102636 <__alltraps>

00101d9c <vector54>:
.globl vector54
vector54:
  pushl $0
  101d9c:	6a 00                	push   $0x0
  pushl $54
  101d9e:	6a 36                	push   $0x36
  jmp __alltraps
  101da0:	e9 91 08 00 00       	jmp    102636 <__alltraps>

00101da5 <vector55>:
.globl vector55
vector55:
  pushl $0
  101da5:	6a 00                	push   $0x0
  pushl $55
  101da7:	6a 37                	push   $0x37
  jmp __alltraps
  101da9:	e9 88 08 00 00       	jmp    102636 <__alltraps>

00101dae <vector56>:
.globl vector56
vector56:
  pushl $0
  101dae:	6a 00                	push   $0x0
  pushl $56
  101db0:	6a 38                	push   $0x38
  jmp __alltraps
  101db2:	e9 7f 08 00 00       	jmp    102636 <__alltraps>

00101db7 <vector57>:
.globl vector57
vector57:
  pushl $0
  101db7:	6a 00                	push   $0x0
  pushl $57
  101db9:	6a 39                	push   $0x39
  jmp __alltraps
  101dbb:	e9 76 08 00 00       	jmp    102636 <__alltraps>

00101dc0 <vector58>:
.globl vector58
vector58:
  pushl $0
  101dc0:	6a 00                	push   $0x0
  pushl $58
  101dc2:	6a 3a                	push   $0x3a
  jmp __alltraps
  101dc4:	e9 6d 08 00 00       	jmp    102636 <__alltraps>

00101dc9 <vector59>:
.globl vector59
vector59:
  pushl $0
  101dc9:	6a 00                	push   $0x0
  pushl $59
  101dcb:	6a 3b                	push   $0x3b
  jmp __alltraps
  101dcd:	e9 64 08 00 00       	jmp    102636 <__alltraps>

00101dd2 <vector60>:
.globl vector60
vector60:
  pushl $0
  101dd2:	6a 00                	push   $0x0
  pushl $60
  101dd4:	6a 3c                	push   $0x3c
  jmp __alltraps
  101dd6:	e9 5b 08 00 00       	jmp    102636 <__alltraps>

00101ddb <vector61>:
.globl vector61
vector61:
  pushl $0
  101ddb:	6a 00                	push   $0x0
  pushl $61
  101ddd:	6a 3d                	push   $0x3d
  jmp __alltraps
  101ddf:	e9 52 08 00 00       	jmp    102636 <__alltraps>

00101de4 <vector62>:
.globl vector62
vector62:
  pushl $0
  101de4:	6a 00                	push   $0x0
  pushl $62
  101de6:	6a 3e                	push   $0x3e
  jmp __alltraps
  101de8:	e9 49 08 00 00       	jmp    102636 <__alltraps>

00101ded <vector63>:
.globl vector63
vector63:
  pushl $0
  101ded:	6a 00                	push   $0x0
  pushl $63
  101def:	6a 3f                	push   $0x3f
  jmp __alltraps
  101df1:	e9 40 08 00 00       	jmp    102636 <__alltraps>

00101df6 <vector64>:
.globl vector64
vector64:
  pushl $0
  101df6:	6a 00                	push   $0x0
  pushl $64
  101df8:	6a 40                	push   $0x40
  jmp __alltraps
  101dfa:	e9 37 08 00 00       	jmp    102636 <__alltraps>

00101dff <vector65>:
.globl vector65
vector65:
  pushl $0
  101dff:	6a 00                	push   $0x0
  pushl $65
  101e01:	6a 41                	push   $0x41
  jmp __alltraps
  101e03:	e9 2e 08 00 00       	jmp    102636 <__alltraps>

00101e08 <vector66>:
.globl vector66
vector66:
  pushl $0
  101e08:	6a 00                	push   $0x0
  pushl $66
  101e0a:	6a 42                	push   $0x42
  jmp __alltraps
  101e0c:	e9 25 08 00 00       	jmp    102636 <__alltraps>

00101e11 <vector67>:
.globl vector67
vector67:
  pushl $0
  101e11:	6a 00                	push   $0x0
  pushl $67
  101e13:	6a 43                	push   $0x43
  jmp __alltraps
  101e15:	e9 1c 08 00 00       	jmp    102636 <__alltraps>

00101e1a <vector68>:
.globl vector68
vector68:
  pushl $0
  101e1a:	6a 00                	push   $0x0
  pushl $68
  101e1c:	6a 44                	push   $0x44
  jmp __alltraps
  101e1e:	e9 13 08 00 00       	jmp    102636 <__alltraps>

00101e23 <vector69>:
.globl vector69
vector69:
  pushl $0
  101e23:	6a 00                	push   $0x0
  pushl $69
  101e25:	6a 45                	push   $0x45
  jmp __alltraps
  101e27:	e9 0a 08 00 00       	jmp    102636 <__alltraps>

00101e2c <vector70>:
.globl vector70
vector70:
  pushl $0
  101e2c:	6a 00                	push   $0x0
  pushl $70
  101e2e:	6a 46                	push   $0x46
  jmp __alltraps
  101e30:	e9 01 08 00 00       	jmp    102636 <__alltraps>

00101e35 <vector71>:
.globl vector71
vector71:
  pushl $0
  101e35:	6a 00                	push   $0x0
  pushl $71
  101e37:	6a 47                	push   $0x47
  jmp __alltraps
  101e39:	e9 f8 07 00 00       	jmp    102636 <__alltraps>

00101e3e <vector72>:
.globl vector72
vector72:
  pushl $0
  101e3e:	6a 00                	push   $0x0
  pushl $72
  101e40:	6a 48                	push   $0x48
  jmp __alltraps
  101e42:	e9 ef 07 00 00       	jmp    102636 <__alltraps>

00101e47 <vector73>:
.globl vector73
vector73:
  pushl $0
  101e47:	6a 00                	push   $0x0
  pushl $73
  101e49:	6a 49                	push   $0x49
  jmp __alltraps
  101e4b:	e9 e6 07 00 00       	jmp    102636 <__alltraps>

00101e50 <vector74>:
.globl vector74
vector74:
  pushl $0
  101e50:	6a 00                	push   $0x0
  pushl $74
  101e52:	6a 4a                	push   $0x4a
  jmp __alltraps
  101e54:	e9 dd 07 00 00       	jmp    102636 <__alltraps>

00101e59 <vector75>:
.globl vector75
vector75:
  pushl $0
  101e59:	6a 00                	push   $0x0
  pushl $75
  101e5b:	6a 4b                	push   $0x4b
  jmp __alltraps
  101e5d:	e9 d4 07 00 00       	jmp    102636 <__alltraps>

00101e62 <vector76>:
.globl vector76
vector76:
  pushl $0
  101e62:	6a 00                	push   $0x0
  pushl $76
  101e64:	6a 4c                	push   $0x4c
  jmp __alltraps
  101e66:	e9 cb 07 00 00       	jmp    102636 <__alltraps>

00101e6b <vector77>:
.globl vector77
vector77:
  pushl $0
  101e6b:	6a 00                	push   $0x0
  pushl $77
  101e6d:	6a 4d                	push   $0x4d
  jmp __alltraps
  101e6f:	e9 c2 07 00 00       	jmp    102636 <__alltraps>

00101e74 <vector78>:
.globl vector78
vector78:
  pushl $0
  101e74:	6a 00                	push   $0x0
  pushl $78
  101e76:	6a 4e                	push   $0x4e
  jmp __alltraps
  101e78:	e9 b9 07 00 00       	jmp    102636 <__alltraps>

00101e7d <vector79>:
.globl vector79
vector79:
  pushl $0
  101e7d:	6a 00                	push   $0x0
  pushl $79
  101e7f:	6a 4f                	push   $0x4f
  jmp __alltraps
  101e81:	e9 b0 07 00 00       	jmp    102636 <__alltraps>

00101e86 <vector80>:
.globl vector80
vector80:
  pushl $0
  101e86:	6a 00                	push   $0x0
  pushl $80
  101e88:	6a 50                	push   $0x50
  jmp __alltraps
  101e8a:	e9 a7 07 00 00       	jmp    102636 <__alltraps>

00101e8f <vector81>:
.globl vector81
vector81:
  pushl $0
  101e8f:	6a 00                	push   $0x0
  pushl $81
  101e91:	6a 51                	push   $0x51
  jmp __alltraps
  101e93:	e9 9e 07 00 00       	jmp    102636 <__alltraps>

00101e98 <vector82>:
.globl vector82
vector82:
  pushl $0
  101e98:	6a 00                	push   $0x0
  pushl $82
  101e9a:	6a 52                	push   $0x52
  jmp __alltraps
  101e9c:	e9 95 07 00 00       	jmp    102636 <__alltraps>

00101ea1 <vector83>:
.globl vector83
vector83:
  pushl $0
  101ea1:	6a 00                	push   $0x0
  pushl $83
  101ea3:	6a 53                	push   $0x53
  jmp __alltraps
  101ea5:	e9 8c 07 00 00       	jmp    102636 <__alltraps>

00101eaa <vector84>:
.globl vector84
vector84:
  pushl $0
  101eaa:	6a 00                	push   $0x0
  pushl $84
  101eac:	6a 54                	push   $0x54
  jmp __alltraps
  101eae:	e9 83 07 00 00       	jmp    102636 <__alltraps>

00101eb3 <vector85>:
.globl vector85
vector85:
  pushl $0
  101eb3:	6a 00                	push   $0x0
  pushl $85
  101eb5:	6a 55                	push   $0x55
  jmp __alltraps
  101eb7:	e9 7a 07 00 00       	jmp    102636 <__alltraps>

00101ebc <vector86>:
.globl vector86
vector86:
  pushl $0
  101ebc:	6a 00                	push   $0x0
  pushl $86
  101ebe:	6a 56                	push   $0x56
  jmp __alltraps
  101ec0:	e9 71 07 00 00       	jmp    102636 <__alltraps>

00101ec5 <vector87>:
.globl vector87
vector87:
  pushl $0
  101ec5:	6a 00                	push   $0x0
  pushl $87
  101ec7:	6a 57                	push   $0x57
  jmp __alltraps
  101ec9:	e9 68 07 00 00       	jmp    102636 <__alltraps>

00101ece <vector88>:
.globl vector88
vector88:
  pushl $0
  101ece:	6a 00                	push   $0x0
  pushl $88
  101ed0:	6a 58                	push   $0x58
  jmp __alltraps
  101ed2:	e9 5f 07 00 00       	jmp    102636 <__alltraps>

00101ed7 <vector89>:
.globl vector89
vector89:
  pushl $0
  101ed7:	6a 00                	push   $0x0
  pushl $89
  101ed9:	6a 59                	push   $0x59
  jmp __alltraps
  101edb:	e9 56 07 00 00       	jmp    102636 <__alltraps>

00101ee0 <vector90>:
.globl vector90
vector90:
  pushl $0
  101ee0:	6a 00                	push   $0x0
  pushl $90
  101ee2:	6a 5a                	push   $0x5a
  jmp __alltraps
  101ee4:	e9 4d 07 00 00       	jmp    102636 <__alltraps>

00101ee9 <vector91>:
.globl vector91
vector91:
  pushl $0
  101ee9:	6a 00                	push   $0x0
  pushl $91
  101eeb:	6a 5b                	push   $0x5b
  jmp __alltraps
  101eed:	e9 44 07 00 00       	jmp    102636 <__alltraps>

00101ef2 <vector92>:
.globl vector92
vector92:
  pushl $0
  101ef2:	6a 00                	push   $0x0
  pushl $92
  101ef4:	6a 5c                	push   $0x5c
  jmp __alltraps
  101ef6:	e9 3b 07 00 00       	jmp    102636 <__alltraps>

00101efb <vector93>:
.globl vector93
vector93:
  pushl $0
  101efb:	6a 00                	push   $0x0
  pushl $93
  101efd:	6a 5d                	push   $0x5d
  jmp __alltraps
  101eff:	e9 32 07 00 00       	jmp    102636 <__alltraps>

00101f04 <vector94>:
.globl vector94
vector94:
  pushl $0
  101f04:	6a 00                	push   $0x0
  pushl $94
  101f06:	6a 5e                	push   $0x5e
  jmp __alltraps
  101f08:	e9 29 07 00 00       	jmp    102636 <__alltraps>

00101f0d <vector95>:
.globl vector95
vector95:
  pushl $0
  101f0d:	6a 00                	push   $0x0
  pushl $95
  101f0f:	6a 5f                	push   $0x5f
  jmp __alltraps
  101f11:	e9 20 07 00 00       	jmp    102636 <__alltraps>

00101f16 <vector96>:
.globl vector96
vector96:
  pushl $0
  101f16:	6a 00                	push   $0x0
  pushl $96
  101f18:	6a 60                	push   $0x60
  jmp __alltraps
  101f1a:	e9 17 07 00 00       	jmp    102636 <__alltraps>

00101f1f <vector97>:
.globl vector97
vector97:
  pushl $0
  101f1f:	6a 00                	push   $0x0
  pushl $97
  101f21:	6a 61                	push   $0x61
  jmp __alltraps
  101f23:	e9 0e 07 00 00       	jmp    102636 <__alltraps>

00101f28 <vector98>:
.globl vector98
vector98:
  pushl $0
  101f28:	6a 00                	push   $0x0
  pushl $98
  101f2a:	6a 62                	push   $0x62
  jmp __alltraps
  101f2c:	e9 05 07 00 00       	jmp    102636 <__alltraps>

00101f31 <vector99>:
.globl vector99
vector99:
  pushl $0
  101f31:	6a 00                	push   $0x0
  pushl $99
  101f33:	6a 63                	push   $0x63
  jmp __alltraps
  101f35:	e9 fc 06 00 00       	jmp    102636 <__alltraps>

00101f3a <vector100>:
.globl vector100
vector100:
  pushl $0
  101f3a:	6a 00                	push   $0x0
  pushl $100
  101f3c:	6a 64                	push   $0x64
  jmp __alltraps
  101f3e:	e9 f3 06 00 00       	jmp    102636 <__alltraps>

00101f43 <vector101>:
.globl vector101
vector101:
  pushl $0
  101f43:	6a 00                	push   $0x0
  pushl $101
  101f45:	6a 65                	push   $0x65
  jmp __alltraps
  101f47:	e9 ea 06 00 00       	jmp    102636 <__alltraps>

00101f4c <vector102>:
.globl vector102
vector102:
  pushl $0
  101f4c:	6a 00                	push   $0x0
  pushl $102
  101f4e:	6a 66                	push   $0x66
  jmp __alltraps
  101f50:	e9 e1 06 00 00       	jmp    102636 <__alltraps>

00101f55 <vector103>:
.globl vector103
vector103:
  pushl $0
  101f55:	6a 00                	push   $0x0
  pushl $103
  101f57:	6a 67                	push   $0x67
  jmp __alltraps
  101f59:	e9 d8 06 00 00       	jmp    102636 <__alltraps>

00101f5e <vector104>:
.globl vector104
vector104:
  pushl $0
  101f5e:	6a 00                	push   $0x0
  pushl $104
  101f60:	6a 68                	push   $0x68
  jmp __alltraps
  101f62:	e9 cf 06 00 00       	jmp    102636 <__alltraps>

00101f67 <vector105>:
.globl vector105
vector105:
  pushl $0
  101f67:	6a 00                	push   $0x0
  pushl $105
  101f69:	6a 69                	push   $0x69
  jmp __alltraps
  101f6b:	e9 c6 06 00 00       	jmp    102636 <__alltraps>

00101f70 <vector106>:
.globl vector106
vector106:
  pushl $0
  101f70:	6a 00                	push   $0x0
  pushl $106
  101f72:	6a 6a                	push   $0x6a
  jmp __alltraps
  101f74:	e9 bd 06 00 00       	jmp    102636 <__alltraps>

00101f79 <vector107>:
.globl vector107
vector107:
  pushl $0
  101f79:	6a 00                	push   $0x0
  pushl $107
  101f7b:	6a 6b                	push   $0x6b
  jmp __alltraps
  101f7d:	e9 b4 06 00 00       	jmp    102636 <__alltraps>

00101f82 <vector108>:
.globl vector108
vector108:
  pushl $0
  101f82:	6a 00                	push   $0x0
  pushl $108
  101f84:	6a 6c                	push   $0x6c
  jmp __alltraps
  101f86:	e9 ab 06 00 00       	jmp    102636 <__alltraps>

00101f8b <vector109>:
.globl vector109
vector109:
  pushl $0
  101f8b:	6a 00                	push   $0x0
  pushl $109
  101f8d:	6a 6d                	push   $0x6d
  jmp __alltraps
  101f8f:	e9 a2 06 00 00       	jmp    102636 <__alltraps>

00101f94 <vector110>:
.globl vector110
vector110:
  pushl $0
  101f94:	6a 00                	push   $0x0
  pushl $110
  101f96:	6a 6e                	push   $0x6e
  jmp __alltraps
  101f98:	e9 99 06 00 00       	jmp    102636 <__alltraps>

00101f9d <vector111>:
.globl vector111
vector111:
  pushl $0
  101f9d:	6a 00                	push   $0x0
  pushl $111
  101f9f:	6a 6f                	push   $0x6f
  jmp __alltraps
  101fa1:	e9 90 06 00 00       	jmp    102636 <__alltraps>

00101fa6 <vector112>:
.globl vector112
vector112:
  pushl $0
  101fa6:	6a 00                	push   $0x0
  pushl $112
  101fa8:	6a 70                	push   $0x70
  jmp __alltraps
  101faa:	e9 87 06 00 00       	jmp    102636 <__alltraps>

00101faf <vector113>:
.globl vector113
vector113:
  pushl $0
  101faf:	6a 00                	push   $0x0
  pushl $113
  101fb1:	6a 71                	push   $0x71
  jmp __alltraps
  101fb3:	e9 7e 06 00 00       	jmp    102636 <__alltraps>

00101fb8 <vector114>:
.globl vector114
vector114:
  pushl $0
  101fb8:	6a 00                	push   $0x0
  pushl $114
  101fba:	6a 72                	push   $0x72
  jmp __alltraps
  101fbc:	e9 75 06 00 00       	jmp    102636 <__alltraps>

00101fc1 <vector115>:
.globl vector115
vector115:
  pushl $0
  101fc1:	6a 00                	push   $0x0
  pushl $115
  101fc3:	6a 73                	push   $0x73
  jmp __alltraps
  101fc5:	e9 6c 06 00 00       	jmp    102636 <__alltraps>

00101fca <vector116>:
.globl vector116
vector116:
  pushl $0
  101fca:	6a 00                	push   $0x0
  pushl $116
  101fcc:	6a 74                	push   $0x74
  jmp __alltraps
  101fce:	e9 63 06 00 00       	jmp    102636 <__alltraps>

00101fd3 <vector117>:
.globl vector117
vector117:
  pushl $0
  101fd3:	6a 00                	push   $0x0
  pushl $117
  101fd5:	6a 75                	push   $0x75
  jmp __alltraps
  101fd7:	e9 5a 06 00 00       	jmp    102636 <__alltraps>

00101fdc <vector118>:
.globl vector118
vector118:
  pushl $0
  101fdc:	6a 00                	push   $0x0
  pushl $118
  101fde:	6a 76                	push   $0x76
  jmp __alltraps
  101fe0:	e9 51 06 00 00       	jmp    102636 <__alltraps>

00101fe5 <vector119>:
.globl vector119
vector119:
  pushl $0
  101fe5:	6a 00                	push   $0x0
  pushl $119
  101fe7:	6a 77                	push   $0x77
  jmp __alltraps
  101fe9:	e9 48 06 00 00       	jmp    102636 <__alltraps>

00101fee <vector120>:
.globl vector120
vector120:
  pushl $0
  101fee:	6a 00                	push   $0x0
  pushl $120
  101ff0:	6a 78                	push   $0x78
  jmp __alltraps
  101ff2:	e9 3f 06 00 00       	jmp    102636 <__alltraps>

00101ff7 <vector121>:
.globl vector121
vector121:
  pushl $0
  101ff7:	6a 00                	push   $0x0
  pushl $121
  101ff9:	6a 79                	push   $0x79
  jmp __alltraps
  101ffb:	e9 36 06 00 00       	jmp    102636 <__alltraps>

00102000 <vector122>:
.globl vector122
vector122:
  pushl $0
  102000:	6a 00                	push   $0x0
  pushl $122
  102002:	6a 7a                	push   $0x7a
  jmp __alltraps
  102004:	e9 2d 06 00 00       	jmp    102636 <__alltraps>

00102009 <vector123>:
.globl vector123
vector123:
  pushl $0
  102009:	6a 00                	push   $0x0
  pushl $123
  10200b:	6a 7b                	push   $0x7b
  jmp __alltraps
  10200d:	e9 24 06 00 00       	jmp    102636 <__alltraps>

00102012 <vector124>:
.globl vector124
vector124:
  pushl $0
  102012:	6a 00                	push   $0x0
  pushl $124
  102014:	6a 7c                	push   $0x7c
  jmp __alltraps
  102016:	e9 1b 06 00 00       	jmp    102636 <__alltraps>

0010201b <vector125>:
.globl vector125
vector125:
  pushl $0
  10201b:	6a 00                	push   $0x0
  pushl $125
  10201d:	6a 7d                	push   $0x7d
  jmp __alltraps
  10201f:	e9 12 06 00 00       	jmp    102636 <__alltraps>

00102024 <vector126>:
.globl vector126
vector126:
  pushl $0
  102024:	6a 00                	push   $0x0
  pushl $126
  102026:	6a 7e                	push   $0x7e
  jmp __alltraps
  102028:	e9 09 06 00 00       	jmp    102636 <__alltraps>

0010202d <vector127>:
.globl vector127
vector127:
  pushl $0
  10202d:	6a 00                	push   $0x0
  pushl $127
  10202f:	6a 7f                	push   $0x7f
  jmp __alltraps
  102031:	e9 00 06 00 00       	jmp    102636 <__alltraps>

00102036 <vector128>:
.globl vector128
vector128:
  pushl $0
  102036:	6a 00                	push   $0x0
  pushl $128
  102038:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  10203d:	e9 f4 05 00 00       	jmp    102636 <__alltraps>

00102042 <vector129>:
.globl vector129
vector129:
  pushl $0
  102042:	6a 00                	push   $0x0
  pushl $129
  102044:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  102049:	e9 e8 05 00 00       	jmp    102636 <__alltraps>

0010204e <vector130>:
.globl vector130
vector130:
  pushl $0
  10204e:	6a 00                	push   $0x0
  pushl $130
  102050:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  102055:	e9 dc 05 00 00       	jmp    102636 <__alltraps>

0010205a <vector131>:
.globl vector131
vector131:
  pushl $0
  10205a:	6a 00                	push   $0x0
  pushl $131
  10205c:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  102061:	e9 d0 05 00 00       	jmp    102636 <__alltraps>

00102066 <vector132>:
.globl vector132
vector132:
  pushl $0
  102066:	6a 00                	push   $0x0
  pushl $132
  102068:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  10206d:	e9 c4 05 00 00       	jmp    102636 <__alltraps>

00102072 <vector133>:
.globl vector133
vector133:
  pushl $0
  102072:	6a 00                	push   $0x0
  pushl $133
  102074:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  102079:	e9 b8 05 00 00       	jmp    102636 <__alltraps>

0010207e <vector134>:
.globl vector134
vector134:
  pushl $0
  10207e:	6a 00                	push   $0x0
  pushl $134
  102080:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  102085:	e9 ac 05 00 00       	jmp    102636 <__alltraps>

0010208a <vector135>:
.globl vector135
vector135:
  pushl $0
  10208a:	6a 00                	push   $0x0
  pushl $135
  10208c:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  102091:	e9 a0 05 00 00       	jmp    102636 <__alltraps>

00102096 <vector136>:
.globl vector136
vector136:
  pushl $0
  102096:	6a 00                	push   $0x0
  pushl $136
  102098:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  10209d:	e9 94 05 00 00       	jmp    102636 <__alltraps>

001020a2 <vector137>:
.globl vector137
vector137:
  pushl $0
  1020a2:	6a 00                	push   $0x0
  pushl $137
  1020a4:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  1020a9:	e9 88 05 00 00       	jmp    102636 <__alltraps>

001020ae <vector138>:
.globl vector138
vector138:
  pushl $0
  1020ae:	6a 00                	push   $0x0
  pushl $138
  1020b0:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  1020b5:	e9 7c 05 00 00       	jmp    102636 <__alltraps>

001020ba <vector139>:
.globl vector139
vector139:
  pushl $0
  1020ba:	6a 00                	push   $0x0
  pushl $139
  1020bc:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  1020c1:	e9 70 05 00 00       	jmp    102636 <__alltraps>

001020c6 <vector140>:
.globl vector140
vector140:
  pushl $0
  1020c6:	6a 00                	push   $0x0
  pushl $140
  1020c8:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  1020cd:	e9 64 05 00 00       	jmp    102636 <__alltraps>

001020d2 <vector141>:
.globl vector141
vector141:
  pushl $0
  1020d2:	6a 00                	push   $0x0
  pushl $141
  1020d4:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  1020d9:	e9 58 05 00 00       	jmp    102636 <__alltraps>

001020de <vector142>:
.globl vector142
vector142:
  pushl $0
  1020de:	6a 00                	push   $0x0
  pushl $142
  1020e0:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  1020e5:	e9 4c 05 00 00       	jmp    102636 <__alltraps>

001020ea <vector143>:
.globl vector143
vector143:
  pushl $0
  1020ea:	6a 00                	push   $0x0
  pushl $143
  1020ec:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  1020f1:	e9 40 05 00 00       	jmp    102636 <__alltraps>

001020f6 <vector144>:
.globl vector144
vector144:
  pushl $0
  1020f6:	6a 00                	push   $0x0
  pushl $144
  1020f8:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  1020fd:	e9 34 05 00 00       	jmp    102636 <__alltraps>

00102102 <vector145>:
.globl vector145
vector145:
  pushl $0
  102102:	6a 00                	push   $0x0
  pushl $145
  102104:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  102109:	e9 28 05 00 00       	jmp    102636 <__alltraps>

0010210e <vector146>:
.globl vector146
vector146:
  pushl $0
  10210e:	6a 00                	push   $0x0
  pushl $146
  102110:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  102115:	e9 1c 05 00 00       	jmp    102636 <__alltraps>

0010211a <vector147>:
.globl vector147
vector147:
  pushl $0
  10211a:	6a 00                	push   $0x0
  pushl $147
  10211c:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  102121:	e9 10 05 00 00       	jmp    102636 <__alltraps>

00102126 <vector148>:
.globl vector148
vector148:
  pushl $0
  102126:	6a 00                	push   $0x0
  pushl $148
  102128:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  10212d:	e9 04 05 00 00       	jmp    102636 <__alltraps>

00102132 <vector149>:
.globl vector149
vector149:
  pushl $0
  102132:	6a 00                	push   $0x0
  pushl $149
  102134:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  102139:	e9 f8 04 00 00       	jmp    102636 <__alltraps>

0010213e <vector150>:
.globl vector150
vector150:
  pushl $0
  10213e:	6a 00                	push   $0x0
  pushl $150
  102140:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  102145:	e9 ec 04 00 00       	jmp    102636 <__alltraps>

0010214a <vector151>:
.globl vector151
vector151:
  pushl $0
  10214a:	6a 00                	push   $0x0
  pushl $151
  10214c:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  102151:	e9 e0 04 00 00       	jmp    102636 <__alltraps>

00102156 <vector152>:
.globl vector152
vector152:
  pushl $0
  102156:	6a 00                	push   $0x0
  pushl $152
  102158:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  10215d:	e9 d4 04 00 00       	jmp    102636 <__alltraps>

00102162 <vector153>:
.globl vector153
vector153:
  pushl $0
  102162:	6a 00                	push   $0x0
  pushl $153
  102164:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  102169:	e9 c8 04 00 00       	jmp    102636 <__alltraps>

0010216e <vector154>:
.globl vector154
vector154:
  pushl $0
  10216e:	6a 00                	push   $0x0
  pushl $154
  102170:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  102175:	e9 bc 04 00 00       	jmp    102636 <__alltraps>

0010217a <vector155>:
.globl vector155
vector155:
  pushl $0
  10217a:	6a 00                	push   $0x0
  pushl $155
  10217c:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  102181:	e9 b0 04 00 00       	jmp    102636 <__alltraps>

00102186 <vector156>:
.globl vector156
vector156:
  pushl $0
  102186:	6a 00                	push   $0x0
  pushl $156
  102188:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  10218d:	e9 a4 04 00 00       	jmp    102636 <__alltraps>

00102192 <vector157>:
.globl vector157
vector157:
  pushl $0
  102192:	6a 00                	push   $0x0
  pushl $157
  102194:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  102199:	e9 98 04 00 00       	jmp    102636 <__alltraps>

0010219e <vector158>:
.globl vector158
vector158:
  pushl $0
  10219e:	6a 00                	push   $0x0
  pushl $158
  1021a0:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  1021a5:	e9 8c 04 00 00       	jmp    102636 <__alltraps>

001021aa <vector159>:
.globl vector159
vector159:
  pushl $0
  1021aa:	6a 00                	push   $0x0
  pushl $159
  1021ac:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  1021b1:	e9 80 04 00 00       	jmp    102636 <__alltraps>

001021b6 <vector160>:
.globl vector160
vector160:
  pushl $0
  1021b6:	6a 00                	push   $0x0
  pushl $160
  1021b8:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  1021bd:	e9 74 04 00 00       	jmp    102636 <__alltraps>

001021c2 <vector161>:
.globl vector161
vector161:
  pushl $0
  1021c2:	6a 00                	push   $0x0
  pushl $161
  1021c4:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  1021c9:	e9 68 04 00 00       	jmp    102636 <__alltraps>

001021ce <vector162>:
.globl vector162
vector162:
  pushl $0
  1021ce:	6a 00                	push   $0x0
  pushl $162
  1021d0:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  1021d5:	e9 5c 04 00 00       	jmp    102636 <__alltraps>

001021da <vector163>:
.globl vector163
vector163:
  pushl $0
  1021da:	6a 00                	push   $0x0
  pushl $163
  1021dc:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1021e1:	e9 50 04 00 00       	jmp    102636 <__alltraps>

001021e6 <vector164>:
.globl vector164
vector164:
  pushl $0
  1021e6:	6a 00                	push   $0x0
  pushl $164
  1021e8:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  1021ed:	e9 44 04 00 00       	jmp    102636 <__alltraps>

001021f2 <vector165>:
.globl vector165
vector165:
  pushl $0
  1021f2:	6a 00                	push   $0x0
  pushl $165
  1021f4:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  1021f9:	e9 38 04 00 00       	jmp    102636 <__alltraps>

001021fe <vector166>:
.globl vector166
vector166:
  pushl $0
  1021fe:	6a 00                	push   $0x0
  pushl $166
  102200:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  102205:	e9 2c 04 00 00       	jmp    102636 <__alltraps>

0010220a <vector167>:
.globl vector167
vector167:
  pushl $0
  10220a:	6a 00                	push   $0x0
  pushl $167
  10220c:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  102211:	e9 20 04 00 00       	jmp    102636 <__alltraps>

00102216 <vector168>:
.globl vector168
vector168:
  pushl $0
  102216:	6a 00                	push   $0x0
  pushl $168
  102218:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  10221d:	e9 14 04 00 00       	jmp    102636 <__alltraps>

00102222 <vector169>:
.globl vector169
vector169:
  pushl $0
  102222:	6a 00                	push   $0x0
  pushl $169
  102224:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  102229:	e9 08 04 00 00       	jmp    102636 <__alltraps>

0010222e <vector170>:
.globl vector170
vector170:
  pushl $0
  10222e:	6a 00                	push   $0x0
  pushl $170
  102230:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  102235:	e9 fc 03 00 00       	jmp    102636 <__alltraps>

0010223a <vector171>:
.globl vector171
vector171:
  pushl $0
  10223a:	6a 00                	push   $0x0
  pushl $171
  10223c:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  102241:	e9 f0 03 00 00       	jmp    102636 <__alltraps>

00102246 <vector172>:
.globl vector172
vector172:
  pushl $0
  102246:	6a 00                	push   $0x0
  pushl $172
  102248:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  10224d:	e9 e4 03 00 00       	jmp    102636 <__alltraps>

00102252 <vector173>:
.globl vector173
vector173:
  pushl $0
  102252:	6a 00                	push   $0x0
  pushl $173
  102254:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  102259:	e9 d8 03 00 00       	jmp    102636 <__alltraps>

0010225e <vector174>:
.globl vector174
vector174:
  pushl $0
  10225e:	6a 00                	push   $0x0
  pushl $174
  102260:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  102265:	e9 cc 03 00 00       	jmp    102636 <__alltraps>

0010226a <vector175>:
.globl vector175
vector175:
  pushl $0
  10226a:	6a 00                	push   $0x0
  pushl $175
  10226c:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  102271:	e9 c0 03 00 00       	jmp    102636 <__alltraps>

00102276 <vector176>:
.globl vector176
vector176:
  pushl $0
  102276:	6a 00                	push   $0x0
  pushl $176
  102278:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  10227d:	e9 b4 03 00 00       	jmp    102636 <__alltraps>

00102282 <vector177>:
.globl vector177
vector177:
  pushl $0
  102282:	6a 00                	push   $0x0
  pushl $177
  102284:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  102289:	e9 a8 03 00 00       	jmp    102636 <__alltraps>

0010228e <vector178>:
.globl vector178
vector178:
  pushl $0
  10228e:	6a 00                	push   $0x0
  pushl $178
  102290:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  102295:	e9 9c 03 00 00       	jmp    102636 <__alltraps>

0010229a <vector179>:
.globl vector179
vector179:
  pushl $0
  10229a:	6a 00                	push   $0x0
  pushl $179
  10229c:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  1022a1:	e9 90 03 00 00       	jmp    102636 <__alltraps>

001022a6 <vector180>:
.globl vector180
vector180:
  pushl $0
  1022a6:	6a 00                	push   $0x0
  pushl $180
  1022a8:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  1022ad:	e9 84 03 00 00       	jmp    102636 <__alltraps>

001022b2 <vector181>:
.globl vector181
vector181:
  pushl $0
  1022b2:	6a 00                	push   $0x0
  pushl $181
  1022b4:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  1022b9:	e9 78 03 00 00       	jmp    102636 <__alltraps>

001022be <vector182>:
.globl vector182
vector182:
  pushl $0
  1022be:	6a 00                	push   $0x0
  pushl $182
  1022c0:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  1022c5:	e9 6c 03 00 00       	jmp    102636 <__alltraps>

001022ca <vector183>:
.globl vector183
vector183:
  pushl $0
  1022ca:	6a 00                	push   $0x0
  pushl $183
  1022cc:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  1022d1:	e9 60 03 00 00       	jmp    102636 <__alltraps>

001022d6 <vector184>:
.globl vector184
vector184:
  pushl $0
  1022d6:	6a 00                	push   $0x0
  pushl $184
  1022d8:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  1022dd:	e9 54 03 00 00       	jmp    102636 <__alltraps>

001022e2 <vector185>:
.globl vector185
vector185:
  pushl $0
  1022e2:	6a 00                	push   $0x0
  pushl $185
  1022e4:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  1022e9:	e9 48 03 00 00       	jmp    102636 <__alltraps>

001022ee <vector186>:
.globl vector186
vector186:
  pushl $0
  1022ee:	6a 00                	push   $0x0
  pushl $186
  1022f0:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  1022f5:	e9 3c 03 00 00       	jmp    102636 <__alltraps>

001022fa <vector187>:
.globl vector187
vector187:
  pushl $0
  1022fa:	6a 00                	push   $0x0
  pushl $187
  1022fc:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  102301:	e9 30 03 00 00       	jmp    102636 <__alltraps>

00102306 <vector188>:
.globl vector188
vector188:
  pushl $0
  102306:	6a 00                	push   $0x0
  pushl $188
  102308:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  10230d:	e9 24 03 00 00       	jmp    102636 <__alltraps>

00102312 <vector189>:
.globl vector189
vector189:
  pushl $0
  102312:	6a 00                	push   $0x0
  pushl $189
  102314:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  102319:	e9 18 03 00 00       	jmp    102636 <__alltraps>

0010231e <vector190>:
.globl vector190
vector190:
  pushl $0
  10231e:	6a 00                	push   $0x0
  pushl $190
  102320:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  102325:	e9 0c 03 00 00       	jmp    102636 <__alltraps>

0010232a <vector191>:
.globl vector191
vector191:
  pushl $0
  10232a:	6a 00                	push   $0x0
  pushl $191
  10232c:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  102331:	e9 00 03 00 00       	jmp    102636 <__alltraps>

00102336 <vector192>:
.globl vector192
vector192:
  pushl $0
  102336:	6a 00                	push   $0x0
  pushl $192
  102338:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  10233d:	e9 f4 02 00 00       	jmp    102636 <__alltraps>

00102342 <vector193>:
.globl vector193
vector193:
  pushl $0
  102342:	6a 00                	push   $0x0
  pushl $193
  102344:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  102349:	e9 e8 02 00 00       	jmp    102636 <__alltraps>

0010234e <vector194>:
.globl vector194
vector194:
  pushl $0
  10234e:	6a 00                	push   $0x0
  pushl $194
  102350:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  102355:	e9 dc 02 00 00       	jmp    102636 <__alltraps>

0010235a <vector195>:
.globl vector195
vector195:
  pushl $0
  10235a:	6a 00                	push   $0x0
  pushl $195
  10235c:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  102361:	e9 d0 02 00 00       	jmp    102636 <__alltraps>

00102366 <vector196>:
.globl vector196
vector196:
  pushl $0
  102366:	6a 00                	push   $0x0
  pushl $196
  102368:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  10236d:	e9 c4 02 00 00       	jmp    102636 <__alltraps>

00102372 <vector197>:
.globl vector197
vector197:
  pushl $0
  102372:	6a 00                	push   $0x0
  pushl $197
  102374:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  102379:	e9 b8 02 00 00       	jmp    102636 <__alltraps>

0010237e <vector198>:
.globl vector198
vector198:
  pushl $0
  10237e:	6a 00                	push   $0x0
  pushl $198
  102380:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  102385:	e9 ac 02 00 00       	jmp    102636 <__alltraps>

0010238a <vector199>:
.globl vector199
vector199:
  pushl $0
  10238a:	6a 00                	push   $0x0
  pushl $199
  10238c:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  102391:	e9 a0 02 00 00       	jmp    102636 <__alltraps>

00102396 <vector200>:
.globl vector200
vector200:
  pushl $0
  102396:	6a 00                	push   $0x0
  pushl $200
  102398:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  10239d:	e9 94 02 00 00       	jmp    102636 <__alltraps>

001023a2 <vector201>:
.globl vector201
vector201:
  pushl $0
  1023a2:	6a 00                	push   $0x0
  pushl $201
  1023a4:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  1023a9:	e9 88 02 00 00       	jmp    102636 <__alltraps>

001023ae <vector202>:
.globl vector202
vector202:
  pushl $0
  1023ae:	6a 00                	push   $0x0
  pushl $202
  1023b0:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  1023b5:	e9 7c 02 00 00       	jmp    102636 <__alltraps>

001023ba <vector203>:
.globl vector203
vector203:
  pushl $0
  1023ba:	6a 00                	push   $0x0
  pushl $203
  1023bc:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  1023c1:	e9 70 02 00 00       	jmp    102636 <__alltraps>

001023c6 <vector204>:
.globl vector204
vector204:
  pushl $0
  1023c6:	6a 00                	push   $0x0
  pushl $204
  1023c8:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  1023cd:	e9 64 02 00 00       	jmp    102636 <__alltraps>

001023d2 <vector205>:
.globl vector205
vector205:
  pushl $0
  1023d2:	6a 00                	push   $0x0
  pushl $205
  1023d4:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  1023d9:	e9 58 02 00 00       	jmp    102636 <__alltraps>

001023de <vector206>:
.globl vector206
vector206:
  pushl $0
  1023de:	6a 00                	push   $0x0
  pushl $206
  1023e0:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  1023e5:	e9 4c 02 00 00       	jmp    102636 <__alltraps>

001023ea <vector207>:
.globl vector207
vector207:
  pushl $0
  1023ea:	6a 00                	push   $0x0
  pushl $207
  1023ec:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  1023f1:	e9 40 02 00 00       	jmp    102636 <__alltraps>

001023f6 <vector208>:
.globl vector208
vector208:
  pushl $0
  1023f6:	6a 00                	push   $0x0
  pushl $208
  1023f8:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  1023fd:	e9 34 02 00 00       	jmp    102636 <__alltraps>

00102402 <vector209>:
.globl vector209
vector209:
  pushl $0
  102402:	6a 00                	push   $0x0
  pushl $209
  102404:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  102409:	e9 28 02 00 00       	jmp    102636 <__alltraps>

0010240e <vector210>:
.globl vector210
vector210:
  pushl $0
  10240e:	6a 00                	push   $0x0
  pushl $210
  102410:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  102415:	e9 1c 02 00 00       	jmp    102636 <__alltraps>

0010241a <vector211>:
.globl vector211
vector211:
  pushl $0
  10241a:	6a 00                	push   $0x0
  pushl $211
  10241c:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  102421:	e9 10 02 00 00       	jmp    102636 <__alltraps>

00102426 <vector212>:
.globl vector212
vector212:
  pushl $0
  102426:	6a 00                	push   $0x0
  pushl $212
  102428:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  10242d:	e9 04 02 00 00       	jmp    102636 <__alltraps>

00102432 <vector213>:
.globl vector213
vector213:
  pushl $0
  102432:	6a 00                	push   $0x0
  pushl $213
  102434:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  102439:	e9 f8 01 00 00       	jmp    102636 <__alltraps>

0010243e <vector214>:
.globl vector214
vector214:
  pushl $0
  10243e:	6a 00                	push   $0x0
  pushl $214
  102440:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  102445:	e9 ec 01 00 00       	jmp    102636 <__alltraps>

0010244a <vector215>:
.globl vector215
vector215:
  pushl $0
  10244a:	6a 00                	push   $0x0
  pushl $215
  10244c:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  102451:	e9 e0 01 00 00       	jmp    102636 <__alltraps>

00102456 <vector216>:
.globl vector216
vector216:
  pushl $0
  102456:	6a 00                	push   $0x0
  pushl $216
  102458:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  10245d:	e9 d4 01 00 00       	jmp    102636 <__alltraps>

00102462 <vector217>:
.globl vector217
vector217:
  pushl $0
  102462:	6a 00                	push   $0x0
  pushl $217
  102464:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  102469:	e9 c8 01 00 00       	jmp    102636 <__alltraps>

0010246e <vector218>:
.globl vector218
vector218:
  pushl $0
  10246e:	6a 00                	push   $0x0
  pushl $218
  102470:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  102475:	e9 bc 01 00 00       	jmp    102636 <__alltraps>

0010247a <vector219>:
.globl vector219
vector219:
  pushl $0
  10247a:	6a 00                	push   $0x0
  pushl $219
  10247c:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  102481:	e9 b0 01 00 00       	jmp    102636 <__alltraps>

00102486 <vector220>:
.globl vector220
vector220:
  pushl $0
  102486:	6a 00                	push   $0x0
  pushl $220
  102488:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  10248d:	e9 a4 01 00 00       	jmp    102636 <__alltraps>

00102492 <vector221>:
.globl vector221
vector221:
  pushl $0
  102492:	6a 00                	push   $0x0
  pushl $221
  102494:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  102499:	e9 98 01 00 00       	jmp    102636 <__alltraps>

0010249e <vector222>:
.globl vector222
vector222:
  pushl $0
  10249e:	6a 00                	push   $0x0
  pushl $222
  1024a0:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  1024a5:	e9 8c 01 00 00       	jmp    102636 <__alltraps>

001024aa <vector223>:
.globl vector223
vector223:
  pushl $0
  1024aa:	6a 00                	push   $0x0
  pushl $223
  1024ac:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  1024b1:	e9 80 01 00 00       	jmp    102636 <__alltraps>

001024b6 <vector224>:
.globl vector224
vector224:
  pushl $0
  1024b6:	6a 00                	push   $0x0
  pushl $224
  1024b8:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  1024bd:	e9 74 01 00 00       	jmp    102636 <__alltraps>

001024c2 <vector225>:
.globl vector225
vector225:
  pushl $0
  1024c2:	6a 00                	push   $0x0
  pushl $225
  1024c4:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  1024c9:	e9 68 01 00 00       	jmp    102636 <__alltraps>

001024ce <vector226>:
.globl vector226
vector226:
  pushl $0
  1024ce:	6a 00                	push   $0x0
  pushl $226
  1024d0:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  1024d5:	e9 5c 01 00 00       	jmp    102636 <__alltraps>

001024da <vector227>:
.globl vector227
vector227:
  pushl $0
  1024da:	6a 00                	push   $0x0
  pushl $227
  1024dc:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  1024e1:	e9 50 01 00 00       	jmp    102636 <__alltraps>

001024e6 <vector228>:
.globl vector228
vector228:
  pushl $0
  1024e6:	6a 00                	push   $0x0
  pushl $228
  1024e8:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  1024ed:	e9 44 01 00 00       	jmp    102636 <__alltraps>

001024f2 <vector229>:
.globl vector229
vector229:
  pushl $0
  1024f2:	6a 00                	push   $0x0
  pushl $229
  1024f4:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  1024f9:	e9 38 01 00 00       	jmp    102636 <__alltraps>

001024fe <vector230>:
.globl vector230
vector230:
  pushl $0
  1024fe:	6a 00                	push   $0x0
  pushl $230
  102500:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  102505:	e9 2c 01 00 00       	jmp    102636 <__alltraps>

0010250a <vector231>:
.globl vector231
vector231:
  pushl $0
  10250a:	6a 00                	push   $0x0
  pushl $231
  10250c:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  102511:	e9 20 01 00 00       	jmp    102636 <__alltraps>

00102516 <vector232>:
.globl vector232
vector232:
  pushl $0
  102516:	6a 00                	push   $0x0
  pushl $232
  102518:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  10251d:	e9 14 01 00 00       	jmp    102636 <__alltraps>

00102522 <vector233>:
.globl vector233
vector233:
  pushl $0
  102522:	6a 00                	push   $0x0
  pushl $233
  102524:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  102529:	e9 08 01 00 00       	jmp    102636 <__alltraps>

0010252e <vector234>:
.globl vector234
vector234:
  pushl $0
  10252e:	6a 00                	push   $0x0
  pushl $234
  102530:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  102535:	e9 fc 00 00 00       	jmp    102636 <__alltraps>

0010253a <vector235>:
.globl vector235
vector235:
  pushl $0
  10253a:	6a 00                	push   $0x0
  pushl $235
  10253c:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  102541:	e9 f0 00 00 00       	jmp    102636 <__alltraps>

00102546 <vector236>:
.globl vector236
vector236:
  pushl $0
  102546:	6a 00                	push   $0x0
  pushl $236
  102548:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  10254d:	e9 e4 00 00 00       	jmp    102636 <__alltraps>

00102552 <vector237>:
.globl vector237
vector237:
  pushl $0
  102552:	6a 00                	push   $0x0
  pushl $237
  102554:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  102559:	e9 d8 00 00 00       	jmp    102636 <__alltraps>

0010255e <vector238>:
.globl vector238
vector238:
  pushl $0
  10255e:	6a 00                	push   $0x0
  pushl $238
  102560:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  102565:	e9 cc 00 00 00       	jmp    102636 <__alltraps>

0010256a <vector239>:
.globl vector239
vector239:
  pushl $0
  10256a:	6a 00                	push   $0x0
  pushl $239
  10256c:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  102571:	e9 c0 00 00 00       	jmp    102636 <__alltraps>

00102576 <vector240>:
.globl vector240
vector240:
  pushl $0
  102576:	6a 00                	push   $0x0
  pushl $240
  102578:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  10257d:	e9 b4 00 00 00       	jmp    102636 <__alltraps>

00102582 <vector241>:
.globl vector241
vector241:
  pushl $0
  102582:	6a 00                	push   $0x0
  pushl $241
  102584:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  102589:	e9 a8 00 00 00       	jmp    102636 <__alltraps>

0010258e <vector242>:
.globl vector242
vector242:
  pushl $0
  10258e:	6a 00                	push   $0x0
  pushl $242
  102590:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  102595:	e9 9c 00 00 00       	jmp    102636 <__alltraps>

0010259a <vector243>:
.globl vector243
vector243:
  pushl $0
  10259a:	6a 00                	push   $0x0
  pushl $243
  10259c:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  1025a1:	e9 90 00 00 00       	jmp    102636 <__alltraps>

001025a6 <vector244>:
.globl vector244
vector244:
  pushl $0
  1025a6:	6a 00                	push   $0x0
  pushl $244
  1025a8:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  1025ad:	e9 84 00 00 00       	jmp    102636 <__alltraps>

001025b2 <vector245>:
.globl vector245
vector245:
  pushl $0
  1025b2:	6a 00                	push   $0x0
  pushl $245
  1025b4:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  1025b9:	e9 78 00 00 00       	jmp    102636 <__alltraps>

001025be <vector246>:
.globl vector246
vector246:
  pushl $0
  1025be:	6a 00                	push   $0x0
  pushl $246
  1025c0:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  1025c5:	e9 6c 00 00 00       	jmp    102636 <__alltraps>

001025ca <vector247>:
.globl vector247
vector247:
  pushl $0
  1025ca:	6a 00                	push   $0x0
  pushl $247
  1025cc:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  1025d1:	e9 60 00 00 00       	jmp    102636 <__alltraps>

001025d6 <vector248>:
.globl vector248
vector248:
  pushl $0
  1025d6:	6a 00                	push   $0x0
  pushl $248
  1025d8:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  1025dd:	e9 54 00 00 00       	jmp    102636 <__alltraps>

001025e2 <vector249>:
.globl vector249
vector249:
  pushl $0
  1025e2:	6a 00                	push   $0x0
  pushl $249
  1025e4:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  1025e9:	e9 48 00 00 00       	jmp    102636 <__alltraps>

001025ee <vector250>:
.globl vector250
vector250:
  pushl $0
  1025ee:	6a 00                	push   $0x0
  pushl $250
  1025f0:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  1025f5:	e9 3c 00 00 00       	jmp    102636 <__alltraps>

001025fa <vector251>:
.globl vector251
vector251:
  pushl $0
  1025fa:	6a 00                	push   $0x0
  pushl $251
  1025fc:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  102601:	e9 30 00 00 00       	jmp    102636 <__alltraps>

00102606 <vector252>:
.globl vector252
vector252:
  pushl $0
  102606:	6a 00                	push   $0x0
  pushl $252
  102608:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  10260d:	e9 24 00 00 00       	jmp    102636 <__alltraps>

00102612 <vector253>:
.globl vector253
vector253:
  pushl $0
  102612:	6a 00                	push   $0x0
  pushl $253
  102614:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  102619:	e9 18 00 00 00       	jmp    102636 <__alltraps>

0010261e <vector254>:
.globl vector254
vector254:
  pushl $0
  10261e:	6a 00                	push   $0x0
  pushl $254
  102620:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  102625:	e9 0c 00 00 00       	jmp    102636 <__alltraps>

0010262a <vector255>:
.globl vector255
vector255:
  pushl $0
  10262a:	6a 00                	push   $0x0
  pushl $255
  10262c:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102631:	e9 00 00 00 00       	jmp    102636 <__alltraps>

00102636 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  102636:	1e                   	push   %ds
    pushl %es
  102637:	06                   	push   %es
    pushl %fs
  102638:	0f a0                	push   %fs
    pushl %gs
  10263a:	0f a8                	push   %gs
    pushal
  10263c:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  10263d:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  102642:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  102644:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  102646:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  102647:	e8 63 f5 ff ff       	call   101baf <trap>

    # pop the pushed stack pointer
    popl %esp
  10264c:	5c                   	pop    %esp

0010264d <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  10264d:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  10264e:	0f a9                	pop    %gs
    popl %fs
  102650:	0f a1                	pop    %fs
    popl %es
  102652:	07                   	pop    %es
    popl %ds
  102653:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  102654:	83 c4 08             	add    $0x8,%esp
    iret
  102657:	cf                   	iret   

00102658 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  102658:	55                   	push   %ebp
  102659:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  10265b:	8b 45 08             	mov    0x8(%ebp),%eax
  10265e:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102661:	b8 23 00 00 00       	mov    $0x23,%eax
  102666:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  102668:	b8 23 00 00 00       	mov    $0x23,%eax
  10266d:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  10266f:	b8 10 00 00 00       	mov    $0x10,%eax
  102674:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  102676:	b8 10 00 00 00       	mov    $0x10,%eax
  10267b:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  10267d:	b8 10 00 00 00       	mov    $0x10,%eax
  102682:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102684:	ea 8b 26 10 00 08 00 	ljmp   $0x8,$0x10268b
}
  10268b:	90                   	nop
  10268c:	5d                   	pop    %ebp
  10268d:	c3                   	ret    

0010268e <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  10268e:	55                   	push   %ebp
  10268f:	89 e5                	mov    %esp,%ebp
  102691:	83 ec 10             	sub    $0x10,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102694:	b8 20 f9 10 00       	mov    $0x10f920,%eax
  102699:	05 00 04 00 00       	add    $0x400,%eax
  10269e:	a3 a4 f8 10 00       	mov    %eax,0x10f8a4
    ts.ts_ss0 = KERNEL_DS;
  1026a3:	66 c7 05 a8 f8 10 00 	movw   $0x10,0x10f8a8
  1026aa:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  1026ac:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  1026b3:	68 00 
  1026b5:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  1026ba:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  1026c0:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  1026c5:	c1 e8 10             	shr    $0x10,%eax
  1026c8:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  1026cd:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1026d4:	83 e0 f0             	and    $0xfffffff0,%eax
  1026d7:	83 c8 09             	or     $0x9,%eax
  1026da:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1026df:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1026e6:	83 c8 10             	or     $0x10,%eax
  1026e9:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1026ee:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1026f5:	83 e0 9f             	and    $0xffffff9f,%eax
  1026f8:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1026fd:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102704:	83 c8 80             	or     $0xffffff80,%eax
  102707:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  10270c:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102713:	83 e0 f0             	and    $0xfffffff0,%eax
  102716:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  10271b:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102722:	83 e0 ef             	and    $0xffffffef,%eax
  102725:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  10272a:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102731:	83 e0 df             	and    $0xffffffdf,%eax
  102734:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102739:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102740:	83 c8 40             	or     $0x40,%eax
  102743:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102748:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  10274f:	83 e0 7f             	and    $0x7f,%eax
  102752:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102757:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  10275c:	c1 e8 18             	shr    $0x18,%eax
  10275f:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  102764:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  10276b:	83 e0 ef             	and    $0xffffffef,%eax
  10276e:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102773:	68 10 ea 10 00       	push   $0x10ea10
  102778:	e8 db fe ff ff       	call   102658 <lgdt>
  10277d:	83 c4 04             	add    $0x4,%esp
  102780:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102786:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  10278a:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  10278d:	90                   	nop
  10278e:	c9                   	leave  
  10278f:	c3                   	ret    

00102790 <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102790:	55                   	push   %ebp
  102791:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102793:	e8 f6 fe ff ff       	call   10268e <gdt_init>
}
  102798:	90                   	nop
  102799:	5d                   	pop    %ebp
  10279a:	c3                   	ret    

0010279b <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  10279b:	55                   	push   %ebp
  10279c:	89 e5                	mov    %esp,%ebp
  10279e:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  1027a1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  1027a8:	eb 04                	jmp    1027ae <strlen+0x13>
        cnt ++;
  1027aa:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
    size_t cnt = 0;
    while (*s ++ != '\0') {
  1027ae:	8b 45 08             	mov    0x8(%ebp),%eax
  1027b1:	8d 50 01             	lea    0x1(%eax),%edx
  1027b4:	89 55 08             	mov    %edx,0x8(%ebp)
  1027b7:	0f b6 00             	movzbl (%eax),%eax
  1027ba:	84 c0                	test   %al,%al
  1027bc:	75 ec                	jne    1027aa <strlen+0xf>
        cnt ++;
    }
    return cnt;
  1027be:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1027c1:	c9                   	leave  
  1027c2:	c3                   	ret    

001027c3 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  1027c3:	55                   	push   %ebp
  1027c4:	89 e5                	mov    %esp,%ebp
  1027c6:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  1027c9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  1027d0:	eb 04                	jmp    1027d6 <strnlen+0x13>
        cnt ++;
  1027d2:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
    while (cnt < len && *s ++ != '\0') {
  1027d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1027d9:	3b 45 0c             	cmp    0xc(%ebp),%eax
  1027dc:	73 10                	jae    1027ee <strnlen+0x2b>
  1027de:	8b 45 08             	mov    0x8(%ebp),%eax
  1027e1:	8d 50 01             	lea    0x1(%eax),%edx
  1027e4:	89 55 08             	mov    %edx,0x8(%ebp)
  1027e7:	0f b6 00             	movzbl (%eax),%eax
  1027ea:	84 c0                	test   %al,%al
  1027ec:	75 e4                	jne    1027d2 <strnlen+0xf>
        cnt ++;
    }
    return cnt;
  1027ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1027f1:	c9                   	leave  
  1027f2:	c3                   	ret    

001027f3 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  1027f3:	55                   	push   %ebp
  1027f4:	89 e5                	mov    %esp,%ebp
  1027f6:	57                   	push   %edi
  1027f7:	56                   	push   %esi
  1027f8:	83 ec 20             	sub    $0x20,%esp
  1027fb:	8b 45 08             	mov    0x8(%ebp),%eax
  1027fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102801:	8b 45 0c             	mov    0xc(%ebp),%eax
  102804:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102807:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10280a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10280d:	89 d1                	mov    %edx,%ecx
  10280f:	89 c2                	mov    %eax,%edx
  102811:	89 ce                	mov    %ecx,%esi
  102813:	89 d7                	mov    %edx,%edi
  102815:	ac                   	lods   %ds:(%esi),%al
  102816:	aa                   	stos   %al,%es:(%edi)
  102817:	84 c0                	test   %al,%al
  102819:	75 fa                	jne    102815 <strcpy+0x22>
  10281b:	89 fa                	mov    %edi,%edx
  10281d:	89 f1                	mov    %esi,%ecx
  10281f:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102822:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102825:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102828:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_STRCPY
    return __strcpy(dst, src);
  10282b:	90                   	nop
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  10282c:	83 c4 20             	add    $0x20,%esp
  10282f:	5e                   	pop    %esi
  102830:	5f                   	pop    %edi
  102831:	5d                   	pop    %ebp
  102832:	c3                   	ret    

00102833 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102833:	55                   	push   %ebp
  102834:	89 e5                	mov    %esp,%ebp
  102836:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102839:	8b 45 08             	mov    0x8(%ebp),%eax
  10283c:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  10283f:	eb 21                	jmp    102862 <strncpy+0x2f>
        if ((*p = *src) != '\0') {
  102841:	8b 45 0c             	mov    0xc(%ebp),%eax
  102844:	0f b6 10             	movzbl (%eax),%edx
  102847:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10284a:	88 10                	mov    %dl,(%eax)
  10284c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10284f:	0f b6 00             	movzbl (%eax),%eax
  102852:	84 c0                	test   %al,%al
  102854:	74 04                	je     10285a <strncpy+0x27>
            src ++;
  102856:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  10285a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10285e:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
    char *p = dst;
    while (len > 0) {
  102862:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102866:	75 d9                	jne    102841 <strncpy+0xe>
        if ((*p = *src) != '\0') {
            src ++;
        }
        p ++, len --;
    }
    return dst;
  102868:	8b 45 08             	mov    0x8(%ebp),%eax
}
  10286b:	c9                   	leave  
  10286c:	c3                   	ret    

0010286d <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  10286d:	55                   	push   %ebp
  10286e:	89 e5                	mov    %esp,%ebp
  102870:	57                   	push   %edi
  102871:	56                   	push   %esi
  102872:	83 ec 20             	sub    $0x20,%esp
  102875:	8b 45 08             	mov    0x8(%ebp),%eax
  102878:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10287b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10287e:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCMP
#define __HAVE_ARCH_STRCMP
static inline int
__strcmp(const char *s1, const char *s2) {
    int d0, d1, ret;
    asm volatile (
  102881:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102884:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102887:	89 d1                	mov    %edx,%ecx
  102889:	89 c2                	mov    %eax,%edx
  10288b:	89 ce                	mov    %ecx,%esi
  10288d:	89 d7                	mov    %edx,%edi
  10288f:	ac                   	lods   %ds:(%esi),%al
  102890:	ae                   	scas   %es:(%edi),%al
  102891:	75 08                	jne    10289b <strcmp+0x2e>
  102893:	84 c0                	test   %al,%al
  102895:	75 f8                	jne    10288f <strcmp+0x22>
  102897:	31 c0                	xor    %eax,%eax
  102899:	eb 04                	jmp    10289f <strcmp+0x32>
  10289b:	19 c0                	sbb    %eax,%eax
  10289d:	0c 01                	or     $0x1,%al
  10289f:	89 fa                	mov    %edi,%edx
  1028a1:	89 f1                	mov    %esi,%ecx
  1028a3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1028a6:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  1028a9:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            "orb $1, %%al;"
            "3:"
            : "=a" (ret), "=&S" (d0), "=&D" (d1)
            : "1" (s1), "2" (s2)
            : "memory");
    return ret;
  1028ac:	8b 45 ec             	mov    -0x14(%ebp),%eax
#ifdef __HAVE_ARCH_STRCMP
    return __strcmp(s1, s2);
  1028af:	90                   	nop
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  1028b0:	83 c4 20             	add    $0x20,%esp
  1028b3:	5e                   	pop    %esi
  1028b4:	5f                   	pop    %edi
  1028b5:	5d                   	pop    %ebp
  1028b6:	c3                   	ret    

001028b7 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  1028b7:	55                   	push   %ebp
  1028b8:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  1028ba:	eb 0c                	jmp    1028c8 <strncmp+0x11>
        n --, s1 ++, s2 ++;
  1028bc:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  1028c0:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1028c4:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  1028c8:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1028cc:	74 1a                	je     1028e8 <strncmp+0x31>
  1028ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1028d1:	0f b6 00             	movzbl (%eax),%eax
  1028d4:	84 c0                	test   %al,%al
  1028d6:	74 10                	je     1028e8 <strncmp+0x31>
  1028d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1028db:	0f b6 10             	movzbl (%eax),%edx
  1028de:	8b 45 0c             	mov    0xc(%ebp),%eax
  1028e1:	0f b6 00             	movzbl (%eax),%eax
  1028e4:	38 c2                	cmp    %al,%dl
  1028e6:	74 d4                	je     1028bc <strncmp+0x5>
        n --, s1 ++, s2 ++;
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  1028e8:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1028ec:	74 18                	je     102906 <strncmp+0x4f>
  1028ee:	8b 45 08             	mov    0x8(%ebp),%eax
  1028f1:	0f b6 00             	movzbl (%eax),%eax
  1028f4:	0f b6 d0             	movzbl %al,%edx
  1028f7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1028fa:	0f b6 00             	movzbl (%eax),%eax
  1028fd:	0f b6 c0             	movzbl %al,%eax
  102900:	29 c2                	sub    %eax,%edx
  102902:	89 d0                	mov    %edx,%eax
  102904:	eb 05                	jmp    10290b <strncmp+0x54>
  102906:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10290b:	5d                   	pop    %ebp
  10290c:	c3                   	ret    

0010290d <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  10290d:	55                   	push   %ebp
  10290e:	89 e5                	mov    %esp,%ebp
  102910:	83 ec 04             	sub    $0x4,%esp
  102913:	8b 45 0c             	mov    0xc(%ebp),%eax
  102916:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102919:	eb 14                	jmp    10292f <strchr+0x22>
        if (*s == c) {
  10291b:	8b 45 08             	mov    0x8(%ebp),%eax
  10291e:	0f b6 00             	movzbl (%eax),%eax
  102921:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102924:	75 05                	jne    10292b <strchr+0x1e>
            return (char *)s;
  102926:	8b 45 08             	mov    0x8(%ebp),%eax
  102929:	eb 13                	jmp    10293e <strchr+0x31>
        }
        s ++;
  10292b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
    while (*s != '\0') {
  10292f:	8b 45 08             	mov    0x8(%ebp),%eax
  102932:	0f b6 00             	movzbl (%eax),%eax
  102935:	84 c0                	test   %al,%al
  102937:	75 e2                	jne    10291b <strchr+0xe>
        if (*s == c) {
            return (char *)s;
        }
        s ++;
    }
    return NULL;
  102939:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10293e:	c9                   	leave  
  10293f:	c3                   	ret    

00102940 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102940:	55                   	push   %ebp
  102941:	89 e5                	mov    %esp,%ebp
  102943:	83 ec 04             	sub    $0x4,%esp
  102946:	8b 45 0c             	mov    0xc(%ebp),%eax
  102949:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  10294c:	eb 0f                	jmp    10295d <strfind+0x1d>
        if (*s == c) {
  10294e:	8b 45 08             	mov    0x8(%ebp),%eax
  102951:	0f b6 00             	movzbl (%eax),%eax
  102954:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102957:	74 10                	je     102969 <strfind+0x29>
            break;
        }
        s ++;
  102959:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
    while (*s != '\0') {
  10295d:	8b 45 08             	mov    0x8(%ebp),%eax
  102960:	0f b6 00             	movzbl (%eax),%eax
  102963:	84 c0                	test   %al,%al
  102965:	75 e7                	jne    10294e <strfind+0xe>
  102967:	eb 01                	jmp    10296a <strfind+0x2a>
        if (*s == c) {
            break;
  102969:	90                   	nop
        }
        s ++;
    }
    return (char *)s;
  10296a:	8b 45 08             	mov    0x8(%ebp),%eax
}
  10296d:	c9                   	leave  
  10296e:	c3                   	ret    

0010296f <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  10296f:	55                   	push   %ebp
  102970:	89 e5                	mov    %esp,%ebp
  102972:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  102975:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  10297c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102983:	eb 04                	jmp    102989 <strtol+0x1a>
        s ++;
  102985:	83 45 08 01          	addl   $0x1,0x8(%ebp)
strtol(const char *s, char **endptr, int base) {
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102989:	8b 45 08             	mov    0x8(%ebp),%eax
  10298c:	0f b6 00             	movzbl (%eax),%eax
  10298f:	3c 20                	cmp    $0x20,%al
  102991:	74 f2                	je     102985 <strtol+0x16>
  102993:	8b 45 08             	mov    0x8(%ebp),%eax
  102996:	0f b6 00             	movzbl (%eax),%eax
  102999:	3c 09                	cmp    $0x9,%al
  10299b:	74 e8                	je     102985 <strtol+0x16>
        s ++;
    }

    // plus/minus sign
    if (*s == '+') {
  10299d:	8b 45 08             	mov    0x8(%ebp),%eax
  1029a0:	0f b6 00             	movzbl (%eax),%eax
  1029a3:	3c 2b                	cmp    $0x2b,%al
  1029a5:	75 06                	jne    1029ad <strtol+0x3e>
        s ++;
  1029a7:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1029ab:	eb 15                	jmp    1029c2 <strtol+0x53>
    }
    else if (*s == '-') {
  1029ad:	8b 45 08             	mov    0x8(%ebp),%eax
  1029b0:	0f b6 00             	movzbl (%eax),%eax
  1029b3:	3c 2d                	cmp    $0x2d,%al
  1029b5:	75 0b                	jne    1029c2 <strtol+0x53>
        s ++, neg = 1;
  1029b7:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1029bb:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  1029c2:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1029c6:	74 06                	je     1029ce <strtol+0x5f>
  1029c8:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  1029cc:	75 24                	jne    1029f2 <strtol+0x83>
  1029ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1029d1:	0f b6 00             	movzbl (%eax),%eax
  1029d4:	3c 30                	cmp    $0x30,%al
  1029d6:	75 1a                	jne    1029f2 <strtol+0x83>
  1029d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1029db:	83 c0 01             	add    $0x1,%eax
  1029de:	0f b6 00             	movzbl (%eax),%eax
  1029e1:	3c 78                	cmp    $0x78,%al
  1029e3:	75 0d                	jne    1029f2 <strtol+0x83>
        s += 2, base = 16;
  1029e5:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  1029e9:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  1029f0:	eb 2a                	jmp    102a1c <strtol+0xad>
    }
    else if (base == 0 && s[0] == '0') {
  1029f2:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1029f6:	75 17                	jne    102a0f <strtol+0xa0>
  1029f8:	8b 45 08             	mov    0x8(%ebp),%eax
  1029fb:	0f b6 00             	movzbl (%eax),%eax
  1029fe:	3c 30                	cmp    $0x30,%al
  102a00:	75 0d                	jne    102a0f <strtol+0xa0>
        s ++, base = 8;
  102a02:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102a06:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  102a0d:	eb 0d                	jmp    102a1c <strtol+0xad>
    }
    else if (base == 0) {
  102a0f:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102a13:	75 07                	jne    102a1c <strtol+0xad>
        base = 10;
  102a15:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  102a1c:	8b 45 08             	mov    0x8(%ebp),%eax
  102a1f:	0f b6 00             	movzbl (%eax),%eax
  102a22:	3c 2f                	cmp    $0x2f,%al
  102a24:	7e 1b                	jle    102a41 <strtol+0xd2>
  102a26:	8b 45 08             	mov    0x8(%ebp),%eax
  102a29:	0f b6 00             	movzbl (%eax),%eax
  102a2c:	3c 39                	cmp    $0x39,%al
  102a2e:	7f 11                	jg     102a41 <strtol+0xd2>
            dig = *s - '0';
  102a30:	8b 45 08             	mov    0x8(%ebp),%eax
  102a33:	0f b6 00             	movzbl (%eax),%eax
  102a36:	0f be c0             	movsbl %al,%eax
  102a39:	83 e8 30             	sub    $0x30,%eax
  102a3c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102a3f:	eb 48                	jmp    102a89 <strtol+0x11a>
        }
        else if (*s >= 'a' && *s <= 'z') {
  102a41:	8b 45 08             	mov    0x8(%ebp),%eax
  102a44:	0f b6 00             	movzbl (%eax),%eax
  102a47:	3c 60                	cmp    $0x60,%al
  102a49:	7e 1b                	jle    102a66 <strtol+0xf7>
  102a4b:	8b 45 08             	mov    0x8(%ebp),%eax
  102a4e:	0f b6 00             	movzbl (%eax),%eax
  102a51:	3c 7a                	cmp    $0x7a,%al
  102a53:	7f 11                	jg     102a66 <strtol+0xf7>
            dig = *s - 'a' + 10;
  102a55:	8b 45 08             	mov    0x8(%ebp),%eax
  102a58:	0f b6 00             	movzbl (%eax),%eax
  102a5b:	0f be c0             	movsbl %al,%eax
  102a5e:	83 e8 57             	sub    $0x57,%eax
  102a61:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102a64:	eb 23                	jmp    102a89 <strtol+0x11a>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  102a66:	8b 45 08             	mov    0x8(%ebp),%eax
  102a69:	0f b6 00             	movzbl (%eax),%eax
  102a6c:	3c 40                	cmp    $0x40,%al
  102a6e:	7e 3c                	jle    102aac <strtol+0x13d>
  102a70:	8b 45 08             	mov    0x8(%ebp),%eax
  102a73:	0f b6 00             	movzbl (%eax),%eax
  102a76:	3c 5a                	cmp    $0x5a,%al
  102a78:	7f 32                	jg     102aac <strtol+0x13d>
            dig = *s - 'A' + 10;
  102a7a:	8b 45 08             	mov    0x8(%ebp),%eax
  102a7d:	0f b6 00             	movzbl (%eax),%eax
  102a80:	0f be c0             	movsbl %al,%eax
  102a83:	83 e8 37             	sub    $0x37,%eax
  102a86:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  102a89:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102a8c:	3b 45 10             	cmp    0x10(%ebp),%eax
  102a8f:	7d 1a                	jge    102aab <strtol+0x13c>
            break;
        }
        s ++, val = (val * base) + dig;
  102a91:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102a95:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102a98:	0f af 45 10          	imul   0x10(%ebp),%eax
  102a9c:	89 c2                	mov    %eax,%edx
  102a9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102aa1:	01 d0                	add    %edx,%eax
  102aa3:	89 45 f8             	mov    %eax,-0x8(%ebp)
        // we don't properly detect overflow!
    }
  102aa6:	e9 71 ff ff ff       	jmp    102a1c <strtol+0xad>
        }
        else {
            break;
        }
        if (dig >= base) {
            break;
  102aab:	90                   	nop
        }
        s ++, val = (val * base) + dig;
        // we don't properly detect overflow!
    }

    if (endptr) {
  102aac:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102ab0:	74 08                	je     102aba <strtol+0x14b>
        *endptr = (char *) s;
  102ab2:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ab5:	8b 55 08             	mov    0x8(%ebp),%edx
  102ab8:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  102aba:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  102abe:	74 07                	je     102ac7 <strtol+0x158>
  102ac0:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102ac3:	f7 d8                	neg    %eax
  102ac5:	eb 03                	jmp    102aca <strtol+0x15b>
  102ac7:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  102aca:	c9                   	leave  
  102acb:	c3                   	ret    

00102acc <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  102acc:	55                   	push   %ebp
  102acd:	89 e5                	mov    %esp,%ebp
  102acf:	57                   	push   %edi
  102ad0:	83 ec 24             	sub    $0x24,%esp
  102ad3:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ad6:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  102ad9:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  102add:	8b 55 08             	mov    0x8(%ebp),%edx
  102ae0:	89 55 f8             	mov    %edx,-0x8(%ebp)
  102ae3:	88 45 f7             	mov    %al,-0x9(%ebp)
  102ae6:	8b 45 10             	mov    0x10(%ebp),%eax
  102ae9:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  102aec:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  102aef:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  102af3:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102af6:	89 d7                	mov    %edx,%edi
  102af8:	f3 aa                	rep stos %al,%es:(%edi)
  102afa:	89 fa                	mov    %edi,%edx
  102afc:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102aff:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  102b02:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102b05:	90                   	nop
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  102b06:	83 c4 24             	add    $0x24,%esp
  102b09:	5f                   	pop    %edi
  102b0a:	5d                   	pop    %ebp
  102b0b:	c3                   	ret    

00102b0c <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  102b0c:	55                   	push   %ebp
  102b0d:	89 e5                	mov    %esp,%ebp
  102b0f:	57                   	push   %edi
  102b10:	56                   	push   %esi
  102b11:	53                   	push   %ebx
  102b12:	83 ec 30             	sub    $0x30,%esp
  102b15:	8b 45 08             	mov    0x8(%ebp),%eax
  102b18:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102b1b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b1e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102b21:	8b 45 10             	mov    0x10(%ebp),%eax
  102b24:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  102b27:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b2a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102b2d:	73 42                	jae    102b71 <memmove+0x65>
  102b2f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b32:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102b35:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102b38:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102b3b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102b3e:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102b41:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102b44:	c1 e8 02             	shr    $0x2,%eax
  102b47:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  102b49:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102b4c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102b4f:	89 d7                	mov    %edx,%edi
  102b51:	89 c6                	mov    %eax,%esi
  102b53:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102b55:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  102b58:	83 e1 03             	and    $0x3,%ecx
  102b5b:	74 02                	je     102b5f <memmove+0x53>
  102b5d:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102b5f:	89 f0                	mov    %esi,%eax
  102b61:	89 fa                	mov    %edi,%edx
  102b63:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  102b66:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  102b69:	89 45 d0             	mov    %eax,-0x30(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  102b6c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
#ifdef __HAVE_ARCH_MEMMOVE
    return __memmove(dst, src, n);
  102b6f:	eb 36                	jmp    102ba7 <memmove+0x9b>
    asm volatile (
            "std;"
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  102b71:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102b74:	8d 50 ff             	lea    -0x1(%eax),%edx
  102b77:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102b7a:	01 c2                	add    %eax,%edx
  102b7c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102b7f:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102b82:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b85:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
        return __memcpy(dst, src, n);
    }
    int d0, d1, d2;
    asm volatile (
  102b88:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102b8b:	89 c1                	mov    %eax,%ecx
  102b8d:	89 d8                	mov    %ebx,%eax
  102b8f:	89 d6                	mov    %edx,%esi
  102b91:	89 c7                	mov    %eax,%edi
  102b93:	fd                   	std    
  102b94:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102b96:	fc                   	cld    
  102b97:	89 f8                	mov    %edi,%eax
  102b99:	89 f2                	mov    %esi,%edx
  102b9b:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  102b9e:	89 55 c8             	mov    %edx,-0x38(%ebp)
  102ba1:	89 45 c4             	mov    %eax,-0x3c(%ebp)
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
            : "memory");
    return dst;
  102ba4:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  102ba7:	83 c4 30             	add    $0x30,%esp
  102baa:	5b                   	pop    %ebx
  102bab:	5e                   	pop    %esi
  102bac:	5f                   	pop    %edi
  102bad:	5d                   	pop    %ebp
  102bae:	c3                   	ret    

00102baf <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  102baf:	55                   	push   %ebp
  102bb0:	89 e5                	mov    %esp,%ebp
  102bb2:	57                   	push   %edi
  102bb3:	56                   	push   %esi
  102bb4:	83 ec 20             	sub    $0x20,%esp
  102bb7:	8b 45 08             	mov    0x8(%ebp),%eax
  102bba:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102bbd:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bc0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102bc3:	8b 45 10             	mov    0x10(%ebp),%eax
  102bc6:	89 45 ec             	mov    %eax,-0x14(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102bc9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102bcc:	c1 e8 02             	shr    $0x2,%eax
  102bcf:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  102bd1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102bd4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102bd7:	89 d7                	mov    %edx,%edi
  102bd9:	89 c6                	mov    %eax,%esi
  102bdb:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102bdd:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  102be0:	83 e1 03             	and    $0x3,%ecx
  102be3:	74 02                	je     102be7 <memcpy+0x38>
  102be5:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102be7:	89 f0                	mov    %esi,%eax
  102be9:	89 fa                	mov    %edi,%edx
  102beb:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102bee:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  102bf1:	89 45 e0             	mov    %eax,-0x20(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  102bf4:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_MEMCPY
    return __memcpy(dst, src, n);
  102bf7:	90                   	nop
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  102bf8:	83 c4 20             	add    $0x20,%esp
  102bfb:	5e                   	pop    %esi
  102bfc:	5f                   	pop    %edi
  102bfd:	5d                   	pop    %ebp
  102bfe:	c3                   	ret    

00102bff <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  102bff:	55                   	push   %ebp
  102c00:	89 e5                	mov    %esp,%ebp
  102c02:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  102c05:	8b 45 08             	mov    0x8(%ebp),%eax
  102c08:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  102c0b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c0e:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  102c11:	eb 30                	jmp    102c43 <memcmp+0x44>
        if (*s1 != *s2) {
  102c13:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102c16:	0f b6 10             	movzbl (%eax),%edx
  102c19:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102c1c:	0f b6 00             	movzbl (%eax),%eax
  102c1f:	38 c2                	cmp    %al,%dl
  102c21:	74 18                	je     102c3b <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  102c23:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102c26:	0f b6 00             	movzbl (%eax),%eax
  102c29:	0f b6 d0             	movzbl %al,%edx
  102c2c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102c2f:	0f b6 00             	movzbl (%eax),%eax
  102c32:	0f b6 c0             	movzbl %al,%eax
  102c35:	29 c2                	sub    %eax,%edx
  102c37:	89 d0                	mov    %edx,%eax
  102c39:	eb 1a                	jmp    102c55 <memcmp+0x56>
        }
        s1 ++, s2 ++;
  102c3b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102c3f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
    const char *s1 = (const char *)v1;
    const char *s2 = (const char *)v2;
    while (n -- > 0) {
  102c43:	8b 45 10             	mov    0x10(%ebp),%eax
  102c46:	8d 50 ff             	lea    -0x1(%eax),%edx
  102c49:	89 55 10             	mov    %edx,0x10(%ebp)
  102c4c:	85 c0                	test   %eax,%eax
  102c4e:	75 c3                	jne    102c13 <memcmp+0x14>
        if (*s1 != *s2) {
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
        }
        s1 ++, s2 ++;
    }
    return 0;
  102c50:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102c55:	c9                   	leave  
  102c56:	c3                   	ret    

00102c57 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102c57:	55                   	push   %ebp
  102c58:	89 e5                	mov    %esp,%ebp
  102c5a:	83 ec 38             	sub    $0x38,%esp
  102c5d:	8b 45 10             	mov    0x10(%ebp),%eax
  102c60:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102c63:	8b 45 14             	mov    0x14(%ebp),%eax
  102c66:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102c69:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102c6c:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102c6f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102c72:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102c75:	8b 45 18             	mov    0x18(%ebp),%eax
  102c78:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102c7b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102c7e:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102c81:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102c84:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102c87:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c8a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102c8d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102c91:	74 1c                	je     102caf <printnum+0x58>
  102c93:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c96:	ba 00 00 00 00       	mov    $0x0,%edx
  102c9b:	f7 75 e4             	divl   -0x1c(%ebp)
  102c9e:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102ca1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ca4:	ba 00 00 00 00       	mov    $0x0,%edx
  102ca9:	f7 75 e4             	divl   -0x1c(%ebp)
  102cac:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102caf:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102cb2:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102cb5:	f7 75 e4             	divl   -0x1c(%ebp)
  102cb8:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102cbb:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102cbe:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102cc1:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102cc4:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102cc7:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102cca:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102ccd:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102cd0:	8b 45 18             	mov    0x18(%ebp),%eax
  102cd3:	ba 00 00 00 00       	mov    $0x0,%edx
  102cd8:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102cdb:	77 41                	ja     102d1e <printnum+0xc7>
  102cdd:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102ce0:	72 05                	jb     102ce7 <printnum+0x90>
  102ce2:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  102ce5:	77 37                	ja     102d1e <printnum+0xc7>
        printnum(putch, putdat, result, base, width - 1, padc);
  102ce7:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102cea:	83 e8 01             	sub    $0x1,%eax
  102ced:	83 ec 04             	sub    $0x4,%esp
  102cf0:	ff 75 20             	pushl  0x20(%ebp)
  102cf3:	50                   	push   %eax
  102cf4:	ff 75 18             	pushl  0x18(%ebp)
  102cf7:	ff 75 ec             	pushl  -0x14(%ebp)
  102cfa:	ff 75 e8             	pushl  -0x18(%ebp)
  102cfd:	ff 75 0c             	pushl  0xc(%ebp)
  102d00:	ff 75 08             	pushl  0x8(%ebp)
  102d03:	e8 4f ff ff ff       	call   102c57 <printnum>
  102d08:	83 c4 20             	add    $0x20,%esp
  102d0b:	eb 1b                	jmp    102d28 <printnum+0xd1>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102d0d:	83 ec 08             	sub    $0x8,%esp
  102d10:	ff 75 0c             	pushl  0xc(%ebp)
  102d13:	ff 75 20             	pushl  0x20(%ebp)
  102d16:	8b 45 08             	mov    0x8(%ebp),%eax
  102d19:	ff d0                	call   *%eax
  102d1b:	83 c4 10             	add    $0x10,%esp
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
  102d1e:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  102d22:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102d26:	7f e5                	jg     102d0d <printnum+0xb6>
            putch(padc, putdat);
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  102d28:	8b 45 d8             	mov    -0x28(%ebp),%eax
  102d2b:	05 10 3a 10 00       	add    $0x103a10,%eax
  102d30:	0f b6 00             	movzbl (%eax),%eax
  102d33:	0f be c0             	movsbl %al,%eax
  102d36:	83 ec 08             	sub    $0x8,%esp
  102d39:	ff 75 0c             	pushl  0xc(%ebp)
  102d3c:	50                   	push   %eax
  102d3d:	8b 45 08             	mov    0x8(%ebp),%eax
  102d40:	ff d0                	call   *%eax
  102d42:	83 c4 10             	add    $0x10,%esp
}
  102d45:	90                   	nop
  102d46:	c9                   	leave  
  102d47:	c3                   	ret    

00102d48 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  102d48:	55                   	push   %ebp
  102d49:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102d4b:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102d4f:	7e 14                	jle    102d65 <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  102d51:	8b 45 08             	mov    0x8(%ebp),%eax
  102d54:	8b 00                	mov    (%eax),%eax
  102d56:	8d 48 08             	lea    0x8(%eax),%ecx
  102d59:	8b 55 08             	mov    0x8(%ebp),%edx
  102d5c:	89 0a                	mov    %ecx,(%edx)
  102d5e:	8b 50 04             	mov    0x4(%eax),%edx
  102d61:	8b 00                	mov    (%eax),%eax
  102d63:	eb 30                	jmp    102d95 <getuint+0x4d>
    }
    else if (lflag) {
  102d65:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102d69:	74 16                	je     102d81 <getuint+0x39>
        return va_arg(*ap, unsigned long);
  102d6b:	8b 45 08             	mov    0x8(%ebp),%eax
  102d6e:	8b 00                	mov    (%eax),%eax
  102d70:	8d 48 04             	lea    0x4(%eax),%ecx
  102d73:	8b 55 08             	mov    0x8(%ebp),%edx
  102d76:	89 0a                	mov    %ecx,(%edx)
  102d78:	8b 00                	mov    (%eax),%eax
  102d7a:	ba 00 00 00 00       	mov    $0x0,%edx
  102d7f:	eb 14                	jmp    102d95 <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  102d81:	8b 45 08             	mov    0x8(%ebp),%eax
  102d84:	8b 00                	mov    (%eax),%eax
  102d86:	8d 48 04             	lea    0x4(%eax),%ecx
  102d89:	8b 55 08             	mov    0x8(%ebp),%edx
  102d8c:	89 0a                	mov    %ecx,(%edx)
  102d8e:	8b 00                	mov    (%eax),%eax
  102d90:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102d95:	5d                   	pop    %ebp
  102d96:	c3                   	ret    

00102d97 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102d97:	55                   	push   %ebp
  102d98:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102d9a:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102d9e:	7e 14                	jle    102db4 <getint+0x1d>
        return va_arg(*ap, long long);
  102da0:	8b 45 08             	mov    0x8(%ebp),%eax
  102da3:	8b 00                	mov    (%eax),%eax
  102da5:	8d 48 08             	lea    0x8(%eax),%ecx
  102da8:	8b 55 08             	mov    0x8(%ebp),%edx
  102dab:	89 0a                	mov    %ecx,(%edx)
  102dad:	8b 50 04             	mov    0x4(%eax),%edx
  102db0:	8b 00                	mov    (%eax),%eax
  102db2:	eb 28                	jmp    102ddc <getint+0x45>
    }
    else if (lflag) {
  102db4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102db8:	74 12                	je     102dcc <getint+0x35>
        return va_arg(*ap, long);
  102dba:	8b 45 08             	mov    0x8(%ebp),%eax
  102dbd:	8b 00                	mov    (%eax),%eax
  102dbf:	8d 48 04             	lea    0x4(%eax),%ecx
  102dc2:	8b 55 08             	mov    0x8(%ebp),%edx
  102dc5:	89 0a                	mov    %ecx,(%edx)
  102dc7:	8b 00                	mov    (%eax),%eax
  102dc9:	99                   	cltd   
  102dca:	eb 10                	jmp    102ddc <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  102dcc:	8b 45 08             	mov    0x8(%ebp),%eax
  102dcf:	8b 00                	mov    (%eax),%eax
  102dd1:	8d 48 04             	lea    0x4(%eax),%ecx
  102dd4:	8b 55 08             	mov    0x8(%ebp),%edx
  102dd7:	89 0a                	mov    %ecx,(%edx)
  102dd9:	8b 00                	mov    (%eax),%eax
  102ddb:	99                   	cltd   
    }
}
  102ddc:	5d                   	pop    %ebp
  102ddd:	c3                   	ret    

00102dde <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102dde:	55                   	push   %ebp
  102ddf:	89 e5                	mov    %esp,%ebp
  102de1:	83 ec 18             	sub    $0x18,%esp
    va_list ap;

    va_start(ap, fmt);
  102de4:	8d 45 14             	lea    0x14(%ebp),%eax
  102de7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  102dea:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102ded:	50                   	push   %eax
  102dee:	ff 75 10             	pushl  0x10(%ebp)
  102df1:	ff 75 0c             	pushl  0xc(%ebp)
  102df4:	ff 75 08             	pushl  0x8(%ebp)
  102df7:	e8 06 00 00 00       	call   102e02 <vprintfmt>
  102dfc:	83 c4 10             	add    $0x10,%esp
    va_end(ap);
}
  102dff:	90                   	nop
  102e00:	c9                   	leave  
  102e01:	c3                   	ret    

00102e02 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102e02:	55                   	push   %ebp
  102e03:	89 e5                	mov    %esp,%ebp
  102e05:	56                   	push   %esi
  102e06:	53                   	push   %ebx
  102e07:	83 ec 20             	sub    $0x20,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102e0a:	eb 17                	jmp    102e23 <vprintfmt+0x21>
            if (ch == '\0') {
  102e0c:	85 db                	test   %ebx,%ebx
  102e0e:	0f 84 8e 03 00 00    	je     1031a2 <vprintfmt+0x3a0>
                return;
            }
            putch(ch, putdat);
  102e14:	83 ec 08             	sub    $0x8,%esp
  102e17:	ff 75 0c             	pushl  0xc(%ebp)
  102e1a:	53                   	push   %ebx
  102e1b:	8b 45 08             	mov    0x8(%ebp),%eax
  102e1e:	ff d0                	call   *%eax
  102e20:	83 c4 10             	add    $0x10,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102e23:	8b 45 10             	mov    0x10(%ebp),%eax
  102e26:	8d 50 01             	lea    0x1(%eax),%edx
  102e29:	89 55 10             	mov    %edx,0x10(%ebp)
  102e2c:	0f b6 00             	movzbl (%eax),%eax
  102e2f:	0f b6 d8             	movzbl %al,%ebx
  102e32:	83 fb 25             	cmp    $0x25,%ebx
  102e35:	75 d5                	jne    102e0c <vprintfmt+0xa>
            }
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
  102e37:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  102e3b:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102e42:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102e45:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  102e48:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  102e4f:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102e52:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102e55:	8b 45 10             	mov    0x10(%ebp),%eax
  102e58:	8d 50 01             	lea    0x1(%eax),%edx
  102e5b:	89 55 10             	mov    %edx,0x10(%ebp)
  102e5e:	0f b6 00             	movzbl (%eax),%eax
  102e61:	0f b6 d8             	movzbl %al,%ebx
  102e64:	8d 43 dd             	lea    -0x23(%ebx),%eax
  102e67:	83 f8 55             	cmp    $0x55,%eax
  102e6a:	0f 87 05 03 00 00    	ja     103175 <vprintfmt+0x373>
  102e70:	8b 04 85 34 3a 10 00 	mov    0x103a34(,%eax,4),%eax
  102e77:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  102e79:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  102e7d:	eb d6                	jmp    102e55 <vprintfmt+0x53>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  102e7f:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  102e83:	eb d0                	jmp    102e55 <vprintfmt+0x53>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102e85:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  102e8c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102e8f:	89 d0                	mov    %edx,%eax
  102e91:	c1 e0 02             	shl    $0x2,%eax
  102e94:	01 d0                	add    %edx,%eax
  102e96:	01 c0                	add    %eax,%eax
  102e98:	01 d8                	add    %ebx,%eax
  102e9a:	83 e8 30             	sub    $0x30,%eax
  102e9d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  102ea0:	8b 45 10             	mov    0x10(%ebp),%eax
  102ea3:	0f b6 00             	movzbl (%eax),%eax
  102ea6:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  102ea9:	83 fb 2f             	cmp    $0x2f,%ebx
  102eac:	7e 39                	jle    102ee7 <vprintfmt+0xe5>
  102eae:	83 fb 39             	cmp    $0x39,%ebx
  102eb1:	7f 34                	jg     102ee7 <vprintfmt+0xe5>
            padc = '0';
            goto reswitch;

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102eb3:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                precision = precision * 10 + ch - '0';
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
  102eb7:	eb d3                	jmp    102e8c <vprintfmt+0x8a>
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  102eb9:	8b 45 14             	mov    0x14(%ebp),%eax
  102ebc:	8d 50 04             	lea    0x4(%eax),%edx
  102ebf:	89 55 14             	mov    %edx,0x14(%ebp)
  102ec2:	8b 00                	mov    (%eax),%eax
  102ec4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  102ec7:	eb 1f                	jmp    102ee8 <vprintfmt+0xe6>

        case '.':
            if (width < 0)
  102ec9:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102ecd:	79 86                	jns    102e55 <vprintfmt+0x53>
                width = 0;
  102ecf:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  102ed6:	e9 7a ff ff ff       	jmp    102e55 <vprintfmt+0x53>

        case '#':
            altflag = 1;
  102edb:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  102ee2:	e9 6e ff ff ff       	jmp    102e55 <vprintfmt+0x53>
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
            goto process_precision;
  102ee7:	90                   	nop
        case '#':
            altflag = 1;
            goto reswitch;

        process_precision:
            if (width < 0)
  102ee8:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102eec:	0f 89 63 ff ff ff    	jns    102e55 <vprintfmt+0x53>
                width = precision, precision = -1;
  102ef2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102ef5:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102ef8:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  102eff:	e9 51 ff ff ff       	jmp    102e55 <vprintfmt+0x53>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  102f04:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
            goto reswitch;
  102f08:	e9 48 ff ff ff       	jmp    102e55 <vprintfmt+0x53>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  102f0d:	8b 45 14             	mov    0x14(%ebp),%eax
  102f10:	8d 50 04             	lea    0x4(%eax),%edx
  102f13:	89 55 14             	mov    %edx,0x14(%ebp)
  102f16:	8b 00                	mov    (%eax),%eax
  102f18:	83 ec 08             	sub    $0x8,%esp
  102f1b:	ff 75 0c             	pushl  0xc(%ebp)
  102f1e:	50                   	push   %eax
  102f1f:	8b 45 08             	mov    0x8(%ebp),%eax
  102f22:	ff d0                	call   *%eax
  102f24:	83 c4 10             	add    $0x10,%esp
            break;
  102f27:	e9 71 02 00 00       	jmp    10319d <vprintfmt+0x39b>

        // error message
        case 'e':
            err = va_arg(ap, int);
  102f2c:	8b 45 14             	mov    0x14(%ebp),%eax
  102f2f:	8d 50 04             	lea    0x4(%eax),%edx
  102f32:	89 55 14             	mov    %edx,0x14(%ebp)
  102f35:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  102f37:	85 db                	test   %ebx,%ebx
  102f39:	79 02                	jns    102f3d <vprintfmt+0x13b>
                err = -err;
  102f3b:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  102f3d:	83 fb 06             	cmp    $0x6,%ebx
  102f40:	7f 0b                	jg     102f4d <vprintfmt+0x14b>
  102f42:	8b 34 9d f4 39 10 00 	mov    0x1039f4(,%ebx,4),%esi
  102f49:	85 f6                	test   %esi,%esi
  102f4b:	75 19                	jne    102f66 <vprintfmt+0x164>
                printfmt(putch, putdat, "error %d", err);
  102f4d:	53                   	push   %ebx
  102f4e:	68 21 3a 10 00       	push   $0x103a21
  102f53:	ff 75 0c             	pushl  0xc(%ebp)
  102f56:	ff 75 08             	pushl  0x8(%ebp)
  102f59:	e8 80 fe ff ff       	call   102dde <printfmt>
  102f5e:	83 c4 10             	add    $0x10,%esp
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  102f61:	e9 37 02 00 00       	jmp    10319d <vprintfmt+0x39b>
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
                printfmt(putch, putdat, "error %d", err);
            }
            else {
                printfmt(putch, putdat, "%s", p);
  102f66:	56                   	push   %esi
  102f67:	68 2a 3a 10 00       	push   $0x103a2a
  102f6c:	ff 75 0c             	pushl  0xc(%ebp)
  102f6f:	ff 75 08             	pushl  0x8(%ebp)
  102f72:	e8 67 fe ff ff       	call   102dde <printfmt>
  102f77:	83 c4 10             	add    $0x10,%esp
            }
            break;
  102f7a:	e9 1e 02 00 00       	jmp    10319d <vprintfmt+0x39b>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  102f7f:	8b 45 14             	mov    0x14(%ebp),%eax
  102f82:	8d 50 04             	lea    0x4(%eax),%edx
  102f85:	89 55 14             	mov    %edx,0x14(%ebp)
  102f88:	8b 30                	mov    (%eax),%esi
  102f8a:	85 f6                	test   %esi,%esi
  102f8c:	75 05                	jne    102f93 <vprintfmt+0x191>
                p = "(null)";
  102f8e:	be 2d 3a 10 00       	mov    $0x103a2d,%esi
            }
            if (width > 0 && padc != '-') {
  102f93:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102f97:	7e 76                	jle    10300f <vprintfmt+0x20d>
  102f99:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  102f9d:	74 70                	je     10300f <vprintfmt+0x20d>
                for (width -= strnlen(p, precision); width > 0; width --) {
  102f9f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102fa2:	83 ec 08             	sub    $0x8,%esp
  102fa5:	50                   	push   %eax
  102fa6:	56                   	push   %esi
  102fa7:	e8 17 f8 ff ff       	call   1027c3 <strnlen>
  102fac:	83 c4 10             	add    $0x10,%esp
  102faf:	89 c2                	mov    %eax,%edx
  102fb1:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102fb4:	29 d0                	sub    %edx,%eax
  102fb6:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102fb9:	eb 17                	jmp    102fd2 <vprintfmt+0x1d0>
                    putch(padc, putdat);
  102fbb:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  102fbf:	83 ec 08             	sub    $0x8,%esp
  102fc2:	ff 75 0c             	pushl  0xc(%ebp)
  102fc5:	50                   	push   %eax
  102fc6:	8b 45 08             	mov    0x8(%ebp),%eax
  102fc9:	ff d0                	call   *%eax
  102fcb:	83 c4 10             	add    $0x10,%esp
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
                p = "(null)";
            }
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
  102fce:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102fd2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102fd6:	7f e3                	jg     102fbb <vprintfmt+0x1b9>
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102fd8:	eb 35                	jmp    10300f <vprintfmt+0x20d>
                if (altflag && (ch < ' ' || ch > '~')) {
  102fda:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  102fde:	74 1c                	je     102ffc <vprintfmt+0x1fa>
  102fe0:	83 fb 1f             	cmp    $0x1f,%ebx
  102fe3:	7e 05                	jle    102fea <vprintfmt+0x1e8>
  102fe5:	83 fb 7e             	cmp    $0x7e,%ebx
  102fe8:	7e 12                	jle    102ffc <vprintfmt+0x1fa>
                    putch('?', putdat);
  102fea:	83 ec 08             	sub    $0x8,%esp
  102fed:	ff 75 0c             	pushl  0xc(%ebp)
  102ff0:	6a 3f                	push   $0x3f
  102ff2:	8b 45 08             	mov    0x8(%ebp),%eax
  102ff5:	ff d0                	call   *%eax
  102ff7:	83 c4 10             	add    $0x10,%esp
  102ffa:	eb 0f                	jmp    10300b <vprintfmt+0x209>
                }
                else {
                    putch(ch, putdat);
  102ffc:	83 ec 08             	sub    $0x8,%esp
  102fff:	ff 75 0c             	pushl  0xc(%ebp)
  103002:	53                   	push   %ebx
  103003:	8b 45 08             	mov    0x8(%ebp),%eax
  103006:	ff d0                	call   *%eax
  103008:	83 c4 10             	add    $0x10,%esp
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  10300b:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  10300f:	89 f0                	mov    %esi,%eax
  103011:	8d 70 01             	lea    0x1(%eax),%esi
  103014:	0f b6 00             	movzbl (%eax),%eax
  103017:	0f be d8             	movsbl %al,%ebx
  10301a:	85 db                	test   %ebx,%ebx
  10301c:	74 26                	je     103044 <vprintfmt+0x242>
  10301e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  103022:	78 b6                	js     102fda <vprintfmt+0x1d8>
  103024:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  103028:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  10302c:	79 ac                	jns    102fda <vprintfmt+0x1d8>
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  10302e:	eb 14                	jmp    103044 <vprintfmt+0x242>
                putch(' ', putdat);
  103030:	83 ec 08             	sub    $0x8,%esp
  103033:	ff 75 0c             	pushl  0xc(%ebp)
  103036:	6a 20                	push   $0x20
  103038:	8b 45 08             	mov    0x8(%ebp),%eax
  10303b:	ff d0                	call   *%eax
  10303d:	83 c4 10             	add    $0x10,%esp
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  103040:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  103044:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103048:	7f e6                	jg     103030 <vprintfmt+0x22e>
                putch(' ', putdat);
            }
            break;
  10304a:	e9 4e 01 00 00       	jmp    10319d <vprintfmt+0x39b>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  10304f:	83 ec 08             	sub    $0x8,%esp
  103052:	ff 75 e0             	pushl  -0x20(%ebp)
  103055:	8d 45 14             	lea    0x14(%ebp),%eax
  103058:	50                   	push   %eax
  103059:	e8 39 fd ff ff       	call   102d97 <getint>
  10305e:	83 c4 10             	add    $0x10,%esp
  103061:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103064:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  103067:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10306a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10306d:	85 d2                	test   %edx,%edx
  10306f:	79 23                	jns    103094 <vprintfmt+0x292>
                putch('-', putdat);
  103071:	83 ec 08             	sub    $0x8,%esp
  103074:	ff 75 0c             	pushl  0xc(%ebp)
  103077:	6a 2d                	push   $0x2d
  103079:	8b 45 08             	mov    0x8(%ebp),%eax
  10307c:	ff d0                	call   *%eax
  10307e:	83 c4 10             	add    $0x10,%esp
                num = -(long long)num;
  103081:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103084:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103087:	f7 d8                	neg    %eax
  103089:	83 d2 00             	adc    $0x0,%edx
  10308c:	f7 da                	neg    %edx
  10308e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103091:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  103094:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  10309b:	e9 9f 00 00 00       	jmp    10313f <vprintfmt+0x33d>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  1030a0:	83 ec 08             	sub    $0x8,%esp
  1030a3:	ff 75 e0             	pushl  -0x20(%ebp)
  1030a6:	8d 45 14             	lea    0x14(%ebp),%eax
  1030a9:	50                   	push   %eax
  1030aa:	e8 99 fc ff ff       	call   102d48 <getuint>
  1030af:	83 c4 10             	add    $0x10,%esp
  1030b2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1030b5:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  1030b8:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  1030bf:	eb 7e                	jmp    10313f <vprintfmt+0x33d>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  1030c1:	83 ec 08             	sub    $0x8,%esp
  1030c4:	ff 75 e0             	pushl  -0x20(%ebp)
  1030c7:	8d 45 14             	lea    0x14(%ebp),%eax
  1030ca:	50                   	push   %eax
  1030cb:	e8 78 fc ff ff       	call   102d48 <getuint>
  1030d0:	83 c4 10             	add    $0x10,%esp
  1030d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1030d6:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  1030d9:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  1030e0:	eb 5d                	jmp    10313f <vprintfmt+0x33d>

        // pointer
        case 'p':
            putch('0', putdat);
  1030e2:	83 ec 08             	sub    $0x8,%esp
  1030e5:	ff 75 0c             	pushl  0xc(%ebp)
  1030e8:	6a 30                	push   $0x30
  1030ea:	8b 45 08             	mov    0x8(%ebp),%eax
  1030ed:	ff d0                	call   *%eax
  1030ef:	83 c4 10             	add    $0x10,%esp
            putch('x', putdat);
  1030f2:	83 ec 08             	sub    $0x8,%esp
  1030f5:	ff 75 0c             	pushl  0xc(%ebp)
  1030f8:	6a 78                	push   $0x78
  1030fa:	8b 45 08             	mov    0x8(%ebp),%eax
  1030fd:	ff d0                	call   *%eax
  1030ff:	83 c4 10             	add    $0x10,%esp
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  103102:	8b 45 14             	mov    0x14(%ebp),%eax
  103105:	8d 50 04             	lea    0x4(%eax),%edx
  103108:	89 55 14             	mov    %edx,0x14(%ebp)
  10310b:	8b 00                	mov    (%eax),%eax
  10310d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103110:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  103117:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  10311e:	eb 1f                	jmp    10313f <vprintfmt+0x33d>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  103120:	83 ec 08             	sub    $0x8,%esp
  103123:	ff 75 e0             	pushl  -0x20(%ebp)
  103126:	8d 45 14             	lea    0x14(%ebp),%eax
  103129:	50                   	push   %eax
  10312a:	e8 19 fc ff ff       	call   102d48 <getuint>
  10312f:	83 c4 10             	add    $0x10,%esp
  103132:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103135:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  103138:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  10313f:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  103143:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103146:	83 ec 04             	sub    $0x4,%esp
  103149:	52                   	push   %edx
  10314a:	ff 75 e8             	pushl  -0x18(%ebp)
  10314d:	50                   	push   %eax
  10314e:	ff 75 f4             	pushl  -0xc(%ebp)
  103151:	ff 75 f0             	pushl  -0x10(%ebp)
  103154:	ff 75 0c             	pushl  0xc(%ebp)
  103157:	ff 75 08             	pushl  0x8(%ebp)
  10315a:	e8 f8 fa ff ff       	call   102c57 <printnum>
  10315f:	83 c4 20             	add    $0x20,%esp
            break;
  103162:	eb 39                	jmp    10319d <vprintfmt+0x39b>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  103164:	83 ec 08             	sub    $0x8,%esp
  103167:	ff 75 0c             	pushl  0xc(%ebp)
  10316a:	53                   	push   %ebx
  10316b:	8b 45 08             	mov    0x8(%ebp),%eax
  10316e:	ff d0                	call   *%eax
  103170:	83 c4 10             	add    $0x10,%esp
            break;
  103173:	eb 28                	jmp    10319d <vprintfmt+0x39b>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  103175:	83 ec 08             	sub    $0x8,%esp
  103178:	ff 75 0c             	pushl  0xc(%ebp)
  10317b:	6a 25                	push   $0x25
  10317d:	8b 45 08             	mov    0x8(%ebp),%eax
  103180:	ff d0                	call   *%eax
  103182:	83 c4 10             	add    $0x10,%esp
            for (fmt --; fmt[-1] != '%'; fmt --)
  103185:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103189:	eb 04                	jmp    10318f <vprintfmt+0x38d>
  10318b:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  10318f:	8b 45 10             	mov    0x10(%ebp),%eax
  103192:	83 e8 01             	sub    $0x1,%eax
  103195:	0f b6 00             	movzbl (%eax),%eax
  103198:	3c 25                	cmp    $0x25,%al
  10319a:	75 ef                	jne    10318b <vprintfmt+0x389>
                /* do nothing */;
            break;
  10319c:	90                   	nop
        }
    }
  10319d:	e9 68 fc ff ff       	jmp    102e0a <vprintfmt+0x8>
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
            if (ch == '\0') {
                return;
  1031a2:	90                   	nop
            for (fmt --; fmt[-1] != '%'; fmt --)
                /* do nothing */;
            break;
        }
    }
}
  1031a3:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1031a6:	5b                   	pop    %ebx
  1031a7:	5e                   	pop    %esi
  1031a8:	5d                   	pop    %ebp
  1031a9:	c3                   	ret    

001031aa <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  1031aa:	55                   	push   %ebp
  1031ab:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  1031ad:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031b0:	8b 40 08             	mov    0x8(%eax),%eax
  1031b3:	8d 50 01             	lea    0x1(%eax),%edx
  1031b6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031b9:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  1031bc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031bf:	8b 10                	mov    (%eax),%edx
  1031c1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031c4:	8b 40 04             	mov    0x4(%eax),%eax
  1031c7:	39 c2                	cmp    %eax,%edx
  1031c9:	73 12                	jae    1031dd <sprintputch+0x33>
        *b->buf ++ = ch;
  1031cb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031ce:	8b 00                	mov    (%eax),%eax
  1031d0:	8d 48 01             	lea    0x1(%eax),%ecx
  1031d3:	8b 55 0c             	mov    0xc(%ebp),%edx
  1031d6:	89 0a                	mov    %ecx,(%edx)
  1031d8:	8b 55 08             	mov    0x8(%ebp),%edx
  1031db:	88 10                	mov    %dl,(%eax)
    }
}
  1031dd:	90                   	nop
  1031de:	5d                   	pop    %ebp
  1031df:	c3                   	ret    

001031e0 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  1031e0:	55                   	push   %ebp
  1031e1:	89 e5                	mov    %esp,%ebp
  1031e3:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  1031e6:	8d 45 14             	lea    0x14(%ebp),%eax
  1031e9:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  1031ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1031ef:	50                   	push   %eax
  1031f0:	ff 75 10             	pushl  0x10(%ebp)
  1031f3:	ff 75 0c             	pushl  0xc(%ebp)
  1031f6:	ff 75 08             	pushl  0x8(%ebp)
  1031f9:	e8 0b 00 00 00       	call   103209 <vsnprintf>
  1031fe:	83 c4 10             	add    $0x10,%esp
  103201:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  103204:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103207:	c9                   	leave  
  103208:	c3                   	ret    

00103209 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  103209:	55                   	push   %ebp
  10320a:	89 e5                	mov    %esp,%ebp
  10320c:	83 ec 18             	sub    $0x18,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  10320f:	8b 45 08             	mov    0x8(%ebp),%eax
  103212:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103215:	8b 45 0c             	mov    0xc(%ebp),%eax
  103218:	8d 50 ff             	lea    -0x1(%eax),%edx
  10321b:	8b 45 08             	mov    0x8(%ebp),%eax
  10321e:	01 d0                	add    %edx,%eax
  103220:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103223:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  10322a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  10322e:	74 0a                	je     10323a <vsnprintf+0x31>
  103230:	8b 55 ec             	mov    -0x14(%ebp),%edx
  103233:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103236:	39 c2                	cmp    %eax,%edx
  103238:	76 07                	jbe    103241 <vsnprintf+0x38>
        return -E_INVAL;
  10323a:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  10323f:	eb 20                	jmp    103261 <vsnprintf+0x58>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  103241:	ff 75 14             	pushl  0x14(%ebp)
  103244:	ff 75 10             	pushl  0x10(%ebp)
  103247:	8d 45 ec             	lea    -0x14(%ebp),%eax
  10324a:	50                   	push   %eax
  10324b:	68 aa 31 10 00       	push   $0x1031aa
  103250:	e8 ad fb ff ff       	call   102e02 <vprintfmt>
  103255:	83 c4 10             	add    $0x10,%esp
    // null terminate the buffer
    *b.buf = '\0';
  103258:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10325b:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  10325e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103261:	c9                   	leave  
  103262:	c3                   	ret    
