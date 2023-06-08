
/home/rtrk/Desktop/losmi_komentarisao/vezba08/out/kernel.elf:     file format elf32-littlearm


Disassembly of section .text:

00008000 <_start>:
    8000:	e59ff018 	ldr	pc, [pc, #24]	; 8020 <_reset_h>
    8004:	e59ff018 	ldr	pc, [pc, #24]	; 8024 <_undefined_instruction_vector_h>
    8008:	e59ff018 	ldr	pc, [pc, #24]	; 8028 <_software_interrupt_vector_h>
    800c:	e59ff018 	ldr	pc, [pc, #24]	; 802c <_prefetch_abort_vector_h>
    8010:	e59ff018 	ldr	pc, [pc, #24]	; 8030 <_data_abort_vector_h>
    8014:	e59ff018 	ldr	pc, [pc, #24]	; 8034 <_unused_handler_h>
    8018:	e59ff018 	ldr	pc, [pc, #24]	; 8038 <_interrupt_vector_h>
    801c:	e59ff018 	ldr	pc, [pc, #24]	; 803c <_fast_interrupt_vector_h>

00008020 <_reset_h>:
    8020:	00008040 	andeq	r8, r0, r0, asr #32

00008024 <_undefined_instruction_vector_h>:
    8024:	00008040 	andeq	r8, r0, r0, asr #32

00008028 <_software_interrupt_vector_h>:
    8028:	000080b0 	strheq	r8, [r0], -r0

0000802c <_prefetch_abort_vector_h>:
    802c:	00008040 	andeq	r8, r0, r0, asr #32

00008030 <_data_abort_vector_h>:
    8030:	00008040 	andeq	r8, r0, r0, asr #32

00008034 <_unused_handler_h>:
    8034:	00008040 	andeq	r8, r0, r0, asr #32

00008038 <_interrupt_vector_h>:
    8038:	000080f0 	strdeq	r8, [r0], -r0

0000803c <_fast_interrupt_vector_h>:
    803c:	00008040 	andeq	r8, r0, r0, asr #32

00008040 <_reset_>:
    8040:	f10c00c0 	cpsid	if
    8044:	e10f0000 	mrs	r0, CPSR
    8048:	e200001f 	and	r0, r0, #31
    804c:	e3a0801a 	mov	r8, #26
    8050:	e1500008 	cmp	r0, r8
    8054:	0a000000 	beq	805c <_out_of_hyp>
    8058:	ea000006 	b	8078 <_set_interrupts>

0000805c <_out_of_hyp>:
    805c:	e59f10e0 	ldr	r1, [pc, #224]	; 8144 <_halt+0x8>
    8060:	e12ef301 	msr	ELR_hyp, r1
    8064:	e10f1000 	mrs	r1, CPSR
    8068:	e201101f 	and	r1, r1, #31
    806c:	e3811013 	orr	r1, r1, #19
    8070:	e16ef301 	msr	SPSR_hyp, r1
    8074:	e160006e 	eret

00008078 <_set_interrupts>:
    8078:	e3a00902 	mov	r0, #32768	; 0x8000
    807c:	e3a01000 	mov	r1, #0
    8080:	e8b003fc 	ldm	r0!, {r2, r3, r4, r5, r6, r7, r8, r9}
    8084:	e8a103fc 	stmia	r1!, {r2, r3, r4, r5, r6, r7, r8, r9}
    8088:	e8b003fc 	ldm	r0!, {r2, r3, r4, r5, r6, r7, r8, r9}
    808c:	e8a103fc 	stmia	r1!, {r2, r3, r4, r5, r6, r7, r8, r9}
    8090:	f10e00d2 	cpsid	if,#18
    8094:	e3a0da07 	mov	sp, #28672	; 0x7000
    8098:	f10e00d3 	cpsid	if,#19
    809c:	e3a0da06 	mov	sp, #24576	; 0x6000
    80a0:	f10e00df 	cpsid	if,#31
    80a4:	e3a0d902 	mov	sp, #32768	; 0x8000
    80a8:	eb000026 	bl	8148 <_cstartup>
    80ac:	ea000022 	b	813c <_halt>

000080b0 <_svc_vector>:
    80b0:	f96d0513 	srsdb	sp!, #19
    80b4:	e92d1fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
    80b8:	f10e00df 	cpsid	if,#31
    80bc:	e1a0000d 	mov	r0, sp
    80c0:	e1a0100e 	mov	r1, lr
    80c4:	f10e00d3 	cpsid	if,#19
    80c8:	e92d0003 	push	{r0, r1}
    80cc:	e1a0000d 	mov	r0, sp
    80d0:	eb001d83 	bl	f6e4 <svc_handler>
    80d4:	e8bd0003 	pop	{r0, r1}
    80d8:	f10e00df 	cpsid	if,#31
    80dc:	e1a0e001 	mov	lr, r1
    80e0:	e1a0d000 	mov	sp, r0
    80e4:	f10e00d3 	cpsid	if,#19
    80e8:	e8bd1fff 	pop	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
    80ec:	f8bd0a00 	rfeia	sp!

000080f0 <_irq_vector>:
    80f0:	e24ee004 	sub	lr, lr, #4
    80f4:	f96d0512 	srsdb	sp!, #18
    80f8:	e92d1fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
    80fc:	f10e00df 	cpsid	if,#31
    8100:	e1a0000d 	mov	r0, sp
    8104:	e1a0100e 	mov	r1, lr
    8108:	f10e00d2 	cpsid	if,#18
    810c:	e92d0003 	push	{r0, r1}
    8110:	e1a0000d 	mov	r0, sp
    8114:	eb001d5e 	bl	f694 <irq_handler>
    8118:	e8bd0003 	pop	{r0, r1}
    811c:	f10e00df 	cpsid	if,#31
    8120:	e1a0e001 	mov	lr, r1
    8124:	e1a0d000 	mov	sp, r0
    8128:	f10e00d2 	cpsid	if,#18
    812c:	e8bd1fff 	pop	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip}
    8130:	f8bd0a00 	rfeia	sp!

00008134 <_take_flags>:
    8134:	e10f0000 	mrs	r0, CPSR
    8138:	e12fff1e 	bx	lr

0000813c <_halt>:
    813c:	e320f002 	wfe
    8140:	eafffffd 	b	813c <_halt>
    8144:	00008078 	andeq	r8, r0, r8, ror r0

00008148 <_cstartup>:
    8148:	e92d4800 	push	{fp, lr}
    814c:	e28db004 	add	fp, sp, #4
    8150:	e24dd018 	sub	sp, sp, #24
    8154:	e50b0010 	str	r0, [fp, #-16]
    8158:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    815c:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    8160:	e30f3ee4 	movw	r3, #65252	; 0xfee4
    8164:	e3403000 	movt	r3, #0
    8168:	e50b3008 	str	r3, [fp, #-8]
    816c:	e300334c 	movw	r3, #844	; 0x34c
    8170:	e3403001 	movt	r3, #1
    8174:	e50b300c 	str	r3, [fp, #-12]
    8178:	ea000004 	b	8190 <_cstartup+0x48>
    817c:	e51b3008 	ldr	r3, [fp, #-8]
    8180:	e2832004 	add	r2, r3, #4
    8184:	e50b2008 	str	r2, [fp, #-8]
    8188:	e3a02000 	mov	r2, #0
    818c:	e5832000 	str	r2, [r3]
    8190:	e51b2008 	ldr	r2, [fp, #-8]
    8194:	e51b300c 	ldr	r3, [fp, #-12]
    8198:	e1520003 	cmp	r2, r3
    819c:	3afffff6 	bcc	817c <_cstartup+0x34>
    81a0:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    81a4:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
    81a8:	e51b0010 	ldr	r0, [fp, #-16]
    81ac:	eb001a98 	bl	ec14 <kernel_main>
    81b0:	ebffffe1 	bl	813c <_halt>
    81b4:	e320f000 	nop	{0}
    81b8:	e24bd004 	sub	sp, fp, #4
    81bc:	e8bd8800 	pop	{fp, pc}

000081c0 <set_disable>:
    81c0:	e92d4800 	push	{fp, lr}
    81c4:	e28db004 	add	fp, sp, #4
    81c8:	e24dd008 	sub	sp, sp, #8
    81cc:	ebffffd8 	bl	8134 <_take_flags>
    81d0:	e50b0008 	str	r0, [fp, #-8]
    81d4:	f10c0080 	cpsid	i
    81d8:	e51b3008 	ldr	r3, [fp, #-8]
    81dc:	e1a00003 	mov	r0, r3
    81e0:	e24bd004 	sub	sp, fp, #4
    81e4:	e8bd8800 	pop	{fp, pc}

000081e8 <set_enable>:
    81e8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    81ec:	e28db000 	add	fp, sp, #0
    81f0:	e24dd00c 	sub	sp, sp, #12
    81f4:	e50b0008 	str	r0, [fp, #-8]
    81f8:	e51b3008 	ldr	r3, [fp, #-8]
    81fc:	e2033080 	and	r3, r3, #128	; 0x80
    8200:	e3530000 	cmp	r3, #0
    8204:	1a000000 	bne	820c <set_enable+0x24>
    8208:	f1080080 	cpsie	i
    820c:	e320f000 	nop	{0}
    8210:	e28bd000 	add	sp, fp, #0
    8214:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8218:	e12fff1e 	bx	lr

0000821c <queue>:
    821c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8220:	e28db000 	add	fp, sp, #0
    8224:	e24dd014 	sub	sp, sp, #20
    8228:	e50b0010 	str	r0, [fp, #-16]
    822c:	e51b3010 	ldr	r3, [fp, #-16]
    8230:	e3a02000 	mov	r2, #0
    8234:	e5832068 	str	r2, [r3, #104]	; 0x68
    8238:	e30f3ef8 	movw	r3, #65272	; 0xfef8
    823c:	e3403000 	movt	r3, #0
    8240:	e5933000 	ldr	r3, [r3]
    8244:	e3530000 	cmp	r3, #0
    8248:	1a00000a 	bne	8278 <queue+0x5c>
    824c:	e30f3efc 	movw	r3, #65276	; 0xfefc
    8250:	e3403000 	movt	r3, #0
    8254:	e51b2010 	ldr	r2, [fp, #-16]
    8258:	e5832000 	str	r2, [r3]
    825c:	e30f3efc 	movw	r3, #65276	; 0xfefc
    8260:	e3403000 	movt	r3, #0
    8264:	e5932000 	ldr	r2, [r3]
    8268:	e30f3ef8 	movw	r3, #65272	; 0xfef8
    826c:	e3403000 	movt	r3, #0
    8270:	e5832000 	str	r2, [r3]
    8274:	ea000036 	b	8354 <queue+0x138>
    8278:	e30f3ef8 	movw	r3, #65272	; 0xfef8
    827c:	e3403000 	movt	r3, #0
    8280:	e5933000 	ldr	r3, [r3]
    8284:	e50b300c 	str	r3, [fp, #-12]
    8288:	e51b300c 	ldr	r3, [fp, #-12]
    828c:	e50b3008 	str	r3, [fp, #-8]
    8290:	ea000004 	b	82a8 <queue+0x8c>
    8294:	e51b300c 	ldr	r3, [fp, #-12]
    8298:	e50b3008 	str	r3, [fp, #-8]
    829c:	e51b300c 	ldr	r3, [fp, #-12]
    82a0:	e5933068 	ldr	r3, [r3, #104]	; 0x68
    82a4:	e50b300c 	str	r3, [fp, #-12]
    82a8:	e51b300c 	ldr	r3, [fp, #-12]
    82ac:	e3530000 	cmp	r3, #0
    82b0:	0a000005 	beq	82cc <queue+0xb0>
    82b4:	e51b300c 	ldr	r3, [fp, #-12]
    82b8:	e1d325b4 	ldrh	r2, [r3, #84]	; 0x54
    82bc:	e51b3010 	ldr	r3, [fp, #-16]
    82c0:	e1d335b4 	ldrh	r3, [r3, #84]	; 0x54
    82c4:	e1520003 	cmp	r2, r3
    82c8:	9afffff1 	bls	8294 <queue+0x78>
    82cc:	e51b300c 	ldr	r3, [fp, #-12]
    82d0:	e3530000 	cmp	r3, #0
    82d4:	1a000008 	bne	82fc <queue+0xe0>
    82d8:	e30f3efc 	movw	r3, #65276	; 0xfefc
    82dc:	e3403000 	movt	r3, #0
    82e0:	e5933000 	ldr	r3, [r3]
    82e4:	e51b2010 	ldr	r2, [fp, #-16]
    82e8:	e5832068 	str	r2, [r3, #104]	; 0x68
    82ec:	e30f3efc 	movw	r3, #65276	; 0xfefc
    82f0:	e3403000 	movt	r3, #0
    82f4:	e51b2010 	ldr	r2, [fp, #-16]
    82f8:	e5832000 	str	r2, [r3]
    82fc:	e30f3ef8 	movw	r3, #65272	; 0xfef8
    8300:	e3403000 	movt	r3, #0
    8304:	e5933000 	ldr	r3, [r3]
    8308:	e51b200c 	ldr	r2, [fp, #-12]
    830c:	e1520003 	cmp	r2, r3
    8310:	1a000009 	bne	833c <queue+0x120>
    8314:	e30f3ef8 	movw	r3, #65272	; 0xfef8
    8318:	e3403000 	movt	r3, #0
    831c:	e5932000 	ldr	r2, [r3]
    8320:	e51b3010 	ldr	r3, [fp, #-16]
    8324:	e5832068 	str	r2, [r3, #104]	; 0x68
    8328:	e30f3ef8 	movw	r3, #65272	; 0xfef8
    832c:	e3403000 	movt	r3, #0
    8330:	e51b2010 	ldr	r2, [fp, #-16]
    8334:	e5832000 	str	r2, [r3]
    8338:	ea000005 	b	8354 <queue+0x138>
    833c:	e51b3008 	ldr	r3, [fp, #-8]
    8340:	e51b2010 	ldr	r2, [fp, #-16]
    8344:	e5832068 	str	r2, [r3, #104]	; 0x68
    8348:	e51b3010 	ldr	r3, [fp, #-16]
    834c:	e51b200c 	ldr	r2, [fp, #-12]
    8350:	e5832068 	str	r2, [r3, #104]	; 0x68
    8354:	e320f000 	nop	{0}
    8358:	e28bd000 	add	sp, fp, #0
    835c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8360:	e12fff1e 	bx	lr

00008364 <semqueue_by_priority>:
    8364:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8368:	e28db000 	add	fp, sp, #0
    836c:	e24dd01c 	sub	sp, sp, #28
    8370:	e50b0010 	str	r0, [fp, #-16]
    8374:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    8378:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    837c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8380:	e3a02000 	mov	r2, #0
    8384:	e5832070 	str	r2, [r3, #112]	; 0x70
    8388:	e51b3010 	ldr	r3, [fp, #-16]
    838c:	e5933000 	ldr	r3, [r3]
    8390:	e3530000 	cmp	r3, #0
    8394:	1a000007 	bne	83b8 <semqueue_by_priority+0x54>
    8398:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    839c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    83a0:	e5832000 	str	r2, [r3]
    83a4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    83a8:	e5932000 	ldr	r2, [r3]
    83ac:	e51b3010 	ldr	r3, [fp, #-16]
    83b0:	e5832000 	str	r2, [r3]
    83b4:	ea000030 	b	847c <semqueue_by_priority+0x118>
    83b8:	e51b3010 	ldr	r3, [fp, #-16]
    83bc:	e5933000 	ldr	r3, [r3]
    83c0:	e50b300c 	str	r3, [fp, #-12]
    83c4:	e51b300c 	ldr	r3, [fp, #-12]
    83c8:	e50b3008 	str	r3, [fp, #-8]
    83cc:	ea000004 	b	83e4 <semqueue_by_priority+0x80>
    83d0:	e51b300c 	ldr	r3, [fp, #-12]
    83d4:	e50b3008 	str	r3, [fp, #-8]
    83d8:	e51b300c 	ldr	r3, [fp, #-12]
    83dc:	e5933070 	ldr	r3, [r3, #112]	; 0x70
    83e0:	e50b300c 	str	r3, [fp, #-12]
    83e4:	e51b300c 	ldr	r3, [fp, #-12]
    83e8:	e3530000 	cmp	r3, #0
    83ec:	0a000005 	beq	8408 <semqueue_by_priority+0xa4>
    83f0:	e51b300c 	ldr	r3, [fp, #-12]
    83f4:	e1d325b4 	ldrh	r2, [r3, #84]	; 0x54
    83f8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    83fc:	e1d335b4 	ldrh	r3, [r3, #84]	; 0x54
    8400:	e1520003 	cmp	r2, r3
    8404:	9afffff1 	bls	83d0 <semqueue_by_priority+0x6c>
    8408:	e51b300c 	ldr	r3, [fp, #-12]
    840c:	e3530000 	cmp	r3, #0
    8410:	1a000006 	bne	8430 <semqueue_by_priority+0xcc>
    8414:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8418:	e5933000 	ldr	r3, [r3]
    841c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    8420:	e5832070 	str	r2, [r3, #112]	; 0x70
    8424:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8428:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    842c:	e5832000 	str	r2, [r3]
    8430:	e51b3010 	ldr	r3, [fp, #-16]
    8434:	e5933000 	ldr	r3, [r3]
    8438:	e51b200c 	ldr	r2, [fp, #-12]
    843c:	e1520003 	cmp	r2, r3
    8440:	1a000007 	bne	8464 <semqueue_by_priority+0x100>
    8444:	e51b3010 	ldr	r3, [fp, #-16]
    8448:	e5932000 	ldr	r2, [r3]
    844c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8450:	e5832070 	str	r2, [r3, #112]	; 0x70
    8454:	e51b3010 	ldr	r3, [fp, #-16]
    8458:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    845c:	e5832000 	str	r2, [r3]
    8460:	ea000005 	b	847c <semqueue_by_priority+0x118>
    8464:	e51b3008 	ldr	r3, [fp, #-8]
    8468:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    846c:	e5832070 	str	r2, [r3, #112]	; 0x70
    8470:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8474:	e51b200c 	ldr	r2, [fp, #-12]
    8478:	e5832070 	str	r2, [r3, #112]	; 0x70
    847c:	e320f000 	nop	{0}
    8480:	e28bd000 	add	sp, fp, #0
    8484:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8488:	e12fff1e 	bx	lr

0000848c <dispatch>:
    848c:	e92d4800 	push	{fp, lr}
    8490:	e28db004 	add	fp, sp, #4
    8494:	e24dd008 	sub	sp, sp, #8
    8498:	e3a03000 	mov	r3, #0
    849c:	e50b3008 	str	r3, [fp, #-8]
    84a0:	ebffff46 	bl	81c0 <set_disable>
    84a4:	e50b000c 	str	r0, [fp, #-12]
    84a8:	e30f3f2c 	movw	r3, #65324	; 0xff2c
    84ac:	e3403000 	movt	r3, #0
    84b0:	e3a02001 	mov	r2, #1
    84b4:	e5832000 	str	r2, [r3]
    84b8:	e30f3f04 	movw	r3, #65284	; 0xff04
    84bc:	e3403000 	movt	r3, #0
    84c0:	e5933000 	ldr	r3, [r3]
    84c4:	e2033002 	and	r3, r3, #2
    84c8:	e3530000 	cmp	r3, #0
    84cc:	1a000001 	bne	84d8 <dispatch+0x4c>
    84d0:	e3a03001 	mov	r3, #1
    84d4:	e50b3008 	str	r3, [fp, #-8]
    84d8:	e51b000c 	ldr	r0, [fp, #-12]
    84dc:	ebffff41 	bl	81e8 <set_enable>
    84e0:	e51b3008 	ldr	r3, [fp, #-8]
    84e4:	e3530000 	cmp	r3, #0
    84e8:	1a000000 	bne	84f0 <dispatch+0x64>
    84ec:	ef000060 	svc	0x00000060
    84f0:	e320f000 	nop	{0}
    84f4:	e24bd004 	sub	sp, fp, #4
    84f8:	e8bd8800 	pop	{fp, pc}

000084fc <trmrq>:
    84fc:	e92d4800 	push	{fp, lr}
    8500:	e28db004 	add	fp, sp, #4
    8504:	e24dd008 	sub	sp, sp, #8
    8508:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    850c:	e3403000 	movt	r3, #0
    8510:	e5933000 	ldr	r3, [r3]
    8514:	e1d334b4 	ldrh	r3, [r3, #68]	; 0x44
    8518:	e3530000 	cmp	r3, #0
    851c:	0a000017 	beq	8580 <trmrq+0x84>
    8520:	ebffff26 	bl	81c0 <set_disable>
    8524:	e50b0008 	str	r0, [fp, #-8]
    8528:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    852c:	e3403000 	movt	r3, #0
    8530:	e5933000 	ldr	r3, [r3]
    8534:	e3a02005 	mov	r2, #5
    8538:	e1c324b8 	strh	r2, [r3, #72]	; 0x48
    853c:	e51b0008 	ldr	r0, [fp, #-8]
    8540:	ebffff28 	bl	81e8 <set_enable>
    8544:	ea000006 	b	8564 <trmrq+0x68>
    8548:	e30f3f04 	movw	r3, #65284	; 0xff04
    854c:	e3403000 	movt	r3, #0
    8550:	e5933000 	ldr	r3, [r3]
    8554:	e2033002 	and	r3, r3, #2
    8558:	e3530000 	cmp	r3, #0
    855c:	0a000000 	beq	8564 <trmrq+0x68>
    8560:	ef000060 	svc	0x00000060
    8564:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    8568:	e3403000 	movt	r3, #0
    856c:	e5933000 	ldr	r3, [r3]
    8570:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    8574:	e3530005 	cmp	r3, #5
    8578:	0afffff2 	beq	8548 <trmrq+0x4c>
    857c:	ea000000 	b	8584 <trmrq+0x88>
    8580:	e320f000 	nop	{0}
    8584:	e24bd004 	sub	sp, fp, #4
    8588:	e8bd8800 	pop	{fp, pc}

0000858c <gethandler>:
    858c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8590:	e28db000 	add	fp, sp, #0
    8594:	e24dd00c 	sub	sp, sp, #12
    8598:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    859c:	e3403000 	movt	r3, #0
    85a0:	e5933000 	ldr	r3, [r3]
    85a4:	e3530000 	cmp	r3, #0
    85a8:	0a000005 	beq	85c4 <gethandler+0x38>
    85ac:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    85b0:	e3403000 	movt	r3, #0
    85b4:	e5933000 	ldr	r3, [r3]
    85b8:	e1d334b4 	ldrh	r3, [r3, #68]	; 0x44
    85bc:	e50b3008 	str	r3, [fp, #-8]
    85c0:	ea000001 	b	85cc <gethandler+0x40>
    85c4:	e3e03000 	mvn	r3, #0
    85c8:	e50b3008 	str	r3, [fp, #-8]
    85cc:	e51b3008 	ldr	r3, [fp, #-8]
    85d0:	e1a00003 	mov	r0, r3
    85d4:	e28bd000 	add	sp, fp, #0
    85d8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    85dc:	e12fff1e 	bx	lr

000085e0 <create_task>:
    85e0:	e92d4800 	push	{fp, lr}
    85e4:	e28db004 	add	fp, sp, #4
    85e8:	e24dd028 	sub	sp, sp, #40	; 0x28
    85ec:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    85f0:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
    85f4:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
    85f8:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    85fc:	e24dd004 	sub	sp, sp, #4
    8600:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    8604:	e10f0000 	mrs	r0, CPSR
    8608:	e58d0004 	str	r0, [sp, #4]
    860c:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    8610:	e3003334 	movw	r3, #820	; 0x334
    8614:	e3403001 	movt	r3, #1
    8618:	e5933000 	ldr	r3, [r3]
    861c:	e2832001 	add	r2, r3, #1
    8620:	e3003334 	movw	r3, #820	; 0x334
    8624:	e3403001 	movt	r3, #1
    8628:	e5832000 	str	r2, [r3]
    862c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    8630:	e59d0004 	ldr	r0, [sp, #4]
    8634:	e129f000 	msr	CPSR_fc, r0
    8638:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    863c:	e28dd004 	add	sp, sp, #4
    8640:	e3a03000 	mov	r3, #0
    8644:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    8648:	e30f3eb8 	movw	r3, #65208	; 0xfeb8
    864c:	e3403000 	movt	r3, #0
    8650:	e5933000 	ldr	r3, [r3]
    8654:	e35300ff 	cmp	r3, #255	; 0xff
    8658:	1a000012 	bne	86a8 <create_task+0xc8>
    865c:	e24dd004 	sub	sp, sp, #4
    8660:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    8664:	e10f0000 	mrs	r0, CPSR
    8668:	e58d0004 	str	r0, [sp, #4]
    866c:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    8670:	e3003334 	movw	r3, #820	; 0x334
    8674:	e3403001 	movt	r3, #1
    8678:	e5933000 	ldr	r3, [r3]
    867c:	e2432001 	sub	r2, r3, #1
    8680:	e3003334 	movw	r3, #820	; 0x334
    8684:	e3403001 	movt	r3, #1
    8688:	e5832000 	str	r2, [r3]
    868c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    8690:	e59d0004 	ldr	r0, [sp, #4]
    8694:	e129f000 	msr	CPSR_fc, r0
    8698:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    869c:	e28dd004 	add	sp, sp, #4
    86a0:	e3e03001 	mvn	r3, #1
    86a4:	ea0000a4 	b	893c <create_task+0x35c>
    86a8:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    86ac:	e2833044 	add	r3, r3, #68	; 0x44
    86b0:	e1a00003 	mov	r0, r3
    86b4:	eb001c56 	bl	f814 <malloc>
    86b8:	e1a03000 	mov	r3, r0
    86bc:	e50b3010 	str	r3, [fp, #-16]
    86c0:	e51b3010 	ldr	r3, [fp, #-16]
    86c4:	e3530000 	cmp	r3, #0
    86c8:	1a000012 	bne	8718 <create_task+0x138>
    86cc:	e24dd004 	sub	sp, sp, #4
    86d0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    86d4:	e10f0000 	mrs	r0, CPSR
    86d8:	e58d0004 	str	r0, [sp, #4]
    86dc:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    86e0:	e3003334 	movw	r3, #820	; 0x334
    86e4:	e3403001 	movt	r3, #1
    86e8:	e5933000 	ldr	r3, [r3]
    86ec:	e2432001 	sub	r2, r3, #1
    86f0:	e3003334 	movw	r3, #820	; 0x334
    86f4:	e3403001 	movt	r3, #1
    86f8:	e5832000 	str	r2, [r3]
    86fc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    8700:	e59d0004 	ldr	r0, [sp, #4]
    8704:	e129f000 	msr	CPSR_fc, r0
    8708:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    870c:	e28dd004 	add	sp, sp, #4
    8710:	e3e03000 	mvn	r3, #0
    8714:	ea000088 	b	893c <create_task+0x35c>
    8718:	e3a000a4 	mov	r0, #164	; 0xa4
    871c:	eb001c3c 	bl	f814 <malloc>
    8720:	e1a03000 	mov	r3, r0
    8724:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    8728:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    872c:	e3530000 	cmp	r3, #0
    8730:	1a000014 	bne	8788 <create_task+0x1a8>
    8734:	e51b0010 	ldr	r0, [fp, #-16]
    8738:	eb001c81 	bl	f944 <free>
    873c:	e24dd004 	sub	sp, sp, #4
    8740:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    8744:	e10f0000 	mrs	r0, CPSR
    8748:	e58d0004 	str	r0, [sp, #4]
    874c:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    8750:	e3003334 	movw	r3, #820	; 0x334
    8754:	e3403001 	movt	r3, #1
    8758:	e5933000 	ldr	r3, [r3]
    875c:	e2432001 	sub	r2, r3, #1
    8760:	e3003334 	movw	r3, #820	; 0x334
    8764:	e3403001 	movt	r3, #1
    8768:	e5832000 	str	r2, [r3]
    876c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    8770:	e59d0004 	ldr	r0, [sp, #4]
    8774:	e129f000 	msr	CPSR_fc, r0
    8778:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    877c:	e28dd004 	add	sp, sp, #4
    8780:	e3e03000 	mvn	r3, #0
    8784:	ea00006c 	b	893c <create_task+0x35c>
    8788:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    878c:	e51b2010 	ldr	r2, [fp, #-16]
    8790:	e5832060 	str	r2, [r3, #96]	; 0x60
    8794:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8798:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    879c:	e5832058 	str	r2, [r3, #88]	; 0x58
    87a0:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    87a4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    87a8:	e5832064 	str	r2, [r3, #100]	; 0x64
    87ac:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    87b0:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    87b4:	e583205c 	str	r2, [r3, #92]	; 0x5c
    87b8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    87bc:	e3a02005 	mov	r2, #5
    87c0:	e1c324b8 	strh	r2, [r3, #72]	; 0x48
    87c4:	ebfffe7d 	bl	81c0 <set_disable>
    87c8:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    87cc:	e30f3eb8 	movw	r3, #65208	; 0xfeb8
    87d0:	e3403000 	movt	r3, #0
    87d4:	e5933000 	ldr	r3, [r3]
    87d8:	e2832001 	add	r2, r3, #1
    87dc:	e30f3eb8 	movw	r3, #65208	; 0xfeb8
    87e0:	e3403000 	movt	r3, #0
    87e4:	e5832000 	str	r2, [r3]
    87e8:	e3a03000 	mov	r3, #0
    87ec:	e50b300c 	str	r3, [fp, #-12]
    87f0:	e3a03001 	mov	r3, #1
    87f4:	e50b3008 	str	r3, [fp, #-8]
    87f8:	ea00000b 	b	882c <create_task+0x24c>
    87fc:	e30f3f38 	movw	r3, #65336	; 0xff38
    8800:	e3403000 	movt	r3, #0
    8804:	e51b2008 	ldr	r2, [fp, #-8]
    8808:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    880c:	e3530000 	cmp	r3, #0
    8810:	1a000002 	bne	8820 <create_task+0x240>
    8814:	e51b3008 	ldr	r3, [fp, #-8]
    8818:	e50b300c 	str	r3, [fp, #-12]
    881c:	ea000008 	b	8844 <create_task+0x264>
    8820:	e51b3008 	ldr	r3, [fp, #-8]
    8824:	e2833001 	add	r3, r3, #1
    8828:	e50b3008 	str	r3, [fp, #-8]
    882c:	e51b2008 	ldr	r2, [fp, #-8]
    8830:	e30f3f08 	movw	r3, #65288	; 0xff08
    8834:	e3403000 	movt	r3, #0
    8838:	e5933000 	ldr	r3, [r3]
    883c:	e1520003 	cmp	r2, r3
    8840:	3affffed 	bcc	87fc <create_task+0x21c>
    8844:	e51b300c 	ldr	r3, [fp, #-12]
    8848:	e3530000 	cmp	r3, #0
    884c:	1a00000a 	bne	887c <create_task+0x29c>
    8850:	e30f3f08 	movw	r3, #65288	; 0xff08
    8854:	e3403000 	movt	r3, #0
    8858:	e5933000 	ldr	r3, [r3]
    885c:	e2832001 	add	r2, r3, #1
    8860:	e30f3f08 	movw	r3, #65288	; 0xff08
    8864:	e3403000 	movt	r3, #0
    8868:	e5832000 	str	r2, [r3]
    886c:	e30f3f08 	movw	r3, #65288	; 0xff08
    8870:	e3403000 	movt	r3, #0
    8874:	e5933000 	ldr	r3, [r3]
    8878:	e50b300c 	str	r3, [fp, #-12]
    887c:	e51b300c 	ldr	r3, [fp, #-12]
    8880:	e6ff2073 	uxth	r2, r3
    8884:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8888:	e1c324b4 	strh	r2, [r3, #68]	; 0x44
    888c:	e30f3f38 	movw	r3, #65336	; 0xff38
    8890:	e3403000 	movt	r3, #0
    8894:	e51b200c 	ldr	r2, [fp, #-12]
    8898:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
    889c:	e7831102 	str	r1, [r3, r2, lsl #2]
    88a0:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    88a4:	e3530000 	cmp	r3, #0
    88a8:	0a000001 	beq	88b4 <create_task+0x2d4>
    88ac:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
    88b0:	ea000000 	b	88b8 <create_task+0x2d8>
    88b4:	e3e02000 	mvn	r2, #0
    88b8:	e30f3f38 	movw	r3, #65336	; 0xff38
    88bc:	e3403000 	movt	r3, #0
    88c0:	e51b100c 	ldr	r1, [fp, #-12]
    88c4:	e7933101 	ldr	r3, [r3, r1, lsl #2]
    88c8:	e5832050 	str	r2, [r3, #80]	; 0x50
    88cc:	ebffff2e 	bl	858c <gethandler>
    88d0:	e1a01000 	mov	r1, r0
    88d4:	e30f3f38 	movw	r3, #65336	; 0xff38
    88d8:	e3403000 	movt	r3, #0
    88dc:	e51b200c 	ldr	r2, [fp, #-12]
    88e0:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    88e4:	e6ff2071 	uxth	r2, r1
    88e8:	e1c324b6 	strh	r2, [r3, #70]	; 0x46
    88ec:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    88f0:	ebfffe3c 	bl	81e8 <set_enable>
    88f4:	e24dd004 	sub	sp, sp, #4
    88f8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    88fc:	e10f0000 	mrs	r0, CPSR
    8900:	e58d0004 	str	r0, [sp, #4]
    8904:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    8908:	e3003334 	movw	r3, #820	; 0x334
    890c:	e3403001 	movt	r3, #1
    8910:	e5933000 	ldr	r3, [r3]
    8914:	e2432001 	sub	r2, r3, #1
    8918:	e3003334 	movw	r3, #820	; 0x334
    891c:	e3403001 	movt	r3, #1
    8920:	e5832000 	str	r2, [r3]
    8924:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    8928:	e59d0004 	ldr	r0, [sp, #4]
    892c:	e129f000 	msr	CPSR_fc, r0
    8930:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    8934:	e28dd004 	add	sp, sp, #4
    8938:	e51b300c 	ldr	r3, [fp, #-12]
    893c:	e1a00003 	mov	r0, r3
    8940:	e24bd004 	sub	sp, fp, #4
    8944:	e8bd8800 	pop	{fp, pc}

00008948 <__destroy_task>:
    8948:	e92d4800 	push	{fp, lr}
    894c:	e28db004 	add	fp, sp, #4
    8950:	e24dd008 	sub	sp, sp, #8
    8954:	e50b0008 	str	r0, [fp, #-8]
    8958:	e24dd004 	sub	sp, sp, #4
    895c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    8960:	e10f0000 	mrs	r0, CPSR
    8964:	e58d0004 	str	r0, [sp, #4]
    8968:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    896c:	e3003334 	movw	r3, #820	; 0x334
    8970:	e3403001 	movt	r3, #1
    8974:	e5933000 	ldr	r3, [r3]
    8978:	e2832001 	add	r2, r3, #1
    897c:	e3003334 	movw	r3, #820	; 0x334
    8980:	e3403001 	movt	r3, #1
    8984:	e5832000 	str	r2, [r3]
    8988:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    898c:	e59d0004 	ldr	r0, [sp, #4]
    8990:	e129f000 	msr	CPSR_fc, r0
    8994:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    8998:	e28dd004 	add	sp, sp, #4
    899c:	e30f3f38 	movw	r3, #65336	; 0xff38
    89a0:	e3403000 	movt	r3, #0
    89a4:	e51b2008 	ldr	r2, [fp, #-8]
    89a8:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    89ac:	e5933060 	ldr	r3, [r3, #96]	; 0x60
    89b0:	e1a00003 	mov	r0, r3
    89b4:	eb001be2 	bl	f944 <free>
    89b8:	e30f3f38 	movw	r3, #65336	; 0xff38
    89bc:	e3403000 	movt	r3, #0
    89c0:	e51b2008 	ldr	r2, [fp, #-8]
    89c4:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    89c8:	e1a00003 	mov	r0, r3
    89cc:	eb001bdc 	bl	f944 <free>
    89d0:	e30f3f38 	movw	r3, #65336	; 0xff38
    89d4:	e3403000 	movt	r3, #0
    89d8:	e51b2008 	ldr	r2, [fp, #-8]
    89dc:	e3a01000 	mov	r1, #0
    89e0:	e7831102 	str	r1, [r3, r2, lsl #2]
    89e4:	e30f3eb8 	movw	r3, #65208	; 0xfeb8
    89e8:	e3403000 	movt	r3, #0
    89ec:	e5933000 	ldr	r3, [r3]
    89f0:	e2432001 	sub	r2, r3, #1
    89f4:	e30f3eb8 	movw	r3, #65208	; 0xfeb8
    89f8:	e3403000 	movt	r3, #0
    89fc:	e5832000 	str	r2, [r3]
    8a00:	e51b2008 	ldr	r2, [fp, #-8]
    8a04:	e30f3f08 	movw	r3, #65288	; 0xff08
    8a08:	e3403000 	movt	r3, #0
    8a0c:	e5933000 	ldr	r3, [r3]
    8a10:	e1520003 	cmp	r2, r3
    8a14:	1a000016 	bne	8a74 <__destroy_task+0x12c>
    8a18:	ea00000e 	b	8a58 <__destroy_task+0x110>
    8a1c:	e30f3f08 	movw	r3, #65288	; 0xff08
    8a20:	e3403000 	movt	r3, #0
    8a24:	e5932000 	ldr	r2, [r3]
    8a28:	e30f3f38 	movw	r3, #65336	; 0xff38
    8a2c:	e3403000 	movt	r3, #0
    8a30:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    8a34:	e3530000 	cmp	r3, #0
    8a38:	1a00000c 	bne	8a70 <__destroy_task+0x128>
    8a3c:	e30f3f08 	movw	r3, #65288	; 0xff08
    8a40:	e3403000 	movt	r3, #0
    8a44:	e5933000 	ldr	r3, [r3]
    8a48:	e2432001 	sub	r2, r3, #1
    8a4c:	e30f3f08 	movw	r3, #65288	; 0xff08
    8a50:	e3403000 	movt	r3, #0
    8a54:	e5832000 	str	r2, [r3]
    8a58:	e30f3f08 	movw	r3, #65288	; 0xff08
    8a5c:	e3403000 	movt	r3, #0
    8a60:	e5933000 	ldr	r3, [r3]
    8a64:	e3530000 	cmp	r3, #0
    8a68:	1affffeb 	bne	8a1c <__destroy_task+0xd4>
    8a6c:	ea000000 	b	8a74 <__destroy_task+0x12c>
    8a70:	e320f000 	nop	{0}
    8a74:	e24dd004 	sub	sp, sp, #4
    8a78:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    8a7c:	e10f0000 	mrs	r0, CPSR
    8a80:	e58d0004 	str	r0, [sp, #4]
    8a84:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    8a88:	e3003334 	movw	r3, #820	; 0x334
    8a8c:	e3403001 	movt	r3, #1
    8a90:	e5933000 	ldr	r3, [r3]
    8a94:	e2432001 	sub	r2, r3, #1
    8a98:	e3003334 	movw	r3, #820	; 0x334
    8a9c:	e3403001 	movt	r3, #1
    8aa0:	e5832000 	str	r2, [r3]
    8aa4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    8aa8:	e59d0004 	ldr	r0, [sp, #4]
    8aac:	e129f000 	msr	CPSR_fc, r0
    8ab0:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    8ab4:	e28dd004 	add	sp, sp, #4
    8ab8:	e320f000 	nop	{0}
    8abc:	e24bd004 	sub	sp, fp, #4
    8ac0:	e8bd8800 	pop	{fp, pc}

00008ac4 <kill_task>:
    8ac4:	e92d4800 	push	{fp, lr}
    8ac8:	e28db004 	add	fp, sp, #4
    8acc:	e24dd018 	sub	sp, sp, #24
    8ad0:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    8ad4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8ad8:	e3530000 	cmp	r3, #0
    8adc:	da00000b 	ble	8b10 <kill_task+0x4c>
    8ae0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8ae4:	e1a02003 	mov	r2, r3
    8ae8:	e30f3f08 	movw	r3, #65288	; 0xff08
    8aec:	e3403000 	movt	r3, #0
    8af0:	e5933000 	ldr	r3, [r3]
    8af4:	e1520003 	cmp	r2, r3
    8af8:	8a000004 	bhi	8b10 <kill_task+0x4c>
    8afc:	e30f3eb8 	movw	r3, #65208	; 0xfeb8
    8b00:	e3403000 	movt	r3, #0
    8b04:	e5933000 	ldr	r3, [r3]
    8b08:	e3530001 	cmp	r3, #1
    8b0c:	1a000001 	bne	8b18 <kill_task+0x54>
    8b10:	e3e03000 	mvn	r3, #0
    8b14:	ea000034 	b	8bec <kill_task+0x128>
    8b18:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    8b1c:	e30f3f38 	movw	r3, #65336	; 0xff38
    8b20:	e3403000 	movt	r3, #0
    8b24:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    8b28:	e3530000 	cmp	r3, #0
    8b2c:	1a000001 	bne	8b38 <kill_task+0x74>
    8b30:	e3e03001 	mvn	r3, #1
    8b34:	ea00002c 	b	8bec <kill_task+0x128>
    8b38:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    8b3c:	e30f3f38 	movw	r3, #65336	; 0xff38
    8b40:	e3403000 	movt	r3, #0
    8b44:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    8b48:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    8b4c:	e3530005 	cmp	r3, #5
    8b50:	0a000021 	beq	8bdc <kill_task+0x118>
    8b54:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    8b58:	e30f3f38 	movw	r3, #65336	; 0xff38
    8b5c:	e3403000 	movt	r3, #0
    8b60:	e7932102 	ldr	r2, [r3, r2, lsl #2]
    8b64:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    8b68:	e3403000 	movt	r3, #0
    8b6c:	e5933000 	ldr	r3, [r3]
    8b70:	e1520003 	cmp	r2, r3
    8b74:	1a000016 	bne	8bd4 <kill_task+0x110>
    8b78:	e3a03000 	mov	r3, #0
    8b7c:	e50b3008 	str	r3, [fp, #-8]
    8b80:	e3a03001 	mov	r3, #1
    8b84:	e54b3014 	strb	r3, [fp, #-20]	; 0xffffffec
    8b88:	e24b3014 	sub	r3, fp, #20
    8b8c:	e2833001 	add	r3, r3, #1
    8b90:	e3a02004 	mov	r2, #4
    8b94:	e50b2008 	str	r2, [fp, #-8]
    8b98:	e24b1018 	sub	r1, fp, #24
    8b9c:	e3a02004 	mov	r2, #4
    8ba0:	e1a00003 	mov	r0, r3
    8ba4:	eb001ba4 	bl	fa3c <memcp>
    8ba8:	e30f3f18 	movw	r3, #65304	; 0xff18
    8bac:	e3403000 	movt	r3, #0
    8bb0:	e5930000 	ldr	r0, [r3]
    8bb4:	e51b3008 	ldr	r3, [fp, #-8]
    8bb8:	e2833001 	add	r3, r3, #1
    8bbc:	e50b3008 	str	r3, [fp, #-8]
    8bc0:	e24b2014 	sub	r2, fp, #20
    8bc4:	e3a03000 	mov	r3, #0
    8bc8:	e51b1008 	ldr	r1, [fp, #-8]
    8bcc:	eb000cde 	bl	bf4c <send_task_message>
    8bd0:	ebfffe49 	bl	84fc <trmrq>
    8bd4:	e3e03002 	mvn	r3, #2
    8bd8:	ea000003 	b	8bec <kill_task+0x128>
    8bdc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8be0:	e1a00003 	mov	r0, r3
    8be4:	ebffff57 	bl	8948 <__destroy_task>
    8be8:	e3a03000 	mov	r3, #0
    8bec:	e1a00003 	mov	r0, r3
    8bf0:	e24bd004 	sub	sp, fp, #4
    8bf4:	e8bd8800 	pop	{fp, pc}

00008bf8 <IdleTask>:
    8bf8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8bfc:	e28db000 	add	fp, sp, #0
    8c00:	e24dd00c 	sub	sp, sp, #12
    8c04:	e50b0008 	str	r0, [fp, #-8]
    8c08:	eafffffe 	b	8c08 <IdleTask+0x10>

00008c0c <SysMaintenance>:
    8c0c:	e92d4800 	push	{fp, lr}
    8c10:	e28db004 	add	fp, sp, #4
    8c14:	e24dd050 	sub	sp, sp, #80	; 0x50
    8c18:	e50b0050 	str	r0, [fp, #-80]	; 0xffffffb0
    8c1c:	e24b3044 	sub	r3, fp, #68	; 0x44
    8c20:	e1a01003 	mov	r1, r3
    8c24:	e3a00040 	mov	r0, #64	; 0x40
    8c28:	eb000dd5 	bl	c384 <get_task_message>
    8c2c:	e55b3044 	ldrb	r3, [fp, #-68]	; 0xffffffbc
    8c30:	e3530001 	cmp	r3, #1
    8c34:	1afffff8 	bne	8c1c <SysMaintenance+0x10>
    8c38:	e24b3044 	sub	r3, fp, #68	; 0x44
    8c3c:	e2833001 	add	r3, r3, #1
    8c40:	e24b0048 	sub	r0, fp, #72	; 0x48
    8c44:	e3a02004 	mov	r2, #4
    8c48:	e1a01003 	mov	r1, r3
    8c4c:	eb001b7a 	bl	fa3c <memcp>
    8c50:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    8c54:	e1a00003 	mov	r0, r3
    8c58:	ebffff3a 	bl	8948 <__destroy_task>
    8c5c:	e320f000 	nop	{0}
    8c60:	eaffffed 	b	8c1c <SysMaintenance+0x10>

00008c64 <task_runner>:
    8c64:	e92d4800 	push	{fp, lr}
    8c68:	e28db004 	add	fp, sp, #4
    8c6c:	e24dd008 	sub	sp, sp, #8
    8c70:	ebfffd52 	bl	81c0 <set_disable>
    8c74:	e50b0008 	str	r0, [fp, #-8]
    8c78:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    8c7c:	e3403000 	movt	r3, #0
    8c80:	e5933000 	ldr	r3, [r3]
    8c84:	e5933058 	ldr	r3, [r3, #88]	; 0x58
    8c88:	e50b300c 	str	r3, [fp, #-12]
    8c8c:	e51b0008 	ldr	r0, [fp, #-8]
    8c90:	ebfffd54 	bl	81e8 <set_enable>
    8c94:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    8c98:	e3403000 	movt	r3, #0
    8c9c:	e5933000 	ldr	r3, [r3]
    8ca0:	e593205c 	ldr	r2, [r3, #92]	; 0x5c
    8ca4:	e51b300c 	ldr	r3, [fp, #-12]
    8ca8:	e1a00002 	mov	r0, r2
    8cac:	e12fff33 	blx	r3
    8cb0:	ebfffe11 	bl	84fc <trmrq>
    8cb4:	e320f000 	nop	{0}
    8cb8:	e24bd004 	sub	sp, fp, #4
    8cbc:	e8bd8800 	pop	{fp, pc}

00008cc0 <initmt>:
    8cc0:	e92d4800 	push	{fp, lr}
    8cc4:	e28db004 	add	fp, sp, #4
    8cc8:	e24dd010 	sub	sp, sp, #16
    8ccc:	e50b0010 	str	r0, [fp, #-16]
    8cd0:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    8cd4:	e3003348 	movw	r3, #840	; 0x348
    8cd8:	e3403001 	movt	r3, #1
    8cdc:	e5933000 	ldr	r3, [r3]
    8ce0:	e3530000 	cmp	r3, #0
    8ce4:	0a000001 	beq	8cf0 <initmt+0x30>
    8ce8:	e3e03000 	mvn	r3, #0
    8cec:	ea0000f9 	b	90d8 <initmt+0x418>
    8cf0:	e51b2010 	ldr	r2, [fp, #-16]
    8cf4:	e30f3f04 	movw	r3, #65284	; 0xff04
    8cf8:	e3403000 	movt	r3, #0
    8cfc:	e5832000 	str	r2, [r3]
    8d00:	e3a000a4 	mov	r0, #164	; 0xa4
    8d04:	eb001ac2 	bl	f814 <malloc>
    8d08:	e1a03000 	mov	r3, r0
    8d0c:	e50b3008 	str	r3, [fp, #-8]
    8d10:	e51b3008 	ldr	r3, [fp, #-8]
    8d14:	e3530000 	cmp	r3, #0
    8d18:	1a000001 	bne	8d24 <initmt+0x64>
    8d1c:	e3e03000 	mvn	r3, #0
    8d20:	ea0000ec 	b	90d8 <initmt+0x418>
    8d24:	e3e03000 	mvn	r3, #0
    8d28:	e3a02000 	mov	r2, #0
    8d2c:	e3a01ffa 	mov	r1, #1000	; 0x3e8
    8d30:	e3080bf8 	movw	r0, #35832	; 0x8bf8
    8d34:	e3400000 	movt	r0, #0
    8d38:	ebfffe28 	bl	85e0 <create_task>
    8d3c:	e50b000c 	str	r0, [fp, #-12]
    8d40:	e51b300c 	ldr	r3, [fp, #-12]
    8d44:	e3530000 	cmp	r3, #0
    8d48:	aa000003 	bge	8d5c <initmt+0x9c>
    8d4c:	e51b0008 	ldr	r0, [fp, #-8]
    8d50:	eb001afb 	bl	f944 <free>
    8d54:	e3e03000 	mvn	r3, #0
    8d58:	ea0000de 	b	90d8 <initmt+0x418>
    8d5c:	e3e03000 	mvn	r3, #0
    8d60:	e3a02000 	mov	r2, #0
    8d64:	e3a01ffa 	mov	r1, #1000	; 0x3e8
    8d68:	e3080c0c 	movw	r0, #35852	; 0x8c0c
    8d6c:	e3400000 	movt	r0, #0
    8d70:	ebfffe1a 	bl	85e0 <create_task>
    8d74:	e1a02000 	mov	r2, r0
    8d78:	e30f3f18 	movw	r3, #65304	; 0xff18
    8d7c:	e3403000 	movt	r3, #0
    8d80:	e5832000 	str	r2, [r3]
    8d84:	e30f3f18 	movw	r3, #65304	; 0xff18
    8d88:	e3403000 	movt	r3, #0
    8d8c:	e5932000 	ldr	r2, [r3]
    8d90:	e30f3f38 	movw	r3, #65336	; 0xff38
    8d94:	e3403000 	movt	r3, #0
    8d98:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    8d9c:	e3a02000 	mov	r2, #0
    8da0:	e5832074 	str	r2, [r3, #116]	; 0x74
    8da4:	e30f3f18 	movw	r3, #65304	; 0xff18
    8da8:	e3403000 	movt	r3, #0
    8dac:	e5933000 	ldr	r3, [r3]
    8db0:	e3530000 	cmp	r3, #0
    8db4:	aa000005 	bge	8dd0 <initmt+0x110>
    8db8:	e51b000c 	ldr	r0, [fp, #-12]
    8dbc:	ebfffee1 	bl	8948 <__destroy_task>
    8dc0:	e51b0008 	ldr	r0, [fp, #-8]
    8dc4:	eb001ade 	bl	f944 <free>
    8dc8:	e3e03000 	mvn	r3, #0
    8dcc:	ea0000c1 	b	90d8 <initmt+0x418>
    8dd0:	e30f3f18 	movw	r3, #65304	; 0xff18
    8dd4:	e3403000 	movt	r3, #0
    8dd8:	e5933000 	ldr	r3, [r3]
    8ddc:	e3a02040 	mov	r2, #64	; 0x40
    8de0:	e3a01010 	mov	r1, #16
    8de4:	e1a00003 	mov	r0, r3
    8de8:	eb000ae8 	bl	b990 <create_task_mbox>
    8dec:	e1a03000 	mov	r3, r0
    8df0:	e3530000 	cmp	r3, #0
    8df4:	0a00000a 	beq	8e24 <initmt+0x164>
    8df8:	e30f3f18 	movw	r3, #65304	; 0xff18
    8dfc:	e3403000 	movt	r3, #0
    8e00:	e5933000 	ldr	r3, [r3]
    8e04:	e1a00003 	mov	r0, r3
    8e08:	ebfffece 	bl	8948 <__destroy_task>
    8e0c:	e51b000c 	ldr	r0, [fp, #-12]
    8e10:	ebfffecc 	bl	8948 <__destroy_task>
    8e14:	e51b0008 	ldr	r0, [fp, #-8]
    8e18:	eb001ac9 	bl	f944 <free>
    8e1c:	e3e03000 	mvn	r3, #0
    8e20:	ea0000ac 	b	90d8 <initmt+0x418>
    8e24:	e51b3008 	ldr	r3, [fp, #-8]
    8e28:	e3a02ffa 	mov	r2, #1000	; 0x3e8
    8e2c:	e1c325b4 	strh	r2, [r3, #84]	; 0x54
    8e30:	e51b3008 	ldr	r3, [fp, #-8]
    8e34:	e3a02002 	mov	r2, #2
    8e38:	e1c324b8 	strh	r2, [r3, #72]	; 0x48
    8e3c:	e51b3008 	ldr	r3, [fp, #-8]
    8e40:	e3e02000 	mvn	r2, #0
    8e44:	e5832050 	str	r2, [r3, #80]	; 0x50
    8e48:	e51b3008 	ldr	r3, [fp, #-8]
    8e4c:	e3a02000 	mov	r2, #0
    8e50:	e1c324b4 	strh	r2, [r3, #68]	; 0x44
    8e54:	e30f3f38 	movw	r3, #65336	; 0xff38
    8e58:	e3403000 	movt	r3, #0
    8e5c:	e51b2008 	ldr	r2, [fp, #-8]
    8e60:	e5832000 	str	r2, [r3]
    8e64:	e30f3ef8 	movw	r3, #65272	; 0xfef8
    8e68:	e3403000 	movt	r3, #0
    8e6c:	e3a02000 	mov	r2, #0
    8e70:	e5832000 	str	r2, [r3]
    8e74:	e30f3efc 	movw	r3, #65276	; 0xfefc
    8e78:	e3403000 	movt	r3, #0
    8e7c:	e3a02000 	mov	r2, #0
    8e80:	e5832000 	str	r2, [r3]
    8e84:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    8e88:	e3403000 	movt	r3, #0
    8e8c:	e51b2008 	ldr	r2, [fp, #-8]
    8e90:	e5832000 	str	r2, [r3]
    8e94:	e3a00060 	mov	r0, #96	; 0x60
    8e98:	eb0019dc 	bl	f610 <getvect>
    8e9c:	e1a02000 	mov	r2, r0
    8ea0:	e30f3ee4 	movw	r3, #65252	; 0xfee4
    8ea4:	e3403000 	movt	r3, #0
    8ea8:	e5832000 	str	r2, [r3]
    8eac:	e30a1630 	movw	r1, #42544	; 0xa630
    8eb0:	e3401000 	movt	r1, #0
    8eb4:	e3a00060 	mov	r0, #96	; 0x60
    8eb8:	eb0019af 	bl	f57c <setvect>
    8ebc:	e51b3010 	ldr	r3, [fp, #-16]
    8ec0:	e2033001 	and	r3, r3, #1
    8ec4:	e3530000 	cmp	r3, #0
    8ec8:	0a00000d 	beq	8f04 <initmt+0x244>
    8ecc:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    8ed0:	e30f3f14 	movw	r3, #65300	; 0xff14
    8ed4:	e3403000 	movt	r3, #0
    8ed8:	e5832000 	str	r2, [r3]
    8edc:	e3a00070 	mov	r0, #112	; 0x70
    8ee0:	eb0019ca 	bl	f610 <getvect>
    8ee4:	e1a02000 	mov	r2, r0
    8ee8:	e30f3ee8 	movw	r3, #65256	; 0xfee8
    8eec:	e3403000 	movt	r3, #0
    8ef0:	e5832000 	str	r2, [r3]
    8ef4:	e30b175c 	movw	r1, #46940	; 0xb75c
    8ef8:	e3401000 	movt	r1, #0
    8efc:	e3a00070 	mov	r0, #112	; 0x70
    8f00:	eb00199d 	bl	f57c <setvect>
    8f04:	e30f3f38 	movw	r3, #65336	; 0xff38
    8f08:	e3403000 	movt	r3, #0
    8f0c:	e51b200c 	ldr	r2, [fp, #-12]
    8f10:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    8f14:	e3a02001 	mov	r2, #1
    8f18:	e1c324b8 	strh	r2, [r3, #72]	; 0x48
    8f1c:	e30f3f38 	movw	r3, #65336	; 0xff38
    8f20:	e3403000 	movt	r3, #0
    8f24:	e51b200c 	ldr	r2, [fp, #-12]
    8f28:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    8f2c:	e30023e9 	movw	r2, #1001	; 0x3e9
    8f30:	e1c325b4 	strh	r2, [r3, #84]	; 0x54
    8f34:	e30f3f38 	movw	r3, #65336	; 0xff38
    8f38:	e3403000 	movt	r3, #0
    8f3c:	e51b200c 	ldr	r2, [fp, #-12]
    8f40:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    8f44:	e3a0205f 	mov	r2, #95	; 0x5f
    8f48:	e5832040 	str	r2, [r3, #64]	; 0x40
    8f4c:	e30f3f38 	movw	r3, #65336	; 0xff38
    8f50:	e3403000 	movt	r3, #0
    8f54:	e51b200c 	ldr	r2, [fp, #-12]
    8f58:	e7932102 	ldr	r2, [r3, r2, lsl #2]
    8f5c:	e3083c64 	movw	r3, #35940	; 0x8c64
    8f60:	e3403000 	movt	r3, #0
    8f64:	e582303c 	str	r3, [r2, #60]	; 0x3c
    8f68:	e30f3f38 	movw	r3, #65336	; 0xff38
    8f6c:	e3403000 	movt	r3, #0
    8f70:	e51b200c 	ldr	r2, [fp, #-12]
    8f74:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    8f78:	e5933060 	ldr	r3, [r3, #96]	; 0x60
    8f7c:	e1a00003 	mov	r0, r3
    8f80:	e30f3f38 	movw	r3, #65336	; 0xff38
    8f84:	e3403000 	movt	r3, #0
    8f88:	e51b200c 	ldr	r2, [fp, #-12]
    8f8c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    8f90:	e5932064 	ldr	r2, [r3, #100]	; 0x64
    8f94:	e30f3f38 	movw	r3, #65336	; 0xff38
    8f98:	e3403000 	movt	r3, #0
    8f9c:	e51b100c 	ldr	r1, [fp, #-12]
    8fa0:	e7933101 	ldr	r3, [r3, r1, lsl #2]
    8fa4:	e0802002 	add	r2, r0, r2
    8fa8:	e5832000 	str	r2, [r3]
    8fac:	e30f3f38 	movw	r3, #65336	; 0xff38
    8fb0:	e3403000 	movt	r3, #0
    8fb4:	e51b200c 	ldr	r2, [fp, #-12]
    8fb8:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    8fbc:	e1a00003 	mov	r0, r3
    8fc0:	ebfffc95 	bl	821c <queue>
    8fc4:	e30f3f18 	movw	r3, #65304	; 0xff18
    8fc8:	e3403000 	movt	r3, #0
    8fcc:	e5932000 	ldr	r2, [r3]
    8fd0:	e30f3f38 	movw	r3, #65336	; 0xff38
    8fd4:	e3403000 	movt	r3, #0
    8fd8:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    8fdc:	e3a02002 	mov	r2, #2
    8fe0:	e1c324b8 	strh	r2, [r3, #72]	; 0x48
    8fe4:	e30f3f18 	movw	r3, #65304	; 0xff18
    8fe8:	e3403000 	movt	r3, #0
    8fec:	e5932000 	ldr	r2, [r3]
    8ff0:	e30f3f38 	movw	r3, #65336	; 0xff38
    8ff4:	e3403000 	movt	r3, #0
    8ff8:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    8ffc:	e3a02000 	mov	r2, #0
    9000:	e1c325b4 	strh	r2, [r3, #84]	; 0x54
    9004:	e30f3f18 	movw	r3, #65304	; 0xff18
    9008:	e3403000 	movt	r3, #0
    900c:	e5932000 	ldr	r2, [r3]
    9010:	e30f3f38 	movw	r3, #65336	; 0xff38
    9014:	e3403000 	movt	r3, #0
    9018:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    901c:	e3a0205f 	mov	r2, #95	; 0x5f
    9020:	e5832040 	str	r2, [r3, #64]	; 0x40
    9024:	e30f3f18 	movw	r3, #65304	; 0xff18
    9028:	e3403000 	movt	r3, #0
    902c:	e5932000 	ldr	r2, [r3]
    9030:	e30f3f38 	movw	r3, #65336	; 0xff38
    9034:	e3403000 	movt	r3, #0
    9038:	e7932102 	ldr	r2, [r3, r2, lsl #2]
    903c:	e3083c64 	movw	r3, #35940	; 0x8c64
    9040:	e3403000 	movt	r3, #0
    9044:	e582303c 	str	r3, [r2, #60]	; 0x3c
    9048:	e30f3f18 	movw	r3, #65304	; 0xff18
    904c:	e3403000 	movt	r3, #0
    9050:	e5932000 	ldr	r2, [r3]
    9054:	e30f3f38 	movw	r3, #65336	; 0xff38
    9058:	e3403000 	movt	r3, #0
    905c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    9060:	e5933060 	ldr	r3, [r3, #96]	; 0x60
    9064:	e1a00003 	mov	r0, r3
    9068:	e30f3f18 	movw	r3, #65304	; 0xff18
    906c:	e3403000 	movt	r3, #0
    9070:	e5932000 	ldr	r2, [r3]
    9074:	e30f3f38 	movw	r3, #65336	; 0xff38
    9078:	e3403000 	movt	r3, #0
    907c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    9080:	e5932064 	ldr	r2, [r3, #100]	; 0x64
    9084:	e30f3f18 	movw	r3, #65304	; 0xff18
    9088:	e3403000 	movt	r3, #0
    908c:	e5931000 	ldr	r1, [r3]
    9090:	e30f3f38 	movw	r3, #65336	; 0xff38
    9094:	e3403000 	movt	r3, #0
    9098:	e7933101 	ldr	r3, [r3, r1, lsl #2]
    909c:	e0802002 	add	r2, r0, r2
    90a0:	e5832000 	str	r2, [r3]
    90a4:	e30f3f18 	movw	r3, #65304	; 0xff18
    90a8:	e3403000 	movt	r3, #0
    90ac:	e5932000 	ldr	r2, [r3]
    90b0:	e30f3f38 	movw	r3, #65336	; 0xff38
    90b4:	e3403000 	movt	r3, #0
    90b8:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    90bc:	e1a00003 	mov	r0, r3
    90c0:	ebfffc55 	bl	821c <queue>
    90c4:	e3003348 	movw	r3, #840	; 0x348
    90c8:	e3403001 	movt	r3, #1
    90cc:	e3a02001 	mov	r2, #1
    90d0:	e5832000 	str	r2, [r3]
    90d4:	e3a03000 	mov	r3, #0
    90d8:	e1a00003 	mov	r0, r3
    90dc:	e24bd004 	sub	sp, fp, #4
    90e0:	e8bd8800 	pop	{fp, pc}

000090e4 <abortmt>:
    90e4:	e92d4800 	push	{fp, lr}
    90e8:	e28db004 	add	fp, sp, #4
    90ec:	e24dd008 	sub	sp, sp, #8
    90f0:	e3003348 	movw	r3, #840	; 0x348
    90f4:	e3403001 	movt	r3, #1
    90f8:	e5933000 	ldr	r3, [r3]
    90fc:	e3530000 	cmp	r3, #0
    9100:	0a00001a 	beq	9170 <abortmt+0x8c>
    9104:	ebfffc2d 	bl	81c0 <set_disable>
    9108:	e50b0008 	str	r0, [fp, #-8]
    910c:	e30f3ee4 	movw	r3, #65252	; 0xfee4
    9110:	e3403000 	movt	r3, #0
    9114:	e5933000 	ldr	r3, [r3]
    9118:	e1a01003 	mov	r1, r3
    911c:	e3a00060 	mov	r0, #96	; 0x60
    9120:	eb001915 	bl	f57c <setvect>
    9124:	e30f3f04 	movw	r3, #65284	; 0xff04
    9128:	e3403000 	movt	r3, #0
    912c:	e5933000 	ldr	r3, [r3]
    9130:	e2033001 	and	r3, r3, #1
    9134:	e3530000 	cmp	r3, #0
    9138:	0a000005 	beq	9154 <abortmt+0x70>
    913c:	e30f3ee8 	movw	r3, #65256	; 0xfee8
    9140:	e3403000 	movt	r3, #0
    9144:	e5933000 	ldr	r3, [r3]
    9148:	e1a01003 	mov	r1, r3
    914c:	e3a00070 	mov	r0, #112	; 0x70
    9150:	eb001909 	bl	f57c <setvect>
    9154:	e3003348 	movw	r3, #840	; 0x348
    9158:	e3403001 	movt	r3, #1
    915c:	e3a02000 	mov	r2, #0
    9160:	e5832000 	str	r2, [r3]
    9164:	e51b0008 	ldr	r0, [fp, #-8]
    9168:	ebfffc1e 	bl	81e8 <set_enable>
    916c:	ea000000 	b	9174 <abortmt+0x90>
    9170:	e320f000 	nop	{0}
    9174:	e24bd004 	sub	sp, fp, #4
    9178:	e8bd8800 	pop	{fp, pc}

0000917c <exitmt>:
    917c:	e92d4800 	push	{fp, lr}
    9180:	e28db004 	add	fp, sp, #4
    9184:	e24dd008 	sub	sp, sp, #8
    9188:	ebffffd5 	bl	90e4 <abortmt>
    918c:	e3003348 	movw	r3, #840	; 0x348
    9190:	e3403001 	movt	r3, #1
    9194:	e5933000 	ldr	r3, [r3]
    9198:	e3530000 	cmp	r3, #0
    919c:	0a00002b 	beq	9250 <exitmt+0xd4>
    91a0:	e3a03001 	mov	r3, #1
    91a4:	e50b3008 	str	r3, [fp, #-8]
    91a8:	ea000010 	b	91f0 <exitmt+0x74>
    91ac:	e30f3f38 	movw	r3, #65336	; 0xff38
    91b0:	e3403000 	movt	r3, #0
    91b4:	e51b2008 	ldr	r2, [fp, #-8]
    91b8:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    91bc:	e3530000 	cmp	r3, #0
    91c0:	0a000007 	beq	91e4 <exitmt+0x68>
    91c4:	e30f3f38 	movw	r3, #65336	; 0xff38
    91c8:	e3403000 	movt	r3, #0
    91cc:	e51b2008 	ldr	r2, [fp, #-8]
    91d0:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    91d4:	e3a02005 	mov	r2, #5
    91d8:	e1c324b8 	strh	r2, [r3, #72]	; 0x48
    91dc:	e51b0008 	ldr	r0, [fp, #-8]
    91e0:	ebfffe37 	bl	8ac4 <kill_task>
    91e4:	e51b3008 	ldr	r3, [fp, #-8]
    91e8:	e2833001 	add	r3, r3, #1
    91ec:	e50b3008 	str	r3, [fp, #-8]
    91f0:	e51b2008 	ldr	r2, [fp, #-8]
    91f4:	e30f3f08 	movw	r3, #65288	; 0xff08
    91f8:	e3403000 	movt	r3, #0
    91fc:	e5933000 	ldr	r3, [r3]
    9200:	e1520003 	cmp	r2, r3
    9204:	9affffe8 	bls	91ac <exitmt+0x30>
    9208:	e30f3f38 	movw	r3, #65336	; 0xff38
    920c:	e3403000 	movt	r3, #0
    9210:	e5933000 	ldr	r3, [r3]
    9214:	e1a00003 	mov	r0, r3
    9218:	eb0019c9 	bl	f944 <free>
    921c:	e30f3f38 	movw	r3, #65336	; 0xff38
    9220:	e3403000 	movt	r3, #0
    9224:	e3a02000 	mov	r2, #0
    9228:	e5832000 	str	r2, [r3]
    922c:	e30f3eb8 	movw	r3, #65208	; 0xfeb8
    9230:	e3403000 	movt	r3, #0
    9234:	e3a02001 	mov	r2, #1
    9238:	e5832000 	str	r2, [r3]
    923c:	e30f3f08 	movw	r3, #65288	; 0xff08
    9240:	e3403000 	movt	r3, #0
    9244:	e3a02000 	mov	r2, #0
    9248:	e5832000 	str	r2, [r3]
    924c:	ea000000 	b	9254 <exitmt+0xd8>
    9250:	e320f000 	nop	{0}
    9254:	e24bd004 	sub	sp, fp, #4
    9258:	e8bd8800 	pop	{fp, pc}

0000925c <sptsk>:
    925c:	e92d4800 	push	{fp, lr}
    9260:	e28db004 	add	fp, sp, #4
    9264:	e24dd010 	sub	sp, sp, #16
    9268:	e50b0010 	str	r0, [fp, #-16]
    926c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    9270:	e51b3010 	ldr	r3, [fp, #-16]
    9274:	e3530000 	cmp	r3, #0
    9278:	da00000a 	ble	92a8 <sptsk+0x4c>
    927c:	e51b2010 	ldr	r2, [fp, #-16]
    9280:	e30f3f08 	movw	r3, #65288	; 0xff08
    9284:	e3403000 	movt	r3, #0
    9288:	e5933000 	ldr	r3, [r3]
    928c:	e1520003 	cmp	r2, r3
    9290:	8a000004 	bhi	92a8 <sptsk+0x4c>
    9294:	e30f3eb8 	movw	r3, #65208	; 0xfeb8
    9298:	e3403000 	movt	r3, #0
    929c:	e5933000 	ldr	r3, [r3]
    92a0:	e3530001 	cmp	r3, #1
    92a4:	1a000001 	bne	92b0 <sptsk+0x54>
    92a8:	e3a03001 	mov	r3, #1
    92ac:	ea00004f 	b	93f0 <sptsk+0x194>
    92b0:	e30f3f38 	movw	r3, #65336	; 0xff38
    92b4:	e3403000 	movt	r3, #0
    92b8:	e51b2010 	ldr	r2, [fp, #-16]
    92bc:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    92c0:	e3530000 	cmp	r3, #0
    92c4:	1a000001 	bne	92d0 <sptsk+0x74>
    92c8:	e3a03002 	mov	r3, #2
    92cc:	ea000047 	b	93f0 <sptsk+0x194>
    92d0:	e30f3f38 	movw	r3, #65336	; 0xff38
    92d4:	e3403000 	movt	r3, #0
    92d8:	e51b2010 	ldr	r2, [fp, #-16]
    92dc:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    92e0:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    92e4:	e3530005 	cmp	r3, #5
    92e8:	0a000001 	beq	92f4 <sptsk+0x98>
    92ec:	e3a03003 	mov	r3, #3
    92f0:	ea00003e 	b	93f0 <sptsk+0x194>
    92f4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    92f8:	e3530000 	cmp	r3, #0
    92fc:	da000002 	ble	930c <sptsk+0xb0>
    9300:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9304:	e3530ffa 	cmp	r3, #1000	; 0x3e8
    9308:	da000001 	ble	9314 <sptsk+0xb8>
    930c:	e3a03004 	mov	r3, #4
    9310:	ea000036 	b	93f0 <sptsk+0x194>
    9314:	e30f3f38 	movw	r3, #65336	; 0xff38
    9318:	e3403000 	movt	r3, #0
    931c:	e51b2010 	ldr	r2, [fp, #-16]
    9320:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    9324:	e3a02002 	mov	r2, #2
    9328:	e1c324b8 	strh	r2, [r3, #72]	; 0x48
    932c:	e30f3f38 	movw	r3, #65336	; 0xff38
    9330:	e3403000 	movt	r3, #0
    9334:	e51b2010 	ldr	r2, [fp, #-16]
    9338:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    933c:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    9340:	e6ff2072 	uxth	r2, r2
    9344:	e1c325b4 	strh	r2, [r3, #84]	; 0x54
    9348:	e30f3f38 	movw	r3, #65336	; 0xff38
    934c:	e3403000 	movt	r3, #0
    9350:	e51b2010 	ldr	r2, [fp, #-16]
    9354:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    9358:	e3a0205f 	mov	r2, #95	; 0x5f
    935c:	e5832040 	str	r2, [r3, #64]	; 0x40
    9360:	e30f3f38 	movw	r3, #65336	; 0xff38
    9364:	e3403000 	movt	r3, #0
    9368:	e51b2010 	ldr	r2, [fp, #-16]
    936c:	e7932102 	ldr	r2, [r3, r2, lsl #2]
    9370:	e3083c64 	movw	r3, #35940	; 0x8c64
    9374:	e3403000 	movt	r3, #0
    9378:	e582303c 	str	r3, [r2, #60]	; 0x3c
    937c:	e30f3f38 	movw	r3, #65336	; 0xff38
    9380:	e3403000 	movt	r3, #0
    9384:	e51b2010 	ldr	r2, [fp, #-16]
    9388:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    938c:	e5933060 	ldr	r3, [r3, #96]	; 0x60
    9390:	e1a00003 	mov	r0, r3
    9394:	e30f3f38 	movw	r3, #65336	; 0xff38
    9398:	e3403000 	movt	r3, #0
    939c:	e51b2010 	ldr	r2, [fp, #-16]
    93a0:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    93a4:	e5932064 	ldr	r2, [r3, #100]	; 0x64
    93a8:	e30f3f38 	movw	r3, #65336	; 0xff38
    93ac:	e3403000 	movt	r3, #0
    93b0:	e51b1010 	ldr	r1, [fp, #-16]
    93b4:	e7933101 	ldr	r3, [r3, r1, lsl #2]
    93b8:	e0802002 	add	r2, r0, r2
    93bc:	e5832000 	str	r2, [r3]
    93c0:	ebfffb7e 	bl	81c0 <set_disable>
    93c4:	e50b0008 	str	r0, [fp, #-8]
    93c8:	e30f3f38 	movw	r3, #65336	; 0xff38
    93cc:	e3403000 	movt	r3, #0
    93d0:	e51b2010 	ldr	r2, [fp, #-16]
    93d4:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    93d8:	e1a00003 	mov	r0, r3
    93dc:	ebfffb8e 	bl	821c <queue>
    93e0:	e51b0008 	ldr	r0, [fp, #-8]
    93e4:	ebfffb7f 	bl	81e8 <set_enable>
    93e8:	ebfffc27 	bl	848c <dispatch>
    93ec:	e3a03000 	mov	r3, #0
    93f0:	e1a00003 	mov	r0, r3
    93f4:	e24bd004 	sub	sp, fp, #4
    93f8:	e8bd8800 	pop	{fp, pc}

000093fc <conttsk>:
    93fc:	e92d4800 	push	{fp, lr}
    9400:	e28db004 	add	fp, sp, #4
    9404:	e24dd010 	sub	sp, sp, #16
    9408:	e50b0010 	str	r0, [fp, #-16]
    940c:	e51b3010 	ldr	r3, [fp, #-16]
    9410:	e3530000 	cmp	r3, #0
    9414:	da00000a 	ble	9444 <conttsk+0x48>
    9418:	e51b2010 	ldr	r2, [fp, #-16]
    941c:	e30f3f08 	movw	r3, #65288	; 0xff08
    9420:	e3403000 	movt	r3, #0
    9424:	e5933000 	ldr	r3, [r3]
    9428:	e1520003 	cmp	r2, r3
    942c:	8a000004 	bhi	9444 <conttsk+0x48>
    9430:	e30f3eb8 	movw	r3, #65208	; 0xfeb8
    9434:	e3403000 	movt	r3, #0
    9438:	e5933000 	ldr	r3, [r3]
    943c:	e3530001 	cmp	r3, #1
    9440:	1a000001 	bne	944c <conttsk+0x50>
    9444:	e3a03001 	mov	r3, #1
    9448:	ea000022 	b	94d8 <conttsk+0xdc>
    944c:	e30f3f38 	movw	r3, #65336	; 0xff38
    9450:	e3403000 	movt	r3, #0
    9454:	e51b2010 	ldr	r2, [fp, #-16]
    9458:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    945c:	e3530000 	cmp	r3, #0
    9460:	1a000001 	bne	946c <conttsk+0x70>
    9464:	e3a03002 	mov	r3, #2
    9468:	ea00001a 	b	94d8 <conttsk+0xdc>
    946c:	e30f3f38 	movw	r3, #65336	; 0xff38
    9470:	e3403000 	movt	r3, #0
    9474:	e51b2010 	ldr	r2, [fp, #-16]
    9478:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    947c:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    9480:	e3530005 	cmp	r3, #5
    9484:	0a000001 	beq	9490 <conttsk+0x94>
    9488:	e3a03003 	mov	r3, #3
    948c:	ea000011 	b	94d8 <conttsk+0xdc>
    9490:	e30f3f38 	movw	r3, #65336	; 0xff38
    9494:	e3403000 	movt	r3, #0
    9498:	e51b2010 	ldr	r2, [fp, #-16]
    949c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    94a0:	e3a02002 	mov	r2, #2
    94a4:	e1c324b8 	strh	r2, [r3, #72]	; 0x48
    94a8:	ebfffb44 	bl	81c0 <set_disable>
    94ac:	e50b0008 	str	r0, [fp, #-8]
    94b0:	e30f3f38 	movw	r3, #65336	; 0xff38
    94b4:	e3403000 	movt	r3, #0
    94b8:	e51b2010 	ldr	r2, [fp, #-16]
    94bc:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    94c0:	e1a00003 	mov	r0, r3
    94c4:	ebfffb54 	bl	821c <queue>
    94c8:	e51b0008 	ldr	r0, [fp, #-8]
    94cc:	ebfffb45 	bl	81e8 <set_enable>
    94d0:	ebfffbed 	bl	848c <dispatch>
    94d4:	e3a03000 	mov	r3, #0
    94d8:	e1a00003 	mov	r0, r3
    94dc:	e24bd004 	sub	sp, fp, #4
    94e0:	e8bd8800 	pop	{fp, pc}

000094e4 <getparams>:
    94e4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    94e8:	e28db000 	add	fp, sp, #0
    94ec:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    94f0:	e3403000 	movt	r3, #0
    94f4:	e5933000 	ldr	r3, [r3]
    94f8:	e3530000 	cmp	r3, #0
    94fc:	0a000004 	beq	9514 <getparams+0x30>
    9500:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    9504:	e3403000 	movt	r3, #0
    9508:	e5933000 	ldr	r3, [r3]
    950c:	e593305c 	ldr	r3, [r3, #92]	; 0x5c
    9510:	ea000000 	b	9518 <getparams+0x34>
    9514:	e3a03000 	mov	r3, #0
    9518:	e1a00003 	mov	r0, r3
    951c:	e28bd000 	add	sp, fp, #0
    9520:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    9524:	e12fff1e 	bx	lr

00009528 <dfsm>:
    9528:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    952c:	e28db000 	add	fp, sp, #0
    9530:	e24dd00c 	sub	sp, sp, #12
    9534:	e50b0008 	str	r0, [fp, #-8]
    9538:	e50b100c 	str	r1, [fp, #-12]
    953c:	e51b3008 	ldr	r3, [fp, #-8]
    9540:	e51b200c 	ldr	r2, [fp, #-12]
    9544:	e5832000 	str	r2, [r3]
    9548:	e51b3008 	ldr	r3, [fp, #-8]
    954c:	e3a02000 	mov	r2, #0
    9550:	e5832008 	str	r2, [r3, #8]
    9554:	e51b3008 	ldr	r3, [fp, #-8]
    9558:	e5932008 	ldr	r2, [r3, #8]
    955c:	e51b3008 	ldr	r3, [fp, #-8]
    9560:	e5832004 	str	r2, [r3, #4]
    9564:	e320f000 	nop	{0}
    9568:	e28bd000 	add	sp, fp, #0
    956c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    9570:	e12fff1e 	bx	lr

00009574 <rsvsm>:
    9574:	e92d4800 	push	{fp, lr}
    9578:	e28db004 	add	fp, sp, #4
    957c:	e24dd018 	sub	sp, sp, #24
    9580:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    9584:	e3a03000 	mov	r3, #0
    9588:	e50b3008 	str	r3, [fp, #-8]
    958c:	ebfffb0b 	bl	81c0 <set_disable>
    9590:	e50b000c 	str	r0, [fp, #-12]
    9594:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9598:	e5933000 	ldr	r3, [r3]
    959c:	e2432001 	sub	r2, r3, #1
    95a0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    95a4:	e5832000 	str	r2, [r3]
    95a8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    95ac:	e5933000 	ldr	r3, [r3]
    95b0:	e3530000 	cmp	r3, #0
    95b4:	aa000036 	bge	9694 <rsvsm+0x120>
    95b8:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    95bc:	e3403000 	movt	r3, #0
    95c0:	e5933000 	ldr	r3, [r3]
    95c4:	e50b3010 	str	r3, [fp, #-16]
    95c8:	e51b3010 	ldr	r3, [fp, #-16]
    95cc:	e3a02000 	mov	r2, #0
    95d0:	e5832070 	str	r2, [r3, #112]	; 0x70
    95d4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    95d8:	e5933004 	ldr	r3, [r3, #4]
    95dc:	e3530000 	cmp	r3, #0
    95e0:	1a000007 	bne	9604 <rsvsm+0x90>
    95e4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    95e8:	e51b2010 	ldr	r2, [fp, #-16]
    95ec:	e5832008 	str	r2, [r3, #8]
    95f0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    95f4:	e5932008 	ldr	r2, [r3, #8]
    95f8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    95fc:	e5832004 	str	r2, [r3, #4]
    9600:	ea000006 	b	9620 <rsvsm+0xac>
    9604:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9608:	e5933008 	ldr	r3, [r3, #8]
    960c:	e51b2010 	ldr	r2, [fp, #-16]
    9610:	e5832070 	str	r2, [r3, #112]	; 0x70
    9614:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9618:	e51b2010 	ldr	r2, [fp, #-16]
    961c:	e5832008 	str	r2, [r3, #8]
    9620:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    9624:	e3403000 	movt	r3, #0
    9628:	e5933000 	ldr	r3, [r3]
    962c:	e3a02000 	mov	r2, #0
    9630:	e1c324ba 	strh	r2, [r3, #74]	; 0x4a
    9634:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    9638:	e3403000 	movt	r3, #0
    963c:	e5933000 	ldr	r3, [r3]
    9640:	e3a02003 	mov	r2, #3
    9644:	e1c324b8 	strh	r2, [r3, #72]	; 0x48
    9648:	e51b000c 	ldr	r0, [fp, #-12]
    964c:	ebfffae5 	bl	81e8 <set_enable>
    9650:	ea000006 	b	9670 <rsvsm+0xfc>
    9654:	e30f3f04 	movw	r3, #65284	; 0xff04
    9658:	e3403000 	movt	r3, #0
    965c:	e5933000 	ldr	r3, [r3]
    9660:	e2033002 	and	r3, r3, #2
    9664:	e3530000 	cmp	r3, #0
    9668:	0a000000 	beq	9670 <rsvsm+0xfc>
    966c:	ef000060 	svc	0x00000060
    9670:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    9674:	e3403000 	movt	r3, #0
    9678:	e5933000 	ldr	r3, [r3]
    967c:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    9680:	e3530003 	cmp	r3, #3
    9684:	0afffff2 	beq	9654 <rsvsm+0xe0>
    9688:	ebfffacc 	bl	81c0 <set_disable>
    968c:	e3a03001 	mov	r3, #1
    9690:	e50b3008 	str	r3, [fp, #-8]
    9694:	e51b000c 	ldr	r0, [fp, #-12]
    9698:	ebfffad2 	bl	81e8 <set_enable>
    969c:	e51b3008 	ldr	r3, [fp, #-8]
    96a0:	e1a00003 	mov	r0, r3
    96a4:	e24bd004 	sub	sp, fp, #4
    96a8:	e8bd8800 	pop	{fp, pc}

000096ac <tryrsvsm>:
    96ac:	e92d4800 	push	{fp, lr}
    96b0:	e28db004 	add	fp, sp, #4
    96b4:	e24dd010 	sub	sp, sp, #16
    96b8:	e50b0010 	str	r0, [fp, #-16]
    96bc:	e3a03000 	mov	r3, #0
    96c0:	e50b3008 	str	r3, [fp, #-8]
    96c4:	ebfffabd 	bl	81c0 <set_disable>
    96c8:	e50b000c 	str	r0, [fp, #-12]
    96cc:	e51b3010 	ldr	r3, [fp, #-16]
    96d0:	e5933000 	ldr	r3, [r3]
    96d4:	e3530000 	cmp	r3, #0
    96d8:	da000006 	ble	96f8 <tryrsvsm+0x4c>
    96dc:	e51b3010 	ldr	r3, [fp, #-16]
    96e0:	e5933000 	ldr	r3, [r3]
    96e4:	e2432001 	sub	r2, r3, #1
    96e8:	e51b3010 	ldr	r3, [fp, #-16]
    96ec:	e5832000 	str	r2, [r3]
    96f0:	e3a03001 	mov	r3, #1
    96f4:	e50b3008 	str	r3, [fp, #-8]
    96f8:	e51b000c 	ldr	r0, [fp, #-12]
    96fc:	ebfffab9 	bl	81e8 <set_enable>
    9700:	e51b3008 	ldr	r3, [fp, #-8]
    9704:	e1a00003 	mov	r0, r3
    9708:	e24bd004 	sub	sp, fp, #4
    970c:	e8bd8800 	pop	{fp, pc}

00009710 <rlsm>:
    9710:	e92d4800 	push	{fp, lr}
    9714:	e28db004 	add	fp, sp, #4
    9718:	e24dd018 	sub	sp, sp, #24
    971c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    9720:	e3a03000 	mov	r3, #0
    9724:	e50b3008 	str	r3, [fp, #-8]
    9728:	ebfffaa4 	bl	81c0 <set_disable>
    972c:	e50b000c 	str	r0, [fp, #-12]
    9730:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9734:	e5933000 	ldr	r3, [r3]
    9738:	e2832001 	add	r2, r3, #1
    973c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9740:	e5832000 	str	r2, [r3]
    9744:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9748:	e5933000 	ldr	r3, [r3]
    974c:	e3530000 	cmp	r3, #0
    9750:	ca000036 	bgt	9830 <rlsm+0x120>
    9754:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9758:	e5933004 	ldr	r3, [r3, #4]
    975c:	e3530000 	cmp	r3, #0
    9760:	0a000032 	beq	9830 <rlsm+0x120>
    9764:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9768:	e5933004 	ldr	r3, [r3, #4]
    976c:	e50b3010 	str	r3, [fp, #-16]
    9770:	e51b3010 	ldr	r3, [fp, #-16]
    9774:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    9778:	e3530004 	cmp	r3, #4
    977c:	1a000005 	bne	9798 <rlsm+0x88>
    9780:	e51b3010 	ldr	r3, [fp, #-16]
    9784:	e3a02002 	mov	r2, #2
    9788:	e1c324b8 	strh	r2, [r3, #72]	; 0x48
    978c:	e51b0010 	ldr	r0, [fp, #-16]
    9790:	ebfffaa1 	bl	821c <queue>
    9794:	ea000006 	b	97b4 <rlsm+0xa4>
    9798:	e51b3010 	ldr	r3, [fp, #-16]
    979c:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    97a0:	e3530003 	cmp	r3, #3
    97a4:	1a000002 	bne	97b4 <rlsm+0xa4>
    97a8:	e51b3010 	ldr	r3, [fp, #-16]
    97ac:	e3a02002 	mov	r2, #2
    97b0:	e1c324b8 	strh	r2, [r3, #72]	; 0x48
    97b4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    97b8:	e5932004 	ldr	r2, [r3, #4]
    97bc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    97c0:	e5933008 	ldr	r3, [r3, #8]
    97c4:	e1520003 	cmp	r2, r3
    97c8:	1a000007 	bne	97ec <rlsm+0xdc>
    97cc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    97d0:	e3a02000 	mov	r2, #0
    97d4:	e5832008 	str	r2, [r3, #8]
    97d8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    97dc:	e5932008 	ldr	r2, [r3, #8]
    97e0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    97e4:	e5832004 	str	r2, [r3, #4]
    97e8:	ea000004 	b	9800 <rlsm+0xf0>
    97ec:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    97f0:	e5933004 	ldr	r3, [r3, #4]
    97f4:	e5932070 	ldr	r2, [r3, #112]	; 0x70
    97f8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    97fc:	e5832004 	str	r2, [r3, #4]
    9800:	e30f3f04 	movw	r3, #65284	; 0xff04
    9804:	e3403000 	movt	r3, #0
    9808:	e5933000 	ldr	r3, [r3]
    980c:	e2033002 	and	r3, r3, #2
    9810:	e3530000 	cmp	r3, #0
    9814:	0a000003 	beq	9828 <rlsm+0x118>
    9818:	e51b000c 	ldr	r0, [fp, #-12]
    981c:	ebfffa71 	bl	81e8 <set_enable>
    9820:	ebfffb19 	bl	848c <dispatch>
    9824:	f10c0080 	cpsid	i
    9828:	e3a03001 	mov	r3, #1
    982c:	e50b3008 	str	r3, [fp, #-8]
    9830:	e51b000c 	ldr	r0, [fp, #-12]
    9834:	ebfffa6b 	bl	81e8 <set_enable>
    9838:	e51b3008 	ldr	r3, [fp, #-8]
    983c:	e1a00003 	mov	r0, r3
    9840:	e24bd004 	sub	sp, fp, #4
    9844:	e8bd8800 	pop	{fp, pc}

00009848 <rlsm_count>:
    9848:	e92d4800 	push	{fp, lr}
    984c:	e28db004 	add	fp, sp, #4
    9850:	e24dd018 	sub	sp, sp, #24
    9854:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    9858:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    985c:	e3a03000 	mov	r3, #0
    9860:	e50b300c 	str	r3, [fp, #-12]
    9864:	e3a03000 	mov	r3, #0
    9868:	e50b3008 	str	r3, [fp, #-8]
    986c:	ea000046 	b	998c <rlsm_count+0x144>
    9870:	ebfffa52 	bl	81c0 <set_disable>
    9874:	e50b0010 	str	r0, [fp, #-16]
    9878:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    987c:	e5933000 	ldr	r3, [r3]
    9880:	e2832001 	add	r2, r3, #1
    9884:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9888:	e5832000 	str	r2, [r3]
    988c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9890:	e5933000 	ldr	r3, [r3]
    9894:	e3530000 	cmp	r3, #0
    9898:	ca000036 	bgt	9978 <rlsm_count+0x130>
    989c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    98a0:	e5933004 	ldr	r3, [r3, #4]
    98a4:	e3530000 	cmp	r3, #0
    98a8:	0a000032 	beq	9978 <rlsm_count+0x130>
    98ac:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    98b0:	e5933004 	ldr	r3, [r3, #4]
    98b4:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    98b8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    98bc:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    98c0:	e3530004 	cmp	r3, #4
    98c4:	1a000005 	bne	98e0 <rlsm_count+0x98>
    98c8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    98cc:	e3a02002 	mov	r2, #2
    98d0:	e1c324b8 	strh	r2, [r3, #72]	; 0x48
    98d4:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    98d8:	ebfffa4f 	bl	821c <queue>
    98dc:	ea000006 	b	98fc <rlsm_count+0xb4>
    98e0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    98e4:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    98e8:	e3530003 	cmp	r3, #3
    98ec:	1a000002 	bne	98fc <rlsm_count+0xb4>
    98f0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    98f4:	e3a02002 	mov	r2, #2
    98f8:	e1c324b8 	strh	r2, [r3, #72]	; 0x48
    98fc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9900:	e5932004 	ldr	r2, [r3, #4]
    9904:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9908:	e5933008 	ldr	r3, [r3, #8]
    990c:	e1520003 	cmp	r2, r3
    9910:	1a000007 	bne	9934 <rlsm_count+0xec>
    9914:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9918:	e3a02000 	mov	r2, #0
    991c:	e5832008 	str	r2, [r3, #8]
    9920:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9924:	e5932008 	ldr	r2, [r3, #8]
    9928:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    992c:	e5832004 	str	r2, [r3, #4]
    9930:	ea000004 	b	9948 <rlsm_count+0x100>
    9934:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9938:	e5933004 	ldr	r3, [r3, #4]
    993c:	e5932070 	ldr	r2, [r3, #112]	; 0x70
    9940:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9944:	e5832004 	str	r2, [r3, #4]
    9948:	e30f3f04 	movw	r3, #65284	; 0xff04
    994c:	e3403000 	movt	r3, #0
    9950:	e5933000 	ldr	r3, [r3]
    9954:	e2033002 	and	r3, r3, #2
    9958:	e3530000 	cmp	r3, #0
    995c:	0a000003 	beq	9970 <rlsm_count+0x128>
    9960:	e51b0010 	ldr	r0, [fp, #-16]
    9964:	ebfffa1f 	bl	81e8 <set_enable>
    9968:	ebfffac7 	bl	848c <dispatch>
    996c:	f10c0080 	cpsid	i
    9970:	e3a03001 	mov	r3, #1
    9974:	e50b300c 	str	r3, [fp, #-12]
    9978:	e51b0010 	ldr	r0, [fp, #-16]
    997c:	ebfffa19 	bl	81e8 <set_enable>
    9980:	e51b3008 	ldr	r3, [fp, #-8]
    9984:	e2833001 	add	r3, r3, #1
    9988:	e50b3008 	str	r3, [fp, #-8]
    998c:	e51b2008 	ldr	r2, [fp, #-8]
    9990:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    9994:	e1520003 	cmp	r2, r3
    9998:	baffffb4 	blt	9870 <rlsm_count+0x28>
    999c:	e51b300c 	ldr	r3, [fp, #-12]
    99a0:	e1a00003 	mov	r0, r3
    99a4:	e24bd004 	sub	sp, fp, #4
    99a8:	e8bd8800 	pop	{fp, pc}

000099ac <init_critsec>:
    99ac:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    99b0:	e28db000 	add	fp, sp, #0
    99b4:	e24dd00c 	sub	sp, sp, #12
    99b8:	e50b0008 	str	r0, [fp, #-8]
    99bc:	e51b3008 	ldr	r3, [fp, #-8]
    99c0:	e3a02001 	mov	r2, #1
    99c4:	e5832000 	str	r2, [r3]
    99c8:	e51b3008 	ldr	r3, [fp, #-8]
    99cc:	e3a02000 	mov	r2, #0
    99d0:	e5832008 	str	r2, [r3, #8]
    99d4:	e51b3008 	ldr	r3, [fp, #-8]
    99d8:	e5932008 	ldr	r2, [r3, #8]
    99dc:	e51b3008 	ldr	r3, [fp, #-8]
    99e0:	e5832004 	str	r2, [r3, #4]
    99e4:	e320f000 	nop	{0}
    99e8:	e28bd000 	add	sp, fp, #0
    99ec:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    99f0:	e12fff1e 	bx	lr

000099f4 <enter_critsec>:
    99f4:	e92d4800 	push	{fp, lr}
    99f8:	e28db004 	add	fp, sp, #4
    99fc:	e24dd008 	sub	sp, sp, #8
    9a00:	e50b0008 	str	r0, [fp, #-8]
    9a04:	e51b0008 	ldr	r0, [fp, #-8]
    9a08:	ebfffed9 	bl	9574 <rsvsm>
    9a0c:	e1a03000 	mov	r3, r0
    9a10:	e1a00003 	mov	r0, r3
    9a14:	e24bd004 	sub	sp, fp, #4
    9a18:	e8bd8800 	pop	{fp, pc}

00009a1c <try_critsec>:
    9a1c:	e92d4800 	push	{fp, lr}
    9a20:	e28db004 	add	fp, sp, #4
    9a24:	e24dd010 	sub	sp, sp, #16
    9a28:	e50b0010 	str	r0, [fp, #-16]
    9a2c:	e3a03000 	mov	r3, #0
    9a30:	e50b3008 	str	r3, [fp, #-8]
    9a34:	ebfff9e1 	bl	81c0 <set_disable>
    9a38:	e50b000c 	str	r0, [fp, #-12]
    9a3c:	e51b3010 	ldr	r3, [fp, #-16]
    9a40:	e5933000 	ldr	r3, [r3]
    9a44:	e3530000 	cmp	r3, #0
    9a48:	ca000001 	bgt	9a54 <try_critsec+0x38>
    9a4c:	e3a03001 	mov	r3, #1
    9a50:	e50b3008 	str	r3, [fp, #-8]
    9a54:	e51b000c 	ldr	r0, [fp, #-12]
    9a58:	ebfff9e2 	bl	81e8 <set_enable>
    9a5c:	e51b3008 	ldr	r3, [fp, #-8]
    9a60:	e1a00003 	mov	r0, r3
    9a64:	e24bd004 	sub	sp, fp, #4
    9a68:	e8bd8800 	pop	{fp, pc}

00009a6c <leave_critsec>:
    9a6c:	e92d4800 	push	{fp, lr}
    9a70:	e28db004 	add	fp, sp, #4
    9a74:	e24dd018 	sub	sp, sp, #24
    9a78:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    9a7c:	e3a03000 	mov	r3, #0
    9a80:	e50b3008 	str	r3, [fp, #-8]
    9a84:	ebfff9cd 	bl	81c0 <set_disable>
    9a88:	e50b000c 	str	r0, [fp, #-12]
    9a8c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9a90:	e5933000 	ldr	r3, [r3]
    9a94:	e3530000 	cmp	r3, #0
    9a98:	ca000041 	bgt	9ba4 <leave_critsec+0x138>
    9a9c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9aa0:	e5933000 	ldr	r3, [r3]
    9aa4:	e2832001 	add	r2, r3, #1
    9aa8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9aac:	e5832000 	str	r2, [r3]
    9ab0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9ab4:	e5933000 	ldr	r3, [r3]
    9ab8:	e3530000 	cmp	r3, #0
    9abc:	ca000036 	bgt	9b9c <leave_critsec+0x130>
    9ac0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9ac4:	e5933004 	ldr	r3, [r3, #4]
    9ac8:	e3530000 	cmp	r3, #0
    9acc:	0a000032 	beq	9b9c <leave_critsec+0x130>
    9ad0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9ad4:	e5933004 	ldr	r3, [r3, #4]
    9ad8:	e50b3010 	str	r3, [fp, #-16]
    9adc:	e51b3010 	ldr	r3, [fp, #-16]
    9ae0:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    9ae4:	e3530004 	cmp	r3, #4
    9ae8:	1a000005 	bne	9b04 <leave_critsec+0x98>
    9aec:	e51b3010 	ldr	r3, [fp, #-16]
    9af0:	e3a02002 	mov	r2, #2
    9af4:	e1c324b8 	strh	r2, [r3, #72]	; 0x48
    9af8:	e51b0010 	ldr	r0, [fp, #-16]
    9afc:	ebfff9c6 	bl	821c <queue>
    9b00:	ea000006 	b	9b20 <leave_critsec+0xb4>
    9b04:	e51b3010 	ldr	r3, [fp, #-16]
    9b08:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    9b0c:	e3530003 	cmp	r3, #3
    9b10:	1a000002 	bne	9b20 <leave_critsec+0xb4>
    9b14:	e51b3010 	ldr	r3, [fp, #-16]
    9b18:	e3a02002 	mov	r2, #2
    9b1c:	e1c324b8 	strh	r2, [r3, #72]	; 0x48
    9b20:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9b24:	e5932004 	ldr	r2, [r3, #4]
    9b28:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9b2c:	e5933008 	ldr	r3, [r3, #8]
    9b30:	e1520003 	cmp	r2, r3
    9b34:	1a000007 	bne	9b58 <leave_critsec+0xec>
    9b38:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9b3c:	e3a02000 	mov	r2, #0
    9b40:	e5832008 	str	r2, [r3, #8]
    9b44:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9b48:	e5932008 	ldr	r2, [r3, #8]
    9b4c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9b50:	e5832004 	str	r2, [r3, #4]
    9b54:	ea000004 	b	9b6c <leave_critsec+0x100>
    9b58:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9b5c:	e5933004 	ldr	r3, [r3, #4]
    9b60:	e5932070 	ldr	r2, [r3, #112]	; 0x70
    9b64:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9b68:	e5832004 	str	r2, [r3, #4]
    9b6c:	e30f3f04 	movw	r3, #65284	; 0xff04
    9b70:	e3403000 	movt	r3, #0
    9b74:	e5933000 	ldr	r3, [r3]
    9b78:	e2033002 	and	r3, r3, #2
    9b7c:	e3530000 	cmp	r3, #0
    9b80:	0a000003 	beq	9b94 <leave_critsec+0x128>
    9b84:	e51b000c 	ldr	r0, [fp, #-12]
    9b88:	ebfff996 	bl	81e8 <set_enable>
    9b8c:	ebfffa3e 	bl	848c <dispatch>
    9b90:	f10c0080 	cpsid	i
    9b94:	e3a03001 	mov	r3, #1
    9b98:	e50b3008 	str	r3, [fp, #-8]
    9b9c:	e51b000c 	ldr	r0, [fp, #-12]
    9ba0:	ebfff990 	bl	81e8 <set_enable>
    9ba4:	e51b000c 	ldr	r0, [fp, #-12]
    9ba8:	ebfff98e 	bl	81e8 <set_enable>
    9bac:	e51b3008 	ldr	r3, [fp, #-8]
    9bb0:	e1a00003 	mov	r0, r3
    9bb4:	e24bd004 	sub	sp, fp, #4
    9bb8:	e8bd8800 	pop	{fp, pc}

00009bbc <suspend>:
    9bbc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    9bc0:	e28db000 	add	fp, sp, #0
    9bc4:	e30f3f04 	movw	r3, #65284	; 0xff04
    9bc8:	e3403000 	movt	r3, #0
    9bcc:	e5933000 	ldr	r3, [r3]
    9bd0:	e2033001 	and	r3, r3, #1
    9bd4:	e3530000 	cmp	r3, #0
    9bd8:	1a000001 	bne	9be4 <suspend+0x28>
    9bdc:	e3e03000 	mvn	r3, #0
    9be0:	ea00003a 	b	9cd0 <suspend+0x114>
    9be4:	e24dd004 	sub	sp, sp, #4
    9be8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    9bec:	e10f0000 	mrs	r0, CPSR
    9bf0:	e58d0004 	str	r0, [sp, #4]
    9bf4:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    9bf8:	e3003334 	movw	r3, #820	; 0x334
    9bfc:	e3403001 	movt	r3, #1
    9c00:	e5933000 	ldr	r3, [r3]
    9c04:	e2832001 	add	r2, r3, #1
    9c08:	e3003334 	movw	r3, #820	; 0x334
    9c0c:	e3403001 	movt	r3, #1
    9c10:	e5832000 	str	r2, [r3]
    9c14:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    9c18:	e59d0004 	ldr	r0, [sp, #4]
    9c1c:	e129f000 	msr	CPSR_fc, r0
    9c20:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    9c24:	e28dd004 	add	sp, sp, #4
    9c28:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    9c2c:	e3403000 	movt	r3, #0
    9c30:	e5933000 	ldr	r3, [r3]
    9c34:	e3a02002 	mov	r2, #2
    9c38:	e1c324ba 	strh	r2, [r3, #74]	; 0x4a
    9c3c:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    9c40:	e3403000 	movt	r3, #0
    9c44:	e5933000 	ldr	r3, [r3]
    9c48:	e3a02003 	mov	r2, #3
    9c4c:	e1c324b8 	strh	r2, [r3, #72]	; 0x48
    9c50:	e24dd004 	sub	sp, sp, #4
    9c54:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    9c58:	e10f0000 	mrs	r0, CPSR
    9c5c:	e58d0004 	str	r0, [sp, #4]
    9c60:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    9c64:	e3003334 	movw	r3, #820	; 0x334
    9c68:	e3403001 	movt	r3, #1
    9c6c:	e5933000 	ldr	r3, [r3]
    9c70:	e2432001 	sub	r2, r3, #1
    9c74:	e3003334 	movw	r3, #820	; 0x334
    9c78:	e3403001 	movt	r3, #1
    9c7c:	e5832000 	str	r2, [r3]
    9c80:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    9c84:	e59d0004 	ldr	r0, [sp, #4]
    9c88:	e129f000 	msr	CPSR_fc, r0
    9c8c:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    9c90:	e28dd004 	add	sp, sp, #4
    9c94:	ea000006 	b	9cb4 <suspend+0xf8>
    9c98:	e30f3f04 	movw	r3, #65284	; 0xff04
    9c9c:	e3403000 	movt	r3, #0
    9ca0:	e5933000 	ldr	r3, [r3]
    9ca4:	e2033002 	and	r3, r3, #2
    9ca8:	e3530000 	cmp	r3, #0
    9cac:	0a000000 	beq	9cb4 <suspend+0xf8>
    9cb0:	ef000060 	svc	0x00000060
    9cb4:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    9cb8:	e3403000 	movt	r3, #0
    9cbc:	e5933000 	ldr	r3, [r3]
    9cc0:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    9cc4:	e3530003 	cmp	r3, #3
    9cc8:	0afffff2 	beq	9c98 <suspend+0xdc>
    9ccc:	e3a03000 	mov	r3, #0
    9cd0:	e1a00003 	mov	r0, r3
    9cd4:	e28bd000 	add	sp, fp, #0
    9cd8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    9cdc:	e12fff1e 	bx	lr

00009ce0 <delay_task>:
    9ce0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    9ce4:	e28db000 	add	fp, sp, #0
    9ce8:	e24dd01c 	sub	sp, sp, #28
    9cec:	e14b01fc 	strd	r0, [fp, #-28]	; 0xffffffe4
    9cf0:	e30f3f04 	movw	r3, #65284	; 0xff04
    9cf4:	e3403000 	movt	r3, #0
    9cf8:	e5933000 	ldr	r3, [r3]
    9cfc:	e2033001 	and	r3, r3, #1
    9d00:	e3530000 	cmp	r3, #0
    9d04:	1a000001 	bne	9d10 <delay_task+0x30>
    9d08:	e3e03000 	mvn	r3, #0
    9d0c:	ea0000b8 	b	9ff4 <delay_task+0x314>
    9d10:	ed5b0b07 	vldr	d16, [fp, #-28]	; 0xffffffe4
    9d14:	eef50bc0 	vcmpe.f64	d16, #0.0
    9d18:	eef1fa10 	vmrs	APSR_nzcv, fpscr
    9d1c:	5a000001 	bpl	9d28 <delay_task+0x48>
    9d20:	e3e03000 	mvn	r3, #0
    9d24:	ea0000b2 	b	9ff4 <delay_task+0x314>
    9d28:	e24dd004 	sub	sp, sp, #4
    9d2c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    9d30:	e10f0000 	mrs	r0, CPSR
    9d34:	e58d0004 	str	r0, [sp, #4]
    9d38:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    9d3c:	e3003334 	movw	r3, #820	; 0x334
    9d40:	e3403001 	movt	r3, #1
    9d44:	e5933000 	ldr	r3, [r3]
    9d48:	e2832001 	add	r2, r3, #1
    9d4c:	e3003334 	movw	r3, #820	; 0x334
    9d50:	e3403001 	movt	r3, #1
    9d54:	e5832000 	str	r2, [r3]
    9d58:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    9d5c:	e59d0004 	ldr	r0, [sp, #4]
    9d60:	e129f000 	msr	CPSR_fc, r0
    9d64:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    9d68:	e28dd004 	add	sp, sp, #4
    9d6c:	e3a03000 	mov	r3, #0
    9d70:	e50b3008 	str	r3, [fp, #-8]
    9d74:	e51b3008 	ldr	r3, [fp, #-8]
    9d78:	e3530000 	cmp	r3, #0
    9d7c:	0a000001 	beq	9d88 <delay_task+0xa8>
    9d80:	e51b3008 	ldr	r3, [fp, #-8]
    9d84:	ea000000 	b	9d8c <delay_task+0xac>
    9d88:	e3a03001 	mov	r3, #1
    9d8c:	e50b3008 	str	r3, [fp, #-8]
    9d90:	ed5b0b07 	vldr	d16, [fp, #-28]	; 0xffffffe4
    9d94:	eef50b40 	vcmp.f64	d16, #0.0
    9d98:	eef1fa10 	vmrs	APSR_nzcv, fpscr
    9d9c:	0a00006a 	beq	9f4c <delay_task+0x26c>
    9da0:	e30f3f0c 	movw	r3, #65292	; 0xff0c
    9da4:	e3403000 	movt	r3, #0
    9da8:	e5933000 	ldr	r3, [r3]
    9dac:	e2832001 	add	r2, r3, #1
    9db0:	e30f3f0c 	movw	r3, #65292	; 0xff0c
    9db4:	e3403000 	movt	r3, #0
    9db8:	e5832000 	str	r2, [r3]
    9dbc:	e30f3f00 	movw	r3, #65280	; 0xff00
    9dc0:	e3403000 	movt	r3, #0
    9dc4:	e5933000 	ldr	r3, [r3]
    9dc8:	e3530000 	cmp	r3, #0
    9dcc:	0a000041 	beq	9ed8 <delay_task+0x1f8>
    9dd0:	e30f3f00 	movw	r3, #65280	; 0xff00
    9dd4:	e3403000 	movt	r3, #0
    9dd8:	e5933000 	ldr	r3, [r3]
    9ddc:	e50b3010 	str	r3, [fp, #-16]
    9de0:	e51b3010 	ldr	r3, [fp, #-16]
    9de4:	e50b300c 	str	r3, [fp, #-12]
    9de8:	ea000009 	b	9e14 <delay_task+0x134>
    9dec:	e51b3010 	ldr	r3, [fp, #-16]
    9df0:	e50b300c 	str	r3, [fp, #-12]
    9df4:	e51b3010 	ldr	r3, [fp, #-16]
    9df8:	e593306c 	ldr	r3, [r3, #108]	; 0x6c
    9dfc:	e50b3010 	str	r3, [fp, #-16]
    9e00:	e51b300c 	ldr	r3, [fp, #-12]
    9e04:	e593304c 	ldr	r3, [r3, #76]	; 0x4c
    9e08:	e51b2008 	ldr	r2, [fp, #-8]
    9e0c:	e0423003 	sub	r3, r2, r3
    9e10:	e50b3008 	str	r3, [fp, #-8]
    9e14:	e51b3010 	ldr	r3, [fp, #-16]
    9e18:	e3530000 	cmp	r3, #0
    9e1c:	0a000004 	beq	9e34 <delay_task+0x154>
    9e20:	e51b3010 	ldr	r3, [fp, #-16]
    9e24:	e593304c 	ldr	r3, [r3, #76]	; 0x4c
    9e28:	e51b2008 	ldr	r2, [fp, #-8]
    9e2c:	e1520003 	cmp	r2, r3
    9e30:	2affffed 	bcs	9dec <delay_task+0x10c>
    9e34:	e30f3f00 	movw	r3, #65280	; 0xff00
    9e38:	e3403000 	movt	r3, #0
    9e3c:	e5933000 	ldr	r3, [r3]
    9e40:	e51b2010 	ldr	r2, [fp, #-16]
    9e44:	e1520003 	cmp	r2, r3
    9e48:	1a000006 	bne	9e68 <delay_task+0x188>
    9e4c:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    9e50:	e3403000 	movt	r3, #0
    9e54:	e5932000 	ldr	r2, [r3]
    9e58:	e30f3f00 	movw	r3, #65280	; 0xff00
    9e5c:	e3403000 	movt	r3, #0
    9e60:	e5832000 	str	r2, [r3]
    9e64:	ea000004 	b	9e7c <delay_task+0x19c>
    9e68:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    9e6c:	e3403000 	movt	r3, #0
    9e70:	e5932000 	ldr	r2, [r3]
    9e74:	e51b300c 	ldr	r3, [fp, #-12]
    9e78:	e583206c 	str	r2, [r3, #108]	; 0x6c
    9e7c:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    9e80:	e3403000 	movt	r3, #0
    9e84:	e5933000 	ldr	r3, [r3]
    9e88:	e51b2008 	ldr	r2, [fp, #-8]
    9e8c:	e583204c 	str	r2, [r3, #76]	; 0x4c
    9e90:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    9e94:	e3403000 	movt	r3, #0
    9e98:	e5933000 	ldr	r3, [r3]
    9e9c:	e51b2010 	ldr	r2, [fp, #-16]
    9ea0:	e583206c 	str	r2, [r3, #108]	; 0x6c
    9ea4:	e51b3010 	ldr	r3, [fp, #-16]
    9ea8:	e3530000 	cmp	r3, #0
    9eac:	0a000019 	beq	9f18 <delay_task+0x238>
    9eb0:	e51b3008 	ldr	r3, [fp, #-8]
    9eb4:	e3530000 	cmp	r3, #0
    9eb8:	0a000016 	beq	9f18 <delay_task+0x238>
    9ebc:	e51b3010 	ldr	r3, [fp, #-16]
    9ec0:	e593204c 	ldr	r2, [r3, #76]	; 0x4c
    9ec4:	e51b3008 	ldr	r3, [fp, #-8]
    9ec8:	e0422003 	sub	r2, r2, r3
    9ecc:	e51b3010 	ldr	r3, [fp, #-16]
    9ed0:	e583204c 	str	r2, [r3, #76]	; 0x4c
    9ed4:	ea00000f 	b	9f18 <delay_task+0x238>
    9ed8:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    9edc:	e3403000 	movt	r3, #0
    9ee0:	e5932000 	ldr	r2, [r3]
    9ee4:	e30f3f00 	movw	r3, #65280	; 0xff00
    9ee8:	e3403000 	movt	r3, #0
    9eec:	e5832000 	str	r2, [r3]
    9ef0:	e30f3f00 	movw	r3, #65280	; 0xff00
    9ef4:	e3403000 	movt	r3, #0
    9ef8:	e5933000 	ldr	r3, [r3]
    9efc:	e3a02000 	mov	r2, #0
    9f00:	e583206c 	str	r2, [r3, #108]	; 0x6c
    9f04:	e30f3f00 	movw	r3, #65280	; 0xff00
    9f08:	e3403000 	movt	r3, #0
    9f0c:	e5933000 	ldr	r3, [r3]
    9f10:	e51b2008 	ldr	r2, [fp, #-8]
    9f14:	e583204c 	str	r2, [r3, #76]	; 0x4c
    9f18:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    9f1c:	e3403000 	movt	r3, #0
    9f20:	e5933000 	ldr	r3, [r3]
    9f24:	e3a02003 	mov	r2, #3
    9f28:	e1c324ba 	strh	r2, [r3, #74]	; 0x4a
    9f2c:	e30f3f0c 	movw	r3, #65292	; 0xff0c
    9f30:	e3403000 	movt	r3, #0
    9f34:	e5933000 	ldr	r3, [r3]
    9f38:	e2432001 	sub	r2, r3, #1
    9f3c:	e30f3f0c 	movw	r3, #65292	; 0xff0c
    9f40:	e3403000 	movt	r3, #0
    9f44:	e5832000 	str	r2, [r3]
    9f48:	ea000004 	b	9f60 <delay_task+0x280>
    9f4c:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    9f50:	e3403000 	movt	r3, #0
    9f54:	e5933000 	ldr	r3, [r3]
    9f58:	e3a02002 	mov	r2, #2
    9f5c:	e1c324ba 	strh	r2, [r3, #74]	; 0x4a
    9f60:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    9f64:	e3403000 	movt	r3, #0
    9f68:	e5933000 	ldr	r3, [r3]
    9f6c:	e3a02003 	mov	r2, #3
    9f70:	e1c324b8 	strh	r2, [r3, #72]	; 0x48
    9f74:	e24dd004 	sub	sp, sp, #4
    9f78:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    9f7c:	e10f0000 	mrs	r0, CPSR
    9f80:	e58d0004 	str	r0, [sp, #4]
    9f84:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    9f88:	e3003334 	movw	r3, #820	; 0x334
    9f8c:	e3403001 	movt	r3, #1
    9f90:	e5933000 	ldr	r3, [r3]
    9f94:	e2432001 	sub	r2, r3, #1
    9f98:	e3003334 	movw	r3, #820	; 0x334
    9f9c:	e3403001 	movt	r3, #1
    9fa0:	e5832000 	str	r2, [r3]
    9fa4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    9fa8:	e59d0004 	ldr	r0, [sp, #4]
    9fac:	e129f000 	msr	CPSR_fc, r0
    9fb0:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    9fb4:	e28dd004 	add	sp, sp, #4
    9fb8:	ea000006 	b	9fd8 <delay_task+0x2f8>
    9fbc:	e30f3f04 	movw	r3, #65284	; 0xff04
    9fc0:	e3403000 	movt	r3, #0
    9fc4:	e5933000 	ldr	r3, [r3]
    9fc8:	e2033002 	and	r3, r3, #2
    9fcc:	e3530000 	cmp	r3, #0
    9fd0:	0a000000 	beq	9fd8 <delay_task+0x2f8>
    9fd4:	ef000060 	svc	0x00000060
    9fd8:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    9fdc:	e3403000 	movt	r3, #0
    9fe0:	e5933000 	ldr	r3, [r3]
    9fe4:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    9fe8:	e3530003 	cmp	r3, #3
    9fec:	0afffff2 	beq	9fbc <delay_task+0x2dc>
    9ff0:	e3a03000 	mov	r3, #0
    9ff4:	e1a00003 	mov	r0, r3
    9ff8:	e28bd000 	add	sp, fp, #0
    9ffc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    a000:	e12fff1e 	bx	lr

0000a004 <request>:
    a004:	e92d4800 	push	{fp, lr}
    a008:	e28db004 	add	fp, sp, #4
    a00c:	e24dd018 	sub	sp, sp, #24
    a010:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    a014:	e30f3f38 	movw	r3, #65336	; 0xff38
    a018:	e3403000 	movt	r3, #0
    a01c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    a020:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    a024:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    a028:	e3530004 	cmp	r3, #4
    a02c:	1a00000d 	bne	a068 <request+0x64>
    a030:	e30f3f38 	movw	r3, #65336	; 0xff38
    a034:	e3403000 	movt	r3, #0
    a038:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    a03c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    a040:	e1d334ba 	ldrh	r3, [r3, #74]	; 0x4a
    a044:	e3530002 	cmp	r3, #2
    a048:	0a000008 	beq	a070 <request+0x6c>
    a04c:	e30f3f38 	movw	r3, #65336	; 0xff38
    a050:	e3403000 	movt	r3, #0
    a054:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    a058:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    a05c:	e1d334ba 	ldrh	r3, [r3, #74]	; 0x4a
    a060:	e3530003 	cmp	r3, #3
    a064:	0a000001 	beq	a070 <request+0x6c>
    a068:	e3a03001 	mov	r3, #1
    a06c:	ea000099 	b	a2d8 <request+0x2d4>
    a070:	e24dd004 	sub	sp, sp, #4
    a074:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    a078:	e10f0000 	mrs	r0, CPSR
    a07c:	e58d0004 	str	r0, [sp, #4]
    a080:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    a084:	e3003334 	movw	r3, #820	; 0x334
    a088:	e3403001 	movt	r3, #1
    a08c:	e5933000 	ldr	r3, [r3]
    a090:	e2832001 	add	r2, r3, #1
    a094:	e3003334 	movw	r3, #820	; 0x334
    a098:	e3403001 	movt	r3, #1
    a09c:	e5832000 	str	r2, [r3]
    a0a0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    a0a4:	e59d0004 	ldr	r0, [sp, #4]
    a0a8:	e129f000 	msr	CPSR_fc, r0
    a0ac:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    a0b0:	e28dd004 	add	sp, sp, #4
    a0b4:	e30f3f38 	movw	r3, #65336	; 0xff38
    a0b8:	e3403000 	movt	r3, #0
    a0bc:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    a0c0:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    a0c4:	e1d334ba 	ldrh	r3, [r3, #74]	; 0x4a
    a0c8:	e3530003 	cmp	r3, #3
    a0cc:	1a00005d 	bne	a248 <request+0x244>
    a0d0:	e30f3f0c 	movw	r3, #65292	; 0xff0c
    a0d4:	e3403000 	movt	r3, #0
    a0d8:	e5933000 	ldr	r3, [r3]
    a0dc:	e2832001 	add	r2, r3, #1
    a0e0:	e30f3f0c 	movw	r3, #65292	; 0xff0c
    a0e4:	e3403000 	movt	r3, #0
    a0e8:	e5832000 	str	r2, [r3]
    a0ec:	e3a03000 	mov	r3, #0
    a0f0:	e50b3008 	str	r3, [fp, #-8]
    a0f4:	e30f3f00 	movw	r3, #65280	; 0xff00
    a0f8:	e3403000 	movt	r3, #0
    a0fc:	e5933000 	ldr	r3, [r3]
    a100:	e50b300c 	str	r3, [fp, #-12]
    a104:	ea000004 	b	a11c <request+0x118>
    a108:	e51b300c 	ldr	r3, [fp, #-12]
    a10c:	e50b3008 	str	r3, [fp, #-8]
    a110:	e51b300c 	ldr	r3, [fp, #-12]
    a114:	e593306c 	ldr	r3, [r3, #108]	; 0x6c
    a118:	e50b300c 	str	r3, [fp, #-12]
    a11c:	e51b300c 	ldr	r3, [fp, #-12]
    a120:	e3530000 	cmp	r3, #0
    a124:	0a000005 	beq	a140 <request+0x13c>
    a128:	e51b300c 	ldr	r3, [fp, #-12]
    a12c:	e1d334b4 	ldrh	r3, [r3, #68]	; 0x44
    a130:	e1a02003 	mov	r2, r3
    a134:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a138:	e1530002 	cmp	r3, r2
    a13c:	1afffff1 	bne	a108 <request+0x104>
    a140:	e51b300c 	ldr	r3, [fp, #-12]
    a144:	e3530000 	cmp	r3, #0
    a148:	1a000019 	bne	a1b4 <request+0x1b0>
    a14c:	e30f3f0c 	movw	r3, #65292	; 0xff0c
    a150:	e3403000 	movt	r3, #0
    a154:	e5933000 	ldr	r3, [r3]
    a158:	e2432001 	sub	r2, r3, #1
    a15c:	e30f3f0c 	movw	r3, #65292	; 0xff0c
    a160:	e3403000 	movt	r3, #0
    a164:	e5832000 	str	r2, [r3]
    a168:	e24dd004 	sub	sp, sp, #4
    a16c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    a170:	e10f0000 	mrs	r0, CPSR
    a174:	e58d0004 	str	r0, [sp, #4]
    a178:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    a17c:	e3003334 	movw	r3, #820	; 0x334
    a180:	e3403001 	movt	r3, #1
    a184:	e5933000 	ldr	r3, [r3]
    a188:	e2432001 	sub	r2, r3, #1
    a18c:	e3003334 	movw	r3, #820	; 0x334
    a190:	e3403001 	movt	r3, #1
    a194:	e5832000 	str	r2, [r3]
    a198:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    a19c:	e59d0004 	ldr	r0, [sp, #4]
    a1a0:	e129f000 	msr	CPSR_fc, r0
    a1a4:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    a1a8:	e28dd004 	add	sp, sp, #4
    a1ac:	e3e03000 	mvn	r3, #0
    a1b0:	ea000048 	b	a2d8 <request+0x2d4>
    a1b4:	e51b300c 	ldr	r3, [fp, #-12]
    a1b8:	e593306c 	ldr	r3, [r3, #108]	; 0x6c
    a1bc:	e3530000 	cmp	r3, #0
    a1c0:	0a00000c 	beq	a1f8 <request+0x1f4>
    a1c4:	e51b300c 	ldr	r3, [fp, #-12]
    a1c8:	e593304c 	ldr	r3, [r3, #76]	; 0x4c
    a1cc:	e3530000 	cmp	r3, #0
    a1d0:	0a000008 	beq	a1f8 <request+0x1f4>
    a1d4:	e51b300c 	ldr	r3, [fp, #-12]
    a1d8:	e593306c 	ldr	r3, [r3, #108]	; 0x6c
    a1dc:	e593104c 	ldr	r1, [r3, #76]	; 0x4c
    a1e0:	e51b300c 	ldr	r3, [fp, #-12]
    a1e4:	e593204c 	ldr	r2, [r3, #76]	; 0x4c
    a1e8:	e51b300c 	ldr	r3, [fp, #-12]
    a1ec:	e593306c 	ldr	r3, [r3, #108]	; 0x6c
    a1f0:	e0812002 	add	r2, r1, r2
    a1f4:	e583204c 	str	r2, [r3, #76]	; 0x4c
    a1f8:	e51b3008 	ldr	r3, [fp, #-8]
    a1fc:	e3530000 	cmp	r3, #0
    a200:	0a000004 	beq	a218 <request+0x214>
    a204:	e51b300c 	ldr	r3, [fp, #-12]
    a208:	e593206c 	ldr	r2, [r3, #108]	; 0x6c
    a20c:	e51b3008 	ldr	r3, [fp, #-8]
    a210:	e583206c 	str	r2, [r3, #108]	; 0x6c
    a214:	ea000004 	b	a22c <request+0x228>
    a218:	e51b300c 	ldr	r3, [fp, #-12]
    a21c:	e593206c 	ldr	r2, [r3, #108]	; 0x6c
    a220:	e30f3f00 	movw	r3, #65280	; 0xff00
    a224:	e3403000 	movt	r3, #0
    a228:	e5832000 	str	r2, [r3]
    a22c:	e30f3f0c 	movw	r3, #65292	; 0xff0c
    a230:	e3403000 	movt	r3, #0
    a234:	e5933000 	ldr	r3, [r3]
    a238:	e2432001 	sub	r2, r3, #1
    a23c:	e30f3f0c 	movw	r3, #65292	; 0xff0c
    a240:	e3403000 	movt	r3, #0
    a244:	e5832000 	str	r2, [r3]
    a248:	e30f3f38 	movw	r3, #65336	; 0xff38
    a24c:	e3403000 	movt	r3, #0
    a250:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    a254:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    a258:	e3a02002 	mov	r2, #2
    a25c:	e1c324b8 	strh	r2, [r3, #72]	; 0x48
    a260:	ebfff7d6 	bl	81c0 <set_disable>
    a264:	e50b0010 	str	r0, [fp, #-16]
    a268:	f10c0080 	cpsid	i
    a26c:	e30f3f38 	movw	r3, #65336	; 0xff38
    a270:	e3403000 	movt	r3, #0
    a274:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    a278:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    a27c:	e1a00003 	mov	r0, r3
    a280:	ebfff7e5 	bl	821c <queue>
    a284:	e51b0010 	ldr	r0, [fp, #-16]
    a288:	ebfff7d6 	bl	81e8 <set_enable>
    a28c:	e24dd004 	sub	sp, sp, #4
    a290:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    a294:	e10f0000 	mrs	r0, CPSR
    a298:	e58d0004 	str	r0, [sp, #4]
    a29c:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    a2a0:	e3003334 	movw	r3, #820	; 0x334
    a2a4:	e3403001 	movt	r3, #1
    a2a8:	e5933000 	ldr	r3, [r3]
    a2ac:	e2432001 	sub	r2, r3, #1
    a2b0:	e3003334 	movw	r3, #820	; 0x334
    a2b4:	e3403001 	movt	r3, #1
    a2b8:	e5832000 	str	r2, [r3]
    a2bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    a2c0:	e59d0004 	ldr	r0, [sp, #4]
    a2c4:	e129f000 	msr	CPSR_fc, r0
    a2c8:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    a2cc:	e28dd004 	add	sp, sp, #4
    a2d0:	ebfff86d 	bl	848c <dispatch>
    a2d4:	e3a03000 	mov	r3, #0
    a2d8:	e1a00003 	mov	r0, r3
    a2dc:	e24bd004 	sub	sp, fp, #4
    a2e0:	e8bd8800 	pop	{fp, pc}

0000a2e4 <levelchange>:
    a2e4:	e92d4800 	push	{fp, lr}
    a2e8:	e28db004 	add	fp, sp, #4
    a2ec:	e24dd010 	sub	sp, sp, #16
    a2f0:	e50b0010 	str	r0, [fp, #-16]
    a2f4:	e51b3010 	ldr	r3, [fp, #-16]
    a2f8:	e3530ffa 	cmp	r3, #1000	; 0x3e8
    a2fc:	ca000002 	bgt	a30c <levelchange+0x28>
    a300:	e51b3010 	ldr	r3, [fp, #-16]
    a304:	e3530000 	cmp	r3, #0
    a308:	ca000001 	bgt	a314 <levelchange+0x30>
    a30c:	e3e03001 	mvn	r3, #1
    a310:	ea00001b 	b	a384 <levelchange+0xa0>
    a314:	ebfff7a9 	bl	81c0 <set_disable>
    a318:	e50b000c 	str	r0, [fp, #-12]
    a31c:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a320:	e3403000 	movt	r3, #0
    a324:	e5933000 	ldr	r3, [r3]
    a328:	e3530000 	cmp	r3, #0
    a32c:	0a00000b 	beq	a360 <levelchange+0x7c>
    a330:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a334:	e3403000 	movt	r3, #0
    a338:	e5933000 	ldr	r3, [r3]
    a33c:	e1d335b4 	ldrh	r3, [r3, #84]	; 0x54
    a340:	e50b3008 	str	r3, [fp, #-8]
    a344:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a348:	e3403000 	movt	r3, #0
    a34c:	e5933000 	ldr	r3, [r3]
    a350:	e51b2010 	ldr	r2, [fp, #-16]
    a354:	e6ff2072 	uxth	r2, r2
    a358:	e1c325b4 	strh	r2, [r3, #84]	; 0x54
    a35c:	ea000001 	b	a368 <levelchange+0x84>
    a360:	e3e03000 	mvn	r3, #0
    a364:	e50b3008 	str	r3, [fp, #-8]
    a368:	e51b000c 	ldr	r0, [fp, #-12]
    a36c:	ebfff79d 	bl	81e8 <set_enable>
    a370:	e51b3008 	ldr	r3, [fp, #-8]
    a374:	e3730001 	cmn	r3, #1
    a378:	0a000000 	beq	a380 <levelchange+0x9c>
    a37c:	ebfff842 	bl	848c <dispatch>
    a380:	e51b3008 	ldr	r3, [fp, #-8]
    a384:	e1a00003 	mov	r0, r3
    a388:	e24bd004 	sub	sp, fp, #4
    a38c:	e8bd8800 	pop	{fp, pc}

0000a390 <levelget>:
    a390:	e92d4800 	push	{fp, lr}
    a394:	e28db004 	add	fp, sp, #4
    a398:	e24dd008 	sub	sp, sp, #8
    a39c:	ebfff787 	bl	81c0 <set_disable>
    a3a0:	e50b000c 	str	r0, [fp, #-12]
    a3a4:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a3a8:	e3403000 	movt	r3, #0
    a3ac:	e5933000 	ldr	r3, [r3]
    a3b0:	e3530000 	cmp	r3, #0
    a3b4:	0a000005 	beq	a3d0 <levelget+0x40>
    a3b8:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a3bc:	e3403000 	movt	r3, #0
    a3c0:	e5933000 	ldr	r3, [r3]
    a3c4:	e1d335b4 	ldrh	r3, [r3, #84]	; 0x54
    a3c8:	e50b3008 	str	r3, [fp, #-8]
    a3cc:	ea000001 	b	a3d8 <levelget+0x48>
    a3d0:	e3e03000 	mvn	r3, #0
    a3d4:	e50b3008 	str	r3, [fp, #-8]
    a3d8:	e51b000c 	ldr	r0, [fp, #-12]
    a3dc:	ebfff781 	bl	81e8 <set_enable>
    a3e0:	e51b3008 	ldr	r3, [fp, #-8]
    a3e4:	e1a00003 	mov	r0, r3
    a3e8:	e24bd004 	sub	sp, fp, #4
    a3ec:	e8bd8800 	pop	{fp, pc}

0000a3f0 <timechange>:
    a3f0:	e92d4800 	push	{fp, lr}
    a3f4:	e28db004 	add	fp, sp, #4
    a3f8:	e24dd010 	sub	sp, sp, #16
    a3fc:	e50b0010 	str	r0, [fp, #-16]
    a400:	ebfff76e 	bl	81c0 <set_disable>
    a404:	e1a03000 	mov	r3, r0
    a408:	e50b3008 	str	r3, [fp, #-8]
    a40c:	e3a03000 	mov	r3, #0
    a410:	e50b3010 	str	r3, [fp, #-16]
    a414:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a418:	e3403000 	movt	r3, #0
    a41c:	e5933000 	ldr	r3, [r3]
    a420:	e5933050 	ldr	r3, [r3, #80]	; 0x50
    a424:	e50b300c 	str	r3, [fp, #-12]
    a428:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a42c:	e3403000 	movt	r3, #0
    a430:	e5933000 	ldr	r3, [r3]
    a434:	e51b2010 	ldr	r2, [fp, #-16]
    a438:	e5832050 	str	r2, [r3, #80]	; 0x50
    a43c:	e51b3008 	ldr	r3, [fp, #-8]
    a440:	e1a00003 	mov	r0, r3
    a444:	ebfff767 	bl	81e8 <set_enable>
    a448:	e51b300c 	ldr	r3, [fp, #-12]
    a44c:	e1a00003 	mov	r0, r3
    a450:	e24bd004 	sub	sp, fp, #4
    a454:	e8bd8800 	pop	{fp, pc}

0000a458 <timeget>:
    a458:	e92d4800 	push	{fp, lr}
    a45c:	e28db004 	add	fp, sp, #4
    a460:	e24dd008 	sub	sp, sp, #8
    a464:	ebfff755 	bl	81c0 <set_disable>
    a468:	e50b0008 	str	r0, [fp, #-8]
    a46c:	e3a03000 	mov	r3, #0
    a470:	e50b300c 	str	r3, [fp, #-12]
    a474:	e51b0008 	ldr	r0, [fp, #-8]
    a478:	ebfff75a 	bl	81e8 <set_enable>
    a47c:	e51b300c 	ldr	r3, [fp, #-12]
    a480:	e1a00003 	mov	r0, r3
    a484:	e24bd004 	sub	sp, fp, #4
    a488:	e8bd8800 	pop	{fp, pc}

0000a48c <gettaskstate>:
    a48c:	e92d4800 	push	{fp, lr}
    a490:	e28db004 	add	fp, sp, #4
    a494:	e24dd010 	sub	sp, sp, #16
    a498:	e50b0010 	str	r0, [fp, #-16]
    a49c:	e51b3010 	ldr	r3, [fp, #-16]
    a4a0:	e3530000 	cmp	r3, #0
    a4a4:	ba000010 	blt	a4ec <gettaskstate+0x60>
    a4a8:	e51b2010 	ldr	r2, [fp, #-16]
    a4ac:	e30f3f08 	movw	r3, #65288	; 0xff08
    a4b0:	e3403000 	movt	r3, #0
    a4b4:	e5933000 	ldr	r3, [r3]
    a4b8:	e1520003 	cmp	r2, r3
    a4bc:	8a00000a 	bhi	a4ec <gettaskstate+0x60>
    a4c0:	e30f3eb8 	movw	r3, #65208	; 0xfeb8
    a4c4:	e3403000 	movt	r3, #0
    a4c8:	e5933000 	ldr	r3, [r3]
    a4cc:	e3530001 	cmp	r3, #1
    a4d0:	0a000005 	beq	a4ec <gettaskstate+0x60>
    a4d4:	e30f3f38 	movw	r3, #65336	; 0xff38
    a4d8:	e3403000 	movt	r3, #0
    a4dc:	e51b2010 	ldr	r2, [fp, #-16]
    a4e0:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    a4e4:	e3530000 	cmp	r3, #0
    a4e8:	1a000001 	bne	a4f4 <gettaskstate+0x68>
    a4ec:	e3a03000 	mov	r3, #0
    a4f0:	ea000012 	b	a540 <gettaskstate+0xb4>
    a4f4:	ebfff731 	bl	81c0 <set_disable>
    a4f8:	e50b0008 	str	r0, [fp, #-8]
    a4fc:	e30f3f38 	movw	r3, #65336	; 0xff38
    a500:	e3403000 	movt	r3, #0
    a504:	e51b2010 	ldr	r2, [fp, #-16]
    a508:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    a50c:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    a510:	e1a01003 	mov	r1, r3
    a514:	e30f3f38 	movw	r3, #65336	; 0xff38
    a518:	e3403000 	movt	r3, #0
    a51c:	e51b2010 	ldr	r2, [fp, #-16]
    a520:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    a524:	e1d334ba 	ldrh	r3, [r3, #74]	; 0x4a
    a528:	e1a03203 	lsl	r3, r3, #4
    a52c:	e1813003 	orr	r3, r1, r3
    a530:	e50b300c 	str	r3, [fp, #-12]
    a534:	e51b0008 	ldr	r0, [fp, #-8]
    a538:	ebfff72a 	bl	81e8 <set_enable>
    a53c:	e51b300c 	ldr	r3, [fp, #-12]
    a540:	e1a00003 	mov	r0, r3
    a544:	e24bd004 	sub	sp, fp, #4
    a548:	e8bd8800 	pop	{fp, pc}

0000a54c <timeslice_disable>:
    a54c:	e92d4800 	push	{fp, lr}
    a550:	e28db004 	add	fp, sp, #4
    a554:	e24dd008 	sub	sp, sp, #8
    a558:	e30f3f04 	movw	r3, #65284	; 0xff04
    a55c:	e3403000 	movt	r3, #0
    a560:	e5933000 	ldr	r3, [r3]
    a564:	e2033001 	and	r3, r3, #1
    a568:	e3530000 	cmp	r3, #0
    a56c:	0a00000c 	beq	a5a4 <timeslice_disable+0x58>
    a570:	ebfff712 	bl	81c0 <set_disable>
    a574:	e50b0008 	str	r0, [fp, #-8]
    a578:	e30f3f28 	movw	r3, #65320	; 0xff28
    a57c:	e3403000 	movt	r3, #0
    a580:	e5933000 	ldr	r3, [r3]
    a584:	e2832001 	add	r2, r3, #1
    a588:	e30f3f28 	movw	r3, #65320	; 0xff28
    a58c:	e3403000 	movt	r3, #0
    a590:	e5832000 	str	r2, [r3]
    a594:	e51b0008 	ldr	r0, [fp, #-8]
    a598:	ebfff712 	bl	81e8 <set_enable>
    a59c:	e3a03000 	mov	r3, #0
    a5a0:	ea000000 	b	a5a8 <timeslice_disable+0x5c>
    a5a4:	e3e03000 	mvn	r3, #0
    a5a8:	e1a00003 	mov	r0, r3
    a5ac:	e24bd004 	sub	sp, fp, #4
    a5b0:	e8bd8800 	pop	{fp, pc}

0000a5b4 <timeslice_enable>:
    a5b4:	e92d4800 	push	{fp, lr}
    a5b8:	e28db004 	add	fp, sp, #4
    a5bc:	e24dd008 	sub	sp, sp, #8
    a5c0:	e30f3f04 	movw	r3, #65284	; 0xff04
    a5c4:	e3403000 	movt	r3, #0
    a5c8:	e5933000 	ldr	r3, [r3]
    a5cc:	e2033001 	and	r3, r3, #1
    a5d0:	e3530000 	cmp	r3, #0
    a5d4:	0a000011 	beq	a620 <timeslice_enable+0x6c>
    a5d8:	e30f3f28 	movw	r3, #65320	; 0xff28
    a5dc:	e3403000 	movt	r3, #0
    a5e0:	e5933000 	ldr	r3, [r3]
    a5e4:	e3530000 	cmp	r3, #0
    a5e8:	0a00000c 	beq	a620 <timeslice_enable+0x6c>
    a5ec:	ebfff6f3 	bl	81c0 <set_disable>
    a5f0:	e50b0008 	str	r0, [fp, #-8]
    a5f4:	e30f3f28 	movw	r3, #65320	; 0xff28
    a5f8:	e3403000 	movt	r3, #0
    a5fc:	e5933000 	ldr	r3, [r3]
    a600:	e2432001 	sub	r2, r3, #1
    a604:	e30f3f28 	movw	r3, #65320	; 0xff28
    a608:	e3403000 	movt	r3, #0
    a60c:	e5832000 	str	r2, [r3]
    a610:	e51b0008 	ldr	r0, [fp, #-8]
    a614:	ebfff6f3 	bl	81e8 <set_enable>
    a618:	e3a03000 	mov	r3, #0
    a61c:	ea000000 	b	a624 <timeslice_enable+0x70>
    a620:	e3e03000 	mvn	r3, #0
    a624:	e1a00003 	mov	r0, r3
    a628:	e24bd004 	sub	sp, fp, #4
    a62c:	e8bd8800 	pop	{fp, pc}

0000a630 <TaskDisp>:
    a630:	e92d4800 	push	{fp, lr}
    a634:	e28db004 	add	fp, sp, #4
    a638:	e24dd008 	sub	sp, sp, #8
    a63c:	e50b0008 	str	r0, [fp, #-8]
    a640:	e30f3f30 	movw	r3, #65328	; 0xff30
    a644:	e3403000 	movt	r3, #0
    a648:	e5933000 	ldr	r3, [r3]
    a64c:	e3530000 	cmp	r3, #0
    a650:	1a000185 	bne	ac6c <TaskDisp+0x63c>
    a654:	e30f3f30 	movw	r3, #65328	; 0xff30
    a658:	e3403000 	movt	r3, #0
    a65c:	e3a02001 	mov	r2, #1
    a660:	e5832000 	str	r2, [r3]
    a664:	e3003334 	movw	r3, #820	; 0x334
    a668:	e3403001 	movt	r3, #1
    a66c:	e5933000 	ldr	r3, [r3]
    a670:	e3530000 	cmp	r3, #0
    a674:	1a000177 	bne	ac58 <TaskDisp+0x628>
    a678:	e30f3ef8 	movw	r3, #65272	; 0xfef8
    a67c:	e3403000 	movt	r3, #0
    a680:	e5933000 	ldr	r3, [r3]
    a684:	e3530000 	cmp	r3, #0
    a688:	0a00016e 	beq	ac48 <TaskDisp+0x618>
    a68c:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a690:	e3403000 	movt	r3, #0
    a694:	e5933000 	ldr	r3, [r3]
    a698:	e1d325b4 	ldrh	r2, [r3, #84]	; 0x54
    a69c:	e30f3ef8 	movw	r3, #65272	; 0xfef8
    a6a0:	e3403000 	movt	r3, #0
    a6a4:	e5933000 	ldr	r3, [r3]
    a6a8:	e1d335b4 	ldrh	r3, [r3, #84]	; 0x54
    a6ac:	e1520003 	cmp	r2, r3
    a6b0:	2a00000b 	bcs	a6e4 <TaskDisp+0xb4>
    a6b4:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a6b8:	e3403000 	movt	r3, #0
    a6bc:	e5933000 	ldr	r3, [r3]
    a6c0:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    a6c4:	e3530003 	cmp	r3, #3
    a6c8:	0a000005 	beq	a6e4 <TaskDisp+0xb4>
    a6cc:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a6d0:	e3403000 	movt	r3, #0
    a6d4:	e5933000 	ldr	r3, [r3]
    a6d8:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    a6dc:	e3530005 	cmp	r3, #5
    a6e0:	1a000158 	bne	ac48 <TaskDisp+0x618>
    a6e4:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a6e8:	e3403000 	movt	r3, #0
    a6ec:	e5933000 	ldr	r3, [r3]
    a6f0:	e51b2008 	ldr	r2, [fp, #-8]
    a6f4:	e5922000 	ldr	r2, [r2]
    a6f8:	e5832000 	str	r2, [r3]
    a6fc:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a700:	e3403000 	movt	r3, #0
    a704:	e5933000 	ldr	r3, [r3]
    a708:	e51b2008 	ldr	r2, [fp, #-8]
    a70c:	e5922004 	ldr	r2, [r2, #4]
    a710:	e5832004 	str	r2, [r3, #4]
    a714:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a718:	e3403000 	movt	r3, #0
    a71c:	e5933000 	ldr	r3, [r3]
    a720:	e51b2008 	ldr	r2, [fp, #-8]
    a724:	e5922008 	ldr	r2, [r2, #8]
    a728:	e5832008 	str	r2, [r3, #8]
    a72c:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a730:	e3403000 	movt	r3, #0
    a734:	e5933000 	ldr	r3, [r3]
    a738:	e51b2008 	ldr	r2, [fp, #-8]
    a73c:	e592200c 	ldr	r2, [r2, #12]
    a740:	e583200c 	str	r2, [r3, #12]
    a744:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a748:	e3403000 	movt	r3, #0
    a74c:	e5933000 	ldr	r3, [r3]
    a750:	e51b2008 	ldr	r2, [fp, #-8]
    a754:	e5922010 	ldr	r2, [r2, #16]
    a758:	e5832010 	str	r2, [r3, #16]
    a75c:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a760:	e3403000 	movt	r3, #0
    a764:	e5933000 	ldr	r3, [r3]
    a768:	e51b2008 	ldr	r2, [fp, #-8]
    a76c:	e5922014 	ldr	r2, [r2, #20]
    a770:	e5832014 	str	r2, [r3, #20]
    a774:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a778:	e3403000 	movt	r3, #0
    a77c:	e5933000 	ldr	r3, [r3]
    a780:	e51b2008 	ldr	r2, [fp, #-8]
    a784:	e5922018 	ldr	r2, [r2, #24]
    a788:	e5832018 	str	r2, [r3, #24]
    a78c:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a790:	e3403000 	movt	r3, #0
    a794:	e5933000 	ldr	r3, [r3]
    a798:	e51b2008 	ldr	r2, [fp, #-8]
    a79c:	e592201c 	ldr	r2, [r2, #28]
    a7a0:	e583201c 	str	r2, [r3, #28]
    a7a4:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a7a8:	e3403000 	movt	r3, #0
    a7ac:	e5933000 	ldr	r3, [r3]
    a7b0:	e51b2008 	ldr	r2, [fp, #-8]
    a7b4:	e5922020 	ldr	r2, [r2, #32]
    a7b8:	e5832020 	str	r2, [r3, #32]
    a7bc:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a7c0:	e3403000 	movt	r3, #0
    a7c4:	e5933000 	ldr	r3, [r3]
    a7c8:	e51b2008 	ldr	r2, [fp, #-8]
    a7cc:	e5922024 	ldr	r2, [r2, #36]	; 0x24
    a7d0:	e5832024 	str	r2, [r3, #36]	; 0x24
    a7d4:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a7d8:	e3403000 	movt	r3, #0
    a7dc:	e5933000 	ldr	r3, [r3]
    a7e0:	e51b2008 	ldr	r2, [fp, #-8]
    a7e4:	e5922028 	ldr	r2, [r2, #40]	; 0x28
    a7e8:	e5832028 	str	r2, [r3, #40]	; 0x28
    a7ec:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a7f0:	e3403000 	movt	r3, #0
    a7f4:	e5933000 	ldr	r3, [r3]
    a7f8:	e51b2008 	ldr	r2, [fp, #-8]
    a7fc:	e592202c 	ldr	r2, [r2, #44]	; 0x2c
    a800:	e583202c 	str	r2, [r3, #44]	; 0x2c
    a804:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a808:	e3403000 	movt	r3, #0
    a80c:	e5933000 	ldr	r3, [r3]
    a810:	e51b2008 	ldr	r2, [fp, #-8]
    a814:	e5922030 	ldr	r2, [r2, #48]	; 0x30
    a818:	e5832030 	str	r2, [r3, #48]	; 0x30
    a81c:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a820:	e3403000 	movt	r3, #0
    a824:	e5933000 	ldr	r3, [r3]
    a828:	e51b2008 	ldr	r2, [fp, #-8]
    a82c:	e5922034 	ldr	r2, [r2, #52]	; 0x34
    a830:	e5832034 	str	r2, [r3, #52]	; 0x34
    a834:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a838:	e3403000 	movt	r3, #0
    a83c:	e5933000 	ldr	r3, [r3]
    a840:	e51b2008 	ldr	r2, [fp, #-8]
    a844:	e5922038 	ldr	r2, [r2, #56]	; 0x38
    a848:	e5832038 	str	r2, [r3, #56]	; 0x38
    a84c:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a850:	e3403000 	movt	r3, #0
    a854:	e5933000 	ldr	r3, [r3]
    a858:	e51b2008 	ldr	r2, [fp, #-8]
    a85c:	e592203c 	ldr	r2, [r2, #60]	; 0x3c
    a860:	e583203c 	str	r2, [r3, #60]	; 0x3c
    a864:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a868:	e3403000 	movt	r3, #0
    a86c:	e5933000 	ldr	r3, [r3]
    a870:	e51b2008 	ldr	r2, [fp, #-8]
    a874:	e5922040 	ldr	r2, [r2, #64]	; 0x40
    a878:	e5832040 	str	r2, [r3, #64]	; 0x40
    a87c:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a880:	e3403000 	movt	r3, #0
    a884:	e5933000 	ldr	r3, [r3]
    a888:	e5932098 	ldr	r2, [r3, #152]	; 0x98
    a88c:	e300333c 	movw	r3, #828	; 0x33c
    a890:	e3403001 	movt	r3, #1
    a894:	e5933000 	ldr	r3, [r3]
    a898:	e1520003 	cmp	r2, r3
    a89c:	8a000011 	bhi	a8e8 <TaskDisp+0x2b8>
    a8a0:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a8a4:	e3403000 	movt	r3, #0
    a8a8:	e5933000 	ldr	r3, [r3]
    a8ac:	e593109c 	ldr	r1, [r3, #156]	; 0x9c
    a8b0:	e300333c 	movw	r3, #828	; 0x33c
    a8b4:	e3403001 	movt	r3, #1
    a8b8:	e5932000 	ldr	r2, [r3]
    a8bc:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a8c0:	e3403000 	movt	r3, #0
    a8c4:	e5933000 	ldr	r3, [r3]
    a8c8:	e5933098 	ldr	r3, [r3, #152]	; 0x98
    a8cc:	e0422003 	sub	r2, r2, r3
    a8d0:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a8d4:	e3403000 	movt	r3, #0
    a8d8:	e5933000 	ldr	r3, [r3]
    a8dc:	e0812002 	add	r2, r1, r2
    a8e0:	e583209c 	str	r2, [r3, #156]	; 0x9c
    a8e4:	ea000011 	b	a930 <TaskDisp+0x300>
    a8e8:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a8ec:	e3403000 	movt	r3, #0
    a8f0:	e5933000 	ldr	r3, [r3]
    a8f4:	e593209c 	ldr	r2, [r3, #156]	; 0x9c
    a8f8:	e300333c 	movw	r3, #828	; 0x33c
    a8fc:	e3403001 	movt	r3, #1
    a900:	e5931000 	ldr	r1, [r3]
    a904:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a908:	e3403000 	movt	r3, #0
    a90c:	e5933000 	ldr	r3, [r3]
    a910:	e5933098 	ldr	r3, [r3, #152]	; 0x98
    a914:	e0413003 	sub	r3, r1, r3
    a918:	e0822003 	add	r2, r2, r3
    a91c:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a920:	e3403000 	movt	r3, #0
    a924:	e5933000 	ldr	r3, [r3]
    a928:	e2422001 	sub	r2, r2, #1
    a92c:	e583209c 	str	r2, [r3, #156]	; 0x9c
    a930:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a934:	e3403000 	movt	r3, #0
    a938:	e5933000 	ldr	r3, [r3]
    a93c:	e59310a0 	ldr	r1, [r3, #160]	; 0xa0
    a940:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a944:	e3403000 	movt	r3, #0
    a948:	e5933000 	ldr	r3, [r3]
    a94c:	e593209c 	ldr	r2, [r3, #156]	; 0x9c
    a950:	e3043dd3 	movw	r3, #19923	; 0x4dd3
    a954:	e3413062 	movt	r3, #4194	; 0x1062
    a958:	e0832293 	umull	r2, r3, r3, r2
    a95c:	e1a02323 	lsr	r2, r3, #6
    a960:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a964:	e3403000 	movt	r3, #0
    a968:	e5933000 	ldr	r3, [r3]
    a96c:	e0812002 	add	r2, r1, r2
    a970:	e58320a0 	str	r2, [r3, #160]	; 0xa0
    a974:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a978:	e3403000 	movt	r3, #0
    a97c:	e5933000 	ldr	r3, [r3]
    a980:	e593209c 	ldr	r2, [r3, #156]	; 0x9c
    a984:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a988:	e3403000 	movt	r3, #0
    a98c:	e5931000 	ldr	r1, [r3]
    a990:	e3043dd3 	movw	r3, #19923	; 0x4dd3
    a994:	e3413062 	movt	r3, #4194	; 0x1062
    a998:	e0830293 	umull	r0, r3, r3, r2
    a99c:	e1a03323 	lsr	r3, r3, #6
    a9a0:	e3a00ffa 	mov	r0, #1000	; 0x3e8
    a9a4:	e0030390 	mul	r3, r0, r3
    a9a8:	e0423003 	sub	r3, r2, r3
    a9ac:	e581309c 	str	r3, [r1, #156]	; 0x9c
    a9b0:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a9b4:	e3403000 	movt	r3, #0
    a9b8:	e5933000 	ldr	r3, [r3]
    a9bc:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    a9c0:	e3530003 	cmp	r3, #3
    a9c4:	1a000005 	bne	a9e0 <TaskDisp+0x3b0>
    a9c8:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a9cc:	e3403000 	movt	r3, #0
    a9d0:	e5933000 	ldr	r3, [r3]
    a9d4:	e3a02004 	mov	r2, #4
    a9d8:	e1c324b8 	strh	r2, [r3, #72]	; 0x48
    a9dc:	ea00000a 	b	aa0c <TaskDisp+0x3dc>
    a9e0:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a9e4:	e3403000 	movt	r3, #0
    a9e8:	e5933000 	ldr	r3, [r3]
    a9ec:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    a9f0:	e3530005 	cmp	r3, #5
    a9f4:	0a000004 	beq	aa0c <TaskDisp+0x3dc>
    a9f8:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    a9fc:	e3403000 	movt	r3, #0
    aa00:	e5933000 	ldr	r3, [r3]
    aa04:	e1a00003 	mov	r0, r3
    aa08:	ebfff603 	bl	821c <queue>
    aa0c:	e30f3ef8 	movw	r3, #65272	; 0xfef8
    aa10:	e3403000 	movt	r3, #0
    aa14:	e5932000 	ldr	r2, [r3]
    aa18:	e30f3efc 	movw	r3, #65276	; 0xfefc
    aa1c:	e3403000 	movt	r3, #0
    aa20:	e5933000 	ldr	r3, [r3]
    aa24:	e1520003 	cmp	r2, r3
    aa28:	1a000003 	bne	aa3c <TaskDisp+0x40c>
    aa2c:	e30f3efc 	movw	r3, #65276	; 0xfefc
    aa30:	e3403000 	movt	r3, #0
    aa34:	e3a02000 	mov	r2, #0
    aa38:	e5832000 	str	r2, [r3]
    aa3c:	e30f3ef8 	movw	r3, #65272	; 0xfef8
    aa40:	e3403000 	movt	r3, #0
    aa44:	e5932000 	ldr	r2, [r3]
    aa48:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    aa4c:	e3403000 	movt	r3, #0
    aa50:	e5832000 	str	r2, [r3]
    aa54:	e30f3ef8 	movw	r3, #65272	; 0xfef8
    aa58:	e3403000 	movt	r3, #0
    aa5c:	e5933000 	ldr	r3, [r3]
    aa60:	e5932068 	ldr	r2, [r3, #104]	; 0x68
    aa64:	e30f3ef8 	movw	r3, #65272	; 0xfef8
    aa68:	e3403000 	movt	r3, #0
    aa6c:	e5832000 	str	r2, [r3]
    aa70:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    aa74:	e3403000 	movt	r3, #0
    aa78:	e5933000 	ldr	r3, [r3]
    aa7c:	e3a02000 	mov	r2, #0
    aa80:	e5832068 	str	r2, [r3, #104]	; 0x68
    aa84:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    aa88:	e3403000 	movt	r3, #0
    aa8c:	e5933000 	ldr	r3, [r3]
    aa90:	e5932000 	ldr	r2, [r3]
    aa94:	e51b3008 	ldr	r3, [fp, #-8]
    aa98:	e5832000 	str	r2, [r3]
    aa9c:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    aaa0:	e3403000 	movt	r3, #0
    aaa4:	e5933000 	ldr	r3, [r3]
    aaa8:	e5932004 	ldr	r2, [r3, #4]
    aaac:	e51b3008 	ldr	r3, [fp, #-8]
    aab0:	e5832004 	str	r2, [r3, #4]
    aab4:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    aab8:	e3403000 	movt	r3, #0
    aabc:	e5933000 	ldr	r3, [r3]
    aac0:	e5932008 	ldr	r2, [r3, #8]
    aac4:	e51b3008 	ldr	r3, [fp, #-8]
    aac8:	e5832008 	str	r2, [r3, #8]
    aacc:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    aad0:	e3403000 	movt	r3, #0
    aad4:	e5933000 	ldr	r3, [r3]
    aad8:	e593200c 	ldr	r2, [r3, #12]
    aadc:	e51b3008 	ldr	r3, [fp, #-8]
    aae0:	e583200c 	str	r2, [r3, #12]
    aae4:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    aae8:	e3403000 	movt	r3, #0
    aaec:	e5933000 	ldr	r3, [r3]
    aaf0:	e5932010 	ldr	r2, [r3, #16]
    aaf4:	e51b3008 	ldr	r3, [fp, #-8]
    aaf8:	e5832010 	str	r2, [r3, #16]
    aafc:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    ab00:	e3403000 	movt	r3, #0
    ab04:	e5933000 	ldr	r3, [r3]
    ab08:	e5932014 	ldr	r2, [r3, #20]
    ab0c:	e51b3008 	ldr	r3, [fp, #-8]
    ab10:	e5832014 	str	r2, [r3, #20]
    ab14:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    ab18:	e3403000 	movt	r3, #0
    ab1c:	e5933000 	ldr	r3, [r3]
    ab20:	e5932018 	ldr	r2, [r3, #24]
    ab24:	e51b3008 	ldr	r3, [fp, #-8]
    ab28:	e5832018 	str	r2, [r3, #24]
    ab2c:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    ab30:	e3403000 	movt	r3, #0
    ab34:	e5933000 	ldr	r3, [r3]
    ab38:	e593201c 	ldr	r2, [r3, #28]
    ab3c:	e51b3008 	ldr	r3, [fp, #-8]
    ab40:	e583201c 	str	r2, [r3, #28]
    ab44:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    ab48:	e3403000 	movt	r3, #0
    ab4c:	e5933000 	ldr	r3, [r3]
    ab50:	e5932020 	ldr	r2, [r3, #32]
    ab54:	e51b3008 	ldr	r3, [fp, #-8]
    ab58:	e5832020 	str	r2, [r3, #32]
    ab5c:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    ab60:	e3403000 	movt	r3, #0
    ab64:	e5933000 	ldr	r3, [r3]
    ab68:	e5932024 	ldr	r2, [r3, #36]	; 0x24
    ab6c:	e51b3008 	ldr	r3, [fp, #-8]
    ab70:	e5832024 	str	r2, [r3, #36]	; 0x24
    ab74:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    ab78:	e3403000 	movt	r3, #0
    ab7c:	e5933000 	ldr	r3, [r3]
    ab80:	e5932028 	ldr	r2, [r3, #40]	; 0x28
    ab84:	e51b3008 	ldr	r3, [fp, #-8]
    ab88:	e5832028 	str	r2, [r3, #40]	; 0x28
    ab8c:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    ab90:	e3403000 	movt	r3, #0
    ab94:	e5933000 	ldr	r3, [r3]
    ab98:	e593202c 	ldr	r2, [r3, #44]	; 0x2c
    ab9c:	e51b3008 	ldr	r3, [fp, #-8]
    aba0:	e583202c 	str	r2, [r3, #44]	; 0x2c
    aba4:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    aba8:	e3403000 	movt	r3, #0
    abac:	e5933000 	ldr	r3, [r3]
    abb0:	e5932030 	ldr	r2, [r3, #48]	; 0x30
    abb4:	e51b3008 	ldr	r3, [fp, #-8]
    abb8:	e5832030 	str	r2, [r3, #48]	; 0x30
    abbc:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    abc0:	e3403000 	movt	r3, #0
    abc4:	e5933000 	ldr	r3, [r3]
    abc8:	e5932034 	ldr	r2, [r3, #52]	; 0x34
    abcc:	e51b3008 	ldr	r3, [fp, #-8]
    abd0:	e5832034 	str	r2, [r3, #52]	; 0x34
    abd4:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    abd8:	e3403000 	movt	r3, #0
    abdc:	e5933000 	ldr	r3, [r3]
    abe0:	e5932038 	ldr	r2, [r3, #56]	; 0x38
    abe4:	e51b3008 	ldr	r3, [fp, #-8]
    abe8:	e5832038 	str	r2, [r3, #56]	; 0x38
    abec:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    abf0:	e3403000 	movt	r3, #0
    abf4:	e5933000 	ldr	r3, [r3]
    abf8:	e593203c 	ldr	r2, [r3, #60]	; 0x3c
    abfc:	e51b3008 	ldr	r3, [fp, #-8]
    ac00:	e583203c 	str	r2, [r3, #60]	; 0x3c
    ac04:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    ac08:	e3403000 	movt	r3, #0
    ac0c:	e5933000 	ldr	r3, [r3]
    ac10:	e5932040 	ldr	r2, [r3, #64]	; 0x40
    ac14:	e51b3008 	ldr	r3, [fp, #-8]
    ac18:	e5832040 	str	r2, [r3, #64]	; 0x40
    ac1c:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    ac20:	e3403000 	movt	r3, #0
    ac24:	e5932000 	ldr	r2, [r3]
    ac28:	e300333c 	movw	r3, #828	; 0x33c
    ac2c:	e3403001 	movt	r3, #1
    ac30:	e5933000 	ldr	r3, [r3]
    ac34:	e5823098 	str	r3, [r2, #152]	; 0x98
    ac38:	e3003340 	movw	r3, #832	; 0x340
    ac3c:	e3403001 	movt	r3, #1
    ac40:	e3a02000 	mov	r2, #0
    ac44:	e5832000 	str	r2, [r3]
    ac48:	e30f3f2c 	movw	r3, #65324	; 0xff2c
    ac4c:	e3403000 	movt	r3, #0
    ac50:	e3a02000 	mov	r2, #0
    ac54:	e5832000 	str	r2, [r3]
    ac58:	e30f3f30 	movw	r3, #65328	; 0xff30
    ac5c:	e3403000 	movt	r3, #0
    ac60:	e3a02000 	mov	r2, #0
    ac64:	e5832000 	str	r2, [r3]
    ac68:	ea000000 	b	ac70 <TaskDisp+0x640>
    ac6c:	e320f000 	nop	{0}
    ac70:	e24bd004 	sub	sp, fp, #4
    ac74:	e8bd8800 	pop	{fp, pc}

0000ac78 <set_user_int70>:
    ac78:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    ac7c:	e28db000 	add	fp, sp, #0
    ac80:	e24dd00c 	sub	sp, sp, #12
    ac84:	e50b0008 	str	r0, [fp, #-8]
    ac88:	e24dd004 	sub	sp, sp, #4
    ac8c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    ac90:	e10f0000 	mrs	r0, CPSR
    ac94:	e58d0004 	str	r0, [sp, #4]
    ac98:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    ac9c:	e3003334 	movw	r3, #820	; 0x334
    aca0:	e3403001 	movt	r3, #1
    aca4:	e5933000 	ldr	r3, [r3]
    aca8:	e2832001 	add	r2, r3, #1
    acac:	e3003334 	movw	r3, #820	; 0x334
    acb0:	e3403001 	movt	r3, #1
    acb4:	e5832000 	str	r2, [r3]
    acb8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    acbc:	e59d0004 	ldr	r0, [sp, #4]
    acc0:	e129f000 	msr	CPSR_fc, r0
    acc4:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    acc8:	e28dd004 	add	sp, sp, #4
    accc:	e30f3f34 	movw	r3, #65332	; 0xff34
    acd0:	e3403000 	movt	r3, #0
    acd4:	e51b2008 	ldr	r2, [fp, #-8]
    acd8:	e5832000 	str	r2, [r3]
    acdc:	e24dd004 	sub	sp, sp, #4
    ace0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    ace4:	e10f0000 	mrs	r0, CPSR
    ace8:	e58d0004 	str	r0, [sp, #4]
    acec:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    acf0:	e3003334 	movw	r3, #820	; 0x334
    acf4:	e3403001 	movt	r3, #1
    acf8:	e5933000 	ldr	r3, [r3]
    acfc:	e2432001 	sub	r2, r3, #1
    ad00:	e3003334 	movw	r3, #820	; 0x334
    ad04:	e3403001 	movt	r3, #1
    ad08:	e5832000 	str	r2, [r3]
    ad0c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    ad10:	e59d0004 	ldr	r0, [sp, #4]
    ad14:	e129f000 	msr	CPSR_fc, r0
    ad18:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    ad1c:	e28dd004 	add	sp, sp, #4
    ad20:	e320f000 	nop	{0}
    ad24:	e28bd000 	add	sp, fp, #0
    ad28:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    ad2c:	e12fff1e 	bx	lr

0000ad30 <TimeIntOrig>:
    ad30:	e92d4800 	push	{fp, lr}
    ad34:	e28db004 	add	fp, sp, #4
    ad38:	e24dd010 	sub	sp, sp, #16
    ad3c:	e50b0010 	str	r0, [fp, #-16]
    ad40:	e300333c 	movw	r3, #828	; 0x33c
    ad44:	e3403001 	movt	r3, #1
    ad48:	e5933000 	ldr	r3, [r3]
    ad4c:	e2832001 	add	r2, r3, #1
    ad50:	e300333c 	movw	r3, #828	; 0x33c
    ad54:	e3403001 	movt	r3, #1
    ad58:	e5832000 	str	r2, [r3]
    ad5c:	e30f3f34 	movw	r3, #65332	; 0xff34
    ad60:	e3403000 	movt	r3, #0
    ad64:	e5933000 	ldr	r3, [r3]
    ad68:	e3530000 	cmp	r3, #0
    ad6c:	0a000025 	beq	ae08 <TimeIntOrig+0xd8>
    ad70:	e24dd004 	sub	sp, sp, #4
    ad74:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    ad78:	e10f0000 	mrs	r0, CPSR
    ad7c:	e58d0004 	str	r0, [sp, #4]
    ad80:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    ad84:	e3003334 	movw	r3, #820	; 0x334
    ad88:	e3403001 	movt	r3, #1
    ad8c:	e5933000 	ldr	r3, [r3]
    ad90:	e2832001 	add	r2, r3, #1
    ad94:	e3003334 	movw	r3, #820	; 0x334
    ad98:	e3403001 	movt	r3, #1
    ad9c:	e5832000 	str	r2, [r3]
    ada0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    ada4:	e59d0004 	ldr	r0, [sp, #4]
    ada8:	e129f000 	msr	CPSR_fc, r0
    adac:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    adb0:	e28dd004 	add	sp, sp, #4
    adb4:	e30f3f34 	movw	r3, #65332	; 0xff34
    adb8:	e3403000 	movt	r3, #0
    adbc:	e5933000 	ldr	r3, [r3]
    adc0:	e12fff33 	blx	r3
    adc4:	e24dd004 	sub	sp, sp, #4
    adc8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    adcc:	e10f0000 	mrs	r0, CPSR
    add0:	e58d0004 	str	r0, [sp, #4]
    add4:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    add8:	e3003334 	movw	r3, #820	; 0x334
    addc:	e3403001 	movt	r3, #1
    ade0:	e5933000 	ldr	r3, [r3]
    ade4:	e2432001 	sub	r2, r3, #1
    ade8:	e3003334 	movw	r3, #820	; 0x334
    adec:	e3403001 	movt	r3, #1
    adf0:	e5832000 	str	r2, [r3]
    adf4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    adf8:	e59d0004 	ldr	r0, [sp, #4]
    adfc:	e129f000 	msr	CPSR_fc, r0
    ae00:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    ae04:	e28dd004 	add	sp, sp, #4
    ae08:	e30f3f14 	movw	r3, #65300	; 0xff14
    ae0c:	e3403000 	movt	r3, #0
    ae10:	e5933000 	ldr	r3, [r3]
    ae14:	e3730001 	cmn	r3, #1
    ae18:	0a00000e 	beq	ae58 <TimeIntOrig+0x128>
    ae1c:	e3003340 	movw	r3, #832	; 0x340
    ae20:	e3403001 	movt	r3, #1
    ae24:	e5932000 	ldr	r2, [r3]
    ae28:	e30f3f14 	movw	r3, #65300	; 0xff14
    ae2c:	e3403000 	movt	r3, #0
    ae30:	e5933000 	ldr	r3, [r3]
    ae34:	e1520003 	cmp	r2, r3
    ae38:	2a000006 	bcs	ae58 <TimeIntOrig+0x128>
    ae3c:	e3003340 	movw	r3, #832	; 0x340
    ae40:	e3403001 	movt	r3, #1
    ae44:	e5933000 	ldr	r3, [r3]
    ae48:	e2832001 	add	r2, r3, #1
    ae4c:	e3003340 	movw	r3, #832	; 0x340
    ae50:	e3403001 	movt	r3, #1
    ae54:	e5832000 	str	r2, [r3]
    ae58:	e30f3f0c 	movw	r3, #65292	; 0xff0c
    ae5c:	e3403000 	movt	r3, #0
    ae60:	e5933000 	ldr	r3, [r3]
    ae64:	e3530000 	cmp	r3, #0
    ae68:	1a000033 	bne	af3c <TimeIntOrig+0x20c>
    ae6c:	e30f3f00 	movw	r3, #65280	; 0xff00
    ae70:	e3403000 	movt	r3, #0
    ae74:	e5933000 	ldr	r3, [r3]
    ae78:	e3530000 	cmp	r3, #0
    ae7c:	0a00002e 	beq	af3c <TimeIntOrig+0x20c>
    ae80:	e30f3f00 	movw	r3, #65280	; 0xff00
    ae84:	e3403000 	movt	r3, #0
    ae88:	e5933000 	ldr	r3, [r3]
    ae8c:	e593204c 	ldr	r2, [r3, #76]	; 0x4c
    ae90:	e2422001 	sub	r2, r2, #1
    ae94:	e583204c 	str	r2, [r3, #76]	; 0x4c
    ae98:	e593304c 	ldr	r3, [r3, #76]	; 0x4c
    ae9c:	e3530000 	cmp	r3, #0
    aea0:	1a000025 	bne	af3c <TimeIntOrig+0x20c>
    aea4:	ea000015 	b	af00 <TimeIntOrig+0x1d0>
    aea8:	e30f3f00 	movw	r3, #65280	; 0xff00
    aeac:	e3403000 	movt	r3, #0
    aeb0:	e5933000 	ldr	r3, [r3]
    aeb4:	e3a02002 	mov	r2, #2
    aeb8:	e1c324b8 	strh	r2, [r3, #72]	; 0x48
    aebc:	e30f3f00 	movw	r3, #65280	; 0xff00
    aec0:	e3403000 	movt	r3, #0
    aec4:	e5933000 	ldr	r3, [r3]
    aec8:	e1d334b4 	ldrh	r3, [r3, #68]	; 0x44
    aecc:	e1a02003 	mov	r2, r3
    aed0:	e30f3f38 	movw	r3, #65336	; 0xff38
    aed4:	e3403000 	movt	r3, #0
    aed8:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    aedc:	e1a00003 	mov	r0, r3
    aee0:	ebfff4cd 	bl	821c <queue>
    aee4:	e30f3f00 	movw	r3, #65280	; 0xff00
    aee8:	e3403000 	movt	r3, #0
    aeec:	e5933000 	ldr	r3, [r3]
    aef0:	e593206c 	ldr	r2, [r3, #108]	; 0x6c
    aef4:	e30f3f00 	movw	r3, #65280	; 0xff00
    aef8:	e3403000 	movt	r3, #0
    aefc:	e5832000 	str	r2, [r3]
    af00:	e30f3f00 	movw	r3, #65280	; 0xff00
    af04:	e3403000 	movt	r3, #0
    af08:	e5933000 	ldr	r3, [r3]
    af0c:	e3530000 	cmp	r3, #0
    af10:	0a000005 	beq	af2c <TimeIntOrig+0x1fc>
    af14:	e30f3f00 	movw	r3, #65280	; 0xff00
    af18:	e3403000 	movt	r3, #0
    af1c:	e5933000 	ldr	r3, [r3]
    af20:	e593304c 	ldr	r3, [r3, #76]	; 0x4c
    af24:	e3530000 	cmp	r3, #0
    af28:	0affffde 	beq	aea8 <TimeIntOrig+0x178>
    af2c:	e30f3f2c 	movw	r3, #65324	; 0xff2c
    af30:	e3403000 	movt	r3, #0
    af34:	e3a02001 	mov	r2, #1
    af38:	e5832000 	str	r2, [r3]
    af3c:	e30f3f10 	movw	r3, #65296	; 0xff10
    af40:	e3403000 	movt	r3, #0
    af44:	e5933000 	ldr	r3, [r3]
    af48:	e3530000 	cmp	r3, #0
    af4c:	1a000044 	bne	b064 <TimeIntOrig+0x334>
    af50:	e3003338 	movw	r3, #824	; 0x338
    af54:	e3403001 	movt	r3, #1
    af58:	e5933000 	ldr	r3, [r3]
    af5c:	e3530000 	cmp	r3, #0
    af60:	0a00003f 	beq	b064 <TimeIntOrig+0x334>
    af64:	e3003338 	movw	r3, #824	; 0x338
    af68:	e3403001 	movt	r3, #1
    af6c:	e5933000 	ldr	r3, [r3]
    af70:	e5932004 	ldr	r2, [r3, #4]
    af74:	e2422001 	sub	r2, r2, #1
    af78:	e5832004 	str	r2, [r3, #4]
    af7c:	e5933004 	ldr	r3, [r3, #4]
    af80:	e3530000 	cmp	r3, #0
    af84:	1a000036 	bne	b064 <TimeIntOrig+0x334>
    af88:	ea000026 	b	b028 <TimeIntOrig+0x2f8>
    af8c:	e3003338 	movw	r3, #824	; 0x338
    af90:	e3403001 	movt	r3, #1
    af94:	e5933000 	ldr	r3, [r3]
    af98:	e50b3008 	str	r3, [fp, #-8]
    af9c:	e3003338 	movw	r3, #824	; 0x338
    afa0:	e3403001 	movt	r3, #1
    afa4:	e5933000 	ldr	r3, [r3]
    afa8:	e5932028 	ldr	r2, [r3, #40]	; 0x28
    afac:	e3003338 	movw	r3, #824	; 0x338
    afb0:	e3403001 	movt	r3, #1
    afb4:	e5832000 	str	r2, [r3]
    afb8:	e51b3008 	ldr	r3, [fp, #-8]
    afbc:	e283200c 	add	r2, r3, #12
    afc0:	e51b3008 	ldr	r3, [fp, #-8]
    afc4:	e5933008 	ldr	r3, [r3, #8]
    afc8:	e1a01003 	mov	r1, r3
    afcc:	e1a00002 	mov	r0, r2
    afd0:	ebfffa1c 	bl	9848 <rlsm_count>
    afd4:	e51b3008 	ldr	r3, [fp, #-8]
    afd8:	e5933020 	ldr	r3, [r3, #32]
    afdc:	e3530000 	cmp	r3, #0
    afe0:	0a000006 	beq	b000 <TimeIntOrig+0x2d0>
    afe4:	e51b3008 	ldr	r3, [fp, #-8]
    afe8:	e5932020 	ldr	r2, [r3, #32]
    afec:	e51b3008 	ldr	r3, [fp, #-8]
    aff0:	e5933024 	ldr	r3, [r3, #36]	; 0x24
    aff4:	e1a01003 	mov	r1, r3
    aff8:	e1a00002 	mov	r0, r2
    affc:	ebfff896 	bl	925c <sptsk>
    b000:	e51b3008 	ldr	r3, [fp, #-8]
    b004:	e5933018 	ldr	r3, [r3, #24]
    b008:	e2033001 	and	r3, r3, #1
    b00c:	e3530000 	cmp	r3, #0
    b010:	0a000004 	beq	b028 <TimeIntOrig+0x2f8>
    b014:	e51b3008 	ldr	r3, [fp, #-8]
    b018:	e3a02000 	mov	r2, #0
    b01c:	e583201c 	str	r2, [r3, #28]
    b020:	e51b0008 	ldr	r0, [fp, #-8]
    b024:	eb000a34 	bl	d8fc <start_timer>
    b028:	e3003338 	movw	r3, #824	; 0x338
    b02c:	e3403001 	movt	r3, #1
    b030:	e5933000 	ldr	r3, [r3]
    b034:	e3530000 	cmp	r3, #0
    b038:	0a000005 	beq	b054 <TimeIntOrig+0x324>
    b03c:	e3003338 	movw	r3, #824	; 0x338
    b040:	e3403001 	movt	r3, #1
    b044:	e5933000 	ldr	r3, [r3]
    b048:	e5933004 	ldr	r3, [r3, #4]
    b04c:	e3530000 	cmp	r3, #0
    b050:	0affffcd 	beq	af8c <TimeIntOrig+0x25c>
    b054:	e30f3f2c 	movw	r3, #65324	; 0xff2c
    b058:	e3403000 	movt	r3, #0
    b05c:	e3a02001 	mov	r2, #1
    b060:	e5832000 	str	r2, [r3]
    b064:	e3003344 	movw	r3, #836	; 0x344
    b068:	e3403001 	movt	r3, #1
    b06c:	e5933000 	ldr	r3, [r3]
    b070:	e3530000 	cmp	r3, #0
    b074:	0a00000b 	beq	b0a8 <TimeIntOrig+0x378>
    b078:	e3003344 	movw	r3, #836	; 0x344
    b07c:	e3403001 	movt	r3, #1
    b080:	e5933000 	ldr	r3, [r3]
    b084:	e3730001 	cmn	r3, #1
    b088:	0a000006 	beq	b0a8 <TimeIntOrig+0x378>
    b08c:	e3003344 	movw	r3, #836	; 0x344
    b090:	e3403001 	movt	r3, #1
    b094:	e5933000 	ldr	r3, [r3]
    b098:	e2432001 	sub	r2, r3, #1
    b09c:	e3003344 	movw	r3, #836	; 0x344
    b0a0:	e3403001 	movt	r3, #1
    b0a4:	e5832000 	str	r2, [r3]
    b0a8:	e30f3f30 	movw	r3, #65328	; 0xff30
    b0ac:	e3403000 	movt	r3, #0
    b0b0:	e5933000 	ldr	r3, [r3]
    b0b4:	e3530000 	cmp	r3, #0
    b0b8:	1a0001a4 	bne	b750 <TimeIntOrig+0xa20>
    b0bc:	e30f3f30 	movw	r3, #65328	; 0xff30
    b0c0:	e3403000 	movt	r3, #0
    b0c4:	e3a02001 	mov	r2, #1
    b0c8:	e5832000 	str	r2, [r3]
    b0cc:	e3003334 	movw	r3, #820	; 0x334
    b0d0:	e3403001 	movt	r3, #1
    b0d4:	e5933000 	ldr	r3, [r3]
    b0d8:	e3530000 	cmp	r3, #0
    b0dc:	1a000196 	bne	b73c <TimeIntOrig+0xa0c>
    b0e0:	e30f3f28 	movw	r3, #65320	; 0xff28
    b0e4:	e3403000 	movt	r3, #0
    b0e8:	e5933000 	ldr	r3, [r3]
    b0ec:	e3530000 	cmp	r3, #0
    b0f0:	1a000191 	bne	b73c <TimeIntOrig+0xa0c>
    b0f4:	e3003340 	movw	r3, #832	; 0x340
    b0f8:	e3403001 	movt	r3, #1
    b0fc:	e5932000 	ldr	r2, [r3]
    b100:	e30f3f14 	movw	r3, #65300	; 0xff14
    b104:	e3403000 	movt	r3, #0
    b108:	e5933000 	ldr	r3, [r3]
    b10c:	e1520003 	cmp	r2, r3
    b110:	0a000009 	beq	b13c <TimeIntOrig+0x40c>
    b114:	e3003344 	movw	r3, #836	; 0x344
    b118:	e3403001 	movt	r3, #1
    b11c:	e5933000 	ldr	r3, [r3]
    b120:	e3530000 	cmp	r3, #0
    b124:	0a000004 	beq	b13c <TimeIntOrig+0x40c>
    b128:	e30f3f2c 	movw	r3, #65324	; 0xff2c
    b12c:	e3403000 	movt	r3, #0
    b130:	e5933000 	ldr	r3, [r3]
    b134:	e3530000 	cmp	r3, #0
    b138:	0a00017f 	beq	b73c <TimeIntOrig+0xa0c>
    b13c:	e30f3ef8 	movw	r3, #65272	; 0xfef8
    b140:	e3403000 	movt	r3, #0
    b144:	e5933000 	ldr	r3, [r3]
    b148:	e3530000 	cmp	r3, #0
    b14c:	0a000176 	beq	b72c <TimeIntOrig+0x9fc>
    b150:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b154:	e3403000 	movt	r3, #0
    b158:	e5933000 	ldr	r3, [r3]
    b15c:	e1d325b4 	ldrh	r2, [r3, #84]	; 0x54
    b160:	e30f3ef8 	movw	r3, #65272	; 0xfef8
    b164:	e3403000 	movt	r3, #0
    b168:	e5933000 	ldr	r3, [r3]
    b16c:	e1d335b4 	ldrh	r3, [r3, #84]	; 0x54
    b170:	e1520003 	cmp	r2, r3
    b174:	2a00000b 	bcs	b1a8 <TimeIntOrig+0x478>
    b178:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b17c:	e3403000 	movt	r3, #0
    b180:	e5933000 	ldr	r3, [r3]
    b184:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    b188:	e3530003 	cmp	r3, #3
    b18c:	0a000005 	beq	b1a8 <TimeIntOrig+0x478>
    b190:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b194:	e3403000 	movt	r3, #0
    b198:	e5933000 	ldr	r3, [r3]
    b19c:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    b1a0:	e3530005 	cmp	r3, #5
    b1a4:	1a000160 	bne	b72c <TimeIntOrig+0x9fc>
    b1a8:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b1ac:	e3403000 	movt	r3, #0
    b1b0:	e5933000 	ldr	r3, [r3]
    b1b4:	e51b2010 	ldr	r2, [fp, #-16]
    b1b8:	e5922000 	ldr	r2, [r2]
    b1bc:	e5832000 	str	r2, [r3]
    b1c0:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b1c4:	e3403000 	movt	r3, #0
    b1c8:	e5933000 	ldr	r3, [r3]
    b1cc:	e51b2010 	ldr	r2, [fp, #-16]
    b1d0:	e5922004 	ldr	r2, [r2, #4]
    b1d4:	e5832004 	str	r2, [r3, #4]
    b1d8:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b1dc:	e3403000 	movt	r3, #0
    b1e0:	e5933000 	ldr	r3, [r3]
    b1e4:	e51b2010 	ldr	r2, [fp, #-16]
    b1e8:	e5922008 	ldr	r2, [r2, #8]
    b1ec:	e5832008 	str	r2, [r3, #8]
    b1f0:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b1f4:	e3403000 	movt	r3, #0
    b1f8:	e5933000 	ldr	r3, [r3]
    b1fc:	e51b2010 	ldr	r2, [fp, #-16]
    b200:	e592200c 	ldr	r2, [r2, #12]
    b204:	e583200c 	str	r2, [r3, #12]
    b208:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b20c:	e3403000 	movt	r3, #0
    b210:	e5933000 	ldr	r3, [r3]
    b214:	e51b2010 	ldr	r2, [fp, #-16]
    b218:	e5922010 	ldr	r2, [r2, #16]
    b21c:	e5832010 	str	r2, [r3, #16]
    b220:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b224:	e3403000 	movt	r3, #0
    b228:	e5933000 	ldr	r3, [r3]
    b22c:	e51b2010 	ldr	r2, [fp, #-16]
    b230:	e5922014 	ldr	r2, [r2, #20]
    b234:	e5832014 	str	r2, [r3, #20]
    b238:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b23c:	e3403000 	movt	r3, #0
    b240:	e5933000 	ldr	r3, [r3]
    b244:	e51b2010 	ldr	r2, [fp, #-16]
    b248:	e5922018 	ldr	r2, [r2, #24]
    b24c:	e5832018 	str	r2, [r3, #24]
    b250:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b254:	e3403000 	movt	r3, #0
    b258:	e5933000 	ldr	r3, [r3]
    b25c:	e51b2010 	ldr	r2, [fp, #-16]
    b260:	e592201c 	ldr	r2, [r2, #28]
    b264:	e583201c 	str	r2, [r3, #28]
    b268:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b26c:	e3403000 	movt	r3, #0
    b270:	e5933000 	ldr	r3, [r3]
    b274:	e51b2010 	ldr	r2, [fp, #-16]
    b278:	e5922020 	ldr	r2, [r2, #32]
    b27c:	e5832020 	str	r2, [r3, #32]
    b280:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b284:	e3403000 	movt	r3, #0
    b288:	e5933000 	ldr	r3, [r3]
    b28c:	e51b2010 	ldr	r2, [fp, #-16]
    b290:	e5922024 	ldr	r2, [r2, #36]	; 0x24
    b294:	e5832024 	str	r2, [r3, #36]	; 0x24
    b298:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b29c:	e3403000 	movt	r3, #0
    b2a0:	e5933000 	ldr	r3, [r3]
    b2a4:	e51b2010 	ldr	r2, [fp, #-16]
    b2a8:	e5922028 	ldr	r2, [r2, #40]	; 0x28
    b2ac:	e5832028 	str	r2, [r3, #40]	; 0x28
    b2b0:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b2b4:	e3403000 	movt	r3, #0
    b2b8:	e5933000 	ldr	r3, [r3]
    b2bc:	e51b2010 	ldr	r2, [fp, #-16]
    b2c0:	e592202c 	ldr	r2, [r2, #44]	; 0x2c
    b2c4:	e583202c 	str	r2, [r3, #44]	; 0x2c
    b2c8:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b2cc:	e3403000 	movt	r3, #0
    b2d0:	e5933000 	ldr	r3, [r3]
    b2d4:	e51b2010 	ldr	r2, [fp, #-16]
    b2d8:	e5922030 	ldr	r2, [r2, #48]	; 0x30
    b2dc:	e5832030 	str	r2, [r3, #48]	; 0x30
    b2e0:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b2e4:	e3403000 	movt	r3, #0
    b2e8:	e5933000 	ldr	r3, [r3]
    b2ec:	e51b2010 	ldr	r2, [fp, #-16]
    b2f0:	e5922034 	ldr	r2, [r2, #52]	; 0x34
    b2f4:	e5832034 	str	r2, [r3, #52]	; 0x34
    b2f8:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b2fc:	e3403000 	movt	r3, #0
    b300:	e5933000 	ldr	r3, [r3]
    b304:	e51b2010 	ldr	r2, [fp, #-16]
    b308:	e5922038 	ldr	r2, [r2, #56]	; 0x38
    b30c:	e5832038 	str	r2, [r3, #56]	; 0x38
    b310:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b314:	e3403000 	movt	r3, #0
    b318:	e5933000 	ldr	r3, [r3]
    b31c:	e51b2010 	ldr	r2, [fp, #-16]
    b320:	e592203c 	ldr	r2, [r2, #60]	; 0x3c
    b324:	e583203c 	str	r2, [r3, #60]	; 0x3c
    b328:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b32c:	e3403000 	movt	r3, #0
    b330:	e5933000 	ldr	r3, [r3]
    b334:	e51b2010 	ldr	r2, [fp, #-16]
    b338:	e5922040 	ldr	r2, [r2, #64]	; 0x40
    b33c:	e5832040 	str	r2, [r3, #64]	; 0x40
    b340:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b344:	e3403000 	movt	r3, #0
    b348:	e5933000 	ldr	r3, [r3]
    b34c:	e5932098 	ldr	r2, [r3, #152]	; 0x98
    b350:	e300333c 	movw	r3, #828	; 0x33c
    b354:	e3403001 	movt	r3, #1
    b358:	e5933000 	ldr	r3, [r3]
    b35c:	e1520003 	cmp	r2, r3
    b360:	8a000011 	bhi	b3ac <TimeIntOrig+0x67c>
    b364:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b368:	e3403000 	movt	r3, #0
    b36c:	e5933000 	ldr	r3, [r3]
    b370:	e593109c 	ldr	r1, [r3, #156]	; 0x9c
    b374:	e300333c 	movw	r3, #828	; 0x33c
    b378:	e3403001 	movt	r3, #1
    b37c:	e5932000 	ldr	r2, [r3]
    b380:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b384:	e3403000 	movt	r3, #0
    b388:	e5933000 	ldr	r3, [r3]
    b38c:	e5933098 	ldr	r3, [r3, #152]	; 0x98
    b390:	e0422003 	sub	r2, r2, r3
    b394:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b398:	e3403000 	movt	r3, #0
    b39c:	e5933000 	ldr	r3, [r3]
    b3a0:	e0812002 	add	r2, r1, r2
    b3a4:	e583209c 	str	r2, [r3, #156]	; 0x9c
    b3a8:	ea000011 	b	b3f4 <TimeIntOrig+0x6c4>
    b3ac:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b3b0:	e3403000 	movt	r3, #0
    b3b4:	e5933000 	ldr	r3, [r3]
    b3b8:	e593209c 	ldr	r2, [r3, #156]	; 0x9c
    b3bc:	e300333c 	movw	r3, #828	; 0x33c
    b3c0:	e3403001 	movt	r3, #1
    b3c4:	e5931000 	ldr	r1, [r3]
    b3c8:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b3cc:	e3403000 	movt	r3, #0
    b3d0:	e5933000 	ldr	r3, [r3]
    b3d4:	e5933098 	ldr	r3, [r3, #152]	; 0x98
    b3d8:	e0413003 	sub	r3, r1, r3
    b3dc:	e0822003 	add	r2, r2, r3
    b3e0:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b3e4:	e3403000 	movt	r3, #0
    b3e8:	e5933000 	ldr	r3, [r3]
    b3ec:	e2422001 	sub	r2, r2, #1
    b3f0:	e583209c 	str	r2, [r3, #156]	; 0x9c
    b3f4:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b3f8:	e3403000 	movt	r3, #0
    b3fc:	e5933000 	ldr	r3, [r3]
    b400:	e59310a0 	ldr	r1, [r3, #160]	; 0xa0
    b404:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b408:	e3403000 	movt	r3, #0
    b40c:	e5933000 	ldr	r3, [r3]
    b410:	e593209c 	ldr	r2, [r3, #156]	; 0x9c
    b414:	e3043dd3 	movw	r3, #19923	; 0x4dd3
    b418:	e3413062 	movt	r3, #4194	; 0x1062
    b41c:	e0832293 	umull	r2, r3, r3, r2
    b420:	e1a02323 	lsr	r2, r3, #6
    b424:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b428:	e3403000 	movt	r3, #0
    b42c:	e5933000 	ldr	r3, [r3]
    b430:	e0812002 	add	r2, r1, r2
    b434:	e58320a0 	str	r2, [r3, #160]	; 0xa0
    b438:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b43c:	e3403000 	movt	r3, #0
    b440:	e5933000 	ldr	r3, [r3]
    b444:	e593209c 	ldr	r2, [r3, #156]	; 0x9c
    b448:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b44c:	e3403000 	movt	r3, #0
    b450:	e5931000 	ldr	r1, [r3]
    b454:	e3043dd3 	movw	r3, #19923	; 0x4dd3
    b458:	e3413062 	movt	r3, #4194	; 0x1062
    b45c:	e0830293 	umull	r0, r3, r3, r2
    b460:	e1a03323 	lsr	r3, r3, #6
    b464:	e3a00ffa 	mov	r0, #1000	; 0x3e8
    b468:	e0030390 	mul	r3, r0, r3
    b46c:	e0423003 	sub	r3, r2, r3
    b470:	e581309c 	str	r3, [r1, #156]	; 0x9c
    b474:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b478:	e3403000 	movt	r3, #0
    b47c:	e5933000 	ldr	r3, [r3]
    b480:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    b484:	e3530003 	cmp	r3, #3
    b488:	1a000005 	bne	b4a4 <TimeIntOrig+0x774>
    b48c:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b490:	e3403000 	movt	r3, #0
    b494:	e5933000 	ldr	r3, [r3]
    b498:	e3a02004 	mov	r2, #4
    b49c:	e1c324b8 	strh	r2, [r3, #72]	; 0x48
    b4a0:	ea00000a 	b	b4d0 <TimeIntOrig+0x7a0>
    b4a4:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b4a8:	e3403000 	movt	r3, #0
    b4ac:	e5933000 	ldr	r3, [r3]
    b4b0:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    b4b4:	e3530005 	cmp	r3, #5
    b4b8:	0a000004 	beq	b4d0 <TimeIntOrig+0x7a0>
    b4bc:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b4c0:	e3403000 	movt	r3, #0
    b4c4:	e5933000 	ldr	r3, [r3]
    b4c8:	e1a00003 	mov	r0, r3
    b4cc:	ebfff352 	bl	821c <queue>
    b4d0:	e30f3ef8 	movw	r3, #65272	; 0xfef8
    b4d4:	e3403000 	movt	r3, #0
    b4d8:	e5932000 	ldr	r2, [r3]
    b4dc:	e30f3efc 	movw	r3, #65276	; 0xfefc
    b4e0:	e3403000 	movt	r3, #0
    b4e4:	e5933000 	ldr	r3, [r3]
    b4e8:	e1520003 	cmp	r2, r3
    b4ec:	1a000003 	bne	b500 <TimeIntOrig+0x7d0>
    b4f0:	e30f3efc 	movw	r3, #65276	; 0xfefc
    b4f4:	e3403000 	movt	r3, #0
    b4f8:	e3a02000 	mov	r2, #0
    b4fc:	e5832000 	str	r2, [r3]
    b500:	e30f3ef8 	movw	r3, #65272	; 0xfef8
    b504:	e3403000 	movt	r3, #0
    b508:	e5932000 	ldr	r2, [r3]
    b50c:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b510:	e3403000 	movt	r3, #0
    b514:	e5832000 	str	r2, [r3]
    b518:	e30f3ef8 	movw	r3, #65272	; 0xfef8
    b51c:	e3403000 	movt	r3, #0
    b520:	e5933000 	ldr	r3, [r3]
    b524:	e5932068 	ldr	r2, [r3, #104]	; 0x68
    b528:	e30f3ef8 	movw	r3, #65272	; 0xfef8
    b52c:	e3403000 	movt	r3, #0
    b530:	e5832000 	str	r2, [r3]
    b534:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b538:	e3403000 	movt	r3, #0
    b53c:	e5933000 	ldr	r3, [r3]
    b540:	e3a02000 	mov	r2, #0
    b544:	e5832068 	str	r2, [r3, #104]	; 0x68
    b548:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b54c:	e3403000 	movt	r3, #0
    b550:	e5933000 	ldr	r3, [r3]
    b554:	e5932000 	ldr	r2, [r3]
    b558:	e51b3010 	ldr	r3, [fp, #-16]
    b55c:	e5832000 	str	r2, [r3]
    b560:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b564:	e3403000 	movt	r3, #0
    b568:	e5933000 	ldr	r3, [r3]
    b56c:	e5932004 	ldr	r2, [r3, #4]
    b570:	e51b3010 	ldr	r3, [fp, #-16]
    b574:	e5832004 	str	r2, [r3, #4]
    b578:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b57c:	e3403000 	movt	r3, #0
    b580:	e5933000 	ldr	r3, [r3]
    b584:	e5932008 	ldr	r2, [r3, #8]
    b588:	e51b3010 	ldr	r3, [fp, #-16]
    b58c:	e5832008 	str	r2, [r3, #8]
    b590:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b594:	e3403000 	movt	r3, #0
    b598:	e5933000 	ldr	r3, [r3]
    b59c:	e593200c 	ldr	r2, [r3, #12]
    b5a0:	e51b3010 	ldr	r3, [fp, #-16]
    b5a4:	e583200c 	str	r2, [r3, #12]
    b5a8:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b5ac:	e3403000 	movt	r3, #0
    b5b0:	e5933000 	ldr	r3, [r3]
    b5b4:	e5932010 	ldr	r2, [r3, #16]
    b5b8:	e51b3010 	ldr	r3, [fp, #-16]
    b5bc:	e5832010 	str	r2, [r3, #16]
    b5c0:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b5c4:	e3403000 	movt	r3, #0
    b5c8:	e5933000 	ldr	r3, [r3]
    b5cc:	e5932014 	ldr	r2, [r3, #20]
    b5d0:	e51b3010 	ldr	r3, [fp, #-16]
    b5d4:	e5832014 	str	r2, [r3, #20]
    b5d8:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b5dc:	e3403000 	movt	r3, #0
    b5e0:	e5933000 	ldr	r3, [r3]
    b5e4:	e5932018 	ldr	r2, [r3, #24]
    b5e8:	e51b3010 	ldr	r3, [fp, #-16]
    b5ec:	e5832018 	str	r2, [r3, #24]
    b5f0:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b5f4:	e3403000 	movt	r3, #0
    b5f8:	e5933000 	ldr	r3, [r3]
    b5fc:	e593201c 	ldr	r2, [r3, #28]
    b600:	e51b3010 	ldr	r3, [fp, #-16]
    b604:	e583201c 	str	r2, [r3, #28]
    b608:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b60c:	e3403000 	movt	r3, #0
    b610:	e5933000 	ldr	r3, [r3]
    b614:	e5932020 	ldr	r2, [r3, #32]
    b618:	e51b3010 	ldr	r3, [fp, #-16]
    b61c:	e5832020 	str	r2, [r3, #32]
    b620:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b624:	e3403000 	movt	r3, #0
    b628:	e5933000 	ldr	r3, [r3]
    b62c:	e5932024 	ldr	r2, [r3, #36]	; 0x24
    b630:	e51b3010 	ldr	r3, [fp, #-16]
    b634:	e5832024 	str	r2, [r3, #36]	; 0x24
    b638:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b63c:	e3403000 	movt	r3, #0
    b640:	e5933000 	ldr	r3, [r3]
    b644:	e5932028 	ldr	r2, [r3, #40]	; 0x28
    b648:	e51b3010 	ldr	r3, [fp, #-16]
    b64c:	e5832028 	str	r2, [r3, #40]	; 0x28
    b650:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b654:	e3403000 	movt	r3, #0
    b658:	e5933000 	ldr	r3, [r3]
    b65c:	e593202c 	ldr	r2, [r3, #44]	; 0x2c
    b660:	e51b3010 	ldr	r3, [fp, #-16]
    b664:	e583202c 	str	r2, [r3, #44]	; 0x2c
    b668:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b66c:	e3403000 	movt	r3, #0
    b670:	e5933000 	ldr	r3, [r3]
    b674:	e5932030 	ldr	r2, [r3, #48]	; 0x30
    b678:	e51b3010 	ldr	r3, [fp, #-16]
    b67c:	e5832030 	str	r2, [r3, #48]	; 0x30
    b680:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b684:	e3403000 	movt	r3, #0
    b688:	e5933000 	ldr	r3, [r3]
    b68c:	e5932034 	ldr	r2, [r3, #52]	; 0x34
    b690:	e51b3010 	ldr	r3, [fp, #-16]
    b694:	e5832034 	str	r2, [r3, #52]	; 0x34
    b698:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b69c:	e3403000 	movt	r3, #0
    b6a0:	e5933000 	ldr	r3, [r3]
    b6a4:	e5932038 	ldr	r2, [r3, #56]	; 0x38
    b6a8:	e51b3010 	ldr	r3, [fp, #-16]
    b6ac:	e5832038 	str	r2, [r3, #56]	; 0x38
    b6b0:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b6b4:	e3403000 	movt	r3, #0
    b6b8:	e5933000 	ldr	r3, [r3]
    b6bc:	e593203c 	ldr	r2, [r3, #60]	; 0x3c
    b6c0:	e51b3010 	ldr	r3, [fp, #-16]
    b6c4:	e583203c 	str	r2, [r3, #60]	; 0x3c
    b6c8:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b6cc:	e3403000 	movt	r3, #0
    b6d0:	e5933000 	ldr	r3, [r3]
    b6d4:	e5932040 	ldr	r2, [r3, #64]	; 0x40
    b6d8:	e51b3010 	ldr	r3, [fp, #-16]
    b6dc:	e5832040 	str	r2, [r3, #64]	; 0x40
    b6e0:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b6e4:	e3403000 	movt	r3, #0
    b6e8:	e5932000 	ldr	r2, [r3]
    b6ec:	e300333c 	movw	r3, #828	; 0x33c
    b6f0:	e3403001 	movt	r3, #1
    b6f4:	e5933000 	ldr	r3, [r3]
    b6f8:	e5823098 	str	r3, [r2, #152]	; 0x98
    b6fc:	e3003340 	movw	r3, #832	; 0x340
    b700:	e3403001 	movt	r3, #1
    b704:	e3a02000 	mov	r2, #0
    b708:	e5832000 	str	r2, [r3]
    b70c:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    b710:	e3403000 	movt	r3, #0
    b714:	e5933000 	ldr	r3, [r3]
    b718:	e5933050 	ldr	r3, [r3, #80]	; 0x50
    b71c:	e1a02003 	mov	r2, r3
    b720:	e3003344 	movw	r3, #836	; 0x344
    b724:	e3403001 	movt	r3, #1
    b728:	e5832000 	str	r2, [r3]
    b72c:	e30f3f2c 	movw	r3, #65324	; 0xff2c
    b730:	e3403000 	movt	r3, #0
    b734:	e3a02000 	mov	r2, #0
    b738:	e5832000 	str	r2, [r3]
    b73c:	e30f3f30 	movw	r3, #65328	; 0xff30
    b740:	e3403000 	movt	r3, #0
    b744:	e3a02000 	mov	r2, #0
    b748:	e5832000 	str	r2, [r3]
    b74c:	ea000000 	b	b754 <TimeIntOrig+0xa24>
    b750:	e320f000 	nop	{0}
    b754:	e24bd004 	sub	sp, fp, #4
    b758:	e8bd8800 	pop	{fp, pc}

0000b75c <TimeInt>:
    b75c:	e92d4800 	push	{fp, lr}
    b760:	e28db004 	add	fp, sp, #4
    b764:	e24dd008 	sub	sp, sp, #8
    b768:	e50b0008 	str	r0, [fp, #-8]
    b76c:	e30f3f24 	movw	r3, #65316	; 0xff24
    b770:	e3403000 	movt	r3, #0
    b774:	e5933000 	ldr	r3, [r3]
    b778:	e3530064 	cmp	r3, #100	; 0x64
    b77c:	1a000004 	bne	b794 <TimeInt+0x38>
    b780:	e30f3f24 	movw	r3, #65316	; 0xff24
    b784:	e3403000 	movt	r3, #0
    b788:	e3a02000 	mov	r2, #0
    b78c:	e5832000 	str	r2, [r3]
    b790:	ea00001b 	b	b804 <TimeInt+0xa8>
    b794:	e30f3f20 	movw	r3, #65312	; 0xff20
    b798:	e3403000 	movt	r3, #0
    b79c:	e5933000 	ldr	r3, [r3]
    b7a0:	e2033001 	and	r3, r3, #1
    b7a4:	e3530000 	cmp	r3, #0
    b7a8:	1a00000e 	bne	b7e8 <TimeInt+0x8c>
    b7ac:	e30f3f20 	movw	r3, #65312	; 0xff20
    b7b0:	e3403000 	movt	r3, #0
    b7b4:	e5933000 	ldr	r3, [r3]
    b7b8:	e2832001 	add	r2, r3, #1
    b7bc:	e30f3f20 	movw	r3, #65312	; 0xff20
    b7c0:	e3403000 	movt	r3, #0
    b7c4:	e5832000 	str	r2, [r3]
    b7c8:	e30f3f24 	movw	r3, #65316	; 0xff24
    b7cc:	e3403000 	movt	r3, #0
    b7d0:	e5933000 	ldr	r3, [r3]
    b7d4:	e2832001 	add	r2, r3, #1
    b7d8:	e30f3f24 	movw	r3, #65316	; 0xff24
    b7dc:	e3403000 	movt	r3, #0
    b7e0:	e5832000 	str	r2, [r3]
    b7e4:	ea000006 	b	b804 <TimeInt+0xa8>
    b7e8:	e30f3f20 	movw	r3, #65312	; 0xff20
    b7ec:	e3403000 	movt	r3, #0
    b7f0:	e5933000 	ldr	r3, [r3]
    b7f4:	e2832001 	add	r2, r3, #1
    b7f8:	e30f3f20 	movw	r3, #65312	; 0xff20
    b7fc:	e3403000 	movt	r3, #0
    b800:	e5832000 	str	r2, [r3]
    b804:	e30f3f1c 	movw	r3, #65308	; 0xff1c
    b808:	e3403000 	movt	r3, #0
    b80c:	e5933000 	ldr	r3, [r3]
    b810:	e3530000 	cmp	r3, #0
    b814:	ba000027 	blt	b8b8 <TimeInt+0x15c>
    b818:	e30f3f1c 	movw	r3, #65308	; 0xff1c
    b81c:	e3403000 	movt	r3, #0
    b820:	e5933000 	ldr	r3, [r3]
    b824:	e353003b 	cmp	r3, #59	; 0x3b
    b828:	ca000022 	bgt	b8b8 <TimeInt+0x15c>
    b82c:	e30f3f24 	movw	r3, #65316	; 0xff24
    b830:	e3403000 	movt	r3, #0
    b834:	e5933000 	ldr	r3, [r3]
    b838:	e3530002 	cmp	r3, #2
    b83c:	ca000001 	bgt	b848 <TimeInt+0xec>
    b840:	e3a00015 	mov	r0, #21
    b844:	eb000ed9 	bl	f3b0 <RPI_SetGpioHi>
    b848:	e30f3f24 	movw	r3, #65316	; 0xff24
    b84c:	e3403000 	movt	r3, #0
    b850:	e5933000 	ldr	r3, [r3]
    b854:	e3530002 	cmp	r3, #2
    b858:	da000001 	ble	b864 <TimeInt+0x108>
    b85c:	e3a00015 	mov	r0, #21
    b860:	eb000ef4 	bl	f438 <RPI_SetGpioLo>
    b864:	e30f3f24 	movw	r3, #65316	; 0xff24
    b868:	e3403000 	movt	r3, #0
    b86c:	e5933000 	ldr	r3, [r3]
    b870:	e3530032 	cmp	r3, #50	; 0x32
    b874:	1a00000f 	bne	b8b8 <TimeInt+0x15c>
    b878:	e30f3f1c 	movw	r3, #65308	; 0xff1c
    b87c:	e3403000 	movt	r3, #0
    b880:	e5933000 	ldr	r3, [r3]
    b884:	e2832001 	add	r2, r3, #1
    b888:	e30f3f1c 	movw	r3, #65308	; 0xff1c
    b88c:	e3403000 	movt	r3, #0
    b890:	e5832000 	str	r2, [r3]
    b894:	e30f3f1c 	movw	r3, #65308	; 0xff1c
    b898:	e3403000 	movt	r3, #0
    b89c:	e5933000 	ldr	r3, [r3]
    b8a0:	e353003b 	cmp	r3, #59	; 0x3b
    b8a4:	ca000003 	bgt	b8b8 <TimeInt+0x15c>
    b8a8:	e30f3f24 	movw	r3, #65316	; 0xff24
    b8ac:	e3403000 	movt	r3, #0
    b8b0:	e3a02000 	mov	r2, #0
    b8b4:	e5832000 	str	r2, [r3]
    b8b8:	e30f3f1c 	movw	r3, #65308	; 0xff1c
    b8bc:	e3403000 	movt	r3, #0
    b8c0:	e5933000 	ldr	r3, [r3]
    b8c4:	e353003b 	cmp	r3, #59	; 0x3b
    b8c8:	da00002b 	ble	b97c <TimeInt+0x220>
    b8cc:	e30f3f1c 	movw	r3, #65308	; 0xff1c
    b8d0:	e3403000 	movt	r3, #0
    b8d4:	e5933000 	ldr	r3, [r3]
    b8d8:	e3530077 	cmp	r3, #119	; 0x77
    b8dc:	ca000026 	bgt	b97c <TimeInt+0x220>
    b8e0:	e30f3f24 	movw	r3, #65316	; 0xff24
    b8e4:	e3403000 	movt	r3, #0
    b8e8:	e5933000 	ldr	r3, [r3]
    b8ec:	e353003b 	cmp	r3, #59	; 0x3b
    b8f0:	ca000001 	bgt	b8fc <TimeInt+0x1a0>
    b8f4:	e3a00015 	mov	r0, #21
    b8f8:	eb000eac 	bl	f3b0 <RPI_SetGpioHi>
    b8fc:	e30f3f24 	movw	r3, #65316	; 0xff24
    b900:	e3403000 	movt	r3, #0
    b904:	e5933000 	ldr	r3, [r3]
    b908:	e353003b 	cmp	r3, #59	; 0x3b
    b90c:	da000001 	ble	b918 <TimeInt+0x1bc>
    b910:	e3a00015 	mov	r0, #21
    b914:	eb000ec7 	bl	f438 <RPI_SetGpioLo>
    b918:	e30f3f24 	movw	r3, #65316	; 0xff24
    b91c:	e3403000 	movt	r3, #0
    b920:	e5933000 	ldr	r3, [r3]
    b924:	e3530063 	cmp	r3, #99	; 0x63
    b928:	1a000013 	bne	b97c <TimeInt+0x220>
    b92c:	e30f3f1c 	movw	r3, #65308	; 0xff1c
    b930:	e3403000 	movt	r3, #0
    b934:	e5933000 	ldr	r3, [r3]
    b938:	e2832001 	add	r2, r3, #1
    b93c:	e30f3f1c 	movw	r3, #65308	; 0xff1c
    b940:	e3403000 	movt	r3, #0
    b944:	e5832000 	str	r2, [r3]
    b948:	e30f3f24 	movw	r3, #65316	; 0xff24
    b94c:	e3403000 	movt	r3, #0
    b950:	e3a02032 	mov	r2, #50	; 0x32
    b954:	e5832000 	str	r2, [r3]
    b958:	e30f3f1c 	movw	r3, #65308	; 0xff1c
    b95c:	e3403000 	movt	r3, #0
    b960:	e5933000 	ldr	r3, [r3]
    b964:	e3530078 	cmp	r3, #120	; 0x78
    b968:	1a000003 	bne	b97c <TimeInt+0x220>
    b96c:	e30f3f1c 	movw	r3, #65308	; 0xff1c
    b970:	e3403000 	movt	r3, #0
    b974:	e3a02000 	mov	r2, #0
    b978:	e5832000 	str	r2, [r3]
    b97c:	e51b0008 	ldr	r0, [fp, #-8]
    b980:	ebfffcea 	bl	ad30 <TimeIntOrig>
    b984:	e320f000 	nop	{0}
    b988:	e24bd004 	sub	sp, fp, #4
    b98c:	e8bd8800 	pop	{fp, pc}

0000b990 <create_task_mbox>:
    b990:	e92d4800 	push	{fp, lr}
    b994:	e28db004 	add	fp, sp, #4
    b998:	e24dd028 	sub	sp, sp, #40	; 0x28
    b99c:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    b9a0:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
    b9a4:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
    b9a8:	e3a03000 	mov	r3, #0
    b9ac:	e50b300c 	str	r3, [fp, #-12]
    b9b0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    b9b4:	e3530000 	cmp	r3, #0
    b9b8:	da00000a 	ble	b9e8 <create_task_mbox+0x58>
    b9bc:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    b9c0:	e30f3f08 	movw	r3, #65288	; 0xff08
    b9c4:	e3403000 	movt	r3, #0
    b9c8:	e5933000 	ldr	r3, [r3]
    b9cc:	e1520003 	cmp	r2, r3
    b9d0:	8a000004 	bhi	b9e8 <create_task_mbox+0x58>
    b9d4:	e30f3eb8 	movw	r3, #65208	; 0xfeb8
    b9d8:	e3403000 	movt	r3, #0
    b9dc:	e5933000 	ldr	r3, [r3]
    b9e0:	e3530001 	cmp	r3, #1
    b9e4:	1a000001 	bne	b9f0 <create_task_mbox+0x60>
    b9e8:	e3a03001 	mov	r3, #1
    b9ec:	ea000069 	b	bb98 <create_task_mbox+0x208>
    b9f0:	e30f3f38 	movw	r3, #65336	; 0xff38
    b9f4:	e3403000 	movt	r3, #0
    b9f8:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    b9fc:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    ba00:	e3530000 	cmp	r3, #0
    ba04:	1a000001 	bne	ba10 <create_task_mbox+0x80>
    ba08:	e3a03002 	mov	r3, #2
    ba0c:	ea000061 	b	bb98 <create_task_mbox+0x208>
    ba10:	ebfff1ea 	bl	81c0 <set_disable>
    ba14:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
    ba18:	e30f3f38 	movw	r3, #65336	; 0xff38
    ba1c:	e3403000 	movt	r3, #0
    ba20:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    ba24:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    ba28:	e5933074 	ldr	r3, [r3, #116]	; 0x74
    ba2c:	e3530000 	cmp	r3, #0
    ba30:	0a000002 	beq	ba40 <create_task_mbox+0xb0>
    ba34:	e3a03003 	mov	r3, #3
    ba38:	e50b300c 	str	r3, [fp, #-12]
    ba3c:	ea000052 	b	bb8c <create_task_mbox+0x1fc>
    ba40:	e30f3f38 	movw	r3, #65336	; 0xff38
    ba44:	e3403000 	movt	r3, #0
    ba48:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    ba4c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    ba50:	e2833074 	add	r3, r3, #116	; 0x74
    ba54:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    ba58:	e3a02024 	mov	r2, #36	; 0x24
    ba5c:	e3a01000 	mov	r1, #0
    ba60:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    ba64:	eb001011 	bl	fab0 <memse>
    ba68:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    ba6c:	e2833004 	add	r3, r3, #4
    ba70:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    ba74:	e0030392 	mul	r3, r2, r3
    ba78:	e2833018 	add	r3, r3, #24
    ba7c:	e1a00003 	mov	r0, r3
    ba80:	eb000f63 	bl	f814 <malloc>
    ba84:	e1a03000 	mov	r3, r0
    ba88:	e50b3010 	str	r3, [fp, #-16]
    ba8c:	e51b3010 	ldr	r3, [fp, #-16]
    ba90:	e3530000 	cmp	r3, #0
    ba94:	1a000002 	bne	baa4 <create_task_mbox+0x114>
    ba98:	e3a03004 	mov	r3, #4
    ba9c:	e50b300c 	str	r3, [fp, #-12]
    baa0:	ea000039 	b	bb8c <create_task_mbox+0x1fc>
    baa4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    baa8:	e51b2010 	ldr	r2, [fp, #-16]
    baac:	e5832018 	str	r2, [r3, #24]
    bab0:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    bab4:	e1a03103 	lsl	r3, r3, #2
    bab8:	e51b2010 	ldr	r2, [fp, #-16]
    babc:	e0823003 	add	r3, r2, r3
    bac0:	e50b3010 	str	r3, [fp, #-16]
    bac4:	e3a03000 	mov	r3, #0
    bac8:	e50b3008 	str	r3, [fp, #-8]
    bacc:	ea00000d 	b	bb08 <create_task_mbox+0x178>
    bad0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    bad4:	e5932018 	ldr	r2, [r3, #24]
    bad8:	e51b3008 	ldr	r3, [fp, #-8]
    badc:	e1a03103 	lsl	r3, r3, #2
    bae0:	e0823003 	add	r3, r2, r3
    bae4:	e51b2010 	ldr	r2, [fp, #-16]
    bae8:	e5832000 	str	r2, [r3]
    baec:	e51b3008 	ldr	r3, [fp, #-8]
    baf0:	e2833001 	add	r3, r3, #1
    baf4:	e50b3008 	str	r3, [fp, #-8]
    baf8:	e51b2010 	ldr	r2, [fp, #-16]
    bafc:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    bb00:	e0823003 	add	r3, r2, r3
    bb04:	e50b3010 	str	r3, [fp, #-16]
    bb08:	e51b3008 	ldr	r3, [fp, #-8]
    bb0c:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    bb10:	e1520003 	cmp	r2, r3
    bb14:	8affffed 	bhi	bad0 <create_task_mbox+0x140>
    bb18:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    bb1c:	e51b2010 	ldr	r2, [fp, #-16]
    bb20:	e583201c 	str	r2, [r3, #28]
    bb24:	e51b3010 	ldr	r3, [fp, #-16]
    bb28:	e283300c 	add	r3, r3, #12
    bb2c:	e50b3010 	str	r3, [fp, #-16]
    bb30:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    bb34:	e51b2010 	ldr	r2, [fp, #-16]
    bb38:	e5832020 	str	r2, [r3, #32]
    bb3c:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    bb40:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    bb44:	e5832010 	str	r2, [r3, #16]
    bb48:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    bb4c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    bb50:	e5832014 	str	r2, [r3, #20]
    bb54:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    bb58:	e593301c 	ldr	r3, [r3, #28]
    bb5c:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    bb60:	e1a01002 	mov	r1, r2
    bb64:	e1a00003 	mov	r0, r3
    bb68:	ebfff66e 	bl	9528 <dfsm>
    bb6c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    bb70:	e5933020 	ldr	r3, [r3, #32]
    bb74:	e3a01000 	mov	r1, #0
    bb78:	e1a00003 	mov	r0, r3
    bb7c:	ebfff669 	bl	9528 <dfsm>
    bb80:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    bb84:	e3a02001 	mov	r2, #1
    bb88:	e5832000 	str	r2, [r3]
    bb8c:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    bb90:	ebfff194 	bl	81e8 <set_enable>
    bb94:	e51b300c 	ldr	r3, [fp, #-12]
    bb98:	e1a00003 	mov	r0, r3
    bb9c:	e24bd004 	sub	sp, fp, #4
    bba0:	e8bd8800 	pop	{fp, pc}

0000bba4 <clear_task_mbox>:
    bba4:	e92d4800 	push	{fp, lr}
    bba8:	e28db004 	add	fp, sp, #4
    bbac:	e24dd018 	sub	sp, sp, #24
    bbb0:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    bbb4:	e3a03000 	mov	r3, #0
    bbb8:	e50b3008 	str	r3, [fp, #-8]
    bbbc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    bbc0:	e3530000 	cmp	r3, #0
    bbc4:	da00000a 	ble	bbf4 <clear_task_mbox+0x50>
    bbc8:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    bbcc:	e30f3f08 	movw	r3, #65288	; 0xff08
    bbd0:	e3403000 	movt	r3, #0
    bbd4:	e5933000 	ldr	r3, [r3]
    bbd8:	e1520003 	cmp	r2, r3
    bbdc:	8a000004 	bhi	bbf4 <clear_task_mbox+0x50>
    bbe0:	e30f3eb8 	movw	r3, #65208	; 0xfeb8
    bbe4:	e3403000 	movt	r3, #0
    bbe8:	e5933000 	ldr	r3, [r3]
    bbec:	e3530001 	cmp	r3, #1
    bbf0:	1a000001 	bne	bbfc <clear_task_mbox+0x58>
    bbf4:	e3a03001 	mov	r3, #1
    bbf8:	ea000041 	b	bd04 <clear_task_mbox+0x160>
    bbfc:	e30f3f38 	movw	r3, #65336	; 0xff38
    bc00:	e3403000 	movt	r3, #0
    bc04:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    bc08:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    bc0c:	e3530000 	cmp	r3, #0
    bc10:	1a000001 	bne	bc1c <clear_task_mbox+0x78>
    bc14:	e3a03002 	mov	r3, #2
    bc18:	ea000039 	b	bd04 <clear_task_mbox+0x160>
    bc1c:	ebfff167 	bl	81c0 <set_disable>
    bc20:	e50b000c 	str	r0, [fp, #-12]
    bc24:	e30f3f38 	movw	r3, #65336	; 0xff38
    bc28:	e3403000 	movt	r3, #0
    bc2c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    bc30:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    bc34:	e5933074 	ldr	r3, [r3, #116]	; 0x74
    bc38:	e3530004 	cmp	r3, #4
    bc3c:	1a000002 	bne	bc4c <clear_task_mbox+0xa8>
    bc40:	e3a03005 	mov	r3, #5
    bc44:	e50b3008 	str	r3, [fp, #-8]
    bc48:	ea00002a 	b	bcf8 <clear_task_mbox+0x154>
    bc4c:	e30f3f38 	movw	r3, #65336	; 0xff38
    bc50:	e3403000 	movt	r3, #0
    bc54:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    bc58:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    bc5c:	e5933074 	ldr	r3, [r3, #116]	; 0x74
    bc60:	e3530000 	cmp	r3, #0
    bc64:	1a000002 	bne	bc74 <clear_task_mbox+0xd0>
    bc68:	e3a03003 	mov	r3, #3
    bc6c:	e50b3008 	str	r3, [fp, #-8]
    bc70:	ea000020 	b	bcf8 <clear_task_mbox+0x154>
    bc74:	e30f3f38 	movw	r3, #65336	; 0xff38
    bc78:	e3403000 	movt	r3, #0
    bc7c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    bc80:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    bc84:	e2833074 	add	r3, r3, #116	; 0x74
    bc88:	e50b3010 	str	r3, [fp, #-16]
    bc8c:	e51b3010 	ldr	r3, [fp, #-16]
    bc90:	e593301c 	ldr	r3, [r3, #28]
    bc94:	e5933004 	ldr	r3, [r3, #4]
    bc98:	e3530000 	cmp	r3, #0
    bc9c:	1a000004 	bne	bcb4 <clear_task_mbox+0x110>
    bca0:	e51b3010 	ldr	r3, [fp, #-16]
    bca4:	e5933020 	ldr	r3, [r3, #32]
    bca8:	e5933004 	ldr	r3, [r3, #4]
    bcac:	e3530000 	cmp	r3, #0
    bcb0:	0a000002 	beq	bcc0 <clear_task_mbox+0x11c>
    bcb4:	e3a03004 	mov	r3, #4
    bcb8:	e50b3008 	str	r3, [fp, #-8]
    bcbc:	ea00000d 	b	bcf8 <clear_task_mbox+0x154>
    bcc0:	e51b3010 	ldr	r3, [fp, #-16]
    bcc4:	e3a02000 	mov	r2, #0
    bcc8:	e583200c 	str	r2, [r3, #12]
    bccc:	e51b3010 	ldr	r3, [fp, #-16]
    bcd0:	e593200c 	ldr	r2, [r3, #12]
    bcd4:	e51b3010 	ldr	r3, [fp, #-16]
    bcd8:	e5832008 	str	r2, [r3, #8]
    bcdc:	e51b3010 	ldr	r3, [fp, #-16]
    bce0:	e5932008 	ldr	r2, [r3, #8]
    bce4:	e51b3010 	ldr	r3, [fp, #-16]
    bce8:	e5832004 	str	r2, [r3, #4]
    bcec:	e51b3010 	ldr	r3, [fp, #-16]
    bcf0:	e3a02001 	mov	r2, #1
    bcf4:	e5832000 	str	r2, [r3]
    bcf8:	e51b000c 	ldr	r0, [fp, #-12]
    bcfc:	ebfff139 	bl	81e8 <set_enable>
    bd00:	e51b3008 	ldr	r3, [fp, #-8]
    bd04:	e1a00003 	mov	r0, r3
    bd08:	e24bd004 	sub	sp, fp, #4
    bd0c:	e8bd8800 	pop	{fp, pc}

0000bd10 <delete_task_mbox>:
    bd10:	e92d4800 	push	{fp, lr}
    bd14:	e28db004 	add	fp, sp, #4
    bd18:	e24dd018 	sub	sp, sp, #24
    bd1c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    bd20:	e3a03000 	mov	r3, #0
    bd24:	e50b3008 	str	r3, [fp, #-8]
    bd28:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    bd2c:	e3530000 	cmp	r3, #0
    bd30:	da00000a 	ble	bd60 <delete_task_mbox+0x50>
    bd34:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    bd38:	e30f3f08 	movw	r3, #65288	; 0xff08
    bd3c:	e3403000 	movt	r3, #0
    bd40:	e5933000 	ldr	r3, [r3]
    bd44:	e1520003 	cmp	r2, r3
    bd48:	8a000004 	bhi	bd60 <delete_task_mbox+0x50>
    bd4c:	e30f3eb8 	movw	r3, #65208	; 0xfeb8
    bd50:	e3403000 	movt	r3, #0
    bd54:	e5933000 	ldr	r3, [r3]
    bd58:	e3530001 	cmp	r3, #1
    bd5c:	1a000001 	bne	bd68 <delete_task_mbox+0x58>
    bd60:	e3a03001 	mov	r3, #1
    bd64:	ea00003e 	b	be64 <delete_task_mbox+0x154>
    bd68:	e30f3f38 	movw	r3, #65336	; 0xff38
    bd6c:	e3403000 	movt	r3, #0
    bd70:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    bd74:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    bd78:	e3530000 	cmp	r3, #0
    bd7c:	1a000001 	bne	bd88 <delete_task_mbox+0x78>
    bd80:	e3a03002 	mov	r3, #2
    bd84:	ea000036 	b	be64 <delete_task_mbox+0x154>
    bd88:	ebfff10c 	bl	81c0 <set_disable>
    bd8c:	e50b000c 	str	r0, [fp, #-12]
    bd90:	e30f3f38 	movw	r3, #65336	; 0xff38
    bd94:	e3403000 	movt	r3, #0
    bd98:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    bd9c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    bda0:	e5933074 	ldr	r3, [r3, #116]	; 0x74
    bda4:	e3530000 	cmp	r3, #0
    bda8:	1a000002 	bne	bdb8 <delete_task_mbox+0xa8>
    bdac:	e3a03003 	mov	r3, #3
    bdb0:	e50b3008 	str	r3, [fp, #-8]
    bdb4:	ea000027 	b	be58 <delete_task_mbox+0x148>
    bdb8:	e30f3f38 	movw	r3, #65336	; 0xff38
    bdbc:	e3403000 	movt	r3, #0
    bdc0:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    bdc4:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    bdc8:	e5933074 	ldr	r3, [r3, #116]	; 0x74
    bdcc:	e3530004 	cmp	r3, #4
    bdd0:	1a000002 	bne	bde0 <delete_task_mbox+0xd0>
    bdd4:	e3a03005 	mov	r3, #5
    bdd8:	e50b3008 	str	r3, [fp, #-8]
    bddc:	ea00001d 	b	be58 <delete_task_mbox+0x148>
    bde0:	e30f3f38 	movw	r3, #65336	; 0xff38
    bde4:	e3403000 	movt	r3, #0
    bde8:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    bdec:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    bdf0:	e2833074 	add	r3, r3, #116	; 0x74
    bdf4:	e50b3010 	str	r3, [fp, #-16]
    bdf8:	e51b3010 	ldr	r3, [fp, #-16]
    bdfc:	e593301c 	ldr	r3, [r3, #28]
    be00:	e5933004 	ldr	r3, [r3, #4]
    be04:	e3530000 	cmp	r3, #0
    be08:	1a000004 	bne	be20 <delete_task_mbox+0x110>
    be0c:	e51b3010 	ldr	r3, [fp, #-16]
    be10:	e5933020 	ldr	r3, [r3, #32]
    be14:	e5933004 	ldr	r3, [r3, #4]
    be18:	e3530000 	cmp	r3, #0
    be1c:	0a000002 	beq	be2c <delete_task_mbox+0x11c>
    be20:	e3a03004 	mov	r3, #4
    be24:	e50b3008 	str	r3, [fp, #-8]
    be28:	ea00000a 	b	be58 <delete_task_mbox+0x148>
    be2c:	e51b3010 	ldr	r3, [fp, #-16]
    be30:	e5933018 	ldr	r3, [r3, #24]
    be34:	e1a00003 	mov	r0, r3
    be38:	eb000ec1 	bl	f944 <free>
    be3c:	e3a02024 	mov	r2, #36	; 0x24
    be40:	e3a01000 	mov	r1, #0
    be44:	e51b0010 	ldr	r0, [fp, #-16]
    be48:	eb000f18 	bl	fab0 <memse>
    be4c:	e51b3010 	ldr	r3, [fp, #-16]
    be50:	e3a02000 	mov	r2, #0
    be54:	e5832000 	str	r2, [r3]
    be58:	e51b000c 	ldr	r0, [fp, #-12]
    be5c:	ebfff0e1 	bl	81e8 <set_enable>
    be60:	e51b3008 	ldr	r3, [fp, #-8]
    be64:	e1a00003 	mov	r0, r3
    be68:	e24bd004 	sub	sp, fp, #4
    be6c:	e8bd8800 	pop	{fp, pc}

0000be70 <task_mbox_messages>:
    be70:	e92d4800 	push	{fp, lr}
    be74:	e28db004 	add	fp, sp, #4
    be78:	e24dd018 	sub	sp, sp, #24
    be7c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    be80:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    be84:	e3530000 	cmp	r3, #0
    be88:	da00000a 	ble	beb8 <task_mbox_messages+0x48>
    be8c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    be90:	e30f3f08 	movw	r3, #65288	; 0xff08
    be94:	e3403000 	movt	r3, #0
    be98:	e5933000 	ldr	r3, [r3]
    be9c:	e1520003 	cmp	r2, r3
    bea0:	8a000004 	bhi	beb8 <task_mbox_messages+0x48>
    bea4:	e30f3eb8 	movw	r3, #65208	; 0xfeb8
    bea8:	e3403000 	movt	r3, #0
    beac:	e5933000 	ldr	r3, [r3]
    beb0:	e3530001 	cmp	r3, #1
    beb4:	1a000001 	bne	bec0 <task_mbox_messages+0x50>
    beb8:	e3e03000 	mvn	r3, #0
    bebc:	ea00001f 	b	bf40 <task_mbox_messages+0xd0>
    bec0:	e30f3f38 	movw	r3, #65336	; 0xff38
    bec4:	e3403000 	movt	r3, #0
    bec8:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    becc:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    bed0:	e3530000 	cmp	r3, #0
    bed4:	1a000001 	bne	bee0 <task_mbox_messages+0x70>
    bed8:	e3e03001 	mvn	r3, #1
    bedc:	ea000017 	b	bf40 <task_mbox_messages+0xd0>
    bee0:	ebfff0b6 	bl	81c0 <set_disable>
    bee4:	e50b000c 	str	r0, [fp, #-12]
    bee8:	e30f3f38 	movw	r3, #65336	; 0xff38
    beec:	e3403000 	movt	r3, #0
    bef0:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    bef4:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    bef8:	e5933074 	ldr	r3, [r3, #116]	; 0x74
    befc:	e3530000 	cmp	r3, #0
    bf00:	1a000002 	bne	bf10 <task_mbox_messages+0xa0>
    bf04:	e3e03002 	mvn	r3, #2
    bf08:	e50b3008 	str	r3, [fp, #-8]
    bf0c:	ea000008 	b	bf34 <task_mbox_messages+0xc4>
    bf10:	e30f3f38 	movw	r3, #65336	; 0xff38
    bf14:	e3403000 	movt	r3, #0
    bf18:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    bf1c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    bf20:	e2833074 	add	r3, r3, #116	; 0x74
    bf24:	e50b3010 	str	r3, [fp, #-16]
    bf28:	e51b3010 	ldr	r3, [fp, #-16]
    bf2c:	e593300c 	ldr	r3, [r3, #12]
    bf30:	e50b3008 	str	r3, [fp, #-8]
    bf34:	e51b000c 	ldr	r0, [fp, #-12]
    bf38:	ebfff0aa 	bl	81e8 <set_enable>
    bf3c:	e51b3008 	ldr	r3, [fp, #-8]
    bf40:	e1a00003 	mov	r0, r3
    bf44:	e24bd004 	sub	sp, fp, #4
    bf48:	e8bd8800 	pop	{fp, pc}

0000bf4c <send_task_message>:
    bf4c:	e92d4800 	push	{fp, lr}
    bf50:	e28db004 	add	fp, sp, #4
    bf54:	e24dd020 	sub	sp, sp, #32
    bf58:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    bf5c:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    bf60:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    bf64:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    bf68:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    bf6c:	e3530000 	cmp	r3, #0
    bf70:	da00000a 	ble	bfa0 <send_task_message+0x54>
    bf74:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    bf78:	e30f3f08 	movw	r3, #65288	; 0xff08
    bf7c:	e3403000 	movt	r3, #0
    bf80:	e5933000 	ldr	r3, [r3]
    bf84:	e1520003 	cmp	r2, r3
    bf88:	8a000004 	bhi	bfa0 <send_task_message+0x54>
    bf8c:	e30f3eb8 	movw	r3, #65208	; 0xfeb8
    bf90:	e3403000 	movt	r3, #0
    bf94:	e5933000 	ldr	r3, [r3]
    bf98:	e3530001 	cmp	r3, #1
    bf9c:	1a000001 	bne	bfa8 <send_task_message+0x5c>
    bfa0:	e3e03000 	mvn	r3, #0
    bfa4:	ea000070 	b	c16c <send_task_message+0x220>
    bfa8:	e30f3f38 	movw	r3, #65336	; 0xff38
    bfac:	e3403000 	movt	r3, #0
    bfb0:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    bfb4:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    bfb8:	e3530000 	cmp	r3, #0
    bfbc:	1a000001 	bne	bfc8 <send_task_message+0x7c>
    bfc0:	e3e03001 	mvn	r3, #1
    bfc4:	ea000068 	b	c16c <send_task_message+0x220>
    bfc8:	ebfff07c 	bl	81c0 <set_disable>
    bfcc:	e50b000c 	str	r0, [fp, #-12]
    bfd0:	e30f3f38 	movw	r3, #65336	; 0xff38
    bfd4:	e3403000 	movt	r3, #0
    bfd8:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    bfdc:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    bfe0:	e5933074 	ldr	r3, [r3, #116]	; 0x74
    bfe4:	e50b3010 	str	r3, [fp, #-16]
    bfe8:	e51b3010 	ldr	r3, [fp, #-16]
    bfec:	e3530000 	cmp	r3, #0
    bff0:	1a000003 	bne	c004 <send_task_message+0xb8>
    bff4:	e51b000c 	ldr	r0, [fp, #-12]
    bff8:	ebfff07a 	bl	81e8 <set_enable>
    bffc:	e3e03002 	mvn	r3, #2
    c000:	ea000059 	b	c16c <send_task_message+0x220>
    c004:	e30f3f38 	movw	r3, #65336	; 0xff38
    c008:	e3403000 	movt	r3, #0
    c00c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    c010:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    c014:	e3a02004 	mov	r2, #4
    c018:	e5832074 	str	r2, [r3, #116]	; 0x74
    c01c:	e51b000c 	ldr	r0, [fp, #-12]
    c020:	ebfff070 	bl	81e8 <set_enable>
    c024:	e30f3f38 	movw	r3, #65336	; 0xff38
    c028:	e3403000 	movt	r3, #0
    c02c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    c030:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    c034:	e2833074 	add	r3, r3, #116	; 0x74
    c038:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    c03c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c040:	e5933014 	ldr	r3, [r3, #20]
    c044:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    c048:	e1520003 	cmp	r2, r3
    c04c:	da000002 	ble	c05c <send_task_message+0x110>
    c050:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c054:	e5933014 	ldr	r3, [r3, #20]
    c058:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    c05c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c060:	e593301c 	ldr	r3, [r3, #28]
    c064:	e1a00003 	mov	r0, r3
    c068:	ebfff541 	bl	9574 <rsvsm>
    c06c:	ebfff053 	bl	81c0 <set_disable>
    c070:	e50b000c 	str	r0, [fp, #-12]
    c074:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    c078:	e3530000 	cmp	r3, #0
    c07c:	1a00000c 	bne	c0b4 <send_task_message+0x168>
    c080:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c084:	e5933008 	ldr	r3, [r3, #8]
    c088:	e50b3008 	str	r3, [fp, #-8]
    c08c:	e51b3008 	ldr	r3, [fp, #-8]
    c090:	e2833001 	add	r3, r3, #1
    c094:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    c098:	e5922010 	ldr	r2, [r2, #16]
    c09c:	e711f213 	sdiv	r1, r3, r2
    c0a0:	e0020192 	mul	r2, r2, r1
    c0a4:	e0432002 	sub	r2, r3, r2
    c0a8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c0ac:	e5832008 	str	r2, [r3, #8]
    c0b0:	ea000011 	b	c0fc <send_task_message+0x1b0>
    c0b4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c0b8:	e5933004 	ldr	r3, [r3, #4]
    c0bc:	e3530000 	cmp	r3, #0
    c0c0:	0a000005 	beq	c0dc <send_task_message+0x190>
    c0c4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c0c8:	e5933004 	ldr	r3, [r3, #4]
    c0cc:	e2432001 	sub	r2, r3, #1
    c0d0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c0d4:	e5832004 	str	r2, [r3, #4]
    c0d8:	ea000004 	b	c0f0 <send_task_message+0x1a4>
    c0dc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c0e0:	e5933010 	ldr	r3, [r3, #16]
    c0e4:	e2432001 	sub	r2, r3, #1
    c0e8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c0ec:	e5832004 	str	r2, [r3, #4]
    c0f0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c0f4:	e5933004 	ldr	r3, [r3, #4]
    c0f8:	e50b3008 	str	r3, [fp, #-8]
    c0fc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c100:	e5932018 	ldr	r2, [r3, #24]
    c104:	e51b3008 	ldr	r3, [fp, #-8]
    c108:	e1a03103 	lsl	r3, r3, #2
    c10c:	e0823003 	add	r3, r2, r3
    c110:	e5933000 	ldr	r3, [r3]
    c114:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    c118:	e51b1020 	ldr	r1, [fp, #-32]	; 0xffffffe0
    c11c:	e1a00003 	mov	r0, r3
    c120:	eb000e45 	bl	fa3c <memcp>
    c124:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c128:	e593300c 	ldr	r3, [r3, #12]
    c12c:	e2832001 	add	r2, r3, #1
    c130:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c134:	e583200c 	str	r2, [r3, #12]
    c138:	e51b000c 	ldr	r0, [fp, #-12]
    c13c:	ebfff029 	bl	81e8 <set_enable>
    c140:	e30f3f38 	movw	r3, #65336	; 0xff38
    c144:	e3403000 	movt	r3, #0
    c148:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    c14c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    c150:	e51b2010 	ldr	r2, [fp, #-16]
    c154:	e5832074 	str	r2, [r3, #116]	; 0x74
    c158:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c15c:	e5933020 	ldr	r3, [r3, #32]
    c160:	e1a00003 	mov	r0, r3
    c164:	ebfff569 	bl	9710 <rlsm>
    c168:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    c16c:	e1a00003 	mov	r0, r3
    c170:	e24bd004 	sub	sp, fp, #4
    c174:	e8bd8800 	pop	{fp, pc}

0000c178 <send_cond_task_message>:
    c178:	e92d4800 	push	{fp, lr}
    c17c:	e28db004 	add	fp, sp, #4
    c180:	e24dd020 	sub	sp, sp, #32
    c184:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    c188:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    c18c:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    c190:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    c194:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    c198:	e3530000 	cmp	r3, #0
    c19c:	da00000a 	ble	c1cc <send_cond_task_message+0x54>
    c1a0:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    c1a4:	e30f3f08 	movw	r3, #65288	; 0xff08
    c1a8:	e3403000 	movt	r3, #0
    c1ac:	e5933000 	ldr	r3, [r3]
    c1b0:	e1520003 	cmp	r2, r3
    c1b4:	8a000004 	bhi	c1cc <send_cond_task_message+0x54>
    c1b8:	e30f3eb8 	movw	r3, #65208	; 0xfeb8
    c1bc:	e3403000 	movt	r3, #0
    c1c0:	e5933000 	ldr	r3, [r3]
    c1c4:	e3530001 	cmp	r3, #1
    c1c8:	1a000001 	bne	c1d4 <send_cond_task_message+0x5c>
    c1cc:	e3e03000 	mvn	r3, #0
    c1d0:	ea000068 	b	c378 <send_cond_task_message+0x200>
    c1d4:	e30f3f38 	movw	r3, #65336	; 0xff38
    c1d8:	e3403000 	movt	r3, #0
    c1dc:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    c1e0:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    c1e4:	e3530000 	cmp	r3, #0
    c1e8:	1a000001 	bne	c1f4 <send_cond_task_message+0x7c>
    c1ec:	e3e03001 	mvn	r3, #1
    c1f0:	ea000060 	b	c378 <send_cond_task_message+0x200>
    c1f4:	ebffeff1 	bl	81c0 <set_disable>
    c1f8:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
    c1fc:	e30f3f38 	movw	r3, #65336	; 0xff38
    c200:	e3403000 	movt	r3, #0
    c204:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    c208:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    c20c:	e5933074 	ldr	r3, [r3, #116]	; 0x74
    c210:	e3530000 	cmp	r3, #0
    c214:	1a000002 	bne	c224 <send_cond_task_message+0xac>
    c218:	e3e03002 	mvn	r3, #2
    c21c:	e50b3008 	str	r3, [fp, #-8]
    c220:	ea00004d 	b	c35c <send_cond_task_message+0x1e4>
    c224:	e30f3f38 	movw	r3, #65336	; 0xff38
    c228:	e3403000 	movt	r3, #0
    c22c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    c230:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    c234:	e2833074 	add	r3, r3, #116	; 0x74
    c238:	e50b3010 	str	r3, [fp, #-16]
    c23c:	e51b3010 	ldr	r3, [fp, #-16]
    c240:	e593200c 	ldr	r2, [r3, #12]
    c244:	e51b3010 	ldr	r3, [fp, #-16]
    c248:	e5933010 	ldr	r3, [r3, #16]
    c24c:	e1520003 	cmp	r2, r3
    c250:	1a000002 	bne	c260 <send_cond_task_message+0xe8>
    c254:	e3e03003 	mvn	r3, #3
    c258:	e50b3008 	str	r3, [fp, #-8]
    c25c:	ea00003e 	b	c35c <send_cond_task_message+0x1e4>
    c260:	e51b3010 	ldr	r3, [fp, #-16]
    c264:	e5933014 	ldr	r3, [r3, #20]
    c268:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    c26c:	e1520003 	cmp	r2, r3
    c270:	da000002 	ble	c280 <send_cond_task_message+0x108>
    c274:	e51b3010 	ldr	r3, [fp, #-16]
    c278:	e5933014 	ldr	r3, [r3, #20]
    c27c:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    c280:	e51b3010 	ldr	r3, [fp, #-16]
    c284:	e593301c 	ldr	r3, [r3, #28]
    c288:	e1a00003 	mov	r0, r3
    c28c:	ebfff4b8 	bl	9574 <rsvsm>
    c290:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    c294:	e3530000 	cmp	r3, #0
    c298:	1a00000c 	bne	c2d0 <send_cond_task_message+0x158>
    c29c:	e51b3010 	ldr	r3, [fp, #-16]
    c2a0:	e5933008 	ldr	r3, [r3, #8]
    c2a4:	e50b300c 	str	r3, [fp, #-12]
    c2a8:	e51b300c 	ldr	r3, [fp, #-12]
    c2ac:	e2833001 	add	r3, r3, #1
    c2b0:	e51b2010 	ldr	r2, [fp, #-16]
    c2b4:	e5922010 	ldr	r2, [r2, #16]
    c2b8:	e711f213 	sdiv	r1, r3, r2
    c2bc:	e0020192 	mul	r2, r2, r1
    c2c0:	e0432002 	sub	r2, r3, r2
    c2c4:	e51b3010 	ldr	r3, [fp, #-16]
    c2c8:	e5832008 	str	r2, [r3, #8]
    c2cc:	ea000011 	b	c318 <send_cond_task_message+0x1a0>
    c2d0:	e51b3010 	ldr	r3, [fp, #-16]
    c2d4:	e5933004 	ldr	r3, [r3, #4]
    c2d8:	e3530000 	cmp	r3, #0
    c2dc:	0a000005 	beq	c2f8 <send_cond_task_message+0x180>
    c2e0:	e51b3010 	ldr	r3, [fp, #-16]
    c2e4:	e5933004 	ldr	r3, [r3, #4]
    c2e8:	e2432001 	sub	r2, r3, #1
    c2ec:	e51b3010 	ldr	r3, [fp, #-16]
    c2f0:	e5832004 	str	r2, [r3, #4]
    c2f4:	ea000004 	b	c30c <send_cond_task_message+0x194>
    c2f8:	e51b3010 	ldr	r3, [fp, #-16]
    c2fc:	e5933010 	ldr	r3, [r3, #16]
    c300:	e2432001 	sub	r2, r3, #1
    c304:	e51b3010 	ldr	r3, [fp, #-16]
    c308:	e5832004 	str	r2, [r3, #4]
    c30c:	e51b3010 	ldr	r3, [fp, #-16]
    c310:	e5933004 	ldr	r3, [r3, #4]
    c314:	e50b300c 	str	r3, [fp, #-12]
    c318:	e51b3010 	ldr	r3, [fp, #-16]
    c31c:	e5932018 	ldr	r2, [r3, #24]
    c320:	e51b300c 	ldr	r3, [fp, #-12]
    c324:	e1a03103 	lsl	r3, r3, #2
    c328:	e0823003 	add	r3, r2, r3
    c32c:	e5933000 	ldr	r3, [r3]
    c330:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    c334:	e51b1020 	ldr	r1, [fp, #-32]	; 0xffffffe0
    c338:	e1a00003 	mov	r0, r3
    c33c:	eb000dbe 	bl	fa3c <memcp>
    c340:	e51b3010 	ldr	r3, [fp, #-16]
    c344:	e593300c 	ldr	r3, [r3, #12]
    c348:	e2832001 	add	r2, r3, #1
    c34c:	e51b3010 	ldr	r3, [fp, #-16]
    c350:	e583200c 	str	r2, [r3, #12]
    c354:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    c358:	e50b3008 	str	r3, [fp, #-8]
    c35c:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    c360:	ebffefa0 	bl	81e8 <set_enable>
    c364:	e51b3010 	ldr	r3, [fp, #-16]
    c368:	e5933020 	ldr	r3, [r3, #32]
    c36c:	e1a00003 	mov	r0, r3
    c370:	ebfff4e6 	bl	9710 <rlsm>
    c374:	e51b3008 	ldr	r3, [fp, #-8]
    c378:	e1a00003 	mov	r0, r3
    c37c:	e24bd004 	sub	sp, fp, #4
    c380:	e8bd8800 	pop	{fp, pc}

0000c384 <get_task_message>:
    c384:	e92d4800 	push	{fp, lr}
    c388:	e28db004 	add	fp, sp, #4
    c38c:	e24dd018 	sub	sp, sp, #24
    c390:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    c394:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    c398:	ebfff07b 	bl	858c <gethandler>
    c39c:	e50b0008 	str	r0, [fp, #-8]
    c3a0:	e51b3008 	ldr	r3, [fp, #-8]
    c3a4:	e3530000 	cmp	r3, #0
    c3a8:	da00000a 	ble	c3d8 <get_task_message+0x54>
    c3ac:	e51b2008 	ldr	r2, [fp, #-8]
    c3b0:	e30f3f08 	movw	r3, #65288	; 0xff08
    c3b4:	e3403000 	movt	r3, #0
    c3b8:	e5933000 	ldr	r3, [r3]
    c3bc:	e1520003 	cmp	r2, r3
    c3c0:	8a000004 	bhi	c3d8 <get_task_message+0x54>
    c3c4:	e30f3eb8 	movw	r3, #65208	; 0xfeb8
    c3c8:	e3403000 	movt	r3, #0
    c3cc:	e5933000 	ldr	r3, [r3]
    c3d0:	e3530001 	cmp	r3, #1
    c3d4:	1a000001 	bne	c3e0 <get_task_message+0x5c>
    c3d8:	e3e03000 	mvn	r3, #0
    c3dc:	ea000059 	b	c548 <get_task_message+0x1c4>
    c3e0:	e30f3f38 	movw	r3, #65336	; 0xff38
    c3e4:	e3403000 	movt	r3, #0
    c3e8:	e51b2008 	ldr	r2, [fp, #-8]
    c3ec:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    c3f0:	e3530000 	cmp	r3, #0
    c3f4:	1a000001 	bne	c400 <get_task_message+0x7c>
    c3f8:	e3e03001 	mvn	r3, #1
    c3fc:	ea000051 	b	c548 <get_task_message+0x1c4>
    c400:	ebffef6e 	bl	81c0 <set_disable>
    c404:	e50b000c 	str	r0, [fp, #-12]
    c408:	e30f3f38 	movw	r3, #65336	; 0xff38
    c40c:	e3403000 	movt	r3, #0
    c410:	e51b2008 	ldr	r2, [fp, #-8]
    c414:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    c418:	e5933074 	ldr	r3, [r3, #116]	; 0x74
    c41c:	e50b3010 	str	r3, [fp, #-16]
    c420:	e51b3010 	ldr	r3, [fp, #-16]
    c424:	e3530000 	cmp	r3, #0
    c428:	1a000003 	bne	c43c <get_task_message+0xb8>
    c42c:	e51b000c 	ldr	r0, [fp, #-12]
    c430:	ebffef6c 	bl	81e8 <set_enable>
    c434:	e3e03002 	mvn	r3, #2
    c438:	ea000042 	b	c548 <get_task_message+0x1c4>
    c43c:	e30f3f38 	movw	r3, #65336	; 0xff38
    c440:	e3403000 	movt	r3, #0
    c444:	e51b2008 	ldr	r2, [fp, #-8]
    c448:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    c44c:	e3a02004 	mov	r2, #4
    c450:	e5832074 	str	r2, [r3, #116]	; 0x74
    c454:	e51b000c 	ldr	r0, [fp, #-12]
    c458:	ebffef62 	bl	81e8 <set_enable>
    c45c:	e30f3f38 	movw	r3, #65336	; 0xff38
    c460:	e3403000 	movt	r3, #0
    c464:	e51b2008 	ldr	r2, [fp, #-8]
    c468:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    c46c:	e2833074 	add	r3, r3, #116	; 0x74
    c470:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    c474:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c478:	e5933014 	ldr	r3, [r3, #20]
    c47c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    c480:	e1520003 	cmp	r2, r3
    c484:	da000002 	ble	c494 <get_task_message+0x110>
    c488:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c48c:	e5933014 	ldr	r3, [r3, #20]
    c490:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    c494:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c498:	e5933020 	ldr	r3, [r3, #32]
    c49c:	e1a00003 	mov	r0, r3
    c4a0:	ebfff433 	bl	9574 <rsvsm>
    c4a4:	ebffef45 	bl	81c0 <set_disable>
    c4a8:	e50b000c 	str	r0, [fp, #-12]
    c4ac:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c4b0:	e5932018 	ldr	r2, [r3, #24]
    c4b4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c4b8:	e5933004 	ldr	r3, [r3, #4]
    c4bc:	e1a03103 	lsl	r3, r3, #2
    c4c0:	e0823003 	add	r3, r2, r3
    c4c4:	e5933000 	ldr	r3, [r3]
    c4c8:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    c4cc:	e1a01003 	mov	r1, r3
    c4d0:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    c4d4:	eb000d58 	bl	fa3c <memcp>
    c4d8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c4dc:	e5933004 	ldr	r3, [r3, #4]
    c4e0:	e2833001 	add	r3, r3, #1
    c4e4:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    c4e8:	e5922010 	ldr	r2, [r2, #16]
    c4ec:	e711f213 	sdiv	r1, r3, r2
    c4f0:	e0020192 	mul	r2, r2, r1
    c4f4:	e0432002 	sub	r2, r3, r2
    c4f8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c4fc:	e5832004 	str	r2, [r3, #4]
    c500:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c504:	e593300c 	ldr	r3, [r3, #12]
    c508:	e2432001 	sub	r2, r3, #1
    c50c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c510:	e583200c 	str	r2, [r3, #12]
    c514:	e30f3f38 	movw	r3, #65336	; 0xff38
    c518:	e3403000 	movt	r3, #0
    c51c:	e51b2008 	ldr	r2, [fp, #-8]
    c520:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    c524:	e51b2010 	ldr	r2, [fp, #-16]
    c528:	e5832074 	str	r2, [r3, #116]	; 0x74
    c52c:	e51b000c 	ldr	r0, [fp, #-12]
    c530:	ebffef2c 	bl	81e8 <set_enable>
    c534:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c538:	e593301c 	ldr	r3, [r3, #28]
    c53c:	e1a00003 	mov	r0, r3
    c540:	ebfff472 	bl	9710 <rlsm>
    c544:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    c548:	e1a00003 	mov	r0, r3
    c54c:	e24bd004 	sub	sp, fp, #4
    c550:	e8bd8800 	pop	{fp, pc}

0000c554 <get_cond_task_message>:
    c554:	e92d4800 	push	{fp, lr}
    c558:	e28db004 	add	fp, sp, #4
    c55c:	e24dd018 	sub	sp, sp, #24
    c560:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    c564:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    c568:	ebfff007 	bl	858c <gethandler>
    c56c:	e50b0010 	str	r0, [fp, #-16]
    c570:	e51b3010 	ldr	r3, [fp, #-16]
    c574:	e3530000 	cmp	r3, #0
    c578:	da00000a 	ble	c5a8 <get_cond_task_message+0x54>
    c57c:	e51b2010 	ldr	r2, [fp, #-16]
    c580:	e30f3f08 	movw	r3, #65288	; 0xff08
    c584:	e3403000 	movt	r3, #0
    c588:	e5933000 	ldr	r3, [r3]
    c58c:	e1520003 	cmp	r2, r3
    c590:	8a000004 	bhi	c5a8 <get_cond_task_message+0x54>
    c594:	e30f3eb8 	movw	r3, #65208	; 0xfeb8
    c598:	e3403000 	movt	r3, #0
    c59c:	e5933000 	ldr	r3, [r3]
    c5a0:	e3530001 	cmp	r3, #1
    c5a4:	1a000001 	bne	c5b0 <get_cond_task_message+0x5c>
    c5a8:	e3e03000 	mvn	r3, #0
    c5ac:	ea00004f 	b	c6f0 <get_cond_task_message+0x19c>
    c5b0:	e30f3f38 	movw	r3, #65336	; 0xff38
    c5b4:	e3403000 	movt	r3, #0
    c5b8:	e51b2010 	ldr	r2, [fp, #-16]
    c5bc:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    c5c0:	e3530000 	cmp	r3, #0
    c5c4:	1a000001 	bne	c5d0 <get_cond_task_message+0x7c>
    c5c8:	e3e03001 	mvn	r3, #1
    c5cc:	ea000047 	b	c6f0 <get_cond_task_message+0x19c>
    c5d0:	ebffeefa 	bl	81c0 <set_disable>
    c5d4:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
    c5d8:	e30f3f38 	movw	r3, #65336	; 0xff38
    c5dc:	e3403000 	movt	r3, #0
    c5e0:	e51b2010 	ldr	r2, [fp, #-16]
    c5e4:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    c5e8:	e5933074 	ldr	r3, [r3, #116]	; 0x74
    c5ec:	e3530000 	cmp	r3, #0
    c5f0:	1a000002 	bne	c600 <get_cond_task_message+0xac>
    c5f4:	e3e03002 	mvn	r3, #2
    c5f8:	e50b3008 	str	r3, [fp, #-8]
    c5fc:	ea000034 	b	c6d4 <get_cond_task_message+0x180>
    c600:	e30f3f38 	movw	r3, #65336	; 0xff38
    c604:	e3403000 	movt	r3, #0
    c608:	e51b2010 	ldr	r2, [fp, #-16]
    c60c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    c610:	e2833074 	add	r3, r3, #116	; 0x74
    c614:	e50b300c 	str	r3, [fp, #-12]
    c618:	e51b300c 	ldr	r3, [fp, #-12]
    c61c:	e593300c 	ldr	r3, [r3, #12]
    c620:	e3530000 	cmp	r3, #0
    c624:	1a000002 	bne	c634 <get_cond_task_message+0xe0>
    c628:	e3e03003 	mvn	r3, #3
    c62c:	e50b3008 	str	r3, [fp, #-8]
    c630:	ea000027 	b	c6d4 <get_cond_task_message+0x180>
    c634:	e51b300c 	ldr	r3, [fp, #-12]
    c638:	e5933014 	ldr	r3, [r3, #20]
    c63c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    c640:	e1520003 	cmp	r2, r3
    c644:	da000002 	ble	c654 <get_cond_task_message+0x100>
    c648:	e51b300c 	ldr	r3, [fp, #-12]
    c64c:	e5933014 	ldr	r3, [r3, #20]
    c650:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    c654:	e51b300c 	ldr	r3, [fp, #-12]
    c658:	e5933020 	ldr	r3, [r3, #32]
    c65c:	e1a00003 	mov	r0, r3
    c660:	ebfff3c3 	bl	9574 <rsvsm>
    c664:	e51b300c 	ldr	r3, [fp, #-12]
    c668:	e5932018 	ldr	r2, [r3, #24]
    c66c:	e51b300c 	ldr	r3, [fp, #-12]
    c670:	e5933004 	ldr	r3, [r3, #4]
    c674:	e1a03103 	lsl	r3, r3, #2
    c678:	e0823003 	add	r3, r2, r3
    c67c:	e5933000 	ldr	r3, [r3]
    c680:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    c684:	e1a01003 	mov	r1, r3
    c688:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    c68c:	eb000cea 	bl	fa3c <memcp>
    c690:	e51b300c 	ldr	r3, [fp, #-12]
    c694:	e5933004 	ldr	r3, [r3, #4]
    c698:	e2833001 	add	r3, r3, #1
    c69c:	e51b200c 	ldr	r2, [fp, #-12]
    c6a0:	e5922010 	ldr	r2, [r2, #16]
    c6a4:	e711f213 	sdiv	r1, r3, r2
    c6a8:	e0020192 	mul	r2, r2, r1
    c6ac:	e0432002 	sub	r2, r3, r2
    c6b0:	e51b300c 	ldr	r3, [fp, #-12]
    c6b4:	e5832004 	str	r2, [r3, #4]
    c6b8:	e51b300c 	ldr	r3, [fp, #-12]
    c6bc:	e593300c 	ldr	r3, [r3, #12]
    c6c0:	e2432001 	sub	r2, r3, #1
    c6c4:	e51b300c 	ldr	r3, [fp, #-12]
    c6c8:	e583200c 	str	r2, [r3, #12]
    c6cc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    c6d0:	e50b3008 	str	r3, [fp, #-8]
    c6d4:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    c6d8:	ebffeec2 	bl	81e8 <set_enable>
    c6dc:	e51b300c 	ldr	r3, [fp, #-12]
    c6e0:	e5933020 	ldr	r3, [r3, #32]
    c6e4:	e1a00003 	mov	r0, r3
    c6e8:	ebfff408 	bl	9710 <rlsm>
    c6ec:	e51b3008 	ldr	r3, [fp, #-8]
    c6f0:	e1a00003 	mov	r0, r3
    c6f4:	e24bd004 	sub	sp, fp, #4
    c6f8:	e8bd8800 	pop	{fp, pc}

0000c6fc <read_task_message>:
    c6fc:	e92d4800 	push	{fp, lr}
    c700:	e28db004 	add	fp, sp, #4
    c704:	e24dd018 	sub	sp, sp, #24
    c708:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    c70c:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    c710:	ebffef9d 	bl	858c <gethandler>
    c714:	e50b000c 	str	r0, [fp, #-12]
    c718:	e51b300c 	ldr	r3, [fp, #-12]
    c71c:	e3530000 	cmp	r3, #0
    c720:	da00000a 	ble	c750 <read_task_message+0x54>
    c724:	e51b200c 	ldr	r2, [fp, #-12]
    c728:	e30f3f08 	movw	r3, #65288	; 0xff08
    c72c:	e3403000 	movt	r3, #0
    c730:	e5933000 	ldr	r3, [r3]
    c734:	e1520003 	cmp	r2, r3
    c738:	8a000004 	bhi	c750 <read_task_message+0x54>
    c73c:	e30f3eb8 	movw	r3, #65208	; 0xfeb8
    c740:	e3403000 	movt	r3, #0
    c744:	e5933000 	ldr	r3, [r3]
    c748:	e3530001 	cmp	r3, #1
    c74c:	1a000001 	bne	c758 <read_task_message+0x5c>
    c750:	e3e03000 	mvn	r3, #0
    c754:	ea000038 	b	c83c <read_task_message+0x140>
    c758:	e30f3f38 	movw	r3, #65336	; 0xff38
    c75c:	e3403000 	movt	r3, #0
    c760:	e51b200c 	ldr	r2, [fp, #-12]
    c764:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    c768:	e3530000 	cmp	r3, #0
    c76c:	1a000001 	bne	c778 <read_task_message+0x7c>
    c770:	e3e03001 	mvn	r3, #1
    c774:	ea000030 	b	c83c <read_task_message+0x140>
    c778:	ebffee90 	bl	81c0 <set_disable>
    c77c:	e50b0010 	str	r0, [fp, #-16]
    c780:	e30f3f38 	movw	r3, #65336	; 0xff38
    c784:	e3403000 	movt	r3, #0
    c788:	e51b200c 	ldr	r2, [fp, #-12]
    c78c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    c790:	e5933074 	ldr	r3, [r3, #116]	; 0x74
    c794:	e3530000 	cmp	r3, #0
    c798:	0a000022 	beq	c828 <read_task_message+0x12c>
    c79c:	e30f3f38 	movw	r3, #65336	; 0xff38
    c7a0:	e3403000 	movt	r3, #0
    c7a4:	e51b200c 	ldr	r2, [fp, #-12]
    c7a8:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    c7ac:	e2833074 	add	r3, r3, #116	; 0x74
    c7b0:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    c7b4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c7b8:	e5933014 	ldr	r3, [r3, #20]
    c7bc:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    c7c0:	e1520003 	cmp	r2, r3
    c7c4:	da000002 	ble	c7d4 <read_task_message+0xd8>
    c7c8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c7cc:	e5933014 	ldr	r3, [r3, #20]
    c7d0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    c7d4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c7d8:	e593300c 	ldr	r3, [r3, #12]
    c7dc:	e3530000 	cmp	r3, #0
    c7e0:	0a00000d 	beq	c81c <read_task_message+0x120>
    c7e4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c7e8:	e5932018 	ldr	r2, [r3, #24]
    c7ec:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c7f0:	e5933004 	ldr	r3, [r3, #4]
    c7f4:	e1a03103 	lsl	r3, r3, #2
    c7f8:	e0823003 	add	r3, r2, r3
    c7fc:	e5933000 	ldr	r3, [r3]
    c800:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    c804:	e1a01003 	mov	r1, r3
    c808:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    c80c:	eb000c8a 	bl	fa3c <memcp>
    c810:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    c814:	e50b3008 	str	r3, [fp, #-8]
    c818:	ea000004 	b	c830 <read_task_message+0x134>
    c81c:	e3e03003 	mvn	r3, #3
    c820:	e50b3008 	str	r3, [fp, #-8]
    c824:	ea000001 	b	c830 <read_task_message+0x134>
    c828:	e3e03002 	mvn	r3, #2
    c82c:	e50b3008 	str	r3, [fp, #-8]
    c830:	e51b0010 	ldr	r0, [fp, #-16]
    c834:	ebffee6b 	bl	81e8 <set_enable>
    c838:	e51b3008 	ldr	r3, [fp, #-8]
    c83c:	e1a00003 	mov	r0, r3
    c840:	e24bd004 	sub	sp, fp, #4
    c844:	e8bd8800 	pop	{fp, pc}

0000c848 <create_mbox>:
    c848:	e92d4800 	push	{fp, lr}
    c84c:	e28db004 	add	fp, sp, #4
    c850:	e24dd018 	sub	sp, sp, #24
    c854:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    c858:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    c85c:	e24dd004 	sub	sp, sp, #4
    c860:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    c864:	e10f0000 	mrs	r0, CPSR
    c868:	e58d0004 	str	r0, [sp, #4]
    c86c:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    c870:	e3003334 	movw	r3, #820	; 0x334
    c874:	e3403001 	movt	r3, #1
    c878:	e5933000 	ldr	r3, [r3]
    c87c:	e2832001 	add	r2, r3, #1
    c880:	e3003334 	movw	r3, #820	; 0x334
    c884:	e3403001 	movt	r3, #1
    c888:	e5832000 	str	r2, [r3]
    c88c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    c890:	e59d0004 	ldr	r0, [sp, #4]
    c894:	e129f000 	msr	CPSR_fc, r0
    c898:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    c89c:	e28dd004 	add	sp, sp, #4
    c8a0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    c8a4:	e2833009 	add	r3, r3, #9
    c8a8:	e1a02103 	lsl	r2, r3, #2
    c8ac:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    c8b0:	e51b101c 	ldr	r1, [fp, #-28]	; 0xffffffe4
    c8b4:	e0030391 	mul	r3, r1, r3
    c8b8:	e0823003 	add	r3, r2, r3
    c8bc:	e2833018 	add	r3, r3, #24
    c8c0:	e1a00003 	mov	r0, r3
    c8c4:	eb000bd2 	bl	f814 <malloc>
    c8c8:	e1a03000 	mov	r3, r0
    c8cc:	e50b3010 	str	r3, [fp, #-16]
    c8d0:	e51b3010 	ldr	r3, [fp, #-16]
    c8d4:	e3530000 	cmp	r3, #0
    c8d8:	1a000013 	bne	c92c <create_mbox+0xe4>
    c8dc:	e24dd004 	sub	sp, sp, #4
    c8e0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    c8e4:	e10f0000 	mrs	r0, CPSR
    c8e8:	e58d0004 	str	r0, [sp, #4]
    c8ec:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    c8f0:	e3003334 	movw	r3, #820	; 0x334
    c8f4:	e3403001 	movt	r3, #1
    c8f8:	e5933000 	ldr	r3, [r3]
    c8fc:	e2432001 	sub	r2, r3, #1
    c900:	e3003334 	movw	r3, #820	; 0x334
    c904:	e3403001 	movt	r3, #1
    c908:	e5832000 	str	r2, [r3]
    c90c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    c910:	e59d0004 	ldr	r0, [sp, #4]
    c914:	e129f000 	msr	CPSR_fc, r0
    c918:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    c91c:	e28dd004 	add	sp, sp, #4
    c920:	e3a03000 	mov	r3, #0
    c924:	e50b300c 	str	r3, [fp, #-12]
    c928:	ea00004f 	b	ca6c <create_mbox+0x224>
    c92c:	e24dd004 	sub	sp, sp, #4
    c930:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    c934:	e10f0000 	mrs	r0, CPSR
    c938:	e58d0004 	str	r0, [sp, #4]
    c93c:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    c940:	e3003334 	movw	r3, #820	; 0x334
    c944:	e3403001 	movt	r3, #1
    c948:	e5933000 	ldr	r3, [r3]
    c94c:	e2432001 	sub	r2, r3, #1
    c950:	e3003334 	movw	r3, #820	; 0x334
    c954:	e3403001 	movt	r3, #1
    c958:	e5832000 	str	r2, [r3]
    c95c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    c960:	e59d0004 	ldr	r0, [sp, #4]
    c964:	e129f000 	msr	CPSR_fc, r0
    c968:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    c96c:	e28dd004 	add	sp, sp, #4
    c970:	e51b3010 	ldr	r3, [fp, #-16]
    c974:	e50b300c 	str	r3, [fp, #-12]
    c978:	e51b3010 	ldr	r3, [fp, #-16]
    c97c:	e2833024 	add	r3, r3, #36	; 0x24
    c980:	e50b3010 	str	r3, [fp, #-16]
    c984:	e51b300c 	ldr	r3, [fp, #-12]
    c988:	e51b2010 	ldr	r2, [fp, #-16]
    c98c:	e5832018 	str	r2, [r3, #24]
    c990:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    c994:	e1a03103 	lsl	r3, r3, #2
    c998:	e51b2010 	ldr	r2, [fp, #-16]
    c99c:	e0823003 	add	r3, r2, r3
    c9a0:	e50b3010 	str	r3, [fp, #-16]
    c9a4:	e3a03000 	mov	r3, #0
    c9a8:	e50b3008 	str	r3, [fp, #-8]
    c9ac:	ea00000d 	b	c9e8 <create_mbox+0x1a0>
    c9b0:	e51b300c 	ldr	r3, [fp, #-12]
    c9b4:	e5932018 	ldr	r2, [r3, #24]
    c9b8:	e51b3008 	ldr	r3, [fp, #-8]
    c9bc:	e1a03103 	lsl	r3, r3, #2
    c9c0:	e0823003 	add	r3, r2, r3
    c9c4:	e51b2010 	ldr	r2, [fp, #-16]
    c9c8:	e5832000 	str	r2, [r3]
    c9cc:	e51b3008 	ldr	r3, [fp, #-8]
    c9d0:	e2833001 	add	r3, r3, #1
    c9d4:	e50b3008 	str	r3, [fp, #-8]
    c9d8:	e51b2010 	ldr	r2, [fp, #-16]
    c9dc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    c9e0:	e0823003 	add	r3, r2, r3
    c9e4:	e50b3010 	str	r3, [fp, #-16]
    c9e8:	e51b3008 	ldr	r3, [fp, #-8]
    c9ec:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    c9f0:	e1520003 	cmp	r2, r3
    c9f4:	8affffed 	bhi	c9b0 <create_mbox+0x168>
    c9f8:	e51b300c 	ldr	r3, [fp, #-12]
    c9fc:	e51b2010 	ldr	r2, [fp, #-16]
    ca00:	e583201c 	str	r2, [r3, #28]
    ca04:	e51b3010 	ldr	r3, [fp, #-16]
    ca08:	e283300c 	add	r3, r3, #12
    ca0c:	e50b3010 	str	r3, [fp, #-16]
    ca10:	e51b300c 	ldr	r3, [fp, #-12]
    ca14:	e51b2010 	ldr	r2, [fp, #-16]
    ca18:	e5832020 	str	r2, [r3, #32]
    ca1c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    ca20:	e51b300c 	ldr	r3, [fp, #-12]
    ca24:	e5832010 	str	r2, [r3, #16]
    ca28:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    ca2c:	e51b300c 	ldr	r3, [fp, #-12]
    ca30:	e5832014 	str	r2, [r3, #20]
    ca34:	e51b300c 	ldr	r3, [fp, #-12]
    ca38:	e593301c 	ldr	r3, [r3, #28]
    ca3c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    ca40:	e1a01002 	mov	r1, r2
    ca44:	e1a00003 	mov	r0, r3
    ca48:	ebfff2b6 	bl	9528 <dfsm>
    ca4c:	e51b300c 	ldr	r3, [fp, #-12]
    ca50:	e5933020 	ldr	r3, [r3, #32]
    ca54:	e3a01000 	mov	r1, #0
    ca58:	e1a00003 	mov	r0, r3
    ca5c:	ebfff2b1 	bl	9528 <dfsm>
    ca60:	e51b300c 	ldr	r3, [fp, #-12]
    ca64:	e3a02001 	mov	r2, #1
    ca68:	e5832000 	str	r2, [r3]
    ca6c:	e51b300c 	ldr	r3, [fp, #-12]
    ca70:	e1a00003 	mov	r0, r3
    ca74:	e24bd004 	sub	sp, fp, #4
    ca78:	e8bd8800 	pop	{fp, pc}

0000ca7c <delete_mbox>:
    ca7c:	e92d4800 	push	{fp, lr}
    ca80:	e28db004 	add	fp, sp, #4
    ca84:	e24dd010 	sub	sp, sp, #16
    ca88:	e50b0010 	str	r0, [fp, #-16]
    ca8c:	e3a03000 	mov	r3, #0
    ca90:	e50b3008 	str	r3, [fp, #-8]
    ca94:	ebffedc9 	bl	81c0 <set_disable>
    ca98:	e50b000c 	str	r0, [fp, #-12]
    ca9c:	e51b3010 	ldr	r3, [fp, #-16]
    caa0:	e5933000 	ldr	r3, [r3]
    caa4:	e3530000 	cmp	r3, #0
    caa8:	1a000002 	bne	cab8 <delete_mbox+0x3c>
    caac:	e3e03000 	mvn	r3, #0
    cab0:	e50b3008 	str	r3, [fp, #-8]
    cab4:	ea000015 	b	cb10 <delete_mbox+0x94>
    cab8:	e51b3010 	ldr	r3, [fp, #-16]
    cabc:	e5933000 	ldr	r3, [r3]
    cac0:	e3530004 	cmp	r3, #4
    cac4:	1a000002 	bne	cad4 <delete_mbox+0x58>
    cac8:	e3e03001 	mvn	r3, #1
    cacc:	e50b3008 	str	r3, [fp, #-8]
    cad0:	ea00000e 	b	cb10 <delete_mbox+0x94>
    cad4:	e51b3010 	ldr	r3, [fp, #-16]
    cad8:	e593301c 	ldr	r3, [r3, #28]
    cadc:	e5933004 	ldr	r3, [r3, #4]
    cae0:	e3530000 	cmp	r3, #0
    cae4:	1a000004 	bne	cafc <delete_mbox+0x80>
    cae8:	e51b3010 	ldr	r3, [fp, #-16]
    caec:	e5933020 	ldr	r3, [r3, #32]
    caf0:	e5933004 	ldr	r3, [r3, #4]
    caf4:	e3530000 	cmp	r3, #0
    caf8:	0a000002 	beq	cb08 <delete_mbox+0x8c>
    cafc:	e3e03002 	mvn	r3, #2
    cb00:	e50b3008 	str	r3, [fp, #-8]
    cb04:	ea000001 	b	cb10 <delete_mbox+0x94>
    cb08:	e51b0010 	ldr	r0, [fp, #-16]
    cb0c:	eb000b8c 	bl	f944 <free>
    cb10:	e51b000c 	ldr	r0, [fp, #-12]
    cb14:	ebffedb3 	bl	81e8 <set_enable>
    cb18:	e51b3008 	ldr	r3, [fp, #-8]
    cb1c:	e1a00003 	mov	r0, r3
    cb20:	e24bd004 	sub	sp, fp, #4
    cb24:	e8bd8800 	pop	{fp, pc}

0000cb28 <clear_mbox>:
    cb28:	e92d4800 	push	{fp, lr}
    cb2c:	e28db004 	add	fp, sp, #4
    cb30:	e24dd010 	sub	sp, sp, #16
    cb34:	e50b0010 	str	r0, [fp, #-16]
    cb38:	e3a03000 	mov	r3, #0
    cb3c:	e50b3008 	str	r3, [fp, #-8]
    cb40:	ebffed9e 	bl	81c0 <set_disable>
    cb44:	e50b000c 	str	r0, [fp, #-12]
    cb48:	e51b3010 	ldr	r3, [fp, #-16]
    cb4c:	e5933000 	ldr	r3, [r3]
    cb50:	e3530004 	cmp	r3, #4
    cb54:	1a000002 	bne	cb64 <clear_mbox+0x3c>
    cb58:	e3e03000 	mvn	r3, #0
    cb5c:	e50b3008 	str	r3, [fp, #-8]
    cb60:	ea000021 	b	cbec <clear_mbox+0xc4>
    cb64:	e51b3010 	ldr	r3, [fp, #-16]
    cb68:	e5933000 	ldr	r3, [r3]
    cb6c:	e3530000 	cmp	r3, #0
    cb70:	1a000002 	bne	cb80 <clear_mbox+0x58>
    cb74:	e3e03001 	mvn	r3, #1
    cb78:	e50b3008 	str	r3, [fp, #-8]
    cb7c:	ea00001a 	b	cbec <clear_mbox+0xc4>
    cb80:	e51b3010 	ldr	r3, [fp, #-16]
    cb84:	e593301c 	ldr	r3, [r3, #28]
    cb88:	e5933004 	ldr	r3, [r3, #4]
    cb8c:	e3530000 	cmp	r3, #0
    cb90:	1a000004 	bne	cba8 <clear_mbox+0x80>
    cb94:	e51b3010 	ldr	r3, [fp, #-16]
    cb98:	e5933020 	ldr	r3, [r3, #32]
    cb9c:	e5933004 	ldr	r3, [r3, #4]
    cba0:	e3530000 	cmp	r3, #0
    cba4:	0a000002 	beq	cbb4 <clear_mbox+0x8c>
    cba8:	e3e03002 	mvn	r3, #2
    cbac:	e50b3008 	str	r3, [fp, #-8]
    cbb0:	ea00000d 	b	cbec <clear_mbox+0xc4>
    cbb4:	e51b3010 	ldr	r3, [fp, #-16]
    cbb8:	e3a02000 	mov	r2, #0
    cbbc:	e583200c 	str	r2, [r3, #12]
    cbc0:	e51b3010 	ldr	r3, [fp, #-16]
    cbc4:	e593200c 	ldr	r2, [r3, #12]
    cbc8:	e51b3010 	ldr	r3, [fp, #-16]
    cbcc:	e5832008 	str	r2, [r3, #8]
    cbd0:	e51b3010 	ldr	r3, [fp, #-16]
    cbd4:	e5932008 	ldr	r2, [r3, #8]
    cbd8:	e51b3010 	ldr	r3, [fp, #-16]
    cbdc:	e5832004 	str	r2, [r3, #4]
    cbe0:	e51b3010 	ldr	r3, [fp, #-16]
    cbe4:	e3a02001 	mov	r2, #1
    cbe8:	e5832000 	str	r2, [r3]
    cbec:	e51b000c 	ldr	r0, [fp, #-12]
    cbf0:	ebffed7c 	bl	81e8 <set_enable>
    cbf4:	e51b3008 	ldr	r3, [fp, #-8]
    cbf8:	e1a00003 	mov	r0, r3
    cbfc:	e24bd004 	sub	sp, fp, #4
    cc00:	e8bd8800 	pop	{fp, pc}

0000cc04 <mbox_messages>:
    cc04:	e92d4800 	push	{fp, lr}
    cc08:	e28db004 	add	fp, sp, #4
    cc0c:	e24dd010 	sub	sp, sp, #16
    cc10:	e50b0010 	str	r0, [fp, #-16]
    cc14:	ebffed69 	bl	81c0 <set_disable>
    cc18:	e50b000c 	str	r0, [fp, #-12]
    cc1c:	e51b3010 	ldr	r3, [fp, #-16]
    cc20:	e5933000 	ldr	r3, [r3]
    cc24:	e3530000 	cmp	r3, #0
    cc28:	1a000002 	bne	cc38 <mbox_messages+0x34>
    cc2c:	e3e03000 	mvn	r3, #0
    cc30:	e50b3008 	str	r3, [fp, #-8]
    cc34:	ea000002 	b	cc44 <mbox_messages+0x40>
    cc38:	e51b3010 	ldr	r3, [fp, #-16]
    cc3c:	e593300c 	ldr	r3, [r3, #12]
    cc40:	e50b3008 	str	r3, [fp, #-8]
    cc44:	e51b000c 	ldr	r0, [fp, #-12]
    cc48:	ebffed66 	bl	81e8 <set_enable>
    cc4c:	e51b3008 	ldr	r3, [fp, #-8]
    cc50:	e1a00003 	mov	r0, r3
    cc54:	e24bd004 	sub	sp, fp, #4
    cc58:	e8bd8800 	pop	{fp, pc}

0000cc5c <put_message>:
    cc5c:	e92d4800 	push	{fp, lr}
    cc60:	e28db004 	add	fp, sp, #4
    cc64:	e24dd020 	sub	sp, sp, #32
    cc68:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    cc6c:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    cc70:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    cc74:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    cc78:	ebffed50 	bl	81c0 <set_disable>
    cc7c:	e50b000c 	str	r0, [fp, #-12]
    cc80:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cc84:	e5933000 	ldr	r3, [r3]
    cc88:	e50b3010 	str	r3, [fp, #-16]
    cc8c:	e51b3010 	ldr	r3, [fp, #-16]
    cc90:	e3530000 	cmp	r3, #0
    cc94:	1a000003 	bne	cca8 <put_message+0x4c>
    cc98:	e51b000c 	ldr	r0, [fp, #-12]
    cc9c:	ebffed51 	bl	81e8 <set_enable>
    cca0:	e3e03000 	mvn	r3, #0
    cca4:	ea000057 	b	ce08 <put_message+0x1ac>
    cca8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    ccac:	e3a02004 	mov	r2, #4
    ccb0:	e5832000 	str	r2, [r3]
    ccb4:	e51b000c 	ldr	r0, [fp, #-12]
    ccb8:	ebffed4a 	bl	81e8 <set_enable>
    ccbc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    ccc0:	e5933014 	ldr	r3, [r3, #20]
    ccc4:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    ccc8:	e1520003 	cmp	r2, r3
    cccc:	da000002 	ble	ccdc <put_message+0x80>
    ccd0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    ccd4:	e5933014 	ldr	r3, [r3, #20]
    ccd8:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    ccdc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cce0:	e593301c 	ldr	r3, [r3, #28]
    cce4:	e1a00003 	mov	r0, r3
    cce8:	ebfff221 	bl	9574 <rsvsm>
    ccec:	ebffed33 	bl	81c0 <set_disable>
    ccf0:	e50b000c 	str	r0, [fp, #-12]
    ccf4:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    ccf8:	e3530000 	cmp	r3, #0
    ccfc:	1a00000c 	bne	cd34 <put_message+0xd8>
    cd00:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cd04:	e5933008 	ldr	r3, [r3, #8]
    cd08:	e50b3008 	str	r3, [fp, #-8]
    cd0c:	e51b3008 	ldr	r3, [fp, #-8]
    cd10:	e2833001 	add	r3, r3, #1
    cd14:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    cd18:	e5922010 	ldr	r2, [r2, #16]
    cd1c:	e711f213 	sdiv	r1, r3, r2
    cd20:	e0020192 	mul	r2, r2, r1
    cd24:	e0432002 	sub	r2, r3, r2
    cd28:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cd2c:	e5832008 	str	r2, [r3, #8]
    cd30:	ea000011 	b	cd7c <put_message+0x120>
    cd34:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cd38:	e5933004 	ldr	r3, [r3, #4]
    cd3c:	e3530000 	cmp	r3, #0
    cd40:	0a000005 	beq	cd5c <put_message+0x100>
    cd44:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cd48:	e5933004 	ldr	r3, [r3, #4]
    cd4c:	e2432001 	sub	r2, r3, #1
    cd50:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cd54:	e5832004 	str	r2, [r3, #4]
    cd58:	ea000004 	b	cd70 <put_message+0x114>
    cd5c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cd60:	e5933010 	ldr	r3, [r3, #16]
    cd64:	e2432001 	sub	r2, r3, #1
    cd68:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cd6c:	e5832004 	str	r2, [r3, #4]
    cd70:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cd74:	e5933004 	ldr	r3, [r3, #4]
    cd78:	e50b3008 	str	r3, [fp, #-8]
    cd7c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cd80:	e5932018 	ldr	r2, [r3, #24]
    cd84:	e51b3008 	ldr	r3, [fp, #-8]
    cd88:	e1a03103 	lsl	r3, r3, #2
    cd8c:	e0823003 	add	r3, r2, r3
    cd90:	e5933000 	ldr	r3, [r3]
    cd94:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    cd98:	e51b1020 	ldr	r1, [fp, #-32]	; 0xffffffe0
    cd9c:	e1a00003 	mov	r0, r3
    cda0:	eb000b25 	bl	fa3c <memcp>
    cda4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cda8:	e593300c 	ldr	r3, [r3, #12]
    cdac:	e2832001 	add	r2, r3, #1
    cdb0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cdb4:	e583200c 	str	r2, [r3, #12]
    cdb8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cdbc:	e593301c 	ldr	r3, [r3, #28]
    cdc0:	e5933004 	ldr	r3, [r3, #4]
    cdc4:	e3530000 	cmp	r3, #0
    cdc8:	1a000007 	bne	cdec <put_message+0x190>
    cdcc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cdd0:	e5933020 	ldr	r3, [r3, #32]
    cdd4:	e5933004 	ldr	r3, [r3, #4]
    cdd8:	e3530000 	cmp	r3, #0
    cddc:	1a000002 	bne	cdec <put_message+0x190>
    cde0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cde4:	e51b2010 	ldr	r2, [fp, #-16]
    cde8:	e5832000 	str	r2, [r3]
    cdec:	e51b000c 	ldr	r0, [fp, #-12]
    cdf0:	ebffecfc 	bl	81e8 <set_enable>
    cdf4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cdf8:	e5933020 	ldr	r3, [r3, #32]
    cdfc:	e1a00003 	mov	r0, r3
    ce00:	ebfff242 	bl	9710 <rlsm>
    ce04:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    ce08:	e1a00003 	mov	r0, r3
    ce0c:	e24bd004 	sub	sp, fp, #4
    ce10:	e8bd8800 	pop	{fp, pc}

0000ce14 <put_cond_message>:
    ce14:	e92d4800 	push	{fp, lr}
    ce18:	e28db004 	add	fp, sp, #4
    ce1c:	e24dd020 	sub	sp, sp, #32
    ce20:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    ce24:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    ce28:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    ce2c:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    ce30:	ebffece2 	bl	81c0 <set_disable>
    ce34:	e50b0010 	str	r0, [fp, #-16]
    ce38:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    ce3c:	e5933000 	ldr	r3, [r3]
    ce40:	e3530000 	cmp	r3, #0
    ce44:	1a000002 	bne	ce54 <put_cond_message+0x40>
    ce48:	e3e03000 	mvn	r3, #0
    ce4c:	e50b3008 	str	r3, [fp, #-8]
    ce50:	ea000047 	b	cf74 <put_cond_message+0x160>
    ce54:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    ce58:	e593200c 	ldr	r2, [r3, #12]
    ce5c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    ce60:	e5933010 	ldr	r3, [r3, #16]
    ce64:	e1520003 	cmp	r2, r3
    ce68:	1a000002 	bne	ce78 <put_cond_message+0x64>
    ce6c:	e3e03001 	mvn	r3, #1
    ce70:	e50b3008 	str	r3, [fp, #-8]
    ce74:	ea00003e 	b	cf74 <put_cond_message+0x160>
    ce78:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    ce7c:	e5933014 	ldr	r3, [r3, #20]
    ce80:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    ce84:	e1520003 	cmp	r2, r3
    ce88:	da000002 	ble	ce98 <put_cond_message+0x84>
    ce8c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    ce90:	e5933014 	ldr	r3, [r3, #20]
    ce94:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    ce98:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    ce9c:	e593301c 	ldr	r3, [r3, #28]
    cea0:	e1a00003 	mov	r0, r3
    cea4:	ebfff1b2 	bl	9574 <rsvsm>
    cea8:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    ceac:	e3530000 	cmp	r3, #0
    ceb0:	1a00000c 	bne	cee8 <put_cond_message+0xd4>
    ceb4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    ceb8:	e5933008 	ldr	r3, [r3, #8]
    cebc:	e50b300c 	str	r3, [fp, #-12]
    cec0:	e51b300c 	ldr	r3, [fp, #-12]
    cec4:	e2833001 	add	r3, r3, #1
    cec8:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    cecc:	e5922010 	ldr	r2, [r2, #16]
    ced0:	e711f213 	sdiv	r1, r3, r2
    ced4:	e0020192 	mul	r2, r2, r1
    ced8:	e0432002 	sub	r2, r3, r2
    cedc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cee0:	e5832008 	str	r2, [r3, #8]
    cee4:	ea000011 	b	cf30 <put_cond_message+0x11c>
    cee8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    ceec:	e5933004 	ldr	r3, [r3, #4]
    cef0:	e3530000 	cmp	r3, #0
    cef4:	0a000005 	beq	cf10 <put_cond_message+0xfc>
    cef8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cefc:	e5933004 	ldr	r3, [r3, #4]
    cf00:	e2432001 	sub	r2, r3, #1
    cf04:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cf08:	e5832004 	str	r2, [r3, #4]
    cf0c:	ea000004 	b	cf24 <put_cond_message+0x110>
    cf10:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cf14:	e5933010 	ldr	r3, [r3, #16]
    cf18:	e2432001 	sub	r2, r3, #1
    cf1c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cf20:	e5832004 	str	r2, [r3, #4]
    cf24:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cf28:	e5933004 	ldr	r3, [r3, #4]
    cf2c:	e50b300c 	str	r3, [fp, #-12]
    cf30:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cf34:	e5932018 	ldr	r2, [r3, #24]
    cf38:	e51b300c 	ldr	r3, [fp, #-12]
    cf3c:	e1a03103 	lsl	r3, r3, #2
    cf40:	e0823003 	add	r3, r2, r3
    cf44:	e5933000 	ldr	r3, [r3]
    cf48:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    cf4c:	e51b1020 	ldr	r1, [fp, #-32]	; 0xffffffe0
    cf50:	e1a00003 	mov	r0, r3
    cf54:	eb000ab8 	bl	fa3c <memcp>
    cf58:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cf5c:	e593300c 	ldr	r3, [r3, #12]
    cf60:	e2832001 	add	r2, r3, #1
    cf64:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cf68:	e583200c 	str	r2, [r3, #12]
    cf6c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    cf70:	e50b3008 	str	r3, [fp, #-8]
    cf74:	e51b0010 	ldr	r0, [fp, #-16]
    cf78:	ebffec9a 	bl	81e8 <set_enable>
    cf7c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cf80:	e5933020 	ldr	r3, [r3, #32]
    cf84:	e1a00003 	mov	r0, r3
    cf88:	ebfff1e0 	bl	9710 <rlsm>
    cf8c:	e51b3008 	ldr	r3, [fp, #-8]
    cf90:	e1a00003 	mov	r0, r3
    cf94:	e24bd004 	sub	sp, fp, #4
    cf98:	e8bd8800 	pop	{fp, pc}

0000cf9c <get_message>:
    cf9c:	e92d4800 	push	{fp, lr}
    cfa0:	e28db004 	add	fp, sp, #4
    cfa4:	e24dd018 	sub	sp, sp, #24
    cfa8:	e50b0010 	str	r0, [fp, #-16]
    cfac:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    cfb0:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    cfb4:	ebffec81 	bl	81c0 <set_disable>
    cfb8:	e50b0008 	str	r0, [fp, #-8]
    cfbc:	e51b3010 	ldr	r3, [fp, #-16]
    cfc0:	e5933000 	ldr	r3, [r3]
    cfc4:	e50b300c 	str	r3, [fp, #-12]
    cfc8:	e51b300c 	ldr	r3, [fp, #-12]
    cfcc:	e3530000 	cmp	r3, #0
    cfd0:	1a000003 	bne	cfe4 <get_message+0x48>
    cfd4:	e51b0008 	ldr	r0, [fp, #-8]
    cfd8:	ebffec82 	bl	81e8 <set_enable>
    cfdc:	e3e03000 	mvn	r3, #0
    cfe0:	ea000040 	b	d0e8 <get_message+0x14c>
    cfe4:	e51b3010 	ldr	r3, [fp, #-16]
    cfe8:	e3a02004 	mov	r2, #4
    cfec:	e5832000 	str	r2, [r3]
    cff0:	e51b0008 	ldr	r0, [fp, #-8]
    cff4:	ebffec7b 	bl	81e8 <set_enable>
    cff8:	e51b3010 	ldr	r3, [fp, #-16]
    cffc:	e5933014 	ldr	r3, [r3, #20]
    d000:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    d004:	e1520003 	cmp	r2, r3
    d008:	da000002 	ble	d018 <get_message+0x7c>
    d00c:	e51b3010 	ldr	r3, [fp, #-16]
    d010:	e5933014 	ldr	r3, [r3, #20]
    d014:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    d018:	e51b3010 	ldr	r3, [fp, #-16]
    d01c:	e5933020 	ldr	r3, [r3, #32]
    d020:	e1a00003 	mov	r0, r3
    d024:	ebfff152 	bl	9574 <rsvsm>
    d028:	ebffec64 	bl	81c0 <set_disable>
    d02c:	e50b0008 	str	r0, [fp, #-8]
    d030:	e51b3010 	ldr	r3, [fp, #-16]
    d034:	e5932018 	ldr	r2, [r3, #24]
    d038:	e51b3010 	ldr	r3, [fp, #-16]
    d03c:	e5933004 	ldr	r3, [r3, #4]
    d040:	e1a03103 	lsl	r3, r3, #2
    d044:	e0823003 	add	r3, r2, r3
    d048:	e5933000 	ldr	r3, [r3]
    d04c:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    d050:	e1a01003 	mov	r1, r3
    d054:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    d058:	eb000a77 	bl	fa3c <memcp>
    d05c:	e51b3010 	ldr	r3, [fp, #-16]
    d060:	e5933004 	ldr	r3, [r3, #4]
    d064:	e2833001 	add	r3, r3, #1
    d068:	e51b2010 	ldr	r2, [fp, #-16]
    d06c:	e5922010 	ldr	r2, [r2, #16]
    d070:	e711f213 	sdiv	r1, r3, r2
    d074:	e0020192 	mul	r2, r2, r1
    d078:	e0432002 	sub	r2, r3, r2
    d07c:	e51b3010 	ldr	r3, [fp, #-16]
    d080:	e5832004 	str	r2, [r3, #4]
    d084:	e51b3010 	ldr	r3, [fp, #-16]
    d088:	e593300c 	ldr	r3, [r3, #12]
    d08c:	e2432001 	sub	r2, r3, #1
    d090:	e51b3010 	ldr	r3, [fp, #-16]
    d094:	e583200c 	str	r2, [r3, #12]
    d098:	e51b3010 	ldr	r3, [fp, #-16]
    d09c:	e593301c 	ldr	r3, [r3, #28]
    d0a0:	e5933004 	ldr	r3, [r3, #4]
    d0a4:	e3530000 	cmp	r3, #0
    d0a8:	1a000007 	bne	d0cc <get_message+0x130>
    d0ac:	e51b3010 	ldr	r3, [fp, #-16]
    d0b0:	e5933020 	ldr	r3, [r3, #32]
    d0b4:	e5933004 	ldr	r3, [r3, #4]
    d0b8:	e3530000 	cmp	r3, #0
    d0bc:	1a000002 	bne	d0cc <get_message+0x130>
    d0c0:	e51b3010 	ldr	r3, [fp, #-16]
    d0c4:	e51b200c 	ldr	r2, [fp, #-12]
    d0c8:	e5832000 	str	r2, [r3]
    d0cc:	e51b0008 	ldr	r0, [fp, #-8]
    d0d0:	ebffec44 	bl	81e8 <set_enable>
    d0d4:	e51b3010 	ldr	r3, [fp, #-16]
    d0d8:	e593301c 	ldr	r3, [r3, #28]
    d0dc:	e1a00003 	mov	r0, r3
    d0e0:	ebfff18a 	bl	9710 <rlsm>
    d0e4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    d0e8:	e1a00003 	mov	r0, r3
    d0ec:	e24bd004 	sub	sp, fp, #4
    d0f0:	e8bd8800 	pop	{fp, pc}

0000d0f4 <get_cond_message>:
    d0f4:	e92d4800 	push	{fp, lr}
    d0f8:	e28db004 	add	fp, sp, #4
    d0fc:	e24dd018 	sub	sp, sp, #24
    d100:	e50b0010 	str	r0, [fp, #-16]
    d104:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    d108:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    d10c:	ebffec2b 	bl	81c0 <set_disable>
    d110:	e50b000c 	str	r0, [fp, #-12]
    d114:	e51b3010 	ldr	r3, [fp, #-16]
    d118:	e5933000 	ldr	r3, [r3]
    d11c:	e3530000 	cmp	r3, #0
    d120:	1a000002 	bne	d130 <get_cond_message+0x3c>
    d124:	e3e03000 	mvn	r3, #0
    d128:	e50b3008 	str	r3, [fp, #-8]
    d12c:	ea00002e 	b	d1ec <get_cond_message+0xf8>
    d130:	e51b3010 	ldr	r3, [fp, #-16]
    d134:	e593300c 	ldr	r3, [r3, #12]
    d138:	e3530000 	cmp	r3, #0
    d13c:	1a000002 	bne	d14c <get_cond_message+0x58>
    d140:	e3e03001 	mvn	r3, #1
    d144:	e50b3008 	str	r3, [fp, #-8]
    d148:	ea000027 	b	d1ec <get_cond_message+0xf8>
    d14c:	e51b3010 	ldr	r3, [fp, #-16]
    d150:	e5933014 	ldr	r3, [r3, #20]
    d154:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    d158:	e1520003 	cmp	r2, r3
    d15c:	da000002 	ble	d16c <get_cond_message+0x78>
    d160:	e51b3010 	ldr	r3, [fp, #-16]
    d164:	e5933014 	ldr	r3, [r3, #20]
    d168:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    d16c:	e51b3010 	ldr	r3, [fp, #-16]
    d170:	e5933020 	ldr	r3, [r3, #32]
    d174:	e1a00003 	mov	r0, r3
    d178:	ebfff0fd 	bl	9574 <rsvsm>
    d17c:	e51b3010 	ldr	r3, [fp, #-16]
    d180:	e5932018 	ldr	r2, [r3, #24]
    d184:	e51b3010 	ldr	r3, [fp, #-16]
    d188:	e5933004 	ldr	r3, [r3, #4]
    d18c:	e1a03103 	lsl	r3, r3, #2
    d190:	e0823003 	add	r3, r2, r3
    d194:	e5933000 	ldr	r3, [r3]
    d198:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    d19c:	e1a01003 	mov	r1, r3
    d1a0:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    d1a4:	eb000a24 	bl	fa3c <memcp>
    d1a8:	e51b3010 	ldr	r3, [fp, #-16]
    d1ac:	e5933004 	ldr	r3, [r3, #4]
    d1b0:	e2833001 	add	r3, r3, #1
    d1b4:	e51b2010 	ldr	r2, [fp, #-16]
    d1b8:	e5922010 	ldr	r2, [r2, #16]
    d1bc:	e711f213 	sdiv	r1, r3, r2
    d1c0:	e0020192 	mul	r2, r2, r1
    d1c4:	e0432002 	sub	r2, r3, r2
    d1c8:	e51b3010 	ldr	r3, [fp, #-16]
    d1cc:	e5832004 	str	r2, [r3, #4]
    d1d0:	e51b3010 	ldr	r3, [fp, #-16]
    d1d4:	e593300c 	ldr	r3, [r3, #12]
    d1d8:	e2432001 	sub	r2, r3, #1
    d1dc:	e51b3010 	ldr	r3, [fp, #-16]
    d1e0:	e583200c 	str	r2, [r3, #12]
    d1e4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    d1e8:	e50b3008 	str	r3, [fp, #-8]
    d1ec:	e51b000c 	ldr	r0, [fp, #-12]
    d1f0:	ebffebfc 	bl	81e8 <set_enable>
    d1f4:	e51b3010 	ldr	r3, [fp, #-16]
    d1f8:	e5933020 	ldr	r3, [r3, #32]
    d1fc:	e1a00003 	mov	r0, r3
    d200:	ebfff142 	bl	9710 <rlsm>
    d204:	e51b3008 	ldr	r3, [fp, #-8]
    d208:	e1a00003 	mov	r0, r3
    d20c:	e24bd004 	sub	sp, fp, #4
    d210:	e8bd8800 	pop	{fp, pc}

0000d214 <read_message>:
    d214:	e92d4800 	push	{fp, lr}
    d218:	e28db004 	add	fp, sp, #4
    d21c:	e24dd018 	sub	sp, sp, #24
    d220:	e50b0010 	str	r0, [fp, #-16]
    d224:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    d228:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    d22c:	ebffebe3 	bl	81c0 <set_disable>
    d230:	e50b000c 	str	r0, [fp, #-12]
    d234:	e51b3010 	ldr	r3, [fp, #-16]
    d238:	e5933000 	ldr	r3, [r3]
    d23c:	e3530000 	cmp	r3, #0
    d240:	0a00001c 	beq	d2b8 <read_message+0xa4>
    d244:	e51b3010 	ldr	r3, [fp, #-16]
    d248:	e5933014 	ldr	r3, [r3, #20]
    d24c:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    d250:	e1520003 	cmp	r2, r3
    d254:	da000002 	ble	d264 <read_message+0x50>
    d258:	e51b3010 	ldr	r3, [fp, #-16]
    d25c:	e5933014 	ldr	r3, [r3, #20]
    d260:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    d264:	e51b3010 	ldr	r3, [fp, #-16]
    d268:	e593300c 	ldr	r3, [r3, #12]
    d26c:	e3530000 	cmp	r3, #0
    d270:	0a00000d 	beq	d2ac <read_message+0x98>
    d274:	e51b3010 	ldr	r3, [fp, #-16]
    d278:	e5932018 	ldr	r2, [r3, #24]
    d27c:	e51b3010 	ldr	r3, [fp, #-16]
    d280:	e5933004 	ldr	r3, [r3, #4]
    d284:	e1a03103 	lsl	r3, r3, #2
    d288:	e0823003 	add	r3, r2, r3
    d28c:	e5933000 	ldr	r3, [r3]
    d290:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    d294:	e1a01003 	mov	r1, r3
    d298:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    d29c:	eb0009e6 	bl	fa3c <memcp>
    d2a0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    d2a4:	e50b3008 	str	r3, [fp, #-8]
    d2a8:	ea000004 	b	d2c0 <read_message+0xac>
    d2ac:	e3e03001 	mvn	r3, #1
    d2b0:	e50b3008 	str	r3, [fp, #-8]
    d2b4:	ea000001 	b	d2c0 <read_message+0xac>
    d2b8:	e3e03000 	mvn	r3, #0
    d2bc:	e50b3008 	str	r3, [fp, #-8]
    d2c0:	e51b000c 	ldr	r0, [fp, #-12]
    d2c4:	ebffebc7 	bl	81e8 <set_enable>
    d2c8:	e51b3008 	ldr	r3, [fp, #-8]
    d2cc:	e1a00003 	mov	r0, r3
    d2d0:	e24bd004 	sub	sp, fp, #4
    d2d4:	e8bd8800 	pop	{fp, pc}

0000d2d8 <dfmtx>:
    d2d8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    d2dc:	e28db000 	add	fp, sp, #0
    d2e0:	e24dd00c 	sub	sp, sp, #12
    d2e4:	e50b0008 	str	r0, [fp, #-8]
    d2e8:	e51b3008 	ldr	r3, [fp, #-8]
    d2ec:	e3a02001 	mov	r2, #1
    d2f0:	e5832000 	str	r2, [r3]
    d2f4:	e51b3008 	ldr	r3, [fp, #-8]
    d2f8:	e3a02000 	mov	r2, #0
    d2fc:	e5832004 	str	r2, [r3, #4]
    d300:	e51b3008 	ldr	r3, [fp, #-8]
    d304:	e3a02000 	mov	r2, #0
    d308:	e5832010 	str	r2, [r3, #16]
    d30c:	e51b3008 	ldr	r3, [fp, #-8]
    d310:	e5932010 	ldr	r2, [r3, #16]
    d314:	e51b3008 	ldr	r3, [fp, #-8]
    d318:	e583200c 	str	r2, [r3, #12]
    d31c:	e51b3008 	ldr	r3, [fp, #-8]
    d320:	e593200c 	ldr	r2, [r3, #12]
    d324:	e51b3008 	ldr	r3, [fp, #-8]
    d328:	e5832008 	str	r2, [r3, #8]
    d32c:	e320f000 	nop	{0}
    d330:	e28bd000 	add	sp, fp, #0
    d334:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    d338:	e12fff1e 	bx	lr

0000d33c <rsvmtx>:
    d33c:	e92d4800 	push	{fp, lr}
    d340:	e28db004 	add	fp, sp, #4
    d344:	e24dd018 	sub	sp, sp, #24
    d348:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    d34c:	e3a03000 	mov	r3, #0
    d350:	e50b3008 	str	r3, [fp, #-8]
    d354:	ebffeb99 	bl	81c0 <set_disable>
    d358:	e50b000c 	str	r0, [fp, #-12]
    d35c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d360:	e5932008 	ldr	r2, [r3, #8]
    d364:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    d368:	e3403000 	movt	r3, #0
    d36c:	e5933000 	ldr	r3, [r3]
    d370:	e1520003 	cmp	r2, r3
    d374:	0a000004 	beq	d38c <rsvmtx+0x50>
    d378:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d37c:	e5933000 	ldr	r3, [r3]
    d380:	e2432001 	sub	r2, r3, #1
    d384:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d388:	e5832000 	str	r2, [r3]
    d38c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d390:	e5933000 	ldr	r3, [r3]
    d394:	e3530000 	cmp	r3, #0
    d398:	aa000036 	bge	d478 <rsvmtx+0x13c>
    d39c:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    d3a0:	e3403000 	movt	r3, #0
    d3a4:	e5933000 	ldr	r3, [r3]
    d3a8:	e50b3010 	str	r3, [fp, #-16]
    d3ac:	e51b3010 	ldr	r3, [fp, #-16]
    d3b0:	e3a02000 	mov	r2, #0
    d3b4:	e5832070 	str	r2, [r3, #112]	; 0x70
    d3b8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d3bc:	e593300c 	ldr	r3, [r3, #12]
    d3c0:	e3530000 	cmp	r3, #0
    d3c4:	1a000007 	bne	d3e8 <rsvmtx+0xac>
    d3c8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d3cc:	e51b2010 	ldr	r2, [fp, #-16]
    d3d0:	e5832010 	str	r2, [r3, #16]
    d3d4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d3d8:	e5932010 	ldr	r2, [r3, #16]
    d3dc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d3e0:	e583200c 	str	r2, [r3, #12]
    d3e4:	ea000006 	b	d404 <rsvmtx+0xc8>
    d3e8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d3ec:	e5933010 	ldr	r3, [r3, #16]
    d3f0:	e51b2010 	ldr	r2, [fp, #-16]
    d3f4:	e5832070 	str	r2, [r3, #112]	; 0x70
    d3f8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d3fc:	e51b2010 	ldr	r2, [fp, #-16]
    d400:	e5832010 	str	r2, [r3, #16]
    d404:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    d408:	e3403000 	movt	r3, #0
    d40c:	e5933000 	ldr	r3, [r3]
    d410:	e3a02000 	mov	r2, #0
    d414:	e1c324ba 	strh	r2, [r3, #74]	; 0x4a
    d418:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    d41c:	e3403000 	movt	r3, #0
    d420:	e5933000 	ldr	r3, [r3]
    d424:	e3a02003 	mov	r2, #3
    d428:	e1c324b8 	strh	r2, [r3, #72]	; 0x48
    d42c:	e51b000c 	ldr	r0, [fp, #-12]
    d430:	ebffeb6c 	bl	81e8 <set_enable>
    d434:	ea000006 	b	d454 <rsvmtx+0x118>
    d438:	e30f3f04 	movw	r3, #65284	; 0xff04
    d43c:	e3403000 	movt	r3, #0
    d440:	e5933000 	ldr	r3, [r3]
    d444:	e2033002 	and	r3, r3, #2
    d448:	e3530000 	cmp	r3, #0
    d44c:	0a000000 	beq	d454 <rsvmtx+0x118>
    d450:	ef000060 	svc	0x00000060
    d454:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    d458:	e3403000 	movt	r3, #0
    d45c:	e5933000 	ldr	r3, [r3]
    d460:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    d464:	e3530003 	cmp	r3, #3
    d468:	0afffff2 	beq	d438 <rsvmtx+0xfc>
    d46c:	ebffeb53 	bl	81c0 <set_disable>
    d470:	e3a03001 	mov	r3, #1
    d474:	e50b3008 	str	r3, [fp, #-8]
    d478:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d47c:	e5933004 	ldr	r3, [r3, #4]
    d480:	e2832001 	add	r2, r3, #1
    d484:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d488:	e5832004 	str	r2, [r3, #4]
    d48c:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    d490:	e3403000 	movt	r3, #0
    d494:	e5932000 	ldr	r2, [r3]
    d498:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d49c:	e5832008 	str	r2, [r3, #8]
    d4a0:	e51b000c 	ldr	r0, [fp, #-12]
    d4a4:	ebffeb4f 	bl	81e8 <set_enable>
    d4a8:	e51b3008 	ldr	r3, [fp, #-8]
    d4ac:	e1a00003 	mov	r0, r3
    d4b0:	e24bd004 	sub	sp, fp, #4
    d4b4:	e8bd8800 	pop	{fp, pc}

0000d4b8 <rlsmtx>:
    d4b8:	e92d4800 	push	{fp, lr}
    d4bc:	e28db004 	add	fp, sp, #4
    d4c0:	e24dd018 	sub	sp, sp, #24
    d4c4:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    d4c8:	e3a03000 	mov	r3, #0
    d4cc:	e50b3008 	str	r3, [fp, #-8]
    d4d0:	ebffeb3a 	bl	81c0 <set_disable>
    d4d4:	e50b000c 	str	r0, [fp, #-12]
    d4d8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d4dc:	e5932008 	ldr	r2, [r3, #8]
    d4e0:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    d4e4:	e3403000 	movt	r3, #0
    d4e8:	e5933000 	ldr	r3, [r3]
    d4ec:	e1520003 	cmp	r2, r3
    d4f0:	1a000057 	bne	d654 <rlsmtx+0x19c>
    d4f4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d4f8:	e5933000 	ldr	r3, [r3]
    d4fc:	e3530000 	cmp	r3, #0
    d500:	ca000053 	bgt	d654 <rlsmtx+0x19c>
    d504:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d508:	e5933004 	ldr	r3, [r3, #4]
    d50c:	e3530000 	cmp	r3, #0
    d510:	0a000004 	beq	d528 <rlsmtx+0x70>
    d514:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d518:	e5933004 	ldr	r3, [r3, #4]
    d51c:	e2432001 	sub	r2, r3, #1
    d520:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d524:	e5832004 	str	r2, [r3, #4]
    d528:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d52c:	e5933004 	ldr	r3, [r3, #4]
    d530:	e3530000 	cmp	r3, #0
    d534:	1a000046 	bne	d654 <rlsmtx+0x19c>
    d538:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d53c:	e5933000 	ldr	r3, [r3]
    d540:	e2832001 	add	r2, r3, #1
    d544:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d548:	e5832000 	str	r2, [r3]
    d54c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d550:	e5933000 	ldr	r3, [r3]
    d554:	e3530000 	cmp	r3, #0
    d558:	ca00003a 	bgt	d648 <rlsmtx+0x190>
    d55c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d560:	e593300c 	ldr	r3, [r3, #12]
    d564:	e3530000 	cmp	r3, #0
    d568:	0a000036 	beq	d648 <rlsmtx+0x190>
    d56c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d570:	e593300c 	ldr	r3, [r3, #12]
    d574:	e50b3010 	str	r3, [fp, #-16]
    d578:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d57c:	e51b2010 	ldr	r2, [fp, #-16]
    d580:	e5832008 	str	r2, [r3, #8]
    d584:	e51b3010 	ldr	r3, [fp, #-16]
    d588:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    d58c:	e3530004 	cmp	r3, #4
    d590:	1a000005 	bne	d5ac <rlsmtx+0xf4>
    d594:	e51b3010 	ldr	r3, [fp, #-16]
    d598:	e3a02002 	mov	r2, #2
    d59c:	e1c324b8 	strh	r2, [r3, #72]	; 0x48
    d5a0:	e51b0010 	ldr	r0, [fp, #-16]
    d5a4:	ebffeb1c 	bl	821c <queue>
    d5a8:	ea000006 	b	d5c8 <rlsmtx+0x110>
    d5ac:	e51b3010 	ldr	r3, [fp, #-16]
    d5b0:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    d5b4:	e3530003 	cmp	r3, #3
    d5b8:	1a000002 	bne	d5c8 <rlsmtx+0x110>
    d5bc:	e51b3010 	ldr	r3, [fp, #-16]
    d5c0:	e3a02002 	mov	r2, #2
    d5c4:	e1c324b8 	strh	r2, [r3, #72]	; 0x48
    d5c8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d5cc:	e593200c 	ldr	r2, [r3, #12]
    d5d0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d5d4:	e5933010 	ldr	r3, [r3, #16]
    d5d8:	e1520003 	cmp	r2, r3
    d5dc:	1a000007 	bne	d600 <rlsmtx+0x148>
    d5e0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d5e4:	e3a02000 	mov	r2, #0
    d5e8:	e5832010 	str	r2, [r3, #16]
    d5ec:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d5f0:	e5932010 	ldr	r2, [r3, #16]
    d5f4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d5f8:	e583200c 	str	r2, [r3, #12]
    d5fc:	ea000004 	b	d614 <rlsmtx+0x15c>
    d600:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d604:	e593300c 	ldr	r3, [r3, #12]
    d608:	e5932070 	ldr	r2, [r3, #112]	; 0x70
    d60c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d610:	e583200c 	str	r2, [r3, #12]
    d614:	e30f3f04 	movw	r3, #65284	; 0xff04
    d618:	e3403000 	movt	r3, #0
    d61c:	e5933000 	ldr	r3, [r3]
    d620:	e2033002 	and	r3, r3, #2
    d624:	e3530000 	cmp	r3, #0
    d628:	0a000003 	beq	d63c <rlsmtx+0x184>
    d62c:	e51b000c 	ldr	r0, [fp, #-12]
    d630:	ebffeaec 	bl	81e8 <set_enable>
    d634:	ebffeb94 	bl	848c <dispatch>
    d638:	f10c0080 	cpsid	i
    d63c:	e3a03001 	mov	r3, #1
    d640:	e50b3008 	str	r3, [fp, #-8]
    d644:	ea000002 	b	d654 <rlsmtx+0x19c>
    d648:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d64c:	e3a02000 	mov	r2, #0
    d650:	e5832008 	str	r2, [r3, #8]
    d654:	e51b000c 	ldr	r0, [fp, #-12]
    d658:	ebffeae2 	bl	81e8 <set_enable>
    d65c:	e51b3008 	ldr	r3, [fp, #-8]
    d660:	e1a00003 	mov	r0, r3
    d664:	e24bd004 	sub	sp, fp, #4
    d668:	e8bd8800 	pop	{fp, pc}

0000d66c <create_timer>:
    d66c:	e92d4800 	push	{fp, lr}
    d670:	e28db004 	add	fp, sp, #4
    d674:	e24dd018 	sub	sp, sp, #24
    d678:	e50b0010 	str	r0, [fp, #-16]
    d67c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    d680:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    d684:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    d688:	e3a03000 	mov	r3, #0
    d68c:	e50b3008 	str	r3, [fp, #-8]
    d690:	e30f3f04 	movw	r3, #65284	; 0xff04
    d694:	e3403000 	movt	r3, #0
    d698:	e5933000 	ldr	r3, [r3]
    d69c:	e2033001 	and	r3, r3, #1
    d6a0:	e3530000 	cmp	r3, #0
    d6a4:	1a000001 	bne	d6b0 <create_timer+0x44>
    d6a8:	e3a03000 	mov	r3, #0
    d6ac:	ea00008f 	b	d8f0 <create_timer+0x284>
    d6b0:	e3a03000 	mov	r3, #0
    d6b4:	e50b3010 	str	r3, [fp, #-16]
    d6b8:	e51b3010 	ldr	r3, [fp, #-16]
    d6bc:	e3530000 	cmp	r3, #0
    d6c0:	0a000089 	beq	d8ec <create_timer+0x280>
    d6c4:	e24dd004 	sub	sp, sp, #4
    d6c8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    d6cc:	e10f0000 	mrs	r0, CPSR
    d6d0:	e58d0004 	str	r0, [sp, #4]
    d6d4:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    d6d8:	e3003334 	movw	r3, #820	; 0x334
    d6dc:	e3403001 	movt	r3, #1
    d6e0:	e5933000 	ldr	r3, [r3]
    d6e4:	e2832001 	add	r2, r3, #1
    d6e8:	e3003334 	movw	r3, #820	; 0x334
    d6ec:	e3403001 	movt	r3, #1
    d6f0:	e5832000 	str	r2, [r3]
    d6f4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    d6f8:	e59d0004 	ldr	r0, [sp, #4]
    d6fc:	e129f000 	msr	CPSR_fc, r0
    d700:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    d704:	e28dd004 	add	sp, sp, #4
    d708:	e3a0002c 	mov	r0, #44	; 0x2c
    d70c:	eb000840 	bl	f814 <malloc>
    d710:	e1a03000 	mov	r3, r0
    d714:	e50b3008 	str	r3, [fp, #-8]
    d718:	e51b3008 	ldr	r3, [fp, #-8]
    d71c:	e3530000 	cmp	r3, #0
    d720:	0a000060 	beq	d8a8 <create_timer+0x23c>
    d724:	e24dd004 	sub	sp, sp, #4
    d728:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    d72c:	e10f0000 	mrs	r0, CPSR
    d730:	e58d0004 	str	r0, [sp, #4]
    d734:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    d738:	e3003334 	movw	r3, #820	; 0x334
    d73c:	e3403001 	movt	r3, #1
    d740:	e5933000 	ldr	r3, [r3]
    d744:	e2432001 	sub	r2, r3, #1
    d748:	e3003334 	movw	r3, #820	; 0x334
    d74c:	e3403001 	movt	r3, #1
    d750:	e5832000 	str	r2, [r3]
    d754:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    d758:	e59d0004 	ldr	r0, [sp, #4]
    d75c:	e129f000 	msr	CPSR_fc, r0
    d760:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    d764:	e28dd004 	add	sp, sp, #4
    d768:	e51b3008 	ldr	r3, [fp, #-8]
    d76c:	e51b2010 	ldr	r2, [fp, #-16]
    d770:	e5832000 	str	r2, [r3]
    d774:	e51b3008 	ldr	r3, [fp, #-8]
    d778:	e59b2008 	ldr	r2, [fp, #8]
    d77c:	e5832018 	str	r2, [r3, #24]
    d780:	e51b3008 	ldr	r3, [fp, #-8]
    d784:	e3a02000 	mov	r2, #0
    d788:	e583201c 	str	r2, [r3, #28]
    d78c:	e51b3008 	ldr	r3, [fp, #-8]
    d790:	e59b2004 	ldr	r2, [fp, #4]
    d794:	e5832024 	str	r2, [r3, #36]	; 0x24
    d798:	e51b3008 	ldr	r3, [fp, #-8]
    d79c:	e283300c 	add	r3, r3, #12
    d7a0:	e3a01000 	mov	r1, #0
    d7a4:	e1a00003 	mov	r0, r3
    d7a8:	ebffef5e 	bl	9528 <dfsm>
    d7ac:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    d7b0:	e3530000 	cmp	r3, #0
    d7b4:	0a000031 	beq	d880 <create_timer+0x214>
    d7b8:	e3e03000 	mvn	r3, #0
    d7bc:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    d7c0:	e51b101c 	ldr	r1, [fp, #-28]	; 0xffffffe4
    d7c4:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    d7c8:	ebffeb84 	bl	85e0 <create_task>
    d7cc:	e1a02000 	mov	r2, r0
    d7d0:	e51b3008 	ldr	r3, [fp, #-8]
    d7d4:	e5832020 	str	r2, [r3, #32]
    d7d8:	e51b3008 	ldr	r3, [fp, #-8]
    d7dc:	e5933020 	ldr	r3, [r3, #32]
    d7e0:	e3530000 	cmp	r3, #0
    d7e4:	ca000025 	bgt	d880 <create_timer+0x214>
    d7e8:	e24dd004 	sub	sp, sp, #4
    d7ec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    d7f0:	e10f0000 	mrs	r0, CPSR
    d7f4:	e58d0004 	str	r0, [sp, #4]
    d7f8:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    d7fc:	e3003334 	movw	r3, #820	; 0x334
    d800:	e3403001 	movt	r3, #1
    d804:	e5933000 	ldr	r3, [r3]
    d808:	e2832001 	add	r2, r3, #1
    d80c:	e3003334 	movw	r3, #820	; 0x334
    d810:	e3403001 	movt	r3, #1
    d814:	e5832000 	str	r2, [r3]
    d818:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    d81c:	e59d0004 	ldr	r0, [sp, #4]
    d820:	e129f000 	msr	CPSR_fc, r0
    d824:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    d828:	e28dd004 	add	sp, sp, #4
    d82c:	e51b0008 	ldr	r0, [fp, #-8]
    d830:	eb000843 	bl	f944 <free>
    d834:	e24dd004 	sub	sp, sp, #4
    d838:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    d83c:	e10f0000 	mrs	r0, CPSR
    d840:	e58d0004 	str	r0, [sp, #4]
    d844:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    d848:	e3003334 	movw	r3, #820	; 0x334
    d84c:	e3403001 	movt	r3, #1
    d850:	e5933000 	ldr	r3, [r3]
    d854:	e2432001 	sub	r2, r3, #1
    d858:	e3003334 	movw	r3, #820	; 0x334
    d85c:	e3403001 	movt	r3, #1
    d860:	e5832000 	str	r2, [r3]
    d864:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    d868:	e59d0004 	ldr	r0, [sp, #4]
    d86c:	e129f000 	msr	CPSR_fc, r0
    d870:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    d874:	e28dd004 	add	sp, sp, #4
    d878:	e3a03000 	mov	r3, #0
    d87c:	e50b3008 	str	r3, [fp, #-8]
    d880:	e51b3008 	ldr	r3, [fp, #-8]
    d884:	e3530000 	cmp	r3, #0
    d888:	0a000017 	beq	d8ec <create_timer+0x280>
    d88c:	e59b3008 	ldr	r3, [fp, #8]
    d890:	e2033010 	and	r3, r3, #16
    d894:	e3530000 	cmp	r3, #0
    d898:	0a000013 	beq	d8ec <create_timer+0x280>
    d89c:	e51b0008 	ldr	r0, [fp, #-8]
    d8a0:	eb000015 	bl	d8fc <start_timer>
    d8a4:	ea000010 	b	d8ec <create_timer+0x280>
    d8a8:	e24dd004 	sub	sp, sp, #4
    d8ac:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    d8b0:	e10f0000 	mrs	r0, CPSR
    d8b4:	e58d0004 	str	r0, [sp, #4]
    d8b8:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    d8bc:	e3003334 	movw	r3, #820	; 0x334
    d8c0:	e3403001 	movt	r3, #1
    d8c4:	e5933000 	ldr	r3, [r3]
    d8c8:	e2432001 	sub	r2, r3, #1
    d8cc:	e3003334 	movw	r3, #820	; 0x334
    d8d0:	e3403001 	movt	r3, #1
    d8d4:	e5832000 	str	r2, [r3]
    d8d8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    d8dc:	e59d0004 	ldr	r0, [sp, #4]
    d8e0:	e129f000 	msr	CPSR_fc, r0
    d8e4:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    d8e8:	e28dd004 	add	sp, sp, #4
    d8ec:	e51b3008 	ldr	r3, [fp, #-8]
    d8f0:	e1a00003 	mov	r0, r3
    d8f4:	e24bd004 	sub	sp, fp, #4
    d8f8:	e8bd8800 	pop	{fp, pc}

0000d8fc <start_timer>:
    d8fc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    d900:	e28db000 	add	fp, sp, #0
    d904:	e24dd01c 	sub	sp, sp, #28
    d908:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    d90c:	e3e03000 	mvn	r3, #0
    d910:	e50b3008 	str	r3, [fp, #-8]
    d914:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d918:	e3530000 	cmp	r3, #0
    d91c:	0a000066 	beq	dabc <start_timer+0x1c0>
    d920:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d924:	e593301c 	ldr	r3, [r3, #28]
    d928:	e3530000 	cmp	r3, #0
    d92c:	1a000062 	bne	dabc <start_timer+0x1c0>
    d930:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d934:	e5933000 	ldr	r3, [r3]
    d938:	e50b300c 	str	r3, [fp, #-12]
    d93c:	e30f3f10 	movw	r3, #65296	; 0xff10
    d940:	e3403000 	movt	r3, #0
    d944:	e5933000 	ldr	r3, [r3]
    d948:	e2832001 	add	r2, r3, #1
    d94c:	e30f3f10 	movw	r3, #65296	; 0xff10
    d950:	e3403000 	movt	r3, #0
    d954:	e5832000 	str	r2, [r3]
    d958:	e3003338 	movw	r3, #824	; 0x338
    d95c:	e3403001 	movt	r3, #1
    d960:	e5933000 	ldr	r3, [r3]
    d964:	e3530000 	cmp	r3, #0
    d968:	0a000039 	beq	da54 <start_timer+0x158>
    d96c:	e3003338 	movw	r3, #824	; 0x338
    d970:	e3403001 	movt	r3, #1
    d974:	e5933000 	ldr	r3, [r3]
    d978:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    d97c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    d980:	e50b3010 	str	r3, [fp, #-16]
    d984:	ea000009 	b	d9b0 <start_timer+0xb4>
    d988:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    d98c:	e50b3010 	str	r3, [fp, #-16]
    d990:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    d994:	e5933028 	ldr	r3, [r3, #40]	; 0x28
    d998:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    d99c:	e51b3010 	ldr	r3, [fp, #-16]
    d9a0:	e5933004 	ldr	r3, [r3, #4]
    d9a4:	e51b200c 	ldr	r2, [fp, #-12]
    d9a8:	e0423003 	sub	r3, r2, r3
    d9ac:	e50b300c 	str	r3, [fp, #-12]
    d9b0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    d9b4:	e3530000 	cmp	r3, #0
    d9b8:	0a000004 	beq	d9d0 <start_timer+0xd4>
    d9bc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    d9c0:	e5933004 	ldr	r3, [r3, #4]
    d9c4:	e51b200c 	ldr	r2, [fp, #-12]
    d9c8:	e1520003 	cmp	r2, r3
    d9cc:	2affffed 	bcs	d988 <start_timer+0x8c>
    d9d0:	e3003338 	movw	r3, #824	; 0x338
    d9d4:	e3403001 	movt	r3, #1
    d9d8:	e5933000 	ldr	r3, [r3]
    d9dc:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    d9e0:	e1520003 	cmp	r2, r3
    d9e4:	1a000004 	bne	d9fc <start_timer+0x100>
    d9e8:	e3003338 	movw	r3, #824	; 0x338
    d9ec:	e3403001 	movt	r3, #1
    d9f0:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    d9f4:	e5832000 	str	r2, [r3]
    d9f8:	ea000002 	b	da08 <start_timer+0x10c>
    d9fc:	e51b3010 	ldr	r3, [fp, #-16]
    da00:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    da04:	e5832028 	str	r2, [r3, #40]	; 0x28
    da08:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    da0c:	e51b200c 	ldr	r2, [fp, #-12]
    da10:	e5832004 	str	r2, [r3, #4]
    da14:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    da18:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    da1c:	e5832028 	str	r2, [r3, #40]	; 0x28
    da20:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    da24:	e3530000 	cmp	r3, #0
    da28:	0a000017 	beq	da8c <start_timer+0x190>
    da2c:	e51b300c 	ldr	r3, [fp, #-12]
    da30:	e3530000 	cmp	r3, #0
    da34:	0a000014 	beq	da8c <start_timer+0x190>
    da38:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    da3c:	e5932004 	ldr	r2, [r3, #4]
    da40:	e51b300c 	ldr	r3, [fp, #-12]
    da44:	e0422003 	sub	r2, r2, r3
    da48:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    da4c:	e5832004 	str	r2, [r3, #4]
    da50:	ea00000d 	b	da8c <start_timer+0x190>
    da54:	e3003338 	movw	r3, #824	; 0x338
    da58:	e3403001 	movt	r3, #1
    da5c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    da60:	e5832000 	str	r2, [r3]
    da64:	e3003338 	movw	r3, #824	; 0x338
    da68:	e3403001 	movt	r3, #1
    da6c:	e5933000 	ldr	r3, [r3]
    da70:	e3a02000 	mov	r2, #0
    da74:	e5832028 	str	r2, [r3, #40]	; 0x28
    da78:	e3003338 	movw	r3, #824	; 0x338
    da7c:	e3403001 	movt	r3, #1
    da80:	e5933000 	ldr	r3, [r3]
    da84:	e51b200c 	ldr	r2, [fp, #-12]
    da88:	e5832004 	str	r2, [r3, #4]
    da8c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    da90:	e3a02001 	mov	r2, #1
    da94:	e583201c 	str	r2, [r3, #28]
    da98:	e30f3f10 	movw	r3, #65296	; 0xff10
    da9c:	e3403000 	movt	r3, #0
    daa0:	e5933000 	ldr	r3, [r3]
    daa4:	e2432001 	sub	r2, r3, #1
    daa8:	e30f3f10 	movw	r3, #65296	; 0xff10
    daac:	e3403000 	movt	r3, #0
    dab0:	e5832000 	str	r2, [r3]
    dab4:	e3a03000 	mov	r3, #0
    dab8:	e50b3008 	str	r3, [fp, #-8]
    dabc:	e51b3008 	ldr	r3, [fp, #-8]
    dac0:	e1a00003 	mov	r0, r3
    dac4:	e28bd000 	add	sp, fp, #0
    dac8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    dacc:	e12fff1e 	bx	lr

0000dad0 <stop_timer>:
    dad0:	e92d4800 	push	{fp, lr}
    dad4:	e28db004 	add	fp, sp, #4
    dad8:	e24dd018 	sub	sp, sp, #24
    dadc:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    dae0:	e3e03000 	mvn	r3, #0
    dae4:	e50b3008 	str	r3, [fp, #-8]
    dae8:	e24dd004 	sub	sp, sp, #4
    daec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    daf0:	e10f0000 	mrs	r0, CPSR
    daf4:	e58d0004 	str	r0, [sp, #4]
    daf8:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    dafc:	e3003334 	movw	r3, #820	; 0x334
    db00:	e3403001 	movt	r3, #1
    db04:	e5933000 	ldr	r3, [r3]
    db08:	e2832001 	add	r2, r3, #1
    db0c:	e3003334 	movw	r3, #820	; 0x334
    db10:	e3403001 	movt	r3, #1
    db14:	e5832000 	str	r2, [r3]
    db18:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    db1c:	e59d0004 	ldr	r0, [sp, #4]
    db20:	e129f000 	msr	CPSR_fc, r0
    db24:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    db28:	e28dd004 	add	sp, sp, #4
    db2c:	e3003338 	movw	r3, #824	; 0x338
    db30:	e3403001 	movt	r3, #1
    db34:	e5933000 	ldr	r3, [r3]
    db38:	e3530000 	cmp	r3, #0
    db3c:	0a000051 	beq	dc88 <stop_timer+0x1b8>
    db40:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    db44:	e3530000 	cmp	r3, #0
    db48:	0a00004e 	beq	dc88 <stop_timer+0x1b8>
    db4c:	e30f3f10 	movw	r3, #65296	; 0xff10
    db50:	e3403000 	movt	r3, #0
    db54:	e5933000 	ldr	r3, [r3]
    db58:	e2832001 	add	r2, r3, #1
    db5c:	e30f3f10 	movw	r3, #65296	; 0xff10
    db60:	e3403000 	movt	r3, #0
    db64:	e5832000 	str	r2, [r3]
    db68:	e3a03000 	mov	r3, #0
    db6c:	e50b300c 	str	r3, [fp, #-12]
    db70:	e3003338 	movw	r3, #824	; 0x338
    db74:	e3403001 	movt	r3, #1
    db78:	e5933000 	ldr	r3, [r3]
    db7c:	e50b3010 	str	r3, [fp, #-16]
    db80:	ea000004 	b	db98 <stop_timer+0xc8>
    db84:	e51b3010 	ldr	r3, [fp, #-16]
    db88:	e50b300c 	str	r3, [fp, #-12]
    db8c:	e51b3010 	ldr	r3, [fp, #-16]
    db90:	e5933028 	ldr	r3, [r3, #40]	; 0x28
    db94:	e50b3010 	str	r3, [fp, #-16]
    db98:	e51b3010 	ldr	r3, [fp, #-16]
    db9c:	e3530000 	cmp	r3, #0
    dba0:	0a000003 	beq	dbb4 <stop_timer+0xe4>
    dba4:	e51b2010 	ldr	r2, [fp, #-16]
    dba8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    dbac:	e1520003 	cmp	r2, r3
    dbb0:	1afffff3 	bne	db84 <stop_timer+0xb4>
    dbb4:	e51b2010 	ldr	r2, [fp, #-16]
    dbb8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    dbbc:	e1520003 	cmp	r2, r3
    dbc0:	1a000029 	bne	dc6c <stop_timer+0x19c>
    dbc4:	e51b3010 	ldr	r3, [fp, #-16]
    dbc8:	e5933028 	ldr	r3, [r3, #40]	; 0x28
    dbcc:	e3530000 	cmp	r3, #0
    dbd0:	0a00000c 	beq	dc08 <stop_timer+0x138>
    dbd4:	e51b3010 	ldr	r3, [fp, #-16]
    dbd8:	e5933004 	ldr	r3, [r3, #4]
    dbdc:	e3530000 	cmp	r3, #0
    dbe0:	0a000008 	beq	dc08 <stop_timer+0x138>
    dbe4:	e51b3010 	ldr	r3, [fp, #-16]
    dbe8:	e5933028 	ldr	r3, [r3, #40]	; 0x28
    dbec:	e5931004 	ldr	r1, [r3, #4]
    dbf0:	e51b3010 	ldr	r3, [fp, #-16]
    dbf4:	e5932004 	ldr	r2, [r3, #4]
    dbf8:	e51b3010 	ldr	r3, [fp, #-16]
    dbfc:	e5933028 	ldr	r3, [r3, #40]	; 0x28
    dc00:	e0812002 	add	r2, r1, r2
    dc04:	e5832004 	str	r2, [r3, #4]
    dc08:	e51b300c 	ldr	r3, [fp, #-12]
    dc0c:	e3530000 	cmp	r3, #0
    dc10:	0a000004 	beq	dc28 <stop_timer+0x158>
    dc14:	e51b3010 	ldr	r3, [fp, #-16]
    dc18:	e5932028 	ldr	r2, [r3, #40]	; 0x28
    dc1c:	e51b300c 	ldr	r3, [fp, #-12]
    dc20:	e5832028 	str	r2, [r3, #40]	; 0x28
    dc24:	ea000004 	b	dc3c <stop_timer+0x16c>
    dc28:	e51b3010 	ldr	r3, [fp, #-16]
    dc2c:	e5932028 	ldr	r2, [r3, #40]	; 0x28
    dc30:	e3003338 	movw	r3, #824	; 0x338
    dc34:	e3403001 	movt	r3, #1
    dc38:	e5832000 	str	r2, [r3]
    dc3c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    dc40:	e3a02000 	mov	r2, #0
    dc44:	e583201c 	str	r2, [r3, #28]
    dc48:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    dc4c:	e283200c 	add	r2, r3, #12
    dc50:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    dc54:	e5933008 	ldr	r3, [r3, #8]
    dc58:	e1a01003 	mov	r1, r3
    dc5c:	e1a00002 	mov	r0, r2
    dc60:	ebffeef8 	bl	9848 <rlsm_count>
    dc64:	e3a03000 	mov	r3, #0
    dc68:	e50b3008 	str	r3, [fp, #-8]
    dc6c:	e30f3f10 	movw	r3, #65296	; 0xff10
    dc70:	e3403000 	movt	r3, #0
    dc74:	e5933000 	ldr	r3, [r3]
    dc78:	e2432001 	sub	r2, r3, #1
    dc7c:	e30f3f10 	movw	r3, #65296	; 0xff10
    dc80:	e3403000 	movt	r3, #0
    dc84:	e5832000 	str	r2, [r3]
    dc88:	e24dd004 	sub	sp, sp, #4
    dc8c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    dc90:	e10f0000 	mrs	r0, CPSR
    dc94:	e58d0004 	str	r0, [sp, #4]
    dc98:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    dc9c:	e3003334 	movw	r3, #820	; 0x334
    dca0:	e3403001 	movt	r3, #1
    dca4:	e5933000 	ldr	r3, [r3]
    dca8:	e2432001 	sub	r2, r3, #1
    dcac:	e3003334 	movw	r3, #820	; 0x334
    dcb0:	e3403001 	movt	r3, #1
    dcb4:	e5832000 	str	r2, [r3]
    dcb8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    dcbc:	e59d0004 	ldr	r0, [sp, #4]
    dcc0:	e129f000 	msr	CPSR_fc, r0
    dcc4:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    dcc8:	e28dd004 	add	sp, sp, #4
    dccc:	e51b3008 	ldr	r3, [fp, #-8]
    dcd0:	e1a00003 	mov	r0, r3
    dcd4:	e24bd004 	sub	sp, fp, #4
    dcd8:	e8bd8800 	pop	{fp, pc}

0000dcdc <shot_timer>:
    dcdc:	e92d4800 	push	{fp, lr}
    dce0:	e28db004 	add	fp, sp, #4
    dce4:	e24dd018 	sub	sp, sp, #24
    dce8:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    dcec:	e3e03000 	mvn	r3, #0
    dcf0:	e50b3008 	str	r3, [fp, #-8]
    dcf4:	e3a03000 	mov	r3, #0
    dcf8:	e50b3010 	str	r3, [fp, #-16]
    dcfc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    dd00:	e3530000 	cmp	r3, #0
    dd04:	0a00008b 	beq	df38 <shot_timer+0x25c>
    dd08:	e24dd004 	sub	sp, sp, #4
    dd0c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    dd10:	e10f0000 	mrs	r0, CPSR
    dd14:	e58d0004 	str	r0, [sp, #4]
    dd18:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    dd1c:	e3003334 	movw	r3, #820	; 0x334
    dd20:	e3403001 	movt	r3, #1
    dd24:	e5933000 	ldr	r3, [r3]
    dd28:	e2832001 	add	r2, r3, #1
    dd2c:	e3003334 	movw	r3, #820	; 0x334
    dd30:	e3403001 	movt	r3, #1
    dd34:	e5832000 	str	r2, [r3]
    dd38:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    dd3c:	e59d0004 	ldr	r0, [sp, #4]
    dd40:	e129f000 	msr	CPSR_fc, r0
    dd44:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    dd48:	e28dd004 	add	sp, sp, #4
    dd4c:	e3003338 	movw	r3, #824	; 0x338
    dd50:	e3403001 	movt	r3, #1
    dd54:	e5933000 	ldr	r3, [r3]
    dd58:	e3530000 	cmp	r3, #0
    dd5c:	0a000045 	beq	de78 <shot_timer+0x19c>
    dd60:	e30f3f10 	movw	r3, #65296	; 0xff10
    dd64:	e3403000 	movt	r3, #0
    dd68:	e5933000 	ldr	r3, [r3]
    dd6c:	e2832001 	add	r2, r3, #1
    dd70:	e30f3f10 	movw	r3, #65296	; 0xff10
    dd74:	e3403000 	movt	r3, #0
    dd78:	e5832000 	str	r2, [r3]
    dd7c:	e3a03000 	mov	r3, #0
    dd80:	e50b300c 	str	r3, [fp, #-12]
    dd84:	e3003338 	movw	r3, #824	; 0x338
    dd88:	e3403001 	movt	r3, #1
    dd8c:	e5933000 	ldr	r3, [r3]
    dd90:	e50b3010 	str	r3, [fp, #-16]
    dd94:	ea000004 	b	ddac <shot_timer+0xd0>
    dd98:	e51b3010 	ldr	r3, [fp, #-16]
    dd9c:	e50b300c 	str	r3, [fp, #-12]
    dda0:	e51b3010 	ldr	r3, [fp, #-16]
    dda4:	e5933028 	ldr	r3, [r3, #40]	; 0x28
    dda8:	e50b3010 	str	r3, [fp, #-16]
    ddac:	e51b3010 	ldr	r3, [fp, #-16]
    ddb0:	e3530000 	cmp	r3, #0
    ddb4:	0a000003 	beq	ddc8 <shot_timer+0xec>
    ddb8:	e51b2010 	ldr	r2, [fp, #-16]
    ddbc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    ddc0:	e1520003 	cmp	r2, r3
    ddc4:	1afffff3 	bne	dd98 <shot_timer+0xbc>
    ddc8:	e51b2010 	ldr	r2, [fp, #-16]
    ddcc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    ddd0:	e1520003 	cmp	r2, r3
    ddd4:	1a000020 	bne	de5c <shot_timer+0x180>
    ddd8:	e51b3010 	ldr	r3, [fp, #-16]
    dddc:	e5933028 	ldr	r3, [r3, #40]	; 0x28
    dde0:	e3530000 	cmp	r3, #0
    dde4:	0a00000c 	beq	de1c <shot_timer+0x140>
    dde8:	e51b3010 	ldr	r3, [fp, #-16]
    ddec:	e5933004 	ldr	r3, [r3, #4]
    ddf0:	e3530000 	cmp	r3, #0
    ddf4:	0a000008 	beq	de1c <shot_timer+0x140>
    ddf8:	e51b3010 	ldr	r3, [fp, #-16]
    ddfc:	e5933028 	ldr	r3, [r3, #40]	; 0x28
    de00:	e5931004 	ldr	r1, [r3, #4]
    de04:	e51b3010 	ldr	r3, [fp, #-16]
    de08:	e5932004 	ldr	r2, [r3, #4]
    de0c:	e51b3010 	ldr	r3, [fp, #-16]
    de10:	e5933028 	ldr	r3, [r3, #40]	; 0x28
    de14:	e0812002 	add	r2, r1, r2
    de18:	e5832004 	str	r2, [r3, #4]
    de1c:	e51b300c 	ldr	r3, [fp, #-12]
    de20:	e3530000 	cmp	r3, #0
    de24:	0a000004 	beq	de3c <shot_timer+0x160>
    de28:	e51b3010 	ldr	r3, [fp, #-16]
    de2c:	e5932028 	ldr	r2, [r3, #40]	; 0x28
    de30:	e51b300c 	ldr	r3, [fp, #-12]
    de34:	e5832028 	str	r2, [r3, #40]	; 0x28
    de38:	ea000004 	b	de50 <shot_timer+0x174>
    de3c:	e51b3010 	ldr	r3, [fp, #-16]
    de40:	e5932028 	ldr	r2, [r3, #40]	; 0x28
    de44:	e3003338 	movw	r3, #824	; 0x338
    de48:	e3403001 	movt	r3, #1
    de4c:	e5832000 	str	r2, [r3]
    de50:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    de54:	e3a02000 	mov	r2, #0
    de58:	e583201c 	str	r2, [r3, #28]
    de5c:	e30f3f10 	movw	r3, #65296	; 0xff10
    de60:	e3403000 	movt	r3, #0
    de64:	e5933000 	ldr	r3, [r3]
    de68:	e2432001 	sub	r2, r3, #1
    de6c:	e30f3f10 	movw	r3, #65296	; 0xff10
    de70:	e3403000 	movt	r3, #0
    de74:	e5832000 	str	r2, [r3]
    de78:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    de7c:	e283200c 	add	r2, r3, #12
    de80:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    de84:	e5933008 	ldr	r3, [r3, #8]
    de88:	e1a01003 	mov	r1, r3
    de8c:	e1a00002 	mov	r0, r2
    de90:	ebffee6c 	bl	9848 <rlsm_count>
    de94:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    de98:	e5933020 	ldr	r3, [r3, #32]
    de9c:	e3530000 	cmp	r3, #0
    dea0:	0a000006 	beq	dec0 <shot_timer+0x1e4>
    dea4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    dea8:	e5932020 	ldr	r2, [r3, #32]
    deac:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    deb0:	e5933024 	ldr	r3, [r3, #36]	; 0x24
    deb4:	e1a01003 	mov	r1, r3
    deb8:	e1a00002 	mov	r0, r2
    debc:	ebffece6 	bl	925c <sptsk>
    dec0:	e51b2010 	ldr	r2, [fp, #-16]
    dec4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    dec8:	e1520003 	cmp	r2, r3
    decc:	1a000006 	bne	deec <shot_timer+0x210>
    ded0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    ded4:	e5933018 	ldr	r3, [r3, #24]
    ded8:	e2033001 	and	r3, r3, #1
    dedc:	e3530000 	cmp	r3, #0
    dee0:	0a000001 	beq	deec <shot_timer+0x210>
    dee4:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    dee8:	ebfffe83 	bl	d8fc <start_timer>
    deec:	e24dd004 	sub	sp, sp, #4
    def0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    def4:	e10f0000 	mrs	r0, CPSR
    def8:	e58d0004 	str	r0, [sp, #4]
    defc:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    df00:	e3003334 	movw	r3, #820	; 0x334
    df04:	e3403001 	movt	r3, #1
    df08:	e5933000 	ldr	r3, [r3]
    df0c:	e2432001 	sub	r2, r3, #1
    df10:	e3003334 	movw	r3, #820	; 0x334
    df14:	e3403001 	movt	r3, #1
    df18:	e5832000 	str	r2, [r3]
    df1c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    df20:	e59d0004 	ldr	r0, [sp, #4]
    df24:	e129f000 	msr	CPSR_fc, r0
    df28:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    df2c:	e28dd004 	add	sp, sp, #4
    df30:	e3a03000 	mov	r3, #0
    df34:	e50b3008 	str	r3, [fp, #-8]
    df38:	e51b3008 	ldr	r3, [fp, #-8]
    df3c:	e1a00003 	mov	r0, r3
    df40:	e24bd004 	sub	sp, fp, #4
    df44:	e8bd8800 	pop	{fp, pc}

0000df48 <wait_on_timer>:
    df48:	e92d4800 	push	{fp, lr}
    df4c:	e28db004 	add	fp, sp, #4
    df50:	e24dd018 	sub	sp, sp, #24
    df54:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    df58:	e3a03000 	mov	r3, #0
    df5c:	e50b3008 	str	r3, [fp, #-8]
    df60:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    df64:	e3530000 	cmp	r3, #0
    df68:	0a00004b 	beq	e09c <wait_on_timer+0x154>
    df6c:	ebffe893 	bl	81c0 <set_disable>
    df70:	e50b000c 	str	r0, [fp, #-12]
    df74:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    df78:	e5933008 	ldr	r3, [r3, #8]
    df7c:	e2832001 	add	r2, r3, #1
    df80:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    df84:	e5832008 	str	r2, [r3, #8]
    df88:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    df8c:	e283300c 	add	r3, r3, #12
    df90:	e50b3010 	str	r3, [fp, #-16]
    df94:	e51b3010 	ldr	r3, [fp, #-16]
    df98:	e5933000 	ldr	r3, [r3]
    df9c:	e2432001 	sub	r2, r3, #1
    dfa0:	e51b3010 	ldr	r3, [fp, #-16]
    dfa4:	e5832000 	str	r2, [r3]
    dfa8:	e51b3010 	ldr	r3, [fp, #-16]
    dfac:	e5933000 	ldr	r3, [r3]
    dfb0:	e3530000 	cmp	r3, #0
    dfb4:	aa000036 	bge	e094 <wait_on_timer+0x14c>
    dfb8:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    dfbc:	e3403000 	movt	r3, #0
    dfc0:	e5933000 	ldr	r3, [r3]
    dfc4:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    dfc8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    dfcc:	e3a02000 	mov	r2, #0
    dfd0:	e5832070 	str	r2, [r3, #112]	; 0x70
    dfd4:	e51b3010 	ldr	r3, [fp, #-16]
    dfd8:	e5933004 	ldr	r3, [r3, #4]
    dfdc:	e3530000 	cmp	r3, #0
    dfe0:	1a000007 	bne	e004 <wait_on_timer+0xbc>
    dfe4:	e51b3010 	ldr	r3, [fp, #-16]
    dfe8:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    dfec:	e5832008 	str	r2, [r3, #8]
    dff0:	e51b3010 	ldr	r3, [fp, #-16]
    dff4:	e5932008 	ldr	r2, [r3, #8]
    dff8:	e51b3010 	ldr	r3, [fp, #-16]
    dffc:	e5832004 	str	r2, [r3, #4]
    e000:	ea000006 	b	e020 <wait_on_timer+0xd8>
    e004:	e51b3010 	ldr	r3, [fp, #-16]
    e008:	e5933008 	ldr	r3, [r3, #8]
    e00c:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    e010:	e5832070 	str	r2, [r3, #112]	; 0x70
    e014:	e51b3010 	ldr	r3, [fp, #-16]
    e018:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    e01c:	e5832008 	str	r2, [r3, #8]
    e020:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    e024:	e3403000 	movt	r3, #0
    e028:	e5933000 	ldr	r3, [r3]
    e02c:	e3a02000 	mov	r2, #0
    e030:	e1c324ba 	strh	r2, [r3, #74]	; 0x4a
    e034:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    e038:	e3403000 	movt	r3, #0
    e03c:	e5933000 	ldr	r3, [r3]
    e040:	e3a02003 	mov	r2, #3
    e044:	e1c324b8 	strh	r2, [r3, #72]	; 0x48
    e048:	e51b000c 	ldr	r0, [fp, #-12]
    e04c:	ebffe865 	bl	81e8 <set_enable>
    e050:	ea000006 	b	e070 <wait_on_timer+0x128>
    e054:	e30f3f04 	movw	r3, #65284	; 0xff04
    e058:	e3403000 	movt	r3, #0
    e05c:	e5933000 	ldr	r3, [r3]
    e060:	e2033002 	and	r3, r3, #2
    e064:	e3530000 	cmp	r3, #0
    e068:	0a000000 	beq	e070 <wait_on_timer+0x128>
    e06c:	ef000060 	svc	0x00000060
    e070:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    e074:	e3403000 	movt	r3, #0
    e078:	e5933000 	ldr	r3, [r3]
    e07c:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    e080:	e3530003 	cmp	r3, #3
    e084:	0afffff2 	beq	e054 <wait_on_timer+0x10c>
    e088:	ebffe84c 	bl	81c0 <set_disable>
    e08c:	e3a03001 	mov	r3, #1
    e090:	e50b3008 	str	r3, [fp, #-8]
    e094:	e51b000c 	ldr	r0, [fp, #-12]
    e098:	ebffe852 	bl	81e8 <set_enable>
    e09c:	e51b3008 	ldr	r3, [fp, #-8]
    e0a0:	e1a00003 	mov	r0, r3
    e0a4:	e24bd004 	sub	sp, fp, #4
    e0a8:	e8bd8800 	pop	{fp, pc}

0000e0ac <delete_timer>:
    e0ac:	e92d4800 	push	{fp, lr}
    e0b0:	e28db004 	add	fp, sp, #4
    e0b4:	e24dd010 	sub	sp, sp, #16
    e0b8:	e50b0010 	str	r0, [fp, #-16]
    e0bc:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    e0c0:	e3e03000 	mvn	r3, #0
    e0c4:	e50b3008 	str	r3, [fp, #-8]
    e0c8:	e24dd004 	sub	sp, sp, #4
    e0cc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    e0d0:	e10f0000 	mrs	r0, CPSR
    e0d4:	e58d0004 	str	r0, [sp, #4]
    e0d8:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    e0dc:	e3003334 	movw	r3, #820	; 0x334
    e0e0:	e3403001 	movt	r3, #1
    e0e4:	e5933000 	ldr	r3, [r3]
    e0e8:	e2832001 	add	r2, r3, #1
    e0ec:	e3003334 	movw	r3, #820	; 0x334
    e0f0:	e3403001 	movt	r3, #1
    e0f4:	e5832000 	str	r2, [r3]
    e0f8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    e0fc:	e59d0004 	ldr	r0, [sp, #4]
    e100:	e129f000 	msr	CPSR_fc, r0
    e104:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    e108:	e28dd004 	add	sp, sp, #4
    e10c:	e3003338 	movw	r3, #824	; 0x338
    e110:	e3403001 	movt	r3, #1
    e114:	e5933000 	ldr	r3, [r3]
    e118:	e3530000 	cmp	r3, #0
    e11c:	0a000058 	beq	e284 <delete_timer+0x1d8>
    e120:	e51b3010 	ldr	r3, [fp, #-16]
    e124:	e3530000 	cmp	r3, #0
    e128:	0a000055 	beq	e284 <delete_timer+0x1d8>
    e12c:	e51b0010 	ldr	r0, [fp, #-16]
    e130:	ebfffe66 	bl	dad0 <stop_timer>
    e134:	e50b0008 	str	r0, [fp, #-8]
    e138:	e51b3010 	ldr	r3, [fp, #-16]
    e13c:	e5933020 	ldr	r3, [r3, #32]
    e140:	e50b300c 	str	r3, [fp, #-12]
    e144:	e51b300c 	ldr	r3, [fp, #-12]
    e148:	e3530000 	cmp	r3, #0
    e14c:	0a00004a 	beq	e27c <delete_timer+0x1d0>
    e150:	e30f3f38 	movw	r3, #65336	; 0xff38
    e154:	e3403000 	movt	r3, #0
    e158:	e51b200c 	ldr	r2, [fp, #-12]
    e15c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    e160:	e3530000 	cmp	r3, #0
    e164:	0a000044 	beq	e27c <delete_timer+0x1d0>
    e168:	e30f3f38 	movw	r3, #65336	; 0xff38
    e16c:	e3403000 	movt	r3, #0
    e170:	e51b200c 	ldr	r2, [fp, #-12]
    e174:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    e178:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    e17c:	e3530005 	cmp	r3, #5
    e180:	1a000004 	bne	e198 <delete_timer+0xec>
    e184:	e51b0010 	ldr	r0, [fp, #-16]
    e188:	eb0005ed 	bl	f944 <free>
    e18c:	e51b000c 	ldr	r0, [fp, #-12]
    e190:	ebffea4b 	bl	8ac4 <kill_task>
    e194:	ea00003a 	b	e284 <delete_timer+0x1d8>
    e198:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    e19c:	e3530000 	cmp	r3, #0
    e1a0:	0a000032 	beq	e270 <delete_timer+0x1c4>
    e1a4:	ea000025 	b	e240 <delete_timer+0x194>
    e1a8:	e24dd004 	sub	sp, sp, #4
    e1ac:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    e1b0:	e10f0000 	mrs	r0, CPSR
    e1b4:	e58d0004 	str	r0, [sp, #4]
    e1b8:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    e1bc:	e3003334 	movw	r3, #820	; 0x334
    e1c0:	e3403001 	movt	r3, #1
    e1c4:	e5933000 	ldr	r3, [r3]
    e1c8:	e2432001 	sub	r2, r3, #1
    e1cc:	e3003334 	movw	r3, #820	; 0x334
    e1d0:	e3403001 	movt	r3, #1
    e1d4:	e5832000 	str	r2, [r3]
    e1d8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    e1dc:	e59d0004 	ldr	r0, [sp, #4]
    e1e0:	e129f000 	msr	CPSR_fc, r0
    e1e4:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    e1e8:	e28dd004 	add	sp, sp, #4
    e1ec:	e3a00000 	mov	r0, #0
    e1f0:	e3a01000 	mov	r1, #0
    e1f4:	e3441049 	movt	r1, #16457	; 0x4049
    e1f8:	ebffeeb8 	bl	9ce0 <delay_task>
    e1fc:	e24dd004 	sub	sp, sp, #4
    e200:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    e204:	e10f0000 	mrs	r0, CPSR
    e208:	e58d0004 	str	r0, [sp, #4]
    e20c:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    e210:	e3003334 	movw	r3, #820	; 0x334
    e214:	e3403001 	movt	r3, #1
    e218:	e5933000 	ldr	r3, [r3]
    e21c:	e2832001 	add	r2, r3, #1
    e220:	e3003334 	movw	r3, #820	; 0x334
    e224:	e3403001 	movt	r3, #1
    e228:	e5832000 	str	r2, [r3]
    e22c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    e230:	e59d0004 	ldr	r0, [sp, #4]
    e234:	e129f000 	msr	CPSR_fc, r0
    e238:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    e23c:	e28dd004 	add	sp, sp, #4
    e240:	e30f3f38 	movw	r3, #65336	; 0xff38
    e244:	e3403000 	movt	r3, #0
    e248:	e51b200c 	ldr	r2, [fp, #-12]
    e24c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    e250:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    e254:	e3530005 	cmp	r3, #5
    e258:	1affffd2 	bne	e1a8 <delete_timer+0xfc>
    e25c:	e51b0010 	ldr	r0, [fp, #-16]
    e260:	eb0005b7 	bl	f944 <free>
    e264:	e51b000c 	ldr	r0, [fp, #-12]
    e268:	ebffea15 	bl	8ac4 <kill_task>
    e26c:	ea000004 	b	e284 <delete_timer+0x1d8>
    e270:	e3a03001 	mov	r3, #1
    e274:	e50b3008 	str	r3, [fp, #-8]
    e278:	ea000001 	b	e284 <delete_timer+0x1d8>
    e27c:	e51b0010 	ldr	r0, [fp, #-16]
    e280:	eb0005af 	bl	f944 <free>
    e284:	e24dd004 	sub	sp, sp, #4
    e288:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    e28c:	e10f0000 	mrs	r0, CPSR
    e290:	e58d0004 	str	r0, [sp, #4]
    e294:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    e298:	e3003334 	movw	r3, #820	; 0x334
    e29c:	e3403001 	movt	r3, #1
    e2a0:	e5933000 	ldr	r3, [r3]
    e2a4:	e2432001 	sub	r2, r3, #1
    e2a8:	e3003334 	movw	r3, #820	; 0x334
    e2ac:	e3403001 	movt	r3, #1
    e2b0:	e5832000 	str	r2, [r3]
    e2b4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    e2b8:	e59d0004 	ldr	r0, [sp, #4]
    e2bc:	e129f000 	msr	CPSR_fc, r0
    e2c0:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
    e2c4:	e28dd004 	add	sp, sp, #4
    e2c8:	e51b3008 	ldr	r3, [fp, #-8]
    e2cc:	e1a00003 	mov	r0, r3
    e2d0:	e24bd004 	sub	sp, fp, #4
    e2d4:	e8bd8800 	pop	{fp, pc}

0000e2d8 <shmem_alloc>:
    e2d8:	e92d4800 	push	{fp, lr}
    e2dc:	e28db004 	add	fp, sp, #4
    e2e0:	e24dd010 	sub	sp, sp, #16
    e2e4:	e50b0010 	str	r0, [fp, #-16]
    e2e8:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    e2ec:	e51b3010 	ldr	r3, [fp, #-16]
    e2f0:	e2833018 	add	r3, r3, #24
    e2f4:	e1a00003 	mov	r0, r3
    e2f8:	eb000545 	bl	f814 <malloc>
    e2fc:	e1a03000 	mov	r3, r0
    e300:	e50b3008 	str	r3, [fp, #-8]
    e304:	e51b3008 	ldr	r3, [fp, #-8]
    e308:	e2833018 	add	r3, r3, #24
    e30c:	e50b300c 	str	r3, [fp, #-12]
    e310:	e51b3008 	ldr	r3, [fp, #-8]
    e314:	e3a02000 	mov	r2, #0
    e318:	e583200c 	str	r2, [r3, #12]
    e31c:	e51b3008 	ldr	r3, [fp, #-8]
    e320:	e593200c 	ldr	r2, [r3, #12]
    e324:	e51b3008 	ldr	r3, [fp, #-8]
    e328:	e5832008 	str	r2, [r3, #8]
    e32c:	e51b3008 	ldr	r3, [fp, #-8]
    e330:	e3a02001 	mov	r2, #1
    e334:	e5c32010 	strb	r2, [r3, #16]
    e338:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    e33c:	e3530000 	cmp	r3, #0
    e340:	0a000005 	beq	e35c <shmem_alloc+0x84>
    e344:	e51b3008 	ldr	r3, [fp, #-8]
    e348:	e5d33010 	ldrb	r3, [r3, #16]
    e34c:	e3833008 	orr	r3, r3, #8
    e350:	e6ef2073 	uxtb	r2, r3
    e354:	e51b3008 	ldr	r3, [fp, #-8]
    e358:	e5c32010 	strb	r2, [r3, #16]
    e35c:	e51b3008 	ldr	r3, [fp, #-8]
    e360:	e3a02000 	mov	r2, #0
    e364:	e5832014 	str	r2, [r3, #20]
    e368:	e51b3008 	ldr	r3, [fp, #-8]
    e36c:	e3a02008 	mov	r2, #8
    e370:	e30f1dd0 	movw	r1, #64976	; 0xfdd0
    e374:	e3401000 	movt	r1, #0
    e378:	e1a00003 	mov	r0, r3
    e37c:	eb0005ae 	bl	fa3c <memcp>
    e380:	e51b300c 	ldr	r3, [fp, #-12]
    e384:	e1a00003 	mov	r0, r3
    e388:	e24bd004 	sub	sp, fp, #4
    e38c:	e8bd8800 	pop	{fp, pc}

0000e390 <shmem_free>:
    e390:	e92d4800 	push	{fp, lr}
    e394:	e28db004 	add	fp, sp, #4
    e398:	e24dd018 	sub	sp, sp, #24
    e39c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    e3a0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    e3a4:	e2433018 	sub	r3, r3, #24
    e3a8:	e50b300c 	str	r3, [fp, #-12]
    e3ac:	e51b300c 	ldr	r3, [fp, #-12]
    e3b0:	e3a02008 	mov	r2, #8
    e3b4:	e30f1dd0 	movw	r1, #64976	; 0xfdd0
    e3b8:	e3401000 	movt	r1, #0
    e3bc:	e1a00003 	mov	r0, r3
    e3c0:	eb0005d5 	bl	fb1c <memcm>
    e3c4:	e1a03000 	mov	r3, r0
    e3c8:	e3530000 	cmp	r3, #0
    e3cc:	0a000001 	beq	e3d8 <shmem_free+0x48>
    e3d0:	e3e03000 	mvn	r3, #0
    e3d4:	ea00001b 	b	e448 <shmem_free+0xb8>
    e3d8:	ebffe778 	bl	81c0 <set_disable>
    e3dc:	e50b0010 	str	r0, [fp, #-16]
    e3e0:	e51b300c 	ldr	r3, [fp, #-12]
    e3e4:	e5d33010 	ldrb	r3, [r3, #16]
    e3e8:	e2033001 	and	r3, r3, #1
    e3ec:	e3530000 	cmp	r3, #0
    e3f0:	0a000009 	beq	e41c <shmem_free+0x8c>
    e3f4:	e51b300c 	ldr	r3, [fp, #-12]
    e3f8:	e3a02008 	mov	r2, #8
    e3fc:	e3a01000 	mov	r1, #0
    e400:	e1a00003 	mov	r0, r3
    e404:	eb0005a9 	bl	fab0 <memse>
    e408:	e51b000c 	ldr	r0, [fp, #-12]
    e40c:	eb00054c 	bl	f944 <free>
    e410:	e3a03000 	mov	r3, #0
    e414:	e50b3008 	str	r3, [fp, #-8]
    e418:	ea000007 	b	e43c <shmem_free+0xac>
    e41c:	e51b300c 	ldr	r3, [fp, #-12]
    e420:	e5d33010 	ldrb	r3, [r3, #16]
    e424:	e3833010 	orr	r3, r3, #16
    e428:	e6ef2073 	uxtb	r2, r3
    e42c:	e51b300c 	ldr	r3, [fp, #-12]
    e430:	e5c32010 	strb	r2, [r3, #16]
    e434:	e3a03001 	mov	r3, #1
    e438:	e50b3008 	str	r3, [fp, #-8]
    e43c:	e51b0010 	ldr	r0, [fp, #-16]
    e440:	ebffe768 	bl	81e8 <set_enable>
    e444:	e51b3008 	ldr	r3, [fp, #-8]
    e448:	e1a00003 	mov	r0, r3
    e44c:	e24bd004 	sub	sp, fp, #4
    e450:	e8bd8800 	pop	{fp, pc}

0000e454 <shmem_rdlock>:
    e454:	e92d4800 	push	{fp, lr}
    e458:	e28db004 	add	fp, sp, #4
    e45c:	e24dd018 	sub	sp, sp, #24
    e460:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    e464:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    e468:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    e46c:	e2433018 	sub	r3, r3, #24
    e470:	e50b300c 	str	r3, [fp, #-12]
    e474:	e51b300c 	ldr	r3, [fp, #-12]
    e478:	e3a02008 	mov	r2, #8
    e47c:	e30f1dd0 	movw	r1, #64976	; 0xfdd0
    e480:	e3401000 	movt	r1, #0
    e484:	e1a00003 	mov	r0, r3
    e488:	eb0005a3 	bl	fb1c <memcm>
    e48c:	e1a03000 	mov	r3, r0
    e490:	e3530000 	cmp	r3, #0
    e494:	0a000001 	beq	e4a0 <shmem_rdlock+0x4c>
    e498:	e3e03000 	mvn	r3, #0
    e49c:	ea000096 	b	e6fc <shmem_rdlock+0x2a8>
    e4a0:	e51b300c 	ldr	r3, [fp, #-12]
    e4a4:	e5d33010 	ldrb	r3, [r3, #16]
    e4a8:	e2033010 	and	r3, r3, #16
    e4ac:	e3530000 	cmp	r3, #0
    e4b0:	0a000001 	beq	e4bc <shmem_rdlock+0x68>
    e4b4:	e3e03001 	mvn	r3, #1
    e4b8:	ea00008f 	b	e6fc <shmem_rdlock+0x2a8>
    e4bc:	ebffe73f 	bl	81c0 <set_disable>
    e4c0:	e50b0010 	str	r0, [fp, #-16]
    e4c4:	e51b300c 	ldr	r3, [fp, #-12]
    e4c8:	e5d33010 	ldrb	r3, [r3, #16]
    e4cc:	e2033001 	and	r3, r3, #1
    e4d0:	e3530000 	cmp	r3, #0
    e4d4:	0a00000e 	beq	e514 <shmem_rdlock+0xc0>
    e4d8:	e51b300c 	ldr	r3, [fp, #-12]
    e4dc:	e5d33010 	ldrb	r3, [r3, #16]
    e4e0:	e3c33001 	bic	r3, r3, #1
    e4e4:	e6ef2073 	uxtb	r2, r3
    e4e8:	e51b300c 	ldr	r3, [fp, #-12]
    e4ec:	e5c32010 	strb	r2, [r3, #16]
    e4f0:	e51b300c 	ldr	r3, [fp, #-12]
    e4f4:	e5d33010 	ldrb	r3, [r3, #16]
    e4f8:	e3833002 	orr	r3, r3, #2
    e4fc:	e6ef2073 	uxtb	r2, r3
    e500:	e51b300c 	ldr	r3, [fp, #-12]
    e504:	e5c32010 	strb	r2, [r3, #16]
    e508:	e3a03000 	mov	r3, #0
    e50c:	e50b3008 	str	r3, [fp, #-8]
    e510:	ea000026 	b	e5b0 <shmem_rdlock+0x15c>
    e514:	e51b300c 	ldr	r3, [fp, #-12]
    e518:	e5d33010 	ldrb	r3, [r3, #16]
    e51c:	e2033002 	and	r3, r3, #2
    e520:	e3530000 	cmp	r3, #0
    e524:	0a000017 	beq	e588 <shmem_rdlock+0x134>
    e528:	e51b300c 	ldr	r3, [fp, #-12]
    e52c:	e5933008 	ldr	r3, [r3, #8]
    e530:	e3530000 	cmp	r3, #0
    e534:	0a000010 	beq	e57c <shmem_rdlock+0x128>
    e538:	e51b300c 	ldr	r3, [fp, #-12]
    e53c:	e5d33010 	ldrb	r3, [r3, #16]
    e540:	e2033008 	and	r3, r3, #8
    e544:	e3530000 	cmp	r3, #0
    e548:	1a000008 	bne	e570 <shmem_rdlock+0x11c>
    e54c:	e51b300c 	ldr	r3, [fp, #-12]
    e550:	e5933008 	ldr	r3, [r3, #8]
    e554:	e1d325b4 	ldrh	r2, [r3, #84]	; 0x54
    e558:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    e55c:	e3403000 	movt	r3, #0
    e560:	e5933000 	ldr	r3, [r3]
    e564:	e1d335b4 	ldrh	r3, [r3, #84]	; 0x54
    e568:	e1520003 	cmp	r2, r3
    e56c:	8a000002 	bhi	e57c <shmem_rdlock+0x128>
    e570:	e3a03001 	mov	r3, #1
    e574:	e50b3008 	str	r3, [fp, #-8]
    e578:	ea00000c 	b	e5b0 <shmem_rdlock+0x15c>
    e57c:	e3a03000 	mov	r3, #0
    e580:	e50b3008 	str	r3, [fp, #-8]
    e584:	ea000009 	b	e5b0 <shmem_rdlock+0x15c>
    e588:	e51b300c 	ldr	r3, [fp, #-12]
    e58c:	e5d33010 	ldrb	r3, [r3, #16]
    e590:	e2033004 	and	r3, r3, #4
    e594:	e3530000 	cmp	r3, #0
    e598:	0a000002 	beq	e5a8 <shmem_rdlock+0x154>
    e59c:	e3a03001 	mov	r3, #1
    e5a0:	e50b3008 	str	r3, [fp, #-8]
    e5a4:	ea000001 	b	e5b0 <shmem_rdlock+0x15c>
    e5a8:	e3e03002 	mvn	r3, #2
    e5ac:	e50b3008 	str	r3, [fp, #-8]
    e5b0:	e51b3008 	ldr	r3, [fp, #-8]
    e5b4:	e3530000 	cmp	r3, #0
    e5b8:	1a000005 	bne	e5d4 <shmem_rdlock+0x180>
    e5bc:	e51b300c 	ldr	r3, [fp, #-12]
    e5c0:	e5933014 	ldr	r3, [r3, #20]
    e5c4:	e2832001 	add	r2, r3, #1
    e5c8:	e51b300c 	ldr	r3, [fp, #-12]
    e5cc:	e5832014 	str	r2, [r3, #20]
    e5d0:	ea000046 	b	e6f0 <shmem_rdlock+0x29c>
    e5d4:	e51b3008 	ldr	r3, [fp, #-8]
    e5d8:	e3530001 	cmp	r3, #1
    e5dc:	1a000043 	bne	e6f0 <shmem_rdlock+0x29c>
    e5e0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    e5e4:	e3530000 	cmp	r3, #0
    e5e8:	1a000040 	bne	e6f0 <shmem_rdlock+0x29c>
    e5ec:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    e5f0:	e3403000 	movt	r3, #0
    e5f4:	e5933000 	ldr	r3, [r3]
    e5f8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    e5fc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    e600:	e3a02000 	mov	r2, #0
    e604:	e5832070 	str	r2, [r3, #112]	; 0x70
    e608:	e51b300c 	ldr	r3, [fp, #-12]
    e60c:	e5933008 	ldr	r3, [r3, #8]
    e610:	e3530000 	cmp	r3, #0
    e614:	1a000007 	bne	e638 <shmem_rdlock+0x1e4>
    e618:	e51b300c 	ldr	r3, [fp, #-12]
    e61c:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    e620:	e583200c 	str	r2, [r3, #12]
    e624:	e51b300c 	ldr	r3, [fp, #-12]
    e628:	e593200c 	ldr	r2, [r3, #12]
    e62c:	e51b300c 	ldr	r3, [fp, #-12]
    e630:	e5832008 	str	r2, [r3, #8]
    e634:	ea000013 	b	e688 <shmem_rdlock+0x234>
    e638:	e51b300c 	ldr	r3, [fp, #-12]
    e63c:	e5d33010 	ldrb	r3, [r3, #16]
    e640:	e2033008 	and	r3, r3, #8
    e644:	e3530000 	cmp	r3, #0
    e648:	0a000007 	beq	e66c <shmem_rdlock+0x218>
    e64c:	e51b300c 	ldr	r3, [fp, #-12]
    e650:	e593300c 	ldr	r3, [r3, #12]
    e654:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    e658:	e5832070 	str	r2, [r3, #112]	; 0x70
    e65c:	e51b300c 	ldr	r3, [fp, #-12]
    e660:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    e664:	e583200c 	str	r2, [r3, #12]
    e668:	ea000006 	b	e688 <shmem_rdlock+0x234>
    e66c:	e51b300c 	ldr	r3, [fp, #-12]
    e670:	e2830008 	add	r0, r3, #8
    e674:	e51b300c 	ldr	r3, [fp, #-12]
    e678:	e283300c 	add	r3, r3, #12
    e67c:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    e680:	e1a01003 	mov	r1, r3
    e684:	ebffe736 	bl	8364 <semqueue_by_priority>
    e688:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    e68c:	e3403000 	movt	r3, #0
    e690:	e5933000 	ldr	r3, [r3]
    e694:	e3a02004 	mov	r2, #4
    e698:	e1c324ba 	strh	r2, [r3, #74]	; 0x4a
    e69c:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    e6a0:	e3403000 	movt	r3, #0
    e6a4:	e5933000 	ldr	r3, [r3]
    e6a8:	e3a02003 	mov	r2, #3
    e6ac:	e1c324b8 	strh	r2, [r3, #72]	; 0x48
    e6b0:	e51b0010 	ldr	r0, [fp, #-16]
    e6b4:	ebffe6cb 	bl	81e8 <set_enable>
    e6b8:	ea000006 	b	e6d8 <shmem_rdlock+0x284>
    e6bc:	e30f3f04 	movw	r3, #65284	; 0xff04
    e6c0:	e3403000 	movt	r3, #0
    e6c4:	e5933000 	ldr	r3, [r3]
    e6c8:	e2033002 	and	r3, r3, #2
    e6cc:	e3530000 	cmp	r3, #0
    e6d0:	0a000000 	beq	e6d8 <shmem_rdlock+0x284>
    e6d4:	ef000060 	svc	0x00000060
    e6d8:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    e6dc:	e3403000 	movt	r3, #0
    e6e0:	e5933000 	ldr	r3, [r3]
    e6e4:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    e6e8:	e3530003 	cmp	r3, #3
    e6ec:	0afffff2 	beq	e6bc <shmem_rdlock+0x268>
    e6f0:	e51b0010 	ldr	r0, [fp, #-16]
    e6f4:	ebffe6bb 	bl	81e8 <set_enable>
    e6f8:	e51b3008 	ldr	r3, [fp, #-8]
    e6fc:	e1a00003 	mov	r0, r3
    e700:	e24bd004 	sub	sp, fp, #4
    e704:	e8bd8800 	pop	{fp, pc}

0000e708 <shmem_wrlock>:
    e708:	e92d4800 	push	{fp, lr}
    e70c:	e28db004 	add	fp, sp, #4
    e710:	e24dd018 	sub	sp, sp, #24
    e714:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    e718:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    e71c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    e720:	e2433018 	sub	r3, r3, #24
    e724:	e50b300c 	str	r3, [fp, #-12]
    e728:	e51b300c 	ldr	r3, [fp, #-12]
    e72c:	e3a02008 	mov	r2, #8
    e730:	e30f1dd0 	movw	r1, #64976	; 0xfdd0
    e734:	e3401000 	movt	r1, #0
    e738:	e1a00003 	mov	r0, r3
    e73c:	eb0004f6 	bl	fb1c <memcm>
    e740:	e1a03000 	mov	r3, r0
    e744:	e3530000 	cmp	r3, #0
    e748:	0a000001 	beq	e754 <shmem_wrlock+0x4c>
    e74c:	e3e03000 	mvn	r3, #0
    e750:	ea000075 	b	e92c <shmem_wrlock+0x224>
    e754:	e51b300c 	ldr	r3, [fp, #-12]
    e758:	e5d33010 	ldrb	r3, [r3, #16]
    e75c:	e2033010 	and	r3, r3, #16
    e760:	e3530000 	cmp	r3, #0
    e764:	0a000001 	beq	e770 <shmem_wrlock+0x68>
    e768:	e3e03001 	mvn	r3, #1
    e76c:	ea00006e 	b	e92c <shmem_wrlock+0x224>
    e770:	ebffe692 	bl	81c0 <set_disable>
    e774:	e50b0010 	str	r0, [fp, #-16]
    e778:	e51b300c 	ldr	r3, [fp, #-12]
    e77c:	e5d33010 	ldrb	r3, [r3, #16]
    e780:	e2033001 	and	r3, r3, #1
    e784:	e3530000 	cmp	r3, #0
    e788:	0a00000e 	beq	e7c8 <shmem_wrlock+0xc0>
    e78c:	e51b300c 	ldr	r3, [fp, #-12]
    e790:	e5d33010 	ldrb	r3, [r3, #16]
    e794:	e3c33001 	bic	r3, r3, #1
    e798:	e6ef2073 	uxtb	r2, r3
    e79c:	e51b300c 	ldr	r3, [fp, #-12]
    e7a0:	e5c32010 	strb	r2, [r3, #16]
    e7a4:	e51b300c 	ldr	r3, [fp, #-12]
    e7a8:	e5d33010 	ldrb	r3, [r3, #16]
    e7ac:	e3833004 	orr	r3, r3, #4
    e7b0:	e6ef2073 	uxtb	r2, r3
    e7b4:	e51b300c 	ldr	r3, [fp, #-12]
    e7b8:	e5c32010 	strb	r2, [r3, #16]
    e7bc:	e3a03000 	mov	r3, #0
    e7c0:	e50b3008 	str	r3, [fp, #-8]
    e7c4:	ea00000e 	b	e804 <shmem_wrlock+0xfc>
    e7c8:	e51b300c 	ldr	r3, [fp, #-12]
    e7cc:	e5d33010 	ldrb	r3, [r3, #16]
    e7d0:	e2033002 	and	r3, r3, #2
    e7d4:	e3530000 	cmp	r3, #0
    e7d8:	1a000004 	bne	e7f0 <shmem_wrlock+0xe8>
    e7dc:	e51b300c 	ldr	r3, [fp, #-12]
    e7e0:	e5d33010 	ldrb	r3, [r3, #16]
    e7e4:	e2033004 	and	r3, r3, #4
    e7e8:	e3530000 	cmp	r3, #0
    e7ec:	0a000002 	beq	e7fc <shmem_wrlock+0xf4>
    e7f0:	e3a03001 	mov	r3, #1
    e7f4:	e50b3008 	str	r3, [fp, #-8]
    e7f8:	ea000001 	b	e804 <shmem_wrlock+0xfc>
    e7fc:	e3e03002 	mvn	r3, #2
    e800:	e50b3008 	str	r3, [fp, #-8]
    e804:	e51b3008 	ldr	r3, [fp, #-8]
    e808:	e3530001 	cmp	r3, #1
    e80c:	1a000043 	bne	e920 <shmem_wrlock+0x218>
    e810:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    e814:	e3530000 	cmp	r3, #0
    e818:	1a000040 	bne	e920 <shmem_wrlock+0x218>
    e81c:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    e820:	e3403000 	movt	r3, #0
    e824:	e5933000 	ldr	r3, [r3]
    e828:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    e82c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    e830:	e3a02000 	mov	r2, #0
    e834:	e5832070 	str	r2, [r3, #112]	; 0x70
    e838:	e51b300c 	ldr	r3, [fp, #-12]
    e83c:	e5933008 	ldr	r3, [r3, #8]
    e840:	e3530000 	cmp	r3, #0
    e844:	1a000007 	bne	e868 <shmem_wrlock+0x160>
    e848:	e51b300c 	ldr	r3, [fp, #-12]
    e84c:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    e850:	e583200c 	str	r2, [r3, #12]
    e854:	e51b300c 	ldr	r3, [fp, #-12]
    e858:	e593200c 	ldr	r2, [r3, #12]
    e85c:	e51b300c 	ldr	r3, [fp, #-12]
    e860:	e5832008 	str	r2, [r3, #8]
    e864:	ea000013 	b	e8b8 <shmem_wrlock+0x1b0>
    e868:	e51b300c 	ldr	r3, [fp, #-12]
    e86c:	e5d33010 	ldrb	r3, [r3, #16]
    e870:	e2033008 	and	r3, r3, #8
    e874:	e3530000 	cmp	r3, #0
    e878:	0a000007 	beq	e89c <shmem_wrlock+0x194>
    e87c:	e51b300c 	ldr	r3, [fp, #-12]
    e880:	e593300c 	ldr	r3, [r3, #12]
    e884:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    e888:	e5832070 	str	r2, [r3, #112]	; 0x70
    e88c:	e51b300c 	ldr	r3, [fp, #-12]
    e890:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    e894:	e583200c 	str	r2, [r3, #12]
    e898:	ea000006 	b	e8b8 <shmem_wrlock+0x1b0>
    e89c:	e51b300c 	ldr	r3, [fp, #-12]
    e8a0:	e2830008 	add	r0, r3, #8
    e8a4:	e51b300c 	ldr	r3, [fp, #-12]
    e8a8:	e283300c 	add	r3, r3, #12
    e8ac:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    e8b0:	e1a01003 	mov	r1, r3
    e8b4:	ebffe6aa 	bl	8364 <semqueue_by_priority>
    e8b8:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    e8bc:	e3403000 	movt	r3, #0
    e8c0:	e5933000 	ldr	r3, [r3]
    e8c4:	e3a02005 	mov	r2, #5
    e8c8:	e1c324ba 	strh	r2, [r3, #74]	; 0x4a
    e8cc:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    e8d0:	e3403000 	movt	r3, #0
    e8d4:	e5933000 	ldr	r3, [r3]
    e8d8:	e3a02003 	mov	r2, #3
    e8dc:	e1c324b8 	strh	r2, [r3, #72]	; 0x48
    e8e0:	e51b0010 	ldr	r0, [fp, #-16]
    e8e4:	ebffe63f 	bl	81e8 <set_enable>
    e8e8:	ea000006 	b	e908 <shmem_wrlock+0x200>
    e8ec:	e30f3f04 	movw	r3, #65284	; 0xff04
    e8f0:	e3403000 	movt	r3, #0
    e8f4:	e5933000 	ldr	r3, [r3]
    e8f8:	e2033002 	and	r3, r3, #2
    e8fc:	e3530000 	cmp	r3, #0
    e900:	0a000000 	beq	e908 <shmem_wrlock+0x200>
    e904:	ef000060 	svc	0x00000060
    e908:	e30f3ef4 	movw	r3, #65268	; 0xfef4
    e90c:	e3403000 	movt	r3, #0
    e910:	e5933000 	ldr	r3, [r3]
    e914:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    e918:	e3530003 	cmp	r3, #3
    e91c:	0afffff2 	beq	e8ec <shmem_wrlock+0x1e4>
    e920:	e51b0010 	ldr	r0, [fp, #-16]
    e924:	ebffe62f 	bl	81e8 <set_enable>
    e928:	e51b3008 	ldr	r3, [fp, #-8]
    e92c:	e1a00003 	mov	r0, r3
    e930:	e24bd004 	sub	sp, fp, #4
    e934:	e8bd8800 	pop	{fp, pc}

0000e938 <shmem_unlock>:
    e938:	e92d4800 	push	{fp, lr}
    e93c:	e28db004 	add	fp, sp, #4
    e940:	e24dd018 	sub	sp, sp, #24
    e944:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    e948:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    e94c:	e2433018 	sub	r3, r3, #24
    e950:	e50b300c 	str	r3, [fp, #-12]
    e954:	e51b300c 	ldr	r3, [fp, #-12]
    e958:	e3a02008 	mov	r2, #8
    e95c:	e30f1dd0 	movw	r1, #64976	; 0xfdd0
    e960:	e3401000 	movt	r1, #0
    e964:	e1a00003 	mov	r0, r3
    e968:	eb00046b 	bl	fb1c <memcm>
    e96c:	e1a03000 	mov	r3, r0
    e970:	e3530000 	cmp	r3, #0
    e974:	0a000001 	beq	e980 <shmem_unlock+0x48>
    e978:	e3e03000 	mvn	r3, #0
    e97c:	ea000096 	b	ebdc <shmem_unlock+0x2a4>
    e980:	ebffe60e 	bl	81c0 <set_disable>
    e984:	e50b0010 	str	r0, [fp, #-16]
    e988:	e51b300c 	ldr	r3, [fp, #-12]
    e98c:	e5d33010 	ldrb	r3, [r3, #16]
    e990:	e2033002 	and	r3, r3, #2
    e994:	e3530000 	cmp	r3, #0
    e998:	0a000021 	beq	ea24 <shmem_unlock+0xec>
    e99c:	e51b300c 	ldr	r3, [fp, #-12]
    e9a0:	e5933014 	ldr	r3, [r3, #20]
    e9a4:	e2432001 	sub	r2, r3, #1
    e9a8:	e51b300c 	ldr	r3, [fp, #-12]
    e9ac:	e5832014 	str	r2, [r3, #20]
    e9b0:	e51b300c 	ldr	r3, [fp, #-12]
    e9b4:	e5933014 	ldr	r3, [r3, #20]
    e9b8:	e3530000 	cmp	r3, #0
    e9bc:	0a000002 	beq	e9cc <shmem_unlock+0x94>
    e9c0:	e3a03000 	mov	r3, #0
    e9c4:	e50b3008 	str	r3, [fp, #-8]
    e9c8:	ea000032 	b	ea98 <shmem_unlock+0x160>
    e9cc:	e51b300c 	ldr	r3, [fp, #-12]
    e9d0:	e5d33010 	ldrb	r3, [r3, #16]
    e9d4:	e3c33002 	bic	r3, r3, #2
    e9d8:	e6ef2073 	uxtb	r2, r3
    e9dc:	e51b300c 	ldr	r3, [fp, #-12]
    e9e0:	e5c32010 	strb	r2, [r3, #16]
    e9e4:	e51b300c 	ldr	r3, [fp, #-12]
    e9e8:	e5933008 	ldr	r3, [r3, #8]
    e9ec:	e3530000 	cmp	r3, #0
    e9f0:	0a000002 	beq	ea00 <shmem_unlock+0xc8>
    e9f4:	e3a03001 	mov	r3, #1
    e9f8:	e50b3008 	str	r3, [fp, #-8]
    e9fc:	ea000025 	b	ea98 <shmem_unlock+0x160>
    ea00:	e51b300c 	ldr	r3, [fp, #-12]
    ea04:	e5d33010 	ldrb	r3, [r3, #16]
    ea08:	e3833001 	orr	r3, r3, #1
    ea0c:	e6ef2073 	uxtb	r2, r3
    ea10:	e51b300c 	ldr	r3, [fp, #-12]
    ea14:	e5c32010 	strb	r2, [r3, #16]
    ea18:	e3a03000 	mov	r3, #0
    ea1c:	e50b3008 	str	r3, [fp, #-8]
    ea20:	ea00001c 	b	ea98 <shmem_unlock+0x160>
    ea24:	e51b300c 	ldr	r3, [fp, #-12]
    ea28:	e5d33010 	ldrb	r3, [r3, #16]
    ea2c:	e2033004 	and	r3, r3, #4
    ea30:	e3530000 	cmp	r3, #0
    ea34:	0a000015 	beq	ea90 <shmem_unlock+0x158>
    ea38:	e51b300c 	ldr	r3, [fp, #-12]
    ea3c:	e5d33010 	ldrb	r3, [r3, #16]
    ea40:	e3c33004 	bic	r3, r3, #4
    ea44:	e6ef2073 	uxtb	r2, r3
    ea48:	e51b300c 	ldr	r3, [fp, #-12]
    ea4c:	e5c32010 	strb	r2, [r3, #16]
    ea50:	e51b300c 	ldr	r3, [fp, #-12]
    ea54:	e5933008 	ldr	r3, [r3, #8]
    ea58:	e3530000 	cmp	r3, #0
    ea5c:	0a000002 	beq	ea6c <shmem_unlock+0x134>
    ea60:	e3a03001 	mov	r3, #1
    ea64:	e50b3008 	str	r3, [fp, #-8]
    ea68:	ea00000a 	b	ea98 <shmem_unlock+0x160>
    ea6c:	e51b300c 	ldr	r3, [fp, #-12]
    ea70:	e5d33010 	ldrb	r3, [r3, #16]
    ea74:	e3833001 	orr	r3, r3, #1
    ea78:	e6ef2073 	uxtb	r2, r3
    ea7c:	e51b300c 	ldr	r3, [fp, #-12]
    ea80:	e5c32010 	strb	r2, [r3, #16]
    ea84:	e3a03000 	mov	r3, #0
    ea88:	e50b3008 	str	r3, [fp, #-8]
    ea8c:	ea000001 	b	ea98 <shmem_unlock+0x160>
    ea90:	e3e03002 	mvn	r3, #2
    ea94:	e50b3008 	str	r3, [fp, #-8]
    ea98:	e51b3008 	ldr	r3, [fp, #-8]
    ea9c:	e3530001 	cmp	r3, #1
    eaa0:	1a00004a 	bne	ebd0 <shmem_unlock+0x298>
    eaa4:	e51b300c 	ldr	r3, [fp, #-12]
    eaa8:	e5933008 	ldr	r3, [r3, #8]
    eaac:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    eab0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    eab4:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    eab8:	e3530004 	cmp	r3, #4
    eabc:	1a000005 	bne	ead8 <shmem_unlock+0x1a0>
    eac0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    eac4:	e3a02002 	mov	r2, #2
    eac8:	e1c324b8 	strh	r2, [r3, #72]	; 0x48
    eacc:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    ead0:	ebffe5d1 	bl	821c <queue>
    ead4:	ea000006 	b	eaf4 <shmem_unlock+0x1bc>
    ead8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    eadc:	e1d334b8 	ldrh	r3, [r3, #72]	; 0x48
    eae0:	e3530003 	cmp	r3, #3
    eae4:	1a000002 	bne	eaf4 <shmem_unlock+0x1bc>
    eae8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    eaec:	e3a02002 	mov	r2, #2
    eaf0:	e1c324b8 	strh	r2, [r3, #72]	; 0x48
    eaf4:	e51b300c 	ldr	r3, [fp, #-12]
    eaf8:	e5932008 	ldr	r2, [r3, #8]
    eafc:	e51b300c 	ldr	r3, [fp, #-12]
    eb00:	e593300c 	ldr	r3, [r3, #12]
    eb04:	e1520003 	cmp	r2, r3
    eb08:	1a000007 	bne	eb2c <shmem_unlock+0x1f4>
    eb0c:	e51b300c 	ldr	r3, [fp, #-12]
    eb10:	e3a02000 	mov	r2, #0
    eb14:	e583200c 	str	r2, [r3, #12]
    eb18:	e51b300c 	ldr	r3, [fp, #-12]
    eb1c:	e593200c 	ldr	r2, [r3, #12]
    eb20:	e51b300c 	ldr	r3, [fp, #-12]
    eb24:	e5832008 	str	r2, [r3, #8]
    eb28:	ea000004 	b	eb40 <shmem_unlock+0x208>
    eb2c:	e51b300c 	ldr	r3, [fp, #-12]
    eb30:	e5933008 	ldr	r3, [r3, #8]
    eb34:	e5932070 	ldr	r2, [r3, #112]	; 0x70
    eb38:	e51b300c 	ldr	r3, [fp, #-12]
    eb3c:	e5832008 	str	r2, [r3, #8]
    eb40:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    eb44:	e1d334ba 	ldrh	r3, [r3, #74]	; 0x4a
    eb48:	e3530004 	cmp	r3, #4
    eb4c:	1a00000b 	bne	eb80 <shmem_unlock+0x248>
    eb50:	e51b300c 	ldr	r3, [fp, #-12]
    eb54:	e5933014 	ldr	r3, [r3, #20]
    eb58:	e2832001 	add	r2, r3, #1
    eb5c:	e51b300c 	ldr	r3, [fp, #-12]
    eb60:	e5832014 	str	r2, [r3, #20]
    eb64:	e51b300c 	ldr	r3, [fp, #-12]
    eb68:	e5d33010 	ldrb	r3, [r3, #16]
    eb6c:	e3833002 	orr	r3, r3, #2
    eb70:	e6ef2073 	uxtb	r2, r3
    eb74:	e51b300c 	ldr	r3, [fp, #-12]
    eb78:	e5c32010 	strb	r2, [r3, #16]
    eb7c:	ea000005 	b	eb98 <shmem_unlock+0x260>
    eb80:	e51b300c 	ldr	r3, [fp, #-12]
    eb84:	e5d33010 	ldrb	r3, [r3, #16]
    eb88:	e3833004 	orr	r3, r3, #4
    eb8c:	e6ef2073 	uxtb	r2, r3
    eb90:	e51b300c 	ldr	r3, [fp, #-12]
    eb94:	e5c32010 	strb	r2, [r3, #16]
    eb98:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    eb9c:	e1d334ba 	ldrh	r3, [r3, #74]	; 0x4a
    eba0:	e3530004 	cmp	r3, #4
    eba4:	0affffbe 	beq	eaa4 <shmem_unlock+0x16c>
    eba8:	e30f3f04 	movw	r3, #65284	; 0xff04
    ebac:	e3403000 	movt	r3, #0
    ebb0:	e5933000 	ldr	r3, [r3]
    ebb4:	e2033002 	and	r3, r3, #2
    ebb8:	e3530000 	cmp	r3, #0
    ebbc:	0a000003 	beq	ebd0 <shmem_unlock+0x298>
    ebc0:	e51b0010 	ldr	r0, [fp, #-16]
    ebc4:	ebffe587 	bl	81e8 <set_enable>
    ebc8:	ebffe62f 	bl	848c <dispatch>
    ebcc:	f10c0080 	cpsid	i
    ebd0:	e51b0010 	ldr	r0, [fp, #-16]
    ebd4:	ebffe583 	bl	81e8 <set_enable>
    ebd8:	e51b3008 	ldr	r3, [fp, #-8]
    ebdc:	e1a00003 	mov	r0, r3
    ebe0:	e24bd004 	sub	sp, fp, #4
    ebe4:	e8bd8800 	pop	{fp, pc}

0000ebe8 <logger>:
    ebe8:	e92d4800 	push	{fp, lr}
    ebec:	e28db004 	add	fp, sp, #4
    ebf0:	e24dd008 	sub	sp, sp, #8
    ebf4:	e50b0008 	str	r0, [fp, #-8]
    ebf8:	e30f0dd8 	movw	r0, #64984	; 0xfdd8
    ebfc:	e3400000 	movt	r0, #0
    ec00:	eb0000e8 	bl	efa8 <print_str>
    ec04:	e3040240 	movw	r0, #16960	; 0x4240
    ec08:	e340000f 	movt	r0, #15
    ec0c:	eb0002c9 	bl	f738 <RPI_WaitMicroSeconds>
    ec10:	eafffffb 	b	ec04 <logger+0x1c>

0000ec14 <kernel_main>:
    ec14:	e92d4800 	push	{fp, lr}
    ec18:	e28db004 	add	fp, sp, #4
    ec1c:	e24dd010 	sub	sp, sp, #16
    ec20:	e50b0008 	str	r0, [fp, #-8]
    ec24:	e50b100c 	str	r1, [fp, #-12]
    ec28:	e50b2010 	str	r2, [fp, #-16]
    ec2c:	f10c0080 	cpsid	i
    ec30:	e3a01008 	mov	r1, #8
    ec34:	e3a00cc2 	mov	r0, #49664	; 0xc200
    ec38:	e3400001 	movt	r0, #1
    ec3c:	eb000046 	bl	ed5c <RPI_AuxMiniUartInit>
    ec40:	e30f0df4 	movw	r0, #65012	; 0xfdf4
    ec44:	e3400000 	movt	r0, #0
    ec48:	eb0000d6 	bl	efa8 <print_str>
    ec4c:	e3a01001 	mov	r1, #1
    ec50:	e3a00015 	mov	r0, #21
    ec54:	eb000130 	bl	f11c <RPI_SetGpioPinFunction>
    ec58:	eb000236 	bl	f538 <RPI_GetIrqController>
    ec5c:	e1a03000 	mov	r3, r0
    ec60:	e3a02001 	mov	r2, #1
    ec64:	e5832018 	str	r2, [r3, #24]
    ec68:	eb000023 	bl	ecfc <RPI_GetArmTimer>
    ec6c:	e1a03000 	mov	r3, r0
    ec70:	e3a02058 	mov	r2, #88	; 0x58
    ec74:	e5832000 	str	r2, [r3]
    ec78:	eb00001f 	bl	ecfc <RPI_GetArmTimer>
    ec7c:	e1a03000 	mov	r3, r0
    ec80:	e3a020a2 	mov	r2, #162	; 0xa2
    ec84:	e5832008 	str	r2, [r3, #8]
    ec88:	eb0002d1 	bl	f7d4 <mem_init>
    ec8c:	e3a01001 	mov	r1, #1
    ec90:	e3a00003 	mov	r0, #3
    ec94:	ebffe809 	bl	8cc0 <initmt>
    ec98:	f1080080 	cpsie	i
    ec9c:	e3a03000 	mov	r3, #0
    eca0:	e3a02000 	mov	r2, #0
    eca4:	e3021710 	movw	r1, #10000	; 0x2710
    eca8:	e30f0d2c 	movw	r0, #64812	; 0xfd2c
    ecac:	e3400000 	movt	r0, #0
    ecb0:	ebffe64a 	bl	85e0 <create_task>
    ecb4:	e1a03000 	mov	r3, r0
    ecb8:	e3a01064 	mov	r1, #100	; 0x64
    ecbc:	e1a00003 	mov	r0, r3
    ecc0:	ebffe965 	bl	925c <sptsk>
    ecc4:	e3a03000 	mov	r3, #0
    ecc8:	e3a02000 	mov	r2, #0
    eccc:	e3021710 	movw	r1, #10000	; 0x2710
    ecd0:	e30e0be8 	movw	r0, #60392	; 0xebe8
    ecd4:	e3400000 	movt	r0, #0
    ecd8:	ebffe640 	bl	85e0 <create_task>
    ecdc:	e1a03000 	mov	r3, r0
    ece0:	e30013e7 	movw	r1, #999	; 0x3e7
    ece4:	e1a00003 	mov	r0, r3
    ece8:	ebffe95b 	bl	925c <sptsk>
    ecec:	ebffe512 	bl	813c <_halt>
    ecf0:	e320f000 	nop	{0}
    ecf4:	e24bd004 	sub	sp, fp, #4
    ecf8:	e8bd8800 	pop	{fp, pc}

0000ecfc <RPI_GetArmTimer>:
    ecfc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    ed00:	e28db000 	add	fp, sp, #0
    ed04:	e30f3ebc 	movw	r3, #65212	; 0xfebc
    ed08:	e3403000 	movt	r3, #0
    ed0c:	e5933000 	ldr	r3, [r3]
    ed10:	e1a00003 	mov	r0, r3
    ed14:	e28bd000 	add	sp, fp, #0
    ed18:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    ed1c:	e12fff1e 	bx	lr

0000ed20 <RPI_ArmTimerInit>:
    ed20:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    ed24:	e28db000 	add	fp, sp, #0
    ed28:	e320f000 	nop	{0}
    ed2c:	e28bd000 	add	sp, fp, #0
    ed30:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    ed34:	e12fff1e 	bx	lr

0000ed38 <RPI_GetAux>:
    ed38:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    ed3c:	e28db000 	add	fp, sp, #0
    ed40:	e30f3ec0 	movw	r3, #65216	; 0xfec0
    ed44:	e3403000 	movt	r3, #0
    ed48:	e5933000 	ldr	r3, [r3]
    ed4c:	e1a00003 	mov	r0, r3
    ed50:	e28bd000 	add	sp, fp, #0
    ed54:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    ed58:	e12fff1e 	bx	lr

0000ed5c <RPI_AuxMiniUartInit>:
    ed5c:	e92d4800 	push	{fp, lr}
    ed60:	e28db004 	add	fp, sp, #4
    ed64:	e24dd010 	sub	sp, sp, #16
    ed68:	e50b0010 	str	r0, [fp, #-16]
    ed6c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    ed70:	e30f3ec0 	movw	r3, #65216	; 0xfec0
    ed74:	e3403000 	movt	r3, #0
    ed78:	e5933000 	ldr	r3, [r3]
    ed7c:	e3a02001 	mov	r2, #1
    ed80:	e5832004 	str	r2, [r3, #4]
    ed84:	e30f3ec0 	movw	r3, #65216	; 0xfec0
    ed88:	e3403000 	movt	r3, #0
    ed8c:	e5933000 	ldr	r3, [r3]
    ed90:	e3a02000 	mov	r2, #0
    ed94:	e5832044 	str	r2, [r3, #68]	; 0x44
    ed98:	e30f3ec0 	movw	r3, #65216	; 0xfec0
    ed9c:	e3403000 	movt	r3, #0
    eda0:	e5933000 	ldr	r3, [r3]
    eda4:	e3a02000 	mov	r2, #0
    eda8:	e5832060 	str	r2, [r3, #96]	; 0x60
    edac:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    edb0:	e3530008 	cmp	r3, #8
    edb4:	1a000005 	bne	edd0 <RPI_AuxMiniUartInit+0x74>
    edb8:	e30f3ec0 	movw	r3, #65216	; 0xfec0
    edbc:	e3403000 	movt	r3, #0
    edc0:	e5933000 	ldr	r3, [r3]
    edc4:	e3a02003 	mov	r2, #3
    edc8:	e583204c 	str	r2, [r3, #76]	; 0x4c
    edcc:	ea000004 	b	ede4 <RPI_AuxMiniUartInit+0x88>
    edd0:	e30f3ec0 	movw	r3, #65216	; 0xfec0
    edd4:	e3403000 	movt	r3, #0
    edd8:	e5933000 	ldr	r3, [r3]
    eddc:	e3a02000 	mov	r2, #0
    ede0:	e583204c 	str	r2, [r3, #76]	; 0x4c
    ede4:	e30f3ec0 	movw	r3, #65216	; 0xfec0
    ede8:	e3403000 	movt	r3, #0
    edec:	e5933000 	ldr	r3, [r3]
    edf0:	e3a02000 	mov	r2, #0
    edf4:	e5832050 	str	r2, [r3, #80]	; 0x50
    edf8:	e30f3ec0 	movw	r3, #65216	; 0xfec0
    edfc:	e3403000 	movt	r3, #0
    ee00:	e5933000 	ldr	r3, [r3]
    ee04:	e3a02000 	mov	r2, #0
    ee08:	e5832044 	str	r2, [r3, #68]	; 0x44
    ee0c:	e30f3ec0 	movw	r3, #65216	; 0xfec0
    ee10:	e3403000 	movt	r3, #0
    ee14:	e5933000 	ldr	r3, [r3]
    ee18:	e3a020c6 	mov	r2, #198	; 0xc6
    ee1c:	e5832048 	str	r2, [r3, #72]	; 0x48
    ee20:	e51b3010 	ldr	r3, [fp, #-16]
    ee24:	e1a02183 	lsl	r2, r3, #3
    ee28:	e30b3280 	movw	r3, #45696	; 0xb280
    ee2c:	e3403ee6 	movt	r3, #3814	; 0xee6
    ee30:	e713f213 	sdiv	r3, r3, r2
    ee34:	e2432001 	sub	r2, r3, #1
    ee38:	e30f3ec0 	movw	r3, #65216	; 0xfec0
    ee3c:	e3403000 	movt	r3, #0
    ee40:	e5933000 	ldr	r3, [r3]
    ee44:	e5832068 	str	r2, [r3, #104]	; 0x68
    ee48:	e3a01002 	mov	r1, #2
    ee4c:	e3a0000e 	mov	r0, #14
    ee50:	eb0000b1 	bl	f11c <RPI_SetGpioPinFunction>
    ee54:	e3a01002 	mov	r1, #2
    ee58:	e3a0000f 	mov	r0, #15
    ee5c:	eb0000ae 	bl	f11c <RPI_SetGpioPinFunction>
    ee60:	eb0000a4 	bl	f0f8 <RPI_GetGpio>
    ee64:	e1a03000 	mov	r3, r0
    ee68:	e3a02000 	mov	r2, #0
    ee6c:	e5832094 	str	r2, [r3, #148]	; 0x94
    ee70:	e3a03000 	mov	r3, #0
    ee74:	e50b3008 	str	r3, [fp, #-8]
    ee78:	ea000002 	b	ee88 <RPI_AuxMiniUartInit+0x12c>
    ee7c:	e51b3008 	ldr	r3, [fp, #-8]
    ee80:	e2833001 	add	r3, r3, #1
    ee84:	e50b3008 	str	r3, [fp, #-8]
    ee88:	e51b3008 	ldr	r3, [fp, #-8]
    ee8c:	e3530095 	cmp	r3, #149	; 0x95
    ee90:	dafffff9 	ble	ee7c <RPI_AuxMiniUartInit+0x120>
    ee94:	eb000097 	bl	f0f8 <RPI_GetGpio>
    ee98:	e1a03000 	mov	r3, r0
    ee9c:	e3a02901 	mov	r2, #16384	; 0x4000
    eea0:	e5832098 	str	r2, [r3, #152]	; 0x98
    eea4:	e3a03000 	mov	r3, #0
    eea8:	e50b3008 	str	r3, [fp, #-8]
    eeac:	ea000002 	b	eebc <RPI_AuxMiniUartInit+0x160>
    eeb0:	e51b3008 	ldr	r3, [fp, #-8]
    eeb4:	e2833001 	add	r3, r3, #1
    eeb8:	e50b3008 	str	r3, [fp, #-8]
    eebc:	e51b3008 	ldr	r3, [fp, #-8]
    eec0:	e3530095 	cmp	r3, #149	; 0x95
    eec4:	dafffff9 	ble	eeb0 <RPI_AuxMiniUartInit+0x154>
    eec8:	eb00008a 	bl	f0f8 <RPI_GetGpio>
    eecc:	e1a03000 	mov	r3, r0
    eed0:	e3a02000 	mov	r2, #0
    eed4:	e5832098 	str	r2, [r3, #152]	; 0x98
    eed8:	e30f3ec0 	movw	r3, #65216	; 0xfec0
    eedc:	e3403000 	movt	r3, #0
    eee0:	e5933000 	ldr	r3, [r3]
    eee4:	e3a02003 	mov	r2, #3
    eee8:	e5832060 	str	r2, [r3, #96]	; 0x60
    eeec:	e320f000 	nop	{0}
    eef0:	e24bd004 	sub	sp, fp, #4
    eef4:	e8bd8800 	pop	{fp, pc}

0000eef8 <RPI_AuxMiniUartWrite>:
    eef8:	e92d4800 	push	{fp, lr}
    eefc:	e28db004 	add	fp, sp, #4
    ef00:	e24dd010 	sub	sp, sp, #16
    ef04:	e1a03000 	mov	r3, r0
    ef08:	e54b300d 	strb	r3, [fp, #-13]
    ef0c:	e320f000 	nop	{0}
    ef10:	e30f3ec0 	movw	r3, #65216	; 0xfec0
    ef14:	e3403000 	movt	r3, #0
    ef18:	e5933000 	ldr	r3, [r3]
    ef1c:	e5933054 	ldr	r3, [r3, #84]	; 0x54
    ef20:	e2033020 	and	r3, r3, #32
    ef24:	e3530000 	cmp	r3, #0
    ef28:	0afffff8 	beq	ef10 <RPI_AuxMiniUartWrite+0x18>
    ef2c:	ebffe4a3 	bl	81c0 <set_disable>
    ef30:	e50b0008 	str	r0, [fp, #-8]
    ef34:	e30f3ec0 	movw	r3, #65216	; 0xfec0
    ef38:	e3403000 	movt	r3, #0
    ef3c:	e5933000 	ldr	r3, [r3]
    ef40:	e55b200d 	ldrb	r2, [fp, #-13]
    ef44:	e5832040 	str	r2, [r3, #64]	; 0x40
    ef48:	e51b0008 	ldr	r0, [fp, #-8]
    ef4c:	ebffe4a5 	bl	81e8 <set_enable>
    ef50:	e320f000 	nop	{0}
    ef54:	e24bd004 	sub	sp, fp, #4
    ef58:	e8bd8800 	pop	{fp, pc}

0000ef5c <RPI_AuxMiniUartRead>:
    ef5c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    ef60:	e28db000 	add	fp, sp, #0
    ef64:	e320f000 	nop	{0}
    ef68:	e30f3ec0 	movw	r3, #65216	; 0xfec0
    ef6c:	e3403000 	movt	r3, #0
    ef70:	e5933000 	ldr	r3, [r3]
    ef74:	e5933054 	ldr	r3, [r3, #84]	; 0x54
    ef78:	e2033001 	and	r3, r3, #1
    ef7c:	e3530000 	cmp	r3, #0
    ef80:	0afffff8 	beq	ef68 <RPI_AuxMiniUartRead+0xc>
    ef84:	e30f3ec0 	movw	r3, #65216	; 0xfec0
    ef88:	e3403000 	movt	r3, #0
    ef8c:	e5933000 	ldr	r3, [r3]
    ef90:	e5933040 	ldr	r3, [r3, #64]	; 0x40
    ef94:	e6ef3073 	uxtb	r3, r3
    ef98:	e1a00003 	mov	r0, r3
    ef9c:	e28bd000 	add	sp, fp, #0
    efa0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    efa4:	e12fff1e 	bx	lr

0000efa8 <print_str>:
    efa8:	e92d4800 	push	{fp, lr}
    efac:	e28db004 	add	fp, sp, #4
    efb0:	e24dd008 	sub	sp, sp, #8
    efb4:	e50b0008 	str	r0, [fp, #-8]
    efb8:	ea000005 	b	efd4 <print_str+0x2c>
    efbc:	e51b3008 	ldr	r3, [fp, #-8]
    efc0:	e2832001 	add	r2, r3, #1
    efc4:	e50b2008 	str	r2, [fp, #-8]
    efc8:	e5d33000 	ldrb	r3, [r3]
    efcc:	e1a00003 	mov	r0, r3
    efd0:	ebffffc8 	bl	eef8 <RPI_AuxMiniUartWrite>
    efd4:	e51b3008 	ldr	r3, [fp, #-8]
    efd8:	e5d33000 	ldrb	r3, [r3]
    efdc:	e3530000 	cmp	r3, #0
    efe0:	1afffff5 	bne	efbc <print_str+0x14>
    efe4:	e320f000 	nop	{0}
    efe8:	e320f000 	nop	{0}
    efec:	e24bd004 	sub	sp, fp, #4
    eff0:	e8bd8800 	pop	{fp, pc}

0000eff4 <print_num>:
    eff4:	e92d4800 	push	{fp, lr}
    eff8:	e28db004 	add	fp, sp, #4
    effc:	e24dd018 	sub	sp, sp, #24
    f000:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    f004:	e3a03000 	mov	r3, #0
    f008:	e50b3008 	str	r3, [fp, #-8]
    f00c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    f010:	e30c3ccd 	movw	r3, #52429	; 0xcccd
    f014:	e34c3ccc 	movt	r3, #52428	; 0xcccc
    f018:	e0831293 	umull	r1, r3, r3, r2
    f01c:	e1a031a3 	lsr	r3, r3, #3
    f020:	e3a0100a 	mov	r1, #10
    f024:	e0030391 	mul	r3, r1, r3
    f028:	e0423003 	sub	r3, r2, r3
    f02c:	e6ef2073 	uxtb	r2, r3
    f030:	e51b3008 	ldr	r3, [fp, #-8]
    f034:	e2831001 	add	r1, r3, #1
    f038:	e50b1008 	str	r1, [fp, #-8]
    f03c:	e2822030 	add	r2, r2, #48	; 0x30
    f040:	e6ef2072 	uxtb	r2, r2
    f044:	e24b1004 	sub	r1, fp, #4
    f048:	e0813003 	add	r3, r1, r3
    f04c:	e5432010 	strb	r2, [r3, #-16]
    f050:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    f054:	e30c3ccd 	movw	r3, #52429	; 0xcccd
    f058:	e34c3ccc 	movt	r3, #52428	; 0xcccc
    f05c:	e0832293 	umull	r2, r3, r3, r2
    f060:	e1a031a3 	lsr	r3, r3, #3
    f064:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    f068:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    f06c:	e3530000 	cmp	r3, #0
    f070:	1affffe5 	bne	f00c <print_num+0x18>
    f074:	e51b3008 	ldr	r3, [fp, #-8]
    f078:	e2433001 	sub	r3, r3, #1
    f07c:	e50b3008 	str	r3, [fp, #-8]
    f080:	e24b2014 	sub	r2, fp, #20
    f084:	e51b3008 	ldr	r3, [fp, #-8]
    f088:	e0823003 	add	r3, r2, r3
    f08c:	e5d33000 	ldrb	r3, [r3]
    f090:	e1a00003 	mov	r0, r3
    f094:	ebffff97 	bl	eef8 <RPI_AuxMiniUartWrite>
    f098:	e51b3008 	ldr	r3, [fp, #-8]
    f09c:	e3530000 	cmp	r3, #0
    f0a0:	1afffff3 	bne	f074 <print_num+0x80>
    f0a4:	e320f000 	nop	{0}
    f0a8:	e320f000 	nop	{0}
    f0ac:	e24bd004 	sub	sp, fp, #4
    f0b0:	e8bd8800 	pop	{fp, pc}

0000f0b4 <print_char>:
    f0b4:	e92d4800 	push	{fp, lr}
    f0b8:	e28db004 	add	fp, sp, #4
    f0bc:	e24dd008 	sub	sp, sp, #8
    f0c0:	e1a03000 	mov	r3, r0
    f0c4:	e54b3005 	strb	r3, [fp, #-5]
    f0c8:	e55b3005 	ldrb	r3, [fp, #-5]
    f0cc:	e1a00003 	mov	r0, r3
    f0d0:	ebffff88 	bl	eef8 <RPI_AuxMiniUartWrite>
    f0d4:	e320f000 	nop	{0}
    f0d8:	e24bd004 	sub	sp, fp, #4
    f0dc:	e8bd8800 	pop	{fp, pc}

0000f0e0 <getch>:
    f0e0:	e92d4800 	push	{fp, lr}
    f0e4:	e28db004 	add	fp, sp, #4
    f0e8:	ebffff9b 	bl	ef5c <RPI_AuxMiniUartRead>
    f0ec:	e1a03000 	mov	r3, r0
    f0f0:	e1a00003 	mov	r0, r3
    f0f4:	e8bd8800 	pop	{fp, pc}

0000f0f8 <RPI_GetGpio>:
    f0f8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    f0fc:	e28db000 	add	fp, sp, #0
    f100:	e30f3ec4 	movw	r3, #65220	; 0xfec4
    f104:	e3403000 	movt	r3, #0
    f108:	e5933000 	ldr	r3, [r3]
    f10c:	e1a00003 	mov	r0, r3
    f110:	e28bd000 	add	sp, fp, #0
    f114:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    f118:	e12fff1e 	bx	lr

0000f11c <RPI_SetGpioPinFunction>:
    f11c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    f120:	e28db000 	add	fp, sp, #0
    f124:	e24dd014 	sub	sp, sp, #20
    f128:	e1a03000 	mov	r3, r0
    f12c:	e1a02001 	mov	r2, r1
    f130:	e54b300d 	strb	r3, [fp, #-13]
    f134:	e1a03002 	mov	r3, r2
    f138:	e54b300e 	strb	r3, [fp, #-14]
    f13c:	e30f3ec4 	movw	r3, #65220	; 0xfec4
    f140:	e3403000 	movt	r3, #0
    f144:	e5932000 	ldr	r2, [r3]
    f148:	e55b100d 	ldrb	r1, [fp, #-13]
    f14c:	e30c3ccd 	movw	r3, #52429	; 0xcccd
    f150:	e34c3ccc 	movt	r3, #52428	; 0xcccc
    f154:	e0831193 	umull	r1, r3, r3, r1
    f158:	e1a031a3 	lsr	r3, r3, #3
    f15c:	e6ef3073 	uxtb	r3, r3
    f160:	e1a03103 	lsl	r3, r3, #2
    f164:	e0823003 	add	r3, r2, r3
    f168:	e50b3008 	str	r3, [fp, #-8]
    f16c:	e51b3008 	ldr	r3, [fp, #-8]
    f170:	e5933000 	ldr	r3, [r3]
    f174:	e50b300c 	str	r3, [fp, #-12]
    f178:	e55b200d 	ldrb	r2, [fp, #-13]
    f17c:	e30c3ccd 	movw	r3, #52429	; 0xcccd
    f180:	e34c3ccc 	movt	r3, #52428	; 0xcccc
    f184:	e0831293 	umull	r1, r3, r3, r2
    f188:	e1a031a3 	lsr	r3, r3, #3
    f18c:	e3a0100a 	mov	r1, #10
    f190:	e0030391 	mul	r3, r1, r3
    f194:	e0423003 	sub	r3, r2, r3
    f198:	e6ef3073 	uxtb	r3, r3
    f19c:	e1a02003 	mov	r2, r3
    f1a0:	e3a03003 	mov	r3, #3
    f1a4:	e0030293 	mul	r3, r3, r2
    f1a8:	e3a02007 	mov	r2, #7
    f1ac:	e1a03312 	lsl	r3, r2, r3
    f1b0:	e1e03003 	mvn	r3, r3
    f1b4:	e1a02003 	mov	r2, r3
    f1b8:	e51b300c 	ldr	r3, [fp, #-12]
    f1bc:	e0033002 	and	r3, r3, r2
    f1c0:	e50b300c 	str	r3, [fp, #-12]
    f1c4:	e55b100e 	ldrb	r1, [fp, #-14]
    f1c8:	e55b200d 	ldrb	r2, [fp, #-13]
    f1cc:	e30c3ccd 	movw	r3, #52429	; 0xcccd
    f1d0:	e34c3ccc 	movt	r3, #52428	; 0xcccc
    f1d4:	e0830293 	umull	r0, r3, r3, r2
    f1d8:	e1a031a3 	lsr	r3, r3, #3
    f1dc:	e3a0000a 	mov	r0, #10
    f1e0:	e0030390 	mul	r3, r0, r3
    f1e4:	e0423003 	sub	r3, r2, r3
    f1e8:	e6ef3073 	uxtb	r3, r3
    f1ec:	e1a02003 	mov	r2, r3
    f1f0:	e3a03003 	mov	r3, #3
    f1f4:	e0030293 	mul	r3, r3, r2
    f1f8:	e1a03311 	lsl	r3, r1, r3
    f1fc:	e1a02003 	mov	r2, r3
    f200:	e51b300c 	ldr	r3, [fp, #-12]
    f204:	e1823003 	orr	r3, r2, r3
    f208:	e50b300c 	str	r3, [fp, #-12]
    f20c:	e51b200c 	ldr	r2, [fp, #-12]
    f210:	e51b3008 	ldr	r3, [fp, #-8]
    f214:	e5832000 	str	r2, [r3]
    f218:	e320f000 	nop	{0}
    f21c:	e28bd000 	add	sp, fp, #0
    f220:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    f224:	e12fff1e 	bx	lr

0000f228 <RPI_SetGpioOutput>:
    f228:	e92d4800 	push	{fp, lr}
    f22c:	e28db004 	add	fp, sp, #4
    f230:	e24dd008 	sub	sp, sp, #8
    f234:	e1a03000 	mov	r3, r0
    f238:	e54b3005 	strb	r3, [fp, #-5]
    f23c:	e55b3005 	ldrb	r3, [fp, #-5]
    f240:	e3a01001 	mov	r1, #1
    f244:	e1a00003 	mov	r0, r3
    f248:	ebffffb3 	bl	f11c <RPI_SetGpioPinFunction>
    f24c:	e320f000 	nop	{0}
    f250:	e24bd004 	sub	sp, fp, #4
    f254:	e8bd8800 	pop	{fp, pc}

0000f258 <RPI_SetGpioInput>:
    f258:	e92d4800 	push	{fp, lr}
    f25c:	e28db004 	add	fp, sp, #4
    f260:	e24dd008 	sub	sp, sp, #8
    f264:	e1a03000 	mov	r3, r0
    f268:	e54b3005 	strb	r3, [fp, #-5]
    f26c:	e55b3005 	ldrb	r3, [fp, #-5]
    f270:	e3a01000 	mov	r1, #0
    f274:	e1a00003 	mov	r0, r3
    f278:	ebffffa7 	bl	f11c <RPI_SetGpioPinFunction>
    f27c:	e320f000 	nop	{0}
    f280:	e24bd004 	sub	sp, fp, #4
    f284:	e8bd8800 	pop	{fp, pc}

0000f288 <RPI_GetGpioValue>:
    f288:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    f28c:	e28db000 	add	fp, sp, #0
    f290:	e24dd014 	sub	sp, sp, #20
    f294:	e1a03000 	mov	r3, r0
    f298:	e54b300d 	strb	r3, [fp, #-13]
    f29c:	e3a03004 	mov	r3, #4
    f2a0:	e54b3005 	strb	r3, [fp, #-5]
    f2a4:	e55b300d 	ldrb	r3, [fp, #-13]
    f2a8:	e1a032a3 	lsr	r3, r3, #5
    f2ac:	e6ef3073 	uxtb	r3, r3
    f2b0:	e3530000 	cmp	r3, #0
    f2b4:	0a000002 	beq	f2c4 <RPI_GetGpioValue+0x3c>
    f2b8:	e3530001 	cmp	r3, #1
    f2bc:	0a00000c 	beq	f2f4 <RPI_GetGpioValue+0x6c>
    f2c0:	ea000018 	b	f328 <RPI_GetGpioValue+0xa0>
    f2c4:	e30f3ec4 	movw	r3, #65220	; 0xfec4
    f2c8:	e3403000 	movt	r3, #0
    f2cc:	e5933000 	ldr	r3, [r3]
    f2d0:	e5933034 	ldr	r3, [r3, #52]	; 0x34
    f2d4:	e6ef2073 	uxtb	r2, r3
    f2d8:	e55b300d 	ldrb	r3, [fp, #-13]
    f2dc:	e3a01001 	mov	r1, #1
    f2e0:	e1a03311 	lsl	r3, r1, r3
    f2e4:	e6ef3073 	uxtb	r3, r3
    f2e8:	e0033002 	and	r3, r3, r2
    f2ec:	e54b3005 	strb	r3, [fp, #-5]
    f2f0:	ea00000c 	b	f328 <RPI_GetGpioValue+0xa0>
    f2f4:	e30f3ec4 	movw	r3, #65220	; 0xfec4
    f2f8:	e3403000 	movt	r3, #0
    f2fc:	e5933000 	ldr	r3, [r3]
    f300:	e5933038 	ldr	r3, [r3, #56]	; 0x38
    f304:	e6ef2073 	uxtb	r2, r3
    f308:	e55b300d 	ldrb	r3, [fp, #-13]
    f30c:	e2433020 	sub	r3, r3, #32
    f310:	e3a01001 	mov	r1, #1
    f314:	e1a03311 	lsl	r3, r1, r3
    f318:	e6ef3073 	uxtb	r3, r3
    f31c:	e0033002 	and	r3, r3, r2
    f320:	e54b3005 	strb	r3, [fp, #-5]
    f324:	e320f000 	nop	{0}
    f328:	e55b3005 	ldrb	r3, [fp, #-5]
    f32c:	e3530004 	cmp	r3, #4
    f330:	0a000004 	beq	f348 <RPI_GetGpioValue+0xc0>
    f334:	e55b3005 	ldrb	r3, [fp, #-5]
    f338:	e3530000 	cmp	r3, #0
    f33c:	0a000001 	beq	f348 <RPI_GetGpioValue+0xc0>
    f340:	e3a03001 	mov	r3, #1
    f344:	e54b3005 	strb	r3, [fp, #-5]
    f348:	e55b3005 	ldrb	r3, [fp, #-5]
    f34c:	e1a00003 	mov	r0, r3
    f350:	e28bd000 	add	sp, fp, #0
    f354:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    f358:	e12fff1e 	bx	lr

0000f35c <RPI_ToggleGpio>:
    f35c:	e92d4800 	push	{fp, lr}
    f360:	e28db004 	add	fp, sp, #4
    f364:	e24dd008 	sub	sp, sp, #8
    f368:	e1a03000 	mov	r3, r0
    f36c:	e54b3005 	strb	r3, [fp, #-5]
    f370:	e55b3005 	ldrb	r3, [fp, #-5]
    f374:	e1a00003 	mov	r0, r3
    f378:	ebffffc2 	bl	f288 <RPI_GetGpioValue>
    f37c:	e1a03000 	mov	r3, r0
    f380:	e3530000 	cmp	r3, #0
    f384:	0a000003 	beq	f398 <RPI_ToggleGpio+0x3c>
    f388:	e55b3005 	ldrb	r3, [fp, #-5]
    f38c:	e1a00003 	mov	r0, r3
    f390:	eb000028 	bl	f438 <RPI_SetGpioLo>
    f394:	ea000002 	b	f3a4 <RPI_ToggleGpio+0x48>
    f398:	e55b3005 	ldrb	r3, [fp, #-5]
    f39c:	e1a00003 	mov	r0, r3
    f3a0:	eb000002 	bl	f3b0 <RPI_SetGpioHi>
    f3a4:	e320f000 	nop	{0}
    f3a8:	e24bd004 	sub	sp, fp, #4
    f3ac:	e8bd8800 	pop	{fp, pc}

0000f3b0 <RPI_SetGpioHi>:
    f3b0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    f3b4:	e28db000 	add	fp, sp, #0
    f3b8:	e24dd00c 	sub	sp, sp, #12
    f3bc:	e1a03000 	mov	r3, r0
    f3c0:	e54b3005 	strb	r3, [fp, #-5]
    f3c4:	e55b3005 	ldrb	r3, [fp, #-5]
    f3c8:	e1a032a3 	lsr	r3, r3, #5
    f3cc:	e6ef3073 	uxtb	r3, r3
    f3d0:	e3530000 	cmp	r3, #0
    f3d4:	0a000002 	beq	f3e4 <RPI_SetGpioHi+0x34>
    f3d8:	e3530001 	cmp	r3, #1
    f3dc:	0a000008 	beq	f404 <RPI_SetGpioHi+0x54>
    f3e0:	ea000010 	b	f428 <RPI_SetGpioHi+0x78>
    f3e4:	e55b3005 	ldrb	r3, [fp, #-5]
    f3e8:	e3a02001 	mov	r2, #1
    f3ec:	e1a02312 	lsl	r2, r2, r3
    f3f0:	e30f3ec4 	movw	r3, #65220	; 0xfec4
    f3f4:	e3403000 	movt	r3, #0
    f3f8:	e5933000 	ldr	r3, [r3]
    f3fc:	e583201c 	str	r2, [r3, #28]
    f400:	ea000008 	b	f428 <RPI_SetGpioHi+0x78>
    f404:	e55b3005 	ldrb	r3, [fp, #-5]
    f408:	e2433020 	sub	r3, r3, #32
    f40c:	e3a02001 	mov	r2, #1
    f410:	e1a02312 	lsl	r2, r2, r3
    f414:	e30f3ec4 	movw	r3, #65220	; 0xfec4
    f418:	e3403000 	movt	r3, #0
    f41c:	e5933000 	ldr	r3, [r3]
    f420:	e5832020 	str	r2, [r3, #32]
    f424:	e320f000 	nop	{0}
    f428:	e320f000 	nop	{0}
    f42c:	e28bd000 	add	sp, fp, #0
    f430:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    f434:	e12fff1e 	bx	lr

0000f438 <RPI_SetGpioLo>:
    f438:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    f43c:	e28db000 	add	fp, sp, #0
    f440:	e24dd00c 	sub	sp, sp, #12
    f444:	e1a03000 	mov	r3, r0
    f448:	e54b3005 	strb	r3, [fp, #-5]
    f44c:	e55b3005 	ldrb	r3, [fp, #-5]
    f450:	e1a032a3 	lsr	r3, r3, #5
    f454:	e6ef3073 	uxtb	r3, r3
    f458:	e3530000 	cmp	r3, #0
    f45c:	0a000002 	beq	f46c <RPI_SetGpioLo+0x34>
    f460:	e3530001 	cmp	r3, #1
    f464:	0a000008 	beq	f48c <RPI_SetGpioLo+0x54>
    f468:	ea000010 	b	f4b0 <RPI_SetGpioLo+0x78>
    f46c:	e55b3005 	ldrb	r3, [fp, #-5]
    f470:	e3a02001 	mov	r2, #1
    f474:	e1a02312 	lsl	r2, r2, r3
    f478:	e30f3ec4 	movw	r3, #65220	; 0xfec4
    f47c:	e3403000 	movt	r3, #0
    f480:	e5933000 	ldr	r3, [r3]
    f484:	e5832028 	str	r2, [r3, #40]	; 0x28
    f488:	ea000008 	b	f4b0 <RPI_SetGpioLo+0x78>
    f48c:	e55b3005 	ldrb	r3, [fp, #-5]
    f490:	e2433020 	sub	r3, r3, #32
    f494:	e3a02001 	mov	r2, #1
    f498:	e1a02312 	lsl	r2, r2, r3
    f49c:	e30f3ec4 	movw	r3, #65220	; 0xfec4
    f4a0:	e3403000 	movt	r3, #0
    f4a4:	e5933000 	ldr	r3, [r3]
    f4a8:	e583202c 	str	r2, [r3, #44]	; 0x2c
    f4ac:	e320f000 	nop	{0}
    f4b0:	e320f000 	nop	{0}
    f4b4:	e28bd000 	add	sp, fp, #0
    f4b8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    f4bc:	e12fff1e 	bx	lr

0000f4c0 <RPI_SetGpioValue>:
    f4c0:	e92d4800 	push	{fp, lr}
    f4c4:	e28db004 	add	fp, sp, #4
    f4c8:	e24dd008 	sub	sp, sp, #8
    f4cc:	e1a03000 	mov	r3, r0
    f4d0:	e1a02001 	mov	r2, r1
    f4d4:	e54b3005 	strb	r3, [fp, #-5]
    f4d8:	e1a03002 	mov	r3, r2
    f4dc:	e54b3006 	strb	r3, [fp, #-6]
    f4e0:	e55b3006 	ldrb	r3, [fp, #-6]
    f4e4:	e3530000 	cmp	r3, #0
    f4e8:	0a000002 	beq	f4f8 <RPI_SetGpioValue+0x38>
    f4ec:	e55b3006 	ldrb	r3, [fp, #-6]
    f4f0:	e3530003 	cmp	r3, #3
    f4f4:	1a000003 	bne	f508 <RPI_SetGpioValue+0x48>
    f4f8:	e55b3005 	ldrb	r3, [fp, #-5]
    f4fc:	e1a00003 	mov	r0, r3
    f500:	ebffffcc 	bl	f438 <RPI_SetGpioLo>
    f504:	ea000008 	b	f52c <RPI_SetGpioValue+0x6c>
    f508:	e55b3006 	ldrb	r3, [fp, #-6]
    f50c:	e3530001 	cmp	r3, #1
    f510:	0a000002 	beq	f520 <RPI_SetGpioValue+0x60>
    f514:	e55b3006 	ldrb	r3, [fp, #-6]
    f518:	e3530002 	cmp	r3, #2
    f51c:	1a000002 	bne	f52c <RPI_SetGpioValue+0x6c>
    f520:	e55b3005 	ldrb	r3, [fp, #-5]
    f524:	e1a00003 	mov	r0, r3
    f528:	ebffffa0 	bl	f3b0 <RPI_SetGpioHi>
    f52c:	e320f000 	nop	{0}
    f530:	e24bd004 	sub	sp, fp, #4
    f534:	e8bd8800 	pop	{fp, pc}

0000f538 <RPI_GetIrqController>:
    f538:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    f53c:	e28db000 	add	fp, sp, #0
    f540:	e30f3ec8 	movw	r3, #65224	; 0xfec8
    f544:	e3403000 	movt	r3, #0
    f548:	e5933000 	ldr	r3, [r3]
    f54c:	e1a00003 	mov	r0, r3
    f550:	e28bd000 	add	sp, fp, #0
    f554:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    f558:	e12fff1e 	bx	lr

0000f55c <default_handler>:
    f55c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    f560:	e28db000 	add	fp, sp, #0
    f564:	e24dd00c 	sub	sp, sp, #12
    f568:	e50b0008 	str	r0, [fp, #-8]
    f56c:	e320f000 	nop	{0}
    f570:	e28bd000 	add	sp, fp, #0
    f574:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    f578:	e12fff1e 	bx	lr

0000f57c <setvect>:
    f57c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    f580:	e28db000 	add	fp, sp, #0
    f584:	e24dd00c 	sub	sp, sp, #12
    f588:	e50b0008 	str	r0, [fp, #-8]
    f58c:	e50b100c 	str	r1, [fp, #-12]
    f590:	e51b3008 	ldr	r3, [fp, #-8]
    f594:	e3530070 	cmp	r3, #112	; 0x70
    f598:	0a000013 	beq	f5ec <setvect+0x70>
    f59c:	e51b3008 	ldr	r3, [fp, #-8]
    f5a0:	e3530070 	cmp	r3, #112	; 0x70
    f5a4:	8a000015 	bhi	f600 <setvect+0x84>
    f5a8:	e51b3008 	ldr	r3, [fp, #-8]
    f5ac:	e3530015 	cmp	r3, #21
    f5b0:	0a000003 	beq	f5c4 <setvect+0x48>
    f5b4:	e51b3008 	ldr	r3, [fp, #-8]
    f5b8:	e3530060 	cmp	r3, #96	; 0x60
    f5bc:	0a000005 	beq	f5d8 <setvect+0x5c>
    f5c0:	ea00000e 	b	f600 <setvect+0x84>
    f5c4:	e30f3ecc 	movw	r3, #65228	; 0xfecc
    f5c8:	e3403000 	movt	r3, #0
    f5cc:	e51b200c 	ldr	r2, [fp, #-12]
    f5d0:	e5832000 	str	r2, [r3]
    f5d4:	ea000009 	b	f600 <setvect+0x84>
    f5d8:	e30f3ecc 	movw	r3, #65228	; 0xfecc
    f5dc:	e3403000 	movt	r3, #0
    f5e0:	e51b200c 	ldr	r2, [fp, #-12]
    f5e4:	e5832004 	str	r2, [r3, #4]
    f5e8:	ea000004 	b	f600 <setvect+0x84>
    f5ec:	e30f3ecc 	movw	r3, #65228	; 0xfecc
    f5f0:	e3403000 	movt	r3, #0
    f5f4:	e51b200c 	ldr	r2, [fp, #-12]
    f5f8:	e5832008 	str	r2, [r3, #8]
    f5fc:	e320f000 	nop	{0}
    f600:	e320f000 	nop	{0}
    f604:	e28bd000 	add	sp, fp, #0
    f608:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    f60c:	e12fff1e 	bx	lr

0000f610 <getvect>:
    f610:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    f614:	e28db000 	add	fp, sp, #0
    f618:	e24dd00c 	sub	sp, sp, #12
    f61c:	e50b0008 	str	r0, [fp, #-8]
    f620:	e51b3008 	ldr	r3, [fp, #-8]
    f624:	e3530070 	cmp	r3, #112	; 0x70
    f628:	0a000011 	beq	f674 <getvect+0x64>
    f62c:	e51b3008 	ldr	r3, [fp, #-8]
    f630:	e3530070 	cmp	r3, #112	; 0x70
    f634:	8a000012 	bhi	f684 <getvect+0x74>
    f638:	e51b3008 	ldr	r3, [fp, #-8]
    f63c:	e3530015 	cmp	r3, #21
    f640:	0a000003 	beq	f654 <getvect+0x44>
    f644:	e51b3008 	ldr	r3, [fp, #-8]
    f648:	e3530060 	cmp	r3, #96	; 0x60
    f64c:	0a000004 	beq	f664 <getvect+0x54>
    f650:	ea00000b 	b	f684 <getvect+0x74>
    f654:	e30f3ecc 	movw	r3, #65228	; 0xfecc
    f658:	e3403000 	movt	r3, #0
    f65c:	e5933000 	ldr	r3, [r3]
    f660:	ea000007 	b	f684 <getvect+0x74>
    f664:	e30f3ecc 	movw	r3, #65228	; 0xfecc
    f668:	e3403000 	movt	r3, #0
    f66c:	e5933004 	ldr	r3, [r3, #4]
    f670:	ea000003 	b	f684 <getvect+0x74>
    f674:	e30f3ecc 	movw	r3, #65228	; 0xfecc
    f678:	e3403000 	movt	r3, #0
    f67c:	e5933008 	ldr	r3, [r3, #8]
    f680:	eaffffff 	b	f684 <getvect+0x74>
    f684:	e1a00003 	mov	r0, r3
    f688:	e28bd000 	add	sp, fp, #0
    f68c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    f690:	e12fff1e 	bx	lr

0000f694 <irq_handler>:
    f694:	e92d4800 	push	{fp, lr}
    f698:	e28db004 	add	fp, sp, #4
    f69c:	e24dd008 	sub	sp, sp, #8
    f6a0:	e50b0008 	str	r0, [fp, #-8]
    f6a4:	ebfffd94 	bl	ecfc <RPI_GetArmTimer>
    f6a8:	e1a03000 	mov	r3, r0
    f6ac:	e3a02001 	mov	r2, #1
    f6b0:	e583200c 	str	r2, [r3, #12]
    f6b4:	e30f3ecc 	movw	r3, #65228	; 0xfecc
    f6b8:	e3403000 	movt	r3, #0
    f6bc:	e5933008 	ldr	r3, [r3, #8]
    f6c0:	e51b0008 	ldr	r0, [fp, #-8]
    f6c4:	e12fff33 	blx	r3
    f6c8:	ebfffd8b 	bl	ecfc <RPI_GetArmTimer>
    f6cc:	e1a03000 	mov	r3, r0
    f6d0:	e3a02058 	mov	r2, #88	; 0x58
    f6d4:	e5832000 	str	r2, [r3]
    f6d8:	e320f000 	nop	{0}
    f6dc:	e24bd004 	sub	sp, fp, #4
    f6e0:	e8bd8800 	pop	{fp, pc}

0000f6e4 <svc_handler>:
    f6e4:	e92d4800 	push	{fp, lr}
    f6e8:	e28db004 	add	fp, sp, #4
    f6ec:	e24dd008 	sub	sp, sp, #8
    f6f0:	e50b0008 	str	r0, [fp, #-8]
    f6f4:	e30f3ecc 	movw	r3, #65228	; 0xfecc
    f6f8:	e3403000 	movt	r3, #0
    f6fc:	e5933004 	ldr	r3, [r3, #4]
    f700:	e51b0008 	ldr	r0, [fp, #-8]
    f704:	e12fff33 	blx	r3
    f708:	e320f000 	nop	{0}
    f70c:	e24bd004 	sub	sp, fp, #4
    f710:	e8bd8800 	pop	{fp, pc}

0000f714 <RPI_GetSystemTimer>:
    f714:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    f718:	e28db000 	add	fp, sp, #0
    f71c:	e30f3ed8 	movw	r3, #65240	; 0xfed8
    f720:	e3403000 	movt	r3, #0
    f724:	e5933000 	ldr	r3, [r3]
    f728:	e1a00003 	mov	r0, r3
    f72c:	e28bd000 	add	sp, fp, #0
    f730:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    f734:	e12fff1e 	bx	lr

0000f738 <RPI_WaitMicroSeconds>:
    f738:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    f73c:	e28db000 	add	fp, sp, #0
    f740:	e24dd014 	sub	sp, sp, #20
    f744:	e50b0010 	str	r0, [fp, #-16]
    f748:	e30f3ed8 	movw	r3, #65240	; 0xfed8
    f74c:	e3403000 	movt	r3, #0
    f750:	e5933000 	ldr	r3, [r3]
    f754:	e5933004 	ldr	r3, [r3, #4]
    f758:	e50b3008 	str	r3, [fp, #-8]
    f75c:	e320f000 	nop	{0}
    f760:	e30f3ed8 	movw	r3, #65240	; 0xfed8
    f764:	e3403000 	movt	r3, #0
    f768:	e5933000 	ldr	r3, [r3]
    f76c:	e5932004 	ldr	r2, [r3, #4]
    f770:	e51b3008 	ldr	r3, [fp, #-8]
    f774:	e0423003 	sub	r3, r2, r3
    f778:	e51b2010 	ldr	r2, [fp, #-16]
    f77c:	e1520003 	cmp	r2, r3
    f780:	8afffff6 	bhi	f760 <RPI_WaitMicroSeconds+0x28>
    f784:	e320f000 	nop	{0}
    f788:	e320f000 	nop	{0}
    f78c:	e28bd000 	add	sp, fp, #0
    f790:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    f794:	e12fff1e 	bx	lr

0000f798 <RPI_GetUart>:
    f798:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    f79c:	e28db000 	add	fp, sp, #0
    f7a0:	e30f3edc 	movw	r3, #65244	; 0xfedc
    f7a4:	e3403000 	movt	r3, #0
    f7a8:	e5933000 	ldr	r3, [r3]
    f7ac:	e1a00003 	mov	r0, r3
    f7b0:	e28bd000 	add	sp, fp, #0
    f7b4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    f7b8:	e12fff1e 	bx	lr

0000f7bc <RPI_UartInit>:
    f7bc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    f7c0:	e28db000 	add	fp, sp, #0
    f7c4:	e320f000 	nop	{0}
    f7c8:	e28bd000 	add	sp, fp, #0
    f7cc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    f7d0:	e12fff1e 	bx	lr

0000f7d4 <mem_init>:
    f7d4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    f7d8:	e28db000 	add	fp, sp, #0
    f7dc:	e30f3ee0 	movw	r3, #65248	; 0xfee0
    f7e0:	e3403000 	movt	r3, #0
    f7e4:	e5933000 	ldr	r3, [r3]
    f7e8:	e3a02801 	mov	r2, #65536	; 0x10000
    f7ec:	e5832000 	str	r2, [r3]
    f7f0:	e30f3ee0 	movw	r3, #65248	; 0xfee0
    f7f4:	e3403000 	movt	r3, #0
    f7f8:	e5933000 	ldr	r3, [r3]
    f7fc:	e3a02000 	mov	r2, #0
    f800:	e5832004 	str	r2, [r3, #4]
    f804:	e320f000 	nop	{0}
    f808:	e28bd000 	add	sp, fp, #0
    f80c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    f810:	e12fff1e 	bx	lr

0000f814 <malloc>:
    f814:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    f818:	e28db000 	add	fp, sp, #0
    f81c:	e24dd01c 	sub	sp, sp, #28
    f820:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    f824:	e30f3ee0 	movw	r3, #65248	; 0xfee0
    f828:	e3403000 	movt	r3, #0
    f82c:	e5933000 	ldr	r3, [r3]
    f830:	e50b3008 	str	r3, [fp, #-8]
    f834:	e3a03000 	mov	r3, #0
    f838:	e50b300c 	str	r3, [fp, #-12]
    f83c:	e3a03000 	mov	r3, #0
    f840:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    f844:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    f848:	e2833004 	add	r3, r3, #4
    f84c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    f850:	ea00002f 	b	f914 <malloc+0x100>
    f854:	e51b3008 	ldr	r3, [fp, #-8]
    f858:	e5933000 	ldr	r3, [r3]
    f85c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    f860:	e1520003 	cmp	r2, r3
    f864:	9a000005 	bls	f880 <malloc+0x6c>
    f868:	e51b3008 	ldr	r3, [fp, #-8]
    f86c:	e50b300c 	str	r3, [fp, #-12]
    f870:	e51b3008 	ldr	r3, [fp, #-8]
    f874:	e5933004 	ldr	r3, [r3, #4]
    f878:	e50b3008 	str	r3, [fp, #-8]
    f87c:	ea000024 	b	f914 <malloc+0x100>
    f880:	e51b3008 	ldr	r3, [fp, #-8]
    f884:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    f888:	e51b3008 	ldr	r3, [fp, #-8]
    f88c:	e5933000 	ldr	r3, [r3]
    f890:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    f894:	e1520003 	cmp	r2, r3
    f898:	2a00000e 	bcs	f8d8 <malloc+0xc4>
    f89c:	e51b2008 	ldr	r2, [fp, #-8]
    f8a0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    f8a4:	e0823003 	add	r3, r2, r3
    f8a8:	e50b3010 	str	r3, [fp, #-16]
    f8ac:	e51b3008 	ldr	r3, [fp, #-8]
    f8b0:	e5932000 	ldr	r2, [r3]
    f8b4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    f8b8:	e0422003 	sub	r2, r2, r3
    f8bc:	e51b3010 	ldr	r3, [fp, #-16]
    f8c0:	e5832000 	str	r2, [r3]
    f8c4:	e51b3008 	ldr	r3, [fp, #-8]
    f8c8:	e5932004 	ldr	r2, [r3, #4]
    f8cc:	e51b3010 	ldr	r3, [fp, #-16]
    f8d0:	e5832004 	str	r2, [r3, #4]
    f8d4:	ea000002 	b	f8e4 <malloc+0xd0>
    f8d8:	e51b3008 	ldr	r3, [fp, #-8]
    f8dc:	e5933004 	ldr	r3, [r3, #4]
    f8e0:	e50b3010 	str	r3, [fp, #-16]
    f8e4:	e51b300c 	ldr	r3, [fp, #-12]
    f8e8:	e3530000 	cmp	r3, #0
    f8ec:	1a000004 	bne	f904 <malloc+0xf0>
    f8f0:	e30f3ee0 	movw	r3, #65248	; 0xfee0
    f8f4:	e3403000 	movt	r3, #0
    f8f8:	e51b2010 	ldr	r2, [fp, #-16]
    f8fc:	e5832000 	str	r2, [r3]
    f900:	ea000006 	b	f920 <malloc+0x10c>
    f904:	e51b300c 	ldr	r3, [fp, #-12]
    f908:	e51b2010 	ldr	r2, [fp, #-16]
    f90c:	e5832004 	str	r2, [r3, #4]
    f910:	ea000002 	b	f920 <malloc+0x10c>
    f914:	e51b3008 	ldr	r3, [fp, #-8]
    f918:	e3530000 	cmp	r3, #0
    f91c:	1affffcc 	bne	f854 <malloc+0x40>
    f920:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    f924:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    f928:	e5832000 	str	r2, [r3]
    f92c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    f930:	e2833004 	add	r3, r3, #4
    f934:	e1a00003 	mov	r0, r3
    f938:	e28bd000 	add	sp, fp, #0
    f93c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    f940:	e12fff1e 	bx	lr

0000f944 <free>:
    f944:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    f948:	e28db000 	add	fp, sp, #0
    f94c:	e24dd01c 	sub	sp, sp, #28
    f950:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    f954:	e30f3ee0 	movw	r3, #65248	; 0xfee0
    f958:	e3403000 	movt	r3, #0
    f95c:	e5933000 	ldr	r3, [r3]
    f960:	e50b3008 	str	r3, [fp, #-8]
    f964:	e3a03000 	mov	r3, #0
    f968:	e50b300c 	str	r3, [fp, #-12]
    f96c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    f970:	e2433004 	sub	r3, r3, #4
    f974:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    f978:	ea000027 	b	fa1c <free+0xd8>
    f97c:	e51b2008 	ldr	r2, [fp, #-8]
    f980:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    f984:	e1520003 	cmp	r2, r3
    f988:	2a000005 	bcs	f9a4 <free+0x60>
    f98c:	e51b3008 	ldr	r3, [fp, #-8]
    f990:	e50b300c 	str	r3, [fp, #-12]
    f994:	e51b3008 	ldr	r3, [fp, #-8]
    f998:	e5933004 	ldr	r3, [r3, #4]
    f99c:	e50b3008 	str	r3, [fp, #-8]
    f9a0:	ea00001d 	b	fa1c <free+0xd8>
    f9a4:	e51b300c 	ldr	r3, [fp, #-12]
    f9a8:	e3530000 	cmp	r3, #0
    f9ac:	1a00000d 	bne	f9e8 <free+0xa4>
    f9b0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    f9b4:	e50b300c 	str	r3, [fp, #-12]
    f9b8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    f9bc:	e5932000 	ldr	r2, [r3]
    f9c0:	e51b300c 	ldr	r3, [fp, #-12]
    f9c4:	e5832000 	str	r2, [r3]
    f9c8:	e51b300c 	ldr	r3, [fp, #-12]
    f9cc:	e51b2008 	ldr	r2, [fp, #-8]
    f9d0:	e5832004 	str	r2, [r3, #4]
    f9d4:	e30f3ee0 	movw	r3, #65248	; 0xfee0
    f9d8:	e3403000 	movt	r3, #0
    f9dc:	e51b200c 	ldr	r2, [fp, #-12]
    f9e0:	e5832000 	str	r2, [r3]
    f9e4:	ea000010 	b	fa2c <free+0xe8>
    f9e8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    f9ec:	e50b3010 	str	r3, [fp, #-16]
    f9f0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    f9f4:	e5932000 	ldr	r2, [r3]
    f9f8:	e51b3010 	ldr	r3, [fp, #-16]
    f9fc:	e5832000 	str	r2, [r3]
    fa00:	e51b3010 	ldr	r3, [fp, #-16]
    fa04:	e51b2008 	ldr	r2, [fp, #-8]
    fa08:	e5832004 	str	r2, [r3, #4]
    fa0c:	e51b300c 	ldr	r3, [fp, #-12]
    fa10:	e51b2010 	ldr	r2, [fp, #-16]
    fa14:	e5832004 	str	r2, [r3, #4]
    fa18:	ea000003 	b	fa2c <free+0xe8>
    fa1c:	e51b3008 	ldr	r3, [fp, #-8]
    fa20:	e3530000 	cmp	r3, #0
    fa24:	1affffd4 	bne	f97c <free+0x38>
    fa28:	e320f000 	nop	{0}
    fa2c:	e320f000 	nop	{0}
    fa30:	e28bd000 	add	sp, fp, #0
    fa34:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    fa38:	e12fff1e 	bx	lr

0000fa3c <memcp>:
    fa3c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    fa40:	e28db000 	add	fp, sp, #0
    fa44:	e24dd01c 	sub	sp, sp, #28
    fa48:	e50b0010 	str	r0, [fp, #-16]
    fa4c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    fa50:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    fa54:	e3a03000 	mov	r3, #0
    fa58:	e50b3008 	str	r3, [fp, #-8]
    fa5c:	ea00000a 	b	fa8c <memcp+0x50>
    fa60:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    fa64:	e51b3008 	ldr	r3, [fp, #-8]
    fa68:	e0822003 	add	r2, r2, r3
    fa6c:	e51b1010 	ldr	r1, [fp, #-16]
    fa70:	e51b3008 	ldr	r3, [fp, #-8]
    fa74:	e0813003 	add	r3, r1, r3
    fa78:	e5d22000 	ldrb	r2, [r2]
    fa7c:	e5c32000 	strb	r2, [r3]
    fa80:	e51b3008 	ldr	r3, [fp, #-8]
    fa84:	e2833001 	add	r3, r3, #1
    fa88:	e50b3008 	str	r3, [fp, #-8]
    fa8c:	e51b2008 	ldr	r2, [fp, #-8]
    fa90:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    fa94:	e1520003 	cmp	r2, r3
    fa98:	3afffff0 	bcc	fa60 <memcp+0x24>
    fa9c:	e320f000 	nop	{0}
    faa0:	e320f000 	nop	{0}
    faa4:	e28bd000 	add	sp, fp, #0
    faa8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    faac:	e12fff1e 	bx	lr

0000fab0 <memse>:
    fab0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    fab4:	e28db000 	add	fp, sp, #0
    fab8:	e24dd01c 	sub	sp, sp, #28
    fabc:	e50b0010 	str	r0, [fp, #-16]
    fac0:	e1a03001 	mov	r3, r1
    fac4:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    fac8:	e54b3011 	strb	r3, [fp, #-17]	; 0xffffffef
    facc:	e3a03000 	mov	r3, #0
    fad0:	e50b3008 	str	r3, [fp, #-8]
    fad4:	ea000007 	b	faf8 <memse+0x48>
    fad8:	e51b2010 	ldr	r2, [fp, #-16]
    fadc:	e51b3008 	ldr	r3, [fp, #-8]
    fae0:	e0823003 	add	r3, r2, r3
    fae4:	e55b2011 	ldrb	r2, [fp, #-17]	; 0xffffffef
    fae8:	e5c32000 	strb	r2, [r3]
    faec:	e51b3008 	ldr	r3, [fp, #-8]
    faf0:	e2833001 	add	r3, r3, #1
    faf4:	e50b3008 	str	r3, [fp, #-8]
    faf8:	e51b2008 	ldr	r2, [fp, #-8]
    fafc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    fb00:	e1520003 	cmp	r2, r3
    fb04:	3afffff3 	bcc	fad8 <memse+0x28>
    fb08:	e320f000 	nop	{0}
    fb0c:	e320f000 	nop	{0}
    fb10:	e28bd000 	add	sp, fp, #0
    fb14:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    fb18:	e12fff1e 	bx	lr

0000fb1c <memcm>:
    fb1c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    fb20:	e28db000 	add	fp, sp, #0
    fb24:	e24dd01c 	sub	sp, sp, #28
    fb28:	e50b0010 	str	r0, [fp, #-16]
    fb2c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    fb30:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    fb34:	e3a03000 	mov	r3, #0
    fb38:	e50b3008 	str	r3, [fp, #-8]
    fb3c:	ea00000e 	b	fb7c <memcm+0x60>
    fb40:	e51b2010 	ldr	r2, [fp, #-16]
    fb44:	e51b3008 	ldr	r3, [fp, #-8]
    fb48:	e0823003 	add	r3, r2, r3
    fb4c:	e5d32000 	ldrb	r2, [r3]
    fb50:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
    fb54:	e51b3008 	ldr	r3, [fp, #-8]
    fb58:	e0813003 	add	r3, r1, r3
    fb5c:	e5d33000 	ldrb	r3, [r3]
    fb60:	e1520003 	cmp	r2, r3
    fb64:	0a000001 	beq	fb70 <memcm+0x54>
    fb68:	e3a03000 	mov	r3, #0
    fb6c:	ea000007 	b	fb90 <memcm+0x74>
    fb70:	e51b3008 	ldr	r3, [fp, #-8]
    fb74:	e2833001 	add	r3, r3, #1
    fb78:	e50b3008 	str	r3, [fp, #-8]
    fb7c:	e51b2008 	ldr	r2, [fp, #-8]
    fb80:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    fb84:	e1520003 	cmp	r2, r3
    fb88:	3affffec 	bcc	fb40 <memcm+0x24>
    fb8c:	e3a03001 	mov	r3, #1
    fb90:	e1a00003 	mov	r0, r3
    fb94:	e28bd000 	add	sp, fp, #0
    fb98:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    fb9c:	e12fff1e 	bx	lr

0000fba0 <print1>:
    fba0:	e92d4800 	push	{fp, lr}
    fba4:	e28db004 	add	fp, sp, #4
    fba8:	e24dd010 	sub	sp, sp, #16
    fbac:	e50b0010 	str	r0, [fp, #-16]
    fbb0:	e3a03000 	mov	r3, #0
    fbb4:	e50b3008 	str	r3, [fp, #-8]
    fbb8:	ea00000e 	b	fbf8 <print1+0x58>
    fbbc:	e30f0e10 	movw	r0, #65040	; 0xfe10
    fbc0:	e3400000 	movt	r0, #0
    fbc4:	ebfffcf7 	bl	efa8 <print_str>
    fbc8:	e30f0e18 	movw	r0, #65048	; 0xfe18
    fbcc:	e3400000 	movt	r0, #0
    fbd0:	ebfffcf4 	bl	efa8 <print_str>
    fbd4:	e30f0e1c 	movw	r0, #65052	; 0xfe1c
    fbd8:	e3400000 	movt	r0, #0
    fbdc:	ebfffcf1 	bl	efa8 <print_str>
    fbe0:	e30f0e24 	movw	r0, #65060	; 0xfe24
    fbe4:	e3400000 	movt	r0, #0
    fbe8:	ebfffcee 	bl	efa8 <print_str>
    fbec:	e51b3008 	ldr	r3, [fp, #-8]
    fbf0:	e2833001 	add	r3, r3, #1
    fbf4:	e50b3008 	str	r3, [fp, #-8]
    fbf8:	e51b3008 	ldr	r3, [fp, #-8]
    fbfc:	e3530063 	cmp	r3, #99	; 0x63
    fc00:	daffffed 	ble	fbbc <print1+0x1c>
    fc04:	e320f000 	nop	{0}
    fc08:	e320f000 	nop	{0}
    fc0c:	e24bd004 	sub	sp, fp, #4
    fc10:	e8bd8800 	pop	{fp, pc}

0000fc14 <print2>:
    fc14:	e92d4800 	push	{fp, lr}
    fc18:	e28db004 	add	fp, sp, #4
    fc1c:	e24dd010 	sub	sp, sp, #16
    fc20:	e50b0010 	str	r0, [fp, #-16]
    fc24:	e3a03000 	mov	r3, #0
    fc28:	e50b3008 	str	r3, [fp, #-8]
    fc2c:	ea000014 	b	fc84 <print2+0x70>
    fc30:	e30f0e30 	movw	r0, #65072	; 0xfe30
    fc34:	e3400000 	movt	r0, #0
    fc38:	ebfffcda 	bl	efa8 <print_str>
    fc3c:	e30f0e3c 	movw	r0, #65084	; 0xfe3c
    fc40:	e3400000 	movt	r0, #0
    fc44:	ebfffcd7 	bl	efa8 <print_str>
    fc48:	e30f0e44 	movw	r0, #65092	; 0xfe44
    fc4c:	e3400000 	movt	r0, #0
    fc50:	ebfffcd4 	bl	efa8 <print_str>
    fc54:	e30f0e48 	movw	r0, #65096	; 0xfe48
    fc58:	e3400000 	movt	r0, #0
    fc5c:	ebfffcd1 	bl	efa8 <print_str>
    fc60:	e30f0e54 	movw	r0, #65108	; 0xfe54
    fc64:	e3400000 	movt	r0, #0
    fc68:	ebfffcce 	bl	efa8 <print_str>
    fc6c:	e30f0e60 	movw	r0, #65120	; 0xfe60
    fc70:	e3400000 	movt	r0, #0
    fc74:	ebfffccb 	bl	efa8 <print_str>
    fc78:	e51b3008 	ldr	r3, [fp, #-8]
    fc7c:	e2833001 	add	r3, r3, #1
    fc80:	e50b3008 	str	r3, [fp, #-8]
    fc84:	e51b3008 	ldr	r3, [fp, #-8]
    fc88:	e3530063 	cmp	r3, #99	; 0x63
    fc8c:	daffffe7 	ble	fc30 <print2+0x1c>
    fc90:	e320f000 	nop	{0}
    fc94:	e320f000 	nop	{0}
    fc98:	e24bd004 	sub	sp, fp, #4
    fc9c:	e8bd8800 	pop	{fp, pc}

0000fca0 <print3>:
    fca0:	e92d4800 	push	{fp, lr}
    fca4:	e28db004 	add	fp, sp, #4
    fca8:	e24dd010 	sub	sp, sp, #16
    fcac:	e50b0010 	str	r0, [fp, #-16]
    fcb0:	e3a03000 	mov	r3, #0
    fcb4:	e50b3008 	str	r3, [fp, #-8]
    fcb8:	ea000014 	b	fd10 <print3+0x70>
    fcbc:	e30f0e6c 	movw	r0, #65132	; 0xfe6c
    fcc0:	e3400000 	movt	r0, #0
    fcc4:	ebfffcb7 	bl	efa8 <print_str>
    fcc8:	e30f0e18 	movw	r0, #65048	; 0xfe18
    fccc:	e3400000 	movt	r0, #0
    fcd0:	ebfffcb4 	bl	efa8 <print_str>
    fcd4:	e30f0e74 	movw	r0, #65140	; 0xfe74
    fcd8:	e3400000 	movt	r0, #0
    fcdc:	ebfffcb1 	bl	efa8 <print_str>
    fce0:	e30f0e7c 	movw	r0, #65148	; 0xfe7c
    fce4:	e3400000 	movt	r0, #0
    fce8:	ebfffcae 	bl	efa8 <print_str>
    fcec:	e30f0e80 	movw	r0, #65152	; 0xfe80
    fcf0:	e3400000 	movt	r0, #0
    fcf4:	ebfffcab 	bl	efa8 <print_str>
    fcf8:	e30f0e88 	movw	r0, #65160	; 0xfe88
    fcfc:	e3400000 	movt	r0, #0
    fd00:	ebfffca8 	bl	efa8 <print_str>
    fd04:	e51b3008 	ldr	r3, [fp, #-8]
    fd08:	e2833001 	add	r3, r3, #1
    fd0c:	e50b3008 	str	r3, [fp, #-8]
    fd10:	e51b3008 	ldr	r3, [fp, #-8]
    fd14:	e3530063 	cmp	r3, #99	; 0x63
    fd18:	daffffe7 	ble	fcbc <print3+0x1c>
    fd1c:	e320f000 	nop	{0}
    fd20:	e320f000 	nop	{0}
    fd24:	e24bd004 	sub	sp, fp, #4
    fd28:	e8bd8800 	pop	{fp, pc}

0000fd2c <main>:
    fd2c:	e92d4800 	push	{fp, lr}
    fd30:	e28db004 	add	fp, sp, #4
    fd34:	e24dd018 	sub	sp, sp, #24
    fd38:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    fd3c:	e30f0e90 	movw	r0, #65168	; 0xfe90
    fd40:	e3400000 	movt	r0, #0
    fd44:	ebfffc97 	bl	efa8 <print_str>
    fd48:	ebfffce4 	bl	f0e0 <getch>
    fd4c:	e3a03000 	mov	r3, #0
    fd50:	e3a02000 	mov	r2, #0
    fd54:	e3021710 	movw	r1, #10000	; 0x2710
    fd58:	e30f0ba0 	movw	r0, #64416	; 0xfba0
    fd5c:	e3400000 	movt	r0, #0
    fd60:	ebffe21e 	bl	85e0 <create_task>
    fd64:	e50b0008 	str	r0, [fp, #-8]
    fd68:	e3a03000 	mov	r3, #0
    fd6c:	e3a02000 	mov	r2, #0
    fd70:	e3021710 	movw	r1, #10000	; 0x2710
    fd74:	e30f0c14 	movw	r0, #64532	; 0xfc14
    fd78:	e3400000 	movt	r0, #0
    fd7c:	ebffe217 	bl	85e0 <create_task>
    fd80:	e50b000c 	str	r0, [fp, #-12]
    fd84:	e3a03000 	mov	r3, #0
    fd88:	e3a02000 	mov	r2, #0
    fd8c:	e3021710 	movw	r1, #10000	; 0x2710
    fd90:	e30f0ca0 	movw	r0, #64672	; 0xfca0
    fd94:	e3400000 	movt	r0, #0
    fd98:	ebffe210 	bl	85e0 <create_task>
    fd9c:	e50b0010 	str	r0, [fp, #-16]
    fda0:	e3a01064 	mov	r1, #100	; 0x64
    fda4:	e51b0008 	ldr	r0, [fp, #-8]
    fda8:	ebffe52b 	bl	925c <sptsk>
    fdac:	e3a01064 	mov	r1, #100	; 0x64
    fdb0:	e51b000c 	ldr	r0, [fp, #-12]
    fdb4:	ebffe528 	bl	925c <sptsk>
    fdb8:	e3a01064 	mov	r1, #100	; 0x64
    fdbc:	e51b0010 	ldr	r0, [fp, #-16]
    fdc0:	ebffe525 	bl	925c <sptsk>
    fdc4:	e320f000 	nop	{0}
    fdc8:	e24bd004 	sub	sp, fp, #4
    fdcc:	e8bd8800 	pop	{fp, pc}

Disassembly of section .rodata:

0000fdd0 <.rodata>:
    fdd0:	424d4853 	submi	r4, sp, #5439488	; 0x530000
    fdd4:	00314b4c 	eorseq	r4, r1, ip, asr #22
    fdd8:	6c410d0a 	mcrrvs	13, 0, r0, r1, cr10
    fddc:	6174206c 	cmnvs	r4, ip, rrx
    fde0:	20736b73 	rsbscs	r6, r3, r3, ror fp
    fde4:	65766168 	ldrbvs	r6, [r6, #-360]!	; 0xfffffe98
    fde8:	6e696620 	cdpvs	6, 6, cr6, cr9, cr0, {1}
    fdec:	65687369 	strbvs	r7, [r8, #-873]!	; 0xfffffc97
    fdf0:	00002164 	andeq	r2, r0, r4, ror #2
    fdf4:	74696e49 	strbtvc	r6, [r9], #-3657	; 0xfffff1b7
    fdf8:	696c6169 	stmdbvs	ip!, {r0, r3, r5, r6, r8, sp, lr}^
    fdfc:	6974617a 	ldmdbvs	r4!, {r1, r3, r4, r5, r6, r8, sp, lr}^
    fe00:	63206e6f 			; <UNDEFINED> instruction: 0x63206e6f
    fe04:	6c706d6f 	ldclvs	13, cr6, [r0], #-444	; 0xfffffe44
    fe08:	0a657465 	beq	196cfa4 <_stack+0x18ecfa4>
    fe0c:	0000000d 	andeq	r0, r0, sp
    fe10:	7a65765a 	bvc	196d780 <_stack+0x18ed780>
    fe14:	00616476 	rsbeq	r6, r1, r6, ror r4
    fe18:	00656a20 	rsbeq	r6, r5, r0, lsr #20
    fe1c:	76727020 	ldrbtvc	r7, [r2], -r0, lsr #32
    fe20:	00006b61 	andeq	r6, r0, r1, ror #22
    fe24:	76736a20 	ldrbtvc	r6, [r3], -r0, lsr #20
    fe28:	0a617465 	beq	186cfc4 <_stack+0x17ecfc4>
    fe2c:	0000000d 	andeq	r0, r0, sp
    fe30:	70697250 	rsbvc	r7, r9, r0, asr r2
    fe34:	616d6572 	smcvs	54866	; 0xd652
    fe38:	00000000 	andeq	r0, r0, r0
    fe3c:	7a657620 	bvc	196d6c4 <_stack+0x18ed6c4>
    fe40:	00006562 	andeq	r6, r0, r2, ror #10
    fe44:	007a6920 	rsbseq	r6, sl, r0, lsr #18
    fe48:	73697320 	cmnvc	r9, #32, 6	; 0x80000000
    fe4c:	736d6574 	cmnvc	sp, #116, 10	; 0x1d000000
    fe50:	0000656b 	andeq	r6, r0, fp, ror #10
    fe54:	6f727020 	svcvs	0x00727020
    fe58:	6d617267 	sfmvs	f7, 2, [r1, #-412]!	; 0xfffffe64
    fe5c:	00656b73 	rsbeq	r6, r5, r3, ror fp
    fe60:	646f7020 	strbtvs	r7, [pc], #-32	; fe68 <main+0x13c>
    fe64:	656b7372 	strbvs	r7, [fp, #-882]!	; 0xfffffc8e
    fe68:	00000d0a 	andeq	r0, r0, sl, lsl #26
    fe6c:	616e6144 	cmnvs	lr, r4, asr #2
    fe70:	00000073 	andeq	r0, r0, r3, ror r0
    fe74:	70656c20 	rsbvc	r6, r5, r0, lsr #24
    fe78:	00000000 	andeq	r0, r0, r0
    fe7c:	00006920 	andeq	r6, r0, r0, lsr #18
    fe80:	6e757320 	cdpvs	3, 7, cr7, cr5, cr0, {1}
    fe84:	006e6163 	rsbeq	r6, lr, r3, ror #2
    fe88:	6e616420 	cdpvs	4, 6, cr6, cr1, cr0, {1}
    fe8c:	00000d0a 	andeq	r0, r0, sl, lsl #26
    fe90:	73657250 	cmnvc	r5, #80, 4
    fe94:	6e452073 	mcrvs	0, 2, r2, cr5, cr3, {3}
    fe98:	20726574 	rsbscs	r6, r2, r4, ror r5
    fe9c:	73206f74 			; <UNDEFINED> instruction: 0x73206f74
    fea0:	74726174 	ldrbtvc	r6, [r2], #-372	; 0xfffffe8c
    fea4:	65687420 	strbvs	r7, [r8, #-1056]!	; 0xfffffbe0
    fea8:	65786520 	ldrbvs	r6, [r8, #-1312]!	; 0xfffffae0
    feac:	69747563 	ldmdbvs	r4!, {r0, r1, r5, r6, r8, sl, ip, sp, lr}^
    feb0:	0a216e6f 	beq	86b874 <_stack+0x7eb874>
    feb4:	Address 0x000000000000feb4 is out of bounds.


Disassembly of section .data:

0000feb8 <task_no>:
    feb8:	00000001 	andeq	r0, r0, r1

0000febc <rpiArmTimer>:
    febc:	3f00b400 	svccc	0x0000b400

0000fec0 <auxillary>:
    fec0:	3f215000 	svccc	0x00215000

0000fec4 <rpiGpio>:
    fec4:	3f200000 	svccc	0x00200000

0000fec8 <rpiIRQController>:
    fec8:	3f00b200 	svccc	0x0000b200

0000fecc <vectors>:
    fecc:	0000f55c 	andeq	pc, r0, ip, asr r5	; <UNPREDICTABLE>
    fed0:	0000f55c 	andeq	pc, r0, ip, asr r5	; <UNPREDICTABLE>
    fed4:	0000f55c 	andeq	pc, r0, ip, asr r5	; <UNPREDICTABLE>

0000fed8 <rpiSystemTimer>:
    fed8:	3f003000 	svccc	0x00003000

0000fedc <rpiUart>:
    fedc:	3f201000 	svccc	0x00201000

0000fee0 <_mem_free>:
    fee0:	00100000 	andseq	r0, r0, r0

Disassembly of section .bss:

0000fee4 <OldDispInt>:
    fee4:	00000000 	andeq	r0, r0, r0

0000fee8 <OldTimeInt>:
    fee8:	00000000 	andeq	r0, r0, r0

0000feec <OldRMTimeInt>:
    feec:	00000000 	andeq	r0, r0, r0

0000fef0 <OldRMInt15>:
    fef0:	00000000 	andeq	r0, r0, r0

0000fef4 <running>:
    fef4:	00000000 	andeq	r0, r0, r0

0000fef8 <readyhead>:
    fef8:	00000000 	andeq	r0, r0, r0

0000fefc <readytail>:
    fefc:	00000000 	andeq	r0, r0, r0

0000ff00 <tim_susphead>:
    ff00:	00000000 	andeq	r0, r0, r0

0000ff04 <disp_mode>:
    ff04:	00000000 	andeq	r0, r0, r0

0000ff08 <last_task>:
    ff08:	00000000 	andeq	r0, r0, r0

0000ff0c <time_susp>:
    ff0c:	00000000 	andeq	r0, r0, r0

0000ff10 <timer_count_susp>:
    ff10:	00000000 	andeq	r0, r0, r0

0000ff14 <ts_rate>:
    ff14:	00000000 	andeq	r0, r0, r0

0000ff18 <SysHnd>:
    ff18:	00000000 	andeq	r0, r0, r0

0000ff1c <br2>:
    ff1c:	00000000 	andeq	r0, r0, r0

0000ff20 <br>:
    ff20:	00000000 	andeq	r0, r0, r0

0000ff24 <c>:
    ff24:	00000000 	andeq	r0, r0, r0

0000ff28 <stop_timeslice>:
    ff28:	00000000 	andeq	r0, r0, r0

0000ff2c <__change_task__>:
    ff2c:	00000000 	andeq	r0, r0, r0

0000ff30 <in_switching>:
    ff30:	00000000 	andeq	r0, r0, r0

0000ff34 <user_int70>:
    ff34:	00000000 	andeq	r0, r0, r0

0000ff38 <LRT>:
	...

00010334 <ts_disabled>:
   10334:	00000000 	andeq	r0, r0, r0

00010338 <TimerListHead>:
   10338:	00000000 	andeq	r0, r0, r0

0001033c <int70_counter>:
   1033c:	00000000 	andeq	r0, r0, r0

00010340 <tick_counter>:
   10340:	00000000 	andeq	r0, r0, r0

00010344 <task_time>:
   10344:	00000000 	andeq	r0, r0, r0

00010348 <mt_act>:
   10348:	00000000 	andeq	r0, r0, r0

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	bcc	10d0d24 <_stack+0x1050d24>
   4:	35312820 	ldrcc	r2, [r1, #-2080]!	; 0xfffff7e0
   8:	322d393a 	eorcc	r3, sp, #950272	; 0xe8000
   c:	2d393130 	ldfcss	f3, [r9, #-192]!	; 0xffffff40
  10:	302d3471 	eorcc	r3, sp, r1, ror r4
  14:	6e756275 	mrcvs	2, 3, r6, cr5, cr5, {3}
  18:	29317574 	ldmdbcs	r1!, {r2, r4, r5, r6, r8, sl, ip, sp, lr}
  1c:	322e3920 	eorcc	r3, lr, #32, 18	; 0x80000
  20:	3220312e 	eorcc	r3, r0, #-2147483637	; 0x8000000b
  24:	31393130 	teqcc	r9, r0, lsr r1
  28:	20353230 	eorscs	r3, r5, r0, lsr r2
  2c:	6c657228 	sfmvs	f7, 2, [r5], #-160	; 0xffffff60
  30:	65736165 	ldrbvs	r6, [r3, #-357]!	; 0xfffffe9b
  34:	415b2029 	cmpmi	fp, r9, lsr #32
  38:	612f4d52 			; <UNDEFINED> instruction: 0x612f4d52
  3c:	392d6d72 	pushcc	{r1, r4, r5, r6, r8, sl, fp, sp, lr}
  40:	6172622d 	cmnvs	r2, sp, lsr #4
  44:	2068636e 	rsbcs	r6, r8, lr, ror #6
  48:	69766572 	ldmdbvs	r6!, {r1, r4, r5, r6, r8, sl, sp, lr}^
  4c:	6e6f6973 			; <UNDEFINED> instruction: 0x6e6f6973
  50:	37373220 	ldrcc	r3, [r7, -r0, lsr #4]!
  54:	5d393935 			; <UNDEFINED> instruction: 0x5d393935
	...

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	0000001c 	andeq	r0, r0, ip, lsl r0
   4:	00000002 	andeq	r0, r0, r2
   8:	00040000 	andeq	r0, r4, r0
   c:	00000000 	andeq	r0, r0, r0
  10:	00008000 	andeq	r8, r0, r0
  14:	00000148 	andeq	r0, r0, r8, asr #2
	...
  20:	0000001c 	andeq	r0, r0, ip, lsl r0
  24:	00260002 	eoreq	r0, r6, r2
  28:	00040000 	andeq	r0, r4, r0
  2c:	00000000 	andeq	r0, r0, r0
  30:	00008148 	andeq	r8, r0, r8, asr #2
  34:	00000078 	andeq	r0, r0, r8, ror r0
	...
  40:	0000001c 	andeq	r0, r0, ip, lsl r0
  44:	01160002 	tsteq	r6, r2
  48:	00040000 	andeq	r0, r4, r0
  4c:	00000000 	andeq	r0, r0, r0
  50:	000081c0 	andeq	r8, r0, r0, asr #3
  54:	00006b3c 	andeq	r6, r0, ip, lsr fp
	...
  60:	0000001c 	andeq	r0, r0, ip, lsl r0
  64:	23b30002 			; <UNDEFINED> instruction: 0x23b30002
  68:	00040000 	andeq	r0, r4, r0
  6c:	00000000 	andeq	r0, r0, r0
  70:	0000ecfc 	strdeq	lr, [r0], -ip
  74:	0000003c 	andeq	r0, r0, ip, lsr r0
	...
  80:	0000001c 	andeq	r0, r0, ip, lsl r0
  84:	24fb0002 	ldrbtcs	r0, [fp], #2
  88:	00040000 	andeq	r0, r4, r0
  8c:	00000000 	andeq	r0, r0, r0
  90:	0000ed38 	andeq	lr, r0, r8, lsr sp
  94:	000003c0 	andeq	r0, r0, r0, asr #7
	...
  a0:	0000001c 	andeq	r0, r0, ip, lsl r0
  a4:	2a280002 	bcs	a000b4 <_stack+0x9800b4>
  a8:	00040000 	andeq	r0, r4, r0
  ac:	00000000 	andeq	r0, r0, r0
  b0:	0000f0f8 	strdeq	pc, [r0], -r8
  b4:	00000440 	andeq	r0, r0, r0, asr #8
	...
  c0:	0000001c 	andeq	r0, r0, ip, lsl r0
  c4:	308f0002 	addcc	r0, pc, r2
  c8:	00040000 	andeq	r0, r4, r0
  cc:	00000000 	andeq	r0, r0, r0
  d0:	0000f538 	andeq	pc, r0, r8, lsr r5	; <UNPREDICTABLE>
  d4:	000001dc 	ldrdeq	r0, [r0], -ip
	...
  e0:	0000001c 	andeq	r0, r0, ip, lsl r0
  e4:	33cb0002 	biccc	r0, fp, #2
  e8:	00040000 	andeq	r0, r4, r0
  ec:	00000000 	andeq	r0, r0, r0
  f0:	0000f714 	andeq	pc, r0, r4, lsl r7	; <UNPREDICTABLE>
  f4:	00000084 	andeq	r0, r0, r4, lsl #1
	...
 100:	0000001c 	andeq	r0, r0, ip, lsl r0
 104:	351a0002 	ldrcc	r0, [sl, #-2]
 108:	00040000 	andeq	r0, r4, r0
 10c:	00000000 	andeq	r0, r0, r0
 110:	0000f798 	muleq	r0, r8, r7
 114:	0000003c 	andeq	r0, r0, ip, lsr r0
	...
 120:	0000001c 	andeq	r0, r0, ip, lsl r0
 124:	36e40002 	strbtcc	r0, [r4], r2
 128:	00040000 	andeq	r0, r4, r0
 12c:	00000000 	andeq	r0, r0, r0
 130:	0000f7d4 	ldrdeq	pc, [r0], -r4
 134:	000003cc 	andeq	r0, r0, ip, asr #7
	...
 140:	0000001c 	andeq	r0, r0, ip, lsl r0
 144:	39740002 	ldmdbcc	r4!, {r1}^
 148:	00040000 	andeq	r0, r4, r0
 14c:	00000000 	andeq	r0, r0, r0
 150:	0000fba0 	andeq	pc, r0, r0, lsr #23
 154:	00000230 	andeq	r0, r0, r0, lsr r2
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
       0:	00000022 	andeq	r0, r0, r2, lsr #32
       4:	00000002 	andeq	r0, r0, r2
       8:	01040000 	mrseq	r0, (UNDEF: 4)
       c:	00000000 	andeq	r0, r0, r0
      10:	00008000 	andeq	r8, r0, r0
      14:	00008148 	andeq	r8, r0, r8, asr #2
      18:	00000000 	andeq	r0, r0, r0
      1c:	0000003d 	andeq	r0, r0, sp, lsr r0
      20:	0000006b 	andeq	r0, r0, fp, rrx
      24:	00ec8001 	rsceq	r8, ip, r1
      28:	00040000 	andeq	r0, r4, r0
      2c:	00000014 	andeq	r0, r0, r4, lsl r0
      30:	00ce0104 	sbceq	r0, lr, r4, lsl #2
      34:	680c0000 	stmdavs	ip, {}	; <UNPREDICTABLE>
      38:	3d000001 	stccc	0, cr0, [r0, #-4]
      3c:	48000000 	stmdami	r0, {}	; <UNPREDICTABLE>
      40:	78000081 	stmdavc	r0, {r0, r7}
      44:	c7000000 	strgt	r0, [r0, -r0]
      48:	02000000 	andeq	r0, r0, #0
      4c:	00c20601 	sbceq	r0, r2, r1, lsl #12
      50:	02020000 	andeq	r0, r2, #0
      54:	0001c305 	andeq	ip, r1, r5, lsl #6
      58:	05040200 	streq	r0, [r4, #-512]	; 0xfffffe00
      5c:	0000007c 	andeq	r0, r0, ip, ror r0
      60:	77050802 	strvc	r0, [r5, -r2, lsl #16]
      64:	02000000 	andeq	r0, r0, #0
      68:	00c00801 	sbceq	r0, r0, r1, lsl #16
      6c:	02020000 	andeq	r0, r2, #0
      70:	0001b007 	andeq	fp, r1, r7
      74:	07040200 	streq	r0, [r4, -r0, lsl #4]
      78:	000000ae 	andeq	r0, r0, lr, lsr #1
      7c:	a9070802 	stmdbge	r7, {r1, fp}
      80:	03000000 	movweq	r0, #0
      84:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
      88:	04020074 	streq	r0, [r2], #-116	; 0xffffff8c
      8c:	0000b307 	andeq	fp, r0, r7, lsl #6
      90:	08010200 	stmdaeq	r1, {r9}
      94:	000000c9 	andeq	r0, r0, r9, asr #1
      98:	00008f04 	andeq	r8, r0, r4, lsl #30
      9c:	0c0f0100 	stfeqs	f0, [pc], {-0}
      a0:	0000005d 	andeq	r0, r0, sp, asr r0
      a4:	00009d04 	andeq	r9, r0, r4, lsl #26
      a8:	0c100100 	ldfeqs	f0, [r0], {-0}
      ac:	0000005d 	andeq	r0, r0, sp, asr r0
      b0:	00008505 	andeq	r8, r0, r5, lsl #10
      b4:	06240100 	strteq	r0, [r4], -r0, lsl #2
      b8:	00008148 	andeq	r8, r0, r8, asr #2
      bc:	00000078 	andeq	r0, r0, r8, ror r0
      c0:	00e99c01 	rsceq	r9, r9, r1, lsl #24
      c4:	72060000 	andvc	r0, r6, #0
      c8:	24010030 	strcs	r0, [r1], #-48	; 0xffffffd0
      cc:	0000641d 	andeq	r6, r0, sp, lsl r4
      d0:	6c910200 	lfmvs	f0, 4, [r1], {0}
      d4:	00317206 	eorseq	r7, r1, r6, lsl #4
      d8:	642e2401 	strtvs	r2, [lr], #-1025	; 0xfffffbff
      dc:	02000000 	andeq	r0, r0, #0
      e0:	72066891 	andvc	r6, r6, #9502720	; 0x910000
      e4:	24010032 	strcs	r0, [r1], #-50	; 0xffffffce
      e8:	0000643f 	andeq	r6, r0, pc, lsr r4
      ec:	64910200 	ldrvs	r0, [r1], #512	; 0x200
      f0:	73736207 	cmnvc	r3, #1879048192	; 0x70000000
      f4:	08250100 	stmdaeq	r5!, {r8}
      f8:	000000e9 	andeq	r0, r0, r9, ror #1
      fc:	08749102 	ldmdaeq	r4!, {r1, r8, ip, pc}^
     100:	000001a8 	andeq	r0, r0, r8, lsr #3
     104:	e9082601 	stmdb	r8, {r0, r9, sl, sp}
     108:	02000000 	andeq	r0, r0, #0
     10c:	09007091 	stmdbeq	r0, {r0, r4, r7, ip, sp, lr}
     110:	00005d04 	andeq	r5, r0, r4, lsl #26
     114:	22990000 	addscs	r0, r9, #0
     118:	00040000 	andeq	r0, r4, r0
     11c:	000000a9 	andeq	r0, r0, r9, lsr #1
     120:	00ce0104 	sbceq	r0, lr, r4, lsl #2
     124:	6d0c0000 	stcvs	0, cr0, [ip, #-0]
     128:	3d000002 	stccc	0, cr0, [r0, #-8]
     12c:	c0000000 	andgt	r0, r0, r0
     130:	3c000081 	stccc	0, cr0, [r0], {129}	; 0x81
     134:	4d00006b 	stcmi	0, cr0, [r0, #-428]	; 0xfffffe54
     138:	02000001 	andeq	r0, r0, #1
     13c:	00c20601 	sbceq	r0, r2, r1, lsl #12
     140:	02020000 	andeq	r0, r2, #0
     144:	0001c305 	andeq	ip, r1, r5, lsl #6
     148:	05040200 	streq	r0, [r4, #-512]	; 0xfffffe00
     14c:	0000007c 	andeq	r0, r0, ip, ror r0
     150:	77050802 	strvc	r0, [r5, -r2, lsl #16]
     154:	03000000 	movweq	r0, #0
     158:	00000700 	andeq	r0, r0, r0, lsl #14
     15c:	4d182e02 	ldcmi	14, cr2, [r8, #-8]
     160:	02000000 	andeq	r0, r0, #0
     164:	00c00801 	sbceq	r0, r0, r1, lsl #16
     168:	fe030000 	cdp2	0, 0, cr0, cr3, cr0, {0}
     16c:	02000008 	andeq	r0, r0, #8
     170:	00601931 	rsbeq	r1, r0, r1, lsr r9
     174:	02020000 	andeq	r0, r2, #0
     178:	0001b007 	andeq	fp, r1, r7
     17c:	047c0300 	ldrbteq	r0, [ip], #-768	; 0xfffffd00
     180:	34020000 	strcc	r0, [r2], #-0
     184:	00007319 	andeq	r7, r0, r9, lsl r3
     188:	07040200 	streq	r0, [r4, -r0, lsl #4]
     18c:	000000ae 	andeq	r0, r0, lr, lsr #1
     190:	a9070802 	stmdbge	r7, {r1, fp}
     194:	04000000 	streq	r0, [r0], #-0
     198:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
     19c:	81050074 	tsthi	r5, r4, ror r0
     1a0:	02000000 	andeq	r0, r0, #0
     1a4:	00b30704 	adcseq	r0, r3, r4, lsl #14
     1a8:	01030000 	mrseq	r0, (UNDEF: 3)
     1ac:	03000008 	movweq	r0, #8
     1b0:	00411210 	subeq	r1, r1, r0, lsl r2
     1b4:	1a030000 	bne	c01bc <_stack+0x401bc>
     1b8:	03000008 	movweq	r0, #8
     1bc:	00541312 	subseq	r1, r4, r2, lsl r3
     1c0:	79060000 	stmdbvc	r6, {}	; <UNPREDICTABLE>
     1c4:	44000008 	strmi	r0, [r0], #-8
     1c8:	88083103 	stmdahi	r8, {r0, r1, r8, ip, sp}
     1cc:	07000001 	streq	r0, [r0, -r1]
     1d0:	03007073 	movweq	r7, #115	; 0x73
     1d4:	00670b32 	rsbeq	r0, r7, r2, lsr fp
     1d8:	07000000 	streq	r0, [r0, -r0]
     1dc:	0300726c 	movweq	r7, #620	; 0x26c
     1e0:	00670e32 	rsbeq	r0, r7, r2, lsr lr
     1e4:	07040000 	streq	r0, [r4, -r0]
     1e8:	03003072 	movweq	r3, #114	; 0x72
     1ec:	00670b33 	rsbeq	r0, r7, r3, lsr fp
     1f0:	07080000 	streq	r0, [r8, -r0]
     1f4:	03003172 	movweq	r3, #370	; 0x172
     1f8:	00670e33 	rsbeq	r0, r7, r3, lsr lr
     1fc:	070c0000 	streq	r0, [ip, -r0]
     200:	03003272 	movweq	r3, #626	; 0x272
     204:	00671133 	rsbeq	r1, r7, r3, lsr r1
     208:	07100000 	ldreq	r0, [r0, -r0]
     20c:	03003372 	movweq	r3, #882	; 0x372
     210:	00671433 	rsbeq	r1, r7, r3, lsr r4
     214:	07140000 	ldreq	r0, [r4, -r0]
     218:	03003472 	movweq	r3, #1138	; 0x472
     21c:	00670b34 	rsbeq	r0, r7, r4, lsr fp
     220:	07180000 	ldreq	r0, [r8, -r0]
     224:	03003572 	movweq	r3, #1394	; 0x572
     228:	00670e34 	rsbeq	r0, r7, r4, lsr lr
     22c:	071c0000 	ldreq	r0, [ip, -r0]
     230:	03003672 	movweq	r3, #1650	; 0x672
     234:	00671134 	rsbeq	r1, r7, r4, lsr r1
     238:	07200000 	streq	r0, [r0, -r0]!
     23c:	03003772 	movweq	r3, #1906	; 0x772
     240:	00671434 	rsbeq	r1, r7, r4, lsr r4
     244:	07240000 	streq	r0, [r4, -r0]!
     248:	03003872 	movweq	r3, #2162	; 0x872
     24c:	00670b35 	rsbeq	r0, r7, r5, lsr fp
     250:	07280000 	streq	r0, [r8, -r0]!
     254:	03003972 	movweq	r3, #2418	; 0x972
     258:	00670e35 	rsbeq	r0, r7, r5, lsr lr
     25c:	072c0000 	streq	r0, [ip, -r0]!
     260:	00303172 	eorseq	r3, r0, r2, ror r1
     264:	67113503 	ldrvs	r3, [r1, -r3, lsl #10]
     268:	30000000 	andcc	r0, r0, r0
     26c:	00706607 	rsbseq	r6, r0, r7, lsl #12
     270:	670b3603 	strvs	r3, [fp, -r3, lsl #12]
     274:	34000000 	strcc	r0, [r0], #-0
     278:	00706907 	rsbseq	r6, r0, r7, lsl #18
     27c:	670e3603 	strvs	r3, [lr, -r3, lsl #12]
     280:	38000000 	stmdacc	r0, {}	; <UNPREDICTABLE>
     284:	00637007 	rsbeq	r7, r3, r7
     288:	670b3703 	strvs	r3, [fp, -r3, lsl #14]
     28c:	3c000000 	stccc	0, cr0, [r0], {-0}
     290:	0009f608 	andeq	pc, r9, r8, lsl #12
     294:	0e370300 	cdpeq	3, 3, cr0, cr7, cr0, {0}
     298:	00000067 	andeq	r0, r0, r7, rrx
     29c:	32060040 	andcc	r0, r6, #64	; 0x40
     2a0:	24000003 	strcs	r0, [r0], #-3
     2a4:	0b103c03 	bleq	40f2b8 <_stack+0x38f2b8>
     2a8:	08000002 	stmdaeq	r0, {r1}
     2ac:	000009ca 	andeq	r0, r0, sl, asr #19
     2b0:	81083d03 	tsthi	r8, r3, lsl #26
     2b4:	00000000 	andeq	r0, r0, r0
     2b8:	000aeb08 	andeq	lr, sl, r8, lsl #22
     2bc:	083e0300 	ldmdaeq	lr!, {r8, r9}
     2c0:	00000081 	andeq	r0, r0, r1, lsl #1
     2c4:	05600804 	strbeq	r0, [r0, #-2052]!	; 0xfffff7fc
     2c8:	3f030000 	svccc	0x00030000
     2cc:	00008108 	andeq	r8, r0, r8, lsl #2
     2d0:	37080800 	strcc	r0, [r8, -r0, lsl #16]
     2d4:	03000008 	movweq	r0, #8
     2d8:	00810840 	addeq	r0, r1, r0, asr #16
     2dc:	080c0000 	stmdaeq	ip, {}	; <UNPREDICTABLE>
     2e0:	00000a61 	andeq	r0, r0, r1, ror #20
     2e4:	81084103 	tsthi	r8, r3, lsl #2
     2e8:	10000000 	andne	r0, r0, r0
     2ec:	0006c208 	andeq	ip, r6, r8, lsl #4
     2f0:	08420300 	stmdaeq	r2, {r8, r9}^
     2f4:	00000081 	andeq	r0, r0, r1, lsl #1
     2f8:	09410814 	stmdbeq	r1, {r2, r4, fp}^
     2fc:	43030000 	movwmi	r0, #12288	; 0x3000
     300:	00020b0b 	andeq	r0, r2, fp, lsl #22
     304:	e2081800 	and	r1, r8, #0, 16
     308:	03000009 	movweq	r0, #9
     30c:	021e0a44 	andseq	r0, lr, #68, 20	; 0x44000
     310:	081c0000 	ldmdaeq	ip, {}	; <UNPREDICTABLE>
     314:	00000b0f 	andeq	r0, r0, pc, lsl #22
     318:	1e0a4503 	cfsh32ne	mvfx4, mvfx10, #3
     31c:	20000002 	andcs	r0, r0, r2
     320:	11040900 	tstne	r4, r0, lsl #18
     324:	09000002 	stmdbeq	r0, {r1}
     328:	00021704 	andeq	r1, r2, r4, lsl #14
     32c:	08010200 	stmdaeq	r1, {r9}
     330:	000000c9 	andeq	r0, r0, r9, asr #1
     334:	e303040a 	movw	r0, #13322	; 0x340a
     338:	03000006 	movweq	r0, #6
     33c:	01880346 	orreq	r0, r8, r6, asr #6
     340:	04090000 	streq	r0, [r9], #-0
     344:	00000220 	andeq	r0, r0, r0, lsr #4
     348:	000a1d06 	andeq	r1, sl, r6, lsl #26
     34c:	4b03a400 	blmi	e9354 <_stack+0x69354>
     350:	00033708 	andeq	r3, r3, r8, lsl #14
     354:	06030800 	streq	r0, [r3], -r0, lsl #16
     358:	4c030000 	stcmi	0, cr0, [r3], {-0}
     35c:	0000ac17 	andeq	sl, r0, r7, lsl ip
     360:	84080000 	strhi	r0, [r8], #-0
     364:	0300000b 	movweq	r0, #11
     368:	00a0174d 	adceq	r1, r0, sp, asr #14
     36c:	08440000 	stmdaeq	r4, {}^	; <UNPREDICTABLE>
     370:	0000092c 	andeq	r0, r0, ip, lsr #18
     374:	a0174e03 	andsge	r4, r7, r3, lsl #28
     378:	46000000 	strmi	r0, [r0], -r0
     37c:	0005c508 	andeq	ip, r5, r8, lsl #10
     380:	174f0300 	strbne	r0, [pc, -r0, lsl #6]
     384:	000000a0 	andeq	r0, r0, r0, lsr #1
     388:	0a590848 	beq	16424b0 <_stack+0x15c24b0>
     38c:	50030000 	andpl	r0, r3, r0
     390:	0000a017 	andeq	sl, r0, r7, lsl r0
     394:	71084a00 	tstvc	r8, r0, lsl #20
     398:	03000008 	movweq	r0, #8
     39c:	008d1651 	addeq	r1, sp, r1, asr r6
     3a0:	084c0000 	stmdaeq	ip, {}^	; <UNPREDICTABLE>
     3a4:	00000a36 	andeq	r0, r0, r6, lsr sl
     3a8:	8d175203 	lfmhi	f5, 4, [r7, #-12]
     3ac:	50000000 	andpl	r0, r0, r0
     3b0:	0004a408 	andeq	sl, r4, r8, lsl #8
     3b4:	17530300 	ldrbne	r0, [r3, -r0, lsl #6]
     3b8:	000000a0 	andeq	r0, r0, r0, lsr #1
     3bc:	09a00854 	stmibeq	r0!, {r2, r4, r6, fp}
     3c0:	54030000 	strpl	r0, [r3], #-0
     3c4:	00034219 	andeq	r4, r3, r9, lsl r2
     3c8:	75085800 	strvc	r5, [r8, #-2048]	; 0xfffff800
     3cc:	03000005 	movweq	r0, #5
     3d0:	021e1655 	andseq	r1, lr, #89128960	; 0x5500000
     3d4:	085c0000 	ldmdaeq	ip, {}^	; <UNPREDICTABLE>
     3d8:	0000095b 	andeq	r0, r0, fp, asr r9
     3dc:	1e175603 	cfmsub32ne	mvax0, mvfx5, mvfx7, mvfx3
     3e0:	60000002 	andvs	r0, r0, r2
     3e4:	0005ac08 	andeq	sl, r5, r8, lsl #24
     3e8:	17570300 	ldrbne	r0, [r7, -r0, lsl #6]
     3ec:	0000008d 	andeq	r0, r0, sp, lsl #1
     3f0:	09eb0864 	stmibeq	fp!, {r2, r5, r6, fp}^
     3f4:	58030000 	stmdapl	r3, {}	; <UNPREDICTABLE>
     3f8:	00034824 	andeq	r4, r3, r4, lsr #16
     3fc:	ef086800 	svc	0x00086800
     400:	03000002 	movweq	r0, #2
     404:	03482459 	movteq	r2, #33881	; 0x8459
     408:	086c0000 	stmdaeq	ip!, {}^	; <UNPREDICTABLE>
     40c:	00000718 	andeq	r0, r0, r8, lsl r7
     410:	48245a03 	stmdami	r4!, {r0, r1, r9, fp, ip, lr}
     414:	70000003 	andvc	r0, r0, r3
     418:	0009fb08 	andeq	pc, r9, r8, lsl #22
     41c:	175b0300 	ldrbne	r0, [fp, -r0, lsl #6]
     420:	00000220 	andeq	r0, r0, r0, lsr #4
     424:	08a20874 	stmiaeq	r2!, {r2, r4, r5, r6, fp}
     428:	5c030000 	stcpl	0, cr0, [r3], {-0}
     42c:	00007317 	andeq	r7, r0, r7, lsl r3
     430:	33089800 	movwcc	r9, #34816	; 0x8800
     434:	03000006 	movweq	r0, #6
     438:	0073175d 	rsbseq	r1, r3, sp, asr r7
     43c:	089c0000 	ldmeq	ip, {}	; <UNPREDICTABLE>
     440:	00000337 	andeq	r0, r0, r7, lsr r3
     444:	73175e03 	tstvc	r7, #3, 28	; 0x30
     448:	a0000000 	andge	r0, r0, r0
     44c:	03420b00 	movteq	r0, #11008	; 0x2b00
     450:	1e0c0000 	cdpne	0, 0, cr0, cr12, cr0, {0}
     454:	00000002 	andeq	r0, r0, r2
     458:	03370409 	teqeq	r7, #150994944	; 0x9000000
     45c:	04090000 	streq	r0, [r9], #-0
     460:	00000232 	andeq	r0, r0, r2, lsr r2
     464:	4153490d 	cmpmi	r3, sp, lsl #18
     468:	1c610300 	stclne	3, cr0, [r1], #-0
     46c:	00000232 	andeq	r0, r0, r2, lsr r2
     470:	00085903 	andeq	r5, r8, r3, lsl #18
     474:	0f620300 	svceq	0x00620300
     478:	00000366 	andeq	r0, r0, r6, ror #6
     47c:	034e0409 	movteq	r0, #58377	; 0xe409
     480:	51060000 	mrspl	r0, (UNDEF: 6)
     484:	0c000008 	stceq	0, cr0, [r0], {8}
     488:	a1086503 	tstge	r8, r3, lsl #10
     48c:	08000003 	stmdaeq	r0, {r0, r1}
     490:	000006c9 	andeq	r0, r0, r9, asr #13
     494:	81096603 	tsthi	r9, r3, lsl #12
     498:	00000000 	andeq	r0, r0, r0
     49c:	0007fc08 	andeq	pc, r7, r8, lsl #24
     4a0:	16670300 	strbtne	r0, [r7], -r0, lsl #6
     4a4:	00000348 	andeq	r0, r0, r8, asr #6
     4a8:	08060804 	stmdaeq	r6, {r2, fp}
     4ac:	68030000 	stmdavs	r3, {}	; <UNPREDICTABLE>
     4b0:	00034816 	andeq	r4, r3, r6, lsl r8
     4b4:	06000800 	streq	r0, [r0], -r0, lsl #16
     4b8:	000004e7 	andeq	r0, r0, r7, ror #9
     4bc:	086c0314 	stmdaeq	ip!, {r2, r4, r8, r9}^
     4c0:	000003f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     4c4:	0006c908 	andeq	ip, r6, r8, lsl #18
     4c8:	096d0300 	stmdbeq	sp!, {r8, r9}^
     4cc:	00000081 	andeq	r0, r0, r1, lsl #1
     4d0:	0af00800 	beq	ffc024d8 <_stack+0xffb824d8>
     4d4:	6e030000 	cdpvs	0, 0, cr0, cr3, cr0, {0}
     4d8:	00008109 	andeq	r8, r0, r9, lsl #2
     4dc:	40080400 	andmi	r0, r8, r0, lsl #8
     4e0:	03000007 	movweq	r0, #7
     4e4:	0348166f 	movteq	r1, #34415	; 0x866f
     4e8:	08080000 	stmdaeq	r8, {}	; <UNPREDICTABLE>
     4ec:	000007fc 	strdeq	r0, [r0], -ip
     4f0:	48167003 	ldmdami	r6, {r0, r1, ip, sp, lr}
     4f4:	0c000003 	stceq	0, cr0, [r0], {3}
     4f8:	00080608 	andeq	r0, r8, r8, lsl #12
     4fc:	16710300 	ldrbtne	r0, [r1], -r0, lsl #6
     500:	00000348 	andeq	r0, r0, r8, asr #6
     504:	530d0010 	movwpl	r0, #53264	; 0xd010
     508:	03004d45 	movweq	r4, #3397	; 0xd45
     50c:	036c1874 	cmneq	ip, #116, 16	; 0x740000
     510:	25030000 	strcs	r0, [r3, #-0]
     514:	03000005 	movweq	r0, #5
     518:	036c1875 	cmneq	ip, #7667712	; 0x750000
     51c:	ef030000 	svc	0x00030000
     520:	03000006 	movweq	r0, #6
     524:	04140e76 	ldreq	r0, [r4], #-3702	; 0xfffff18a
     528:	04090000 	streq	r0, [r9], #-0
     52c:	000003f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
     530:	0002fd03 	andeq	pc, r2, r3, lsl #26
     534:	16770300 	ldrbtne	r0, [r7], -r0, lsl #6
     538:	000003a1 	andeq	r0, r0, r1, lsr #7
     53c:	000ba903 	andeq	sl, fp, r3, lsl #18
     540:	10780300 	rsbsne	r0, r8, r0, lsl #6
     544:	00000432 	andeq	r0, r0, r2, lsr r4
     548:	041a0409 	ldreq	r0, [sl], #-1033	; 0xfffffbf7
     54c:	a3060000 	movwge	r0, #24576	; 0x6000
     550:	2c000005 	stccs	0, cr0, [r0], {5}
     554:	bb107d03 	bllt	41f968 <_stack+0x39f968>
     558:	08000004 	stmdaeq	r0, {r2}
     55c:	00000345 	andeq	r0, r0, r5, asr #6
     560:	8d177f03 	ldchi	15, cr7, [r7, #-12]
     564:	00000000 	andeq	r0, r0, r0
     568:	00092508 	andeq	r2, r9, r8, lsl #10
     56c:	17800300 	strne	r0, [r0, r0, lsl #6]
     570:	0000008d 	andeq	r0, r0, sp, lsl #1
     574:	07c00804 	strbeq	r0, [r0, r4, lsl #16]
     578:	81030000 	mrshi	r0, (UNDEF: 3)
     57c:	00008117 	andeq	r8, r0, r7, lsl r1
     580:	c6080800 	strgt	r0, [r8], -r0, lsl #16
     584:	03000008 	movweq	r0, #8
     588:	03f01782 	mvnseq	r1, #34078720	; 0x2080000
     58c:	080c0000 	stmdaeq	ip, {}	; <UNPREDICTABLE>
     590:	000002cd 	andeq	r0, r0, sp, asr #5
     594:	81178303 	tsthi	r7, r3, lsl #6
     598:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
     59c:	000ac308 	andeq	ip, sl, r8, lsl #6
     5a0:	17840300 	strne	r0, [r4, r0, lsl #6]
     5a4:	00000081 	andeq	r0, r0, r1, lsl #1
     5a8:	0513081c 	ldreq	r0, [r3, #-2076]	; 0xfffff7e4
     5ac:	85030000 	strhi	r0, [r3, #-0]
     5b0:	00008117 	andeq	r8, r0, r7, lsl r1
     5b4:	e9082000 	stmdb	r8, {sp}
     5b8:	03000007 	movweq	r0, #7
     5bc:	00811786 	addeq	r1, r1, r6, lsl #15
     5c0:	08240000 	stmdaeq	r4!, {}	; <UNPREDICTABLE>
     5c4:	0000046a 	andeq	r0, r0, sl, ror #8
     5c8:	bb178703 	bllt	5e21dc <_stack+0x5621dc>
     5cc:	28000004 	stmdacs	r0, {r2}
     5d0:	38040900 	stmdacc	r4, {r8, fp}
     5d4:	03000004 	movweq	r0, #4
     5d8:	00000588 	andeq	r0, r0, r8, lsl #11
     5dc:	38038803 	stmdacc	r3, {r0, r1, fp, pc}
     5e0:	03000004 	movweq	r0, #4
     5e4:	000007d6 	ldrdeq	r0, [r0], -r6
     5e8:	d9128903 	ldmdble	r2, {r0, r1, r8, fp, pc}
     5ec:	09000004 	stmdbeq	r0, {r2}
     5f0:	0004c104 	andeq	ip, r4, r4, lsl #2
     5f4:	01070e00 	tsteq	r7, r0, lsl #28
     5f8:	0000004d 	andeq	r0, r0, sp, asr #32
     5fc:	1e0e3c04 	cdpne	12, 0, cr3, cr14, cr4, {0}
     600:	0f000005 	svceq	0x00000005
     604:	000008f5 	strdeq	r0, [r0], -r5
     608:	05bb0f00 	ldreq	r0, [fp, #3840]!	; 0xf00
     60c:	0f010000 	svceq	0x00010000
     610:	00000b67 	andeq	r0, r0, r7, ror #22
     614:	0b5f0f02 	bleq	17c4224 <_stack+0x1744224>
     618:	0f030000 	svceq	0x00030000
     61c:	00000b3f 	andeq	r0, r0, pc, lsr fp
     620:	0b470f04 	bleq	11c4238 <_stack+0x1144238>
     624:	0f050000 	svceq	0x00050000
     628:	00000b4f 	andeq	r0, r0, pc, asr #22
     62c:	0b570f06 	bleq	15c424c <_stack+0x154424c>
     630:	00070000 	andeq	r0, r7, r0
     634:	4d01070e 	stcmi	7, cr0, [r1, #-56]	; 0xffffffc8
     638:	04000000 	streq	r0, [r0], #-0
     63c:	06710e4b 	ldrbteq	r0, [r1], -fp, asr #28
     640:	480f0000 	stmdami	pc, {}	; <UNPREDICTABLE>
     644:	00000007 	andeq	r0, r0, r7
     648:	0007520f 	andeq	r5, r7, pc, lsl #4
     64c:	5c0f0100 	stfpls	f0, [pc], {-0}
     650:	02000007 	andeq	r0, r0, #7
     654:	0007660f 	andeq	r6, r7, pc, lsl #12
     658:	700f0300 	andvc	r0, pc, r0, lsl #6
     65c:	04000007 	streq	r0, [r0], #-7
     660:	00077a0f 	andeq	r7, r7, pc, lsl #20
     664:	840f0500 	strhi	r0, [pc], #-1280	; 66c <_start-0x7994>
     668:	06000007 	streq	r0, [r0], -r7
     66c:	00078e0f 	andeq	r8, r7, pc, lsl #28
     670:	980f0700 	stmdals	pc, {r8, r9, sl}	; <UNPREDICTABLE>
     674:	08000007 	stmdaeq	r0, {r0, r1, r2}
     678:	0003da0f 	andeq	sp, r3, pc, lsl #20
     67c:	1d0f0900 	vstrne.16	s0, [pc, #-0]	; 684 <_start-0x797c>	; <UNPREDICTABLE>
     680:	0a00000c 	beq	6b8 <_start-0x7948>
     684:	000c280f 	andeq	r2, ip, pc, lsl #16
     688:	330f0b00 	movwcc	r0, #64256	; 0xfb00
     68c:	0c00000c 	stceq	0, cr0, [r0], {12}
     690:	000c3e0f 	andeq	r3, ip, pc, lsl #28
     694:	490f0d00 	stmdbmi	pc, {r8, sl, fp}	; <UNPREDICTABLE>
     698:	0e00000c 	cdpeq	0, 0, cr0, cr0, cr12, {0}
     69c:	000c540f 	andeq	r5, ip, pc, lsl #8
     6a0:	5f0f0f00 	svcpl	0x000f0f00
     6a4:	1000000c 	andne	r0, r0, ip
     6a8:	000c6a0f 	andeq	r6, ip, pc, lsl #20
     6ac:	750f1100 	strvc	r1, [pc, #-256]	; 5b4 <_start-0x7a4c>
     6b0:	1200000c 	andne	r0, r0, #12
     6b4:	000c800f 	andeq	r8, ip, pc
     6b8:	150f1300 	strne	r1, [pc, #-768]	; 3c0 <_start-0x7c40>
     6bc:	14000002 	strne	r0, [r0], #-2
     6c0:	0002200f 	andeq	r2, r2, pc
     6c4:	2b0f1500 	blcs	3c5acc <_stack+0x345acc>
     6c8:	16000002 	strne	r0, [r0], -r2
     6cc:	0002360f 	andeq	r3, r2, pc, lsl #12
     6d0:	410f1700 	tstmi	pc, r0, lsl #14
     6d4:	18000002 	stmdane	r0, {r1}
     6d8:	00024c0f 	andeq	r4, r2, pc, lsl #24
     6dc:	570f1900 	strpl	r1, [pc, -r0, lsl #18]
     6e0:	1a000002 	bne	6f0 <_start-0x7910>
     6e4:	0002620f 	andeq	r6, r2, pc, lsl #4
     6e8:	180f1b00 	stmdane	pc, {r8, r9, fp, ip}	; <UNPREDICTABLE>
     6ec:	1c00000b 	stcne	0, cr0, [r0], {11}
     6f0:	0002ab0f 	andeq	sl, r2, pc, lsl #22
     6f4:	4c0f1d00 	stcmi	13, cr1, [pc], {-0}
     6f8:	1e000003 	cdpne	0, 0, cr0, cr0, cr3, {0}
     6fc:	0003570f 	andeq	r5, r3, pc, lsl #14
     700:	620f1f00 	andvs	r1, pc, #0, 30
     704:	20000003 	andcs	r0, r0, r3
     708:	00036d0f 	andeq	r6, r3, pc, lsl #26
     70c:	780f2100 	stmdavc	pc, {r8, sp}	; <UNPREDICTABLE>
     710:	22000003 	andcs	r0, r0, #3
     714:	0003830f 	andeq	r8, r3, pc, lsl #6
     718:	8e0f2300 	cdphi	3, 0, cr2, cr15, cr0, {0}
     71c:	24000003 	strcs	r0, [r0], #-3
     720:	0003990f 	andeq	r9, r3, pc, lsl #18
     724:	a40f2500 	strge	r2, [pc], #-1280	; 72c <_start-0x78d4>
     728:	26000003 	strcs	r0, [r0], -r3
     72c:	0003af0f 	andeq	sl, r3, pc, lsl #30
     730:	fc0f2700 	stc2	7, cr2, [pc], {-0}
     734:	28000003 	stmdacs	r0, {r0, r1}
     738:	0004070f 	andeq	r0, r4, pc, lsl #14
     73c:	120f2900 	andne	r2, pc, #0, 18
     740:	2a000004 	bcs	758 <_start-0x78a8>
     744:	00041d0f 	andeq	r1, r4, pc, lsl #26
     748:	280f2b00 	stmdacs	pc, {r8, r9, fp, sp}	; <UNPREDICTABLE>
     74c:	2c000004 	stccs	0, cr0, [r0], {4}
     750:	0004330f 	andeq	r3, r4, pc, lsl #6
     754:	3e0f2d00 	cdpcc	13, 0, cr2, cr15, cr0, {0}
     758:	2e000004 	cdpcs	0, 0, cr0, cr0, cr4, {0}
     75c:	0004490f 	andeq	r4, r4, pc, lsl #18
     760:	540f2f00 	strpl	r2, [pc], #-3840	; 768 <_start-0x7898>
     764:	30000004 	andcc	r0, r0, r4
     768:	00045f0f 	andeq	r5, r4, pc, lsl #30
     76c:	500f3100 	andpl	r3, pc, r0, lsl #2
     770:	32000005 	andcc	r0, r0, #5
     774:	00052f0f 	andeq	r2, r5, pc, lsl #30
     778:	3a0f3300 	bcc	3cd380 <_stack+0x34d380>
     77c:	34000005 	strcc	r0, [r0], #-5
     780:	0005450f 	andeq	r4, r5, pc, lsl #10
     784:	03003500 	movweq	r3, #1280	; 0x500
     788:	00000a8a 	andeq	r0, r0, sl, lsl #21
     78c:	7d103d05 	ldcvc	13, cr3, [r0, #-20]	; 0xffffffec
     790:	09000006 	stmdbeq	r0, {r1, r2}
     794:	00068304 	andeq	r8, r6, r4, lsl #6
     798:	068e0b00 	streq	r0, [lr], r0, lsl #22
     79c:	8e0c0000 	cdphi	0, 0, cr0, cr12, cr0, {0}
     7a0:	00000006 	andeq	r0, r0, r6
     7a4:	00ac0409 	adceq	r0, ip, r9, lsl #8
     7a8:	11100000 	tstne	r0, r0
     7ac:	0000080f 	andeq	r0, r0, pc, lsl #16
     7b0:	a7082001 	strge	r2, [r8, -r1]
     7b4:	05000006 	streq	r0, [r0, #-6]
     7b8:	00ff3403 	rscseq	r3, pc, r3, lsl #8
     7bc:	94040900 	strls	r0, [r4], #-2304	; 0xfffff700
     7c0:	12000006 	andne	r0, r0, #6
     7c4:	00000846 	andeq	r0, r0, r6, asr #16
     7c8:	71102201 	tstvc	r0, r1, lsl #4
     7cc:	05000006 	streq	r0, [r0, #-6]
     7d0:	00fee403 	rscseq	lr, lr, r3, lsl #8
     7d4:	04f51200 	ldrbteq	r1, [r5], #512	; 0x200
     7d8:	24010000 	strcs	r0, [r1], #-0
     7dc:	00067110 	andeq	r7, r6, r0, lsl r1
     7e0:	e8030500 	stmda	r3, {r8, sl}
     7e4:	120000fe 	andne	r0, r0, #254	; 0xfe
     7e8:	000006d1 	ldrdeq	r0, [r0], -r1
     7ec:	8d152901 	vldrhi.16	s4, [r5, #-2]	; <UNPREDICTABLE>
     7f0:	05000000 	streq	r0, [r0, #-0]
     7f4:	00feec03 	rscseq	lr, lr, r3, lsl #24
     7f8:	09d01200 	ldmibeq	r0, {r9, ip}^
     7fc:	2e010000 	cdpcs	0, 0, cr0, cr1, cr0, {0}
     800:	00008d15 	andeq	r8, r0, r5, lsl sp
     804:	f0030500 			; <UNDEFINED> instruction: 0xf0030500
     808:	110000fe 	strdne	r0, [r0, -lr]
     80c:	00000976 	andeq	r0, r0, r6, ror r9
     810:	5a063001 	bpl	18c81c <_stack+0x10c81c>
     814:	05000003 	streq	r0, [r0, #-3]
     818:	00fef403 	rscseq	pc, lr, r3, lsl #8
     81c:	067b1100 	ldrbteq	r1, [fp], -r0, lsl #2
     820:	31010000 	mrscc	r0, (UNDEF: 1)
     824:	00035a06 	andeq	r5, r3, r6, lsl #20
     828:	f8030500 			; <UNDEFINED> instruction: 0xf8030500
     82c:	110000fe 	strdne	r0, [r0, -lr]
     830:	0000055b 	andeq	r0, r0, fp, asr r5
     834:	5a063201 	bpl	18d040 <_stack+0x10d040>
     838:	05000003 	streq	r0, [r0, #-3]
     83c:	00fefc03 	rscseq	pc, lr, r3, lsl #24
     840:	0ae31100 	beq	ff8c4c48 <_stack+0xff844c48>
     844:	33010000 	movwcc	r0, #4096	; 0x1000
     848:	00035a06 	andeq	r5, r3, r6, lsl #20
     84c:	00030500 	andeq	r0, r3, r0, lsl #10
     850:	130000ff 	movwne	r0, #255	; 0xff
     854:	0000035a 	andeq	r0, r0, sl, asr r3
     858:	0000074d 	andeq	r0, r0, sp, asr #14
     85c:	00008d14 	andeq	r8, r0, r4, lsl sp
     860:	1500fe00 	strne	pc, [r0, #-3584]	; 0xfffff200
     864:	0054524c 	subseq	r5, r4, ip, asr #4
     868:	3d063c01 	stccc	12, cr3, [r6, #-4]
     86c:	05000007 	streq	r0, [r0, #-7]
     870:	00ff3803 	rscseq	r3, pc, r3, lsl #16
     874:	0bd81100 	bleq	ff604c7c <_stack+0xff584c7c>
     878:	3e010000 	cdpcc	0, 0, cr0, cr1, cr0, {0}
     87c:	0004cd0c 	andeq	ip, r4, ip, lsl #26
     880:	38030500 	stmdacc	r3, {r8, sl}
     884:	12000103 	andne	r0, r0, #-1073741824	; 0xc0000000
     888:	00000590 	muleq	r0, r0, r5
     88c:	8d114001 	ldchi	0, cr4, [r1, #-4]
     890:	05000000 	streq	r0, [r0, #-0]
     894:	00ff0403 	rscseq	r0, pc, r3, lsl #8
     898:	07e11200 	strbeq	r1, [r1, r0, lsl #4]!
     89c:	48010000 	stmdami	r1, {}	; <UNPREDICTABLE>
     8a0:	00008d11 	andeq	r8, r0, r1, lsl sp
     8a4:	b8030500 	stmdalt	r3, {r8, sl}
     8a8:	120000fe 	andne	r0, r0, #254	; 0xfe
     8ac:	000007b6 			; <UNDEFINED> instruction: 0x000007b6
     8b0:	8d114f01 	ldchi	15, cr4, [r1, #-4]
     8b4:	05000000 	streq	r0, [r0, #-0]
     8b8:	00ff0803 	rscseq	r0, pc, r3, lsl #16
     8bc:	0ad51100 	beq	ff544cc4 <_stack+0xff4c4cc4>
     8c0:	51010000 	mrspl	r0, (UNDEF: 1)
     8c4:	0000730f 	andeq	r7, r0, pc, lsl #6
     8c8:	3c030500 	cfstr32cc	mvfx0, [r3], {-0}
     8cc:	11000103 	tstne	r0, r3, lsl #2
     8d0:	00000485 	andeq	r0, r0, r5, lsl #9
     8d4:	8d0e5201 	sfmhi	f5, 4, [lr, #-4]
     8d8:	05000000 	streq	r0, [r0, #-0]
     8dc:	01034003 	tsteq	r3, r3
     8e0:	0b771100 	bleq	1dc4ce8 <_stack+0x1d44ce8>
     8e4:	5a010000 	bpl	408ec <__bss_end__+0x305a0>
     8e8:	00008105 	andeq	r8, r0, r5, lsl #2
     8ec:	30030500 	andcc	r0, r3, r0, lsl #10
     8f0:	110000ff 	strdne	r0, [r0, -pc]
     8f4:	000003c2 	andeq	r0, r0, r2, asr #7
     8f8:	81055c01 	tsthi	r5, r1, lsl #24
     8fc:	05000000 	streq	r0, [r0, #-0]
     900:	01034403 	tsteq	r3, r3, lsl #8
     904:	0bb01100 	bleq	fec04d0c <_stack+0xfeb84d0c>
     908:	5d010000 	stcpl	0, cr0, [r1, #-0]
     90c:	00008105 	andeq	r8, r0, r5, lsl #2
     910:	48030500 	stmdami	r3, {r8, sl}
     914:	11000103 	tstne	r0, r3, lsl #2
     918:	0000066b 	andeq	r0, r0, fp, ror #12
     91c:	880e5e01 	stmdahi	lr, {r0, r9, sl, fp, ip, lr}
     920:	05000000 	streq	r0, [r0, #-0]
     924:	00ff2c03 	rscseq	r2, pc, r3, lsl #24
     928:	09831200 	stmibeq	r3, {r9, ip}
     92c:	5f010000 	svcpl	0x00010000
     930:	0000810c 	andeq	r8, r0, ip, lsl #2
     934:	0c030500 	cfstr32eq	mvfx0, [r3], {-0}
     938:	120000ff 	andne	r0, r0, #255	; 0xff
     93c:	00000965 	andeq	r0, r0, r5, ror #18
     940:	810c6001 	tsthi	ip, r1
     944:	05000000 	streq	r0, [r0, #-0]
     948:	00ff1003 	rscseq	r1, pc, r3
     94c:	094a1200 	stmdbeq	sl, {r9, ip}^
     950:	61010000 	mrsvs	r0, (UNDEF: 1)
     954:	00008d15 	andeq	r8, r0, r5, lsl sp
     958:	14030500 	strne	r0, [r3], #-1280	; 0xfffffb00
     95c:	120000ff 	andne	r0, r0, #255	; 0xff
     960:	00000a07 	andeq	r0, r0, r7, lsl #20
     964:	810c6201 	tsthi	ip, r1, lsl #4
     968:	05000000 	streq	r0, [r0, #-0]
     96c:	00ff1803 	rscseq	r1, pc, r3, lsl #16
     970:	01cd1100 	biceq	r1, sp, r0, lsl #2
     974:	64010000 	strvs	r0, [r1], #-0
     978:	0000880e 	andeq	r8, r0, lr, lsl #16
     97c:	34030500 	strcc	r0, [r3], #-1280	; 0xfffffb00
     980:	11000103 	tstne	r0, r3, lsl #2
     984:	00000731 	andeq	r0, r0, r1, lsr r7
     988:	880e6601 	stmdahi	lr, {r0, r9, sl, sp, lr}
     98c:	05000000 	streq	r0, [r0, #-0]
     990:	00ff2803 	rscseq	r2, pc, r3, lsl #16
     994:	72621600 	rsbvc	r1, r2, #0, 12
     998:	2e010032 	mcrcs	0, 0, r0, cr1, cr2, {1}
     99c:	00810c05 	addeq	r0, r1, r5, lsl #24
     9a0:	03050000 	movweq	r0, #20480	; 0x5000
     9a4:	0000ff1c 	andeq	pc, r0, ip, lsl pc	; <UNPREDICTABLE>
     9a8:	00726216 	rsbseq	r6, r2, r6, lsl r2
     9ac:	0c052f01 	stceq	15, cr2, [r5], {1}
     9b0:	00000081 	andeq	r0, r0, r1, lsl #1
     9b4:	ff200305 			; <UNDEFINED> instruction: 0xff200305
     9b8:	63160000 	tstvs	r6, #0
     9bc:	05300100 	ldreq	r0, [r0, #-256]!	; 0xffffff00
     9c0:	0000810c 	andeq	r8, r0, ip, lsl #2
     9c4:	24030500 	strcs	r0, [r3], #-1280	; 0xfffffb00
     9c8:	170000ff 			; <UNDEFINED> instruction: 0x170000ff
     9cc:	000001e6 	andeq	r0, r0, r6, ror #3
     9d0:	098e0118 	stmibeq	lr, {r3, r4, r8}
     9d4:	00090a10 	andeq	r0, r9, r0, lsl sl
     9d8:	08921800 	ldmeq	r2, {fp, ip}
     9dc:	90010000 	andls	r0, r1, r0
     9e0:	090a0809 	stmdbeq	sl, {r0, r3, fp}
     9e4:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
     9e8:	000007fc 	strdeq	r0, [r0], -ip
     9ec:	17099101 	strne	r9, [r9, -r1, lsl #2]
     9f0:	00000348 	andeq	r0, r0, r8, asr #6
     9f4:	08061808 	stmdaeq	r6, {r3, fp, ip}
     9f8:	92010000 	andls	r0, r1, #0
     9fc:	03481709 	movteq	r1, #34569	; 0x8709
     a00:	180c0000 	stmdane	ip, {}	; <UNPREDICTABLE>
     a04:	00000a29 	andeq	r0, r0, r9, lsr #20
     a08:	11099301 	tstne	r9, r1, lsl #6
     a0c:	0000004d 	andeq	r0, r0, sp, asr #32
     a10:	0a0e1810 	beq	386a58 <_stack+0x306a58>
     a14:	94010000 	strls	r0, [r1], #-0
     a18:	008d1009 	addeq	r1, sp, r9
     a1c:	00140000 	andseq	r0, r4, r0
     a20:	00021713 	andeq	r1, r2, r3, lsl r7
     a24:	00091a00 	andeq	r1, r9, r0, lsl #20
     a28:	008d1400 	addeq	r1, sp, r0, lsl #8
     a2c:	00070000 	andeq	r0, r7, r0
     a30:	0008ad19 	andeq	sl, r8, r9, lsl sp
     a34:	09950100 	ldmibeq	r5, {r8}
     a38:	0008b503 	andeq	fp, r8, r3, lsl #10
     a3c:	0a671a00 	beq	19c7244 <_stack+0x1947244>
     a40:	ce010000 	cdpgt	0, 0, cr0, cr1, cr0, {0}
     a44:	ec14060a 	ldc	6, cr0, [r4], {10}
     a48:	00e80000 	rsceq	r0, r8, r0
     a4c:	9c010000 	stcls	0, cr0, [r1], {-0}
     a50:	0000096d 	andeq	r0, r0, sp, ror #18
     a54:	0030721b 	eorseq	r7, r0, fp, lsl r2
     a58:	1c0ace01 	stcne	14, cr12, [sl], {1}
     a5c:	00000067 	andeq	r0, r0, r7, rrx
     a60:	1b749102 	blne	1d24e70 <_stack+0x1ca4e70>
     a64:	01003172 	tsteq	r0, r2, ror r1
     a68:	67290ace 	strvs	r0, [r9, -lr, asr #21]!
     a6c:	02000000 	andeq	r0, r0, #0
     a70:	bc1c7091 	ldclt	0, cr7, [ip], {145}	; 0x91
     a74:	01000006 	tsteq	r0, r6
     a78:	67360ace 	ldrvs	r0, [r6, -lr, asr #21]!
     a7c:	02000000 	andeq	r0, r0, #0
     a80:	1d006c91 	stcne	12, cr6, [r0, #-580]	; 0xfffffdbc
     a84:	00000475 	andeq	r0, r0, r5, ror r4
     a88:	0d0ab701 	stceq	7, cr11, [sl, #-4]
     a8c:	0000ebe8 	andeq	lr, r0, r8, ror #23
     a90:	0000002c 	andeq	r0, r0, ip, lsr #32
     a94:	09959c01 	ldmibeq	r5, {r0, sl, fp, ip, pc}
     a98:	751c0000 	ldrvc	r0, [ip, #-0]
     a9c:	01000005 	tsteq	r0, r5
     aa0:	1e1b0ab7 			; <UNDEFINED> instruction: 0x1e1b0ab7
     aa4:	02000002 	andeq	r0, r0, #2
     aa8:	1e007491 	mcrne	4, 0, r7, cr0, cr1, {4}
     aac:	0000060e 	andeq	r0, r0, lr, lsl #12
     ab0:	050a5401 	streq	r5, [sl, #-1025]	; 0xfffffbff
     ab4:	00000081 	andeq	r0, r0, r1, lsl #1
     ab8:	0000e938 	andeq	lr, r0, r8, lsr r9
     abc:	000002b0 			; <UNDEFINED> instruction: 0x000002b0
     ac0:	0a019c01 	beq	67acc <__bss_end__+0x57780>
     ac4:	8d1c0000 	ldchi	0, cr0, [ip, #-0]
     ac8:	01000009 	tsteq	r0, r9
     acc:	1e190a54 			; <UNDEFINED> instruction: 0x1e190a54
     ad0:	02000002 	andeq	r0, r0, #2
     ad4:	1b1f6491 	blne	7d9d20 <_stack+0x759d20>
     ad8:	01000006 	tsteq	r0, r6
     adc:	81070a56 	tsthi	r7, r6, asr sl
     ae0:	02000000 	andeq	r0, r0, #0
     ae4:	72166c91 	andsvc	r6, r6, #37120	; 0x9100
     ae8:	01007465 	tsteq	r0, r5, ror #8
     aec:	810e0a56 	tsthi	lr, r6, asr sl
     af0:	02000000 	andeq	r0, r0, #0
     af4:	e61f7491 			; <UNDEFINED> instruction: 0xe61f7491
     af8:	01000005 	tsteq	r0, r5
     afc:	01110a57 	tsteq	r1, r7, asr sl
     b00:	0200000a 	andeq	r0, r0, #10
     b04:	1d1f7091 	ldcne	0, cr7, [pc, #-580]	; 8c8 <_start-0x7738>
     b08:	01000003 	tsteq	r0, r3
     b0c:	5a080a58 	bpl	203474 <_stack+0x183474>
     b10:	02000003 	andeq	r0, r0, #3
     b14:	09006891 	stmdbeq	r0, {r0, r4, r7, fp, sp, lr}
     b18:	00091a04 	andeq	r1, r9, r4, lsl #20
     b1c:	04af1e00 	strteq	r1, [pc], #3584	; b24 <_start-0x74dc>
     b20:	15010000 	strne	r0, [r1, #-0]
     b24:	0081050a 	addeq	r0, r1, sl, lsl #10
     b28:	e7080000 	str	r0, [r8, -r0]
     b2c:	02300000 	eorseq	r0, r0, #0
     b30:	9c010000 	stcls	0, cr0, [r1], {-0}
     b34:	00000a83 	andeq	r0, r0, r3, lsl #21
     b38:	00098d1c 	andeq	r8, r9, ip, lsl sp
     b3c:	0a150100 	beq	540f44 <_stack+0x4c0f44>
     b40:	00021e19 	andeq	r1, r2, r9, lsl lr
     b44:	64910200 	ldrvs	r0, [r1], #512	; 0x200
     b48:	0009ac1c 	andeq	sl, r9, ip, lsl ip
     b4c:	0a150100 	beq	540f54 <_stack+0x4c0f54>
     b50:	00008128 	andeq	r8, r0, r8, lsr #2
     b54:	60910200 	addsvs	r0, r1, r0, lsl #4
     b58:	00061b1f 	andeq	r1, r6, pc, lsl fp
     b5c:	0a170100 	beq	5c0f64 <_stack+0x540f64>
     b60:	00008107 	andeq	r8, r0, r7, lsl #2
     b64:	6c910200 	lfmvs	f0, 4, [r1], {0}
     b68:	74657216 	strbtvc	r7, [r5], #-534	; 0xfffffdea
     b6c:	0a170100 	beq	5c0f74 <_stack+0x540f74>
     b70:	0000810e 	andeq	r8, r0, lr, lsl #2
     b74:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     b78:	0005e61f 	andeq	lr, r5, pc, lsl r6
     b7c:	0a180100 	beq	600f84 <_stack+0x580f84>
     b80:	000a0111 	andeq	r0, sl, r1, lsl r1
     b84:	70910200 	addsvc	r0, r1, r0, lsl #4
     b88:	00031d1f 	andeq	r1, r3, pc, lsl sp
     b8c:	0a190100 	beq	640f94 <_stack+0x5c0f94>
     b90:	00035a08 	andeq	r5, r3, r8, lsl #20
     b94:	68910200 	ldmvs	r1, {r9}
     b98:	01d91e00 	bicseq	r1, r9, r0, lsl #28
     b9c:	ca010000 	bgt	40ba4 <__bss_end__+0x30858>
     ba0:	00810509 	addeq	r0, r1, r9, lsl #10
     ba4:	e4540000 	ldrb	r0, [r4], #-0
     ba8:	02b40000 	adcseq	r0, r4, #0
     bac:	9c010000 	stcls	0, cr0, [r1], {-0}
     bb0:	00000aff 	strdeq	r0, [r0], -pc	; <UNPREDICTABLE>
     bb4:	00098d1c 	andeq	r8, r9, ip, lsl sp
     bb8:	09ca0100 	stmibeq	sl, {r8}^
     bbc:	00021e19 	andeq	r1, r2, r9, lsl lr
     bc0:	64910200 	ldrvs	r0, [r1], #512	; 0x200
     bc4:	0009ac1c 	andeq	sl, r9, ip, lsl ip
     bc8:	09ca0100 	stmibeq	sl, {r8}^
     bcc:	00008128 	andeq	r8, r0, r8, lsr #2
     bd0:	60910200 	addsvs	r0, r1, r0, lsl #4
     bd4:	00061b1f 	andeq	r1, r6, pc, lsl fp
     bd8:	09cc0100 	stmibeq	ip, {r8}^
     bdc:	00008107 	andeq	r8, r0, r7, lsl #2
     be0:	6c910200 	lfmvs	f0, 4, [r1], {0}
     be4:	74657216 	strbtvc	r7, [r5], #-534	; 0xfffffdea
     be8:	09cc0100 	stmibeq	ip, {r8}^
     bec:	0000810e 	andeq	r8, r0, lr, lsl #2
     bf0:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     bf4:	0005e61f 	andeq	lr, r5, pc, lsl r6
     bf8:	09cd0100 	stmibeq	sp, {r8}^
     bfc:	000a0111 	andeq	r0, sl, r1, lsl r1
     c00:	70910200 	addsvc	r0, r1, r0, lsl #4
     c04:	00031d1f 	andeq	r1, r3, pc, lsl sp
     c08:	09ce0100 	stmibeq	lr, {r8}^
     c0c:	00035a08 	andeq	r5, r3, r8, lsl #20
     c10:	68910200 	ldmvs	r1, {r9}
     c14:	0b341e00 	bleq	d0841c <_stack+0xc8841c>
     c18:	b0010000 	andlt	r0, r1, r0
     c1c:	00810509 	addeq	r0, r1, r9, lsl #10
     c20:	e3900000 	orrs	r0, r0, #0
     c24:	00c40000 	sbceq	r0, r4, r0
     c28:	9c010000 	stcls	0, cr0, [r1], {-0}
     c2c:	00000b5b 	andeq	r0, r0, fp, asr fp
     c30:	00098d1c 	andeq	r8, r9, ip, lsl sp
     c34:	09b00100 	ldmibeq	r0!, {r8}
     c38:	00021e17 	andeq	r1, r2, r7, lsl lr
     c3c:	64910200 	ldrvs	r0, [r1], #512	; 0x200
     c40:	00061b1f 	andeq	r1, r6, pc, lsl fp
     c44:	09b20100 	ldmibeq	r2!, {r8}
     c48:	00008107 	andeq	r8, r0, r7, lsl #2
     c4c:	6c910200 	lfmvs	f0, 4, [r1], {0}
     c50:	74657216 	strbtvc	r7, [r5], #-534	; 0xfffffdea
     c54:	09b20100 	ldmibeq	r2!, {r8}
     c58:	0000810e 	andeq	r8, r0, lr, lsl #2
     c5c:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     c60:	0005e61f 	andeq	lr, r5, pc, lsl r6
     c64:	09b30100 	ldmibeq	r3!, {r8}
     c68:	000a0111 	andeq	r0, sl, r1, lsl r1
     c6c:	70910200 	addsvc	r0, r1, r0, lsl #4
     c70:	08ba1e00 	ldmeq	sl!, {r9, sl, fp, ip}
     c74:	9f010000 	svcls	0x00010000
     c78:	021e0709 	andseq	r0, lr, #2359296	; 0x240000
     c7c:	e2d80000 	sbcs	r0, r8, #0
     c80:	00b80000 	adcseq	r0, r8, r0
     c84:	9c010000 	stcls	0, cr0, [r1], {-0}
     c88:	00000bb7 			; <UNDEFINED> instruction: 0x00000bb7
     c8c:	0014c41c 	andseq	ip, r4, ip, lsl r4
     c90:	099f0100 	ldmibeq	pc, {r8}	; <UNPREDICTABLE>
     c94:	00008d21 	andeq	r8, r0, r1, lsr #26
     c98:	6c910200 	lfmvs	f0, 4, [r1], {0}
     c9c:	000ad01c 	andeq	sp, sl, ip, lsl r0
     ca0:	099f0100 	ldmibeq	pc, {r8}	; <UNPREDICTABLE>
     ca4:	0000812b 	andeq	r8, r0, fp, lsr #2
     ca8:	68910200 	ldmvs	r1, {r9}
     cac:	00098d1f 	andeq	r8, r9, pc, lsl sp
     cb0:	09a10100 	stmibeq	r1!, {r8}
     cb4:	00021e09 	andeq	r1, r2, r9, lsl #28
     cb8:	70910200 	addsvc	r0, r1, r0, lsl #4
     cbc:	0005e61f 	andeq	lr, r5, pc, lsl r6
     cc0:	09a20100 	stmibeq	r2!, {r8}
     cc4:	000a0111 	andeq	r0, sl, r1, lsl r1
     cc8:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     ccc:	068e1e00 	streq	r1, [lr], r0, lsl #28
     cd0:	5a010000 	bpl	40cd8 <__bss_end__+0x3098c>
     cd4:	00810509 	addeq	r0, r1, r9, lsl #10
     cd8:	e0ac0000 	adc	r0, ip, r0
     cdc:	022c0000 	eoreq	r0, ip, #0
     ce0:	9c010000 	stcls	0, cr0, [r1], {-0}
     ce4:	00000c13 	andeq	r0, r0, r3, lsl ip
     ce8:	000c091c 	andeq	r0, ip, ip, lsl r9
     cec:	095a0100 	ldmdbeq	sl, {r8}^
     cf0:	0004cd1e 	andeq	ip, r4, lr, lsl sp
     cf4:	6c910200 	lfmvs	f0, 4, [r1], {0}
     cf8:	0002e11c 	andeq	lr, r2, ip, lsl r1
     cfc:	095a0100 	ldmdbeq	sl, {r8}^
     d00:	0000812c 	andeq	r8, r0, ip, lsr #2
     d04:	68910200 	ldmvs	r1, {r9}
     d08:	646e6816 	strbtvs	r6, [lr], #-2070	; 0xfffff7ea
     d0c:	095c0100 	ldmdbeq	ip, {r8}^
     d10:	00008108 	andeq	r8, r0, r8, lsl #2
     d14:	70910200 	addsvc	r0, r1, r0, lsl #4
     d18:	74657216 	strbtvc	r7, [r5], #-534	; 0xfffffdea
     d1c:	095c0100 	ldmdbeq	ip, {r8}^
     d20:	0000810d 	andeq	r8, r0, sp, lsl #2
     d24:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     d28:	02e11e00 	rsceq	r1, r1, #0, 28
     d2c:	2d010000 	stccs	0, cr0, [r1, #-0]
     d30:	00810509 	addeq	r0, r1, r9, lsl #10
     d34:	df480000 	svcle	0x00480000
     d38:	01640000 	cmneq	r4, r0
     d3c:	9c010000 	stcls	0, cr0, [r1], {-0}
     d40:	00000c7f 	andeq	r0, r0, pc, ror ip
     d44:	000c091c 	andeq	r0, ip, ip, lsl r9
     d48:	092d0100 	stmfdeq	sp!, {r8}
     d4c:	0004cd1f 	andeq	ip, r4, pc, lsl sp
     d50:	64910200 	ldrvs	r0, [r1], #512	; 0x200
     d54:	00061b1f 	andeq	r1, r6, pc, lsl fp
     d58:	092f0100 	stmdbeq	pc!, {r8}	; <UNPREDICTABLE>
     d5c:	00008109 	andeq	r8, r0, r9, lsl #2
     d60:	70910200 	addsvc	r0, r1, r0, lsl #4
     d64:	6d6f7016 	stclvs	0, cr7, [pc, #-88]!	; d14 <_start-0x72ec>
     d68:	092f0100 	stmdbeq	pc!, {r8}	; <UNPREDICTABLE>
     d6c:	00008110 	andeq	r8, r0, r0, lsl r1
     d70:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     d74:	00031d1f 	andeq	r1, r3, pc, lsl sp
     d78:	09300100 	ldmdbeq	r0!, {r8}
     d7c:	00035a0b 	andeq	r5, r3, fp, lsl #20
     d80:	68910200 	ldmvs	r1, {r9}
     d84:	6d657316 	stclvs	3, cr7, [r5, #-88]!	; 0xffffffa8
     d88:	09310100 	ldmdbeq	r1!, {r8}
     d8c:	0004080b 	andeq	r0, r4, fp, lsl #16
     d90:	6c910200 	lfmvs	f0, 4, [r1], {0}
     d94:	0c121e00 	ldceq	14, cr1, [r2], {-0}
     d98:	f8010000 			; <UNDEFINED> instruction: 0xf8010000
     d9c:	00810508 	addeq	r0, r1, r8, lsl #10
     da0:	dcdc0000 	ldclle	0, cr0, [ip], {0}
     da4:	026c0000 	rsbeq	r0, ip, #0
     da8:	9c010000 	stcls	0, cr0, [r1], {-0}
     dac:	00000cdb 	ldrdeq	r0, [r0], -fp
     db0:	000c091c 	andeq	r0, ip, ip, lsl r9
     db4:	08f80100 	ldmeq	r8!, {r8}^
     db8:	0004cd1c 	andeq	ip, r4, ip, lsl sp
     dbc:	64910200 	ldrvs	r0, [r1], #512	; 0x200
     dc0:	74657216 	strbtvc	r7, [r5], #-534	; 0xfffffdea
     dc4:	08fa0100 	ldmeq	sl!, {r8}^
     dc8:	00008108 	andeq	r8, r0, r8, lsl #2
     dcc:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     dd0:	0006f61f 	andeq	pc, r6, pc, lsl r6	; <UNPREDICTABLE>
     dd4:	08fb0100 	ldmeq	fp!, {r8}^
     dd8:	0004cd0f 	andeq	ip, r4, pc, lsl #26
     ddc:	70910200 	addsvc	r0, r1, r0, lsl #4
     de0:	0005f11f 	andeq	pc, r5, pc, lsl r1	; <UNPREDICTABLE>
     de4:	08fb0100 	ldmeq	fp!, {r8}^
     de8:	0004cd1a 	andeq	ip, r4, sl, lsl sp
     dec:	6c910200 	lfmvs	f0, 4, [r1], {0}
     df0:	04bc1e00 	ldrteq	r1, [ip], #3584	; 0xe00
     df4:	d0010000 	andle	r0, r1, r0
     df8:	00810508 	addeq	r0, r1, r8, lsl #10
     dfc:	dad00000 	ble	ff400e04 <_stack+0xff380e04>
     e00:	020c0000 	andeq	r0, ip, #0
     e04:	9c010000 	stcls	0, cr0, [r1], {-0}
     e08:	00000d37 	andeq	r0, r0, r7, lsr sp
     e0c:	000c091c 	andeq	r0, ip, ip, lsl r9
     e10:	08d00100 	ldmeq	r0, {r8}^
     e14:	0004cd1c 	andeq	ip, r4, ip, lsl sp
     e18:	64910200 	ldrvs	r0, [r1], #512	; 0x200
     e1c:	74657216 	strbtvc	r7, [r5], #-534	; 0xfffffdea
     e20:	08d20100 	ldmeq	r2, {r8}^
     e24:	00008108 	andeq	r8, r0, r8, lsl #2
     e28:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     e2c:	0006f61f 	andeq	pc, r6, pc, lsl r6	; <UNPREDICTABLE>
     e30:	08d30100 	ldmeq	r3, {r8}^
     e34:	0004cd0f 	andeq	ip, r4, pc, lsl #26
     e38:	70910200 	addsvc	r0, r1, r0, lsl #4
     e3c:	0005f11f 	andeq	pc, r5, pc, lsl r1	; <UNPREDICTABLE>
     e40:	08d30100 	ldmeq	r3, {r8}^
     e44:	0004cd1a 	andeq	ip, r4, sl, lsl sp
     e48:	6c910200 	lfmvs	f0, 4, [r1], {0}
     e4c:	0af92000 	beq	ffe48e54 <_stack+0xffdc8e54>
     e50:	9d010000 	stcls	0, cr0, [r1, #-0]
     e54:	00810508 	addeq	r0, r1, r8, lsl #10
     e58:	d8fc0000 	ldmle	ip!, {}^	; <UNPREDICTABLE>
     e5c:	01d40000 	bicseq	r0, r4, r0
     e60:	9c010000 	stcls	0, cr0, [r1], {-0}
     e64:	00000da3 	andeq	r0, r0, r3, lsr #27
     e68:	000c091c 	andeq	r0, ip, ip, lsl r9
     e6c:	089d0100 	ldmeq	sp, {r8}
     e70:	0004cd1d 	andeq	ip, r4, sp, lsl sp
     e74:	64910200 	ldrvs	r0, [r1], #512	; 0x200
     e78:	74657216 	strbtvc	r7, [r5], #-534	; 0xfffffdea
     e7c:	089f0100 	ldmeq	pc, {r8}	; <UNPREDICTABLE>
     e80:	00008108 	andeq	r8, r0, r8, lsl #2
     e84:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     e88:	0003c71f 	andeq	ip, r3, pc, lsl r7
     e8c:	08a00100 	stmiaeq	r0!, {r8}
     e90:	00008d0d 	andeq	r8, r0, sp, lsl #26
     e94:	70910200 	addsvc	r0, r1, r0, lsl #4
     e98:	0006f61f 	andeq	pc, r6, pc, lsl r6	; <UNPREDICTABLE>
     e9c:	08a10100 	stmiaeq	r1!, {r8}
     ea0:	0004cd0f 	andeq	ip, r4, pc, lsl #26
     ea4:	6c910200 	lfmvs	f0, 4, [r1], {0}
     ea8:	0005f11f 	andeq	pc, r5, pc, lsl r1	; <UNPREDICTABLE>
     eac:	08a10100 	stmiaeq	r1!, {r8}
     eb0:	0004cd1a 	andeq	ip, r4, sl, lsl sp
     eb4:	68910200 	ldmvs	r1, {r9}
     eb8:	0be61e00 	bleq	ff9886c0 <_stack+0xff9086c0>
     ebc:	75010000 	strvc	r0, [r1, #-0]
     ec0:	04cd0c08 	strbeq	r0, [sp], #3080	; 0xc08
     ec4:	d66c0000 	strbtle	r0, [ip], -r0
     ec8:	02900000 	addseq	r0, r0, #0
     ecc:	9c010000 	stcls	0, cr0, [r1], {-0}
     ed0:	00000e2f 	andeq	r0, r0, pc, lsr #28
     ed4:	0003c71c 	andeq	ip, r3, ip, lsl r7
     ed8:	08750100 	ldmdaeq	r5!, {r8}^
     edc:	00008d23 	andeq	r8, r0, r3, lsr #26
     ee0:	6c910200 	lfmvs	f0, 4, [r1], {0}
     ee4:	6e75661b 	mrcvs	6, 3, r6, cr5, cr11, {0}
     ee8:	08750100 	ldmdaeq	r5!, {r8}^
     eec:	00034230 	andeq	r4, r3, r0, lsr r2
     ef0:	68910200 	ldmvs	r1, {r9}
     ef4:	0008851c 	andeq	r8, r8, ip, lsl r5
     ef8:	08750100 	ldmdaeq	r5!, {r8}^
     efc:	00021e43 	andeq	r1, r2, r3, asr #28
     f00:	64910200 	ldrvs	r0, [r1], #512	; 0x200
     f04:	0006851c 	andeq	r8, r6, ip, lsl r5
     f08:	08750100 	ldmdaeq	r5!, {r8}^
     f0c:	0000814e 	andeq	r8, r0, lr, asr #2
     f10:	60910200 	addsvs	r0, r1, r0, lsl #4
     f14:	0007f31c 	andeq	pc, r7, ip, lsl r3	; <UNPREDICTABLE>
     f18:	08750100 	ldmdaeq	r5!, {r8}^
     f1c:	0000815c 	andeq	r8, r0, ip, asr r1
     f20:	00910200 	addseq	r0, r1, r0, lsl #4
     f24:	0002d31c 	andeq	sp, r2, ip, lsl r3
     f28:	08750100 	ldmdaeq	r5!, {r8}^
     f2c:	0000816a 	andeq	r8, r0, sl, ror #2
     f30:	04910200 	ldreq	r0, [r1], #512	; 0x200
     f34:	000c091f 	andeq	r0, ip, pc, lsl r9
     f38:	08770100 	ldmdaeq	r7!, {r8}^
     f3c:	0004cd10 	andeq	ip, r4, r0, lsl sp
     f40:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     f44:	03e41e00 	mvneq	r1, #0, 28
     f48:	45010000 	strmi	r0, [r1, #-0]
     f4c:	00810508 	addeq	r0, r1, r8, lsl #10
     f50:	d4b80000 	ldrtle	r0, [r8], #0
     f54:	01b40000 			; <UNDEFINED> instruction: 0x01b40000
     f58:	9c010000 	stcls	0, cr0, [r1], {-0}
     f5c:	00000e8b 	andeq	r0, r0, fp, lsl #29
     f60:	78746d1b 	ldmdavc	r4!, {r0, r1, r3, r4, r8, sl, fp, sp, lr}^
     f64:	08450100 	stmdaeq	r5, {r8}^
     f68:	00042614 	andeq	r2, r4, r4, lsl r6
     f6c:	64910200 	ldrvs	r0, [r1], #512	; 0x200
     f70:	00061b1f 	andeq	r1, r6, pc, lsl fp
     f74:	08470100 	stmdaeq	r7, {r8}^
     f78:	00008108 	andeq	r8, r0, r8, lsl #2
     f7c:	70910200 	addsvc	r0, r1, r0, lsl #4
     f80:	6d6f7016 	stclvs	0, cr7, [pc, #-88]!	; f30 <_start-0x70d0>
     f84:	08470100 	stmdaeq	r7, {r8}^
     f88:	0000810f 	andeq	r8, r0, pc, lsl #2
     f8c:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     f90:	00031d1f 	andeq	r1, r3, pc, lsl sp
     f94:	08480100 	stmdaeq	r8, {r8}^
     f98:	00035a09 	andeq	r5, r3, r9, lsl #20
     f9c:	6c910200 	lfmvs	f0, 4, [r1], {0}
     fa0:	06e81e00 	strbteq	r1, [r8], r0, lsl #28
     fa4:	1b010000 	blne	40fac <__bss_end__+0x30c60>
     fa8:	00810508 	addeq	r0, r1, r8, lsl #10
     fac:	d33c0000 	teqle	ip, #0
     fb0:	017c0000 	cmneq	ip, r0
     fb4:	9c010000 	stcls	0, cr0, [r1], {-0}
     fb8:	00000ee7 	andeq	r0, r0, r7, ror #29
     fbc:	78746d1b 	ldmdavc	r4!, {r0, r1, r3, r4, r8, sl, fp, sp, lr}^
     fc0:	081b0100 	ldmdaeq	fp, {r8}
     fc4:	00042614 	andeq	r2, r4, r4, lsl r6
     fc8:	64910200 	ldrvs	r0, [r1], #512	; 0x200
     fcc:	00061b1f 	andeq	r1, r6, pc, lsl fp
     fd0:	081d0100 	ldmdaeq	sp, {r8}
     fd4:	00008109 	andeq	r8, r0, r9, lsl #2
     fd8:	70910200 	addsvc	r0, r1, r0, lsl #4
     fdc:	6d6f7016 	stclvs	0, cr7, [pc, #-88]!	; f8c <_start-0x7074>
     fe0:	081d0100 	ldmdaeq	sp, {r8}
     fe4:	00008110 	andeq	r8, r0, r0, lsl r1
     fe8:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     fec:	00031d1f 	andeq	r1, r3, pc, lsl sp
     ff0:	081e0100 	ldmdaeq	lr, {r8}
     ff4:	00035a0b 	andeq	r5, r3, fp, lsl #20
     ff8:	6c910200 	lfmvs	f0, 4, [r1], {0}
     ffc:	081f2100 	ldmdaeq	pc, {r8, sp}	; <UNPREDICTABLE>
    1000:	14010000 	strne	r0, [r1], #-0
    1004:	d2d80608 	sbcsle	r0, r8, #8, 12	; 0x800000
    1008:	00640000 	rsbeq	r0, r4, r0
    100c:	9c010000 	stcls	0, cr0, [r1], {-0}
    1010:	00000f0f 	andeq	r0, r0, pc, lsl #30
    1014:	78746d1b 	ldmdavc	r4!, {r0, r1, r3, r4, r8, sl, fp, sp, lr}^
    1018:	08140100 	ldmdaeq	r4, {r8}
    101c:	00042614 	andeq	r2, r4, r4, lsl r6
    1020:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    1024:	06521e00 	ldrbeq	r1, [r2], -r0, lsl #28
    1028:	fb010000 	blx	41032 <__bss_end__+0x30ce6>
    102c:	00810507 	addeq	r0, r1, r7, lsl #10
    1030:	d2140000 	andsle	r0, r4, #0
    1034:	00c40000 	sbceq	r0, r4, r0
    1038:	9c010000 	stcls	0, cr0, [r1], {-0}
    103c:	00000f7b 	andeq	r0, r0, fp, ror pc
    1040:	70626d1b 	rsbvc	r6, r2, fp, lsl sp
    1044:	07fb0100 	ldrbeq	r0, [fp, r0, lsl #2]!
    1048:	00022c19 	andeq	r2, r2, r9, lsl ip
    104c:	6c910200 	lfmvs	f0, 4, [r1], {0}
    1050:	6e656c1b 	mcrvs	12, 3, r6, cr5, cr11, {0}
    1054:	07fb0100 	ldrbeq	r0, [fp, r0, lsl #2]!
    1058:	00008122 	andeq	r8, r0, r2, lsr #2
    105c:	68910200 	ldmvs	r1, {r9}
    1060:	67736d1b 			; <UNDEFINED> instruction: 0x67736d1b
    1064:	07fb0100 	ldrbeq	r0, [fp, r0, lsl #2]!
    1068:	00021e2d 	andeq	r1, r2, sp, lsr #28
    106c:	64910200 	ldrvs	r0, [r1], #512	; 0x200
    1070:	74657216 	strbtvc	r7, [r5], #-534	; 0xfffffdea
    1074:	07fd0100 	ldrbeq	r0, [sp, r0, lsl #2]!
    1078:	00008108 	andeq	r8, r0, r8, lsl #2
    107c:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    1080:	00061b1f 	andeq	r1, r6, pc, lsl fp
    1084:	07fd0100 	ldrbeq	r0, [sp, r0, lsl #2]!
    1088:	0000810d 	andeq	r8, r0, sp, lsl #2
    108c:	70910200 	addsvc	r0, r1, r0, lsl #4
    1090:	0a921e00 	beq	fe488898 <_stack+0xfe408898>
    1094:	d9010000 	stmdble	r1, {}	; <UNPREDICTABLE>
    1098:	00810507 	addeq	r0, r1, r7, lsl #10
    109c:	d0f40000 	rscsle	r0, r4, r0
    10a0:	01200000 			; <UNDEFINED> instruction: 0x01200000
    10a4:	9c010000 	stcls	0, cr0, [r1], {-0}
    10a8:	00000ff4 	strdeq	r0, [r0], -r4
    10ac:	70626d1b 	rsbvc	r6, r2, fp, lsl sp
    10b0:	07d90100 	ldrbeq	r0, [r9, r0, lsl #2]
    10b4:	00022c1d 	andeq	r2, r2, sp, lsl ip
    10b8:	6c910200 	lfmvs	f0, 4, [r1], {0}
    10bc:	6e656c1b 	mcrvs	12, 3, r6, cr5, cr11, {0}
    10c0:	07d90100 	ldrbeq	r0, [r9, r0, lsl #2]
    10c4:	00008126 	andeq	r8, r0, r6, lsr #2
    10c8:	68910200 	ldmvs	r1, {r9}
    10cc:	67736d1b 			; <UNDEFINED> instruction: 0x67736d1b
    10d0:	07d90100 	ldrbeq	r0, [r9, r0, lsl #2]
    10d4:	00021e31 	andeq	r1, r2, r1, lsr lr
    10d8:	64910200 	ldrvs	r0, [r1], #512	; 0x200
    10dc:	00061b1f 	andeq	r1, r6, pc, lsl fp
    10e0:	07db0100 	ldrbeq	r0, [fp, r0, lsl #2]
    10e4:	00008108 	andeq	r8, r0, r8, lsl #2
    10e8:	70910200 	addsvc	r0, r1, r0, lsl #4
    10ec:	74657216 	strbtvc	r7, [r5], #-534	; 0xfffffdea
    10f0:	07db0100 	ldrbeq	r0, [fp, r0, lsl #2]
    10f4:	0000810f 	andeq	r8, r0, pc, lsl #2
    10f8:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    10fc:	0002c722 	andeq	ip, r2, r2, lsr #14
    1100:	07f30100 	ldrbeq	r0, [r3, r0, lsl #2]!
    1104:	00d1ec01 	sbcseq	lr, r1, r1, lsl #24
    1108:	7c1e0000 	ldcvc	0, cr0, [lr], {-0}
    110c:	01000005 	tsteq	r0, r5
    1110:	810507b6 			; <UNDEFINED> instruction: 0x810507b6
    1114:	9c000000 	stcls	0, cr0, [r0], {-0}
    1118:	580000cf 	stmdapl	r0, {r0, r1, r2, r3, r6, r7}
    111c:	01000001 	tsteq	r0, r1
    1120:	0010609c 	mulseq	r0, ip, r0
    1124:	626d1b00 	rsbvs	r1, sp, #0, 22
    1128:	b6010070 			; <UNDEFINED> instruction: 0xb6010070
    112c:	022c1807 	eoreq	r1, ip, #458752	; 0x70000
    1130:	91020000 	mrsls	r0, (UNDEF: 2)
    1134:	656c1b6c 	strbvs	r1, [ip, #-2924]!	; 0xfffff494
    1138:	b601006e 	strlt	r0, [r1], -lr, rrx
    113c:	00812107 	addeq	r2, r1, r7, lsl #2
    1140:	91020000 	mrsls	r0, (UNDEF: 2)
    1144:	736d1b68 	cmnvc	sp, #104, 22	; 0x1a000
    1148:	b6010067 	strlt	r0, [r1], -r7, rrx
    114c:	021e2c07 	andseq	r2, lr, #1792	; 0x700
    1150:	91020000 	mrsls	r0, (UNDEF: 2)
    1154:	061b1f64 	ldreq	r1, [fp], -r4, ror #30
    1158:	b8010000 	stmdalt	r1, {}	; <UNPREDICTABLE>
    115c:	00810807 	addeq	r0, r1, r7, lsl #16
    1160:	91020000 	mrsls	r0, (UNDEF: 2)
    1164:	09971f74 	ldmibeq	r7, {r2, r4, r5, r6, r8, r9, sl, fp, ip}
    1168:	b8010000 	stmdalt	r1, {}	; <UNPREDICTABLE>
    116c:	00810f07 	addeq	r0, r1, r7, lsl #30
    1170:	91020000 	mrsls	r0, (UNDEF: 2)
    1174:	0c1e0070 	ldceq	0, cr0, [lr], {112}	; 0x70
    1178:	01000003 	tsteq	r0, r3
    117c:	81050787 	smlabbhi	r5, r7, r7, r0
    1180:	14000000 	strne	r0, [r0], #-0
    1184:	880000ce 	stmdahi	r0, {r1, r2, r3, r6, r7}
    1188:	01000001 	tsteq	r0, r1
    118c:	0010f99c 	mulseq	r0, ip, r9
    1190:	626d1b00 	rsbvs	r1, sp, #0, 22
    1194:	87010070 	smlsdxhi	r1, r0, r0, r0
    1198:	022c1d07 	eoreq	r1, ip, #448	; 0x1c0
    119c:	91020000 	mrsls	r0, (UNDEF: 2)
    11a0:	656c1b64 	strbvs	r1, [ip, #-2916]!	; 0xfffff49c
    11a4:	8701006e 	strhi	r0, [r1, -lr, rrx]
    11a8:	00812607 	addeq	r2, r1, r7, lsl #12
    11ac:	91020000 	mrsls	r0, (UNDEF: 2)
    11b0:	736d1b60 	cmnvc	sp, #96, 22	; 0x18000
    11b4:	87010067 	strhi	r0, [r1, -r7, rrx]
    11b8:	021e3107 	andseq	r3, lr, #-1073741823	; 0xc0000001
    11bc:	91020000 	mrsls	r0, (UNDEF: 2)
    11c0:	64671b5c 	strbtvs	r1, [r7], #-2908	; 0xfffff4a4
    11c4:	87010065 	strhi	r0, [r1, -r5, rrx]
    11c8:	00813a07 	addeq	r3, r1, r7, lsl #20
    11cc:	91020000 	mrsls	r0, (UNDEF: 2)
    11d0:	061b1f58 	ssaxeq	r1, fp, r8
    11d4:	89010000 	stmdbhi	r1, {}	; <UNPREDICTABLE>
    11d8:	00810807 	addeq	r0, r1, r7, lsl #16
    11dc:	91020000 	mrsls	r0, (UNDEF: 2)
    11e0:	6572166c 	ldrbvs	r1, [r2, #-1644]!	; 0xfffff994
    11e4:	89010074 	stmdbhi	r1, {r2, r4, r5, r6}
    11e8:	00810f07 	addeq	r0, r1, r7, lsl #30
    11ec:	91020000 	mrsls	r0, (UNDEF: 2)
    11f0:	020d1f74 	andeq	r1, sp, #116, 30	; 0x1d0
    11f4:	89010000 	stmdbhi	r1, {}	; <UNPREDICTABLE>
    11f8:	00811407 	addeq	r1, r1, r7, lsl #8
    11fc:	91020000 	mrsls	r0, (UNDEF: 2)
    1200:	02c72270 	sbceq	r2, r7, #112, 4
    1204:	ae010000 	cdpge	0, 0, cr0, cr1, cr0, {0}
    1208:	cf740107 	svcgt	0x00740107
    120c:	1e000000 	cdpne	0, 0, cr0, cr0, cr0, {0}
    1210:	00000a73 	andeq	r0, r0, r3, ror sl
    1214:	05075801 	streq	r5, [r7, #-2049]	; 0xfffff7ff
    1218:	00000081 	andeq	r0, r0, r1, lsl #1
    121c:	0000cc5c 	andeq	ip, r0, ip, asr ip
    1220:	000001b8 			; <UNDEFINED> instruction: 0x000001b8
    1224:	11859c01 	orrne	r9, r5, r1, lsl #24
    1228:	6d1b0000 	ldcvs	0, cr0, [fp, #-0]
    122c:	01007062 	tsteq	r0, r2, rrx
    1230:	2c180758 	ldccs	7, cr0, [r8], {88}	; 0x58
    1234:	02000002 	andeq	r0, r0, #2
    1238:	6c1b6491 	cfldrsvs	mvf6, [fp], {145}	; 0x91
    123c:	01006e65 	tsteq	r0, r5, ror #28
    1240:	81210758 			; <UNDEFINED> instruction: 0x81210758
    1244:	02000000 	andeq	r0, r0, #0
    1248:	6d1b6091 	ldcvs	0, cr6, [fp, #-580]	; 0xfffffdbc
    124c:	01006773 	tsteq	r0, r3, ror r7
    1250:	1e2c0758 	mcrne	7, 1, r0, cr12, cr8, {2}
    1254:	02000002 	andeq	r0, r0, #2
    1258:	671b5c91 			; <UNDEFINED> instruction: 0x671b5c91
    125c:	01006564 	tsteq	r0, r4, ror #10
    1260:	81350758 	teqhi	r5, r8, asr r7
    1264:	02000000 	andeq	r0, r0, #0
    1268:	971f5891 			; <UNDEFINED> instruction: 0x971f5891
    126c:	01000009 	tsteq	r0, r9
    1270:	8108075a 	tsthi	r8, sl, asr r7
    1274:	02000000 	andeq	r0, r0, #0
    1278:	1b1f6c91 	blne	7dc4c4 <_stack+0x75c4c4>
    127c:	01000006 	tsteq	r0, r6
    1280:	8112075a 	tsthi	r2, sl, asr r7
    1284:	02000000 	andeq	r0, r0, #0
    1288:	0d1f7091 	ldceq	0, cr7, [pc, #-580]	; 104c <_start-0x6fb4>
    128c:	01000002 	tsteq	r0, r2
    1290:	8119075a 	tsthi	r9, sl, asr r7
    1294:	02000000 	andeq	r0, r0, #0
    1298:	1e007491 	mcrne	4, 0, r7, cr0, cr1, {4}
    129c:	00000863 	andeq	r0, r0, r3, ror #16
    12a0:	05074501 	streq	r4, [r7, #-1281]	; 0xfffffaff
    12a4:	00000081 	andeq	r0, r0, r1, lsl #1
    12a8:	0000cc04 	andeq	ip, r0, r4, lsl #24
    12ac:	00000058 	andeq	r0, r0, r8, asr r0
    12b0:	11de9c01 	bicsne	r9, lr, r1, lsl #24
    12b4:	6d1b0000 	ldcvs	0, cr0, [fp, #-0]
    12b8:	01007062 	tsteq	r0, r2, rrx
    12bc:	2c1a0745 	ldccs	7, cr0, [sl], {69}	; 0x45
    12c0:	02000002 	andeq	r0, r0, #2
    12c4:	1b1f6c91 	blne	7dc510 <_stack+0x75c510>
    12c8:	01000006 	tsteq	r0, r6
    12cc:	81080747 	tsthi	r8, r7, asr #14
    12d0:	02000000 	andeq	r0, r0, #0
    12d4:	72167091 	andsvc	r7, r6, #145	; 0x91
    12d8:	01007465 	tsteq	r0, r5, ror #8
    12dc:	810f0747 	tsthi	pc, r7, asr #14
    12e0:	02000000 	andeq	r0, r0, #0
    12e4:	c7227491 			; <UNDEFINED> instruction: 0xc7227491
    12e8:	01000002 	tsteq	r0, r2
    12ec:	44010752 	strmi	r0, [r1], #-1874	; 0xfffff8ae
    12f0:	000000cc 	andeq	r0, r0, ip, asr #1
    12f4:	0007a21e 	andeq	sl, r7, lr, lsl r2
    12f8:	07240100 	streq	r0, [r4, -r0, lsl #2]!
    12fc:	00008105 	andeq	r8, r0, r5, lsl #2
    1300:	00cb2800 	sbceq	r2, fp, r0, lsl #16
    1304:	0000dc00 	andeq	sp, r0, r0, lsl #24
    1308:	379c0100 	ldrcc	r0, [ip, r0, lsl #2]
    130c:	1b000012 	blne	135c <_start-0x6ca4>
    1310:	0070626d 	rsbseq	r6, r0, sp, ror #4
    1314:	17072401 	strne	r2, [r7, -r1, lsl #8]
    1318:	0000022c 	andeq	r0, r0, ip, lsr #4
    131c:	1f6c9102 	svcne	0x006c9102
    1320:	0000061b 	andeq	r0, r0, fp, lsl r6
    1324:	08072601 	stmdaeq	r7, {r0, r9, sl, sp}
    1328:	00000081 	andeq	r0, r0, r1, lsl #1
    132c:	16709102 	ldrbtne	r9, [r0], -r2, lsl #2
    1330:	00746572 	rsbseq	r6, r4, r2, ror r5
    1334:	0f072601 	svceq	0x00072601
    1338:	00000081 	andeq	r0, r0, r1, lsl #1
    133c:	22749102 	rsbscs	r9, r4, #-2147483648	; 0x80000000
    1340:	000002c7 	andeq	r0, r0, r7, asr #5
    1344:	01073f01 	tsteq	r7, r1, lsl #30
    1348:	0000cbec 	andeq	ip, r0, ip, ror #23
    134c:	02011e00 	andeq	r1, r1, #0, 28
    1350:	02010000 	andeq	r0, r1, #0
    1354:	00810507 	addeq	r0, r1, r7, lsl #10
    1358:	ca7c0000 	bgt	1f01360 <_stack+0x1e81360>
    135c:	00ac0000 	adceq	r0, ip, r0
    1360:	9c010000 	stcls	0, cr0, [r1], {-0}
    1364:	00001290 	muleq	r0, r0, r2
    1368:	70626d1b 	rsbvc	r6, r2, fp, lsl sp
    136c:	07020100 	streq	r0, [r2, -r0, lsl #2]
    1370:	00022c18 	andeq	r2, r2, r8, lsl ip
    1374:	6c910200 	lfmvs	f0, 4, [r1], {0}
    1378:	00061b1f 	andeq	r1, r6, pc, lsl fp
    137c:	07040100 	streq	r0, [r4, -r0, lsl #2]
    1380:	00008108 	andeq	r8, r0, r8, lsl #2
    1384:	70910200 	addsvc	r0, r1, r0, lsl #4
    1388:	74657216 	strbtvc	r7, [r5], #-534	; 0xfffffdea
    138c:	07040100 	streq	r0, [r4, -r0, lsl #2]
    1390:	0000810f 	andeq	r8, r0, pc, lsl #2
    1394:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    1398:	0002c722 	andeq	ip, r2, r2, lsr #14
    139c:	071e0100 	ldreq	r0, [lr, -r0, lsl #2]
    13a0:	00cb1001 	sbceq	r1, fp, r1
    13a4:	2b1e0000 	blcs	7813ac <_stack+0x7013ac>
    13a8:	01000003 	tsteq	r0, r3
    13ac:	2c0706da 	stccs	6, cr0, [r7], {218}	; 0xda
    13b0:	48000002 	stmdami	r0, {r1}
    13b4:	340000c8 	strcc	r0, [r0], #-200	; 0xffffff38
    13b8:	01000002 	tsteq	r0, r2
    13bc:	0013079c 	mulseq	r3, ip, r7
    13c0:	0a611c00 	beq	18483c8 <_stack+0x17c83c8>
    13c4:	da010000 	ble	413cc <__bss_end__+0x31080>
    13c8:	008d1d06 	addeq	r1, sp, r6, lsl #26
    13cc:	91020000 	mrsls	r0, (UNDEF: 2)
    13d0:	01f31c64 	mvnseq	r1, r4, ror #24
    13d4:	da010000 	ble	413dc <__bss_end__+0x31090>
    13d8:	008d2d06 	addeq	r2, sp, r6, lsl #26
    13dc:	91020000 	mrsls	r0, (UNDEF: 2)
    13e0:	00691660 	rsbeq	r1, r9, r0, ror #12
    13e4:	0806dc01 	stmdaeq	r6, {r0, sl, fp, ip, lr, pc}
    13e8:	00000081 	andeq	r0, r0, r1, lsl #1
    13ec:	16749102 	ldrbtne	r9, [r4], -r2, lsl #2
    13f0:	0070626d 	rsbseq	r6, r0, sp, ror #4
    13f4:	0a06dd01 	beq	1b8800 <_stack+0x138800>
    13f8:	0000022c 	andeq	r0, r0, ip, lsr #4
    13fc:	16709102 	ldrbtne	r9, [r0], -r2, lsl #2
    1400:	00727470 	rsbseq	r7, r2, r0, ror r4
    1404:	0a06de01 	beq	1b8c10 <_stack+0x138c10>
    1408:	00000211 	andeq	r0, r0, r1, lsl r2
    140c:	226c9102 	rsbcs	r9, ip, #-2147483648	; 0x80000000
    1410:	000002c7 	andeq	r0, r0, r7, asr #5
    1414:	0106fd01 	tsteq	r6, r1, lsl #26	; <UNPREDICTABLE>
    1418:	0000ca6c 	andeq	ip, r0, ip, ror #20
    141c:	0bb71e00 	bleq	fedc8c24 <_stack+0xfed48c24>
    1420:	ba010000 	blt	41428 <__bss_end__+0x310dc>
    1424:	00810506 	addeq	r0, r1, r6, lsl #10
    1428:	c6fc0000 	ldrbtgt	r0, [ip], r0
    142c:	014c0000 	mrseq	r0, (UNDEF: 76)
    1430:	9c010000 	stcls	0, cr0, [r1], {-0}
    1434:	00001383 	andeq	r1, r0, r3, lsl #7
    1438:	6e656c1b 	mcrvs	12, 3, r6, cr5, cr11, {0}
    143c:	06ba0100 	ldrteq	r0, [sl], r0, lsl #2
    1440:	0000811c 	andeq	r8, r0, ip, lsl r1
    1444:	64910200 	ldrvs	r0, [r1], #512	; 0x200
    1448:	67736d1b 			; <UNDEFINED> instruction: 0x67736d1b
    144c:	06ba0100 	ldrteq	r0, [sl], r0, lsl #2
    1450:	00021e27 	andeq	r1, r2, r7, lsr #28
    1454:	60910200 	addsvs	r0, r1, r0, lsl #4
    1458:	74657216 	strbtvc	r7, [r5], #-534	; 0xfffffdea
    145c:	06bc0100 	ldrteq	r0, [ip], r0, lsl #2
    1460:	00008108 	andeq	r8, r0, r8, lsl #2
    1464:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    1468:	00061b1f 	andeq	r1, r6, pc, lsl fp
    146c:	06bc0100 	ldrteq	r0, [ip], r0, lsl #2
    1470:	0000810d 	andeq	r8, r0, sp, lsl #2
    1474:	6c910200 	lfmvs	f0, 4, [r1], {0}
    1478:	000b911f 	andeq	r9, fp, pc, lsl r1
    147c:	06bc0100 	ldrteq	r0, [ip], r0, lsl #2
    1480:	00008114 	andeq	r8, r0, r4, lsl r1
    1484:	70910200 	addsvc	r0, r1, r0, lsl #4
    1488:	0007121f 	andeq	r1, r7, pc, lsl r2
    148c:	06bd0100 	ldrteq	r0, [sp], r0, lsl #2
    1490:	00022c0a 	andeq	r2, r2, sl, lsl #24
    1494:	68910200 	ldmvs	r1, {r9}
    1498:	0bf31e00 	bleq	ffcc8ca0 <_stack+0xffc48ca0>
    149c:	91010000 	mrsls	r0, (UNDEF: 1)
    14a0:	00810506 	addeq	r0, r1, r6, lsl #10
    14a4:	c5540000 	ldrbgt	r0, [r4, #-0]
    14a8:	01a80000 			; <UNDEFINED> instruction: 0x01a80000
    14ac:	9c010000 	stcls	0, cr0, [r1], {-0}
    14b0:	0000140c 	andeq	r1, r0, ip, lsl #8
    14b4:	6e656c1b 	mcrvs	12, 3, r6, cr5, cr11, {0}
    14b8:	06910100 	ldreq	r0, [r1], r0, lsl #2
    14bc:	00008120 	andeq	r8, r0, r0, lsr #2
    14c0:	64910200 	ldrvs	r0, [r1], #512	; 0x200
    14c4:	67736d1b 			; <UNDEFINED> instruction: 0x67736d1b
    14c8:	06910100 	ldreq	r0, [r1], r0, lsl #2
    14cc:	00021e2b 	andeq	r1, r2, fp, lsr #28
    14d0:	60910200 	addsvs	r0, r1, r0, lsl #4
    14d4:	00061b1f 	andeq	r1, r6, pc, lsl fp
    14d8:	06930100 	ldreq	r0, [r3], r0, lsl #2
    14dc:	00008108 	andeq	r8, r0, r8, lsl #2
    14e0:	68910200 	ldmvs	r1, {r9}
    14e4:	74657216 	strbtvc	r7, [r5], #-534	; 0xfffffdea
    14e8:	06930100 	ldreq	r0, [r3], r0, lsl #2
    14ec:	0000810f 	andeq	r8, r0, pc, lsl #2
    14f0:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    14f4:	000b911f 	andeq	r9, fp, pc, lsl r1
    14f8:	06930100 	ldreq	r0, [r3], r0, lsl #2
    14fc:	00008114 	andeq	r8, r0, r4, lsl r1
    1500:	6c910200 	lfmvs	f0, 4, [r1], {0}
    1504:	0007121f 	andeq	r1, r7, pc, lsl r2
    1508:	06940100 	ldreq	r0, [r4], r0, lsl #2
    150c:	00022c0a 	andeq	r2, r2, sl, lsl #24
    1510:	70910200 	addsvc	r0, r1, r0, lsl #4
    1514:	0002c722 	andeq	ip, r2, r2, lsr #14
    1518:	06b20100 	ldrteq	r0, [r2], r0, lsl #2
    151c:	00c6d401 	sbceq	sp, r6, r1, lsl #8
    1520:	ab1e0000 	blge	781528 <_stack+0x701528>
    1524:	01000006 	tsteq	r0, r6
    1528:	8105066b 	tsthi	r5, fp, ror #12
    152c:	84000000 	strhi	r0, [r0], #-0
    1530:	d00000c3 	andle	r0, r0, r3, asr #1
    1534:	01000001 	tsteq	r0, r1
    1538:	0014889c 	mulseq	r4, ip, r8
    153c:	656c1b00 	strbvs	r1, [ip, #-2816]!	; 0xfffff500
    1540:	6b01006e 	blvs	41700 <__bss_end__+0x313b4>
    1544:	00811b06 	addeq	r1, r1, r6, lsl #22
    1548:	91020000 	mrsls	r0, (UNDEF: 2)
    154c:	736d1b64 	cmnvc	sp, #100, 22	; 0x19000
    1550:	6b010067 	blvs	416f4 <__bss_end__+0x313a8>
    1554:	021e2606 	andseq	r2, lr, #6291456	; 0x600000
    1558:	91020000 	mrsls	r0, (UNDEF: 2)
    155c:	061b1f60 	ldreq	r1, [fp], -r0, ror #30
    1560:	6d010000 	stcvs	0, cr0, [r1, #-0]
    1564:	00810806 	addeq	r0, r1, r6, lsl #16
    1568:	91020000 	mrsls	r0, (UNDEF: 2)
    156c:	09971f70 	ldmibeq	r7, {r4, r5, r6, r8, r9, sl, fp, ip}
    1570:	6d010000 	stcvs	0, cr0, [r1, #-0]
    1574:	00810f06 	addeq	r0, r1, r6, lsl #30
    1578:	91020000 	mrsls	r0, (UNDEF: 2)
    157c:	0b911f6c 	bleq	fe449334 <_stack+0xfe3c9334>
    1580:	6d010000 	stcvs	0, cr0, [r1, #-0]
    1584:	00811906 	addeq	r1, r1, r6, lsl #18
    1588:	91020000 	mrsls	r0, (UNDEF: 2)
    158c:	07121f74 			; <UNDEFINED> instruction: 0x07121f74
    1590:	6e010000 	cdpvs	0, 0, cr0, cr1, cr0, {0}
    1594:	022c0a06 	eoreq	r0, ip, #24576	; 0x6000
    1598:	91020000 	mrsls	r0, (UNDEF: 2)
    159c:	071e0068 	ldreq	r0, [lr, -r8, rrx]
    15a0:	01000009 	tsteq	r0, r9
    15a4:	81050636 	tsthi	r5, r6, lsr r6
    15a8:	78000000 	stmdavc	r0, {}	; <UNPREDICTABLE>
    15ac:	0c0000c1 	stceq	0, cr0, [r0], {193}	; 0xc1
    15b0:	01000002 	tsteq	r0, r2
    15b4:	0015319c 	mulseq	r5, ip, r1
    15b8:	0b911c00 	bleq	fe4485c0 <_stack+0xfe3c85c0>
    15bc:	36010000 	strcc	r0, [r1], -r0
    15c0:	00812106 	addeq	r2, r1, r6, lsl #2
    15c4:	91020000 	mrsls	r0, (UNDEF: 2)
    15c8:	656c1b64 	strbvs	r1, [ip, #-2916]!	; 0xfffff49c
    15cc:	3601006e 	strcc	r0, [r1], -lr, rrx
    15d0:	00812b06 	addeq	r2, r1, r6, lsl #22
    15d4:	91020000 	mrsls	r0, (UNDEF: 2)
    15d8:	736d1b60 	cmnvc	sp, #96, 22	; 0x18000
    15dc:	36010067 	strcc	r0, [r1], -r7, rrx
    15e0:	021e3606 	andseq	r3, lr, #6291456	; 0x600000
    15e4:	91020000 	mrsls	r0, (UNDEF: 2)
    15e8:	64671b5c 	strbtvs	r1, [r7], #-2908	; 0xfffff4a4
    15ec:	36010065 	strcc	r0, [r1], -r5, rrx
    15f0:	00813f06 	addeq	r3, r1, r6, lsl #30
    15f4:	91020000 	mrsls	r0, (UNDEF: 2)
    15f8:	061b1f58 	ssaxeq	r1, fp, r8
    15fc:	38010000 	stmdacc	r1, {}	; <UNPREDICTABLE>
    1600:	00810806 	addeq	r0, r1, r6, lsl #16
    1604:	91020000 	mrsls	r0, (UNDEF: 2)
    1608:	65721668 	ldrbvs	r1, [r2, #-1640]!	; 0xfffff998
    160c:	38010074 	stmdacc	r1, {r2, r4, r5, r6}
    1610:	00810f06 	addeq	r0, r1, r6, lsl #30
    1614:	91020000 	mrsls	r0, (UNDEF: 2)
    1618:	020d1f74 	andeq	r1, sp, #116, 30	; 0x1d0
    161c:	38010000 	stmdacc	r1, {}	; <UNPREDICTABLE>
    1620:	00811406 	addeq	r1, r1, r6, lsl #8
    1624:	91020000 	mrsls	r0, (UNDEF: 2)
    1628:	07121f70 			; <UNDEFINED> instruction: 0x07121f70
    162c:	39010000 	stmdbcc	r1, {}	; <UNPREDICTABLE>
    1630:	022c0a06 	eoreq	r0, ip, #24576	; 0x6000
    1634:	91020000 	mrsls	r0, (UNDEF: 2)
    1638:	02c7226c 	sbceq	r2, r7, #108, 4	; 0xc0000006
    163c:	63010000 	movwvs	r0, #4096	; 0x1000
    1640:	c35c0106 	cmpgt	ip, #-2147483647	; 0x80000001
    1644:	1e000000 	cdpne	0, 0, cr0, cr0, cr0, {0}
    1648:	00000492 	muleq	r0, r2, r4
    164c:	05060801 	streq	r0, [r6, #-2049]	; 0xfffff7ff
    1650:	00000081 	andeq	r0, r0, r1, lsl #1
    1654:	0000bf4c 	andeq	fp, r0, ip, asr #30
    1658:	0000022c 	andeq	r0, r0, ip, lsr #4
    165c:	15cd9c01 	strbne	r9, [sp, #3073]	; 0xc01
    1660:	911c0000 	tstls	ip, r0
    1664:	0100000b 	tsteq	r0, fp
    1668:	811c0608 	tsthi	ip, r8, lsl #12
    166c:	02000000 	andeq	r0, r0, #0
    1670:	6c1b6491 	cfldrsvs	mvf6, [fp], {145}	; 0x91
    1674:	01006e65 	tsteq	r0, r5, ror #28
    1678:	81260608 			; <UNDEFINED> instruction: 0x81260608
    167c:	02000000 	andeq	r0, r0, #0
    1680:	6d1b6091 	ldcvs	0, cr6, [fp, #-580]	; 0xfffffdbc
    1684:	01006773 	tsteq	r0, r3, ror r7
    1688:	1e310608 	cfmsuba32ne	mvax0, mvax0, mvfx1, mvfx8
    168c:	02000002 	andeq	r0, r0, #2
    1690:	671b5c91 			; <UNDEFINED> instruction: 0x671b5c91
    1694:	01006564 	tsteq	r0, r4, ror #10
    1698:	813a0608 	teqhi	sl, r8, lsl #12
    169c:	02000000 	andeq	r0, r0, #0
    16a0:	971f5891 			; <UNDEFINED> instruction: 0x971f5891
    16a4:	01000009 	tsteq	r0, r9
    16a8:	8108060a 	tsthi	r8, sl, lsl #12
    16ac:	02000000 	andeq	r0, r0, #0
    16b0:	1b1f6c91 	blne	7dc8fc <_stack+0x75c8fc>
    16b4:	01000006 	tsteq	r0, r6
    16b8:	8112060a 	tsthi	r2, sl, lsl #12
    16bc:	02000000 	andeq	r0, r0, #0
    16c0:	0d1f7091 	ldceq	0, cr7, [pc, #-580]	; 1484 <_start-0x6b7c>
    16c4:	01000002 	tsteq	r0, r2
    16c8:	8119060a 	tsthi	r9, sl, lsl #12
    16cc:	02000000 	andeq	r0, r0, #0
    16d0:	121f7491 	andsne	r7, pc, #-1862270976	; 0x91000000
    16d4:	01000007 	tsteq	r0, r7
    16d8:	2c0a060b 	stccs	6, cr0, [sl], {11}
    16dc:	02000002 	andeq	r0, r0, #2
    16e0:	1e006891 	mcrne	8, 0, r6, cr0, cr1, {4}
    16e4:	0000085e 	andeq	r0, r0, lr, asr r8
    16e8:	0505ef01 	streq	lr, [r5, #-3841]	; 0xfffff0ff
    16ec:	00000081 	andeq	r0, r0, r1, lsl #1
    16f0:	0000be70 	andeq	fp, r0, r0, ror lr
    16f4:	000000dc 	ldrdeq	r0, [r0], -ip
    16f8:	16369c01 	ldrtne	r9, [r6], -r1, lsl #24
    16fc:	911c0000 	tstls	ip, r0
    1700:	0100000b 	tsteq	r0, fp
    1704:	811d05ef 	tsthi	sp, pc, ror #11
    1708:	02000000 	andeq	r0, r0, #0
    170c:	1b1f6491 	blne	7da958 <_stack+0x75a958>
    1710:	01000006 	tsteq	r0, r6
    1714:	810805f1 	strdhi	r0, [r8, -r1]
    1718:	02000000 	andeq	r0, r0, #0
    171c:	72167091 	andsvc	r7, r6, #145	; 0x91
    1720:	01007465 	tsteq	r0, r5, ror #8
    1724:	810f05f1 	strdhi	r0, [pc, -r1]
    1728:	02000000 	andeq	r0, r0, #0
    172c:	121f7491 	andsne	r7, pc, #-1862270976	; 0x91000000
    1730:	01000007 	tsteq	r0, r7
    1734:	2c0a05f2 	cfstr32cs	mvfx0, [sl], {242}	; 0xf2
    1738:	02000002 	andeq	r0, r0, #2
    173c:	c7226c91 			; <UNDEFINED> instruction: 0xc7226c91
    1740:	01000002 	tsteq	r0, r2
    1744:	34010602 	strcc	r0, [r1], #-1538	; 0xfffff9fe
    1748:	000000bf 	strheq	r0, [r0], -pc	; <UNPREDICTABLE>
    174c:	0002b61e 	andeq	fp, r2, lr, lsl r6
    1750:	05c60100 	strbeq	r0, [r6, #256]	; 0x100
    1754:	00008105 	andeq	r8, r0, r5, lsl #2
    1758:	00bd1000 	adcseq	r1, sp, r0
    175c:	00016000 	andeq	r6, r1, r0
    1760:	9f9c0100 	svcls	0x009c0100
    1764:	1c000016 	stcne	0, cr0, [r0], {22}
    1768:	00000b91 	muleq	r0, r1, fp
    176c:	1b05c601 	blne	172f78 <_stack+0xf2f78>
    1770:	00000081 	andeq	r0, r0, r1, lsl #1
    1774:	1f649102 	svcne	0x00649102
    1778:	00000712 	andeq	r0, r0, r2, lsl r7
    177c:	0a05c801 	beq	173788 <_stack+0xf3788>
    1780:	0000022c 	andeq	r0, r0, ip, lsr #4
    1784:	1f6c9102 	svcne	0x006c9102
    1788:	0000061b 	andeq	r0, r0, fp, lsl r6
    178c:	0805c901 	stmdaeq	r5, {r0, r8, fp, lr, pc}
    1790:	00000081 	andeq	r0, r0, r1, lsl #1
    1794:	16709102 	ldrbtne	r9, [r0], -r2, lsl #2
    1798:	00746572 	rsbseq	r6, r4, r2, ror r5
    179c:	0f05c901 	svceq	0x0005c901
    17a0:	00000081 	andeq	r0, r0, r1, lsl #1
    17a4:	22749102 	rsbscs	r9, r4, #-2147483648	; 0x80000000
    17a8:	000002c7 	andeq	r0, r0, r7, asr #5
    17ac:	0105e901 	tsteq	r5, r1, lsl #18
    17b0:	0000be58 	andeq	fp, r0, r8, asr lr
    17b4:	069b1e00 	ldreq	r1, [fp], r0, lsl #28
    17b8:	a0010000 	andge	r0, r1, r0
    17bc:	00810505 	addeq	r0, r1, r5, lsl #10
    17c0:	bba40000 	bllt	fe9017c8 <_stack+0xfe8817c8>
    17c4:	016c0000 	cmneq	ip, r0
    17c8:	9c010000 	stcls	0, cr0, [r1], {-0}
    17cc:	00001708 	andeq	r1, r0, r8, lsl #14
    17d0:	000b911c 	andeq	r9, fp, ip, lsl r1
    17d4:	05a00100 	streq	r0, [r0, #256]!	; 0x100
    17d8:	0000811a 	andeq	r8, r0, sl, lsl r1
    17dc:	64910200 	ldrvs	r0, [r1], #512	; 0x200
    17e0:	00061b1f 	andeq	r1, r6, pc, lsl fp
    17e4:	05a20100 	streq	r0, [r2, #256]!	; 0x100
    17e8:	00008108 	andeq	r8, r0, r8, lsl #2
    17ec:	70910200 	addsvc	r0, r1, r0, lsl #4
    17f0:	74657216 	strbtvc	r7, [r5], #-534	; 0xfffffdea
    17f4:	05a20100 	streq	r0, [r2, #256]!	; 0x100
    17f8:	0000810f 	andeq	r8, r0, pc, lsl #2
    17fc:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    1800:	0007121f 	andeq	r1, r7, pc, lsl r2
    1804:	05a30100 	streq	r0, [r3, #256]!	; 0x100
    1808:	00022c0a 	andeq	r2, r2, sl, lsl #24
    180c:	6c910200 	lfmvs	f0, 4, [r1], {0}
    1810:	0002c722 	andeq	ip, r2, r2, lsr #14
    1814:	05c00100 	strbeq	r0, [r0, #256]	; 0x100
    1818:	00bcf801 	adcseq	pc, ip, r1, lsl #16
    181c:	d61e0000 	ldrle	r0, [lr], -r0
    1820:	01000004 	tsteq	r0, r4
    1824:	8105056f 	tsthi	r5, pc, ror #10
    1828:	90000000 	andls	r0, r0, r0
    182c:	140000b9 	strne	r0, [r0], #-185	; 0xffffff47
    1830:	01000002 	tsteq	r0, r2
    1834:	0017af9c 	mulseq	r7, ip, pc	; <UNPREDICTABLE>
    1838:	0b911c00 	bleq	fe448840 <_stack+0xfe3c8840>
    183c:	6f010000 	svcvs	0x00010000
    1840:	00811b05 	addeq	r1, r1, r5, lsl #22
    1844:	91020000 	mrsls	r0, (UNDEF: 2)
    1848:	0a611c5c 	beq	18489c0 <_stack+0x17c89c0>
    184c:	6f010000 	svcvs	0x00010000
    1850:	008d2a05 	addeq	r2, sp, r5, lsl #20
    1854:	91020000 	mrsls	r0, (UNDEF: 2)
    1858:	01f31c58 	mvnseq	r1, r8, asr ip
    185c:	6f010000 	svcvs	0x00010000
    1860:	008d3a05 	addeq	r3, sp, r5, lsl #20
    1864:	91020000 	mrsls	r0, (UNDEF: 2)
    1868:	00691654 	rsbeq	r1, r9, r4, asr r6
    186c:	08057101 	stmdaeq	r5, {r0, r8, ip, sp, lr}
    1870:	00000081 	andeq	r0, r0, r1, lsl #1
    1874:	1f749102 	svcne	0x00749102
    1878:	0000061b 	andeq	r0, r0, fp, lsl r6
    187c:	0b057101 	bleq	15dc88 <_stack+0xddc88>
    1880:	00000081 	andeq	r0, r0, r1, lsl #1
    1884:	16689102 	strbtne	r9, [r8], -r2, lsl #2
    1888:	00746572 	rsbseq	r6, r4, r2, ror r5
    188c:	12057101 	andne	r7, r5, #1073741824	; 0x40000000
    1890:	00000081 	andeq	r0, r0, r1, lsl #1
    1894:	1f709102 	svcne	0x00709102
    1898:	00000712 	andeq	r0, r0, r2, lsl r7
    189c:	0a057201 	beq	15e0a8 <_stack+0xde0a8>
    18a0:	0000022c 	andeq	r0, r0, ip, lsr #4
    18a4:	16649102 	strbtne	r9, [r4], -r2, lsl #2
    18a8:	00727470 	rsbseq	r7, r2, r0, ror r4
    18ac:	0a057301 	beq	15e4b8 <_stack+0xde4b8>
    18b0:	00000211 	andeq	r0, r0, r1, lsl r2
    18b4:	226c9102 	rsbcs	r9, ip, #-2147483648	; 0x80000000
    18b8:	000002c7 	andeq	r0, r0, r7, asr #5
    18bc:	01059a01 	tsteq	r5, r1, lsl #20
    18c0:	0000bb8c 	andeq	fp, r0, ip, lsl #23
    18c4:	06d61a00 	ldrbeq	r1, [r6], r0, lsl #20
    18c8:	31010000 	mrscc	r0, (UNDEF: 1)
    18cc:	b75c0605 	ldrblt	r0, [ip, -r5, lsl #12]
    18d0:	02340000 	eorseq	r0, r4, #0
    18d4:	9c010000 	stcls	0, cr0, [r1], {-0}
    18d8:	000017d7 	ldrdeq	r1, [r0], -r7
    18dc:	6765721b 			; <UNDEFINED> instruction: 0x6765721b
    18e0:	05310100 	ldreq	r0, [r1, #-256]!	; 0xffffff00
    18e4:	00068e24 	andeq	r8, r6, r4, lsr #28
    18e8:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    18ec:	0aac1a00 	beq	feb080f4 <_stack+0xfea880f4>
    18f0:	95010000 	strls	r0, [r1, #-0]
    18f4:	ad300604 	ldcge	6, cr0, [r0, #-16]!
    18f8:	0a2c0000 	beq	b01900 <_stack+0xa81900>
    18fc:	9c010000 	stcls	0, cr0, [r1], {-0}
    1900:	0000180f 	andeq	r1, r0, pc, lsl #16
    1904:	6765721b 			; <UNDEFINED> instruction: 0x6765721b
    1908:	04950100 	ldreq	r0, [r5], #256	; 0x100
    190c:	00068e28 	andeq	r8, r6, r8, lsr #28
    1910:	6c910200 	lfmvs	f0, 4, [r1], {0}
    1914:	0005f11f 	andeq	pc, r5, pc, lsl r1	; <UNPREDICTABLE>
    1918:	04970100 	ldreq	r0, [r7], #256	; 0x100
    191c:	0004cd0e 	andeq	ip, r4, lr, lsl #26
    1920:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    1924:	080b2100 	stmdaeq	fp, {r8, sp}
    1928:	8d010000 	stchi	0, cr0, [r1, #-0]
    192c:	ac780604 	ldclge	6, cr0, [r8], #-16
    1930:	00b80000 	adcseq	r0, r8, r0
    1934:	9c010000 	stcls	0, cr0, [r1], {-0}
    1938:	00001837 	andeq	r1, r0, r7, lsr r8
    193c:	00059a1c 	andeq	r9, r5, ip, lsl sl
    1940:	048d0100 	streq	r0, [sp], #256	; 0x100
    1944:	0006a71d 	andeq	sl, r6, sp, lsl r7
    1948:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    194c:	0b231a00 	bleq	8c8154 <_stack+0x848154>
    1950:	2f010000 	svccs	0x00010000
    1954:	a6300604 	ldrtge	r0, [r0], -r4, lsl #12
    1958:	06480000 	strbeq	r0, [r8], -r0
    195c:	9c010000 	stcls	0, cr0, [r1], {-0}
    1960:	0000186c 	andeq	r1, r0, ip, ror #16
    1964:	6765721b 			; <UNDEFINED> instruction: 0x6765721b
    1968:	042f0100 	strteq	r0, [pc], #-256	; 1970 <_start-0x6690>
    196c:	00068e25 	andeq	r8, r6, r5, lsr #28
    1970:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    1974:	00061b23 	andeq	r1, r6, r3, lsr #22
    1978:	04310100 	ldrteq	r0, [r1], #-256	; 0xffffff00
    197c:	00008107 	andeq	r8, r0, r7, lsl #2
    1980:	eb1e0000 	bl	781988 <_stack+0x701988>
    1984:	01000003 	tsteq	r0, r3
    1988:	81050420 	tsthi	r5, r0, lsr #8
    198c:	b4000000 	strlt	r0, [r0], #-0
    1990:	7c0000a5 	stcvc	0, cr0, [r0], {165}	; 0xa5
    1994:	01000000 	mrseq	r0, (UNDEF: 0)
    1998:	0018989c 	mulseq	r8, ip, r8
    199c:	061b1f00 	ldreq	r1, [fp], -r0, lsl #30
    19a0:	22010000 	andcs	r0, r1, #0
    19a4:	00810804 	addeq	r0, r1, r4, lsl #16
    19a8:	91020000 	mrsls	r0, (UNDEF: 2)
    19ac:	211e0074 	tstcs	lr, r4, ror r0
    19b0:	01000006 	tsteq	r0, r6
    19b4:	81050411 	tsthi	r5, r1, lsl r4
    19b8:	4c000000 	stcmi	0, cr0, [r0], {-0}
    19bc:	680000a5 	stmdavs	r0, {r0, r2, r5, r7}
    19c0:	01000000 	mrseq	r0, (UNDEF: 0)
    19c4:	0018c49c 	mulseq	r8, ip, r4
    19c8:	061b1f00 	ldreq	r1, [fp], -r0, lsl #30
    19cc:	13010000 	movwne	r0, #4096	; 0x1000
    19d0:	00810804 	addeq	r0, r1, r4, lsl #16
    19d4:	91020000 	mrsls	r0, (UNDEF: 2)
    19d8:	c31e0074 	tstgt	lr, #116	; 0x74
    19dc:	01000009 	tsteq	r0, r9
    19e0:	81050404 	tsthi	r5, r4, lsl #8
    19e4:	8c000000 	stchi	0, cr0, [r0], {-0}
    19e8:	c00000a4 	andgt	r0, r0, r4, lsr #1
    19ec:	01000000 	mrseq	r0, (UNDEF: 0)
    19f0:	0019109c 	mulseq	r9, ip, r0
    19f4:	05651c00 	strbeq	r1, [r5, #-3072]!	; 0xfffff400
    19f8:	04010000 	streq	r0, [r1], #-0
    19fc:	00811704 	addeq	r1, r1, r4, lsl #14
    1a00:	91020000 	mrsls	r0, (UNDEF: 2)
    1a04:	6f70166c 	svcvs	0x0070166c
    1a08:	0601006d 	streq	r0, [r1], -sp, rrx
    1a0c:	00810904 	addeq	r0, r1, r4, lsl #18
    1a10:	91020000 	mrsls	r0, (UNDEF: 2)
    1a14:	061b1f70 	ssub16eq	r1, fp, r0
    1a18:	06010000 	streq	r0, [r1], -r0
    1a1c:	00810e04 	addeq	r0, r1, r4, lsl #28
    1a20:	91020000 	mrsls	r0, (UNDEF: 2)
    1a24:	ed1e0074 	ldc	0, cr0, [lr, #-464]	; 0xfffffe30
    1a28:	01000008 	tsteq	r0, r8
    1a2c:	8d0a03f9 	stchi	3, cr0, [sl, #-996]	; 0xfffffc1c
    1a30:	58000000 	stmdapl	r0, {}	; <UNPREDICTABLE>
    1a34:	340000a4 	strcc	r0, [r0], #-164	; 0xffffff5c
    1a38:	01000000 	mrseq	r0, (UNDEF: 0)
    1a3c:	00194c9c 	mulseq	r9, ip, ip
    1a40:	6f701600 	svcvs	0x00701600
    1a44:	fb01006d 	blx	41c02 <__bss_end__+0x318b6>
    1a48:	00810903 	addeq	r0, r1, r3, lsl #18
    1a4c:	91020000 	mrsls	r0, (UNDEF: 2)
    1a50:	061b1f70 	ssub16eq	r1, fp, r0
    1a54:	fb010000 	blx	41a5e <__bss_end__+0x31712>
    1a58:	00810e03 	addeq	r0, r1, r3, lsl #28
    1a5c:	91020000 	mrsls	r0, (UNDEF: 2)
    1a60:	b81e0074 	ldmdalt	lr, {r2, r4, r5, r6}
    1a64:	0100000a 	tsteq	r0, sl
    1a68:	8d0a03eb 	stchi	3, cr0, [sl, #-940]	; 0xfffffc54
    1a6c:	f0000000 			; <UNDEFINED> instruction: 0xf0000000
    1a70:	680000a3 	stmdavs	r0, {r0, r1, r5, r7}
    1a74:	01000000 	mrseq	r0, (UNDEF: 0)
    1a78:	0019989c 	mulseq	r9, ip, r8
    1a7c:	07ad1c00 	streq	r1, [sp, r0, lsl #24]!
    1a80:	eb010000 	bl	41a88 <__bss_end__+0x3173c>
    1a84:	008d1f03 	addeq	r1, sp, r3, lsl #30
    1a88:	91020000 	mrsls	r0, (UNDEF: 2)
    1a8c:	6f70166c 	svcvs	0x0070166c
    1a90:	ed01006d 	stc	0, cr0, [r1, #-436]	; 0xfffffe4c
    1a94:	008d0e03 	addeq	r0, sp, r3, lsl #28
    1a98:	91020000 	mrsls	r0, (UNDEF: 2)
    1a9c:	061b1f70 	ssub16eq	r1, fp, r0
    1aa0:	ed010000 	stc	0, cr0, [r1, #-0]
    1aa4:	008d1303 	addeq	r1, sp, r3, lsl #6
    1aa8:	91020000 	mrsls	r0, (UNDEF: 2)
    1aac:	031e0074 	tsteq	lr, #116	; 0x74
    1ab0:	01000003 	tsteq	r0, r3
    1ab4:	810503de 	ldrdhi	r0, [r5, -lr]
    1ab8:	90000000 	andls	r0, r0, r0
    1abc:	600000a3 	andvs	r0, r0, r3, lsr #1
    1ac0:	01000000 	mrseq	r0, (UNDEF: 0)
    1ac4:	0019d49c 	mulseq	r9, ip, r4
    1ac8:	6f701600 	svcvs	0x00701600
    1acc:	e001006d 	and	r0, r1, sp, rrx
    1ad0:	00810803 	addeq	r0, r1, r3, lsl #16
    1ad4:	91020000 	mrsls	r0, (UNDEF: 2)
    1ad8:	061b1f74 	ssub16eq	r1, fp, r4
    1adc:	e0010000 	and	r0, r1, r0
    1ae0:	00810d03 	addeq	r0, r1, r3, lsl #26
    1ae4:	91020000 	mrsls	r0, (UNDEF: 2)
    1ae8:	961e0070 			; <UNDEFINED> instruction: 0x961e0070
    1aec:	0100000b 	tsteq	r0, fp
    1af0:	810503ca 	smlabthi	r5, sl, r3, r0
    1af4:	e4000000 	str	r0, [r0], #-0
    1af8:	ac0000a2 	stcge	0, cr0, [r0], {162}	; 0xa2
    1afc:	01000000 	mrseq	r0, (UNDEF: 0)
    1b00:	001a209c 	mulseq	sl, ip, r0
    1b04:	07f31c00 	ldrbeq	r1, [r3, r0, lsl #24]!
    1b08:	ca010000 	bgt	41b10 <__bss_end__+0x317c4>
    1b0c:	00811603 	addeq	r1, r1, r3, lsl #12
    1b10:	91020000 	mrsls	r0, (UNDEF: 2)
    1b14:	6f70166c 	svcvs	0x0070166c
    1b18:	cc01006d 	stcgt	0, cr0, [r1], {109}	; 0x6d
    1b1c:	00810803 	addeq	r0, r1, r3, lsl #16
    1b20:	91020000 	mrsls	r0, (UNDEF: 2)
    1b24:	061b1f74 	ssub16eq	r1, fp, r4
    1b28:	cc010000 	stcgt	0, cr0, [r1], {-0}
    1b2c:	00810d03 	addeq	r0, r1, r3, lsl #26
    1b30:	91020000 	mrsls	r0, (UNDEF: 2)
    1b34:	d01e0070 	andsle	r0, lr, r0, ror r0
    1b38:	01000008 	tsteq	r0, r8
    1b3c:	81050398 			; <UNDEFINED> instruction: 0x81050398
    1b40:	04000000 	streq	r0, [r0], #-0
    1b44:	e00000a0 	and	r0, r0, r0, lsr #1
    1b48:	01000002 	tsteq	r0, r2
    1b4c:	001a7c9c 	mulseq	sl, ip, ip
    1b50:	726c1b00 	rsbvc	r1, ip, #0, 22
    1b54:	9801006e 	stmdals	r1, {r1, r2, r3, r5, r6}
    1b58:	00811203 	addeq	r1, r1, r3, lsl #4
    1b5c:	91020000 	mrsls	r0, (UNDEF: 2)
    1b60:	061b1f64 	ldreq	r1, [fp], -r4, ror #30
    1b64:	9a010000 	bls	41b6c <__bss_end__+0x31820>
    1b68:	00810803 	addeq	r0, r1, r3, lsl #16
    1b6c:	91020000 	mrsls	r0, (UNDEF: 2)
    1b70:	02d81f6c 	sbcseq	r1, r8, #108, 30	; 0x1b0
    1b74:	9b010000 	blls	41b7c <__bss_end__+0x31830>
    1b78:	035a0903 	cmpeq	sl, #49152	; 0xc000
    1b7c:	91020000 	mrsls	r0, (UNDEF: 2)
    1b80:	031d1f74 	tsteq	sp, #116, 30	; 0x1d0
    1b84:	9b010000 	blls	41b8c <__bss_end__+0x31840>
    1b88:	035a1303 	cmpeq	sl, #201326592	; 0xc000000
    1b8c:	91020000 	mrsls	r0, (UNDEF: 2)
    1b90:	08200070 	stmdaeq	r0!, {r4, r5, r6}
    1b94:	01000005 	tsteq	r0, r5
    1b98:	81050356 	tsthi	r5, r6, asr r3
    1b9c:	e0000000 	and	r0, r0, r0
    1ba0:	2400009c 	strcs	r0, [r0], #-156	; 0xffffff64
    1ba4:	01000003 	tsteq	r0, r3
    1ba8:	001ae29c 	mulseq	sl, ip, r2
    1bac:	07261c00 	streq	r1, [r6, -r0, lsl #24]!
    1bb0:	56010000 	strpl	r0, [r1], -r0
    1bb4:	1ae21903 	bne	ff887fc8 <_stack+0xff807fc8>
    1bb8:	91020000 	mrsls	r0, (UNDEF: 2)
    1bbc:	03c71f60 	biceq	r1, r7, #96, 30	; 0x180
    1bc0:	58010000 	stmdapl	r1, {}	; <UNPREDICTABLE>
    1bc4:	00731303 	rsbseq	r1, r3, r3, lsl #6
    1bc8:	91020000 	mrsls	r0, (UNDEF: 2)
    1bcc:	9da02474 	cfstrsls	mvf2, [r0, #464]!	; 0x1d0
    1bd0:	01a80000 			; <UNDEFINED> instruction: 0x01a80000
    1bd4:	ce1f0000 	cdpgt	0, 1, cr0, cr15, cr0, {0}
    1bd8:	01000005 	tsteq	r0, r5
    1bdc:	5a0d0367 	bpl	342980 <_stack+0x2c2980>
    1be0:	02000003 	andeq	r0, r0, #3
    1be4:	d41f7091 	ldrle	r7, [pc], #-145	; 1bec <_start-0x6414>
    1be8:	01000005 	tsteq	r0, r5
    1bec:	5a140367 	bpl	502990 <_stack+0x482990>
    1bf0:	02000003 	andeq	r0, r0, #3
    1bf4:	00006c91 	muleq	r0, r1, ip
    1bf8:	a2040802 	andge	r0, r4, #131072	; 0x20000
    1bfc:	2500000b 	strcs	r0, [r0, #-11]
    1c00:	000005fb 	strdeq	r0, [r0], -fp
    1c04:	05034501 	streq	r4, [r3, #-1281]	; 0xfffffaff
    1c08:	00000081 	andeq	r0, r0, r1, lsl #1
    1c0c:	00009bbc 			; <UNDEFINED> instruction: 0x00009bbc
    1c10:	00000124 	andeq	r0, r0, r4, lsr #2
    1c14:	b51e9c01 	ldrlt	r9, [lr, #-3073]	; 0xfffff3ff
    1c18:	01000009 	tsteq	r0, r9
    1c1c:	8105031b 	tsthi	r5, fp, lsl r3
    1c20:	6c000000 	stcvs	0, cr0, [r0], {-0}
    1c24:	5000009a 	mulpl	r0, sl, r0
    1c28:	01000001 	tsteq	r0, r1
    1c2c:	001b5b9c 	mulseq	fp, ip, fp
    1c30:	73631b00 	cmnvc	r3, #0, 22
    1c34:	031b0100 	tsteq	fp, #0, 2
    1c38:	001b5b1f 	andseq	r5, fp, pc, lsl fp
    1c3c:	64910200 	ldrvs	r0, [r1], #512	; 0x200
    1c40:	00061b1f 	andeq	r1, r6, pc, lsl fp
    1c44:	031d0100 	tsteq	sp, #0, 2
    1c48:	00008108 	andeq	r8, r0, r8, lsl #2
    1c4c:	70910200 	addsvc	r0, r1, r0, lsl #4
    1c50:	6d6f7016 	stclvs	0, cr7, [pc, #-88]!	; 1c00 <_start-0x6400>
    1c54:	031d0100 	tsteq	sp, #0, 2
    1c58:	0000810f 	andeq	r8, r0, pc, lsl #2
    1c5c:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    1c60:	00031d1f 	andeq	r1, r3, pc, lsl sp
    1c64:	031e0100 	tsteq	lr, #0, 2
    1c68:	00035a09 	andeq	r5, r3, r9, lsl #20
    1c6c:	6c910200 	lfmvs	f0, 4, [r1], {0}
    1c70:	fc040900 	stc2	9, cr0, [r4], {-0}	; <UNPREDICTABLE>
    1c74:	1e000003 	cdpne	0, 0, cr0, cr0, cr3, {0}
    1c78:	00000a4d 	andeq	r0, r0, sp, asr #20
    1c7c:	05030f01 	streq	r0, [r3, #-3841]	; 0xfffff0ff
    1c80:	00000081 	andeq	r0, r0, r1, lsl #1
    1c84:	00009a1c 	andeq	r9, r0, ip, lsl sl
    1c88:	00000050 	andeq	r0, r0, r0, asr r0
    1c8c:	1bac9c01 	blne	feb28c98 <_stack+0xfeaa8c98>
    1c90:	631b0000 	tstvs	fp, #0
    1c94:	0f010073 	svceq	0x00010073
    1c98:	1b5b1d03 	blne	16c90ac <_stack+0x16490ac>
    1c9c:	91020000 	mrsls	r0, (UNDEF: 2)
    1ca0:	061b1f6c 	ldreq	r1, [fp], -ip, ror #30
    1ca4:	11010000 	mrsne	r0, (UNDEF: 1)
    1ca8:	00810803 	addeq	r0, r1, r3, lsl #16
    1cac:	91020000 	mrsls	r0, (UNDEF: 2)
    1cb0:	6f701670 	svcvs	0x00701670
    1cb4:	1101006d 	tstne	r1, sp, rrx
    1cb8:	00810f03 	addeq	r0, r1, r3, lsl #30
    1cbc:	91020000 	mrsls	r0, (UNDEF: 2)
    1cc0:	cc1e0074 	ldcgt	0, cr0, [lr], {116}	; 0x74
    1cc4:	01000003 	tsteq	r0, r3
    1cc8:	8105030a 	tsthi	r5, sl, lsl #6
    1ccc:	f4000000 	vst4.8	{d0-d3}, [r0], r0
    1cd0:	28000099 	stmdacs	r0, {r0, r3, r4, r7}
    1cd4:	01000000 	mrseq	r0, (UNDEF: 0)
    1cd8:	001bd79c 	mulseq	fp, ip, r7
    1cdc:	73631b00 	cmnvc	r3, #0, 22
    1ce0:	030a0100 	movweq	r0, #41216	; 0xa100
    1ce4:	001b5b1f 	andseq	r5, fp, pc, lsl fp
    1ce8:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    1cec:	08252100 	stmdaeq	r5!, {r8, sp}
    1cf0:	04010000 	streq	r0, [r1], #-0
    1cf4:	99ac0603 	stmibls	ip!, {r0, r1, r9, sl}
    1cf8:	00480000 	subeq	r0, r8, r0
    1cfc:	9c010000 	stcls	0, cr0, [r1], {-0}
    1d00:	00001bfe 	strdeq	r1, [r0], -lr
    1d04:	0073631b 	rsbseq	r6, r3, fp, lsl r3
    1d08:	1f030401 	svcne	0x00030401
    1d0c:	00001b5b 	andeq	r1, r0, fp, asr fp
    1d10:	00749102 	rsbseq	r9, r4, r2, lsl #2
    1d14:	0008321e 	andeq	r3, r8, lr, lsl r2
    1d18:	02dc0100 	sbcseq	r0, ip, #0, 2
    1d1c:	00008105 	andeq	r8, r0, r5, lsl #2
    1d20:	00984800 	addseq	r4, r8, r0, lsl #16
    1d24:	00016400 	andeq	r6, r1, r0, lsl #8
    1d28:	769c0100 	ldrvc	r0, [ip], r0, lsl #2
    1d2c:	1b00001c 	blne	1da4 <_start-0x625c>
    1d30:	006d6573 	rsbeq	r6, sp, r3, ror r5
    1d34:	1802dc01 	stmdane	r2, {r0, sl, fp, ip, lr, pc}
    1d38:	00000408 	andeq	r0, r0, r8, lsl #8
    1d3c:	1b649102 	blne	192614c <_stack+0x18a614c>
    1d40:	dc01006e 	stcle	0, cr0, [r1], {110}	; 0x6e
    1d44:	00812102 	addeq	r2, r1, r2, lsl #2
    1d48:	91020000 	mrsls	r0, (UNDEF: 2)
    1d4c:	00691660 	rsbeq	r1, r9, r0, ror #12
    1d50:	0802de01 	stmdaeq	r2, {r0, r9, sl, fp, ip, lr, pc}
    1d54:	00000081 	andeq	r0, r0, r1, lsl #1
    1d58:	1f749102 	svcne	0x00749102
    1d5c:	0000061b 	andeq	r0, r0, fp, lsl r6
    1d60:	0b02de01 	bleq	b956c <_stack+0x3956c>
    1d64:	00000081 	andeq	r0, r0, r1, lsl #1
    1d68:	166c9102 	strbtne	r9, [ip], -r2, lsl #2
    1d6c:	006d6f70 	rsbeq	r6, sp, r0, ror pc
    1d70:	1202de01 	andne	sp, r2, #1, 28
    1d74:	00000081 	andeq	r0, r0, r1, lsl #1
    1d78:	1f709102 	svcne	0x00709102
    1d7c:	0000031d 	andeq	r0, r0, sp, lsl r3
    1d80:	0902df01 	stmdbeq	r2, {r0, r8, r9, sl, fp, ip, lr, pc}
    1d84:	0000035a 	andeq	r0, r0, sl, asr r3
    1d88:	00689102 	rsbeq	r9, r8, r2, lsl #2
    1d8c:	00097e1e 	andeq	r7, r9, lr, lsl lr
    1d90:	02b70100 	adcseq	r0, r7, #0, 2
    1d94:	00008105 	andeq	r8, r0, r5, lsl #2
    1d98:	00971000 	addseq	r1, r7, r0
    1d9c:	00013800 	andeq	r3, r1, r0, lsl #16
    1da0:	d29c0100 	addsle	r0, ip, #0, 2
    1da4:	1b00001c 	blne	1e1c <_start-0x61e4>
    1da8:	006d6573 	rsbeq	r6, sp, r3, ror r5
    1dac:	1202b701 	andne	fp, r2, #262144	; 0x40000
    1db0:	00000408 	andeq	r0, r0, r8, lsl #8
    1db4:	1f649102 	svcne	0x00649102
    1db8:	0000061b 	andeq	r0, r0, fp, lsl r6
    1dbc:	0802b901 	stmdaeq	r2, {r0, r8, fp, ip, sp, pc}
    1dc0:	00000081 	andeq	r0, r0, r1, lsl #1
    1dc4:	16709102 	ldrbtne	r9, [r0], -r2, lsl #2
    1dc8:	006d6f70 	rsbeq	r6, sp, r0, ror pc
    1dcc:	0f02b901 	svceq	0x0002b901
    1dd0:	00000081 	andeq	r0, r0, r1, lsl #1
    1dd4:	1f749102 	svcne	0x00749102
    1dd8:	0000031d 	andeq	r0, r0, sp, lsl r3
    1ddc:	0902ba01 	stmdbeq	r2, {r0, r9, fp, ip, sp, pc}
    1de0:	0000035a 	andeq	r0, r0, sl, asr r3
    1de4:	006c9102 	rsbeq	r9, ip, r2, lsl #2
    1de8:	0007cd1e 	andeq	ip, r7, lr, lsl sp
    1dec:	02a90100 	adceq	r0, r9, #0, 2
    1df0:	00008105 	andeq	r8, r0, r5, lsl #2
    1df4:	0096ac00 	addseq	sl, r6, r0, lsl #24
    1df8:	00006400 	andeq	r6, r0, r0, lsl #8
    1dfc:	2b9c0100 	blcs	fe702204 <_stack+0xfe682204>
    1e00:	1b00001d 	blne	1e7c <_start-0x6184>
    1e04:	006d6573 	rsbeq	r6, sp, r3, ror r5
    1e08:	1602a901 	strne	sl, [r2], -r1, lsl #18
    1e0c:	00000408 	andeq	r0, r0, r8, lsl #8
    1e10:	1f6c9102 	svcne	0x006c9102
    1e14:	0000061b 	andeq	r0, r0, fp, lsl r6
    1e18:	0902ab01 	stmdbeq	r2, {r0, r8, r9, fp, sp, pc}
    1e1c:	00000081 	andeq	r0, r0, r1, lsl #1
    1e20:	16709102 	ldrbtne	r9, [r0], -r2, lsl #2
    1e24:	006d6f70 	rsbeq	r6, sp, r0, ror pc
    1e28:	1002ab01 	andne	sl, r2, r1, lsl #22
    1e2c:	00000081 	andeq	r0, r0, r1, lsl #1
    1e30:	23749102 	cmncs	r4, #-2147483648	; 0x80000000
    1e34:	0000031d 	andeq	r0, r0, sp, lsl r3
    1e38:	0b02ac01 	bleq	ace44 <_stack+0x2ce44>
    1e3c:	0000035a 	andeq	r0, r0, sl, asr r3
    1e40:	07d01e00 	ldrbeq	r1, [r0, r0, lsl #28]
    1e44:	85010000 	strhi	r0, [r1, #-0]
    1e48:	00810502 	addeq	r0, r1, r2, lsl #10
    1e4c:	95740000 	ldrbls	r0, [r4, #-0]!
    1e50:	01380000 	teqeq	r8, r0
    1e54:	9c010000 	stcls	0, cr0, [r1], {-0}
    1e58:	00001d87 	andeq	r1, r0, r7, lsl #27
    1e5c:	6d65731b 	stclvs	3, cr7, [r5, #-108]!	; 0xffffff94
    1e60:	02850100 	addeq	r0, r5, #0, 2
    1e64:	00040813 	andeq	r0, r4, r3, lsl r8
    1e68:	64910200 	ldrvs	r0, [r1], #512	; 0x200
    1e6c:	00061b1f 	andeq	r1, r6, pc, lsl fp
    1e70:	02870100 	addeq	r0, r7, #0, 2
    1e74:	00008109 	andeq	r8, r0, r9, lsl #2
    1e78:	70910200 	addsvc	r0, r1, r0, lsl #4
    1e7c:	6d6f7016 	stclvs	0, cr7, [pc, #-88]!	; 1e2c <_start-0x61d4>
    1e80:	02870100 	addeq	r0, r7, #0, 2
    1e84:	00008110 	andeq	r8, r0, r0, lsl r1
    1e88:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    1e8c:	00031d1f 	andeq	r1, r3, pc, lsl sp
    1e90:	02880100 	addeq	r0, r8, #0, 2
    1e94:	00035a0b 	andeq	r5, r3, fp, lsl #20
    1e98:	6c910200 	lfmvs	f0, 4, [r1], {0}
    1e9c:	06422100 	strbeq	r2, [r2], -r0, lsl #2
    1ea0:	7f010000 	svcvc	0x00010000
    1ea4:	95280602 	strls	r0, [r8, #-1538]!	; 0xfffff9fe
    1ea8:	004c0000 	subeq	r0, ip, r0
    1eac:	9c010000 	stcls	0, cr0, [r1], {-0}
    1eb0:	00001dbf 			; <UNDEFINED> instruction: 0x00001dbf
    1eb4:	6d65731b 	stclvs	3, cr7, [r5, #-108]!	; 0xffffff94
    1eb8:	027f0100 	rsbseq	r0, pc, #0, 2
    1ebc:	00040813 	andeq	r0, r4, r3, lsl r8
    1ec0:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    1ec4:	0008371c 	andeq	r3, r8, ip, lsl r7
    1ec8:	027f0100 	rsbseq	r0, pc, #0, 2
    1ecc:	0000811c 	andeq	r8, r0, ip, lsl r1
    1ed0:	70910200 	addsvc	r0, r1, r0, lsl #4
    1ed4:	05722500 	ldrbeq	r2, [r2, #-1280]!	; 0xfffffb00
    1ed8:	77010000 	strvc	r0, [r1, -r0]
    1edc:	021e0702 	andseq	r0, lr, #524288	; 0x80000
    1ee0:	94e40000 	strbtls	r0, [r4], #0
    1ee4:	00440000 	subeq	r0, r4, r0
    1ee8:	9c010000 	stcls	0, cr0, [r1], {-0}
    1eec:	0003ba1e 	andeq	fp, r3, lr, lsl sl
    1ef0:	02660100 	rsbeq	r0, r6, #0, 2
    1ef4:	00008105 	andeq	r8, r0, r5, lsl #2
    1ef8:	0093fc00 	addseq	pc, r3, r0, lsl #24
    1efc:	0000e800 	andeq	lr, r0, r0, lsl #16
    1f00:	129c0100 	addsne	r0, ip, #0, 2
    1f04:	1c00001e 	stcne	0, cr0, [r0], {30}
    1f08:	00000565 	andeq	r0, r0, r5, ror #10
    1f0c:	12026601 	andne	r6, r2, #1048576	; 0x100000
    1f10:	00000081 	andeq	r0, r0, r1, lsl #1
    1f14:	1f6c9102 	svcne	0x006c9102
    1f18:	0000061b 	andeq	r0, r0, fp, lsl r6
    1f1c:	08026801 	stmdaeq	r2, {r0, fp, sp, lr}
    1f20:	00000081 	andeq	r0, r0, r1, lsl #1
    1f24:	00749102 	rsbseq	r9, r4, r2, lsl #2
    1f28:	0001fb1e 	andeq	pc, r1, lr, lsl fp	; <UNPREDICTABLE>
    1f2c:	024d0100 	subeq	r0, sp, #0, 2
    1f30:	00008105 	andeq	r8, r0, r5, lsl #2
    1f34:	00925c00 	addseq	r5, r2, r0, lsl #24
    1f38:	0001a000 	andeq	sl, r1, r0
    1f3c:	5e9c0100 	fmlple	f0, f4, f0
    1f40:	1c00001e 	stcne	0, cr0, [r0], {30}
    1f44:	00000565 	andeq	r0, r0, r5, ror #10
    1f48:	10024d01 	andne	r4, r2, r1, lsl #26
    1f4c:	00000081 	andeq	r0, r0, r1, lsl #1
    1f50:	1c6c9102 	stfnep	f1, [ip], #-8
    1f54:	000007f3 	strdeq	r0, [r0], -r3
    1f58:	22024d01 	andcs	r4, r2, #1, 26	; 0x40
    1f5c:	00000081 	andeq	r0, r0, r1, lsl #1
    1f60:	1f689102 	svcne	0x00689102
    1f64:	0000061b 	andeq	r0, r0, fp, lsl r6
    1f68:	09025001 	stmdbeq	r2, {r0, ip, lr}
    1f6c:	00000081 	andeq	r0, r0, r1, lsl #1
    1f70:	00749102 	rsbseq	r9, r4, r2, lsl #2
    1f74:	00091e1a 	andeq	r1, r9, sl, lsl lr
    1f78:	02370100 	eorseq	r0, r7, #0, 2
    1f7c:	00917c06 	addseq	r7, r1, r6, lsl #24
    1f80:	0000e000 	andeq	lr, r0, r0
    1f84:	849c0100 	ldrhi	r0, [ip], #256	; 0x100
    1f88:	1600001e 			; <UNDEFINED> instruction: 0x1600001e
    1f8c:	39010069 	stmdbcc	r1, {r0, r3, r5, r6}
    1f90:	00810902 	addeq	r0, r1, r2, lsl #18
    1f94:	91020000 	mrsls	r0, (UNDEF: 2)
    1f98:	001a0074 	andseq	r0, sl, r4, ror r0
    1f9c:	01000005 	tsteq	r0, r5
    1fa0:	e4060224 	str	r0, [r6], #-548	; 0xfffffddc
    1fa4:	98000090 	stmdals	r0, {r4, r7}
    1fa8:	01000000 	mrseq	r0, (UNDEF: 0)
    1fac:	001eac9c 	mulseq	lr, ip, ip
    1fb0:	061b1f00 	ldreq	r1, [fp], -r0, lsl #30
    1fb4:	26010000 	strcs	r0, [r1], -r0
    1fb8:	00810902 	addeq	r0, r1, r2, lsl #18
    1fbc:	91020000 	mrsls	r0, (UNDEF: 2)
    1fc0:	8b1e0074 	blhi	782198 <_stack+0x702198>
    1fc4:	01000008 	tsteq	r0, r8
    1fc8:	810501cf 	smlabthi	r5, pc, r1, r0	; <UNPREDICTABLE>
    1fcc:	c0000000 	andgt	r0, r0, r0
    1fd0:	2400008c 	strcs	r0, [r0], #-140	; 0xffffff74
    1fd4:	01000004 	tsteq	r0, r4
    1fd8:	001f159c 	mulseq	pc, ip, r5	; <UNPREDICTABLE>
    1fdc:	05951c00 	ldreq	r1, [r5, #3072]	; 0xc00
    1fe0:	cf010000 	svcgt	0x00010000
    1fe4:	00811101 	addeq	r1, r1, r1, lsl #2
    1fe8:	91020000 	mrsls	r0, (UNDEF: 2)
    1fec:	065f1c6c 	ldrbeq	r1, [pc], -ip, ror #24
    1ff0:	cf010000 	svcgt	0x00010000
    1ff4:	00811b01 	addeq	r1, r1, r1, lsl #22
    1ff8:	91020000 	mrsls	r0, (UNDEF: 2)
    1ffc:	061b2368 	ldreq	r2, [fp], -r8, ror #6
    2000:	d1010000 	mrsle	r0, (UNDEF: 1)
    2004:	00810901 	addeq	r0, r1, r1, lsl #18
    2008:	ed1f0000 	ldc	0, cr0, [pc, #-0]	; 2010 <_start-0x5ff0>
    200c:	01000004 	tsteq	r0, r4
    2010:	811001d1 			; <UNDEFINED> instruction: 0x811001d1
    2014:	02000000 	andeq	r0, r0, #0
    2018:	3f1f7091 	svccc	0x001f7091
    201c:	0100000a 	tsteq	r0, sl
    2020:	5a0d01d2 	bpl	342770 <_stack+0x2c2770>
    2024:	02000003 	andeq	r0, r0, #3
    2028:	1a007491 	bne	1f274 <__bss_end__+0xef28>
    202c:	00000935 	andeq	r0, r0, r5, lsr r9
    2030:	0601c101 	streq	ip, [r1], -r1, lsl #2
    2034:	00008c64 	andeq	r8, r0, r4, ror #24
    2038:	0000005c 	andeq	r0, r0, ip, asr r0
    203c:	1f4d9c01 	svcne	0x004d9c01
    2040:	1b1f0000 	blne	7c2048 <_stack+0x742048>
    2044:	01000006 	tsteq	r0, r6
    2048:	810801c3 	smlabthi	r8, r3, r1, r0
    204c:	02000000 	andeq	r0, r0, #0
    2050:	6f1f7491 	svcvs	0x001f7491
    2054:	0100000b 	tsteq	r0, fp
    2058:	420b01c4 	andmi	r0, fp, #196, 2	; 0x31
    205c:	02000003 	andeq	r0, r0, #3
    2060:	1d007091 	stcne	0, cr7, [r0, #-580]	; 0xfffffdbc
    2064:	00000bc9 	andeq	r0, r0, r9, asr #23
    2068:	0d01a901 	vstreq.16	s20, [r1, #-2]	; <UNPREDICTABLE>
    206c:	00008c0c 	andeq	r8, r0, ip, lsl #24
    2070:	00000058 	andeq	r0, r0, r8, asr r0
    2074:	1faf9c01 	svcne	0x00af9c01
    2078:	251c0000 	ldrcs	r0, [ip, #-0]
    207c:	01000003 	tsteq	r0, r3
    2080:	1e2301a9 	sufnedp	f0, f3, #1.0
    2084:	03000002 	movweq	r0, #2
    2088:	237fac91 	cmncs	pc, #37120	; 0x9100
    208c:	0000061b 	andeq	r0, r0, fp, lsl r6
    2090:	0901ab01 	stmdbeq	r1, {r0, r8, r9, fp, sp, pc}
    2094:	00000081 	andeq	r0, r0, r1, lsl #1
    2098:	0005b61f 	andeq	fp, r5, pc, lsl r6
    209c:	01ad0100 			; <UNDEFINED> instruction: 0x01ad0100
    20a0:	001faf09 	andseq	sl, pc, r9, lsl #30
    20a4:	b8910300 	ldmlt	r1, {r8, r9}
    20a8:	8c38247f 	cfldrshi	mvf2, [r8], #-508	; 0xfffffe04
    20ac:	00240000 	eoreq	r0, r4, r0
    20b0:	db1f0000 	blle	7c20b8 <_stack+0x7420b8>
    20b4:	01000009 	tsteq	r0, r9
    20b8:	811401b7 			; <UNDEFINED> instruction: 0x811401b7
    20bc:	03000000 	movweq	r0, #0
    20c0:	007fb491 			; <UNDEFINED> instruction: 0x007fb491
    20c4:	00941300 	addseq	r1, r4, r0, lsl #6
    20c8:	1fbf0000 	svcne	0x00bf0000
    20cc:	8d140000 	ldchi	0, cr0, [r4, #-0]
    20d0:	3f000000 	svccc	0x00000000
    20d4:	083d2600 	ldmdaeq	sp!, {r9, sl, sp}
    20d8:	9c010000 	stcls	0, cr0, [r1], {-0}
    20dc:	8bf80d01 	blhi	ffe054e8 <_stack+0xffd854e8>
    20e0:	00140000 	andseq	r0, r4, r0
    20e4:	9c010000 	stcls	0, cr0, [r1], {-0}
    20e8:	00001fe7 	andeq	r1, r0, r7, ror #31
    20ec:	0003251c 	andeq	r2, r3, ip, lsl r5
    20f0:	019c0100 	orrseq	r0, ip, r0, lsl #2
    20f4:	00021e1d 	andeq	r1, r2, sp, lsl lr
    20f8:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    20fc:	07081e00 	streq	r1, [r8, -r0, lsl #28]
    2100:	7a010000 	bvc	42108 <__bss_end__+0x31dbc>
    2104:	00810501 	addeq	r0, r1, r1, lsl #10
    2108:	8ac40000 	bhi	ff102110 <_stack+0xff082110>
    210c:	01340000 	teqeq	r4, r0
    2110:	9c010000 	stcls	0, cr0, [r1], {-0}
    2114:	0000203d 	andeq	r2, r0, sp, lsr r0
    2118:	0005651c 	andeq	r6, r5, ip, lsl r5
    211c:	017a0100 	cmneq	sl, r0, lsl #2
    2120:	00008114 	andeq	r8, r0, r4, lsl r1
    2124:	64910200 	ldrvs	r0, [r1], #512	; 0x200
    2128:	008b7824 	addeq	r7, fp, r4, lsr #16
    212c:	00005c00 	andeq	r5, r0, r0, lsl #24
    2130:	656c1600 	strbvs	r1, [ip, #-1536]!	; 0xfffffa00
    2134:	8501006e 	strhi	r0, [r1, #-110]	; 0xffffff92
    2138:	00810e01 	addeq	r0, r1, r1, lsl #28
    213c:	91020000 	mrsls	r0, (UNDEF: 2)
    2140:	05b61f74 	ldreq	r1, [r6, #3956]!	; 0xf74
    2144:	86010000 	strhi	r0, [r1], -r0
    2148:	203d0f01 	eorscs	r0, sp, r1, lsl #30
    214c:	91020000 	mrsls	r0, (UNDEF: 2)
    2150:	13000068 	movwne	r0, #104	; 0x68
    2154:	00000217 	andeq	r0, r0, r7, lsl r2
    2158:	0000204d 	andeq	r2, r0, sp, asr #32
    215c:	00008d14 	andeq	r8, r0, r4, lsl sp
    2160:	1d000900 	vstrne.16	s0, [r0, #-0]	; <UNPREDICTABLE>
    2164:	000004c7 	andeq	r0, r0, r7, asr #9
    2168:	0d016201 	sfmeq	f6, 4, [r1, #-4]
    216c:	00008948 	andeq	r8, r0, r8, asr #18
    2170:	0000017c 	andeq	r0, r0, ip, ror r1
    2174:	20759c01 	rsbscs	r9, r5, r1, lsl #24
    2178:	651c0000 	ldrvs	r0, [ip, #-0]
    217c:	01000005 	tsteq	r0, r5
    2180:	81200162 			; <UNDEFINED> instruction: 0x81200162
    2184:	02000000 	andeq	r0, r0, #0
    2188:	1e007491 	mcrne	4, 0, r7, cr0, cr1, {4}
    218c:	00000b8a 	andeq	r0, r0, sl, lsl #23
    2190:	05011b01 	streq	r1, [r1, #-2817]	; 0xfffff4ff
    2194:	00000081 	andeq	r0, r0, r1, lsl #1
    2198:	000085e0 	andeq	r8, r0, r0, ror #11
    219c:	00000368 	andeq	r0, r0, r8, ror #6
    21a0:	211f9c01 	tstcs	pc, r1, lsl #24
    21a4:	661b0000 	ldrvs	r0, [fp], -r0
    21a8:	01006e75 	tsteq	r0, r5, ror lr
    21ac:	4219011b 	andsmi	r0, r9, #-1073741818	; 0xc0000006
    21b0:	02000003 	andeq	r0, r0, #3
    21b4:	2c1c5c91 	ldccs	12, cr5, [ip], {145}	; 0x91
    21b8:	0100000b 	tsteq	r0, fp
    21bc:	812a011b 			; <UNDEFINED> instruction: 0x812a011b
    21c0:	02000000 	andeq	r0, r0, #0
    21c4:	751c5891 	ldrvc	r5, [ip, #-2193]	; 0xfffff76f
    21c8:	01000005 	tsteq	r0, r5
    21cc:	1e39011b 	mrcne	1, 1, r0, cr9, cr11, {0}
    21d0:	02000002 	andeq	r0, r0, #2
    21d4:	a31c5491 	tstge	ip, #-1862270976	; 0x91000000
    21d8:	0100000a 	tsteq	r0, sl
    21dc:	8145011b 	cmphi	r5, fp, lsl r1
    21e0:	02000000 	andeq	r0, r0, #0
    21e4:	69165091 	ldmdbvs	r6, {r0, r4, r7, ip, lr}
    21e8:	011d0100 	tsteq	sp, r0, lsl #2
    21ec:	00008108 	andeq	r8, r0, r8, lsl #2
    21f0:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    21f4:	00061b1f 	andeq	r1, r6, pc, lsl fp
    21f8:	011d0100 	tsteq	sp, r0, lsl #2
    21fc:	0000810b 	andeq	r8, r0, fp, lsl #2
    2200:	64910200 	ldrvs	r0, [r1], #512	; 0x200
    2204:	0005651f 	andeq	r6, r5, pc, lsl r5
    2208:	011d0100 	tsteq	sp, r0, lsl #2
    220c:	00008112 	andeq	r8, r0, r2, lsl r1
    2210:	70910200 	addsvc	r0, r1, r0, lsl #4
    2214:	000b051f 	andeq	r0, fp, pc, lsl r5
    2218:	011e0100 	tsteq	lr, r0, lsl #2
    221c:	00021e0c 	andeq	r1, r2, ip, lsl #28
    2220:	6c910200 	lfmvs	f0, 4, [r1], {0}
    2224:	000a3f1f 	andeq	r3, sl, pc, lsl pc
    2228:	011f0100 	tsteq	pc, r0, lsl #2
    222c:	00035a0c 	andeq	r5, r3, ip, lsl #20
    2230:	68910200 	ldmvs	r1, {r9}
    2234:	0a7f2000 	beq	1fca23c <_stack+0x1f4a23c>
    2238:	0f010000 	svceq	0x00010000
    223c:	00810501 	addeq	r0, r1, r1, lsl #10
    2240:	858c0000 	strhi	r0, [ip]
    2244:	00540000 	subseq	r0, r4, r0
    2248:	9c010000 	stcls	0, cr0, [r1], {-0}
    224c:	0000214b 	andeq	r2, r0, fp, asr #2
    2250:	6d6f7016 	stclvs	0, cr7, [pc, #-88]!	; 2200 <_start-0x5e00>
    2254:	01110100 	tsteq	r1, r0, lsl #2
    2258:	00008109 	andeq	r8, r0, r9, lsl #2
    225c:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    2260:	0a011a00 	beq	48a68 <__bss_end__+0x3871c>
    2264:	00010000 	andeq	r0, r1, r0
    2268:	84fc0601 	ldrbthi	r0, [ip], #1537	; 0x601
    226c:	00900000 	addseq	r0, r0, r0
    2270:	9c010000 	stcls	0, cr0, [r1], {-0}
    2274:	00002173 	andeq	r2, r0, r3, ror r1
    2278:	00061b1f 	andeq	r1, r6, pc, lsl fp
    227c:	01020100 	mrseq	r0, (UNDEF: 18)
    2280:	00008108 	andeq	r8, r0, r8, lsl #2
    2284:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    2288:	09522700 	ldmdbeq	r2, {r8, r9, sl, sp}^
    228c:	f1010000 	setend	le
    2290:	00848c06 	addeq	r8, r4, r6, lsl #24
    2294:	00007000 	andeq	r7, r0, r0
    2298:	a89c0100 	ldmge	ip, {r8}
    229c:	12000021 	andne	r0, r0, #33	; 0x21
    22a0:	0000061b 	andeq	r0, r0, fp, lsl r6
    22a4:	8108f301 	tsthi	r8, r1, lsl #6	; <UNPREDICTABLE>
    22a8:	02000000 	andeq	r0, r0, #0
    22ac:	72287091 	eorvc	r7, r8, #145	; 0x91
    22b0:	01007465 	tsteq	r0, r5, ror #8
    22b4:	00810ff3 	strdeq	r0, [r1], r3
    22b8:	91020000 	mrsls	r0, (UNDEF: 2)
    22bc:	d8290074 	stmdale	r9!, {r2, r4, r5, r6}
    22c0:	01000008 	tsteq	r0, r8
    22c4:	836406c8 	cmnhi	r4, #200, 12	; 0xc800000
    22c8:	01280000 			; <UNDEFINED> instruction: 0x01280000
    22cc:	9c010000 	stcls	0, cr0, [r1], {-0}
    22d0:	00002208 	andeq	r2, r0, r8, lsl #4
    22d4:	0007fc2a 	andeq	pc, r7, sl, lsr #24
    22d8:	23c80100 	biccs	r0, r8, #0, 2
    22dc:	00002208 	andeq	r2, r0, r8, lsl #4
    22e0:	2a6c9102 	bcs	1b266f0 <_stack+0x1aa66f0>
    22e4:	00000806 	andeq	r0, r0, r6, lsl #16
    22e8:	082fc801 	stmdaeq	pc!, {r0, fp, lr, pc}	; <UNPREDICTABLE>
    22ec:	02000022 	andeq	r0, r0, #34	; 0x22
    22f0:	de2a6891 	mcrle	8, 1, r6, cr10, cr1, {4}
    22f4:	01000006 	tsteq	r0, r6
    22f8:	035a3ac8 	cmpeq	sl, #200, 20	; 0xc8000
    22fc:	91020000 	mrsls	r0, (UNDEF: 2)
    2300:	31702864 	cmncc	r0, r4, ror #16
    2304:	08ca0100 	stmiaeq	sl, {r8}^
    2308:	0000035a 	andeq	r0, r0, sl, asr r3
    230c:	28749102 	ldmdacs	r4!, {r1, r8, ip, pc}^
    2310:	01003270 	tsteq	r0, r0, ror r2
    2314:	035a0bca 	cmpeq	sl, #206848	; 0x32800
    2318:	91020000 	mrsls	r0, (UNDEF: 2)
    231c:	04090070 	streq	r0, [r9], #-112	; 0xffffff90
    2320:	0000035a 	andeq	r0, r0, sl, asr r3
    2324:	000a4729 	andeq	r4, sl, r9, lsr #14
    2328:	069f0100 	ldreq	r0, [pc], r0, lsl #2
    232c:	0000821c 	andeq	r8, r0, ip, lsl r2
    2330:	00000148 	andeq	r0, r0, r8, asr #2
    2334:	22509c01 	subscs	r9, r0, #256	; 0x100
    2338:	de2a0000 	cdple	0, 2, cr0, cr10, cr0, {0}
    233c:	01000006 	tsteq	r0, r6
    2340:	035a119f 	cmpeq	sl, #-1073741785	; 0xc0000027
    2344:	91020000 	mrsls	r0, (UNDEF: 2)
    2348:	3170286c 	cmncc	r0, ip, ror #16
    234c:	08a00100 	stmiaeq	r0!, {r8}
    2350:	0000035a 	andeq	r0, r0, sl, asr r3
    2354:	28749102 	ldmdacs	r4!, {r1, r8, ip, pc}^
    2358:	01003270 	tsteq	r0, r0, ror r2
    235c:	035a0ba0 	cmpeq	sl, #160, 22	; 0x28000
    2360:	91020000 	mrsls	r0, (UNDEF: 2)
    2364:	47290070 			; <UNDEFINED> instruction: 0x47290070
    2368:	01000006 	tsteq	r0, r6
    236c:	81e80697 			; <UNDEFINED> instruction: 0x81e80697
    2370:	00340000 	eorseq	r0, r4, r0
    2374:	9c010000 	stcls	0, cr0, [r1], {-0}
    2378:	00002276 	andeq	r2, r0, r6, ror r2
    237c:	00061b2a 	andeq	r1, r6, sl, lsr #22
    2380:	15970100 	ldrne	r0, [r7, #256]	; 0x100
    2384:	00000081 	andeq	r0, r0, r1, lsl #1
    2388:	00749102 	rsbseq	r9, r4, r2, lsl #2
    238c:	0005da2b 	andeq	sp, r5, fp, lsr #20
    2390:	058e0100 	streq	r0, [lr, #256]	; 0x100
    2394:	00000081 	andeq	r0, r0, r1, lsl #1
    2398:	000081c0 	andeq	r8, r0, r0, asr #3
    239c:	00000028 	andeq	r0, r0, r8, lsr #32
    23a0:	1b129c01 	blne	4a93ac <_stack+0x4293ac>
    23a4:	01000006 	tsteq	r0, r6
    23a8:	0081078f 	addeq	r0, r1, pc, lsl #15
    23ac:	91020000 	mrsls	r0, (UNDEF: 2)
    23b0:	44000074 	strmi	r0, [r0], #-116	; 0xffffff8c
    23b4:	04000001 	streq	r0, [r0], #-1
    23b8:	00038d00 	andeq	r8, r3, r0, lsl #26
    23bc:	ce010400 	cfcpysgt	mvf0, mvf1
    23c0:	0c000000 	stceq	0, cr0, [r0], {-0}
    23c4:	00000cd4 	ldrdeq	r0, [r0], -r4
    23c8:	0000003d 	andeq	r0, r0, sp, lsr r0
    23cc:	0000ecfc 	strdeq	lr, [r0], -ip
    23d0:	0000003c 	andeq	r0, r0, ip, lsr r0
    23d4:	00002137 	andeq	r2, r0, r7, lsr r1
    23d8:	c2060102 	andgt	r0, r6, #-2147483648	; 0x80000000
    23dc:	02000000 	andeq	r0, r0, #0
    23e0:	01c30502 	biceq	r0, r3, r2, lsl #10
    23e4:	04020000 	streq	r0, [r2], #-0
    23e8:	00007c05 	andeq	r7, r0, r5, lsl #24
    23ec:	05080200 	streq	r0, [r8, #-512]	; 0xfffffe00
    23f0:	00000077 	andeq	r0, r0, r7, ror r0
    23f4:	c0080102 	andgt	r0, r8, r2, lsl #2
    23f8:	02000000 	andeq	r0, r0, #0
    23fc:	01b00702 	lslseq	r0, r2, #14
    2400:	7c030000 	stcvc	0, cr0, [r3], {-0}
    2404:	03000004 	movweq	r0, #4
    2408:	00601934 	rsbeq	r1, r0, r4, lsr r9
    240c:	4f040000 	svcmi	0x00040000
    2410:	02000000 	andeq	r0, r0, #0
    2414:	00ae0704 	adceq	r0, lr, r4, lsl #14
    2418:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
    241c:	0000a907 	andeq	sl, r0, r7, lsl #18
    2420:	05040500 	streq	r0, [r4, #-1280]	; 0xfffffb00
    2424:	00746e69 	rsbseq	r6, r4, r9, ror #28
    2428:	b3070402 	movwlt	r0, #29698	; 0x7402
    242c:	06000000 	streq	r0, [r0], -r0
    2430:	09310224 	ldmdbeq	r1!, {r2, r5, r9}
    2434:	000000fb 	strdeq	r0, [r0], -fp
    2438:	000c8b07 	andeq	r8, ip, r7, lsl #22
    243c:	17370200 	ldrne	r0, [r7, -r0, lsl #4]!
    2440:	0000005b 	andeq	r0, r0, fp, asr r0
    2444:	11e90700 	mvnne	r0, r0, lsl #14
    2448:	3e020000 	cdpcc	0, 0, cr0, cr2, cr0, {0}
    244c:	00005b17 	andeq	r5, r0, r7, lsl fp
    2450:	36070400 	strcc	r0, [r7], -r0, lsl #8
    2454:	0200000d 	andeq	r0, r0, #13
    2458:	005b1745 	subseq	r1, fp, r5, asr #14
    245c:	07080000 	streq	r0, [r8, -r0]
    2460:	00000d4f 	andeq	r0, r0, pc, asr #26
    2464:	5b174a02 	blpl	5d4c74 <_stack+0x554c74>
    2468:	0c000000 	stceq	0, cr0, [r0], {-0}
    246c:	000cc307 	andeq	ip, ip, r7, lsl #6
    2470:	17540200 	ldrbne	r0, [r4, -r0, lsl #4]
    2474:	0000005b 	andeq	r0, r0, fp, asr r0
    2478:	0cca0710 	stcleq	7, cr0, [sl], {16}
    247c:	5b020000 	blpl	82484 <_stack+0x2484>
    2480:	00005b17 	andeq	r5, r0, r7, lsl fp
    2484:	90071400 	andls	r1, r7, r0, lsl #8
    2488:	0200000c 	andeq	r0, r0, #12
    248c:	005b1762 	subseq	r1, fp, r2, ror #14
    2490:	07180000 	ldreq	r0, [r8, -r0]
    2494:	00000d18 	andeq	r0, r0, r8, lsl sp
    2498:	5b176d02 	blpl	5dd8a8 <_stack+0x55d8a8>
    249c:	1c000000 	stcne	0, cr0, [r0], {-0}
    24a0:	000d2307 	andeq	r2, sp, r7, lsl #6
    24a4:	177b0200 	ldrbne	r0, [fp, -r0, lsl #4]!
    24a8:	0000005b 	andeq	r0, r0, fp, asr r0
    24ac:	a7030020 	strge	r0, [r3, -r0, lsr #32]
    24b0:	0200000c 	andeq	r0, r0, #12
    24b4:	007c077d 	rsbseq	r0, ip, sp, ror r7
    24b8:	b7080000 	strlt	r0, [r8, -r0]
    24bc:	0100000c 	tsteq	r0, ip
    24c0:	01191910 	tsteq	r9, r0, lsl r9
    24c4:	03050000 	movweq	r0, #20480	; 0x5000
    24c8:	0000febc 			; <UNDEFINED> instruction: 0x0000febc
    24cc:	00fb0409 	rscseq	r0, fp, r9, lsl #8
    24d0:	3e0a0000 	cdpcc	0, 0, cr0, cr10, cr0, {0}
    24d4:	0100000d 	tsteq	r0, sp
    24d8:	ed200616 	stc	6, cr0, [r0, #-88]!	; 0xffffffa8
    24dc:	00180000 	andseq	r0, r8, r0
    24e0:	9c010000 	stcls	0, cr0, [r1], {-0}
    24e4:	000c970b 	andeq	r9, ip, fp, lsl #14
    24e8:	12120100 	andsne	r0, r2, #0, 2
    24ec:	00000119 	andeq	r0, r0, r9, lsl r1
    24f0:	0000ecfc 	strdeq	lr, [r0], -ip
    24f4:	00000024 	andeq	r0, r0, r4, lsr #32
    24f8:	29009c01 	stmdbcs	r0, {r0, sl, fp, ip, pc}
    24fc:	04000005 	streq	r0, [r0], #-5
    2500:	00043d00 	andeq	r3, r4, r0, lsl #26
    2504:	ce010400 	cfcpysgt	mvf0, mvf1
    2508:	0c000000 	stceq	0, cr0, [r0], {-0}
    250c:	00000e0e 	andeq	r0, r0, lr, lsl #28
    2510:	0000003d 	andeq	r0, r0, sp, lsr r0
    2514:	0000ed38 	andeq	lr, r0, r8, lsr sp
    2518:	000003c0 	andeq	r0, r0, r0, asr #7
    251c:	000021ff 	strdeq	r2, [r0], -pc	; <UNPREDICTABLE>
    2520:	c2060102 	andgt	r0, r6, #-2147483648	; 0x80000000
    2524:	02000000 	andeq	r0, r0, #0
    2528:	01c30502 	biceq	r0, r3, r2, lsl #10
    252c:	04020000 	streq	r0, [r2], #-0
    2530:	00007c05 	andeq	r7, r0, r5, lsl #24
    2534:	05080200 	streq	r0, [r8, #-512]	; 0xfffffe00
    2538:	00000077 	andeq	r0, r0, r7, ror r0
    253c:	c0080102 	andgt	r0, r8, r2, lsl #2
    2540:	02000000 	andeq	r0, r0, #0
    2544:	01b00702 	lslseq	r0, r2, #14
    2548:	7c030000 	stcvc	0, cr0, [r3], {-0}
    254c:	03000004 	movweq	r0, #4
    2550:	005b1934 	subseq	r1, fp, r4, lsr r9
    2554:	04020000 	streq	r0, [r2], #-0
    2558:	0000ae07 	andeq	sl, r0, r7, lsl #28
    255c:	07080200 	streq	r0, [r8, -r0, lsl #4]
    2560:	000000a9 	andeq	r0, r0, r9, lsr #1
    2564:	69050404 	stmdbvs	r5, {r2, sl}
    2568:	0500746e 	streq	r7, [r0, #-1134]	; 0xfffffb92
    256c:	00000069 	andeq	r0, r0, r9, rrx
    2570:	b3070402 	movwlt	r0, #29698	; 0x7402
    2574:	05000000 	streq	r0, [r0, #-0]
    2578:	00000075 	andeq	r0, r0, r5, ror r0
    257c:	7e02d806 	cdpvc	8, 0, cr13, cr2, cr6, {0}
    2580:	0001dd09 	andeq	sp, r1, r9, lsl #26
    2584:	52490700 	subpl	r0, r9, #0, 14
    2588:	7f020051 	svcvc	0x00020051
    258c:	00007c1b 	andeq	r7, r0, fp, lsl ip
    2590:	75080000 	strvc	r0, [r8, #-0]
    2594:	0200000e 	andeq	r0, r0, #14
    2598:	007c1b80 	rsbseq	r1, ip, r0, lsl #23
    259c:	08040000 	stmdaeq	r4, {}	; <UNPREDICTABLE>
    25a0:	00000edd 	ldrdeq	r0, [r0], -sp
    25a4:	ed1b8202 	lfm	f0, 1, [fp, #-8]
    25a8:	08000001 	stmdaeq	r0, {r0}
    25ac:	000d5f08 	andeq	r5, sp, r8, lsl #30
    25b0:	1b840200 	blne	fe102db8 <_stack+0xfe082db8>
    25b4:	0000007c 	andeq	r0, r0, ip, ror r0
    25b8:	0e7d0840 	cdpeq	8, 7, cr0, cr13, cr0, {2}
    25bc:	85020000 	strhi	r0, [r2, #-0]
    25c0:	00007c1b 	andeq	r7, r0, fp, lsl ip
    25c4:	9b084400 	blls	2135cc <_stack+0x1935cc>
    25c8:	0200000d 	andeq	r0, r0, #13
    25cc:	007c1b86 	rsbseq	r1, ip, r6, lsl #23
    25d0:	08480000 	stmdaeq	r8, {}^	; <UNPREDICTABLE>
    25d4:	00000ed6 	ldrdeq	r0, [r0], -r6
    25d8:	7c1b8702 	ldcvc	7, cr8, [fp], {2}
    25dc:	4c000000 	stcmi	0, cr0, [r0], {-0}
    25e0:	000e8908 	andeq	r8, lr, r8, lsl #18
    25e4:	1b880200 	blne	fe202dec <_stack+0xfe182dec>
    25e8:	0000007c 	andeq	r0, r0, ip, ror r0
    25ec:	0d580850 	ldcleq	8, cr0, [r8, #-320]	; 0xfffffec0
    25f0:	89020000 	stmdbhi	r2, {}	; <UNPREDICTABLE>
    25f4:	00007c1b 	andeq	r7, r0, fp, lsl ip
    25f8:	b0085400 	andlt	r5, r8, r0, lsl #8
    25fc:	0200000e 	andeq	r0, r0, #14
    2600:	007c1b8a 	rsbseq	r1, ip, sl, lsl #23
    2604:	08580000 	ldmdaeq	r8, {}^	; <UNPREDICTABLE>
    2608:	00000d79 	andeq	r0, r0, r9, ror sp
    260c:	7c1b8b02 			; <UNDEFINED> instruction: 0x7c1b8b02
    2610:	5c000000 	stcpl	0, cr0, [r0], {-0}
    2614:	000e4d08 	andeq	r4, lr, r8, lsl #26
    2618:	1b8c0200 	blne	fe302e20 <_stack+0xfe282e20>
    261c:	0000007c 	andeq	r0, r0, ip, ror r0
    2620:	0da20860 	stceq	8, cr0, [r2, #384]!	; 0x180
    2624:	8d020000 	stchi	0, cr0, [r2, #-0]
    2628:	00007c1b 	andeq	r7, r0, fp, lsl ip
    262c:	84086400 	strhi	r6, [r8], #-1024	; 0xfffffc00
    2630:	0200000d 	andeq	r0, r0, #13
    2634:	007c1b8e 	rsbseq	r1, ip, lr, lsl #23
    2638:	08680000 	stmdaeq	r8!, {}^	; <UNPREDICTABLE>
    263c:	00000ee7 	andeq	r0, r0, r7, ror #29
    2640:	021b9002 	andseq	r9, fp, #2
    2644:	6c000002 	stcvs	0, cr0, [r0], {2}
    2648:	000e5508 	andeq	r5, lr, r8, lsl #10
    264c:	1b920200 	blne	fe482e54 <_stack+0xfe402e54>
    2650:	0000007c 	andeq	r0, r0, ip, ror r0
    2654:	0e600884 	cdpeq	8, 6, cr0, cr0, cr4, {4}
    2658:	93020000 	movwls	r0, #8192	; 0x2000
    265c:	00007c1b 	andeq	r7, r0, fp, lsl ip
    2660:	6b088800 	blvs	224668 <_stack+0x1a4668>
    2664:	0200000e 	andeq	r0, r0, #14
    2668:	007c1b94 			; <UNDEFINED> instruction: 0x007c1b94
    266c:	088c0000 	stmeq	ip, {}	; <UNPREDICTABLE>
    2670:	00000dec 	andeq	r0, r0, ip, ror #27
    2674:	7c1b9502 	cfldr32vc	mvfx9, [fp], {2}
    2678:	90000000 	andls	r0, r0, r0
    267c:	000d9108 	andeq	r9, sp, r8, lsl #2
    2680:	1b960200 	blne	fe582e88 <_stack+0xfe502e88>
    2684:	0000007c 	andeq	r0, r0, ip, ror r0
    2688:	0ef10894 	mrceq	8, 7, r0, cr1, cr4, {4}
    268c:	98020000 	stmdals	r2, {}	; <UNPREDICTABLE>
    2690:	0002171b 	andeq	r1, r2, fp, lsl r7
    2694:	d6089800 	strle	r9, [r8], -r0, lsl #16
    2698:	0200000d 	andeq	r0, r0, #13
    269c:	007c1b9a 			; <UNDEFINED> instruction: 0x007c1b9a
    26a0:	08c40000 	stmiaeq	r4, {}^	; <UNPREDICTABLE>
    26a4:	00000de1 	andeq	r0, r0, r1, ror #27
    26a8:	7c1b9b02 			; <UNDEFINED> instruction: 0x7c1b9b02
    26ac:	c8000000 	stmdagt	r0, {}	; <UNPREDICTABLE>
    26b0:	000e9b08 	andeq	r9, lr, r8, lsl #22
    26b4:	1b9c0200 	blne	fe702ebc <_stack+0xfe682ebc>
    26b8:	0000007c 	andeq	r0, r0, ip, ror r0
    26bc:	0dce08cc 	stcleq	8, cr0, [lr, #816]	; 0x330
    26c0:	9d020000 	stcls	0, cr0, [r2, #-0]
    26c4:	00007c1b 	andeq	r7, r0, fp, lsl ip
    26c8:	ba08d000 	blt	2366d0 <_stack+0x1b66d0>
    26cc:	0200000d 	andeq	r0, r0, #13
    26d0:	007c1b9e 			; <UNDEFINED> instruction: 0x007c1b9e
    26d4:	00d40000 	sbcseq	r0, r4, r0
    26d8:	00007c09 	andeq	r7, r0, r9, lsl #24
    26dc:	0001ed00 	andeq	lr, r1, r0, lsl #26
    26e0:	00750a00 	rsbseq	r0, r5, r0, lsl #20
    26e4:	000d0000 	andeq	r0, sp, r0
    26e8:	0001dd05 	andeq	sp, r1, r5, lsl #26
    26ec:	007c0900 	rsbseq	r0, ip, r0, lsl #18
    26f0:	02020000 	andeq	r0, r2, #0
    26f4:	750a0000 	strvc	r0, [sl, #-0]
    26f8:	05000000 	streq	r0, [r0, #-0]
    26fc:	01f20500 	mvnseq	r0, r0, lsl #10
    2700:	7c090000 	stcvc	0, cr0, [r9], {-0}
    2704:	17000000 	strne	r0, [r0, -r0]
    2708:	0a000002 	beq	2718 <_start-0x58e8>
    270c:	00000075 	andeq	r0, r0, r5, ror r0
    2710:	0705000a 	streq	r0, [r5, -sl]
    2714:	03000002 	movweq	r0, #2
    2718:	00000e08 	andeq	r0, r0, r8, lsl #28
    271c:	81079f02 	tsthi	r7, r2, lsl #30
    2720:	0b000000 	bleq	2728 <_start-0x58d8>
    2724:	00410107 	subeq	r0, r1, r7, lsl #2
    2728:	3c040000 	stccc	0, cr0, [r4], {-0}
    272c:	0002670e 	andeq	r6, r2, lr, lsl #14
    2730:	08f50c00 	ldmeq	r5!, {sl, fp}^
    2734:	0c000000 	stceq	0, cr0, [r0], {-0}
    2738:	000005bb 			; <UNDEFINED> instruction: 0x000005bb
    273c:	0b670c01 	bleq	19c5748 <_stack+0x1945748>
    2740:	0c020000 	stceq	0, cr0, [r2], {-0}
    2744:	00000b5f 	andeq	r0, r0, pc, asr fp
    2748:	0b3f0c03 	bleq	fc575c <_stack+0xf4575c>
    274c:	0c040000 	stceq	0, cr0, [r4], {-0}
    2750:	00000b47 	andeq	r0, r0, r7, asr #22
    2754:	0b4f0c05 	bleq	13c5770 <_stack+0x1345770>
    2758:	0c060000 	stceq	0, cr0, [r6], {-0}
    275c:	00000b57 	andeq	r0, r0, r7, asr fp
    2760:	070b0007 	streq	r0, [fp, -r7]
    2764:	00004101 	andeq	r4, r0, r1, lsl #2
    2768:	0e4b0400 	cdpeq	4, 4, cr0, cr11, cr0, {0}
    276c:	000003ba 			; <UNDEFINED> instruction: 0x000003ba
    2770:	0007480c 	andeq	r4, r7, ip, lsl #16
    2774:	520c0000 	andpl	r0, ip, #0
    2778:	01000007 	tsteq	r0, r7
    277c:	00075c0c 	andeq	r5, r7, ip, lsl #24
    2780:	660c0200 	strvs	r0, [ip], -r0, lsl #4
    2784:	03000007 	movweq	r0, #7
    2788:	0007700c 	andeq	r7, r7, ip
    278c:	7a0c0400 	bvc	303794 <_stack+0x283794>
    2790:	05000007 	streq	r0, [r0, #-7]
    2794:	0007840c 	andeq	r8, r7, ip, lsl #8
    2798:	8e0c0600 	cfmadd32hi	mvax0, mvfx0, mvfx12, mvfx0
    279c:	07000007 	streq	r0, [r0, -r7]
    27a0:	0007980c 	andeq	r9, r7, ip, lsl #16
    27a4:	da0c0800 	ble	3047ac <_stack+0x2847ac>
    27a8:	09000003 	stmdbeq	r0, {r0, r1}
    27ac:	000c1d0c 	andeq	r1, ip, ip, lsl #26
    27b0:	280c0a00 	stmdacs	ip, {r9, fp}
    27b4:	0b00000c 	bleq	27ec <_start-0x5814>
    27b8:	000c330c 	andeq	r3, ip, ip, lsl #6
    27bc:	3e0c0c00 	cdpcc	12, 0, cr0, cr12, cr0, {0}
    27c0:	0d00000c 	stceq	0, cr0, [r0, #-48]	; 0xffffffd0
    27c4:	000c490c 	andeq	r4, ip, ip, lsl #18
    27c8:	540c0e00 	strpl	r0, [ip], #-3584	; 0xfffff200
    27cc:	0f00000c 	svceq	0x0000000c
    27d0:	000c5f0c 	andeq	r5, ip, ip, lsl #30
    27d4:	6a0c1000 	bvs	3067dc <_stack+0x2867dc>
    27d8:	1100000c 	tstne	r0, ip
    27dc:	000c750c 	andeq	r7, ip, ip, lsl #10
    27e0:	800c1200 	andhi	r1, ip, r0, lsl #4
    27e4:	1300000c 	movwne	r0, #12
    27e8:	0002150c 	andeq	r1, r2, ip, lsl #10
    27ec:	200c1400 	andcs	r1, ip, r0, lsl #8
    27f0:	15000002 	strne	r0, [r0, #-2]
    27f4:	00022b0c 	andeq	r2, r2, ip, lsl #22
    27f8:	360c1600 	strcc	r1, [ip], -r0, lsl #12
    27fc:	17000002 	strne	r0, [r0, -r2]
    2800:	0002410c 	andeq	r4, r2, ip, lsl #2
    2804:	4c0c1800 	stcmi	8, cr1, [ip], {-0}
    2808:	19000002 	stmdbne	r0, {r1}
    280c:	0002570c 	andeq	r5, r2, ip, lsl #14
    2810:	620c1a00 	andvs	r1, ip, #0, 20
    2814:	1b000002 	blne	2824 <_start-0x57dc>
    2818:	000b180c 	andeq	r1, fp, ip, lsl #16
    281c:	ab0c1c00 	blge	309824 <_stack+0x289824>
    2820:	1d000002 	stcne	0, cr0, [r0, #-8]
    2824:	00034c0c 	andeq	r4, r3, ip, lsl #24
    2828:	570c1e00 	strpl	r1, [ip, -r0, lsl #28]
    282c:	1f000003 	svcne	0x00000003
    2830:	0003620c 	andeq	r6, r3, ip, lsl #4
    2834:	6d0c2000 	stcvs	0, cr2, [ip, #-0]
    2838:	21000003 	tstcs	r0, r3
    283c:	0003780c 	andeq	r7, r3, ip, lsl #16
    2840:	830c2200 	movwhi	r2, #49664	; 0xc200
    2844:	23000003 	movwcs	r0, #3
    2848:	00038e0c 	andeq	r8, r3, ip, lsl #28
    284c:	990c2400 	stmdbls	ip, {sl, sp}
    2850:	25000003 	strcs	r0, [r0, #-3]
    2854:	0003a40c 	andeq	sl, r3, ip, lsl #8
    2858:	af0c2600 	svcge	0x000c2600
    285c:	27000003 	strcs	r0, [r0, -r3]
    2860:	0003fc0c 	andeq	pc, r3, ip, lsl #24
    2864:	070c2800 	streq	r2, [ip, -r0, lsl #16]
    2868:	29000004 	stmdbcs	r0, {r2}
    286c:	0004120c 	andeq	r1, r4, ip, lsl #4
    2870:	1d0c2a00 	vstrne	s4, [ip, #-0]
    2874:	2b000004 	blcs	288c <_start-0x5774>
    2878:	0004280c 	andeq	r2, r4, ip, lsl #16
    287c:	330c2c00 	movwcc	r2, #52224	; 0xcc00
    2880:	2d000004 	stccs	0, cr0, [r0, #-16]
    2884:	00043e0c 	andeq	r3, r4, ip, lsl #28
    2888:	490c2e00 	stmdbmi	ip, {r9, sl, fp, sp}
    288c:	2f000004 	svccs	0x00000004
    2890:	0004540c 	andeq	r5, r4, ip, lsl #8
    2894:	5f0c3000 	svcpl	0x000c3000
    2898:	31000004 	tstcc	r0, r4
    289c:	0005500c 	andeq	r5, r5, ip
    28a0:	2f0c3200 	svccs	0x000c3200
    28a4:	33000005 	movwcc	r0, #5
    28a8:	00053a0c 	andeq	r3, r5, ip, lsl #20
    28ac:	450c3400 	strmi	r3, [ip, #-1024]	; 0xfffffc00
    28b0:	35000005 	strcc	r0, [r0, #-5]
    28b4:	c0040d00 	andgt	r0, r4, r0, lsl #26
    28b8:	02000003 	andeq	r0, r0, #3
    28bc:	00c90801 	sbceq	r0, r9, r1, lsl #16
    28c0:	b70e0000 	strlt	r0, [lr, -r0]
    28c4:	0100000e 	tsteq	r0, lr
    28c8:	03d90f11 	bicseq	r0, r9, #17, 30	; 0x44
    28cc:	03050000 	movweq	r0, #20480	; 0x5000
    28d0:	0000fec0 	andeq	pc, r0, r0, asr #29
    28d4:	021c040d 	andseq	r0, ip, #218103808	; 0xd000000
    28d8:	aa0f0000 	bge	3c28e0 <_stack+0x3428e0>
    28dc:	0100000d 	tsteq	r0, sp
    28e0:	03c0067e 	biceq	r0, r0, #132120576	; 0x7e00000
    28e4:	f0e00000 			; <UNDEFINED> instruction: 0xf0e00000
    28e8:	00180000 	andseq	r0, r8, r0
    28ec:	9c010000 	stcls	0, cr0, [r1], {-0}
    28f0:	000ea510 	andeq	sl, lr, r0, lsl r5
    28f4:	067a0100 	ldrbteq	r0, [sl], -r0, lsl #2
    28f8:	0000f0b4 	strheq	pc, [r0], -r4	; <UNPREDICTABLE>
    28fc:	0000002c 	andeq	r0, r0, ip, lsr #32
    2900:	04199c01 	ldreq	r9, [r9], #-3073	; 0xfffff3ff
    2904:	63110000 	tstvs	r1, #0
    2908:	167a0100 	ldrbtne	r0, [sl], -r0, lsl #2
    290c:	000003c0 	andeq	r0, r0, r0, asr #7
    2910:	00779102 	rsbseq	r9, r7, r2, lsl #2
    2914:	000dc410 	andeq	ip, sp, r0, lsl r4
    2918:	066d0100 	strbteq	r0, [sp], -r0, lsl #2
    291c:	0000eff4 	strdeq	lr, [r0], -r4
    2920:	000000c0 	andeq	r0, r0, r0, asr #1
    2924:	04579c01 	ldrbeq	r9, [r7], #-3073	; 0xfffff3ff
    2928:	6e110000 	cdpvs	0, 1, cr0, cr1, cr0, {0}
    292c:	196d0100 	stmdbne	sp!, {r8}^
    2930:	0000004f 	andeq	r0, r0, pc, asr #32
    2934:	12649102 	rsbne	r9, r4, #-2147483648	; 0x80000000
    2938:	6e010063 	cdpvs	0, 0, cr0, cr1, cr3, {3}
    293c:	00045708 	andeq	r5, r4, r8, lsl #14
    2940:	68910200 	ldmvs	r1, {r9}
    2944:	01006912 	tsteq	r0, r2, lsl r9
    2948:	0069076f 	rsbeq	r0, r9, pc, ror #14
    294c:	91020000 	mrsls	r0, (UNDEF: 2)
    2950:	c0090074 	andgt	r0, r9, r4, ror r0
    2954:	67000003 	strvs	r0, [r0, -r3]
    2958:	0a000004 	beq	2970 <_start-0x5690>
    295c:	00000075 	andeq	r0, r0, r5, ror r0
    2960:	b0100009 	andslt	r0, r0, r9
    2964:	0100000d 	tsteq	r0, sp
    2968:	efa80667 	svc	0x00a80667
    296c:	004c0000 	subeq	r0, ip, r0
    2970:	9c010000 	stcls	0, cr0, [r1], {-0}
    2974:	0000048b 	andeq	r0, r0, fp, lsl #9
    2978:	01007311 	tsteq	r0, r1, lsl r3
    297c:	03ba1767 			; <UNDEFINED> instruction: 0x03ba1767
    2980:	91020000 	mrsls	r0, (UNDEF: 2)
    2984:	65130074 	ldrvs	r0, [r3, #-116]	; 0xffffff8c
    2988:	0100000d 	tsteq	r0, sp
    298c:	03c00662 	biceq	r0, r0, #102760448	; 0x6200000
    2990:	ef5c0000 	svc	0x005c0000
    2994:	004c0000 	subeq	r0, ip, r0
    2998:	9c010000 	stcls	0, cr0, [r1], {-0}
    299c:	000ec110 	andeq	ip, lr, r0, lsl r1
    29a0:	06540100 	ldrbeq	r0, [r4], -r0, lsl #2
    29a4:	0000eef8 	strdeq	lr, [r0], -r8
    29a8:	00000064 	andeq	r0, r0, r4, rrx
    29ac:	04d49c01 	ldrbeq	r9, [r4], #3073	; 0xc01
    29b0:	63110000 	tstvs	r1, #0
    29b4:	21540100 	cmpcs	r4, r0, lsl #2
    29b8:	000003c0 	andeq	r0, r0, r0, asr #7
    29bc:	0e6f9102 	lgneqe	f1, f2
    29c0:	0000061b 	andeq	r0, r0, fp, lsl r6
    29c4:	69095a01 	stmdbvs	r9, {r0, r9, fp, ip, lr}
    29c8:	02000000 	andeq	r0, r0, #0
    29cc:	10007491 	mulne	r0, r1, r4
    29d0:	00000df4 	strdeq	r0, [r0], -r4
    29d4:	5c061f01 	stcpl	15, cr1, [r6], {1}
    29d8:	9c0000ed 	stcls	0, cr0, [r0], {237}	; 0xed
    29dc:	01000001 	tsteq	r0, r1
    29e0:	0005169c 	muleq	r5, ip, r6
    29e4:	0e841400 	cdpeq	4, 8, cr1, cr4, cr0, {0}
    29e8:	1f010000 	svcne	0x00010000
    29ec:	0000691f 	andeq	r6, r0, pc, lsl r9
    29f0:	6c910200 	lfmvs	f0, 4, [r1], {0}
    29f4:	000d8c14 	andeq	r8, sp, r4, lsl ip
    29f8:	291f0100 	ldmdbcs	pc, {r8}	; <UNPREDICTABLE>
    29fc:	00000069 	andeq	r0, r0, r9, rrx
    2a00:	12689102 	rsbne	r9, r8, #-2147483648	; 0x80000000
    2a04:	21010069 	tstcs	r1, r9, rrx
    2a08:	00007012 	andeq	r7, r0, r2, lsl r0
    2a0c:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    2a10:	0e901500 	cdpeq	5, 9, cr1, cr0, cr0, {0}
    2a14:	13010000 	movwne	r0, #4096	; 0x1000
    2a18:	0003d908 	andeq	sp, r3, r8, lsl #18
    2a1c:	00ed3800 	rsceq	r3, sp, r0, lsl #16
    2a20:	00002400 	andeq	r2, r0, r0, lsl #8
    2a24:	009c0100 	addseq	r0, ip, r0, lsl #2
    2a28:	00000663 	andeq	r0, r0, r3, ror #12
    2a2c:	05950004 	ldreq	r0, [r5, #4]
    2a30:	01040000 	mrseq	r0, (UNDEF: 4)
    2a34:	000000ce 	andeq	r0, r0, lr, asr #1
    2a38:	00111e0c 	andseq	r1, r1, ip, lsl #28
    2a3c:	00003d00 	andeq	r3, r0, r0, lsl #26
    2a40:	00f0f800 	rscseq	pc, r0, r0, lsl #16
    2a44:	00044000 	andeq	r4, r4, r0
    2a48:	00241400 	eoreq	r1, r4, r0, lsl #8
    2a4c:	06010200 	streq	r0, [r1], -r0, lsl #4
    2a50:	000000c2 	andeq	r0, r0, r2, asr #1
    2a54:	c3050202 	movwgt	r0, #20994	; 0x5202
    2a58:	02000001 	andeq	r0, r0, #1
    2a5c:	007c0504 	rsbseq	r0, ip, r4, lsl #10
    2a60:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
    2a64:	00007705 	andeq	r7, r0, r5, lsl #14
    2a68:	08010200 	stmdaeq	r1, {r9}
    2a6c:	000000c0 	andeq	r0, r0, r0, asr #1
    2a70:	b0070202 	andlt	r0, r7, r2, lsl #4
    2a74:	03000001 	movweq	r0, #1
    2a78:	0000047c 	andeq	r0, r0, ip, ror r4
    2a7c:	65193402 	ldrvs	r3, [r9, #-1026]	; 0xfffffbfe
    2a80:	04000000 	streq	r0, [r0], #-0
    2a84:	0000004f 	andeq	r0, r0, pc, asr #32
    2a88:	00005b05 	andeq	r5, r0, r5, lsl #22
    2a8c:	07040200 	streq	r0, [r4, -r0, lsl #4]
    2a90:	000000ae 	andeq	r0, r0, lr, lsr #1
    2a94:	a9070802 	stmdbge	r7, {r1, fp}
    2a98:	06000000 	streq	r0, [r0], -r0
    2a9c:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
    2aa0:	04020074 	streq	r0, [r2], #-116	; 0xffffff8c
    2aa4:	0000b307 	andeq	fp, r0, r7, lsl #6
    2aa8:	10b20300 	adcsne	r0, r2, r0, lsl #6
    2aac:	1c030000 	stcne	0, cr0, [r3], {-0}
    2ab0:	00005b1b 	andeq	r5, r0, fp, lsl fp
    2ab4:	11b00300 	lslsne	r0, r0, #6
    2ab8:	1d030000 	stcne	0, cr0, [r3, #-0]
    2abc:	00006021 	andeq	r6, r0, r1, lsr #32
    2ac0:	118f0300 	orrne	r0, pc, r0, lsl #6
    2ac4:	1e030000 	cdpne	0, 0, cr0, cr3, cr0, {0}
    2ac8:	00005b1b 	andeq	r5, r0, fp, lsl fp
    2acc:	01070700 	tsteq	r7, r0, lsl #14
    2ad0:	00000041 	andeq	r0, r0, r1, asr #32
    2ad4:	e40e3c04 	str	r3, [lr], #-3076	; 0xfffff3fc
    2ad8:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
    2adc:	000008f5 	strdeq	r0, [r0], -r5
    2ae0:	05bb0800 	ldreq	r0, [fp, #2048]!	; 0x800
    2ae4:	08010000 	stmdaeq	r1, {}	; <UNPREDICTABLE>
    2ae8:	00000b67 	andeq	r0, r0, r7, ror #22
    2aec:	0b5f0802 	bleq	17c4afc <_stack+0x1744afc>
    2af0:	08030000 	stmdaeq	r3, {}	; <UNPREDICTABLE>
    2af4:	00000b3f 	andeq	r0, r0, pc, lsr fp
    2af8:	0b470804 	bleq	11c4b10 <_stack+0x1144b10>
    2afc:	08050000 	stmdaeq	r5, {}	; <UNPREDICTABLE>
    2b00:	00000b4f 	andeq	r0, r0, pc, asr #22
    2b04:	0b570806 	bleq	15c4b24 <_stack+0x1544b24>
    2b08:	00070000 	andeq	r0, r7, r0
    2b0c:	0010dc03 	andseq	sp, r0, r3, lsl #24
    2b10:	07450400 	strbeq	r0, [r5, -r0, lsl #8]
    2b14:	000000a5 	andeq	r0, r0, r5, lsr #1
    2b18:	41010707 	tstmi	r1, r7, lsl #14
    2b1c:	04000000 	streq	r0, [r0], #-0
    2b20:	02430e4b 	subeq	r0, r3, #1200	; 0x4b0
    2b24:	48080000 	stmdami	r8, {}	; <UNPREDICTABLE>
    2b28:	00000007 	andeq	r0, r0, r7
    2b2c:	00075208 	andeq	r5, r7, r8, lsl #4
    2b30:	5c080100 	stfpls	f0, [r8], {-0}
    2b34:	02000007 	andeq	r0, r0, #7
    2b38:	00076608 	andeq	r6, r7, r8, lsl #12
    2b3c:	70080300 	andvc	r0, r8, r0, lsl #6
    2b40:	04000007 	streq	r0, [r0], #-7
    2b44:	00077a08 	andeq	r7, r7, r8, lsl #20
    2b48:	84080500 	strhi	r0, [r8], #-1280	; 0xfffffb00
    2b4c:	06000007 	streq	r0, [r0], -r7
    2b50:	00078e08 	andeq	r8, r7, r8, lsl #28
    2b54:	98080700 	stmdals	r8, {r8, r9, sl}
    2b58:	08000007 	stmdaeq	r0, {r0, r1, r2}
    2b5c:	0003da08 	andeq	sp, r3, r8, lsl #20
    2b60:	1d080900 	vstrne.16	s0, [r8, #-0]	; <UNPREDICTABLE>
    2b64:	0a00000c 	beq	2b9c <_start-0x5464>
    2b68:	000c2808 	andeq	r2, ip, r8, lsl #16
    2b6c:	33080b00 	movwcc	r0, #35584	; 0x8b00
    2b70:	0c00000c 	stceq	0, cr0, [r0], {12}
    2b74:	000c3e08 	andeq	r3, ip, r8, lsl #28
    2b78:	49080d00 	stmdbmi	r8, {r8, sl, fp}
    2b7c:	0e00000c 	cdpeq	0, 0, cr0, cr0, cr12, {0}
    2b80:	000c5408 	andeq	r5, ip, r8, lsl #8
    2b84:	5f080f00 	svcpl	0x00080f00
    2b88:	1000000c 	andne	r0, r0, ip
    2b8c:	000c6a08 	andeq	r6, ip, r8, lsl #20
    2b90:	75081100 	strvc	r1, [r8, #-256]	; 0xffffff00
    2b94:	1200000c 	andne	r0, r0, #12
    2b98:	000c8008 	andeq	r8, ip, r8
    2b9c:	15081300 	strne	r1, [r8, #-768]	; 0xfffffd00
    2ba0:	14000002 	strne	r0, [r0], #-2
    2ba4:	00022008 	andeq	r2, r2, r8
    2ba8:	2b081500 	blcs	207fb0 <_stack+0x187fb0>
    2bac:	16000002 	strne	r0, [r0], -r2
    2bb0:	00023608 	andeq	r3, r2, r8, lsl #12
    2bb4:	41081700 	tstmi	r8, r0, lsl #14
    2bb8:	18000002 	stmdane	r0, {r1}
    2bbc:	00024c08 	andeq	r4, r2, r8, lsl #24
    2bc0:	57081900 	strpl	r1, [r8, -r0, lsl #18]
    2bc4:	1a000002 	bne	2bd4 <_start-0x542c>
    2bc8:	00026208 	andeq	r6, r2, r8, lsl #4
    2bcc:	18081b00 	stmdane	r8, {r8, r9, fp, ip}
    2bd0:	1c00000b 	stcne	0, cr0, [r0], {11}
    2bd4:	0002ab08 	andeq	sl, r2, r8, lsl #22
    2bd8:	4c081d00 	stcmi	13, cr1, [r8], {-0}
    2bdc:	1e000003 	cdpne	0, 0, cr0, cr0, cr3, {0}
    2be0:	00035708 	andeq	r5, r3, r8, lsl #14
    2be4:	62081f00 	andvs	r1, r8, #0, 30
    2be8:	20000003 	andcs	r0, r0, r3
    2bec:	00036d08 	andeq	r6, r3, r8, lsl #26
    2bf0:	78082100 	stmdavc	r8, {r8, sp}
    2bf4:	22000003 	andcs	r0, r0, #3
    2bf8:	00038308 	andeq	r8, r3, r8, lsl #6
    2bfc:	8e082300 	cdphi	3, 0, cr2, cr8, cr0, {0}
    2c00:	24000003 	strcs	r0, [r0], #-3
    2c04:	00039908 	andeq	r9, r3, r8, lsl #18
    2c08:	a4082500 	strge	r2, [r8], #-1280	; 0xfffffb00
    2c0c:	26000003 	strcs	r0, [r0], -r3
    2c10:	0003af08 	andeq	sl, r3, r8, lsl #30
    2c14:	fc082700 	stc2	7, cr2, [r8], {-0}
    2c18:	28000003 	stmdacs	r0, {r0, r1}
    2c1c:	00040708 	andeq	r0, r4, r8, lsl #14
    2c20:	12082900 	andne	r2, r8, #0, 18
    2c24:	2a000004 	bcs	2c3c <_start-0x53c4>
    2c28:	00041d08 	andeq	r1, r4, r8, lsl #26
    2c2c:	28082b00 	stmdacs	r8, {r8, r9, fp, sp}
    2c30:	2c000004 	stccs	0, cr0, [r0], {4}
    2c34:	00043308 	andeq	r3, r4, r8, lsl #6
    2c38:	3e082d00 	cdpcc	13, 0, cr2, cr8, cr0, {0}
    2c3c:	2e000004 	cdpcs	0, 0, cr0, cr0, cr4, {0}
    2c40:	00044908 	andeq	r4, r4, r8, lsl #18
    2c44:	54082f00 	strpl	r2, [r8], #-3840	; 0xfffff100
    2c48:	30000004 	andcc	r0, r0, r4
    2c4c:	00045f08 	andeq	r5, r4, r8, lsl #30
    2c50:	50083100 	andpl	r3, r8, r0, lsl #2
    2c54:	32000005 	andcc	r0, r0, #5
    2c58:	00052f08 	andeq	r2, r5, r8, lsl #30
    2c5c:	3a083300 	bcc	20f864 <_stack+0x18f864>
    2c60:	34000005 	strcc	r0, [r0], #-5
    2c64:	00054508 	andeq	r4, r5, r8, lsl #10
    2c68:	03003500 	movweq	r3, #1280	; 0x500
    2c6c:	0000103f 	andeq	r1, r0, pc, lsr r0
    2c70:	f0078204 			; <UNDEFINED> instruction: 0xf0078204
    2c74:	09000000 	stmdbeq	r0, {}	; <UNPREDICTABLE>
    2c78:	099604a4 	ldmibeq	r6, {r2, r5, r7, sl}
    2c7c:	0000046e 	andeq	r0, r0, lr, ror #8
    2c80:	000f100a 	andeq	r1, pc, sl
    2c84:	15970400 	ldrne	r0, [r7, #1024]	; 0x400
    2c88:	00000081 	andeq	r0, r0, r1, lsl #1
    2c8c:	0f180a00 	svceq	0x00180a00
    2c90:	98040000 	stmdals	r4, {}	; <UNPREDICTABLE>
    2c94:	00008115 	andeq	r8, r0, r5, lsl r1
    2c98:	200a0400 	andcs	r0, sl, r0, lsl #8
    2c9c:	0400000f 	streq	r0, [r0], #-15
    2ca0:	00811599 	umulleq	r1, r1, r9, r5	; <UNPREDICTABLE>
    2ca4:	0a080000 	beq	202cac <_stack+0x182cac>
    2ca8:	00000f28 	andeq	r0, r0, r8, lsr #30
    2cac:	81159a04 	tsthi	r5, r4, lsl #20
    2cb0:	0c000000 	stceq	0, cr0, [r0], {-0}
    2cb4:	000f300a 	andeq	r3, pc, sl
    2cb8:	159b0400 	ldrne	r0, [fp, #1024]	; 0x400
    2cbc:	00000081 	andeq	r0, r0, r1, lsl #1
    2cc0:	0f380a10 	svceq	0x00380a10
    2cc4:	9c040000 	stcls	0, cr0, [r4], {-0}
    2cc8:	00008115 	andeq	r8, r0, r5, lsl r1
    2ccc:	a20a1400 	andge	r1, sl, #0, 8
    2cd0:	0400000f 	streq	r0, [r0], #-15
    2cd4:	008d159d 	umulleq	r1, sp, sp, r5
    2cd8:	0a180000 	beq	602ce0 <_stack+0x582ce0>
    2cdc:	00000f02 	andeq	r0, r0, r2, lsl #30
    2ce0:	99159e04 	ldmdbls	r5, {r2, r9, sl, fp, ip, pc}
    2ce4:	1c000000 	stcne	0, cr0, [r0], {-0}
    2ce8:	000f090a 	andeq	r0, pc, sl, lsl #18
    2cec:	159f0400 	ldrne	r0, [pc, #1024]	; 30f4 <_start-0x4f0c>
    2cf0:	00000099 	muleq	r0, r9, r0
    2cf4:	0fac0a20 	svceq	0x00ac0a20
    2cf8:	a0040000 	andge	r0, r4, r0
    2cfc:	00008d15 	andeq	r8, r0, r5, lsl sp
    2d00:	ef0a2400 	svc	0x000a2400
    2d04:	04000011 	streq	r0, [r0], #-17	; 0xffffffef
    2d08:	009915a1 	addseq	r1, r9, r1, lsr #11
    2d0c:	0a280000 	beq	a02d14 <_stack+0x982d14>
    2d10:	00001080 	andeq	r1, r0, r0, lsl #1
    2d14:	9915a204 	ldmdbls	r5, {r2, r9, sp, pc}
    2d18:	2c000000 	stccs	0, cr0, [r0], {-0}
    2d1c:	000fb60a 	andeq	fp, pc, sl, lsl #12
    2d20:	15a30400 	strne	r0, [r3, #1024]!	; 0x400
    2d24:	0000008d 	andeq	r0, r0, sp, lsl #1
    2d28:	10ab0a30 	adcne	r0, fp, r0, lsr sl
    2d2c:	a4040000 	strge	r0, [r4], #-0
    2d30:	00009915 	andeq	r9, r0, r5, lsl r9
    2d34:	5e0a3400 	cfcpyspl	mvf3, mvf10
    2d38:	04000011 	streq	r0, [r0], #-17	; 0xffffffef
    2d3c:	009915a5 	addseq	r1, r9, r5, lsr #11
    2d40:	0a380000 	beq	e02d48 <_stack+0xd82d48>
    2d44:	00000fc0 	andeq	r0, r0, r0, asr #31
    2d48:	8d15a604 	ldchi	6, cr10, [r5, #-16]
    2d4c:	3c000000 	stccc	0, cr0, [r0], {-0}
    2d50:	000fde0a 	andeq	sp, pc, sl, lsl #28
    2d54:	15a70400 	strne	r0, [r7, #1024]!	; 0x400
    2d58:	00000099 	muleq	r0, r9, r0
    2d5c:	0fe50a40 	svceq	0x00e50a40
    2d60:	a8040000 	stmdage	r4, {}	; <UNPREDICTABLE>
    2d64:	00009915 	andeq	r9, r0, r5, lsl r9
    2d68:	ca0a4400 	bgt	293d70 <_stack+0x213d70>
    2d6c:	0400000f 	streq	r0, [r0], #-15
    2d70:	008d15a9 	addeq	r1, sp, r9, lsr #11
    2d74:	0a480000 	beq	1202d7c <_stack+0x1182d7c>
    2d78:	00000f70 	andeq	r0, r0, r0, ror pc
    2d7c:	9915aa04 	ldmdbls	r5, {r2, r9, fp, sp, pc}
    2d80:	4c000000 	stcmi	0, cr0, [r0], {-0}
    2d84:	000f770a 	andeq	r7, pc, sl, lsl #14
    2d88:	15ab0400 	strne	r0, [fp, #1024]!	; 0x400
    2d8c:	00000099 	muleq	r0, r9, r0
    2d90:	0fd40a50 	svceq	0x00d40a50
    2d94:	ac040000 	stcge	0, cr0, [r4], {-0}
    2d98:	00008d15 	andeq	r8, r0, r5, lsl sp
    2d9c:	bd0a5400 	cfstrslt	mvf5, [sl, #-0]
    2da0:	04000011 	streq	r0, [r0], #-17	; 0xffffffef
    2da4:	009915ad 	addseq	r1, r9, sp, lsr #11
    2da8:	0a580000 	beq	1602db0 <_stack+0x1582db0>
    2dac:	00000f40 	andeq	r0, r0, r0, asr #30
    2db0:	9915ae04 	ldmdbls	r5, {r2, r9, sl, fp, sp, pc}
    2db4:	5c000000 	stcpl	0, cr0, [r0], {-0}
    2db8:	0011650a 	andseq	r6, r1, sl, lsl #10
    2dbc:	15af0400 	strne	r0, [pc, #1024]!	; 31c4 <_start-0x4e3c>
    2dc0:	0000008d 	andeq	r0, r0, sp, lsl #1
    2dc4:	0f7e0a60 	svceq	0x007e0a60
    2dc8:	b0040000 	andlt	r0, r4, r0
    2dcc:	00009915 	andeq	r9, r0, r5, lsl r9
    2dd0:	6f0a6400 	svcvs	0x000a6400
    2dd4:	04000011 	streq	r0, [r0], #-17	; 0xffffffef
    2dd8:	009915b1 			; <UNDEFINED> instruction: 0x009915b1
    2ddc:	0a680000 	beq	1a02de4 <_stack+0x1982de4>
    2de0:	0000119c 	muleq	r0, ip, r1
    2de4:	8d15b204 	lfmhi	f3, 1, [r5, #-16]
    2de8:	6c000000 	stcvs	0, cr0, [r0], {-0}
    2dec:	00104e0a 	andseq	r4, r0, sl, lsl #28
    2df0:	15b30400 	ldrne	r0, [r3, #1024]!	; 0x400
    2df4:	00000099 	muleq	r0, r9, r0
    2df8:	10a40a70 	adcne	r0, r4, r0, ror sl
    2dfc:	b4040000 	strlt	r0, [r4], #-0
    2e00:	00009915 	andeq	r9, r0, r5, lsl r9
    2e04:	ec0a7400 	cfstrs	mvf7, [sl], {-0}
    2e08:	0400000f 	streq	r0, [r0], #-15
    2e0c:	008d15b5 			; <UNDEFINED> instruction: 0x008d15b5
    2e10:	0a780000 	beq	1e02e18 <_stack+0x1d82e18>
    2e14:	00001092 	muleq	r0, r2, r0
    2e18:	9915b604 	ldmdbls	r5, {r2, r9, sl, ip, sp, pc}
    2e1c:	7c000000 	stcvc	0, cr0, [r0], {-0}
    2e20:	0010d40a 	andseq	sp, r0, sl, lsl #8
    2e24:	15b70400 	ldrne	r0, [r7, #1024]!	; 0x400
    2e28:	00000099 	muleq	r0, r9, r0
    2e2c:	0ff60a80 	svceq	0x00f60a80
    2e30:	b8040000 	stmdalt	r4, {}	; <UNPREDICTABLE>
    2e34:	00008d15 	andeq	r8, r0, r5, lsl sp
    2e38:	550a8400 	strpl	r8, [sl, #-1024]	; 0xfffffc00
    2e3c:	04000010 	streq	r0, [r0], #-16
    2e40:	009915b9 			; <UNDEFINED> instruction: 0x009915b9
    2e44:	0a880000 	beq	fe202e4c <_stack+0xfe182e4c>
    2e48:	0000105d 	andeq	r1, r0, sp, asr r0
    2e4c:	9915ba04 	ldmdbls	r5, {r2, r9, fp, ip, sp, pc}
    2e50:	8c000000 	stchi	0, cr0, [r0], {-0}
    2e54:	0010c90a 	andseq	ip, r0, sl, lsl #18
    2e58:	15bb0400 	ldrne	r0, [fp, #1024]!	; 0x400
    2e5c:	0000008d 	andeq	r0, r0, sp, lsl #1
    2e60:	100e0a90 	mulne	lr, r0, sl
    2e64:	bc040000 	stclt	0, cr0, [r4], {-0}
    2e68:	00009915 	andeq	r9, r0, r5, lsl r9
    2e6c:	bf0a9400 	svclt	0x000a9400
    2e70:	04000010 	streq	r0, [r0], #-16
    2e74:	009915bd 			; <UNDEFINED> instruction: 0x009915bd
    2e78:	0a980000 	beq	fe602e80 <_stack+0xfe582e80>
    2e7c:	0000110a 	andeq	r1, r0, sl, lsl #2
    2e80:	9915be04 	ldmdbls	r5, {r2, r9, sl, fp, ip, sp, pc}
    2e84:	9c000000 	stcls	0, cr0, [r0], {-0}
    2e88:	0010870a 	andseq	r8, r0, sl, lsl #14
    2e8c:	15bf0400 	ldrne	r0, [pc, #1024]!	; 3294 <_start-0x4d6c>
    2e90:	0000008d 	andeq	r0, r0, sp, lsl #1
    2e94:	c40300a0 	strgt	r0, [r3], #-160	; 0xffffff60
    2e98:	04000011 	streq	r0, [r0], #-17	; 0xffffffef
    2e9c:	024f07c0 	subeq	r0, pc, #192, 14	; 0x3000000
    2ea0:	07070000 	streq	r0, [r7, -r0]
    2ea4:	00004101 	andeq	r4, r0, r1, lsl #2
    2ea8:	0ec30400 	cdpeq	4, 12, cr0, cr3, cr0, {0}
    2eac:	000004a7 	andeq	r0, r0, r7, lsr #9
    2eb0:	00107608 	andseq	r7, r0, r8, lsl #12
    2eb4:	9a080000 	bls	202ebc <_stack+0x182ebc>
    2eb8:	01000010 	tsteq	r0, r0, lsl r0
    2ebc:	00111408 	andseq	r1, r1, r8, lsl #8
    2ec0:	84080200 	strhi	r0, [r8], #-512	; 0xfffffe00
    2ec4:	03000011 	movweq	r0, #17
    2ec8:	000f4f08 	andeq	r4, pc, r8, lsl #30
    2ecc:	03000400 	movweq	r0, #1024	; 0x400
    2ed0:	000010f9 	strdeq	r1, [r0], -r9
    2ed4:	7a07c904 	bvc	1f52ec <_stack+0x1752ec>
    2ed8:	0b000004 	bleq	2ef0 <_start-0x5110>
    2edc:	00000f47 	andeq	r0, r0, r7, asr #30
    2ee0:	c5140d01 	ldrgt	r0, [r4, #-3329]	; 0xfffff2ff
    2ee4:	05000004 	streq	r0, [r0, #-4]
    2ee8:	00fec403 	rscseq	ip, lr, r3, lsl #8
    2eec:	6e040c00 	cdpvs	12, 0, cr0, cr4, cr0, {0}
    2ef0:	0d000004 	stceq	0, cr0, [r0, #-16]
    2ef4:	00001065 	andeq	r1, r0, r5, rrx
    2ef8:	c0067501 	andgt	r7, r6, r1, lsl #10
    2efc:	780000f4 	stmdavc	r0, {r2, r4, r5, r6, r7}
    2f00:	01000000 	mrseq	r0, (UNDEF: 0)
    2f04:	0005009c 	muleq	r5, ip, r0
    2f08:	10090e00 	andne	r0, r9, r0, lsl #28
    2f0c:	75010000 	strvc	r0, [r1, #-0]
    2f10:	00024327 	andeq	r4, r2, r7, lsr #6
    2f14:	77910200 	ldrvc	r0, [r1, r0, lsl #4]
    2f18:	000f9c0e 	andeq	r9, pc, lr, lsl #24
    2f1c:	3e750100 	rpwccs	f0, f5, f0
    2f20:	000004a7 	andeq	r0, r0, r7, lsr #9
    2f24:	00769102 	rsbseq	r9, r6, r2, lsl #2
    2f28:	0010310f 	andseq	r3, r0, pc, lsl #2
    2f2c:	06630100 	strbteq	r0, [r3], -r0, lsl #2
    2f30:	0000f438 	andeq	pc, r0, r8, lsr r4	; <UNPREDICTABLE>
    2f34:	00000088 	andeq	r0, r0, r8, lsl #1
    2f38:	05269c01 	streq	r9, [r6, #-3073]!	; 0xfffff3ff
    2f3c:	090e0000 	stmdbeq	lr, {}	; <UNPREDICTABLE>
    2f40:	01000010 	tsteq	r0, r0, lsl r0
    2f44:	02432463 	subeq	r2, r3, #1660944384	; 0x63000000
    2f48:	91020000 	mrsls	r0, (UNDEF: 2)
    2f4c:	760f0077 			; <UNDEFINED> instruction: 0x760f0077
    2f50:	01000011 	tsteq	r0, r1, lsl r0
    2f54:	f3b00651 	vqshlu.s32	q0, <illegal reg q0.5>, #16
    2f58:	00880000 	addeq	r0, r8, r0
    2f5c:	9c010000 	stcls	0, cr0, [r1], {-0}
    2f60:	0000054c 	andeq	r0, r0, ip, asr #10
    2f64:	0010090e 	andseq	r0, r0, lr, lsl #18
    2f68:	24510100 	ldrbcs	r0, [r1], #-256	; 0xffffff00
    2f6c:	00000243 	andeq	r0, r0, r3, asr #4
    2f70:	00779102 	rsbseq	r9, r7, r2, lsl #2
    2f74:	0011cf0d 	andseq	ip, r1, sp, lsl #30
    2f78:	06480100 	strbeq	r0, [r8], -r0, lsl #2
    2f7c:	0000f35c 	andeq	pc, r0, ip, asr r3	; <UNPREDICTABLE>
    2f80:	00000054 	andeq	r0, r0, r4, asr r0
    2f84:	05729c01 	ldrbeq	r9, [r2, #-3073]!	; 0xfffff3ff
    2f88:	090e0000 	stmdbeq	lr, {}	; <UNPREDICTABLE>
    2f8c:	01000010 	tsteq	r0, r0, lsl r0
    2f90:	02432548 	subeq	r2, r3, #72, 10	; 0x12000000
    2f94:	91020000 	mrsls	r0, (UNDEF: 2)
    2f98:	de100077 	mrcle	0, 0, r0, cr0, cr7, {3}
    2f9c:	01000011 	tsteq	r0, r1, lsl r0
    2fa0:	04a7122c 	strteq	r1, [r7], #556	; 0x22c
    2fa4:	f2880000 	vaddl.s8	q0, d8, d0
    2fa8:	00d40000 	sbcseq	r0, r4, r0
    2fac:	9c010000 	stcls	0, cr0, [r1], {-0}
    2fb0:	000005ab 	andeq	r0, r0, fp, lsr #11
    2fb4:	0010090e 	andseq	r0, r0, lr, lsl #18
    2fb8:	332c0100 			; <UNDEFINED> instruction: 0x332c0100
    2fbc:	00000243 	andeq	r0, r0, r3, asr #4
    2fc0:	0b6f9102 	bleq	1be73d0 <_stack+0x1b673d0>
    2fc4:	00000efb 	strdeq	r0, [r0], -fp
    2fc8:	a7162e01 	ldrge	r2, [r6, -r1, lsl #28]
    2fcc:	02000004 	andeq	r0, r0, #4
    2fd0:	0d007791 	stceq	7, cr7, [r0, #-580]	; 0xfffffdbc
    2fd4:	00001014 	andeq	r1, r0, r4, lsl r0
    2fd8:	58062601 	stmdapl	r6, {r0, r9, sl, sp}
    2fdc:	300000f2 	strdcc	r0, [r0], -r2
    2fe0:	01000000 	mrseq	r0, (UNDEF: 0)
    2fe4:	0005d19c 	muleq	r5, ip, r1
    2fe8:	10090e00 	andne	r0, r9, r0, lsl #28
    2fec:	26010000 	strcs	r0, [r1], -r0
    2ff0:	00024327 	andeq	r4, r2, r7, lsr #6
    2ff4:	77910200 	ldrvc	r0, [r1, r0, lsl #4]
    2ff8:	0f5e0d00 	svceq	0x005e0d00
    2ffc:	20010000 	andcs	r0, r1, r0
    3000:	00f22806 	rscseq	r2, r2, r6, lsl #16
    3004:	00003000 	andeq	r3, r0, r0
    3008:	f79c0100 			; <UNDEFINED> instruction: 0xf79c0100
    300c:	0e000005 	cdpeq	0, 0, cr0, cr0, cr5, {0}
    3010:	00001009 	andeq	r1, r0, r9
    3014:	43282001 			; <UNDEFINED> instruction: 0x43282001
    3018:	02000002 	andeq	r0, r0, #2
    301c:	0f007791 	svceq	0x00007791
    3020:	00000f85 	andeq	r0, r0, r5, lsl #31
    3024:	1c061601 	stcne	6, cr1, [r6], {1}
    3028:	0c0000f1 	stceq	0, cr0, [r0], {241}	; 0xf1
    302c:	01000001 	tsteq	r0, r1
    3030:	00064a9c 	muleq	r6, ip, sl
    3034:	10090e00 	andne	r0, r9, r0, lsl #28
    3038:	16010000 	strne	r0, [r1], -r0
    303c:	0002432d 	andeq	r4, r2, sp, lsr #6
    3040:	6f910200 	svcvs	0x00910200
    3044:	0010f40e 	andseq	pc, r0, lr, lsl #8
    3048:	4b160100 	blmi	583450 <_stack+0x503450>
    304c:	000000e4 	andeq	r0, r0, r4, ror #1
    3050:	0b6e9102 	bleq	1ba7460 <_stack+0x1b27460>
    3054:	00001000 	andeq	r1, r0, r0
    3058:	4a131801 	bmi	4c9064 <_stack+0x449064>
    305c:	02000006 	andeq	r0, r0, #6
    3060:	a60b7491 			; <UNDEFINED> instruction: 0xa60b7491
    3064:	01000011 	tsteq	r0, r1, lsl r0
    3068:	00811219 	addeq	r1, r1, r9, lsl r2
    306c:	91020000 	mrsls	r0, (UNDEF: 2)
    3070:	040c0070 	streq	r0, [ip], #-112	; 0xffffff90
    3074:	00000081 	andeq	r0, r0, r1, lsl #1
    3078:	00102511 	andseq	r2, r0, r1, lsl r5
    307c:	0d100100 	ldfeqs	f0, [r0, #-0]
    3080:	000004c5 	andeq	r0, r0, r5, asr #9
    3084:	0000f0f8 	strdeq	pc, [r0], -r8
    3088:	00000024 	andeq	r0, r0, r4, lsr #32
    308c:	38009c01 	stmdacc	r0, {r0, sl, fp, ip, pc}
    3090:	04000003 	streq	r0, [r0], #-3
    3094:	0006b500 	andeq	fp, r6, r0, lsl #10
    3098:	ce010400 	cfcpysgt	mvf0, mvf1
    309c:	0c000000 	stceq	0, cr0, [r0], {-0}
    30a0:	0000121a 	andeq	r1, r0, sl, lsl r2
    30a4:	0000003d 	andeq	r0, r0, sp, lsr r0
    30a8:	0000f538 	andeq	pc, r0, r8, lsr r5	; <UNPREDICTABLE>
    30ac:	000001dc 	ldrdeq	r0, [r0], -ip
    30b0:	000025f4 	strdeq	r2, [r0], -r4
    30b4:	c2060102 	andgt	r0, r6, #-2147483648	; 0x80000000
    30b8:	02000000 	andeq	r0, r0, #0
    30bc:	01c30502 	biceq	r0, r3, r2, lsl #10
    30c0:	04020000 	streq	r0, [r2], #-0
    30c4:	00007c05 	andeq	r7, r0, r5, lsl #24
    30c8:	05080200 	streq	r0, [r8, #-512]	; 0xfffffe00
    30cc:	00000077 	andeq	r0, r0, r7, ror r0
    30d0:	c0080102 	andgt	r0, r8, r2, lsl #2
    30d4:	02000000 	andeq	r0, r0, #0
    30d8:	01b00702 	lslseq	r0, r2, #14
    30dc:	7c030000 	stcvc	0, cr0, [r3], {-0}
    30e0:	04000004 	streq	r0, [r0], #-4
    30e4:	00601934 	rsbeq	r1, r0, r4, lsr r9
    30e8:	4f040000 	svcmi	0x00040000
    30ec:	02000000 	andeq	r0, r0, #0
    30f0:	00ae0704 	adceq	r0, lr, r4, lsl #14
    30f4:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
    30f8:	0000a907 	andeq	sl, r0, r7, lsl #18
    30fc:	05040500 	streq	r0, [r4, #-1280]	; 0xfffffb00
    3100:	00746e69 	rsbseq	r6, r4, r9, ror #28
    3104:	b3070402 	movwlt	r0, #29698	; 0x7402
    3108:	06000000 	streq	r0, [r0], -r0
    310c:	00000879 	andeq	r0, r0, r9, ror r8
    3110:	08310244 	ldmdaeq	r1!, {r2, r6, r9}
    3114:	00000158 	andeq	r0, r0, r8, asr r1
    3118:	00707307 	rsbseq	r7, r0, r7, lsl #6
    311c:	4f0b3202 	svcmi	0x000b3202
    3120:	00000000 	andeq	r0, r0, r0
    3124:	00726c07 	rsbseq	r6, r2, r7, lsl #24
    3128:	4f0e3202 	svcmi	0x000e3202
    312c:	04000000 	streq	r0, [r0], #-0
    3130:	00307207 	eorseq	r7, r0, r7, lsl #4
    3134:	4f0b3302 	svcmi	0x000b3302
    3138:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
    313c:	00317207 	eorseq	r7, r1, r7, lsl #4
    3140:	4f0e3302 	svcmi	0x000e3302
    3144:	0c000000 	stceq	0, cr0, [r0], {-0}
    3148:	00327207 	eorseq	r7, r2, r7, lsl #4
    314c:	4f113302 	svcmi	0x00113302
    3150:	10000000 	andne	r0, r0, r0
    3154:	00337207 	eorseq	r7, r3, r7, lsl #4
    3158:	4f143302 	svcmi	0x00143302
    315c:	14000000 	strne	r0, [r0], #-0
    3160:	00347207 	eorseq	r7, r4, r7, lsl #4
    3164:	4f0b3402 	svcmi	0x000b3402
    3168:	18000000 	stmdane	r0, {}	; <UNPREDICTABLE>
    316c:	00357207 	eorseq	r7, r5, r7, lsl #4
    3170:	4f0e3402 	svcmi	0x000e3402
    3174:	1c000000 	stcne	0, cr0, [r0], {-0}
    3178:	00367207 	eorseq	r7, r6, r7, lsl #4
    317c:	4f113402 	svcmi	0x00113402
    3180:	20000000 	andcs	r0, r0, r0
    3184:	00377207 	eorseq	r7, r7, r7, lsl #4
    3188:	4f143402 	svcmi	0x00143402
    318c:	24000000 	strcs	r0, [r0], #-0
    3190:	00387207 	eorseq	r7, r8, r7, lsl #4
    3194:	4f0b3502 	svcmi	0x000b3502
    3198:	28000000 	stmdacs	r0, {}	; <UNPREDICTABLE>
    319c:	00397207 	eorseq	r7, r9, r7, lsl #4
    31a0:	4f0e3502 	svcmi	0x000e3502
    31a4:	2c000000 	stccs	0, cr0, [r0], {-0}
    31a8:	30317207 	eorscc	r7, r1, r7, lsl #4
    31ac:	11350200 	teqne	r5, r0, lsl #4
    31b0:	0000004f 	andeq	r0, r0, pc, asr #32
    31b4:	70660730 	rsbvc	r0, r6, r0, lsr r7
    31b8:	0b360200 	bleq	d839c0 <_stack+0xd039c0>
    31bc:	0000004f 	andeq	r0, r0, pc, asr #32
    31c0:	70690734 	rsbvc	r0, r9, r4, lsr r7
    31c4:	0e360200 	cdpeq	2, 3, cr0, cr6, cr0, {0}
    31c8:	0000004f 	andeq	r0, r0, pc, asr #32
    31cc:	63700738 	cmnvs	r0, #56, 14	; 0xe00000
    31d0:	0b370200 	bleq	dc39d8 <_stack+0xd439d8>
    31d4:	0000004f 	andeq	r0, r0, pc, asr #32
    31d8:	09f6083c 	ldmibeq	r6!, {r2, r3, r4, r5, fp}^
    31dc:	37020000 	strcc	r0, [r2, -r0]
    31e0:	00004f0e 	andeq	r4, r0, lr, lsl #30
    31e4:	02004000 	andeq	r4, r0, #0
    31e8:	00c90801 	sbceq	r0, r9, r1, lsl #16
    31ec:	28090000 	stmdacs	r9, {}	; <UNPREDICTABLE>
    31f0:	eb093003 	bl	24f204 <_stack+0x1cf204>
    31f4:	08000001 	stmdaeq	r0, {r0}
    31f8:	0000126c 	andeq	r1, r0, ip, ror #4
    31fc:	5b173103 	blpl	5cf610 <_stack+0x54f610>
    3200:	00000000 	andeq	r0, r0, r0
    3204:	00135008 	andseq	r5, r3, r8
    3208:	17320300 	ldrne	r0, [r2, -r0, lsl #6]!
    320c:	0000005b 	andeq	r0, r0, fp, asr r0
    3210:	13240804 			; <UNDEFINED> instruction: 0x13240804
    3214:	33030000 	movwcc	r0, #12288	; 0x3000
    3218:	00005b17 	andeq	r5, r0, r7, lsl fp
    321c:	60080800 	andvs	r0, r8, r0, lsl #16
    3220:	03000012 	movweq	r0, #18
    3224:	005b1734 	subseq	r1, fp, r4, lsr r7
    3228:	080c0000 	stmdaeq	ip, {}	; <UNPREDICTABLE>
    322c:	00001290 	muleq	r0, r0, r2
    3230:	5b173503 	blpl	5d0644 <_stack+0x550644>
    3234:	10000000 	andne	r0, r0, r0
    3238:	00129e08 	andseq	r9, r2, r8, lsl #28
    323c:	17360300 	ldrne	r0, [r6, -r0, lsl #6]!
    3240:	0000005b 	andeq	r0, r0, fp, asr r0
    3244:	127e0814 	rsbsne	r0, lr, #20, 16	; 0x140000
    3248:	37030000 	strcc	r0, [r3, -r0]
    324c:	00005b17 	andeq	r5, r0, r7, lsl fp
    3250:	32081800 	andcc	r1, r8, #0, 16
    3254:	03000013 	movweq	r0, #19
    3258:	005b1738 	subseq	r1, fp, r8, lsr r7
    325c:	081c0000 	ldmdaeq	ip, {}	; <UNPREDICTABLE>
    3260:	00001341 	andeq	r1, r0, r1, asr #6
    3264:	5b173903 	blpl	5d1678 <_stack+0x551678>
    3268:	20000000 	andcs	r0, r0, r0
    326c:	00120708 	andseq	r0, r2, r8, lsl #14
    3270:	173a0300 	ldrne	r0, [sl, -r0, lsl #6]!
    3274:	0000005b 	andeq	r0, r0, fp, asr r0
    3278:	b8030024 	stmdalt	r3, {r2, r5}
    327c:	03000012 	movweq	r0, #18
    3280:	015f073b 	cmpeq	pc, fp, lsr r7	; <UNPREDICTABLE>
    3284:	8a030000 	bhi	c328c <_stack+0x4328c>
    3288:	0300000a 	movweq	r0, #10
    328c:	0203103d 	andeq	r1, r3, #61	; 0x3d
    3290:	040a0000 	streq	r0, [sl], #-0
    3294:	00000209 	andeq	r0, r0, r9, lsl #4
    3298:	0002140b 	andeq	r1, r2, fp, lsl #8
    329c:	02140c00 	andseq	r0, r4, #0, 24
    32a0:	0a000000 	beq	32a8 <_start-0x4d58>
    32a4:	00007c04 	andeq	r7, r0, r4, lsl #24
    32a8:	11f60d00 	mvnsne	r0, r0, lsl #26
    32ac:	15010000 	strne	r0, [r1, #-0]
    32b0:	00022c1e 	andeq	r2, r2, lr, lsl ip
    32b4:	c8030500 	stmdagt	r3, {r8, sl}
    32b8:	0a0000fe 	beq	36b8 <_start-0x4948>
    32bc:	0001eb04 	andeq	lr, r1, r4, lsl #22
    32c0:	01f70e00 	mvnseq	r0, r0, lsl #28
    32c4:	02420000 	subeq	r0, r2, #0
    32c8:	750f0000 	strvc	r0, [pc, #-0]	; 32d0 <_start-0x4d30>
    32cc:	02000000 	andeq	r0, r0, #0
    32d0:	131c0d00 	tstne	ip, #0, 26
    32d4:	2c010000 	stccs	0, cr0, [r1], {-0}
    32d8:	00023210 	andeq	r3, r2, r0, lsl r2
    32dc:	cc030500 	cfstr32gt	mvfx0, [r3], {-0}
    32e0:	100000fe 	strdne	r0, [r0], -lr
    32e4:	000012ac 	andeq	r1, r0, ip, lsr #5
    32e8:	e4064d01 	str	r4, [r6], #-3329	; 0xfffff2ff
    32ec:	300000f6 	strdcc	r0, [r0], -r6
    32f0:	01000000 	mrseq	r0, (UNDEF: 0)
    32f4:	00027a9c 	muleq	r2, ip, sl
    32f8:	12d91100 	sbcsne	r1, r9, #0, 2
    32fc:	4d010000 	stcmi	0, cr0, [r1, #-0]
    3300:	00021427 	andeq	r1, r2, r7, lsr #8
    3304:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    3308:	12cd1000 	sbcne	r1, sp, #0
    330c:	47010000 	strmi	r0, [r1, -r0]
    3310:	00f69406 	rscseq	r9, r6, r6, lsl #8
    3314:	00005000 	andeq	r5, r0, r0
    3318:	a09c0100 	addsge	r0, ip, r0, lsl #2
    331c:	11000002 	tstne	r0, r2
    3320:	000012d9 	ldrdeq	r1, [r0], -r9
    3324:	14274701 	strtne	r4, [r7], #-1793	; 0xfffff8ff
    3328:	02000002 	andeq	r0, r0, #2
    332c:	12007491 	andne	r7, r0, #-1862270976	; 0x91000000
    3330:	0000130c 	andeq	r1, r0, ip, lsl #6
    3334:	f7093c01 			; <UNDEFINED> instruction: 0xf7093c01
    3338:	10000001 	andne	r0, r0, r1
    333c:	840000f6 	strhi	r0, [r0], #-246	; 0xffffff0a
    3340:	01000000 	mrseq	r0, (UNDEF: 0)
    3344:	0002ca9c 	muleq	r2, ip, sl
    3348:	12de1100 	sbcsne	r1, lr, #0, 2
    334c:	3c010000 	stccc	0, cr0, [r1], {-0}
    3350:	00004f1a 	andeq	r4, r0, sl, lsl pc
    3354:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    3358:	13141300 	tstne	r4, #0, 6
    335c:	2e010000 	cdpcs	0, 0, cr0, cr1, cr0, {0}
    3360:	00f57c06 	rscseq	r7, r5, r6, lsl #24
    3364:	00009400 	andeq	r9, r0, r0, lsl #8
    3368:	ff9c0100 			; <UNDEFINED> instruction: 0xff9c0100
    336c:	11000002 	tstne	r0, r2
    3370:	000012de 	ldrdeq	r1, [r0], -lr
    3374:	4f172e01 	svcmi	0x00172e01
    3378:	02000000 	andeq	r0, r0, #0
    337c:	66147491 			; <UNDEFINED> instruction: 0x66147491
    3380:	01006e75 	tsteq	r0, r5, ror lr
    3384:	01f7292e 	mvnseq	r2, lr, lsr #18
    3388:	91020000 	mrsls	r0, (UNDEF: 2)
    338c:	e7150070 			; <UNDEFINED> instruction: 0xe7150070
    3390:	01000012 	tsteq	r0, r2, lsl r0
    3394:	f55c0d25 			; <UNDEFINED> instruction: 0xf55c0d25
    3398:	00200000 	eoreq	r0, r0, r0
    339c:	9c010000 	stcls	0, cr0, [r1], {-0}
    33a0:	00000325 	andeq	r0, r0, r5, lsr #6
    33a4:	0012d911 	andseq	sp, r2, r1, lsl r9
    33a8:	32250100 	eorcc	r0, r5, #0, 2
    33ac:	00000214 	andeq	r0, r0, r4, lsl r2
    33b0:	00749102 	rsbseq	r9, r4, r2, lsl #2
    33b4:	0012f716 	andseq	pc, r2, r6, lsl r7	; <UNPREDICTABLE>
    33b8:	171b0100 	ldrne	r0, [fp, -r0, lsl #2]
    33bc:	0000022c 	andeq	r0, r0, ip, lsr #4
    33c0:	0000f538 	andeq	pc, r0, r8, lsr r5	; <UNPREDICTABLE>
    33c4:	00000024 	andeq	r0, r0, r4, lsr #32
    33c8:	4b009c01 	blmi	2a3d4 <__bss_end__+0x1a088>
    33cc:	04000001 	streq	r0, [r0], #-1
    33d0:	00082100 	andeq	r2, r8, r0, lsl #2
    33d4:	ce010400 	cfcpysgt	mvf0, mvf1
    33d8:	0c000000 	stceq	0, cr0, [r0], {-0}
    33dc:	0000139c 	muleq	r0, ip, r3
    33e0:	0000003d 	andeq	r0, r0, sp, lsr r0
    33e4:	0000f714 	andeq	pc, r0, r4, lsl r7	; <UNPREDICTABLE>
    33e8:	00000084 	andeq	r0, r0, r4, lsl #1
    33ec:	00002724 	andeq	r2, r0, r4, lsr #14
    33f0:	c2060102 	andgt	r0, r6, #-2147483648	; 0x80000000
    33f4:	02000000 	andeq	r0, r0, #0
    33f8:	01c30502 	biceq	r0, r3, r2, lsl #10
    33fc:	04020000 	streq	r0, [r2], #-0
    3400:	00007c05 	andeq	r7, r0, r5, lsl #24
    3404:	05080200 	streq	r0, [r8, #-512]	; 0xfffffe00
    3408:	00000077 	andeq	r0, r0, r7, ror r0
    340c:	c0080102 	andgt	r0, r8, r2, lsl #2
    3410:	02000000 	andeq	r0, r0, #0
    3414:	01b00702 	lslseq	r0, r2, #14
    3418:	7c030000 	stcvc	0, cr0, [r3], {-0}
    341c:	03000004 	movweq	r0, #4
    3420:	00601934 	rsbeq	r1, r0, r4, lsr r9
    3424:	4f040000 	svcmi	0x00040000
    3428:	02000000 	andeq	r0, r0, #0
    342c:	00ae0704 	adceq	r0, lr, r4, lsl #14
    3430:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
    3434:	0000a907 	andeq	sl, r0, r7, lsl #18
    3438:	05040500 	streq	r0, [r4, #-1280]	; 0xfffffb00
    343c:	00746e69 	rsbseq	r6, r4, r9, ror #28
    3440:	b3070402 	movwlt	r0, #29698	; 0x7402
    3444:	06000000 	streq	r0, [r0], -r0
    3448:	0915021c 	ldmdbeq	r5, {r2, r3, r4, r9}
    344c:	000000e1 	andeq	r0, r0, r1, ror #1
    3450:	0013e007 	andseq	lr, r3, r7
    3454:	17160200 	ldrne	r0, [r6, -r0, lsl #4]
    3458:	0000005b 	andeq	r0, r0, fp, asr r0
    345c:	13ef0700 	mvnne	r0, #0, 14
    3460:	17020000 	strne	r0, [r2, -r0]
    3464:	00005b17 	andeq	r5, r0, r7, lsl fp
    3468:	91070400 	tstls	r7, r0, lsl #8
    346c:	02000013 	andeq	r0, r0, #19
    3470:	005b1718 	subseq	r1, fp, r8, lsl r7
    3474:	07080000 	streq	r0, [r8, -r0]
    3478:	0000136d 	andeq	r1, r0, sp, ror #6
    347c:	5b171902 	blpl	5c988c <_stack+0x54988c>
    3480:	0c000000 	stceq	0, cr0, [r0], {-0}
    3484:	00137607 	andseq	r7, r3, r7, lsl #12
    3488:	171a0200 	ldrne	r0, [sl, -r0, lsl #4]
    348c:	0000005b 	andeq	r0, r0, fp, asr r0
    3490:	137f0710 	cmnne	pc, #16, 14	; 0x400000
    3494:	1b020000 	blne	8349c <_stack+0x349c>
    3498:	00005b17 	andeq	r5, r0, r7, lsl fp
    349c:	88071400 	stmdahi	r7, {sl, ip}
    34a0:	02000013 	andeq	r0, r0, #19
    34a4:	005b171c 	subseq	r1, fp, ip, lsl r7
    34a8:	00180000 	andseq	r0, r8, r0
    34ac:	00142203 	andseq	r2, r4, r3, lsl #4
    34b0:	071d0200 	ldreq	r0, [sp, -r0, lsl #4]
    34b4:	0000007c 	andeq	r0, r0, ip, ror r0
    34b8:	00135e08 	andseq	r5, r3, r8, lsl #28
    34bc:	190f0100 	stmdbne	pc, {r8}	; <UNPREDICTABLE>
    34c0:	000000ff 	strdeq	r0, [r0], -pc	; <UNPREDICTABLE>
    34c4:	fed80305 	cdp2	3, 13, cr0, cr8, cr5, {0}
    34c8:	04090000 	streq	r0, [r9], #-0
    34cc:	000000e1 	andeq	r0, r0, r1, ror #1
    34d0:	00140d0a 	andseq	r0, r4, sl, lsl #26
    34d4:	06160100 	ldreq	r0, [r6], -r0, lsl #2
    34d8:	0000f738 	andeq	pc, r0, r8, lsr r7	; <UNPREDICTABLE>
    34dc:	00000060 	andeq	r0, r0, r0, rrx
    34e0:	01389c01 	teqeq	r8, r1, lsl #24
    34e4:	750b0000 	strvc	r0, [fp, #-0]
    34e8:	16010073 			; <UNDEFINED> instruction: 0x16010073
    34ec:	00004f25 	andeq	r4, r0, r5, lsr #30
    34f0:	6c910200 	lfmvs	f0, 4, [r1], {0}
    34f4:	0073740c 	rsbseq	r7, r3, ip, lsl #8
    34f8:	5b171801 	blpl	5c9504 <_stack+0x549504>
    34fc:	02000000 	andeq	r0, r0, #0
    3500:	0d007491 	cfstrseq	mvf7, [r0, #-580]	; 0xfffffdbc
    3504:	000013fa 	strdeq	r1, [r0], -sl
    3508:	ff121101 			; <UNDEFINED> instruction: 0xff121101
    350c:	14000000 	strne	r0, [r0], #-0
    3510:	240000f7 	strcs	r0, [r0], #-247	; 0xffffff09
    3514:	01000000 	mrseq	r0, (UNDEF: 0)
    3518:	01c6009c 			; <UNDEFINED> instruction: 0x01c6009c
    351c:	00040000 	andeq	r0, r4, r0
    3520:	000008f5 	strdeq	r0, [r0], -r5
    3524:	00ce0104 	sbceq	r0, lr, r4, lsl #2
    3528:	370c0000 	strcc	r0, [ip, -r0]
    352c:	3d000014 	stccc	0, cr0, [r0, #-80]	; 0xffffffb0
    3530:	98000000 	stmdals	r0, {}	; <UNPREDICTABLE>
    3534:	3c0000f7 	stccc	0, cr0, [r0], {247}	; 0xf7
    3538:	08000000 	stmdaeq	r0, {}	; <UNPREDICTABLE>
    353c:	02000028 	andeq	r0, r0, #40	; 0x28
    3540:	00c20601 	sbceq	r0, r2, r1, lsl #12
    3544:	02020000 	andeq	r0, r2, #0
    3548:	0001c305 	andeq	ip, r1, r5, lsl #6
    354c:	05040200 	streq	r0, [r4, #-512]	; 0xfffffe00
    3550:	0000007c 	andeq	r0, r0, ip, ror r0
    3554:	77050802 	strvc	r0, [r5, -r2, lsl #16]
    3558:	02000000 	andeq	r0, r0, #0
    355c:	00c00801 	sbceq	r0, r0, r1, lsl #16
    3560:	02020000 	andeq	r0, r2, #0
    3564:	0001b007 	andeq	fp, r1, r7
    3568:	047c0300 	ldrbteq	r0, [ip], #-768	; 0xfffffd00
    356c:	34020000 	strcc	r0, [r2], #-0
    3570:	00006519 	andeq	r6, r0, r9, lsl r5
    3574:	004f0400 	subeq	r0, pc, r0, lsl #8
    3578:	5b050000 	blpl	143580 <_stack+0xc3580>
    357c:	02000000 	andeq	r0, r0, #0
    3580:	00ae0704 	adceq	r0, lr, r4, lsl #14
    3584:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
    3588:	0000a907 	andeq	sl, r0, r7, lsl #18
    358c:	05040600 	streq	r0, [r4, #-1536]	; 0xfffffa00
    3590:	00746e69 	rsbseq	r6, r4, r9, ror #28
    3594:	b3070402 	movwlt	r0, #29698	; 0x7402
    3598:	03000000 	movweq	r0, #0
    359c:	000010b2 	strheq	r1, [r0], -r2
    35a0:	5b1b1c03 	blpl	6ca5b4 <_stack+0x64a5b4>
    35a4:	03000000 	movweq	r0, #0
    35a8:	000011b0 			; <UNDEFINED> instruction: 0x000011b0
    35ac:	60211d03 	eorvs	r1, r1, r3, lsl #26
    35b0:	07000000 	streq	r0, [r0, -r0]
    35b4:	09120444 	ldmdbeq	r2, {r2, r6, sl}
    35b8:	0000017d 	andeq	r0, r0, sp, ror r1
    35bc:	00524408 	subseq	r4, r2, r8, lsl #8
    35c0:	81101304 	tsthi	r0, r4, lsl #6
    35c4:	00000000 	andeq	r0, r0, r0
    35c8:	00149809 	andseq	r9, r4, r9, lsl #16
    35cc:	0f140400 	svceq	0x00140400
    35d0:	00000081 	andeq	r0, r0, r1, lsl #1
    35d4:	0fa20904 	svceq	0x00a20904
    35d8:	15040000 	strne	r0, [r4, #-0]
    35dc:	00008d12 	andeq	r8, r0, r2, lsl sp
    35e0:	ac090800 	stcge	8, cr0, [r9], {-0}
    35e4:	0400000f 	streq	r0, [r0], #-15
    35e8:	008d1216 	addeq	r1, sp, r6, lsl r2
    35ec:	090c0000 	stmdbeq	ip, {}	; <UNPREDICTABLE>
    35f0:	00000fb6 			; <UNDEFINED> instruction: 0x00000fb6
    35f4:	8d121704 	ldchi	7, cr1, [r2, #-16]
    35f8:	10000000 	andne	r0, r0, r0
    35fc:	000fc009 	andeq	ip, pc, r9
    3600:	12180400 	andsne	r0, r8, #0, 8
    3604:	0000008d 	andeq	r0, r0, sp, lsl #1
    3608:	52460814 	subpl	r0, r6, #20, 16	; 0x140000
    360c:	0f190400 	svceq	0x00190400
    3610:	00000081 	andeq	r0, r0, r1, lsl #1
    3614:	14320918 	ldrtne	r0, [r2], #-2328	; 0xfffff6e8
    3618:	1a040000 	bne	103620 <_stack+0x83620>
    361c:	00008d0f 	andeq	r8, r0, pc, lsl #26
    3620:	9f091c00 	svcls	0x00091c00
    3624:	04000014 	streq	r0, [r0], #-20	; 0xffffffec
    3628:	00810f1b 	addeq	r0, r1, fp, lsl pc
    362c:	09200000 	stmdbeq	r0!, {}	; <UNPREDICTABLE>
    3630:	000014be 			; <UNDEFINED> instruction: 0x000014be
    3634:	810f1c04 	tsthi	pc, r4, lsl #24
    3638:	24000000 	strcs	r0, [r0], #-0
    363c:	0014a409 	andseq	sl, r4, r9, lsl #8
    3640:	0f1d0400 	svceq	0x001d0400
    3644:	00000081 	andeq	r0, r0, r1, lsl #1
    3648:	52430828 	subpl	r0, r3, #40, 16	; 0x280000
    364c:	0f1e0400 	svceq	0x001e0400
    3650:	00000081 	andeq	r0, r0, r1, lsl #1
    3654:	14b9092c 	ldrtne	r0, [r9], #2348	; 0x92c
    3658:	1f040000 	svcne	0x00040000
    365c:	00008110 	andeq	r8, r0, r0, lsl r1
    3660:	b4093000 	strlt	r3, [r9], #-0
    3664:	04000014 	streq	r0, [r0], #-20	; 0xffffffec
    3668:	00810f20 	addeq	r0, r1, r0, lsr #30
    366c:	08340000 	ldmdaeq	r4!, {}	; <UNPREDICTABLE>
    3670:	00534952 	subseq	r4, r3, r2, asr r9
    3674:	810f2104 	tsthi	pc, r4, lsl #2
    3678:	38000000 	stmdacc	r0, {}	; <UNPREDICTABLE>
    367c:	53494d08 	movtpl	r4, #40200	; 0x9d08
    3680:	0f220400 	svceq	0x00220400
    3684:	00000081 	andeq	r0, r0, r1, lsl #1
    3688:	4349083c 	movtmi	r0, #38972	; 0x983c
    368c:	23040052 	movwcs	r0, #16466	; 0x4052
    3690:	0000810f 	andeq	r8, r0, pc, lsl #2
    3694:	03004000 	movweq	r4, #0
    3698:	000014a9 	andeq	r1, r0, r9, lsr #9
    369c:	99032404 	stmdbls	r3, {r2, sl, sp}
    36a0:	0a000000 	beq	36a8 <_start-0x4958>
    36a4:	00001484 	andeq	r1, r0, r4, lsl #9
    36a8:	9b150d01 	blls	546ab4 <_stack+0x4c6ab4>
    36ac:	05000001 	streq	r0, [r0, #-1]
    36b0:	00fedc03 	rscseq	sp, lr, r3, lsl #24
    36b4:	7d040b00 	vstrvc	d0, [r4, #-0]
    36b8:	0c000001 	stceq	0, cr0, [r0], {1}
    36bc:	00001477 	andeq	r1, r0, r7, ror r4
    36c0:	bc061301 	stclt	3, cr1, [r6], {1}
    36c4:	180000f7 	stmdane	r0, {r0, r1, r2, r4, r5, r6, r7}
    36c8:	01000000 	mrseq	r0, (UNDEF: 0)
    36cc:	148c0d9c 	strne	r0, [ip], #3484	; 0xd9c
    36d0:	0f010000 	svceq	0x00010000
    36d4:	00019b0e 	andeq	r9, r1, lr, lsl #22
    36d8:	00f79800 	rscseq	r9, r7, r0, lsl #16
    36dc:	00002400 	andeq	r2, r0, r0, lsl #8
    36e0:	009c0100 	addseq	r0, ip, r0, lsl #2
    36e4:	0000028c 	andeq	r0, r0, ip, lsl #5
    36e8:	09bd0004 	ldmibeq	sp!, {r2}
    36ec:	01040000 	mrseq	r0, (UNDEF: 4)
    36f0:	000000ce 	andeq	r0, r0, lr, asr #1
    36f4:	0014fe0c 	andseq	pc, r4, ip, lsl #28
    36f8:	00003d00 	andeq	r3, r0, r0, lsl #26
    36fc:	00f7d400 	rscseq	sp, r7, r0, lsl #8
    3700:	0003cc00 	andeq	ip, r3, r0, lsl #24
    3704:	0028d600 	eoreq	sp, r8, r0, lsl #12
    3708:	06010200 	streq	r0, [r1], -r0, lsl #4
    370c:	000000c2 	andeq	r0, r0, r2, asr #1
    3710:	c3050202 	movwgt	r0, #20994	; 0x5202
    3714:	02000001 	andeq	r0, r0, #1
    3718:	007c0504 	rsbseq	r0, ip, r4, lsl #10
    371c:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
    3720:	00007705 	andeq	r7, r0, r5, lsl #14
    3724:	08010200 	stmdaeq	r1, {r9}
    3728:	000000c0 	andeq	r0, r0, r0, asr #1
    372c:	b0070202 	andlt	r0, r7, r2, lsl #4
    3730:	03000001 	movweq	r0, #1
    3734:	0000047c 	andeq	r0, r0, ip, ror r4
    3738:	5b193403 	blpl	65074c <_stack+0x5d074c>
    373c:	02000000 	andeq	r0, r0, #0
    3740:	00ae0704 	adceq	r0, lr, r4, lsl #14
    3744:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
    3748:	0000a907 	andeq	sl, r0, r7, lsl #18
    374c:	05040400 	streq	r0, [r4, #-1024]	; 0xfffffc00
    3750:	00746e69 	rsbseq	r6, r4, r9, ror #28
    3754:	b3070402 	movwlt	r0, #29698	; 0x7402
    3758:	05000000 	streq	r0, [r0, #-0]
    375c:	000014e5 	andeq	r1, r0, r5, ror #9
    3760:	10170208 	andsne	r0, r7, r8, lsl #4
    3764:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
    3768:	0014c306 	andseq	ip, r4, r6, lsl #6
    376c:	0b180200 	bleq	603f74 <_stack+0x583f74>
    3770:	0000004f 	andeq	r0, r0, pc, asr #32
    3774:	15480600 	strbne	r0, [r8, #-1536]	; 0xfffffa00
    3778:	19020000 	stmdbne	r2, {}	; <UNPREDICTABLE>
    377c:	00009f19 	andeq	r9, r0, r9, lsl pc
    3780:	07000400 	streq	r0, [r0, -r0, lsl #8]
    3784:	00007704 	andeq	r7, r0, r4, lsl #14
    3788:	14e70300 	strbtne	r0, [r7], #768	; 0x300
    378c:	1a020000 	bne	83794 <_stack+0x3794>
    3790:	00007703 	andeq	r7, r0, r3, lsl #14
    3794:	153c0800 	ldrne	r0, [ip, #-2048]!	; 0xfffff800
    3798:	0e010000 	cdpeq	0, 0, cr0, cr1, cr0, {0}
    379c:	0000c316 	andeq	ip, r0, r6, lsl r3
    37a0:	e0030500 	and	r0, r3, r0, lsl #10
    37a4:	070000fe 			; <UNDEFINED> instruction: 0x070000fe
    37a8:	0000a504 	andeq	sl, r0, r4, lsl #10
    37ac:	155b0900 	ldrbne	r0, [fp, #-2304]	; 0xfffff700
    37b0:	59010000 	stmdbpl	r1, {}	; <UNPREDICTABLE>
    37b4:	00004f0a 	andeq	r4, r0, sl, lsl #30
    37b8:	00fb1c00 	rscseq	r1, fp, r0, lsl #24
    37bc:	00008400 	andeq	r8, r0, r0, lsl #8
    37c0:	1a9c0100 	bne	fe703bc8 <_stack+0xfe683bc8>
    37c4:	0a000001 	beq	37d0 <_start-0x4830>
    37c8:	59010061 	stmdbpl	r1, {r0, r5, r6}
    37cc:	00011a17 	andeq	r1, r1, r7, lsl sl
    37d0:	6c910200 	lfmvs	f0, 4, [r1], {0}
    37d4:	0100620a 	tsteq	r0, sl, lsl #4
    37d8:	011a2159 	tsteq	sl, r9, asr r1
    37dc:	91020000 	mrsls	r0, (UNDEF: 2)
    37e0:	656c0a68 	strbvs	r0, [ip, #-2664]!	; 0xfffff598
    37e4:	5901006e 	stmdbpl	r1, {r1, r2, r3, r5, r6}
    37e8:	00004f2d 	andeq	r4, r0, sp, lsr #30
    37ec:	64910200 	ldrvs	r0, [r1], #512	; 0x200
    37f0:	0100690b 	tsteq	r0, fp, lsl #18
    37f4:	004f0b5a 	subeq	r0, pc, sl, asr fp	; <UNPREDICTABLE>
    37f8:	91020000 	mrsls	r0, (UNDEF: 2)
    37fc:	04070074 	streq	r0, [r7], #-116	; 0xffffff8c
    3800:	00000120 	andeq	r0, r0, r0, lsr #2
    3804:	c9080102 	stmdbgt	r8, {r1, r8}
    3808:	0c000000 	stceq	0, cr0, [r0], {-0}
    380c:	000014d6 	ldrdeq	r1, [r0], -r6
    3810:	b0065201 	andlt	r5, r6, r1, lsl #4
    3814:	6c0000fa 	stcvs	0, cr0, [r0], {250}	; 0xfa
    3818:	01000000 	mrseq	r0, (UNDEF: 0)
    381c:	0001749c 	muleq	r1, ip, r4
    3820:	00620a00 	rsbeq	r0, r2, r0, lsl #20
    3824:	1a135201 	bne	4d8030 <_stack+0x458030>
    3828:	02000001 	andeq	r0, r0, #1
    382c:	630a6c91 	movwvs	r6, #44177	; 0xac91
    3830:	1b520100 	blne	1483c38 <_stack+0x1403c38>
    3834:	00000120 	andeq	r0, r0, r0, lsr #2
    3838:	0a6b9102 	beq	1ae7c48 <_stack+0x1a67c48>
    383c:	006e656c 	rsbeq	r6, lr, ip, ror #10
    3840:	4f275201 	svcmi	0x00275201
    3844:	02000000 	andeq	r0, r0, #0
    3848:	690b6491 	stmdbvs	fp, {r0, r4, r7, sl, sp, lr}
    384c:	0b530100 	bleq	14c3c54 <_stack+0x1443c54>
    3850:	0000004f 	andeq	r0, r0, pc, asr #32
    3854:	00749102 	rsbseq	r9, r4, r2, lsl #2
    3858:	00154e0c 	andseq	r4, r5, ip, lsl #28
    385c:	064b0100 	strbeq	r0, [fp], -r0, lsl #2
    3860:	0000fa3c 	andeq	pc, r0, ip, lsr sl	; <UNPREDICTABLE>
    3864:	00000074 	andeq	r0, r0, r4, ror r0
    3868:	01c49c01 	biceq	r9, r4, r1, lsl #24
    386c:	740a0000 	strvc	r0, [sl], #-0
    3870:	4b01006f 	blmi	43a34 <__bss_end__+0x336e8>
    3874:	00011a13 	andeq	r1, r1, r3, lsl sl
    3878:	6c910200 	lfmvs	f0, 4, [r1], {0}
    387c:	0014c90d 	andseq	ip, r4, sp, lsl #18
    3880:	1e4b0100 	dvfnee	f0, f3, f0
    3884:	0000011a 	andeq	r0, r0, sl, lsl r1
    3888:	0a689102 	beq	1a27c98 <_stack+0x19a7c98>
    388c:	006e656c 	rsbeq	r6, lr, ip, ror #10
    3890:	4f2d4b01 	svcmi	0x002d4b01
    3894:	02000000 	andeq	r0, r0, #0
    3898:	690b6491 	stmdbvs	fp, {r0, r4, r7, sl, sp, lr}
    389c:	0b4c0100 	bleq	1303ca4 <_stack+0x1283ca4>
    38a0:	0000004f 	andeq	r0, r0, pc, asr #32
    38a4:	00749102 	rsbseq	r9, r4, r2, lsl #2
    38a8:	00156b0c 	andseq	r6, r5, ip, lsl #22
    38ac:	06330100 	ldrteq	r0, [r3], -r0, lsl #2
    38b0:	0000f944 	andeq	pc, r0, r4, asr #18
    38b4:	000000f8 	strdeq	r0, [r0], -r8
    38b8:	02179c01 	andseq	r9, r7, #256	; 0x100
    38bc:	700a0000 	andvc	r0, sl, r0
    38c0:	01007274 	tsteq	r0, r4, ror r2
    38c4:	02171233 	andseq	r1, r7, #805306371	; 0x30000003
    38c8:	91020000 	mrsls	r0, (UNDEF: 2)
    38cc:	15680864 	strbne	r0, [r8, #-2148]!	; 0xfffff79c
    38d0:	34010000 	strcc	r0, [r1], #-0
    38d4:	0000c310 	andeq	ip, r0, r0, lsl r3
    38d8:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    38dc:	0014ce08 	andseq	ip, r4, r8, lsl #28
    38e0:	26340100 	ldrtcs	r0, [r4], -r0, lsl #2
    38e4:	000000c3 	andeq	r0, r0, r3, asr #1
    38e8:	08709102 	ldmdaeq	r0!, {r1, r8, ip, pc}^
    38ec:	00001554 	andeq	r1, r0, r4, asr r5
    38f0:	c3373401 	teqgt	r7, #16777216	; 0x1000000
    38f4:	02000000 	andeq	r0, r0, #0
    38f8:	0e006c91 	mcreq	12, 0, r6, cr0, cr1, {4}
    38fc:	15610904 	strbne	r0, [r1, #-2308]!	; 0xfffff6fc
    3900:	15010000 	strne	r0, [r1, #-0]
    3904:	00021708 	andeq	r1, r2, r8, lsl #14
    3908:	00f81400 	rscseq	r1, r8, r0, lsl #8
    390c:	00013000 	andeq	r3, r1, r0
    3910:	7d9c0100 	ldfvcs	f0, [ip]
    3914:	0a000002 	beq	3924 <_start-0x46dc>
    3918:	1501006e 	strne	r0, [r1, #-110]	; 0xffffff92
    391c:	00004f18 	andeq	r4, r0, r8, lsl pc
    3920:	64910200 	ldrvs	r0, [r1], #512	; 0x200
    3924:	00156808 	andseq	r6, r5, r8, lsl #16
    3928:	10160100 	andsne	r0, r6, r0, lsl #2
    392c:	000000c3 	andeq	r0, r0, r3, asr #1
    3930:	08749102 	ldmdaeq	r4!, {r1, r8, ip, pc}^
    3934:	000014ce 	andeq	r1, r0, lr, asr #9
    3938:	c3261601 			; <UNDEFINED> instruction: 0xc3261601
    393c:	02000000 	andeq	r0, r0, #0
    3940:	46087091 			; <UNDEFINED> instruction: 0x46087091
    3944:	01000015 	tsteq	r0, r5, lsl r0
    3948:	00c33716 	sbceq	r3, r3, r6, lsl r7
    394c:	91020000 	mrsls	r0, (UNDEF: 2)
    3950:	14f3086c 	ldrbtne	r0, [r3], #2156	; 0x86c
    3954:	17010000 	strne	r0, [r1, -r0]
    3958:	00021709 	andeq	r1, r2, r9, lsl #14
    395c:	68910200 	ldmvs	r1, {r9}
    3960:	14dc0f00 	ldrbne	r0, [ip], #3840	; 0xf00
    3964:	10010000 	andne	r0, r1, r0
    3968:	00f7d406 	rscseq	sp, r7, r6, lsl #8
    396c:	00004000 	andeq	r4, r0, r0
    3970:	009c0100 	addseq	r0, ip, r0, lsl #2
    3974:	00000159 	andeq	r0, r0, r9, asr r1
    3978:	0ac00004 	beq	ff003990 <_stack+0xfef83990>
    397c:	01040000 	mrseq	r0, (UNDEF: 4)
    3980:	000000ce 	andeq	r0, r0, lr, asr #1
    3984:	0015770c 	andseq	r7, r5, ip, lsl #14
    3988:	00003d00 	andeq	r3, r0, r0, lsl #26
    398c:	00fba000 	rscseq	sl, fp, r0
    3990:	00023000 	andeq	r3, r2, r0
    3994:	002abe00 	eoreq	fp, sl, r0, lsl #28
    3998:	06010200 	streq	r0, [r1], -r0, lsl #4
    399c:	000000c2 	andeq	r0, r0, r2, asr #1
    39a0:	c3050202 	movwgt	r0, #20994	; 0x5202
    39a4:	02000001 	andeq	r0, r0, #1
    39a8:	007c0504 	rsbseq	r0, ip, r4, lsl #10
    39ac:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
    39b0:	00007705 	andeq	r7, r0, r5, lsl #14
    39b4:	08010200 	stmdaeq	r1, {r9}
    39b8:	000000c0 	andeq	r0, r0, r0, asr #1
    39bc:	b0070202 	andlt	r0, r7, r2, lsl #4
    39c0:	02000001 	andeq	r0, r0, #1
    39c4:	00ae0704 	adceq	r0, lr, r4, lsl #14
    39c8:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
    39cc:	0000a907 	andeq	sl, r0, r7, lsl #18
    39d0:	05040300 	streq	r0, [r4, #-768]	; 0xfffffd00
    39d4:	00746e69 	rsbseq	r6, r4, r9, ror #28
    39d8:	b3070402 	movwlt	r0, #29698	; 0x7402
    39dc:	02000000 	andeq	r0, r0, #0
    39e0:	00c90801 	sbceq	r0, r9, r1, lsl #16
    39e4:	04040000 	streq	r0, [r4], #-0
    39e8:	000a6e05 	andeq	r6, sl, r5, lsl #28
    39ec:	06330100 	ldrteq	r0, [r3], -r0, lsl #2
    39f0:	0000fd2c 	andeq	pc, r0, ip, lsr #26
    39f4:	000000a4 	andeq	r0, r0, r4, lsr #1
    39f8:	00c79c01 	sbceq	r9, r7, r1, lsl #24
    39fc:	75060000 	strvc	r0, [r6, #-0]
    3a00:	01000005 	tsteq	r0, r5
    3a04:	00721233 	rsbseq	r1, r2, r3, lsr r2
    3a08:	91020000 	mrsls	r0, (UNDEF: 2)
    3a0c:	15c10764 	strbne	r0, [r1, #1892]	; 0x764
    3a10:	35010000 	strcc	r0, [r1, #-0]
    3a14:	00005d07 	andeq	r5, r0, r7, lsl #26
    3a18:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    3a1c:	0015c907 	andseq	ip, r5, r7, lsl #18
    3a20:	10350100 	eorsne	r0, r5, r0, lsl #2
    3a24:	0000005d 	andeq	r0, r0, sp, asr r0
    3a28:	07709102 	ldrbeq	r9, [r0, -r2, lsl #2]!
    3a2c:	000015d1 	ldrdeq	r1, [r0], -r1	; <UNPREDICTABLE>
    3a30:	5d193501 	cfldr32pl	mvfx3, [r9, #-4]
    3a34:	02000000 	andeq	r0, r0, #0
    3a38:	05006c91 	streq	r6, [r0, #-3217]	; 0xfffff36f
    3a3c:	000015ba 			; <UNDEFINED> instruction: 0x000015ba
    3a40:	a0062401 	andge	r2, r6, r1, lsl #8
    3a44:	8c0000fc 	stchi	0, cr0, [r0], {252}	; 0xfc
    3a48:	01000000 	mrseq	r0, (UNDEF: 0)
    3a4c:	0000fa9c 	muleq	r0, ip, sl
    3a50:	05750600 	ldrbeq	r0, [r5, #-1536]!	; 0xfffffa00
    3a54:	24010000 	strcs	r0, [r1], #-0
    3a58:	00007214 	andeq	r7, r0, r4, lsl r2
    3a5c:	6c910200 	lfmvs	f0, 4, [r1], {0}
    3a60:	01006908 	tsteq	r0, r8, lsl #18
    3a64:	005d0725 	subseq	r0, sp, r5, lsr #14
    3a68:	91020000 	mrsls	r0, (UNDEF: 2)
    3a6c:	70050074 	andvc	r0, r5, r4, ror r0
    3a70:	01000015 	tsteq	r0, r5, lsl r0
    3a74:	fc140615 	ldc2	6, cr0, [r4], {21}
    3a78:	008c0000 	addeq	r0, ip, r0
    3a7c:	9c010000 	stcls	0, cr0, [r1], {-0}
    3a80:	0000012d 	andeq	r0, r0, sp, lsr #2
    3a84:	00057506 	andeq	r7, r5, r6, lsl #10
    3a88:	14150100 	ldrne	r0, [r5], #-256	; 0xffffff00
    3a8c:	00000072 	andeq	r0, r0, r2, ror r0
    3a90:	086c9102 	stmdaeq	ip!, {r1, r8, ip, pc}^
    3a94:	16010069 	strne	r0, [r1], -r9, rrx
    3a98:	00005d07 	andeq	r5, r0, r7, lsl #26
    3a9c:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    3aa0:	15b30900 	ldrne	r0, [r3, #2304]!	; 0x900
    3aa4:	08010000 	stmdaeq	r1, {}	; <UNPREDICTABLE>
    3aa8:	00fba006 	rscseq	sl, fp, r6
    3aac:	00007400 	andeq	r7, r0, r0, lsl #8
    3ab0:	069c0100 	ldreq	r0, [ip], r0, lsl #2
    3ab4:	00000575 	andeq	r0, r0, r5, ror r5
    3ab8:	72140801 	andsvc	r0, r4, #65536	; 0x10000
    3abc:	02000000 	andeq	r0, r0, #0
    3ac0:	69086c91 	stmdbvs	r8, {r0, r4, r7, sl, fp, sp, lr}
    3ac4:	07090100 	streq	r0, [r9, -r0, lsl #2]
    3ac8:	0000005d 	andeq	r0, r0, sp, asr r0
    3acc:	00749102 	rsbseq	r9, r4, r2, lsl #2
	...

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	10001101 	andne	r1, r0, r1, lsl #2
   4:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
   8:	1b0e0301 	blne	380c14 <_stack+0x300c14>
   c:	130e250e 	movwne	r2, #58638	; 0xe50e
  10:	00000005 	andeq	r0, r0, r5
  14:	25011101 	strcs	r1, [r1, #-257]	; 0xfffffeff
  18:	030b130e 	movweq	r1, #45838	; 0xb30e
  1c:	110e1b0e 	tstne	lr, lr, lsl #22
  20:	10061201 	andne	r1, r6, r1, lsl #4
  24:	02000017 	andeq	r0, r0, #23
  28:	0b0b0024 	bleq	2c00c0 <_stack+0x2400c0>
  2c:	0e030b3e 	vmoveq.16	d3[0], r0
  30:	24030000 	strcs	r0, [r3], #-0
  34:	3e0b0b00 	vmlacc.f64	d0, d11, d0
  38:	0008030b 	andeq	r0, r8, fp, lsl #6
  3c:	00340400 	eorseq	r0, r4, r0, lsl #8
  40:	0b3a0e03 	bleq	e83854 <_stack+0xe03854>
  44:	0b390b3b 	bleq	e42d38 <_stack+0xdc2d38>
  48:	193f1349 	ldmdbne	pc!, {r0, r3, r6, r8, r9, ip}	; <UNPREDICTABLE>
  4c:	0000193c 	andeq	r1, r0, ip, lsr r9
  50:	3f012e05 	svccc	0x00012e05
  54:	3a0e0319 	bcc	380cc0 <_stack+0x300cc0>
  58:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
  5c:	1119270b 	tstne	r9, fp, lsl #14
  60:	40061201 	andmi	r1, r6, r1, lsl #4
  64:	19429618 	stmdbne	r2, {r3, r4, r9, sl, ip, pc}^
  68:	00001301 	andeq	r1, r0, r1, lsl #6
  6c:	03000506 	movweq	r0, #1286	; 0x506
  70:	3b0b3a08 	blcc	2ce898 <_stack+0x24e898>
  74:	490b390b 	stmdbmi	fp, {r0, r1, r3, r8, fp, ip, sp}
  78:	00180213 	andseq	r0, r8, r3, lsl r2
  7c:	00340700 	eorseq	r0, r4, r0, lsl #14
  80:	0b3a0803 	bleq	e82094 <_stack+0xe02094>
  84:	0b390b3b 	bleq	e42d78 <_stack+0xdc2d78>
  88:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
  8c:	34080000 	strcc	r0, [r8], #-0
  90:	3a0e0300 	bcc	380c98 <_stack+0x300c98>
  94:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
  98:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
  9c:	09000018 	stmdbeq	r0, {r3, r4}
  a0:	0b0b000f 	bleq	2c00e4 <_stack+0x2400e4>
  a4:	00001349 	andeq	r1, r0, r9, asr #6
  a8:	01110100 	tsteq	r1, r0, lsl #2
  ac:	0b130e25 	bleq	4c3948 <_stack+0x443948>
  b0:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
  b4:	06120111 			; <UNDEFINED> instruction: 0x06120111
  b8:	00001710 	andeq	r1, r0, r0, lsl r7
  bc:	0b002402 	bleq	90cc <initmt+0x40c>
  c0:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
  c4:	0300000e 	movweq	r0, #14
  c8:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
  cc:	0b3b0b3a 	bleq	ec2dbc <_stack+0xe42dbc>
  d0:	13490b39 	movtne	r0, #39737	; 0x9b39
  d4:	24040000 	strcs	r0, [r4], #-0
  d8:	3e0b0b00 	vmlacc.f64	d0, d11, d0
  dc:	0008030b 	andeq	r0, r8, fp, lsl #6
  e0:	00350500 	eorseq	r0, r5, r0, lsl #10
  e4:	00001349 	andeq	r1, r0, r9, asr #6
  e8:	03011306 	movweq	r1, #4870	; 0x1306
  ec:	3a0b0b0e 	bcc	2c2d2c <_stack+0x242d2c>
  f0:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
  f4:	0013010b 	andseq	r0, r3, fp, lsl #2
  f8:	000d0700 	andeq	r0, sp, r0, lsl #14
  fc:	0b3a0803 	bleq	e82110 <_stack+0xe02110>
 100:	0b390b3b 	bleq	e42df4 <_stack+0xdc2df4>
 104:	0b381349 	bleq	e04e30 <_stack+0xd84e30>
 108:	0d080000 	stceq	0, cr0, [r8, #-0]
 10c:	3a0e0300 	bcc	380d14 <_stack+0x300d14>
 110:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 114:	3813490b 	ldmdacc	r3, {r0, r1, r3, r8, fp, lr}
 118:	0900000b 	stmdbeq	r0, {r0, r1, r3}
 11c:	0b0b000f 	bleq	2c0160 <_stack+0x240160>
 120:	00001349 	andeq	r1, r0, r9, asr #6
 124:	0b000f0a 	bleq	3d54 <_start-0x42ac>
 128:	0b00000b 	bleq	15c <_start-0x7ea4>
 12c:	19270115 	stmdbne	r7!, {r0, r2, r4, r8}
 130:	00001301 	andeq	r1, r0, r1, lsl #6
 134:	4900050c 	stmdbmi	r0, {r2, r3, r8, sl}
 138:	0d000013 	stceq	0, cr0, [r0, #-76]	; 0xffffffb4
 13c:	08030016 	stmdaeq	r3, {r1, r2, r4}
 140:	0b3b0b3a 	bleq	ec2e30 <_stack+0xe42e30>
 144:	13490b39 	movtne	r0, #39737	; 0x9b39
 148:	040e0000 	streq	r0, [lr], #-0
 14c:	0b0b3e01 	bleq	2cf958 <_stack+0x24f958>
 150:	3a13490b 	bcc	4d2584 <_stack+0x452584>
 154:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 158:	0013010b 	andseq	r0, r3, fp, lsl #2
 15c:	00280f00 	eoreq	r0, r8, r0, lsl #30
 160:	0b1c0e03 	bleq	703974 <_stack+0x683974>
 164:	15100000 	ldrne	r0, [r0, #-0]
 168:	00192700 	andseq	r2, r9, r0, lsl #14
 16c:	00341100 	eorseq	r1, r4, r0, lsl #2
 170:	0b3a0e03 	bleq	e83984 <_stack+0xe03984>
 174:	0b390b3b 	bleq	e42e68 <_stack+0xdc2e68>
 178:	193f1349 	ldmdbne	pc!, {r0, r3, r6, r8, r9, ip}	; <UNPREDICTABLE>
 17c:	00001802 	andeq	r1, r0, r2, lsl #16
 180:	03003412 	movweq	r3, #1042	; 0x412
 184:	3b0b3a0e 	blcc	2ce9c4 <_stack+0x24e9c4>
 188:	490b390b 	stmdbmi	fp, {r0, r1, r3, r8, fp, ip, sp}
 18c:	00180213 	andseq	r0, r8, r3, lsl r2
 190:	01011300 	mrseq	r1, SP_irq
 194:	13011349 	movwne	r1, #4937	; 0x1349
 198:	21140000 	tstcs	r4, r0
 19c:	2f134900 	svccs	0x00134900
 1a0:	1500000b 	strne	r0, [r0, #-11]
 1a4:	08030034 	stmdaeq	r3, {r2, r4, r5}
 1a8:	0b3b0b3a 	bleq	ec2e98 <_stack+0xe42e98>
 1ac:	13490b39 	movtne	r0, #39737	; 0x9b39
 1b0:	1802193f 	stmdane	r2, {r0, r1, r2, r3, r4, r5, r8, fp, ip}
 1b4:	34160000 	ldrcc	r0, [r6], #-0
 1b8:	3a080300 	bcc	200dc0 <_stack+0x180dc0>
 1bc:	39053b0b 	stmdbcc	r5, {r0, r1, r3, r8, r9, fp, ip, sp}
 1c0:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 1c4:	17000018 	smladne	r0, r8, r0, r0
 1c8:	0e030113 	mcreq	1, 0, r0, cr3, cr3, {0}
 1cc:	0b3a0b0b 	bleq	e82e00 <_stack+0xe02e00>
 1d0:	0b39053b 	bleq	e416c4 <_stack+0xdc16c4>
 1d4:	00001301 	andeq	r1, r0, r1, lsl #6
 1d8:	03000d18 	movweq	r0, #3352	; 0xd18
 1dc:	3b0b3a0e 	blcc	2cea1c <_stack+0x24ea1c>
 1e0:	490b3905 	stmdbmi	fp, {r0, r2, r8, fp, ip, sp}
 1e4:	000b3813 	andeq	r3, fp, r3, lsl r8
 1e8:	00161900 	andseq	r1, r6, r0, lsl #18
 1ec:	0b3a0e03 	bleq	e83a00 <_stack+0xe03a00>
 1f0:	0b39053b 	bleq	e416e4 <_stack+0xdc16e4>
 1f4:	00001349 	andeq	r1, r0, r9, asr #6
 1f8:	3f012e1a 	svccc	0x00012e1a
 1fc:	3a0e0319 	bcc	380e68 <_stack+0x300e68>
 200:	39053b0b 	stmdbcc	r5, {r0, r1, r3, r8, r9, fp, ip, sp}
 204:	1119270b 	tstne	r9, fp, lsl #14
 208:	40061201 	andmi	r1, r6, r1, lsl #4
 20c:	19429618 	stmdbne	r2, {r3, r4, r9, sl, ip, pc}^
 210:	00001301 	andeq	r1, r0, r1, lsl #6
 214:	0300051b 	movweq	r0, #1307	; 0x51b
 218:	3b0b3a08 	blcc	2cea40 <_stack+0x24ea40>
 21c:	490b3905 	stmdbmi	fp, {r0, r2, r8, fp, ip, sp}
 220:	00180213 	andseq	r0, r8, r3, lsl r2
 224:	00051c00 	andeq	r1, r5, r0, lsl #24
 228:	0b3a0e03 	bleq	e83a3c <_stack+0xe03a3c>
 22c:	0b39053b 	bleq	e41720 <_stack+0xdc1720>
 230:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 234:	2e1d0000 	cdpcs	0, 1, cr0, cr13, cr0, {0}
 238:	3a0e0301 	bcc	380e44 <_stack+0x300e44>
 23c:	39053b0b 	stmdbcc	r5, {r0, r1, r3, r8, r9, fp, ip, sp}
 240:	1119270b 	tstne	r9, fp, lsl #14
 244:	40061201 	andmi	r1, r6, r1, lsl #4
 248:	19429618 	stmdbne	r2, {r3, r4, r9, sl, ip, pc}^
 24c:	00001301 	andeq	r1, r0, r1, lsl #6
 250:	3f012e1e 	svccc	0x00012e1e
 254:	3a0e0319 	bcc	380ec0 <_stack+0x300ec0>
 258:	39053b0b 	stmdbcc	r5, {r0, r1, r3, r8, r9, fp, ip, sp}
 25c:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 260:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 264:	96184006 	ldrls	r4, [r8], -r6
 268:	13011942 	movwne	r1, #6466	; 0x1942
 26c:	341f0000 	ldrcc	r0, [pc], #-0	; 274 <_start-0x7d8c>
 270:	3a0e0300 	bcc	380e78 <_stack+0x300e78>
 274:	39053b0b 	stmdbcc	r5, {r0, r1, r3, r8, r9, fp, ip, sp}
 278:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 27c:	20000018 	andcs	r0, r0, r8, lsl r0
 280:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 284:	0b3a0e03 	bleq	e83a98 <_stack+0xe03a98>
 288:	0b39053b 	bleq	e4177c <_stack+0xdc177c>
 28c:	13491927 	movtne	r1, #39207	; 0x9927
 290:	06120111 			; <UNDEFINED> instruction: 0x06120111
 294:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 298:	00130119 	andseq	r0, r3, r9, lsl r1
 29c:	012e2100 			; <UNDEFINED> instruction: 0x012e2100
 2a0:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 2a4:	053b0b3a 	ldreq	r0, [fp, #-2874]!	; 0xfffff4c6
 2a8:	19270b39 	stmdbne	r7!, {r0, r3, r4, r5, r8, r9, fp}
 2ac:	06120111 			; <UNDEFINED> instruction: 0x06120111
 2b0:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 2b4:	00130119 	andseq	r0, r3, r9, lsl r1
 2b8:	000a2200 	andeq	r2, sl, r0, lsl #4
 2bc:	0b3a0e03 	bleq	e83ad0 <_stack+0xe03ad0>
 2c0:	0b39053b 	bleq	e417b4 <_stack+0xdc17b4>
 2c4:	00000111 	andeq	r0, r0, r1, lsl r1
 2c8:	03003423 	movweq	r3, #1059	; 0x423
 2cc:	3b0b3a0e 	blcc	2ceb0c <_stack+0x24eb0c>
 2d0:	490b3905 	stmdbmi	fp, {r0, r2, r8, fp, ip, sp}
 2d4:	24000013 	strcs	r0, [r0], #-19	; 0xffffffed
 2d8:	0111010b 	tsteq	r1, fp, lsl #2
 2dc:	00000612 	andeq	r0, r0, r2, lsl r6
 2e0:	3f002e25 	svccc	0x00002e25
 2e4:	3a0e0319 	bcc	380f50 <_stack+0x300f50>
 2e8:	39053b0b 	stmdbcc	r5, {r0, r1, r3, r8, r9, fp, ip, sp}
 2ec:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 2f0:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 2f4:	97184006 	ldrls	r4, [r8, -r6]
 2f8:	00001942 	andeq	r1, r0, r2, asr #18
 2fc:	03012e26 	movweq	r2, #7718	; 0x1e26
 300:	3b0b3a0e 	blcc	2ceb40 <_stack+0x24eb40>
 304:	270b3905 	strcs	r3, [fp, -r5, lsl #18]
 308:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 30c:	97184006 	ldrls	r4, [r8, -r6]
 310:	13011942 	movwne	r1, #6466	; 0x1942
 314:	2e270000 	cdpcs	0, 2, cr0, cr7, cr0, {0}
 318:	03193f01 	tsteq	r9, #1, 30
 31c:	3b0b3a0e 	blcc	2ceb5c <_stack+0x24eb5c>
 320:	270b390b 	strcs	r3, [fp, -fp, lsl #18]
 324:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 328:	96184006 	ldrls	r4, [r8], -r6
 32c:	13011942 	movwne	r1, #6466	; 0x1942
 330:	34280000 	strtcc	r0, [r8], #-0
 334:	3a080300 	bcc	200f3c <_stack+0x180f3c>
 338:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 33c:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 340:	29000018 	stmdbcs	r0, {r3, r4}
 344:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 348:	0b3a0e03 	bleq	e83b5c <_stack+0xe03b5c>
 34c:	0b390b3b 	bleq	e43040 <_stack+0xdc3040>
 350:	01111927 	tsteq	r1, r7, lsr #18
 354:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 358:	01194297 			; <UNDEFINED> instruction: 0x01194297
 35c:	2a000013 	bcs	3b0 <_start-0x7c50>
 360:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 364:	0b3b0b3a 	bleq	ec3054 <_stack+0xe43054>
 368:	13490b39 	movtne	r0, #39737	; 0x9b39
 36c:	00001802 	andeq	r1, r0, r2, lsl #16
 370:	3f012e2b 	svccc	0x00012e2b
 374:	3a0e0319 	bcc	380fe0 <_stack+0x300fe0>
 378:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 37c:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 380:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 384:	96184006 	ldrls	r4, [r8], -r6
 388:	00001942 	andeq	r1, r0, r2, asr #18
 38c:	01110100 	tsteq	r1, r0, lsl #2
 390:	0b130e25 	bleq	4c3c2c <_stack+0x443c2c>
 394:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
 398:	06120111 			; <UNDEFINED> instruction: 0x06120111
 39c:	00001710 	andeq	r1, r0, r0, lsl r7
 3a0:	0b002402 	bleq	93b0 <sptsk+0x154>
 3a4:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 3a8:	0300000e 	movweq	r0, #14
 3ac:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 3b0:	0b3b0b3a 	bleq	ec30a0 <_stack+0xe430a0>
 3b4:	13490b39 	movtne	r0, #39737	; 0x9b39
 3b8:	35040000 	strcc	r0, [r4, #-0]
 3bc:	00134900 	andseq	r4, r3, r0, lsl #18
 3c0:	00240500 	eoreq	r0, r4, r0, lsl #10
 3c4:	0b3e0b0b 	bleq	f82ff8 <_stack+0xf02ff8>
 3c8:	00000803 	andeq	r0, r0, r3, lsl #16
 3cc:	0b011306 	bleq	44fec <__bss_end__+0x34ca0>
 3d0:	3b0b3a0b 	blcc	2cec04 <_stack+0x24ec04>
 3d4:	010b390b 	tsteq	fp, fp, lsl #18
 3d8:	07000013 	smladeq	r0, r3, r0, r0
 3dc:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 3e0:	0b3b0b3a 	bleq	ec30d0 <_stack+0xe430d0>
 3e4:	13490b39 	movtne	r0, #39737	; 0x9b39
 3e8:	00000b38 	andeq	r0, r0, r8, lsr fp
 3ec:	03003408 	movweq	r3, #1032	; 0x408
 3f0:	3b0b3a0e 	blcc	2cec30 <_stack+0x24ec30>
 3f4:	490b390b 	stmdbmi	fp, {r0, r1, r3, r8, fp, ip, sp}
 3f8:	00180213 	andseq	r0, r8, r3, lsl r2
 3fc:	000f0900 	andeq	r0, pc, r0, lsl #18
 400:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 404:	2e0a0000 	cdpcs	0, 0, cr0, cr10, cr0, {0}
 408:	03193f00 	tsteq	r9, #0, 30
 40c:	3b0b3a0e 	blcc	2cec4c <_stack+0x24ec4c>
 410:	270b390b 	strcs	r3, [fp, -fp, lsl #18]
 414:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 418:	97184006 	ldrls	r4, [r8, -r6]
 41c:	00001942 	andeq	r1, r0, r2, asr #18
 420:	3f002e0b 	svccc	0x00002e0b
 424:	3a0e0319 	bcc	381090 <_stack+0x301090>
 428:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 42c:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 430:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 434:	97184006 	ldrls	r4, [r8, -r6]
 438:	00001942 	andeq	r1, r0, r2, asr #18
 43c:	01110100 	tsteq	r1, r0, lsl #2
 440:	0b130e25 	bleq	4c3cdc <_stack+0x443cdc>
 444:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
 448:	06120111 			; <UNDEFINED> instruction: 0x06120111
 44c:	00001710 	andeq	r1, r0, r0, lsl r7
 450:	0b002402 	bleq	9460 <conttsk+0x64>
 454:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 458:	0300000e 	movweq	r0, #14
 45c:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 460:	0b3b0b3a 	bleq	ec3150 <_stack+0xe43150>
 464:	13490b39 	movtne	r0, #39737	; 0x9b39
 468:	24040000 	strcs	r0, [r4], #-0
 46c:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 470:	0008030b 	andeq	r0, r8, fp, lsl #6
 474:	00350500 	eorseq	r0, r5, r0, lsl #10
 478:	00001349 	andeq	r1, r0, r9, asr #6
 47c:	0b011306 	bleq	4509c <__bss_end__+0x34d50>
 480:	3b0b3a0b 	blcc	2cecb4 <_stack+0x24ecb4>
 484:	010b390b 	tsteq	fp, fp, lsl #18
 488:	07000013 	smladeq	r0, r3, r0, r0
 48c:	0803000d 	stmdaeq	r3, {r0, r2, r3}
 490:	0b3b0b3a 	bleq	ec3180 <_stack+0xe43180>
 494:	13490b39 	movtne	r0, #39737	; 0x9b39
 498:	00000b38 	andeq	r0, r0, r8, lsr fp
 49c:	03000d08 	movweq	r0, #3336	; 0xd08
 4a0:	3b0b3a0e 	blcc	2cece0 <_stack+0x24ece0>
 4a4:	490b390b 	stmdbmi	fp, {r0, r1, r3, r8, fp, ip, sp}
 4a8:	000b3813 	andeq	r3, fp, r3, lsl r8
 4ac:	01010900 	tsteq	r1, r0, lsl #18
 4b0:	13011349 	movwne	r1, #4937	; 0x1349
 4b4:	210a0000 	mrscs	r0, (UNDEF: 10)
 4b8:	2f134900 	svccs	0x00134900
 4bc:	0b00000b 	bleq	4f0 <_start-0x7b10>
 4c0:	0b3e0104 	bleq	f808d8 <_stack+0xf008d8>
 4c4:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 4c8:	0b3b0b3a 	bleq	ec31b8 <_stack+0xe431b8>
 4cc:	13010b39 	movwne	r0, #6969	; 0x1b39
 4d0:	280c0000 	stmdacs	ip, {}	; <UNPREDICTABLE>
 4d4:	1c0e0300 	stcne	3, cr0, [lr], {-0}
 4d8:	0d00000b 	stceq	0, cr0, [r0, #-44]	; 0xffffffd4
 4dc:	0b0b000f 	bleq	2c0520 <_stack+0x240520>
 4e0:	00001349 	andeq	r1, r0, r9, asr #6
 4e4:	0300340e 	movweq	r3, #1038	; 0x40e
 4e8:	3b0b3a0e 	blcc	2ced28 <_stack+0x24ed28>
 4ec:	490b390b 	stmdbmi	fp, {r0, r1, r3, r8, fp, ip, sp}
 4f0:	00180213 	andseq	r0, r8, r3, lsl r2
 4f4:	002e0f00 	eoreq	r0, lr, r0, lsl #30
 4f8:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 4fc:	0b3b0b3a 	bleq	ec31ec <_stack+0xe431ec>
 500:	13490b39 	movtne	r0, #39737	; 0x9b39
 504:	06120111 			; <UNDEFINED> instruction: 0x06120111
 508:	42961840 	addsmi	r1, r6, #64, 16	; 0x400000
 50c:	10000019 	andne	r0, r0, r9, lsl r0
 510:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 514:	0b3a0e03 	bleq	e83d28 <_stack+0xe03d28>
 518:	0b390b3b 	bleq	e4320c <_stack+0xdc320c>
 51c:	01111927 	tsteq	r1, r7, lsr #18
 520:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 524:	01194296 			; <UNDEFINED> instruction: 0x01194296
 528:	11000013 	tstne	r0, r3, lsl r0
 52c:	08030005 	stmdaeq	r3, {r0, r2}
 530:	0b3b0b3a 	bleq	ec3220 <_stack+0xe43220>
 534:	13490b39 	movtne	r0, #39737	; 0x9b39
 538:	00001802 	andeq	r1, r0, r2, lsl #16
 53c:	03003412 	movweq	r3, #1042	; 0x412
 540:	3b0b3a08 	blcc	2ced68 <_stack+0x24ed68>
 544:	490b390b 	stmdbmi	fp, {r0, r1, r3, r8, fp, ip, sp}
 548:	00180213 	andseq	r0, r8, r3, lsl r2
 54c:	002e1300 	eoreq	r1, lr, r0, lsl #6
 550:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 554:	0b3b0b3a 	bleq	ec3244 <_stack+0xe43244>
 558:	13490b39 	movtne	r0, #39737	; 0x9b39
 55c:	06120111 			; <UNDEFINED> instruction: 0x06120111
 560:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 564:	14000019 	strne	r0, [r0], #-25	; 0xffffffe7
 568:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 56c:	0b3b0b3a 	bleq	ec325c <_stack+0xe4325c>
 570:	13490b39 	movtne	r0, #39737	; 0x9b39
 574:	00001802 	andeq	r1, r0, r2, lsl #16
 578:	3f002e15 	svccc	0x00002e15
 57c:	3a0e0319 	bcc	3811e8 <_stack+0x3011e8>
 580:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 584:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 588:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 58c:	97184006 	ldrls	r4, [r8, -r6]
 590:	00001942 	andeq	r1, r0, r2, asr #18
 594:	01110100 	tsteq	r1, r0, lsl #2
 598:	0b130e25 	bleq	4c3e34 <_stack+0x443e34>
 59c:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
 5a0:	06120111 			; <UNDEFINED> instruction: 0x06120111
 5a4:	00001710 	andeq	r1, r0, r0, lsl r7
 5a8:	0b002402 	bleq	95b8 <rsvsm+0x44>
 5ac:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 5b0:	0300000e 	movweq	r0, #14
 5b4:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 5b8:	0b3b0b3a 	bleq	ec32a8 <_stack+0xe432a8>
 5bc:	13490b39 	movtne	r0, #39737	; 0x9b39
 5c0:	35040000 	strcc	r0, [r4, #-0]
 5c4:	00134900 	andseq	r4, r3, r0, lsl #18
 5c8:	00260500 	eoreq	r0, r6, r0, lsl #10
 5cc:	00001349 	andeq	r1, r0, r9, asr #6
 5d0:	0b002406 	bleq	95f0 <rsvsm+0x7c>
 5d4:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 5d8:	07000008 	streq	r0, [r0, -r8]
 5dc:	0b3e0104 	bleq	f809f4 <_stack+0xf009f4>
 5e0:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 5e4:	0b3b0b3a 	bleq	ec32d4 <_stack+0xe432d4>
 5e8:	13010b39 	movwne	r0, #6969	; 0x1b39
 5ec:	28080000 	stmdacs	r8, {}	; <UNPREDICTABLE>
 5f0:	1c0e0300 	stcne	3, cr0, [lr], {-0}
 5f4:	0900000b 	stmdbeq	r0, {r0, r1, r3}
 5f8:	0b0b0113 	bleq	2c0a4c <_stack+0x240a4c>
 5fc:	0b3b0b3a 	bleq	ec32ec <_stack+0xe432ec>
 600:	13010b39 	movwne	r0, #6969	; 0x1b39
 604:	0d0a0000 	stceq	0, cr0, [sl, #-0]
 608:	3a0e0300 	bcc	381210 <_stack+0x301210>
 60c:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 610:	3813490b 	ldmdacc	r3, {r0, r1, r3, r8, fp, lr}
 614:	0b00000b 	bleq	648 <_start-0x79b8>
 618:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 61c:	0b3b0b3a 	bleq	ec330c <_stack+0xe4330c>
 620:	13490b39 	movtne	r0, #39737	; 0x9b39
 624:	00001802 	andeq	r1, r0, r2, lsl #16
 628:	0b000f0c 	bleq	4260 <_start-0x3da0>
 62c:	0013490b 	andseq	r4, r3, fp, lsl #18
 630:	012e0d00 			; <UNDEFINED> instruction: 0x012e0d00
 634:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 638:	0b3b0b3a 	bleq	ec3328 <_stack+0xe43328>
 63c:	19270b39 	stmdbne	r7!, {r0, r3, r4, r5, r8, r9, fp}
 640:	06120111 			; <UNDEFINED> instruction: 0x06120111
 644:	42961840 	addsmi	r1, r6, #64, 16	; 0x400000
 648:	00130119 	andseq	r0, r3, r9, lsl r1
 64c:	00050e00 	andeq	r0, r5, r0, lsl #28
 650:	0b3a0e03 	bleq	e83e64 <_stack+0xe03e64>
 654:	0b390b3b 	bleq	e43348 <_stack+0xdc3348>
 658:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 65c:	2e0f0000 	cdpcs	0, 0, cr0, cr15, cr0, {0}
 660:	03193f01 	tsteq	r9, #1, 30
 664:	3b0b3a0e 	blcc	2ceea4 <_stack+0x24eea4>
 668:	270b390b 	strcs	r3, [fp, -fp, lsl #18]
 66c:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 670:	97184006 	ldrls	r4, [r8, -r6]
 674:	13011942 	movwne	r1, #6466	; 0x1942
 678:	2e100000 	cdpcs	0, 1, cr0, cr0, cr0, {0}
 67c:	03193f01 	tsteq	r9, #1, 30
 680:	3b0b3a0e 	blcc	2ceec0 <_stack+0x24eec0>
 684:	270b390b 	strcs	r3, [fp, -fp, lsl #18]
 688:	11134919 	tstne	r3, r9, lsl r9
 68c:	40061201 	andmi	r1, r6, r1, lsl #4
 690:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 694:	00001301 	andeq	r1, r0, r1, lsl #6
 698:	3f002e11 	svccc	0x00002e11
 69c:	3a0e0319 	bcc	381308 <_stack+0x301308>
 6a0:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 6a4:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 6a8:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 6ac:	97184006 	ldrls	r4, [r8, -r6]
 6b0:	00001942 	andeq	r1, r0, r2, asr #18
 6b4:	01110100 	tsteq	r1, r0, lsl #2
 6b8:	0b130e25 	bleq	4c3f54 <_stack+0x443f54>
 6bc:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
 6c0:	06120111 			; <UNDEFINED> instruction: 0x06120111
 6c4:	00001710 	andeq	r1, r0, r0, lsl r7
 6c8:	0b002402 	bleq	96d8 <tryrsvsm+0x2c>
 6cc:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 6d0:	0300000e 	movweq	r0, #14
 6d4:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 6d8:	0b3b0b3a 	bleq	ec33c8 <_stack+0xe433c8>
 6dc:	13490b39 	movtne	r0, #39737	; 0x9b39
 6e0:	35040000 	strcc	r0, [r4, #-0]
 6e4:	00134900 	andseq	r4, r3, r0, lsl #18
 6e8:	00240500 	eoreq	r0, r4, r0, lsl #10
 6ec:	0b3e0b0b 	bleq	f83320 <_stack+0xf03320>
 6f0:	00000803 	andeq	r0, r0, r3, lsl #16
 6f4:	03011306 	movweq	r1, #4870	; 0x1306
 6f8:	3a0b0b0e 	bcc	2c3338 <_stack+0x243338>
 6fc:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 700:	0013010b 	andseq	r0, r3, fp, lsl #2
 704:	000d0700 	andeq	r0, sp, r0, lsl #14
 708:	0b3a0803 	bleq	e8271c <_stack+0xe0271c>
 70c:	0b390b3b 	bleq	e43400 <_stack+0xdc3400>
 710:	0b381349 	bleq	e0543c <_stack+0xd8543c>
 714:	0d080000 	stceq	0, cr0, [r8, #-0]
 718:	3a0e0300 	bcc	381320 <_stack+0x301320>
 71c:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 720:	3813490b 	ldmdacc	r3, {r0, r1, r3, r8, fp, lr}
 724:	0900000b 	stmdbeq	r0, {r0, r1, r3}
 728:	0b0b0113 	bleq	2c0b7c <_stack+0x240b7c>
 72c:	0b3b0b3a 	bleq	ec341c <_stack+0xe4341c>
 730:	13010b39 	movwne	r0, #6969	; 0x1b39
 734:	0f0a0000 	svceq	0x000a0000
 738:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
 73c:	0b000013 	bleq	790 <_start-0x7870>
 740:	19270115 	stmdbne	r7!, {r0, r2, r4, r8}
 744:	00001301 	andeq	r1, r0, r1, lsl #6
 748:	4900050c 	stmdbmi	r0, {r2, r3, r8, sl}
 74c:	0d000013 	stceq	0, cr0, [r0, #-76]	; 0xffffffb4
 750:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 754:	0b3b0b3a 	bleq	ec3444 <_stack+0xe43444>
 758:	13490b39 	movtne	r0, #39737	; 0x9b39
 75c:	00001802 	andeq	r1, r0, r2, lsl #16
 760:	4901010e 	stmdbmi	r1, {r1, r2, r3, r8}
 764:	00130113 	andseq	r0, r3, r3, lsl r1
 768:	00210f00 	eoreq	r0, r1, r0, lsl #30
 76c:	0b2f1349 	bleq	bc5498 <_stack+0xb45498>
 770:	2e100000 	cdpcs	0, 1, cr0, cr0, cr0, {0}
 774:	03193f01 	tsteq	r9, #1, 30
 778:	3b0b3a0e 	blcc	2cefb8 <_stack+0x24efb8>
 77c:	270b390b 	strcs	r3, [fp, -fp, lsl #18]
 780:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 784:	96184006 	ldrls	r4, [r8], -r6
 788:	13011942 	movwne	r1, #6466	; 0x1942
 78c:	05110000 	ldreq	r0, [r1, #-0]
 790:	3a0e0300 	bcc	381398 <_stack+0x301398>
 794:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 798:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 79c:	12000018 	andne	r0, r0, #24
 7a0:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 7a4:	0b3a0e03 	bleq	e83fb8 <_stack+0xe03fb8>
 7a8:	0b390b3b 	bleq	e4349c <_stack+0xdc349c>
 7ac:	13491927 	movtne	r1, #39207	; 0x9927
 7b0:	06120111 			; <UNDEFINED> instruction: 0x06120111
 7b4:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 7b8:	00130119 	andseq	r0, r3, r9, lsl r1
 7bc:	012e1300 			; <UNDEFINED> instruction: 0x012e1300
 7c0:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 7c4:	0b3b0b3a 	bleq	ec34b4 <_stack+0xe434b4>
 7c8:	19270b39 	stmdbne	r7!, {r0, r3, r4, r5, r8, r9, fp}
 7cc:	06120111 			; <UNDEFINED> instruction: 0x06120111
 7d0:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 7d4:	00130119 	andseq	r0, r3, r9, lsl r1
 7d8:	00051400 	andeq	r1, r5, r0, lsl #8
 7dc:	0b3a0803 	bleq	e827f0 <_stack+0xe027f0>
 7e0:	0b390b3b 	bleq	e434d4 <_stack+0xdc34d4>
 7e4:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 7e8:	2e150000 	cdpcs	0, 1, cr0, cr5, cr0, {0}
 7ec:	3a0e0301 	bcc	3813f8 <_stack+0x3013f8>
 7f0:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 7f4:	1119270b 	tstne	r9, fp, lsl #14
 7f8:	40061201 	andmi	r1, r6, r1, lsl #4
 7fc:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 800:	00001301 	andeq	r1, r0, r1, lsl #6
 804:	3f002e16 	svccc	0x00002e16
 808:	3a0e0319 	bcc	381474 <_stack+0x301474>
 80c:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 810:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 814:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 818:	97184006 	ldrls	r4, [r8, -r6]
 81c:	00001942 	andeq	r1, r0, r2, asr #18
 820:	01110100 	tsteq	r1, r0, lsl #2
 824:	0b130e25 	bleq	4c40c0 <_stack+0x4440c0>
 828:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
 82c:	06120111 			; <UNDEFINED> instruction: 0x06120111
 830:	00001710 	andeq	r1, r0, r0, lsl r7
 834:	0b002402 	bleq	9844 <rlsm+0x134>
 838:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 83c:	0300000e 	movweq	r0, #14
 840:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 844:	0b3b0b3a 	bleq	ec3534 <_stack+0xe43534>
 848:	13490b39 	movtne	r0, #39737	; 0x9b39
 84c:	35040000 	strcc	r0, [r4, #-0]
 850:	00134900 	andseq	r4, r3, r0, lsl #18
 854:	00240500 	eoreq	r0, r4, r0, lsl #10
 858:	0b3e0b0b 	bleq	f8348c <_stack+0xf0348c>
 85c:	00000803 	andeq	r0, r0, r3, lsl #16
 860:	0b011306 	bleq	45480 <__bss_end__+0x35134>
 864:	3b0b3a0b 	blcc	2cf098 <_stack+0x24f098>
 868:	010b390b 	tsteq	fp, fp, lsl #18
 86c:	07000013 	smladeq	r0, r3, r0, r0
 870:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 874:	0b3b0b3a 	bleq	ec3564 <_stack+0xe43564>
 878:	13490b39 	movtne	r0, #39737	; 0x9b39
 87c:	00000b38 	andeq	r0, r0, r8, lsr fp
 880:	03003408 	movweq	r3, #1032	; 0x408
 884:	3b0b3a0e 	blcc	2cf0c4 <_stack+0x24f0c4>
 888:	490b390b 	stmdbmi	fp, {r0, r1, r3, r8, fp, ip, sp}
 88c:	00180213 	andseq	r0, r8, r3, lsl r2
 890:	000f0900 	andeq	r0, pc, r0, lsl #18
 894:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 898:	2e0a0000 	cdpcs	0, 0, cr0, cr10, cr0, {0}
 89c:	03193f01 	tsteq	r9, #1, 30
 8a0:	3b0b3a0e 	blcc	2cf0e0 <_stack+0x24f0e0>
 8a4:	270b390b 	strcs	r3, [fp, -fp, lsl #18]
 8a8:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 8ac:	97184006 	ldrls	r4, [r8, -r6]
 8b0:	13011942 	movwne	r1, #6466	; 0x1942
 8b4:	050b0000 	streq	r0, [fp, #-0]
 8b8:	3a080300 	bcc	2014c0 <_stack+0x1814c0>
 8bc:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 8c0:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 8c4:	0c000018 	stceq	0, cr0, [r0], {24}
 8c8:	08030034 	stmdaeq	r3, {r2, r4, r5}
 8cc:	0b3b0b3a 	bleq	ec35bc <_stack+0xe435bc>
 8d0:	13490b39 	movtne	r0, #39737	; 0x9b39
 8d4:	00001802 	andeq	r1, r0, r2, lsl #16
 8d8:	3f002e0d 	svccc	0x00002e0d
 8dc:	3a0e0319 	bcc	381548 <_stack+0x301548>
 8e0:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 8e4:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 8e8:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 8ec:	97184006 	ldrls	r4, [r8, -r6]
 8f0:	00001942 	andeq	r1, r0, r2, asr #18
 8f4:	01110100 	tsteq	r1, r0, lsl #2
 8f8:	0b130e25 	bleq	4c4194 <_stack+0x444194>
 8fc:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
 900:	06120111 			; <UNDEFINED> instruction: 0x06120111
 904:	00001710 	andeq	r1, r0, r0, lsl r7
 908:	0b002402 	bleq	9918 <rlsm_count+0xd0>
 90c:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 910:	0300000e 	movweq	r0, #14
 914:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 918:	0b3b0b3a 	bleq	ec3608 <_stack+0xe43608>
 91c:	13490b39 	movtne	r0, #39737	; 0x9b39
 920:	35040000 	strcc	r0, [r4, #-0]
 924:	00134900 	andseq	r4, r3, r0, lsl #18
 928:	00260500 	eoreq	r0, r6, r0, lsl #10
 92c:	00001349 	andeq	r1, r0, r9, asr #6
 930:	0b002406 	bleq	9950 <rlsm_count+0x108>
 934:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 938:	07000008 	streq	r0, [r0, -r8]
 93c:	0b0b0113 	bleq	2c0d90 <_stack+0x240d90>
 940:	0b3b0b3a 	bleq	ec3630 <_stack+0xe43630>
 944:	13010b39 	movwne	r0, #6969	; 0x1b39
 948:	0d080000 	stceq	0, cr0, [r8, #-0]
 94c:	3a080300 	bcc	201554 <_stack+0x181554>
 950:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 954:	3813490b 	ldmdacc	r3, {r0, r1, r3, r8, fp, lr}
 958:	0900000b 	stmdbeq	r0, {r0, r1, r3}
 95c:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 960:	0b3b0b3a 	bleq	ec3650 <_stack+0xe43650>
 964:	13490b39 	movtne	r0, #39737	; 0x9b39
 968:	00000b38 	andeq	r0, r0, r8, lsr fp
 96c:	0300340a 	movweq	r3, #1034	; 0x40a
 970:	3b0b3a0e 	blcc	2cf1b0 <_stack+0x24f1b0>
 974:	490b390b 	stmdbmi	fp, {r0, r1, r3, r8, fp, ip, sp}
 978:	00180213 	andseq	r0, r8, r3, lsl r2
 97c:	000f0b00 	andeq	r0, pc, r0, lsl #22
 980:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 984:	2e0c0000 	cdpcs	0, 0, cr0, cr12, cr0, {0}
 988:	03193f00 	tsteq	r9, #0, 30
 98c:	3b0b3a0e 	blcc	2cf1cc <_stack+0x24f1cc>
 990:	270b390b 	strcs	r3, [fp, -fp, lsl #18]
 994:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 998:	97184006 	ldrls	r4, [r8, -r6]
 99c:	00001942 	andeq	r1, r0, r2, asr #18
 9a0:	3f002e0d 	svccc	0x00002e0d
 9a4:	3a0e0319 	bcc	381610 <_stack+0x301610>
 9a8:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 9ac:	4919270b 	ldmdbmi	r9, {r0, r1, r3, r8, r9, sl, sp}
 9b0:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 9b4:	97184006 	ldrls	r4, [r8, -r6]
 9b8:	00001942 	andeq	r1, r0, r2, asr #18
 9bc:	01110100 	tsteq	r1, r0, lsl #2
 9c0:	0b130e25 	bleq	4c425c <_stack+0x44425c>
 9c4:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
 9c8:	06120111 			; <UNDEFINED> instruction: 0x06120111
 9cc:	00001710 	andeq	r1, r0, r0, lsl r7
 9d0:	0b002402 	bleq	99e0 <init_critsec+0x34>
 9d4:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 9d8:	0300000e 	movweq	r0, #14
 9dc:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 9e0:	0b3b0b3a 	bleq	ec36d0 <_stack+0xe436d0>
 9e4:	13490b39 	movtne	r0, #39737	; 0x9b39
 9e8:	24040000 	strcs	r0, [r4], #-0
 9ec:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 9f0:	0008030b 	andeq	r0, r8, fp, lsl #6
 9f4:	01130500 	tsteq	r3, r0, lsl #10
 9f8:	0b0b0e03 	bleq	2c420c <_stack+0x24420c>
 9fc:	0b3b0b3a 	bleq	ec36ec <_stack+0xe436ec>
 a00:	13010b39 	movwne	r0, #6969	; 0x1b39
 a04:	0d060000 	stceq	0, cr0, [r6, #-0]
 a08:	3a0e0300 	bcc	381610 <_stack+0x301610>
 a0c:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 a10:	3813490b 	ldmdacc	r3, {r0, r1, r3, r8, fp, lr}
 a14:	0700000b 	streq	r0, [r0, -fp]
 a18:	0b0b000f 	bleq	2c0a5c <_stack+0x240a5c>
 a1c:	00001349 	andeq	r1, r0, r9, asr #6
 a20:	03003408 	movweq	r3, #1032	; 0x408
 a24:	3b0b3a0e 	blcc	2cf264 <_stack+0x24f264>
 a28:	490b390b 	stmdbmi	fp, {r0, r1, r3, r8, fp, ip, sp}
 a2c:	00180213 	andseq	r0, r8, r3, lsl r2
 a30:	012e0900 			; <UNDEFINED> instruction: 0x012e0900
 a34:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 a38:	0b3b0b3a 	bleq	ec3728 <_stack+0xe43728>
 a3c:	19270b39 	stmdbne	r7!, {r0, r3, r4, r5, r8, r9, fp}
 a40:	01111349 	tsteq	r1, r9, asr #6
 a44:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 a48:	01194297 			; <UNDEFINED> instruction: 0x01194297
 a4c:	0a000013 	beq	aa0 <_start-0x7560>
 a50:	08030005 	stmdaeq	r3, {r0, r2}
 a54:	0b3b0b3a 	bleq	ec3744 <_stack+0xe43744>
 a58:	13490b39 	movtne	r0, #39737	; 0x9b39
 a5c:	00001802 	andeq	r1, r0, r2, lsl #16
 a60:	0300340b 	movweq	r3, #1035	; 0x40b
 a64:	3b0b3a08 	blcc	2cf28c <_stack+0x24f28c>
 a68:	490b390b 	stmdbmi	fp, {r0, r1, r3, r8, fp, ip, sp}
 a6c:	00180213 	andseq	r0, r8, r3, lsl r2
 a70:	012e0c00 			; <UNDEFINED> instruction: 0x012e0c00
 a74:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 a78:	0b3b0b3a 	bleq	ec3768 <_stack+0xe43768>
 a7c:	19270b39 	stmdbne	r7!, {r0, r3, r4, r5, r8, r9, fp}
 a80:	06120111 			; <UNDEFINED> instruction: 0x06120111
 a84:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 a88:	00130119 	andseq	r0, r3, r9, lsl r1
 a8c:	00050d00 	andeq	r0, r5, r0, lsl #26
 a90:	0b3a0e03 	bleq	e842a4 <_stack+0xe042a4>
 a94:	0b390b3b 	bleq	e43788 <_stack+0xdc3788>
 a98:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 a9c:	0f0e0000 	svceq	0x000e0000
 aa0:	000b0b00 	andeq	r0, fp, r0, lsl #22
 aa4:	002e0f00 	eoreq	r0, lr, r0, lsl #30
 aa8:	0e03193f 			; <UNDEFINED> instruction: 0x0e03193f
 aac:	0b3b0b3a 	bleq	ec379c <_stack+0xe4379c>
 ab0:	19270b39 	stmdbne	r7!, {r0, r3, r4, r5, r8, r9, fp}
 ab4:	06120111 			; <UNDEFINED> instruction: 0x06120111
 ab8:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 abc:	00000019 	andeq	r0, r0, r9, lsl r0
 ac0:	25011101 	strcs	r1, [r1, #-257]	; 0xfffffeff
 ac4:	030b130e 	movweq	r1, #45838	; 0xb30e
 ac8:	110e1b0e 	tstne	lr, lr, lsl #22
 acc:	10061201 	andne	r1, r6, r1, lsl #4
 ad0:	02000017 	andeq	r0, r0, #23
 ad4:	0b0b0024 	bleq	2c0b6c <_stack+0x240b6c>
 ad8:	0e030b3e 	vmoveq.16	d3[0], r0
 adc:	24030000 	strcs	r0, [r3], #-0
 ae0:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 ae4:	0008030b 	andeq	r0, r8, fp, lsl #6
 ae8:	000f0400 	andeq	r0, pc, r0, lsl #8
 aec:	00000b0b 	andeq	r0, r0, fp, lsl #22
 af0:	3f012e05 	svccc	0x00012e05
 af4:	3a0e0319 	bcc	381760 <_stack+0x301760>
 af8:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 afc:	1119270b 	tstne	r9, fp, lsl #14
 b00:	40061201 	andmi	r1, r6, r1, lsl #4
 b04:	19429618 	stmdbne	r2, {r3, r4, r9, sl, ip, pc}^
 b08:	00001301 	andeq	r1, r0, r1, lsl #6
 b0c:	03000506 	movweq	r0, #1286	; 0x506
 b10:	3b0b3a0e 	blcc	2cf350 <_stack+0x24f350>
 b14:	490b390b 	stmdbmi	fp, {r0, r1, r3, r8, fp, ip, sp}
 b18:	00180213 	andseq	r0, r8, r3, lsl r2
 b1c:	00340700 	eorseq	r0, r4, r0, lsl #14
 b20:	0b3a0e03 	bleq	e84334 <_stack+0xe04334>
 b24:	0b390b3b 	bleq	e43818 <_stack+0xdc3818>
 b28:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 b2c:	34080000 	strcc	r0, [r8], #-0
 b30:	3a080300 	bcc	201738 <_stack+0x181738>
 b34:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 b38:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 b3c:	09000018 	stmdbeq	r0, {r3, r4}
 b40:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 b44:	0b3a0e03 	bleq	e84358 <_stack+0xe04358>
 b48:	0b390b3b 	bleq	e4383c <_stack+0xdc383c>
 b4c:	01111927 	tsteq	r1, r7, lsr #18
 b50:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 b54:	00194296 	mulseq	r9, r6, r2
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
       0:	000000c3 	andeq	r0, r0, r3, asr #1
       4:	00530003 	subseq	r0, r3, r3
       8:	01020000 	mrseq	r0, (UNDEF: 2)
       c:	000d0efb 	strdeq	r0, [sp], -fp
      10:	01010101 	tsteq	r1, r1, lsl #2
      14:	01000000 	mrseq	r0, (UNDEF: 0)
      18:	2f010000 	svccs	0x00010000
      1c:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
      20:	7274722f 	rsbsvc	r7, r4, #-268435454	; 0xf0000002
      24:	65442f6b 	strbvs	r2, [r4, #-3947]	; 0xfffff095
      28:	6f746b73 	svcvs	0x00746b73
      2c:	6f6c2f70 	svcvs	0x006c2f70
      30:	5f696d73 	svcpl	0x00696d73
      34:	656d6f6b 	strbvs	r6, [sp, #-3947]!	; 0xfffff095
      38:	7261746e 	rsbvc	r7, r1, #1845493760	; 0x6e000000
      3c:	6f617369 	svcvs	0x00617369
      40:	7a65762f 	bvc	195d904 <_stack+0x18dd904>
      44:	38306162 	ldmdacc	r0!, {r1, r5, r6, r8, sp, lr}
      48:	72656b2f 	rsbvc	r6, r5, #48128	; 0xbc00
      4c:	006c656e 	rsbeq	r6, ip, lr, ror #10
      50:	61747300 	cmnvs	r4, r0, lsl #6
      54:	532e7472 			; <UNDEFINED> instruction: 0x532e7472
      58:	00000100 	andeq	r0, r0, r0, lsl #2
      5c:	02050000 	andeq	r0, r5, #0
      60:	00008000 	andeq	r8, r0, r0
      64:	2f011503 	svccs	0x00011503
      68:	2f2f2f2f 	svccs	0x002f2f2f
      6c:	15032f2f 	strne	r2, [r3, #-3887]	; 0xfffff0d1
      70:	30312008 	eorscc	r2, r1, r8
      74:	2f2f302f 	svccs	0x002f302f
      78:	2f2f2f32 	svccs	0x002f2f32
      7c:	332f2f2f 			; <UNDEFINED> instruction: 0x332f2f2f
      80:	2f2f2f2f 	svccs	0x002f2f2f
      84:	312f312f 			; <UNDEFINED> instruction: 0x312f312f
      88:	312f312f 			; <UNDEFINED> instruction: 0x312f312f
      8c:	2e140330 	mrccs	3, 0, r0, cr4, cr0, {1}
      90:	312e1503 			; <UNDEFINED> instruction: 0x312e1503
      94:	03302f2f 	teqeq	r0, #47, 30	; 0xbc
      98:	31312e15 	teqcc	r1, r5, lsl lr
      9c:	2f2f2f33 	svccs	0x002f2f33
      a0:	3632312f 	ldrtcc	r3, [r2], -pc, lsr #2
      a4:	032e0a03 			; <UNDEFINED> instruction: 0x032e0a03
      a8:	2f312e15 	svccs	0x00312e15
      ac:	1503302f 	strne	r3, [r3, #-47]	; 0xffffffd1
      b0:	3331312e 	teqcc	r1, #-2147483637	; 0x8000000b
      b4:	2f2f2f2f 	svccs	0x002f2f2f
      b8:	2f323231 	svccs	0x00323231
      bc:	a1032f32 	tstge	r3, r2, lsr pc
      c0:	02022e7e 	andeq	r2, r2, #2016	; 0x7e0
      c4:	82010100 	andhi	r0, r1, #0, 2
      c8:	03000000 	movweq	r0, #0
      cc:	00005600 	andeq	r5, r0, r0, lsl #12
      d0:	fb010200 	blx	408da <__bss_end__+0x3058e>
      d4:	01000d0e 	tsteq	r0, lr, lsl #26
      d8:	00010101 	andeq	r0, r1, r1, lsl #2
      dc:	00010000 	andeq	r0, r1, r0
      e0:	682f0100 	stmdavs	pc!, {r8}	; <UNPREDICTABLE>
      e4:	2f656d6f 	svccs	0x00656d6f
      e8:	6b727472 	blvs	1c9d2b8 <_stack+0x1c1d2b8>
      ec:	7365442f 	cmnvc	r5, #788529152	; 0x2f000000
      f0:	706f746b 	rsbvc	r7, pc, fp, ror #8
      f4:	736f6c2f 	cmnvc	pc, #12032	; 0x2f00
      f8:	6b5f696d 	blvs	17da6b4 <_stack+0x175a6b4>
      fc:	6e656d6f 	cdpvs	13, 6, cr6, cr5, cr15, {3}
     100:	69726174 	ldmdbvs	r2!, {r2, r4, r5, r6, r8, sp, lr}^
     104:	2f6f6173 	svccs	0x006f6173
     108:	627a6576 	rsbsvs	r6, sl, #494927872	; 0x1d800000
     10c:	2f383061 	svccs	0x00383061
     110:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
     114:	00006c65 	andeq	r6, r0, r5, ror #24
     118:	61747363 	cmnvs	r4, r3, ror #6
     11c:	70757472 	rsbsvc	r7, r5, r2, ror r4
     120:	0100632e 	tsteq	r0, lr, lsr #6
     124:	05000000 	streq	r0, [r0, #-0]
     128:	02050042 	andeq	r0, r5, #66	; 0x42
     12c:	00008148 	andeq	r8, r0, r8, asr #2
     130:	05012303 	streq	r2, [r1, #-771]	; 0xfffffcfd
     134:	6967bb08 	stmdbvs	r7!, {r3, r8, r9, fp, ip, sp, pc}^
     138:	052f0905 	streq	r0, [pc, #-2309]!	; fffff83b <_stack+0xfff7f83b>
     13c:	0805660c 	stmdaeq	r5, {r2, r3, r9, sl, sp, lr}
     140:	87030549 	strhi	r0, [r3, -r9, asr #10]
     144:	2f010585 	svccs	0x00010585
     148:	01000602 	tsteq	r0, r2, lsl #12
     14c:	001fe601 	andseq	lr, pc, r1, lsl #12
     150:	b9000300 	stmdblt	r0, {r8, r9}
     154:	02000000 	andeq	r0, r0, #0
     158:	0d0efb01 	vstreq	d15, [lr, #-4]
     15c:	01010100 	mrseq	r0, (UNDEF: 17)
     160:	00000001 	andeq	r0, r0, r1
     164:	01000001 	tsteq	r0, r1
     168:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; b4 <_start-0x7f4c>
     16c:	74722f65 	ldrbtvc	r2, [r2], #-3941	; 0xfffff09b
     170:	442f6b72 	strtmi	r6, [pc], #-2930	; 178 <_start-0x7e88>
     174:	746b7365 	strbtvc	r7, [fp], #-869	; 0xfffffc9b
     178:	6c2f706f 	stcvs	0, cr7, [pc], #-444	; ffffffc4 <_stack+0xfff7ffc4>
     17c:	696d736f 	stmdbvs	sp!, {r0, r1, r2, r3, r5, r6, r8, r9, ip, sp, lr}^
     180:	6d6f6b5f 	fstmdbxvs	pc!, {d22-d68}	;@ Deprecated
     184:	61746e65 	cmnvs	r4, r5, ror #28
     188:	61736972 	cmnvs	r3, r2, ror r9
     18c:	65762f6f 	ldrbvs	r2, [r6, #-3951]!	; 0xfffff091
     190:	3061627a 	rsbcc	r6, r1, sl, ror r2
     194:	656b2f38 	strbvs	r2, [fp, #-3896]!	; 0xfffff0c8
     198:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
     19c:	73752f00 	cmnvc	r5, #0, 30
     1a0:	696c2f72 	stmdbvs	ip!, {r1, r4, r5, r6, r8, r9, sl, fp, sp}^
     1a4:	63672f62 	cmnvs	r7, #392	; 0x188
     1a8:	72612f63 	rsbvc	r2, r1, #396	; 0x18c
     1ac:	6f6e2d6d 	svcvs	0x006e2d6d
     1b0:	652d656e 	strvs	r6, [sp, #-1390]!	; 0xfffffa92
     1b4:	2f696261 	svccs	0x00696261
     1b8:	2e322e39 	mrccs	14, 1, r2, cr2, cr9, {1}
     1bc:	6e692f31 	mcrvs	15, 3, r2, cr9, cr1, {1}
     1c0:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xfffff39d
     1c4:	6b000065 	blvs	360 <_start-0x7ca0>
     1c8:	656e7265 	strbvs	r7, [lr, #-613]!	; 0xfffffd9b
     1cc:	00632e6c 	rsbeq	r2, r3, ip, ror #28
     1d0:	73000001 	movwvc	r0, #1
     1d4:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
     1d8:	00682e74 	rsbeq	r2, r8, r4, ror lr
     1dc:	74000002 	strvc	r0, [r0], #-2
     1e0:	73657079 	cmnvc	r5, #121	; 0x79
     1e4:	2e746d2d 	cdpcs	13, 7, cr6, cr4, cr13, {1}
     1e8:	00010068 	andeq	r0, r1, r8, rrx
     1ec:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
     1f0:	6970672d 	ldmdbvs	r0!, {r0, r2, r3, r5, r8, r9, sl, sp, lr}^
     1f4:	00682e6f 	rsbeq	r2, r8, pc, ror #28
     1f8:	72000001 	andvc	r0, r0, #1
     1fc:	692d6970 	pushvs	{r4, r5, r6, r8, fp, sp, lr}
     200:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
     204:	74707572 	ldrbtvc	r7, [r0], #-1394	; 0xfffffa8e
     208:	00682e73 	rsbeq	r2, r8, r3, ror lr
     20c:	00000001 	andeq	r0, r0, r1
     210:	05001605 	streq	r1, [r0, #-1541]	; 0xfffff9fb
     214:	0081c002 	addeq	ip, r1, r2
     218:	018d0300 	orreq	r0, sp, r0, lsl #6
     21c:	690b0501 	stmdbvs	fp, {r0, r8, sl}
     220:	054c0305 	strbeq	r0, [ip, #-773]	; 0xfffffcfb
     224:	01052f0a 	tsteq	r5, sl, lsl #30
     228:	681b052f 	ldmdavs	fp, {r0, r1, r2, r3, r5, r8, sl}
     22c:	05840e05 	streq	r0, [r4, #3589]	; 0xe05
     230:	054c4a05 	strbeq	r4, [ip, #-2565]	; 0xfffff5fb
     234:	16053001 	strne	r3, [r5], -r1
     238:	85140584 	ldrhi	r0, [r4, #-1412]	; 0xfffffa7c
     23c:	05691005 	strbeq	r1, [r9, #-5]!
     240:	1b056605 	blne	159a5c <_stack+0xd9a5c>
     244:	820f054b 	andhi	r0, pc, #314572800	; 0x12c00000
     248:	20030105 	andcs	r0, r3, r5, lsl #2
     24c:	030d05ba 	movweq	r0, #54714	; 0xd5ba
     250:	08052e63 	stmdaeq	r5, {r0, r1, r5, r6, r9, sl, fp, sp}
     254:	4d0a0582 	cfstr32mi	mvfx0, [sl, #-520]	; 0xfffffdf8
     258:	05634b30 	strbeq	r4, [r3, #-2864]!	; 0xfffff4d0
     25c:	04020020 	streq	r0, [r2], #-32	; 0xffffffe0
     260:	32056601 	andcc	r6, r5, #1048576	; 0x100000
     264:	01040200 	mrseq	r0, R12_usr
     268:	0019054a 	andseq	r0, r9, sl, asr #10
     26c:	4a010402 	bmi	4127c <__bss_end__+0x30f30>
     270:	05510705 	ldrbeq	r0, [r1, #-1797]	; 0xfffff8fb
     274:	1d056810 	stcne	8, cr6, [r5, #-64]	; 0xffffffc0
     278:	4b110566 	blmi	441818 <_stack+0x3c1818>
     27c:	05860b05 	streq	r0, [r6, #2821]	; 0xb05
     280:	18056607 	stmdane	r5, {r0, r1, r2, r9, sl, sp, lr}
     284:	9f120568 	svcls	0x00120568
     288:	09030105 	stmdbeq	r3, {r0, r2, r8}
     28c:	2a180582 	bcs	60189c <_stack+0x58189c>
     290:	69010567 	stmdbvs	r1, {r0, r1, r2, r5, r6, r8, sl}
     294:	bd180585 	cfldr32lt	mvfx0, [r8, #-532]	; 0xfffffdec
     298:	05680705 	strbeq	r0, [r8, #-1797]!	; 0xfffff8fb
     29c:	13054a05 	movwne	r4, #23045	; 0x5a05
     2a0:	660d054b 	strvs	r0, [sp], -fp, asr #10
     2a4:	054a0b05 	strbeq	r0, [sl, #-2821]	; 0xfffff4fb
     2a8:	4a200301 	bmi	800eb4 <_stack+0x780eb4>
     2ac:	63030d05 	movwvs	r0, #15621	; 0x3d05
     2b0:	6608052e 	strvs	r0, [r8], -lr, lsr #10
     2b4:	304d0a05 	subcc	r0, sp, r5, lsl #20
     2b8:	2005634b 	andcs	r6, r5, fp, asr #6
     2bc:	01040200 	mrseq	r0, R12_usr
     2c0:	00320566 	eorseq	r0, r2, r6, ror #10
     2c4:	4a010402 	bmi	412d4 <__bss_end__+0x30f88>
     2c8:	02001905 	andeq	r1, r0, #81920	; 0x14000
     2cc:	054a0104 	strbeq	r0, [sl, #-260]	; 0xfffffefc
     2d0:	08055107 	stmdaeq	r5, {r0, r1, r2, r8, ip, lr}
     2d4:	4a1e0568 	bmi	78187c <_stack+0x70187c>
     2d8:	6a4b0d05 	bvs	12c36f4 <_stack+0x12436f4>
     2dc:	054a0705 	strbeq	r0, [sl, #-1797]	; 0xfffff8fb
     2e0:	1b05681d 	blne	15a35c <_stack+0xda35c>
     2e4:	4b0e054a 	blmi	381814 <_stack+0x301814>
     2e8:	09030105 	stmdbeq	r3, {r0, r2, r8}
     2ec:	2a1b0566 	bcs	6c188c <_stack+0x64188c>
     2f0:	69010567 	stmdbvs	r1, {r0, r1, r2, r5, r6, r8, sl}
     2f4:	670f0585 	strvs	r0, [pc, -r5, lsl #11]
     2f8:	054c0a05 	strbeq	r0, [ip, #-2565]	; 0xfffff5fb
     2fc:	14054c13 	strne	r4, [r5], #-3091	; 0xfffff3ed
     300:	82070584 	andhi	r0, r7, #132, 10	; 0x21000000
     304:	054b0a05 	strbeq	r0, [fp, #-2565]	; 0xfffff5fb
     308:	06054b04 	streq	r4, [r5], -r4, lsl #22
     30c:	000f054c 	andeq	r0, pc, ip, asr #10
     310:	66010402 	strvs	r0, [r1], -r2, lsl #8
     314:	692f0105 	stmdbvs	pc!, {r0, r2, r8}	; <UNPREDICTABLE>
     318:	05690e05 	strbeq	r0, [r9, #-3589]!	; 0xfffff1fb
     31c:	0a058206 	beq	160b3c <_stack+0xe0b3c>
     320:	4b0b054d 	blmi	2c185c <_stack+0x24185c>
     324:	05661605 	strbeq	r1, [r6, #-1541]!	; 0xfffff9fb
     328:	09054b04 	stmdbeq	r5, {r2, r8, r9, fp, lr}
     32c:	2f17054b 	svccs	0x0017054b
     330:	4b820d05 	blmi	fe08374c <_stack+0xfe00374c>
     334:	052c1105 	streq	r1, [ip, #-261]!	; 0xfffffefb
     338:	07058209 	streq	r8, [r5, -r9, lsl #4]
     33c:	36010561 	strcc	r0, [r1], -r1, ror #10
     340:	690a054d 	stmdbvs	sl, {r0, r2, r3, r6, r8, sl}
     344:	05660805 	strbeq	r0, [r6, #-2053]!	; 0xfffff7fb
     348:	0c054b15 			; <UNDEFINED> instruction: 0x0c054b15
     34c:	0b054c82 	bleq	15355c <_stack+0xd355c>
     350:	2f01054c 	svccs	0x0001054c
     354:	db040585 	blle	101970 <_stack+0x81970>
     358:	22020d05 	andcs	r0, r2, #320	; 0x140
     35c:	4e0f0516 	mcrmi	5, 0, r0, cr15, cr6, {0}
     360:	4c660705 	stclmi	7, cr0, [r6], #-20	; 0xffffffec
     364:	22020e05 	andcs	r0, r2, #5, 28	; 0x50
     368:	4e130513 	mrcmi	5, 0, r0, cr3, cr3, {0}
     36c:	68ba0705 	ldmvs	sl!, {r0, r2, r8, r9, sl}
     370:	22020e05 	andcs	r0, r2, #5, 28	; 0x50
     374:	4e170513 	mrcmi	5, 0, r0, cr7, cr3, {0}
     378:	68820705 	stmvs	r2, {r0, r2, r8, r9, sl}
     37c:	020d054b 	andeq	r0, sp, #314572800	; 0x12c00000
     380:	19051322 	stmdbne	r5, {r1, r5, r8, r9, ip}
     384:	6767674e 	strbvs	r6, [r7, -lr, asr #14]!
     388:	680a0568 	stmdavs	sl, {r3, r5, r6, r8, sl}
     38c:	054d0b05 	strbeq	r0, [sp, #-2821]	; 0xfffff4fb
     390:	1a05d715 	bne	175fec <_stack+0xf5fec>
     394:	4a04054a 	bmi	1018c4 <_stack+0x818c4>
     398:	052f1005 	streq	r1, [pc, #-5]!	; 39b <_start-0x7c65>
     39c:	1605820a 	strne	r8, [r5], -sl, lsl #4
     3a0:	4b0a054c 	blmi	2818d8 <_stack+0x2018d8>
     3a4:	02002c05 	andeq	r2, r0, #1280	; 0x500
     3a8:	052a0204 	streq	r0, [sl, #-516]!	; 0xfffffdfc
     3ac:	0402001f 	streq	r0, [r2], #-31	; 0xffffffe1
     3b0:	04056601 	streq	r6, [r5], #-1537	; 0xfffff9ff
     3b4:	01040200 	mrseq	r0, R12_usr
     3b8:	50060582 	andpl	r0, r6, r2, lsl #11
     3bc:	05671305 	strbeq	r1, [r7, #-773]!	; 0xfffffcfb
     3c0:	13058212 	movwne	r8, #21010	; 0x5212
     3c4:	66120566 	ldrvs	r0, [r2], -r6, ror #10
     3c8:	832f2005 			; <UNDEFINED> instruction: 0x832f2005
     3cc:	009f3305 	addseq	r3, pc, r5, lsl #6
     3d0:	06010402 	streq	r0, [r1], -r2, lsl #8
     3d4:	04020066 	streq	r0, [r2], #-102	; 0xffffff9a
     3d8:	07054a02 	streq	r4, [r5, -r2, lsl #20]
     3dc:	04040200 	streq	r0, [r4], #-512	; 0xfffffe00
     3e0:	20052e06 	andcs	r2, r5, r6, lsl #28
     3e4:	04040200 	streq	r0, [r4], #-512	; 0xfffffe00
     3e8:	00220582 	eoreq	r0, r2, r2, lsl #11
     3ec:	2f040402 	svccs	0x00040402
     3f0:	02000705 	andeq	r0, r0, #1310720	; 0x140000
     3f4:	054a0404 	strbeq	r0, [sl, #-1028]	; 0xfffffbfc
     3f8:	04020020 	streq	r0, [r2], #-32	; 0xffffffe0
     3fc:	04058204 	streq	r8, [r5], #-516	; 0xfffffdfc
     400:	04040200 	streq	r0, [r4], #-512	; 0xfffffe00
     404:	0402004c 	streq	r0, [r2], #-76	; 0xffffffb4
     408:	0b054b04 	bleq	153020 <_stack+0xd3020>
     40c:	04040200 	streq	r0, [r4], #-512	; 0xfffffe00
     410:	05142202 	ldreq	r2, [r4, #-514]	; 0xfffffdfe
     414:	056e2f01 	strbeq	r2, [lr, #-3841]!	; 0xfffff0ff
     418:	22028304 	andcs	r8, r2, #4, 6	; 0x10000000
     41c:	1505d914 	strne	sp, [r5, #-2324]	; 0xfffff6ec
     420:	9f0405bb 	svcls	0x000405bb
     424:	05d91405 	ldrbeq	r1, [r9, #1029]	; 0x405
     428:	0b058206 	bleq	160c48 <_stack+0xe0c48>
     42c:	3013054b 	andscc	r0, r3, fp, asr #10
     430:	05ba0e05 	ldreq	r0, [sl, #3589]!	; 0xe05
     434:	16054d17 			; <UNDEFINED> instruction: 0x16054d17
     438:	660b05d1 			; <UNDEFINED> instruction: 0x660b05d1
     43c:	05690e05 	strbeq	r0, [r9, #-3589]!	; 0xfffff1fb
     440:	01053304 	tsteq	r5, r4, lsl #6
     444:	69132202 	ldmdbvs	r3, {r1, r9, sp}
     448:	05831405 	streq	r1, [r3, #1029]	; 0x405
     44c:	27052e07 	strcs	r2, [r5, -r7, lsl #28]
     450:	01040200 	mrseq	r0, R12_usr
     454:	0018054a 	andseq	r0, r8, sl, asr #10
     458:	9e010402 	cdpls	4, 0, cr0, cr1, cr2, {0}
     45c:	02003c05 	andeq	r3, r0, #1280	; 0x500
     460:	054a0204 	strbeq	r0, [sl, #-516]	; 0xfffffdfc
     464:	04020032 	streq	r0, [r2], #-50	; 0xffffffce
     468:	0e056602 	cfmadd32eq	mvax0, mvfx6, mvfx5, mvfx2
     46c:	4b0b054b 	blmi	2c19a0 <_stack+0x2419a0>
     470:	05820705 	streq	r0, [r2, #1797]	; 0x705
     474:	0b054b0e 	bleq	1530b4 <_stack+0xd30b4>
     478:	8219054b 	andshi	r0, r9, #314572800	; 0x12c00000
     47c:	052e0705 	streq	r0, [lr, #-1797]!	; 0xfffff8fb
     480:	13054d18 	movwne	r4, #23832	; 0x5d18
     484:	660a0582 	strvs	r0, [sl], -r2, lsl #11
     488:	054c0e05 	strbeq	r0, [ip, #-3589]	; 0xfffff1fb
     48c:	0a054d11 	beq	1538d8 <_stack+0xd38d8>
     490:	4a39054b 	bmi	e419c4 <_stack+0xdc19c4>
     494:	844a0a05 	strbhi	r0, [sl], #-2565	; 0xfffff5fb
     498:	0e053d08 	cdpeq	13, 0, cr3, cr5, cr8, {0}
     49c:	4d040530 	cfstr32mi	mvfx0, [r4, #-192]	; 0xffffff40
     4a0:	05680b05 	strbeq	r0, [r8, #-2821]!	; 0xfffff4fb
     4a4:	09032f01 	stmdbeq	r3, {r0, r8, r9, sl, fp, sp}
     4a8:	000a0566 	andeq	r0, sl, r6, ror #10
     4ac:	84010402 	strhi	r0, [r1], #-1026	; 0xfffffbfe
     4b0:	0b030105 	bleq	c08cc <_stack+0x408cc>
     4b4:	8a07052e 	bhi	1c1974 <_stack+0x141974>
     4b8:	05831305 	streq	r1, [r3, #773]	; 0x305
     4bc:	10052e07 	andne	r2, r5, r7, lsl #28
     4c0:	0d05bb4f 	vstreq	d11, [r5, #-316]	; 0xfffffec4
     4c4:	03070569 	movweq	r0, #30057	; 0x7569
     4c8:	01052e76 	tsteq	r5, r6, ror lr
     4cc:	052e1003 	streq	r1, [lr, #-3]!
     4d0:	13056a0a 	movwne	r6, #23050	; 0x5a0a
     4d4:	660b054b 	strvs	r0, [fp], -fp, asr #10
     4d8:	054b0405 	strbeq	r0, [fp, #-1029]	; 0xfffffbfb
     4dc:	04054c14 	streq	r4, [r5], #-3092	; 0xfffff3ec
     4e0:	01058466 	tsteq	r5, r6, ror #8
     4e4:	0905692f 	stmdbeq	r5, {r0, r1, r2, r3, r5, r8, fp, sp, lr}
     4e8:	660705a2 	strvs	r0, [r7], -r2, lsr #11
     4ec:	02001805 	andeq	r1, r0, #327680	; 0x50000
     4f0:	054a0104 	strbeq	r0, [sl, #-260]	; 0xfffffefc
     4f4:	18054c0f 	stmdane	r5, {r0, r1, r2, r3, sl, fp, lr}
     4f8:	82080584 	andhi	r0, r8, #132, 10	; 0x21000000
     4fc:	05670e05 	strbeq	r0, [r7, #-3589]!	; 0xfffff1fb
     500:	08054c0f 	stmdaeq	r5, {r0, r1, r2, r3, sl, fp, lr}
     504:	0e0568d7 	mcreq	8, 0, r6, cr5, cr7, {6}
     508:	4d0f054b 	cfstr32mi	mvfx0, [pc, #-300]	; 3e4 <_start-0x7c1c>
     50c:	05d60d05 	ldrbeq	r0, [r6, #3333]	; 0xd05
     510:	1e056708 	cdpne	7, 0, cr6, cr5, cr8, {0}
     514:	4b1005ba 	blmi	401c04 <_stack+0x381c04>
     518:	4c660805 	stclmi	8, cr0, [r6], #-20	; 0xffffffec
     51c:	4b0e054b 	blmi	381a50 <_stack+0x301a50>
     520:	054d0905 	strbeq	r0, [sp, #-2309]	; 0xfffff6fb
     524:	9f4cf208 	svcls	0x004cf208
     528:	4b0e054b 	blmi	381a5c <_stack+0x301a5c>
     52c:	674e1905 	strbvs	r1, [lr, -r5, lsl #18]
     530:	68140567 	ldmdavs	r4, {r0, r1, r2, r5, r6, r8, sl}
     534:	05670c05 	strbeq	r0, [r7, #-3077]!	; 0xfffff3fb
     538:	0583840f 	streq	r8, [r3, #1039]	; 0x40f
     53c:	1205830d 	andne	r8, r5, #872415232	; 0x34000000
     540:	66100584 	ldrvs	r0, [r0], -r4, lsl #11
     544:	05670505 	strbeq	r0, [r7, #-1285]!	; 0xfffffafb
     548:	0805860e 	stmdaeq	r5, {r1, r2, r3, r9, sl, pc}
     54c:	4c0e054a 	cfstr32mi	mvfx0, [lr], {74}	; 0x4a
     550:	05841405 	streq	r1, [r4, #1029]	; 0x405
     554:	07056612 	smladeq	r5, r2, r6, r6
     558:	85080568 	strhi	r0, [r8, #-1384]	; 0xfffffa98
     55c:	05821c05 	streq	r1, [r2, #3077]	; 0xc05
     560:	1e054b08 	vmlane.f64	d4, d5, d8
     564:	4b080582 	blmi	201b74 <_stack+0x181b74>
     568:	05822305 	streq	r2, [r2, #773]	; 0x305
     56c:	24054b09 	strcs	r4, [r5], #-2825	; 0xfffff4f7
     570:	4a220582 	bmi	881b80 <_stack+0x801b80>
     574:	052f3105 	streq	r3, [pc, #-261]!	; 477 <_start-0x7b89>
     578:	2405823a 	strcs	r8, [r5], #-570	; 0xfffffdc6
     57c:	2f2b052e 	svccs	0x002b052e
     580:	05823405 	streq	r3, [r2, #1029]	; 0x405
     584:	26052d09 	strcs	r2, [r5], -r9, lsl #26
     588:	2d220583 	cfstr32cs	mvfx0, [r2, #-524]!	; 0xfffffdf4
     58c:	05310505 	ldreq	r0, [r1, #-1285]!	; 0xfffffafb
     590:	1b05bc08 	blne	16f5b8 <_stack+0xef5b8>
     594:	4b0805ba 	blmi	201c84 <_stack+0x181c84>
     598:	05ba1d05 	ldreq	r1, [sl, #3333]!	; 0xd05
     59c:	22054b08 	andcs	r4, r5, #8, 22	; 0x2000
     5a0:	4b0905ba 	blmi	241c90 <_stack+0x1c1c90>
     5a4:	05ba2305 	ldreq	r2, [sl, #773]!	; 0x305
     5a8:	30054a21 	andcc	r4, r5, r1, lsr #20
     5ac:	ba38052f 	blt	e01a70 <_stack+0xd81a70>
     5b0:	052e2305 	streq	r2, [lr, #-773]!	; 0xfffffcfb
     5b4:	33052f2b 	movwcc	r2, #24363	; 0x5f2b
     5b8:	2d0905ba 	cfstr32cs	mvfx0, [r9, #-744]	; 0xfffffd18
     5bc:	05bb2605 	ldreq	r2, [fp, #1541]!	; 0x605
     5c0:	05052d21 	streq	r2, [r5, #-3361]	; 0xfffff2df
     5c4:	f40c0531 	vst3.8	{d0,d2,d4}, [ip :256], r1
     5c8:	05840b05 	streq	r0, [r4, #2821]	; 0xb05
     5cc:	05692f01 	strbeq	r2, [r9, #-3841]!	; 0xfffff0ff
     5d0:	07056b09 	streq	r6, [r5, -r9, lsl #22]
     5d4:	4b0b0566 	blmi	2c1b74 <_stack+0x241b74>
     5d8:	054b0505 	strbeq	r0, [fp, #-1285]	; 0xfffffafb
     5dc:	0805bd12 	stmdaeq	r5, {r1, r4, r8, sl, fp, ip, sp, pc}
     5e0:	4c070582 	cfstr32mi	mvfx0, [r7], {130}	; 0x82
     5e4:	05bc0b05 	ldreq	r0, [ip, #2821]!	; 0xb05
     5e8:	13058305 	movwne	r8, #21253	; 0x5305
     5ec:	05667603 	strbeq	r7, [r6, #-1539]!	; 0xfffff9fd
     5f0:	2e0b0301 	cdpcs	3, 0, cr0, cr11, cr1, {0}
     5f4:	6905054d 	stmdbvs	r5, {r0, r2, r3, r6, r8, sl}
     5f8:	052f0905 	streq	r0, [pc, #-2309]!	; fffffcfb <_stack+0xfff7fcfb>
     5fc:	0b056607 	bleq	159e20 <_stack+0xd9e20>
     600:	4a05054d 	bmi	141b3c <_stack+0xc1b3c>
     604:	052f1005 	streq	r1, [pc, #-5]!	; 607 <_start-0x79f9>
     608:	0e05820b 	cdpeq	2, 0, cr8, cr5, cr11, {0}
     60c:	821c054c 	andshi	r0, ip, #76, 10	; 0x13000000
     610:	054b0b05 	strbeq	r0, [fp, #-2821]	; 0xfffff4fb
     614:	0402001e 	streq	r0, [r2], #-30	; 0xffffffe2
     618:	10054602 	andne	r4, r5, r2, lsl #12
     61c:	01040200 	mrseq	r0, R12_usr
     620:	00050566 	andeq	r0, r5, r6, ror #10
     624:	82010402 	andhi	r0, r1, #33554432	; 0x2000000
     628:	9f0b0552 	svcls	0x000b0552
     62c:	05830d05 	streq	r0, [r3, #3333]	; 0xd05
     630:	1305830e 	movwne	r8, #21262	; 0x530e
     634:	059e7203 	ldreq	r7, [lr, #515]	; 0x203
     638:	2e0f0301 	cdpcs	3, 0, cr0, cr15, cr1, {0}
     63c:	a207054d 	andge	r0, r7, #322961408	; 0x13400000
     640:	02003105 	andeq	r3, r0, #1073741825	; 0x40000001
     644:	05660204 	strbeq	r0, [r6, #-516]!	; 0xfffffdfc
     648:	04020020 	streq	r0, [r2], #-32	; 0xffffffe0
     64c:	4a058202 	bmi	160e5c <_stack+0xe0e5c>
     650:	04040200 	streq	r0, [r4], #-512	; 0xfffffe00
     654:	003e054a 	eorseq	r0, lr, sl, asr #10
     658:	66040402 	strvs	r0, [r4], -r2, lsl #8
     65c:	02005805 	andeq	r5, r0, #327680	; 0x50000
     660:	054a0504 	strbeq	r0, [sl, #-1284]	; 0xfffffafc
     664:	07054b0c 	streq	r4, [r5, -ip, lsl #22]
     668:	00290582 	eoreq	r0, r9, r2, lsl #11
     66c:	4a010402 	bmi	4167c <__bss_end__+0x31330>
     670:	054b0b05 	strbeq	r0, [fp, #-2821]	; 0xfffff4fb
     674:	07058219 	smladeq	r5, r9, r2, r8
     678:	003f052e 	eorseq	r0, pc, lr, lsr #10
     67c:	4a010402 	bmi	4168c <__bss_end__+0x31340>
     680:	054b0705 	strbeq	r0, [fp, #-1797]	; 0xfffff8fb
     684:	0402001b 	streq	r0, [r2], #-27	; 0xffffffe5
     688:	39056602 	stmdbcc	r5, {r1, r9, sl, sp, lr}
     68c:	03040200 	movweq	r0, #16896	; 0x4200
     690:	4c070566 	cfstr32mi	mvfx0, [r7], {102}	; 0x66
     694:	05822005 	streq	r2, [r2, #5]
     698:	22054b07 	andcs	r4, r5, #7168	; 0x1c00
     69c:	67070582 	strvs	r0, [r7, -r2, lsl #11]
     6a0:	05822705 	streq	r2, [r2, #1797]	; 0x705
     6a4:	27054b07 	strcs	r4, [r5, -r7, lsl #22]
     6a8:	4a250582 	bmi	941cb8 <_stack+0x8c1cb8>
     6ac:	052f3405 	streq	r3, [pc, #-1029]!	; 2af <_start-0x7d51>
     6b0:	27058242 	strcs	r8, [r5, -r2, asr #4]
     6b4:	2f2b052e 	svccs	0x002b052e
     6b8:	05823905 	streq	r3, [r2, #2309]	; 0x905
     6bc:	26052d07 	strcs	r2, [r5], -r7, lsl #26
     6c0:	2d250583 	cfstr32cs	mvfx0, [r5, #-524]!	; 0xfffffdf4
     6c4:	05310a05 	ldreq	r0, [r1, #-2565]!	; 0xfffff5fb
     6c8:	4cbb4b04 	vldmiami	fp!, {d4-d5}
     6cc:	052f0b05 	streq	r0, [pc, #-2821]!	; fffffbcf <_stack+0xfff7fbcf>
     6d0:	05692f01 	strbeq	r2, [r9, #-3841]!	; 0xfffff0ff
     6d4:	31058507 	tstcc	r5, r7, lsl #10
     6d8:	02040200 	andeq	r0, r4, #0, 4
     6dc:	00200566 	eoreq	r0, r0, r6, ror #10
     6e0:	82020402 	andhi	r0, r2, #33554432	; 0x2000000
     6e4:	02004805 	andeq	r4, r0, #327680	; 0x50000
     6e8:	054a0404 	strbeq	r0, [sl, #-1028]	; 0xfffffbfc
     6ec:	0402003e 	streq	r0, [r2], #-62	; 0xffffffc2
     6f0:	55056604 	strpl	r6, [r5, #-1540]	; 0xfffff9fc
     6f4:	05040200 	streq	r0, [r4, #-512]	; 0xfffffe00
     6f8:	4b0c054a 	blmi	301c28 <_stack+0x281c28>
     6fc:	05820705 	streq	r0, [r2, #1797]	; 0x705
     700:	04020029 	streq	r0, [r2], #-41	; 0xffffffd7
     704:	0b054a01 	bleq	152f10 <_stack+0xd2f10>
     708:	8219054b 	andshi	r0, r9, #314572800	; 0x12c00000
     70c:	052e0705 	streq	r0, [lr, #-1797]!	; 0xfffff8fb
     710:	0402003f 	streq	r0, [r2], #-63	; 0xffffffc1
     714:	07054a01 	streq	r4, [r5, -r1, lsl #20]
     718:	8220054c 	eorhi	r0, r0, #76, 10	; 0x13000000
     71c:	054b0a05 	strbeq	r0, [fp, #-2565]	; 0xfffff5fb
     720:	4cbb4b04 	vldmiami	fp!, {d4-d5}
     724:	052f0b05 	streq	r0, [pc, #-2821]!	; fffffc27 <_stack+0xfff7fc27>
     728:	05692f01 	strbeq	r2, [r9, #-3841]!	; 0xfffff0ff
     72c:	06054b08 	streq	r4, [r5], -r8, lsl #22
     730:	4b160566 	blmi	581cd0 <_stack+0x501cd0>
     734:	05a00f05 	streq	r0, [r0, #3845]!	; 0xf05
     738:	05852f01 	streq	r2, [r5, #3841]	; 0xf01
     73c:	1a059f11 	bne	168388 <_stack+0xe8388>
     740:	66130567 	ldrvs	r0, [r3], -r7, ror #10
     744:	054a0e05 	strbeq	r0, [sl, #-3589]	; 0xfffff1fb
     748:	05854b01 	streq	r4, [r5, #2817]	; 0xb01
     74c:	0a058310 	beq	161394 <_stack+0xe1394>
     750:	4b09054d 	blmi	241c8c <_stack+0x1c1c8c>
     754:	054a0405 	strbeq	r0, [sl, #-1029]	; 0xfffffbfb
     758:	0705690b 	streq	r6, [r5, -fp, lsl #18]
     75c:	4c0f054a 	cfstr32mi	mvfx0, [pc], {74}	; 0x4a
     760:	05831e05 	streq	r1, [r3, #3589]	; 0xe05
     764:	0a05680e 	beq	15a7a4 <_stack+0xda7a4>
     768:	4b21054a 	blmi	841c98 <_stack+0x7c1c98>
     76c:	05661a05 	strbeq	r1, [r6, #-2565]!	; 0xfffff5fb
     770:	0d054a15 	vstreq	s8, [r5, #-84]	; 0xffffffac
     774:	4a230569 	bmi	8c1d20 <_stack+0x841d20>
     778:	054b1405 	strbeq	r1, [fp, #-1029]	; 0xfffffbfb
     77c:	1905690e 	stmdbne	r5, {r1, r2, r3, r8, fp, sp, lr}
     780:	4b0e0566 	blmi	381d20 <_stack+0x301d20>
     784:	05661905 	strbeq	r1, [r6, #-2309]!	; 0xfffff6fb
     788:	0d054c07 	stceq	12, cr4, [r5, #-28]	; 0xffffffe4
     78c:	2f1a054b 	svccs	0x001a054b
     790:	4b821005 	blmi	fe0847ac <_stack+0xfe0047ac>
     794:	052c1505 	streq	r1, [ip, #-1285]!	; 0xfffffafb
     798:	0705820d 	streq	r8, [r5, -sp, lsl #4]
     79c:	2f0b054d 	svccs	0x000b054d
     7a0:	054c0405 	strbeq	r0, [ip, #-1029]	; 0xfffffbfb
     7a4:	01054b0b 	tsteq	r5, fp, lsl #22
     7a8:	1005692f 	andne	r6, r5, pc, lsr #18
     7ac:	4d0a0583 	cfstr32mi	mvfx0, [sl, #-524]	; 0xfffffdf4
     7b0:	4a06054b 	bmi	181ce4 <_stack+0x101ce4>
     7b4:	054b0b05 	strbeq	r0, [fp, #-2821]	; 0xfffff4fb
     7b8:	0a054a06 	beq	152fd8 <_stack+0xd2fd8>
     7bc:	4c040567 	cfstr32mi	mvfx0, [r4], {103}	; 0x67
     7c0:	054b0b05 	strbeq	r0, [fp, #-2821]	; 0xfffff4fb
     7c4:	05692f01 	strbeq	r2, [r9, #-3841]!	; 0xfffff0ff
     7c8:	0a05830f 	beq	16140c <_stack+0xe140c>
     7cc:	4b09054d 	blmi	241d08 <_stack+0x1c1d08>
     7d0:	054a0405 	strbeq	r0, [sl, #-1029]	; 0xfffffbfb
     7d4:	0705680b 	streq	r6, [r5, -fp, lsl #16]
     7d8:	001e054a 	andseq	r0, lr, sl, asr #10
     7dc:	4a010402 	bmi	417ec <__bss_end__+0x314a0>
     7e0:	02001805 	andeq	r1, r0, #327680	; 0x50000
     7e4:	054a0104 	strbeq	r0, [sl, #-260]	; 0xfffffefc
     7e8:	13054c0f 	movwne	r4, #23567	; 0x5c0f
     7ec:	4a0a0568 	bmi	281d94 <_stack+0x201d94>
     7f0:	054c1c05 	strbeq	r1, [ip, #-3077]	; 0xfffff3fb
     7f4:	1805670a 	stmdane	r5, {r1, r3, r8, r9, sl, sp, lr}
     7f8:	4a0f0568 	bmi	3c1da0 <_stack+0x341da0>
     7fc:	054b1c05 	strbeq	r1, [fp, #-3077]	; 0xfffff3fb
     800:	1b05680e 	blne	15a840 <_stack+0xda840>
     804:	4a0a054a 	bmi	281d34 <_stack+0x201d34>
     808:	054b2105 	strbeq	r2, [fp, #-261]	; 0xfffffefb
     80c:	1505661a 	strne	r6, [r5, #-1562]	; 0xfffff9e6
     810:	681a054a 	ldmdavs	sl, {r1, r3, r6, r8, sl}
     814:	054a2005 	strbeq	r2, [sl, #-5]
     818:	14052e15 	strne	r2, [r5], #-3605	; 0xfffff1eb
     81c:	820a054c 	andhi	r0, sl, #76, 10	; 0x13000000
     820:	052f4b4c 	streq	r4, [pc, #-2892]!	; fffffcdc <_stack+0xfff7fcdc>
     824:	0405300b 	streq	r3, [r5], #-11
     828:	4b0b054c 	blmi	2c1d60 <_stack+0x241d60>
     82c:	692f0105 	stmdbvs	pc!, {r0, r2, r8}	; <UNPREDICTABLE>
     830:	059f1205 	ldreq	r1, [pc, #517]	; a3d <_start-0x75c3>
     834:	04054d0a 	streq	r4, [r5], #-3338	; 0xfffff2f6
     838:	300d054a 	andcc	r0, sp, sl, asr #10
     83c:	054b0c05 	strbeq	r0, [fp, #-3077]	; 0xfffff3fb
     840:	0e054a07 	vmlaeq.f32	s8, s10, s14
     844:	4a0a0568 	bmi	281dec <_stack+0x201dec>
     848:	02002105 	andeq	r2, r0, #1073741825	; 0x40000001
     84c:	054a0104 	strbeq	r0, [sl, #-260]	; 0xfffffefc
     850:	0402001b 	streq	r0, [r2], #-27	; 0xffffffe5
     854:	12054a01 	andne	r4, r5, #4096	; 0x1000
     858:	6816054c 	ldmdavs	r6, {r2, r3, r6, r8, sl}
     85c:	054a0d05 	strbeq	r0, [sl, #-3333]	; 0xfffff2fb
     860:	0d054c1f 	stceq	12, cr4, [r5, #-124]	; 0xffffff84
     864:	681b0567 	ldmdavs	fp, {r0, r1, r2, r5, r6, r8, sl}
     868:	054a1205 	strbeq	r1, [sl, #-517]	; 0xfffffdfb
     86c:	11054b1f 	tstne	r5, pc, lsl fp
     870:	4a1e0568 	bmi	781e18 <_stack+0x701e18>
     874:	054a0d05 	strbeq	r0, [sl, #-3333]	; 0xfffff2fb
     878:	1d054b24 	vstrne	d4, [r5, #-144]	; 0xffffff70
     87c:	4a180566 	bmi	601e1c <_stack+0x581e1c>
     880:	05681d05 	strbeq	r1, [r8, #-3333]!	; 0xfffff2fb
     884:	18054a23 	stmdane	r5, {r0, r1, r5, r9, fp, lr}
     888:	4c17052e 	cfldr32mi	mvfx0, [r7], {46}	; 0x2e
     88c:	4c820d05 	stcmi	13, cr0, [r2], {5}
     890:	0e052f4b 	cdpeq	15, 0, cr2, cr5, cr11, {2}
     894:	00070530 	andeq	r0, r7, r0, lsr r5
     898:	4c020402 	cfstrsmi	mvf0, [r2], {2}
     89c:	02001405 	andeq	r1, r0, #83886080	; 0x5000000
     8a0:	62030204 	andvs	r0, r3, #4, 4	; 0x40000000
     8a4:	0004054a 	andeq	r0, r4, sl, asr #10
     8a8:	66010402 	strvs	r0, [r1], -r2, lsl #8
     8ac:	20030b05 	andcs	r0, r3, r5, lsl #22
     8b0:	2f010582 	svccs	0x00010582
     8b4:	83100569 	tsthi	r0, #440401920	; 0x1a400000
     8b8:	05671605 	strbeq	r1, [r7, #-1541]!	; 0xfffff9fb
     8bc:	0c05660f 	stceq	6, cr6, [r5], {15}
     8c0:	4b01054a 	blmi	41df0 <__bss_end__+0x31aa4>
     8c4:	830b0585 	movwhi	r0, #46469	; 0xb585
     8c8:	69670105 	stmdbvs	r7!, {r0, r2, r8}^
     8cc:	05830f05 	streq	r0, [r3, #3845]	; 0xf05
     8d0:	0b054c0a 	bleq	153900 <_stack+0xd3900>
     8d4:	4a07054b 	bmi	1c1e08 <_stack+0x141e08>
     8d8:	054b0b05 	strbeq	r0, [fp, #-2821]	; 0xfffff4fb
     8dc:	0b054b04 	bleq	1534f4 <_stack+0xd34f4>
     8e0:	2f01054c 	svccs	0x0001054c
     8e4:	830f0569 	movwhi	r0, #62825	; 0xf569
     8e8:	4b4d0a05 	blmi	1343104 <_stack+0x12c3104>
     8ec:	054a0605 	strbeq	r0, [sl, #-1541]	; 0xfffff9fb
     8f0:	07054c0b 	streq	r4, [r5, -fp, lsl #24]
     8f4:	680d054a 	stmdavs	sp, {r1, r3, r6, r8, sl}
     8f8:	054a0a05 	strbeq	r0, [sl, #-2565]	; 0xfffff5fb
     8fc:	04020021 	streq	r0, [r2], #-33	; 0xffffffdf
     900:	1c054a01 			; <UNDEFINED> instruction: 0x1c054a01
     904:	01040200 	mrseq	r0, R12_usr
     908:	4c12054a 	cfldr32mi	mvfx0, [r2], {74}	; 0x4a
     90c:	05681605 	strbeq	r1, [r8, #-1541]!	; 0xfffff9fb
     910:	1f054a0d 	svcne	0x00054a0d
     914:	670d054c 	strvs	r0, [sp, -ip, asr #10]
     918:	05681b05 	strbeq	r1, [r8, #-2821]!	; 0xfffff4fb
     91c:	1f054a12 	svcne	0x00054a12
     920:	6810054b 	ldmdavs	r0, {r0, r1, r3, r6, r8, sl}
     924:	054a1c05 	strbeq	r1, [sl, #-3077]	; 0xfffff3fb
     928:	22054a0d 	andcs	r4, r5, #53248	; 0xd000
     92c:	661b054b 	ldrvs	r0, [fp], -fp, asr #10
     930:	054a1705 	strbeq	r1, [sl, #-1797]	; 0xfffff8fb
     934:	2105681b 	tstcs	r5, fp, lsl r8
     938:	2e17054a 	cfmac32cs	mvfx0, mvfx7, mvfx10
     93c:	820d054c 	andhi	r0, sp, #76, 10	; 0x13000000
     940:	052f4b4c 	streq	r4, [pc, #-2892]!	; fffffdfc <_stack+0xfff7fdfc>
     944:	0705300e 	streq	r3, [r5, -lr]
     948:	4c04054c 	cfstr32mi	mvfx0, [r4], {76}	; 0x4c
     94c:	054c0b05 	strbeq	r0, [ip, #-2821]	; 0xfffff4fb
     950:	05692f01 	strbeq	r2, [r9, #-3841]!	; 0xfffff0ff
     954:	08054b14 	stmdaeq	r5, {r2, r4, r8, r9, fp, lr}
     958:	4b0f0582 	blmi	3c1f68 <_stack+0x341f68>
     95c:	054c0505 	strbeq	r0, [ip, #-1285]	; 0xfffffafb
     960:	1322020c 			; <UNDEFINED> instruction: 0x1322020c
     964:	05661505 	strbeq	r1, [r6, #-1285]!	; 0xfffffafb
     968:	16054b0c 	strne	r4, [r5], -ip, lsl #22
     96c:	4b050566 	blmi	141f0c <_stack+0xc1f0c>
     970:	22020b05 	andcs	r0, r2, #5120	; 0x1400
     974:	2f180514 	svccs	0x00180514
     978:	4b820e05 	blmi	fe084194 <_stack+0xfe004194>
     97c:	052c1305 	streq	r1, [ip, #-773]!	; 0xfffffcfb
     980:	0c05820b 	sfmeq	f0, 1, [r5], {11}
     984:	2f01054e 	svccs	0x0001054e
     988:	85140585 	ldrhi	r0, [r4, #-1413]	; 0xfffffa7b
     98c:	05820805 	streq	r0, [r2, #2053]	; 0x805
     990:	08054b0f 	stmdaeq	r5, {r0, r1, r2, r3, r8, r9, fp, lr}
     994:	830f054c 	movwhi	r0, #62796	; 0xf54c
     998:	054c0505 	strbeq	r0, [ip, #-1285]	; 0xfffffafb
     99c:	14220209 	strtne	r0, [r2], #-521	; 0xfffffdf7
     9a0:	004b1305 	subeq	r1, fp, r5, lsl #6
     9a4:	06010402 	streq	r0, [r1], -r2, lsl #8
     9a8:	04020066 	streq	r0, [r2], #-102	; 0xffffff9a
     9ac:	09054a02 	stmdbeq	r5, {r1, r9, fp, lr}
     9b0:	04040200 	streq	r0, [r4], #-512	; 0xfffffe00
     9b4:	08052e06 	stmdaeq	r5, {r1, r2, r9, sl, fp, sp}
     9b8:	04040200 	streq	r0, [r4], #-512	; 0xfffffe00
     9bc:	0d058630 	stceq	6, cr8, [r5, #-192]	; 0xffffff40
     9c0:	660b05d8 			; <UNDEFINED> instruction: 0x660b05d8
     9c4:	054c1605 	strbeq	r1, [ip, #-1541]	; 0xfffff9fb
     9c8:	054d8210 	strbeq	r8, [sp, #-528]	; 0xfffffdf0
     9cc:	054b3015 	strbeq	r3, [fp, #-21]	; 0xffffffeb
     9d0:	1505671d 	strne	r6, [r5, #-1821]	; 0xfffff8e3
     9d4:	6210054a 	andsvs	r0, r0, #310378496	; 0x12800000
     9d8:	02002505 	andeq	r2, r0, #20971520	; 0x1400000
     9dc:	05660104 	strbeq	r0, [r6, #-260]!	; 0xfffffefc
     9e0:	0402001d 	streq	r0, [r2], #-29	; 0xffffffe3
     9e4:	14054a01 	strne	r4, [r5], #-2561	; 0xfffff5ff
     9e8:	660e056e 	strvs	r0, [lr], -lr, ror #10
     9ec:	05671a05 	strbeq	r1, [r7, #-2565]!	; 0xfffff5fb
     9f0:	1205d822 	andne	sp, r5, #2228224	; 0x220000
     9f4:	661b059f 			; <UNDEFINED> instruction: 0x661b059f
     9f8:	054b1205 	strbeq	r1, [fp, #-517]	; 0xfffffdfb
     9fc:	0e056621 	cfmadd32eq	mvax1, mvfx6, mvfx5, mvfx1
     a00:	0015054c 	andseq	r0, r5, ip, asr #10
     a04:	66010402 	strvs	r0, [r1], -r2, lsl #8
     a08:	05671c05 	strbeq	r1, [r7, #-3077]!	; 0xfffff3fb
     a0c:	05bbdb17 	ldreq	sp, [fp, #2839]!	; 0xb17
     a10:	17056626 	strne	r6, [r5, -r6, lsr #12]
     a14:	6620054b 	strtvs	r0, [r0], -fp, asr #10
     a18:	054c0f05 	strbeq	r0, [ip, #-3845]	; 0xfffff0fb
     a1c:	08056618 	stmdaeq	r5, {r3, r4, r9, sl, sp, lr}
     a20:	f50f054b 			; <UNDEFINED> instruction: 0xf50f054b
     a24:	05661805 	strbeq	r1, [r6, #-2053]!	; 0xfffff7fb
     a28:	16054b0c 	strne	r4, [r5], -ip, lsl #22
     a2c:	4b050566 	blmi	141fcc <_stack+0xc1fcc>
     a30:	22020b05 	andcs	r0, r2, #5120	; 0x1400
     a34:	2f180514 	svccs	0x00180514
     a38:	4b820e05 	blmi	fe084254 <_stack+0xfe004254>
     a3c:	052c1305 	streq	r1, [ip, #-773]!	; 0xfffffcfb
     a40:	0c05820b 	sfmeq	f0, 1, [r5], {11}
     a44:	2f01054e 	svccs	0x0001054e
     a48:	860b0585 	strhi	r0, [fp], -r5, lsl #11
     a4c:	05821005 	streq	r1, [r2, #5]
     a50:	0d052e07 	stceq	14, cr2, [r5, #-28]	; 0xffffffe4
     a54:	01040200 	mrseq	r0, R12_usr
     a58:	0012054b 	andseq	r0, r2, fp, asr #10
     a5c:	82010402 	andhi	r0, r1, #33554432	; 0x2000000
     a60:	02002d05 	andeq	r2, r0, #320	; 0x140
     a64:	052d0104 	streq	r0, [sp, #-260]!	; 0xfffffefc
     a68:	12054c0d 	andne	r4, r5, #3328	; 0xd00
     a6c:	2d2d0582 	cfstr32cs	mvfx0, [sp, #-520]!	; 0xfffffdf8
     a70:	054d1005 	strbeq	r1, [sp, #-5]
     a74:	0c054c05 	stceq	12, cr4, [r5], {5}
     a78:	05132202 	ldreq	r2, [r3, #-514]	; 0xfffffdfe
     a7c:	08058211 	stmdaeq	r5, {r0, r4, r9, pc}
     a80:	10054c2e 	andne	r4, r5, lr, lsr #24
     a84:	4b0f05d7 	blmi	3c21e8 <_stack+0x3421e8>
     a88:	05830e05 	streq	r0, [r3, #3589]	; 0xe05
     a8c:	15053016 	strne	r3, [r5, #-22]	; 0xffffffea
     a90:	630e054b 	movwvs	r0, #58699	; 0xe54b
     a94:	02002705 	andeq	r2, r0, #1310720	; 0x140000
     a98:	05660104 	strbeq	r0, [r6, #-260]!	; 0xfffffefc
     a9c:	0402001d 	streq	r0, [r2], #-29	; 0xffffffe3
     aa0:	0b056601 	bleq	15a2ac <_stack+0xda2ac>
     aa4:	05d7686b 	ldrbeq	r6, [r7, #2155]	; 0x86b
     aa8:	13220212 			; <UNDEFINED> instruction: 0x13220212
     aac:	054c1305 	strbeq	r1, [ip, #-773]	; 0xfffffcfb
     ab0:	2d054a0b 	vstrcs	s8, [r5, #-44]	; 0xffffffd4
     ab4:	01040200 	mrseq	r0, R12_usr
     ab8:	0023054a 	eoreq	r0, r3, sl, asr #10
     abc:	4a010402 	bmi	41acc <__bss_end__+0x31780>
     ac0:	054b1205 	strbeq	r1, [fp, #-517]	; 0xfffffdfb
     ac4:	33054a2a 	movwcc	r4, #23082	; 0x5a2a
     ac8:	4a12052e 	bmi	481f88 <_stack+0x401f88>
     acc:	054a2a05 	strbeq	r2, [sl, #-2565]	; 0xfffff5fb
     ad0:	2a054b0b 	bcs	153704 <_stack+0xd3704>
     ad4:	4a220567 	bmi	882078 <_stack+0x802078>
     ad8:	05681f05 	strbeq	r1, [r8, #-3845]!	; 0xfffff0fb
     adc:	08054a17 	stmdaeq	r5, {r0, r1, r2, r4, r9, fp, lr}
     ae0:	1805d867 	stmdane	r5, {r0, r1, r2, r5, r6, fp, ip, lr, pc}
     ae4:	4c0b0582 	cfstr32mi	mvfx0, [fp], {130}	; 0x82
     ae8:	2f4b0505 	svccs	0x004b0505
     aec:	22024cbb 	andcs	r4, r2, #47872	; 0xbb00
     af0:	300c0514 	andcc	r0, ip, r4, lsl r5
     af4:	692f0105 	stmdbvs	pc!, {r0, r2, r8}	; <UNPREDICTABLE>
     af8:	05850605 	streq	r0, [r5, #1541]	; 0x605
     afc:	04020017 	streq	r0, [r2], #-23	; 0xffffffe9
     b00:	32056602 	andcc	r6, r5, #2097152	; 0x200000
     b04:	03040200 	movweq	r0, #16896	; 0x4200
     b08:	4c0a0566 	cfstr32mi	mvfx0, [sl], {102}	; 0x66
     b0c:	054b0905 	strbeq	r0, [fp, #-2309]	; 0xfffff6fb
     b10:	14056607 	strne	r6, [r5], #-1543	; 0xfffff9f9
     b14:	820b054c 	andhi	r0, fp, #76, 10	; 0x13000000
     b18:	052f0e05 	streq	r0, [pc, #-3589]!	; fffffd1b <_stack+0xfff7fd1b>
     b1c:	0a05661b 	beq	15a390 <_stack+0xda390>
     b20:	4b040585 	blmi	10213c <_stack+0x8213c>
     b24:	674b0605 	strbvs	r0, [fp, -r5, lsl #12]
     b28:	052f0a05 	streq	r0, [pc, #-2565]!	; 12b <_start-0x7ed5>
     b2c:	05692f01 	strbeq	r2, [r9, #-3841]!	; 0xfffff0ff
     b30:	0805690a 	stmdaeq	r5, {r1, r3, r8, fp, sp, lr}
     b34:	6607054b 	strvs	r0, [r7], -fp, asr #10
     b38:	054b1405 	strbeq	r1, [fp, #-1029]	; 0xfffffbfb
     b3c:	054c820b 	strbeq	r8, [ip, #-523]	; 0xfffffdf5
     b40:	0a054b04 	beq	153758 <_stack+0xd3758>
     b44:	2f01054b 	svccs	0x0001054b
     b48:	850b0569 	strhi	r0, [fp, #-1385]	; 0xfffffa97
     b4c:	054a0a05 	strbeq	r0, [sl, #-2565]	; 0xfffff5fb
     b50:	1205300d 	andne	r3, r5, #13
     b54:	6609054b 	strvs	r0, [r9], -fp, asr #10
     b58:	054b0c05 	strbeq	r0, [fp, #-3077]	; 0xfffff3fb
     b5c:	05056617 	streq	r6, [r5, #-1559]	; 0xfffff9e9
     b60:	680c054b 	stmdavs	ip, {r0, r1, r3, r6, r8, sl}
     b64:	692f0105 	stmdbvs	pc!, {r0, r2, r8}	; <UNPREDICTABLE>
     b68:	05690b05 	strbeq	r0, [r9, #-2821]!	; 0xfffff4fb
     b6c:	05054c09 	streq	r4, [r5, #-3081]	; 0xfffff3f7
     b70:	4b0b054b 	blmi	2c20a4 <_stack+0x2420a4>
     b74:	692f0105 	stmdbvs	pc!, {r0, r2, r8}	; <UNPREDICTABLE>
     b78:	05850805 	streq	r0, [r5, #2053]	; 0x805
     b7c:	04020027 	streq	r0, [r2], #-39	; 0xffffffd9
     b80:	18056601 	stmdane	r5, {r0, r9, sl, sp, lr}
     b84:	01040200 	mrseq	r0, R12_usr
     b88:	003c0582 	eorseq	r0, ip, r2, lsl #11
     b8c:	4a020402 	bmi	81b9c <_stack+0x1b9c>
     b90:	02003205 	andeq	r3, r0, #1342177280	; 0x50000000
     b94:	05660204 	strbeq	r0, [r6, #-516]!	; 0xfffffdfc
     b98:	04020046 	streq	r0, [r2], #-70	; 0xffffffba
     b9c:	40054a03 	andmi	r4, r5, r3, lsl #20
     ba0:	03040200 	movweq	r0, #16896	; 0x4200
     ba4:	4b0f0582 	blmi	3c21b4 <_stack+0x3421b4>
     ba8:	054c0b05 	strbeq	r0, [ip, #-2821]	; 0xfffff4fb
     bac:	1c054b0e 			; <UNDEFINED> instruction: 0x1c054b0e
     bb0:	4a2d0582 	bmi	b421c0 <_stack+0xac21c0>
     bb4:	05823b05 	streq	r3, [r2, #2821]	; 0xb05
     bb8:	09052e44 	stmdbeq	r5, {r2, r6, r9, sl, fp, sp}
     bbc:	4b05052e 	blmi	14207c <_stack+0xc207c>
     bc0:	054b0c05 	strbeq	r0, [fp, #-3077]	; 0xfffff3fb
     bc4:	05692f01 	strbeq	r2, [r9, #-3841]!	; 0xfffff0ff
     bc8:	07056911 	smladeq	r5, r1, r9, r6
     bcc:	4c0d0582 	cfstr32mi	mvfx0, [sp], {130}	; 0x82
     bd0:	d74b0705 	strble	r0, [fp, -r5, lsl #14]
     bd4:	054b0e05 	strbeq	r0, [fp, #-3589]	; 0xfffff1fb
     bd8:	01054d0b 	tsteq	r5, fp, lsl #26
     bdc:	1205692f 	andne	r6, r5, #770048	; 0xbc000
     be0:	82070569 	andhi	r0, r7, #440401920	; 0x1a400000
     be4:	02001f05 	andeq	r1, r0, #5, 30
     be8:	054a0104 	strbeq	r0, [sl, #-260]	; 0xfffffefc
     bec:	0705a00d 	streq	sl, [r5, -sp]
     bf0:	0e05d74b 	cdpeq	7, 0, cr13, cr5, cr11, {2}
     bf4:	4d0b054b 	cfstr32mi	mvfx0, [fp, #-300]	; 0xfffffed4
     bf8:	692f0105 	stmdbvs	pc!, {r0, r2, r8}	; <UNPREDICTABLE>
     bfc:	05850a05 	streq	r0, [r5, #2565]	; 0xa05
     c00:	12056609 	andne	r6, r5, #9437184	; 0x900000
     c04:	850a054c 	strhi	r0, [sl, #-1356]	; 0xfffffab4
     c08:	05660905 	strbeq	r0, [r6, #-2309]!	; 0xfffff6fb
     c0c:	0b054c0c 	bleq	153c44 <_stack+0xd3c44>
     c10:	00150566 	andseq	r0, r5, r6, ror #10
     c14:	4b010402 	blmi	41c24 <__bss_end__+0x318d8>
     c18:	02002e05 	andeq	r2, r0, #5, 28	; 0x50
     c1c:	05820104 	streq	r0, [r2, #260]	; 0x104
     c20:	04020016 	streq	r0, [r2], #-22	; 0xffffffea
     c24:	15058101 	strne	r8, [r5, #-257]	; 0xfffffeff
     c28:	813c054c 	teqhi	ip, ip, asr #10
     c2c:	054c1505 	strbeq	r1, [ip, #-1285]	; 0xfffffafb
     c30:	12058133 	andne	r8, r5, #-1073741812	; 0xc000000c
     c34:	6625054f 	strtvs	r0, [r5], -pc, asr #10
     c38:	054a2105 	strbeq	r2, [sl, #-261]	; 0xfffffefb
     c3c:	25052f12 	strcs	r2, [r5, #-3858]	; 0xfffff0ee
     c40:	4a210566 	bmi	8421e0 <_stack+0x7c21e0>
     c44:	05301205 	ldreq	r1, [r0, #-517]!	; 0xfffffdfb
     c48:	21056625 	tstcs	r5, r5, lsr #12
     c4c:	2f12054a 	svccs	0x0012054a
     c50:	05662505 	strbeq	r2, [r6, #-1285]!	; 0xfffffafb
     c54:	12054a21 	andne	r4, r5, #135168	; 0x21000
     c58:	6625052f 	strtvs	r0, [r5], -pc, lsr #10
     c5c:	054a2105 	strbeq	r2, [sl, #-261]	; 0xfffffefb
     c60:	25052f12 	strcs	r2, [r5, #-3858]	; 0xfffff0ee
     c64:	4a210566 	bmi	842204 <_stack+0x7c2204>
     c68:	05301205 	ldreq	r1, [r0, #-517]!	; 0xfffffdfb
     c6c:	21056625 	tstcs	r5, r5, lsr #12
     c70:	2f12054a 	svccs	0x0012054a
     c74:	05662505 	strbeq	r2, [r6, #-1285]!	; 0xfffffafb
     c78:	12054a21 	andne	r4, r5, #135168	; 0x21000
     c7c:	6625052f 	strtvs	r0, [r5], -pc, lsr #10
     c80:	054a2105 	strbeq	r2, [sl, #-261]	; 0xfffffefb
     c84:	25052f12 	strcs	r2, [r5, #-3858]	; 0xfffff0ee
     c88:	4a210566 	bmi	842228 <_stack+0x7c2228>
     c8c:	05301205 	ldreq	r1, [r0, #-517]!	; 0xfffffdfb
     c90:	21056625 	tstcs	r5, r5, lsr #12
     c94:	2f12054a 	svccs	0x0012054a
     c98:	05662505 	strbeq	r2, [r6, #-1285]!	; 0xfffffafb
     c9c:	12054a21 	andne	r4, r5, #135168	; 0x21000
     ca0:	6626052f 	strtvs	r0, [r6], -pc, lsr #10
     ca4:	054a2205 	strbeq	r2, [sl, #-517]	; 0xfffffdfb
     ca8:	25053012 	strcs	r3, [r5, #-18]	; 0xffffffee
     cac:	4a210566 	bmi	84224c <_stack+0x7c224c>
     cb0:	052f1205 	streq	r1, [pc, #-517]!	; ab3 <_start-0x754d>
     cb4:	21056625 	tstcs	r5, r5, lsr #12
     cb8:	2f12054a 	svccs	0x0012054a
     cbc:	05662505 	strbeq	r2, [r6, #-1285]!	; 0xfffffafb
     cc0:	12054a21 	andne	r4, r5, #135168	; 0x21000
     cc4:	6627052f 	strtvs	r0, [r7], -pc, lsr #10
     cc8:	054a2305 	strbeq	r2, [sl, #-773]	; 0xfffffcfb
     ccc:	1c053025 	stcne	0, cr3, [r5], {37}	; 0x25
     cd0:	660d0582 	strvs	r0, [sp], -r2, lsl #11
     cd4:	054b2605 	strbeq	r2, [fp, #-1541]	; 0xfffff9fb
     cd8:	40058237 	andmi	r8, r5, r7, lsr r2
     cdc:	82370566 	eorshi	r0, r7, #427819008	; 0x19800000
     ce0:	bc2e2605 	stclt	6, cr2, [lr], #-20	; 0xffffffec
     ce4:	05823705 	streq	r3, [r2, #1797]	; 0x705
     ce8:	3705664d 	strcc	r6, [r5, -sp, asr #12]
     cec:	2e260582 	cfsh64cs	mvdx0, mvdx6, #-62
     cf0:	05bc2205 	ldreq	r2, [ip, #517]!	; 0x205
     cf4:	3c05822c 	sfmcc	f0, 1, [r5], {44}	; 0x2c
     cf8:	82220582 	eorhi	r0, r2, #545259520	; 0x20800000
     cfc:	059f2c05 	ldreq	r2, [pc, #3077]	; 1909 <_start-0x66f7>
     d00:	3c058212 	sfmcc	f0, 1, [r5], {18}
     d04:	d6230566 	strtle	r0, [r3], -r6, ror #10
     d08:	05311605 	ldreq	r1, [r1, #-1541]!	; 0xfffff9fb
     d0c:	1505820e 	strne	r8, [r5, #-526]	; 0xfffffdf2
     d10:	6620054b 	strtvs	r0, [r0], -fp, asr #10
     d14:	05681b05 	strbeq	r1, [r8, #-2821]!	; 0xfffff4fb
     d18:	0e058213 	mcreq	2, 0, r8, cr5, cr3, {0}
     d1c:	a018054b 	andsge	r0, r8, fp, asr #10
     d20:	05ba0e05 	ldreq	r0, [sl, #3589]!	; 0xe05
     d24:	13054b17 	movwne	r4, #23319	; 0x5b17
     d28:	bb200583 	bllt	80233c <_stack+0x78233c>
     d2c:	05821505 	streq	r1, [r2, #1285]	; 0x505
     d30:	1f056712 	svcne	0x00056712
     d34:	4c1a0566 	cfldr32mi	mvfx0, [sl], {102}	; 0x66
     d38:	05662605 	strbeq	r2, [r6, #-1541]!	; 0xfffff9fb
     d3c:	1a052e12 	bne	14c58c <_stack+0xcc58c>
     d40:	6626054b 	strtvs	r0, [r6], -fp, asr #10
     d44:	052e1205 	streq	r1, [lr, #-517]!	; 0xfffffdfb
     d48:	26054c1a 			; <UNDEFINED> instruction: 0x26054c1a
     d4c:	2e120566 	cfmsc32cs	mvfx0, mvfx2, mvfx6
     d50:	054b1a05 	strbeq	r1, [fp, #-2565]	; 0xfffff5fb
     d54:	12056626 	andne	r6, r5, #39845888	; 0x2600000
     d58:	4b1a052e 	blmi	682218 <_stack+0x602218>
     d5c:	05662605 	strbeq	r2, [r6, #-1541]!	; 0xfffff9fb
     d60:	1a052e12 	bne	14c5b0 <_stack+0xcc5b0>
     d64:	6626054b 	strtvs	r0, [r6], -fp, asr #10
     d68:	052e1205 	streq	r1, [lr, #-517]!	; 0xfffffdfb
     d6c:	26054c1a 			; <UNDEFINED> instruction: 0x26054c1a
     d70:	2e120566 	cfmsc32cs	mvfx0, mvfx2, mvfx6
     d74:	054b1a05 	strbeq	r1, [fp, #-2565]	; 0xfffff5fb
     d78:	12056626 	andne	r6, r5, #39845888	; 0x2600000
     d7c:	4b1a052e 	blmi	68223c <_stack+0x60223c>
     d80:	05662605 	strbeq	r2, [r6, #-1541]!	; 0xfffff9fb
     d84:	1a052e12 	bne	14c5d4 <_stack+0xcc5d4>
     d88:	6626054b 	strtvs	r0, [r6], -fp, asr #10
     d8c:	052e1205 	streq	r1, [lr, #-517]!	; 0xfffffdfb
     d90:	26054c1a 			; <UNDEFINED> instruction: 0x26054c1a
     d94:	2e120566 	cfmsc32cs	mvfx0, mvfx2, mvfx6
     d98:	054b1a05 	strbeq	r1, [fp, #-2565]	; 0xfffff5fb
     d9c:	12056626 	andne	r6, r5, #39845888	; 0x2600000
     da0:	4b1b052e 	blmi	6c2260 <_stack+0x642260>
     da4:	05662705 	strbeq	r2, [r6, #-1797]!	; 0xfffff8fb
     da8:	1a052e13 	bne	14c5fc <_stack+0xcc5fc>
     dac:	6626054c 	strtvs	r0, [r6], -ip, asr #10
     db0:	052e1205 	streq	r1, [lr, #-517]!	; 0xfffffdfb
     db4:	26054b1a 			; <UNDEFINED> instruction: 0x26054b1a
     db8:	2e120566 	cfmsc32cs	mvfx0, mvfx2, mvfx6
     dbc:	054b1a05 	strbeq	r1, [fp, #-2565]	; 0xfffff5fb
     dc0:	12056626 	andne	r6, r5, #39845888	; 0x2600000
     dc4:	4b1c052e 	blmi	702284 <_stack+0x682284>
     dc8:	05662805 	strbeq	r2, [r6, #-2053]!	; 0xfffff7fb
     dcc:	12052e14 	andne	r2, r5, #20, 28	; 0x140
     dd0:	661f054c 	ldrvs	r0, [pc], -ip, asr #10
     dd4:	05841805 	streq	r1, [r4, #2053]	; 0x805
     dd8:	1205861b 	andne	r8, r5, #28311552	; 0x1b00000
     ddc:	03090584 	movweq	r0, #38276	; 0x9584
     de0:	059e7faa 	ldreq	r7, [lr, #4010]	; 0xfaa
     de4:	00d70301 	sbcseq	r0, r7, r1, lsl #6
     de8:	04054d2e 	streq	r4, [r5], #-3374	; 0xfffff2d2
     dec:	020e0583 	andeq	r0, lr, #549453824	; 0x20c00000
     df0:	04051322 	streq	r1, [r5], #-802	; 0xfffffcde
     df4:	02010583 	andeq	r0, r1, #549453824	; 0x20c00000
     df8:	05861322 	streq	r1, [r6, #802]	; 0x322
     dfc:	05d88510 	ldrbeq	r8, [r8, #1296]	; 0x510
     e00:	0b056605 	bleq	15a61c <_stack+0xda61c>
     e04:	020a054c 	andeq	r0, sl, #76, 10	; 0x13000000
     e08:	03051322 	movweq	r1, #21282	; 0x5322
     e0c:	020f0583 	andeq	r0, pc, #549453824	; 0x20c00000
     e10:	07051622 	streq	r1, [r5, -r2, lsr #12]
     e14:	00280566 	eoreq	r0, r8, r6, ror #10
     e18:	4a010402 	bmi	41e28 <__bss_end__+0x31adc>
     e1c:	02001905 	andeq	r1, r0, #81920	; 0x14000
     e20:	05ba0104 	ldreq	r0, [sl, #260]!	; 0x104
     e24:	08054c02 	stmdaeq	r5, {r1, sl, fp, lr}
     e28:	660705d8 			; <UNDEFINED> instruction: 0x660705d8
     e2c:	02001305 	andeq	r1, r0, #335544320	; 0x14000000
     e30:	054a0104 	strbeq	r0, [sl, #-260]	; 0xfffffefc
     e34:	0705a016 	smladeq	r5, r6, r0, sl
     e38:	2e060582 	cfsh32cs	mvfx0, mvfx6, #-62
     e3c:	052e1605 	streq	r1, [lr, #-1541]!	; 0xfffff9fb
     e40:	0b052e06 	bleq	14c660 <_stack+0xcc660>
     e44:	3017054c 	andscc	r0, r7, ip, asr #10
     e48:	05662105 	strbeq	r2, [r6, #-261]!	; 0xfffffefb
     e4c:	0b054b22 	bleq	153adc <_stack+0xd3adc>
     e50:	9f24059e 	svcls	0x0024059e
     e54:	05821705 	streq	r1, [r2, #1797]	; 0x705
     e58:	0b05620c 	bleq	159690 <_stack+0xd9690>
     e5c:	00280566 	eoreq	r0, r8, r6, ror #10
     e60:	4a010402 	bmi	41e70 <__bss_end__+0x31b24>
     e64:	02001905 	andeq	r1, r0, #81920	; 0x14000
     e68:	05820104 	streq	r0, [r2, #260]	; 0x104
     e6c:	0a055014 	beq	154ec4 <_stack+0xd4ec4>
     e70:	66090586 	strvs	r0, [r9], -r6, lsl #11
     e74:	02001c05 	andeq	r1, r0, #1280	; 0x500
     e78:	054a0104 	strbeq	r0, [sl, #-260]	; 0xfffffefc
     e7c:	06059f16 			; <UNDEFINED> instruction: 0x06059f16
     e80:	2e050582 	cfsh32cs	mvfx0, mvfx5, #-62
     e84:	052e1605 	streq	r1, [lr, #-1541]!	; 0xfffff9fb
     e88:	0b052e05 	bleq	14c6a4 <_stack+0xcc6a4>
     e8c:	3013054c 	andscc	r0, r3, ip, asr #10
     e90:	05832405 	streq	r2, [r3, #1029]	; 0x405
     e94:	09058216 	stmdbeq	r5, {r1, r2, r4, r9, pc}
     e98:	d7160568 	ldrle	r0, [r6, -r8, ror #10]
     e9c:	054a0b05 	strbeq	r0, [sl, #-2821]	; 0xfffff4fb
     ea0:	16054b0c 	strne	r4, [r5], -ip, lsl #22
     ea4:	4a2205d7 	bmi	882608 <_stack+0x802608>
     ea8:	052e0b05 	streq	r0, [lr, #-2821]!	; 0xfffff4fb
     eac:	0c054c23 	stceq	12, cr4, [r5], {35}	; 0x23
     eb0:	4a750367 	bmi	1d41c54 <_stack+0x1cc1c54>
     eb4:	05660b05 	strbeq	r0, [r6, #-2821]!	; 0xfffff4fb
     eb8:	0402002a 	streq	r0, [r2], #-42	; 0xffffffd6
     ebc:	1a054a01 	bne	1536c8 <_stack+0xd36c8>
     ec0:	01040200 	mrseq	r0, R12_usr
     ec4:	03140582 	tsteq	r4, #545259520	; 0x20800000
     ec8:	0a054a0e 	beq	153708 <_stack+0xd3708>
     ecc:	66090585 	strvs	r0, [r9], -r5, lsl #11
     ed0:	02002005 	andeq	r2, r0, #5
     ed4:	054a0104 	strbeq	r0, [sl, #-260]	; 0xfffffefc
     ed8:	04020014 	streq	r0, [r2], #-20	; 0xffffffec
     edc:	2b056601 	blcs	15a6e8 <_stack+0xda6e8>
     ee0:	02040200 	andeq	r0, r4, #0, 4
     ee4:	da0a054a 	ble	282414 <_stack+0x202414>
     ee8:	05660905 	strbeq	r0, [r6, #-2309]!	; 0xfffff6fb
     eec:	0a054c12 	beq	153f3c <_stack+0xd3f3c>
     ef0:	66090585 	strvs	r0, [r9], -r5, lsl #11
     ef4:	02000305 	andeq	r0, r0, #335544320	; 0x14000000
     ef8:	054b0104 	strbeq	r0, [fp, #-260]	; 0xfffffefc
     efc:	04020017 	streq	r0, [r2], #-23	; 0xffffffe9
     f00:	10056501 	andne	r6, r5, r1, lsl #10
     f04:	b913054c 	ldmdblt	r3, {r2, r3, r6, r8, sl}
     f08:	054b2605 	strbeq	r2, [fp, #-1541]	; 0xfffff9fb
     f0c:	2a05661a 	bcs	15a77c <_stack+0xda77c>
     f10:	01040200 	mrseq	r0, R12_usr
     f14:	a00c054a 	andge	r0, ip, sl, asr #10
     f18:	05660b05 	strbeq	r0, [r6, #-2821]!	; 0xfffff4fb
     f1c:	0402000e 	streq	r0, [r2], #-14
     f20:	27054b01 	strcs	r4, [r5, -r1, lsl #22]
     f24:	01040200 	mrseq	r0, R12_usr
     f28:	00160582 	andseq	r0, r6, r2, lsl #11
     f2c:	81010402 	tsthi	r1, r2, lsl #8
     f30:	054c0e05 	strbeq	r0, [ip, #-3589]	; 0xfffff1fb
     f34:	0e058135 	mcreq	1, 0, r8, cr5, cr5, {1}
     f38:	812c054c 			; <UNDEFINED> instruction: 0x812c054c
     f3c:	05500b05 	ldrbeq	r0, [r0, #-2821]	; 0xfffff4fb
     f40:	1a05661e 	bne	15a7c0 <_stack+0xda7c0>
     f44:	2f0b054a 	svccs	0x000b054a
     f48:	05661e05 	strbeq	r1, [r6, #-3589]!	; 0xfffff1fb
     f4c:	0b054a1a 	bleq	1537bc <_stack+0xd37bc>
     f50:	661e0530 			; <UNDEFINED> instruction: 0x661e0530
     f54:	054a1a05 	strbeq	r1, [sl, #-2565]	; 0xfffff5fb
     f58:	1e052f0b 	cdpne	15, 0, cr2, cr5, cr11, {0}
     f5c:	4a1a0566 	bmi	6824fc <_stack+0x6024fc>
     f60:	052f0b05 	streq	r0, [pc, #-2821]!	; 463 <_start-0x7b9d>
     f64:	1a05661e 	bne	15a7e4 <_stack+0xda7e4>
     f68:	2f0b054a 	svccs	0x000b054a
     f6c:	05661e05 	strbeq	r1, [r6, #-3589]!	; 0xfffff1fb
     f70:	0b054a1a 	bleq	1537e0 <_stack+0xd37e0>
     f74:	661e0530 			; <UNDEFINED> instruction: 0x661e0530
     f78:	054a1a05 	strbeq	r1, [sl, #-2565]	; 0xfffff5fb
     f7c:	1e052f0b 	cdpne	15, 0, cr2, cr5, cr11, {0}
     f80:	4a1a0566 	bmi	682520 <_stack+0x602520>
     f84:	052f0b05 	streq	r0, [pc, #-2821]!	; 487 <_start-0x7b79>
     f88:	1a05661e 	bne	15a808 <_stack+0xda808>
     f8c:	2f0b054a 	svccs	0x000b054a
     f90:	05661e05 	strbeq	r1, [r6, #-3589]!	; 0xfffff1fb
     f94:	0b054a1a 	bleq	153804 <_stack+0xd3804>
     f98:	661e0530 			; <UNDEFINED> instruction: 0x661e0530
     f9c:	054a1a05 	strbeq	r1, [sl, #-2565]	; 0xfffff5fb
     fa0:	1e052f0b 	cdpne	15, 0, cr2, cr5, cr11, {0}
     fa4:	4a1a0566 	bmi	682544 <_stack+0x602544>
     fa8:	052f0b05 	streq	r0, [pc, #-2821]!	; 4ab <_start-0x7b55>
     fac:	1b05661f 	blne	15a830 <_stack+0xda830>
     fb0:	300b054a 	andcc	r0, fp, sl, asr #10
     fb4:	05661e05 	strbeq	r1, [r6, #-3589]!	; 0xfffff1fb
     fb8:	0b054a1a 	bleq	153828 <_stack+0xd3828>
     fbc:	661e052f 	ldrvs	r0, [lr], -pc, lsr #10
     fc0:	054a1a05 	strbeq	r1, [sl, #-2565]	; 0xfffff5fb
     fc4:	1e052f0b 	cdpne	15, 0, cr2, cr5, cr11, {0}
     fc8:	4a1a0566 	bmi	682568 <_stack+0x602568>
     fcc:	052f0b05 	streq	r0, [pc, #-2821]!	; 4cf <_start-0x7b31>
     fd0:	1c056620 	stcne	6, cr6, [r5], {32}
     fd4:	301e054a 	andscc	r0, lr, sl, asr #10
     fd8:	05821505 	streq	r1, [r2, #1285]	; 0x505
     fdc:	1f056606 	svcne	0x00056606
     fe0:	8230054b 	eorshi	r0, r0, #314572800	; 0x12c00000
     fe4:	05663905 	strbeq	r3, [r6, #-2309]!	; 0xfffff6fb
     fe8:	1f058230 	svcne	0x00058230
     fec:	3005bc2e 	andcc	fp, r5, lr, lsr #24
     ff0:	66460582 	strbvs	r0, [r6], -r2, lsl #11
     ff4:	05823005 	streq	r3, [r2, #5]
     ff8:	1b052e1f 	blne	14c87c <_stack+0xcc87c>
     ffc:	822505bc 	eorhi	r0, r5, #188, 10	; 0x2f000000
    1000:	05823505 	streq	r3, [r2, #1285]	; 0x505
    1004:	2505821b 	strcs	r8, [r5, #-539]	; 0xfffffde5
    1008:	820b059f 	andhi	r0, fp, #666894336	; 0x27c00000
    100c:	05663505 	strbeq	r3, [r6, #-1285]!	; 0xfffffafb
    1010:	0f05d61c 	svceq	0x0005d61c
    1014:	82070531 	andhi	r0, r7, #205520896	; 0xc400000
    1018:	054b0e05 	strbeq	r0, [fp, #-3589]	; 0xfffff1fb
    101c:	14056619 	strne	r6, [r5], #-1561	; 0xfffff9e7
    1020:	820c0569 	andhi	r0, ip, #440401920	; 0x1a400000
    1024:	054b0705 	strbeq	r0, [fp, #-1797]	; 0xfffff8fb
    1028:	0705a111 	smladeq	r5, r1, r1, sl
    102c:	4b1005ba 	blmi	40271c <_stack+0x38271c>
    1030:	05840c05 	streq	r0, [r4, #3077]	; 0xc05
    1034:	0e05bb19 	vmoveq.32	d5[0], fp
    1038:	670b0582 	strvs	r0, [fp, -r2, lsl #11]
    103c:	05661805 	strbeq	r1, [r6, #-2053]!	; 0xfffff7fb
    1040:	1f054c13 	svcne	0x00054c13
    1044:	2e0b0566 	cfsh32cs	mvfx0, mvfx11, #54
    1048:	054b1305 	strbeq	r1, [fp, #-773]	; 0xfffffcfb
    104c:	0b05661f 	bleq	15a8d0 <_stack+0xda8d0>
    1050:	4c13052e 	cfldr32mi	mvfx0, [r3], {46}	; 0x2e
    1054:	05661f05 	strbeq	r1, [r6, #-3845]!	; 0xfffff0fb
    1058:	13052e0b 	movwne	r2, #24075	; 0x5e0b
    105c:	661f054b 	ldrvs	r0, [pc], -fp, asr #10
    1060:	052e0b05 	streq	r0, [lr, #-2821]!	; 0xfffff4fb
    1064:	1f054b13 	svcne	0x00054b13
    1068:	2e0b0566 	cfsh32cs	mvfx0, mvfx11, #54
    106c:	054b1305 	strbeq	r1, [fp, #-773]	; 0xfffffcfb
    1070:	0b05661f 	bleq	15a8f4 <_stack+0xda8f4>
    1074:	4c13052e 	cfldr32mi	mvfx0, [r3], {46}	; 0x2e
    1078:	05661f05 	strbeq	r1, [r6, #-3845]!	; 0xfffff0fb
    107c:	13052e0b 	movwne	r2, #24075	; 0x5e0b
    1080:	661f054b 	ldrvs	r0, [pc], -fp, asr #10
    1084:	052e0b05 	streq	r0, [lr, #-2821]!	; 0xfffff4fb
    1088:	1f054b13 	svcne	0x00054b13
    108c:	2e0b0566 	cfsh32cs	mvfx0, mvfx11, #54
    1090:	054b1305 	strbeq	r1, [fp, #-773]	; 0xfffffcfb
    1094:	0b05661f 	bleq	15a918 <_stack+0xda918>
    1098:	4c13052e 	cfldr32mi	mvfx0, [r3], {46}	; 0x2e
    109c:	05661f05 	strbeq	r1, [r6, #-3845]!	; 0xfffff0fb
    10a0:	13052e0b 	movwne	r2, #24075	; 0x5e0b
    10a4:	661f054b 	ldrvs	r0, [pc], -fp, asr #10
    10a8:	052e0b05 	streq	r0, [lr, #-2821]!	; 0xfffff4fb
    10ac:	20054b14 	andcs	r4, r5, r4, lsl fp
    10b0:	2e0c0566 	cfsh32cs	mvfx0, mvfx12, #54
    10b4:	054c1305 	strbeq	r1, [ip, #-773]	; 0xfffffcfb
    10b8:	0b05661f 	bleq	15a93c <_stack+0xda93c>
    10bc:	4b13052e 	blmi	4c257c <_stack+0x44257c>
    10c0:	05661f05 	strbeq	r1, [r6, #-3845]!	; 0xfffff0fb
    10c4:	13052e0b 	movwne	r2, #24075	; 0x5e0b
    10c8:	661f054b 	ldrvs	r0, [pc], -fp, asr #10
    10cc:	052e0b05 	streq	r0, [lr, #-2821]!	; 0xfffff4fb
    10d0:	21054b15 	tstcs	r5, r5, lsl fp
    10d4:	2e0d0566 	cfsh32cs	mvfx0, mvfx13, #54
    10d8:	054c0b05 	strbeq	r0, [ip, #-2821]	; 0xfffff4fb
    10dc:	11056618 	tstne	r5, r8, lsl r6
    10e0:	83170584 	tsthi	r7, #132, 10	; 0x21000000
    10e4:	059e0e05 	ldreq	r0, [lr, #3589]	; 0xe05
    10e8:	12056914 	andne	r6, r5, #20, 18	; 0x50000
    10ec:	03020584 	movweq	r0, #9604	; 0x2584
    10f0:	059e7fa4 	ldreq	r7, [lr, #4004]	; 0xfa4
    10f4:	00df0301 	sbcseq	r0, pc, r1, lsl #6
    10f8:	07054f2e 	streq	r4, [r5, -lr, lsr #30]
    10fc:	66040584 	strvs	r0, [r4], -r4, lsl #11
    1100:	054b0505 	strbeq	r0, [fp, #-1285]	; 0xfffffafb
    1104:	0505a00b 	streq	sl, [r5, #-11]
    1108:	4d060582 	cfstr32mi	mvfx0, [r6, #-520]	; 0xfffffdf8
    110c:	05d70505 	ldrbeq	r0, [r7, #1285]	; 0x505
    1110:	0905f606 	stmdbeq	r5, {r1, r2, r9, sl, ip, sp, lr, pc}
    1114:	660305da 			; <UNDEFINED> instruction: 0x660305da
    1118:	02001505 	andeq	r1, r0, #20971520	; 0x1400000
    111c:	054a0104 	strbeq	r0, [sl, #-260]	; 0xfffffefc
    1120:	0402000e 	streq	r0, [r2], #-14
    1124:	07056601 	streq	r6, [r5, -r1, lsl #12]
    1128:	6604054c 	strvs	r0, [r4], -ip, asr #10
    112c:	054c0905 	strbeq	r0, [ip, #-2309]	; 0xfffff6fb
    1130:	04054c07 	streq	r4, [r5], #-3079	; 0xfffff3f9
    1134:	4c030566 	cfstr32mi	mvfx0, [r3], {102}	; 0x66
    1138:	054c0b05 	strbeq	r0, [ip, #-2821]	; 0xfffff4fb
    113c:	0c056608 	stceq	6, cr6, [r5], {8}
    1140:	d710054c 	ldrle	r0, [r0, -ip, asr #10]
    1144:	05660b05 	strbeq	r0, [r6, #-2821]!	; 0xfffff4fb
    1148:	08054c0f 	stmdaeq	r5, {r0, r1, r2, r3, sl, fp, lr}
    114c:	66030586 	strvs	r0, [r3], -r6, lsl #11
    1150:	02001505 	andeq	r1, r0, #20971520	; 0x1400000
    1154:	054a0104 	strbeq	r0, [sl, #-260]	; 0xfffffefc
    1158:	0402000e 	streq	r0, [r2], #-14
    115c:	0a056601 	beq	15a968 <_stack+0xda968>
    1160:	6607054d 	strvs	r0, [r7], -sp, asr #10
    1164:	054c0905 	strbeq	r0, [ip, #-2309]	; 0xfffff6fb
    1168:	07054c0a 	streq	r4, [r5, -sl, lsl #24]
    116c:	4b090566 	blmi	24270c <_stack+0x1c270c>
    1170:	054c0b05 	strbeq	r0, [ip, #-2821]	; 0xfffff4fb
    1174:	0c056608 	stceq	6, cr6, [r5], {8}
    1178:	d70b054c 	strle	r0, [fp, -ip, asr #10]
    117c:	05831005 	streq	r1, [r3, #5]
    1180:	1105660b 	tstne	r5, fp, lsl #12
    1184:	8702054c 	strhi	r0, [r2, -ip, asr #10]
    1188:	6a4b0105 	bvs	12c15a4 <_stack+0x12415a4>
    118c:	05bb1205 	ldreq	r1, [fp, #517]!	; 0x205
    1190:	21054e07 	tstcs	r5, r7, lsl #28
    1194:	02040200 	andeq	r0, r4, #0, 4
    1198:	00180566 	andseq	r0, r8, r6, ror #10
    119c:	82020402 	andhi	r0, r2, #33554432	; 0x2000000
    11a0:	02003805 	andeq	r3, r0, #327680	; 0x50000
    11a4:	054a0404 	strbeq	r0, [sl, #-1028]	; 0xfffffbfc
    11a8:	0402002e 	streq	r0, [r2], #-46	; 0xffffffd2
    11ac:	44056604 	strmi	r6, [r5], #-1540	; 0xfffff9fc
    11b0:	05040200 	streq	r0, [r4, #-512]	; 0xfffffe00
    11b4:	4b0c054a 	blmi	3026e4 <_stack+0x2826e4>
    11b8:	05820705 	streq	r0, [r2, #1797]	; 0x705
    11bc:	04020021 	streq	r0, [r2], #-33	; 0xffffffdf
    11c0:	0a054a01 	beq	1539cc <_stack+0xd39cc>
    11c4:	4b0c054b 	blmi	3026f8 <_stack+0x2826f8>
    11c8:	05821905 	streq	r1, [r2, #2309]	; 0x905
    11cc:	0a052e07 	beq	14c9f0 <_stack+0xcc9f0>
    11d0:	4b07054c 	blmi	1c2708 <_stack+0x142708>
    11d4:	05310f05 	ldreq	r0, [r1, #-3845]!	; 0xfffff0fb
    11d8:	04058209 	streq	r8, [r5], #-521	; 0xfffffdf7
    11dc:	850e054b 	strhi	r0, [lr, #-1355]	; 0xfffffab5
    11e0:	20080705 	andcs	r0, r8, r5, lsl #14
    11e4:	05680a05 	strbeq	r0, [r8, #-2565]!	; 0xfffff5fb
    11e8:	14054b07 	strne	r4, [r5], #-2823	; 0xfffff4f9
    11ec:	670e0531 	smladxvs	lr, r1, r5, r0
    11f0:	054a0705 	strbeq	r0, [sl, #-1797]	; 0xfffff8fb
    11f4:	0405680a 	streq	r6, [r5], #-2058	; 0xfffff7f6
    11f8:	000c054a 	andeq	r0, ip, sl, asr #10
    11fc:	2f030402 	svccs	0x00030402
    1200:	02001605 	andeq	r1, r0, #5242880	; 0x500000
    1204:	054a0304 	strbeq	r0, [sl, #-772]	; 0xfffffcfc
    1208:	04020019 	streq	r0, [r2], #-25	; 0xffffffe7
    120c:	18056603 	stmdane	r5, {r0, r1, r9, sl, sp, lr}
    1210:	03040200 	movweq	r0, #16896	; 0x4200
    1214:	001f0549 	andseq	r0, pc, r9, asr #10
    1218:	66030402 	strvs	r0, [r3], -r2, lsl #8
    121c:	02000f05 	andeq	r0, r0, #5, 30
    1220:	05820104 	streq	r0, [r2, #260]	; 0x104
    1224:	04020004 	streq	r0, [r2], #-4
    1228:	14052e01 	strne	r2, [r5], #-3585	; 0xfffff1ff
    122c:	67070569 	strvs	r0, [r7, -r9, ror #10]
    1230:	05681405 	strbeq	r1, [r8, #-1029]!	; 0xfffffbfb
    1234:	12056811 	andne	r6, r5, #1114112	; 0x110000
    1238:	68180567 	ldmdavs	r8, {r0, r1, r2, r5, r6, r8, sl}
    123c:	054a0405 	strbeq	r0, [sl, #-1029]	; 0xfffffbfb
    1240:	04058318 	streq	r8, [r5], #-792	; 0xfffffce8
    1244:	6710054a 	ldrvs	r0, [r0, -sl, asr #10]
    1248:	05690405 	strbeq	r0, [r9, #-1029]!	; 0xfffffbfb
    124c:	01054c0b 	tsteq	r5, fp, lsl #24
    1250:	0f05692f 	svceq	0x0005692f
    1254:	4d070583 	cfstr32mi	mvfx0, [r7, #-524]	; 0xfffffdf4
    1258:	02002105 	andeq	r2, r0, #1073741825	; 0x40000001
    125c:	05660204 	strbeq	r0, [r6, #-516]!	; 0xfffffdfc
    1260:	04020018 	streq	r0, [r2], #-24	; 0xffffffe8
    1264:	38058202 	stmdacc	r5, {r1, r9, pc}
    1268:	04040200 	streq	r0, [r4], #-512	; 0xfffffe00
    126c:	002e054a 	eoreq	r0, lr, sl, asr #10
    1270:	66040402 	strvs	r0, [r4], -r2, lsl #8
    1274:	02004405 	andeq	r4, r0, #83886080	; 0x5000000
    1278:	054a0504 	strbeq	r0, [sl, #-1284]	; 0xfffffafc
    127c:	07054b0c 	streq	r4, [r5, -ip, lsl #22]
    1280:	00210582 	eoreq	r0, r1, r2, lsl #11
    1284:	4a010402 	bmi	42294 <__bss_end__+0x31f48>
    1288:	054c0a05 	strbeq	r0, [ip, #-2565]	; 0xfffff5fb
    128c:	19054b0c 	stmdbne	r5, {r2, r3, r8, r9, fp, lr}
    1290:	2e070582 	cfsh32cs	mvfx0, mvfx7, #-62
    1294:	054c0b05 	strbeq	r0, [ip, #-2821]	; 0xfffff4fb
    1298:	0c054b07 			; <UNDEFINED> instruction: 0x0c054b07
    129c:	82190531 	andshi	r0, r9, #205520896	; 0xc400000
    12a0:	052e0705 	streq	r0, [lr, #-1797]!	; 0xfffff8fb
    12a4:	07054c0b 	streq	r4, [r5, -fp, lsl #24]
    12a8:	310f054b 	tstcc	pc, fp, asr #10
    12ac:	05820905 	streq	r0, [r2, #2309]	; 0x905
    12b0:	23054b17 	movwcs	r4, #23319	; 0x5b17
    12b4:	2e07054a 	cfsh32cs	mvfx0, mvfx7, #42
    12b8:	02001705 	andeq	r1, r0, #1310720	; 0x140000
    12bc:	054b0104 	strbeq	r0, [fp, #-260]	; 0xfffffefc
    12c0:	04020023 	streq	r0, [r2], #-35	; 0xffffffdd
    12c4:	2a054a01 	bcs	153ad0 <_stack+0xd3ad0>
    12c8:	01040200 	mrseq	r0, R12_usr
    12cc:	4d0b052d 	cfstr32mi	mvfx0, [fp, #-180]	; 0xffffff4c
    12d0:	054b0705 	strbeq	r0, [fp, #-1797]	; 0xfffff8fb
    12d4:	21053128 	tstcs	r5, r8, lsr #2
    12d8:	4a1b0566 	bmi	6c2878 <_stack+0x642878>
    12dc:	054a1505 	strbeq	r1, [sl, #-1285]	; 0xfffffafb
    12e0:	10054a0f 	andne	r4, r5, pc, lsl #20
    12e4:	6904054b 	stmdbvs	r4, {r0, r1, r3, r6, r8, sl}
    12e8:	054c0b05 	strbeq	r0, [ip, #-2821]	; 0xfffff4fb
    12ec:	05692f01 	strbeq	r2, [r9, #-3841]!	; 0xfffff0ff
    12f0:	0705840f 	streq	r8, [r5, -pc, lsl #8]
    12f4:	0021054c 	eoreq	r0, r1, ip, asr #10
    12f8:	66020402 	strvs	r0, [r2], -r2, lsl #8
    12fc:	02001805 	andeq	r1, r0, #327680	; 0x50000
    1300:	05820204 	streq	r0, [r2, #516]	; 0x204
    1304:	04020038 	streq	r0, [r2], #-56	; 0xffffffc8
    1308:	2e054a04 	vmlacs.f32	s8, s10, s8
    130c:	04040200 	streq	r0, [r4], #-512	; 0xfffffe00
    1310:	00440566 	subeq	r0, r4, r6, ror #10
    1314:	4a050402 	bmi	142324 <_stack+0xc2324>
    1318:	054b0c05 	strbeq	r0, [fp, #-3077]	; 0xfffff3fb
    131c:	21058207 	tstcs	r5, r7, lsl #4
    1320:	01040200 	mrseq	r0, R12_usr
    1324:	4c0a054a 	cfstr32mi	mvfx0, [sl], {74}	; 0x4a
    1328:	054c0c05 	strbeq	r0, [ip, #-3077]	; 0xfffff3fb
    132c:	07058219 	smladeq	r5, r9, r2, r8
    1330:	4c0b052e 	cfstr32mi	mvfx0, [fp], {46}	; 0x2e
    1334:	054b0705 	strbeq	r0, [fp, #-1797]	; 0xfffff8fb
    1338:	1905310c 	stmdbne	r5, {r2, r3, r8, ip, sp}
    133c:	2e070582 	cfsh32cs	mvfx0, mvfx7, #-62
    1340:	054c0b05 	strbeq	r0, [ip, #-2821]	; 0xfffff4fb
    1344:	0f054b07 	svceq	0x00054b07
    1348:	82090532 	andhi	r0, r9, #209715200	; 0xc800000
    134c:	054b1705 	strbeq	r1, [fp, #-1797]	; 0xfffff8fb
    1350:	07054a23 	streq	r4, [r5, -r3, lsr #20]
    1354:	0017052e 	andseq	r0, r7, lr, lsr #10
    1358:	4b010402 	blmi	42368 <__bss_end__+0x3201c>
    135c:	02002305 	andeq	r2, r0, #335544320	; 0x14000000
    1360:	054a0104 	strbeq	r0, [sl, #-260]	; 0xfffffefc
    1364:	0402002a 	streq	r0, [r2], #-42	; 0xffffffd6
    1368:	0a052d01 	beq	14c774 <_stack+0xcc774>
    136c:	4b07054d 	blmi	1c28a8 <_stack+0x1428a8>
    1370:	83310405 	teqhi	r1, #83886080	; 0x5000000
    1374:	05831005 	streq	r1, [r3, #5]
    1378:	0b056904 	bleq	15b790 <_stack+0xdb790>
    137c:	2f01054c 	svccs	0x0001054c
    1380:	86070569 	strhi	r0, [r7], -r9, ror #10
    1384:	02002105 	andeq	r2, r0, #1073741825	; 0x40000001
    1388:	05660204 	strbeq	r0, [r6, #-516]!	; 0xfffffdfc
    138c:	04020018 	streq	r0, [r2], #-24	; 0xffffffe8
    1390:	38058202 	stmdacc	r5, {r1, r9, pc}
    1394:	04040200 	streq	r0, [r4], #-512	; 0xfffffe00
    1398:	002e054a 	eoreq	r0, lr, sl, asr #10
    139c:	66040402 	strvs	r0, [r4], -r2, lsl #8
    13a0:	02004405 	andeq	r4, r0, #83886080	; 0x5000000
    13a4:	054a0504 	strbeq	r0, [sl, #-1284]	; 0xfffffafc
    13a8:	07054b0c 	streq	r4, [r5, -ip, lsl #22]
    13ac:	00210582 	eoreq	r0, r1, r2, lsl #11
    13b0:	4a010402 	bmi	423c0 <__bss_end__+0x32074>
    13b4:	054c0a05 	strbeq	r0, [ip, #-2565]	; 0xfffff5fb
    13b8:	19054c0c 	stmdbne	r5, {r2, r3, sl, fp, lr}
    13bc:	2e070582 	cfsh32cs	mvfx0, mvfx7, #-62
    13c0:	054c0b05 	strbeq	r0, [ip, #-2821]	; 0xfffff4fb
    13c4:	0f054b07 	svceq	0x00054b07
    13c8:	82090531 	andhi	r0, r9, #205520896	; 0xc400000
    13cc:	054b0805 	strbeq	r0, [fp, #-2053]	; 0xfffff7fb
    13d0:	0b056904 	bleq	15b7e8 <_stack+0xdb7e8>
    13d4:	2f01054c 	svccs	0x0001054c
    13d8:	da070569 	ble	1c2984 <_stack+0x142984>
    13dc:	02002105 	andeq	r2, r0, #1073741825	; 0x40000001
    13e0:	05660204 	strbeq	r0, [r6, #-516]!	; 0xfffffdfc
    13e4:	04020018 	streq	r0, [r2], #-24	; 0xffffffe8
    13e8:	38058202 	stmdacc	r5, {r1, r9, pc}
    13ec:	04040200 	streq	r0, [r4], #-512	; 0xfffffe00
    13f0:	002e054a 	eoreq	r0, lr, sl, asr #10
    13f4:	66040402 	strvs	r0, [r4], -r2, lsl #8
    13f8:	02004405 	andeq	r4, r0, #83886080	; 0x5000000
    13fc:	054a0504 	strbeq	r0, [sl, #-1284]	; 0xfffffafc
    1400:	07054b0c 	streq	r4, [r5, -ip, lsl #22]
    1404:	00210582 	eoreq	r0, r1, r2, lsl #11
    1408:	4a010402 	bmi	42418 <__bss_end__+0x320cc>
    140c:	054c0a05 	strbeq	r0, [ip, #-2565]	; 0xfffff5fb
    1410:	12054b16 	andne	r4, r5, #22528	; 0x5800
    1414:	4a070582 	bmi	1c2a24 <_stack+0x142a24>
    1418:	4b0e0568 	blmi	3829c0 <_stack+0x3029c0>
    141c:	054c0705 	strbeq	r0, [ip, #-1797]	; 0xfffff8fb
    1420:	0405821a 	streq	r8, [r5], #-538	; 0xfffffde6
    1424:	4c0f054b 	cfstr32mi	mvfx0, [pc], {75}	; 0x4b
    1428:	05820905 	streq	r0, [r2, #2309]	; 0x905
    142c:	06054b11 			; <UNDEFINED> instruction: 0x06054b11
    1430:	6709054a 	strvs	r0, [r9, -sl, asr #10]
    1434:	05681905 	strbeq	r1, [r8, #-2309]!	; 0xfffff6fb
    1438:	0a054a04 	beq	153c50 <_stack+0xd3c50>
    143c:	4b07054c 	blmi	1c2974 <_stack+0x142974>
    1440:	05680e05 	strbeq	r0, [r8, #-3589]!	; 0xfffff1fb
    1444:	2905671d 	stmdbcs	r5, {r0, r2, r3, r4, r8, r9, sl, sp, lr}
    1448:	4a22054a 	bmi	882978 <_stack+0x802978>
    144c:	05661305 	strbeq	r1, [r6, #-773]!	; 0xfffffcfb
    1450:	09056a10 	stmdbeq	r5, {r4, r9, fp, sp, lr}
    1454:	4b0f054a 	blmi	3c2984 <_stack+0x342984>
    1458:	054a1505 	strbeq	r1, [sl, #-1285]	; 0xfffffafb
    145c:	2505841d 	strcs	r8, [r5, #-1053]	; 0xfffffbe3
    1460:	2e16054a 	cfmac32cs	mvfx0, mvfx6, mvfx10
    1464:	054b0e05 	strbeq	r0, [fp, #-3589]	; 0xfffff1fb
    1468:	21056817 	tstcs	r5, r7, lsl r8
    146c:	6604054a 	strvs	r0, [r4], -sl, asr #10
    1470:	059f0905 	ldreq	r0, [pc, #2309]	; 1d7d <_start-0x6283>
    1474:	04054a10 	streq	r4, [r5], #-2576	; 0xfffff5f0
    1478:	4b070567 	blmi	1c2a1c <_stack+0x142a1c>
    147c:	05821a05 	streq	r1, [r2, #2565]	; 0xa05
    1480:	04054b18 	streq	r4, [r5], #-2840	; 0xfffff4e8
    1484:	4c0b054a 	cfstr32mi	mvfx0, [fp], {74}	; 0x4a
    1488:	692f0105 	stmdbvs	pc!, {r0, r2, r8}	; <UNPREDICTABLE>
    148c:	05da0705 	ldrbeq	r0, [sl, #1797]	; 0x705
    1490:	04020021 	streq	r0, [r2], #-33	; 0xffffffdf
    1494:	18056602 	stmdane	r5, {r1, r9, sl, sp, lr}
    1498:	02040200 	andeq	r0, r4, #0, 4
    149c:	00380582 	eorseq	r0, r8, r2, lsl #11
    14a0:	4a040402 	bmi	1024b0 <_stack+0x824b0>
    14a4:	02002e05 	andeq	r2, r0, #5, 28	; 0x50
    14a8:	05660404 	strbeq	r0, [r6, #-1028]!	; 0xfffffbfc
    14ac:	04020044 	streq	r0, [r2], #-68	; 0xffffffbc
    14b0:	0c054a05 			; <UNDEFINED> instruction: 0x0c054a05
    14b4:	8207054b 	andhi	r0, r7, #314572800	; 0x12c00000
    14b8:	02002105 	andeq	r2, r0, #1073741825	; 0x40000001
    14bc:	054a0104 	strbeq	r0, [sl, #-260]	; 0xfffffefc
    14c0:	0c054c0a 	stceq	12, cr4, [r5], {10}
    14c4:	8219054b 	andshi	r0, r9, #314572800	; 0x12c00000
    14c8:	052e0705 	streq	r0, [lr, #-1797]!	; 0xfffff8fb
    14cc:	06054c0a 	streq	r4, [r5], -sl, lsl #24
    14d0:	310f054b 	tstcc	pc, fp, asr #10
    14d4:	05820905 	streq	r0, [r2, #2309]	; 0x905
    14d8:	1b054c0d 	blne	154514 <_stack+0xd4514>
    14dc:	4a06054a 	bmi	182a0c <_stack+0x102a0c>
    14e0:	054c0a05 	strbeq	r0, [ip, #-2565]	; 0xfffff5fb
    14e4:	11054b06 	tstne	r5, r6, lsl #22
    14e8:	4a060531 	bmi	1829b4 <_stack+0x1029b4>
    14ec:	05670905 	strbeq	r0, [r7, #-2309]!	; 0xfffff6fb
    14f0:	04056819 	streq	r6, [r5], #-2073	; 0xfffff7e7
    14f4:	4c07054a 	cfstr32mi	mvfx0, [r7], {74}	; 0x4a
    14f8:	05680e05 	strbeq	r0, [r8, #-3589]!	; 0xfffff1fb
    14fc:	2905671d 	stmdbcs	r5, {r0, r2, r3, r4, r8, r9, sl, sp, lr}
    1500:	4a22054a 	bmi	882a30 <_stack+0x802a30>
    1504:	05661305 	strbeq	r1, [r6, #-773]!	; 0xfffffcfb
    1508:	09056a10 	stmdbeq	r5, {r4, r9, fp, sp, lr}
    150c:	4b0f054a 	blmi	3c2a3c <_stack+0x342a3c>
    1510:	054a1505 	strbeq	r1, [sl, #-1285]	; 0xfffffafb
    1514:	2505841d 	strcs	r8, [r5, #-1053]	; 0xfffffbe3
    1518:	2e16054a 	cfmac32cs	mvfx0, mvfx6, mvfx10
    151c:	054b0e05 	strbeq	r0, [fp, #-3589]	; 0xfffff1fb
    1520:	21056817 	tstcs	r5, r7, lsl r8
    1524:	6604054a 	strvs	r0, [r4], -sl, asr #10
    1528:	059f0905 	ldreq	r0, [pc, #2309]	; 1e35 <_start-0x61cb>
    152c:	08054a10 	stmdaeq	r5, {r4, r9, fp, lr}
    1530:	4d040567 	cfstr32mi	mvfx0, [r4, #-412]	; 0xfffffe64
    1534:	054c1805 	strbeq	r1, [ip, #-2053]	; 0xfffff7fb
    1538:	0b054a04 	bleq	153d50 <_stack+0xd3d50>
    153c:	2f01054c 	svccs	0x0001054c
    1540:	a2090569 	andge	r0, r9, #440401920	; 0x1a400000
    1544:	054c0705 	strbeq	r0, [ip, #-1797]	; 0xfffff8fb
    1548:	04020021 	streq	r0, [r2], #-33	; 0xffffffdf
    154c:	18056602 	stmdane	r5, {r1, r9, sl, sp, lr}
    1550:	02040200 	andeq	r0, r4, #0, 4
    1554:	00380582 	eorseq	r0, r8, r2, lsl #11
    1558:	4a040402 	bmi	102568 <_stack+0x82568>
    155c:	02002e05 	andeq	r2, r0, #5, 28	; 0x50
    1560:	05660404 	strbeq	r0, [r6, #-1028]!	; 0xfffffbfc
    1564:	04020044 	streq	r0, [r2], #-68	; 0xffffffbc
    1568:	0c054a05 			; <UNDEFINED> instruction: 0x0c054a05
    156c:	8207054b 	andhi	r0, r7, #314572800	; 0x12c00000
    1570:	02002105 	andeq	r2, r0, #1073741825	; 0x40000001
    1574:	054a0104 	strbeq	r0, [sl, #-260]	; 0xfffffefc
    1578:	16054c0a 	strne	r4, [r5], -sl, lsl #24
    157c:	8212054b 	andshi	r0, r2, #314572800	; 0x12c00000
    1580:	684a0705 	stmdavs	sl, {r0, r2, r8, r9, sl}^
    1584:	054b0e05 	strbeq	r0, [fp, #-3589]	; 0xfffff1fb
    1588:	1a054c07 	bne	1545ac <_stack+0xd45ac>
    158c:	4b040582 	blmi	102b9c <_stack+0x82b9c>
    1590:	054c0f05 	strbeq	r0, [ip, #-3845]	; 0xfffff0fb
    1594:	11058209 	tstne	r5, r9, lsl #4
    1598:	4a06054c 	bmi	182ad0 <_stack+0x102ad0>
    159c:	05670905 	strbeq	r0, [r7, #-2309]!	; 0xfffff6fb
    15a0:	04056819 	streq	r6, [r5], #-2073	; 0xfffff7e7
    15a4:	4c0a054a 	cfstr32mi	mvfx0, [sl], {74}	; 0x4a
    15a8:	054b2305 	strbeq	r2, [fp, #-773]	; 0xfffffcfb
    15ac:	2d054a33 	vstrcs	s8, [r5, #-204]	; 0xffffff34
    15b0:	4a04054a 	bmi	102ae0 <_stack+0x82ae0>
    15b4:	059f1805 	ldreq	r1, [pc, #2053]	; 1dc1 <_start-0x623f>
    15b8:	2b054a1f 	blcs	153e3c <_stack+0xd3e3c>
    15bc:	4a24052e 	bmi	902a7c <_stack+0x882a7c>
    15c0:	05661005 	strbeq	r1, [r6, #-5]!
    15c4:	10054b09 	andne	r4, r5, r9, lsl #22
    15c8:	6707054a 	strvs	r0, [r7, -sl, asr #10]
    15cc:	05821a05 	streq	r1, [r2, #2565]	; 0xa05
    15d0:	18054b04 	stmdane	r5, {r2, r8, r9, fp, lr}
    15d4:	4a04054c 	bmi	102b0c <_stack+0x82b0c>
    15d8:	054c0b05 	strbeq	r0, [ip, #-2821]	; 0xfffff4fb
    15dc:	05692f01 	strbeq	r2, [r9, #-3841]!	; 0xfffff0ff
    15e0:	0705a209 	streq	sl, [r5, -r9, lsl #4]
    15e4:	0021054b 	eoreq	r0, r1, fp, asr #10
    15e8:	66020402 	strvs	r0, [r2], -r2, lsl #8
    15ec:	02001805 	andeq	r1, r0, #327680	; 0x50000
    15f0:	05820204 	streq	r0, [r2, #516]	; 0x204
    15f4:	04020038 	streq	r0, [r2], #-56	; 0xffffffc8
    15f8:	2e054a04 	vmlacs.f32	s8, s10, s8
    15fc:	04040200 	streq	r0, [r4], #-512	; 0xfffffe00
    1600:	00440566 	subeq	r0, r4, r6, ror #10
    1604:	4a050402 	bmi	142614 <_stack+0xc2614>
    1608:	054b0c05 	strbeq	r0, [fp, #-3077]	; 0xfffff3fb
    160c:	21058207 	tstcs	r5, r7, lsl #4
    1610:	01040200 	mrseq	r0, R12_usr
    1614:	4c0a054a 	cfstr32mi	mvfx0, [sl], {74}	; 0x4a
    1618:	054b0c05 	strbeq	r0, [fp, #-3077]	; 0xfffff3fb
    161c:	07058219 	smladeq	r5, r9, r2, r8
    1620:	4c0a052e 	cfstr32mi	mvfx0, [sl], {46}	; 0x2e
    1624:	054b0605 	strbeq	r0, [fp, #-1541]	; 0xfffff9fb
    1628:	0905310f 	stmdbeq	r5, {r0, r1, r2, r3, r8, ip, sp}
    162c:	4c0d0582 	cfstr32mi	mvfx0, [sp], {130}	; 0x82
    1630:	054a0605 	strbeq	r0, [sl, #-1541]	; 0xfffff9fb
    1634:	06054c0a 	streq	r4, [r5], -sl, lsl #24
    1638:	3111054b 	tstcc	r1, fp, asr #10
    163c:	054a0605 	strbeq	r0, [sl, #-1541]	; 0xfffff9fb
    1640:	19056709 	stmdbne	r5, {r0, r3, r8, r9, sl, sp, lr}
    1644:	4a040568 	bmi	102bec <_stack+0x82bec>
    1648:	054b2305 	strbeq	r2, [fp, #-773]	; 0xfffffcfb
    164c:	2d054a33 	vstrcs	s8, [r5, #-204]	; 0xffffff34
    1650:	4a04054a 	bmi	102b80 <_stack+0x82b80>
    1654:	059f1805 	ldreq	r1, [pc, #2053]	; 1e61 <_start-0x619f>
    1658:	2b054a1f 	blcs	153edc <_stack+0xd3edc>
    165c:	4a24052e 	bmi	902b1c <_stack+0x882b1c>
    1660:	05661005 	strbeq	r1, [r6, #-5]!
    1664:	10054b09 	andne	r4, r5, r9, lsl #22
    1668:	6708054a 	strvs	r0, [r8, -sl, asr #10]
    166c:	054d0405 	strbeq	r0, [sp, #-1029]	; 0xfffffbfb
    1670:	04054c18 	streq	r4, [r5], #-3096	; 0xfffff3e8
    1674:	4c0b054a 	cfstr32mi	mvfx0, [fp], {74}	; 0x4a
    1678:	692f0105 	stmdbvs	pc!, {r0, r2, r8}	; <UNPREDICTABLE>
    167c:	05a20905 	streq	r0, [r2, #2309]!	; 0x905
    1680:	21054b07 	tstcs	r5, r7, lsl #22
    1684:	02040200 	andeq	r0, r4, #0, 4
    1688:	00180566 	andseq	r0, r8, r6, ror #10
    168c:	82020402 	andhi	r0, r2, #33554432	; 0x2000000
    1690:	02003805 	andeq	r3, r0, #327680	; 0x50000
    1694:	054a0404 	strbeq	r0, [sl, #-1028]	; 0xfffffbfc
    1698:	0402002e 	streq	r0, [r2], #-46	; 0xffffffd2
    169c:	44056604 	strmi	r6, [r5], #-1540	; 0xfffff9fc
    16a0:	05040200 	streq	r0, [r4, #-512]	; 0xfffffe00
    16a4:	4b0c054a 	blmi	302bd4 <_stack+0x282bd4>
    16a8:	05820705 	streq	r0, [r2, #1797]	; 0x705
    16ac:	04020021 	streq	r0, [r2], #-33	; 0xffffffdf
    16b0:	0a054a01 	beq	153ebc <_stack+0xd3ebc>
    16b4:	4b0c054c 	blmi	302bec <_stack+0x282bec>
    16b8:	05821905 	streq	r1, [r2, #2309]	; 0x905
    16bc:	12052e07 	andne	r2, r5, #7, 28	; 0x70
    16c0:	820c054c 	andhi	r0, ip, #76, 10	; 0x13000000
    16c4:	054c1405 	strbeq	r1, [ip, #-1029]	; 0xfffffbfb
    16c8:	0c054a09 			; <UNDEFINED> instruction: 0x0c054a09
    16cc:	68110567 	ldmdavs	r1, {r0, r1, r2, r5, r6, r8, sl}
    16d0:	054a0a05 	strbeq	r0, [sl, #-2565]	; 0xfffff5fb
    16d4:	39054c29 	stmdbcc	r5, {r0, r3, r5, sl, fp, lr}
    16d8:	4a33054a 	bmi	cc2c08 <_stack+0xc42c08>
    16dc:	054a0a05 	strbeq	r0, [sl, #-2565]	; 0xfffff5fb
    16e0:	05699f0e 	strbeq	r9, [r9, #-3854]!	; 0xfffff0f2
    16e4:	0405690b 	streq	r6, [r5], #-2315	; 0xfffff6f5
    16e8:	4c0b054b 	cfstr32mi	mvfx0, [fp], {75}	; 0x4b
    16ec:	692f0105 	stmdbvs	pc!, {r0, r2, r8}	; <UNPREDICTABLE>
    16f0:	05a30405 	streq	r0, [r3, #1029]!	; 0x405
    16f4:	1322020e 			; <UNDEFINED> instruction: 0x1322020e
    16f8:	74080705 	strvc	r0, [r8], #-1797	; 0xfffff8fb
    16fc:	020b0568 	andeq	r0, fp, #104, 10	; 0x1a000000
    1700:	07051322 	streq	r1, [r5, -r2, lsr #6]
    1704:	3004054b 	andcc	r0, r4, fp, asr #10
    1708:	22020805 	andcs	r0, r2, #327680	; 0x50000
    170c:	4b070514 	blmi	1c2b64 <_stack+0x142b64>
    1710:	05681205 	strbeq	r1, [r8, #-517]!	; 0xfffffdfb
    1714:	0705670e 	streq	r6, [r5, -lr, lsl #14]
    1718:	680a054a 	stmdavs	sl, {r1, r3, r6, r8, sl}
    171c:	054a0405 	strbeq	r0, [sl, #-1029]	; 0xfffffbfb
    1720:	0402000a 	streq	r0, [r2], #-10
    1724:	14052f03 	strne	r2, [r5], #-3843	; 0xfffff0fd
    1728:	03040200 	movweq	r0, #16896	; 0x4200
    172c:	0017054a 	andseq	r0, r7, sl, asr #10
    1730:	66030402 	strvs	r0, [r3], -r2, lsl #8
    1734:	02001805 	andeq	r1, r0, #327680	; 0x50000
    1738:	05490304 	strbeq	r0, [r9, #-772]	; 0xfffffcfc
    173c:	0402001f 	streq	r0, [r2], #-31	; 0xffffffe1
    1740:	0f056603 	svceq	0x00056603
    1744:	01040200 	mrseq	r0, R12_usr
    1748:	00040582 	andeq	r0, r4, r2, lsl #11
    174c:	2e010402 	cdpcs	4, 0, cr0, cr1, cr2, {0}
    1750:	05691205 	strbeq	r1, [r9, #-517]!	; 0xfffffdfb
    1754:	12056707 	andne	r6, r5, #1835008	; 0x1c0000
    1758:	680f0568 	stmdavs	pc, {r3, r5, r6, r8, sl}	; <UNPREDICTABLE>
    175c:	05671005 	strbeq	r1, [r7, #-5]!
    1760:	04056816 	streq	r6, [r5], #-2070	; 0xfffff7ea
    1764:	8316054a 	tsthi	r6, #310378496	; 0x12800000
    1768:	054a0405 	strbeq	r0, [sl, #-1029]	; 0xfffffbfb
    176c:	0b05670e 	bleq	15b3ac <_stack+0xdb3ac>
    1770:	2f010569 	svccs	0x00010569
    1774:	830f0569 	movwhi	r0, #62825	; 0xf569
    1778:	054c0a05 	strbeq	r0, [ip, #-2565]	; 0xfffff5fb
    177c:	07054c0c 	streq	r4, [r5, -ip, lsl #24]
    1780:	4c0b054a 	cfstr32mi	mvfx0, [fp], {74}	; 0x4a
    1784:	054b0705 	strbeq	r0, [fp, #-1797]	; 0xfffff8fb
    1788:	0705310c 	streq	r3, [r5, -ip, lsl #2]
    178c:	4c0b054a 	cfstr32mi	mvfx0, [fp], {74}	; 0x4a
    1790:	054b0705 	strbeq	r0, [fp, #-1797]	; 0xfffff8fb
    1794:	21053215 	tstcs	r5, r5, lsl r2
    1798:	2e07054a 	cfsh32cs	mvfx0, mvfx7, #42
    179c:	02001505 	andeq	r1, r0, #20971520	; 0x1400000
    17a0:	054b0104 	strbeq	r0, [fp, #-260]	; 0xfffffefc
    17a4:	04020021 	streq	r0, [r2], #-33	; 0xffffffdf
    17a8:	28054a01 	stmdacs	r5, {r0, r9, fp, lr}
    17ac:	01040200 	mrseq	r0, R12_usr
    17b0:	4d0b052d 	cfstr32mi	mvfx0, [fp, #-180]	; 0xffffff4c
    17b4:	054b0705 	strbeq	r0, [fp, #-1797]	; 0xfffff8fb
    17b8:	054d3104 	strbeq	r3, [sp, #-260]	; 0xfffffefc
    17bc:	01054c0b 	tsteq	r5, fp, lsl #24
    17c0:	0f05692f 	svceq	0x0005692f
    17c4:	4c0a0583 	cfstr32mi	mvfx0, [sl], {131}	; 0x83
    17c8:	054b0c05 	strbeq	r0, [fp, #-3077]	; 0xfffff3fb
    17cc:	0b054a07 	bleq	153ff0 <_stack+0xd3ff0>
    17d0:	4b07054c 	blmi	1c2d08 <_stack+0x142d08>
    17d4:	05310c05 	ldreq	r0, [r1, #-3077]!	; 0xfffff3fb
    17d8:	0b054a07 	bleq	153ffc <_stack+0xd3ffc>
    17dc:	4b07054c 	blmi	1c2d14 <_stack+0x142d14>
    17e0:	05311505 	ldreq	r1, [r1, #-1285]!	; 0xfffffafb
    17e4:	07054a21 	streq	r4, [r5, -r1, lsr #20]
    17e8:	0015052e 	andseq	r0, r5, lr, lsr #10
    17ec:	4b010402 	blmi	427fc <__bss_end__+0x324b0>
    17f0:	02002105 	andeq	r2, r0, #1073741825	; 0x40000001
    17f4:	054a0104 	strbeq	r0, [sl, #-260]	; 0xfffffefc
    17f8:	04020028 	streq	r0, [r2], #-40	; 0xffffffd8
    17fc:	0b052d01 	bleq	14cc08 <_stack+0xccc08>
    1800:	4b07054d 	blmi	1c2d3c <_stack+0x142d3c>
    1804:	05312205 	ldreq	r2, [r1, #-517]!	; 0xfffffdfb
    1808:	1705661b 	smladne	r5, fp, r6, r6
    180c:	4a11054a 	bmi	442d3c <_stack+0x3c2d3c>
    1810:	054a0d05 	strbeq	r0, [sl, #-3333]	; 0xfffff2fb
    1814:	04054b0e 	streq	r4, [r5], #-2830	; 0xfffff4f2
    1818:	4c0b0569 	cfstr32mi	mvfx0, [fp], {105}	; 0x69
    181c:	692f0105 	stmdbvs	pc!, {r0, r2, r8}	; <UNPREDICTABLE>
    1820:	05850a05 	streq	r0, [r5, #2565]	; 0xa05
    1824:	07054b0c 	streq	r4, [r5, -ip, lsl #22]
    1828:	4c0b054a 	cfstr32mi	mvfx0, [fp], {74}	; 0x4a
    182c:	054b0705 	strbeq	r0, [fp, #-1797]	; 0xfffff8fb
    1830:	04053108 	streq	r3, [r5], #-264	; 0xfffffef8
    1834:	4c0b0569 	cfstr32mi	mvfx0, [fp], {105}	; 0x69
    1838:	692f0105 	stmdbvs	pc!, {r0, r2, r8}	; <UNPREDICTABLE>
    183c:	05d90a05 	ldrbeq	r0, [r9, #2565]	; 0xa05
    1840:	07054b12 	smladeq	r5, r2, fp, r4
    1844:	0e056866 	cdpeq	8, 0, cr6, cr5, cr6, {3}
    1848:	04054c4b 	streq	r4, [r5], #-3147	; 0xfffff3b5
    184c:	4c0f0567 	cfstr32mi	mvfx0, [pc], {103}	; 0x67
    1850:	054a0605 	strbeq	r0, [sl, #-1541]	; 0xfffff9fb
    1854:	17056709 	strne	r6, [r5, -r9, lsl #14]
    1858:	4a040568 	bmi	102e00 <_stack+0x82e00>
    185c:	054c0a05 	strbeq	r0, [ip, #-2565]	; 0xfffff5fb
    1860:	0e054b07 	vmlaeq.f64	d4, d5, d7
    1864:	671b0568 	ldrvs	r0, [fp, -r8, ror #10]
    1868:	054a2505 	strbeq	r2, [sl, #-1285]	; 0xfffffafb
    186c:	11054a20 	tstne	r5, r0, lsr #20
    1870:	6a0e0566 	bvs	382e10 <_stack+0x302e10>
    1874:	054a0905 	strbeq	r0, [sl, #-2309]	; 0xfffff6fb
    1878:	13054b0d 	movwne	r4, #23309	; 0x5b0d
    187c:	8419054a 	ldrhi	r0, [r9], #-1354	; 0xfffffab6
    1880:	054a2105 	strbeq	r2, [sl, #-261]	; 0xfffffefb
    1884:	0e052e14 	mcreq	14, 0, r2, cr5, cr4, {0}
    1888:	6815054b 	ldmdavs	r5, {r0, r1, r3, r6, r8, sl}
    188c:	054a1f05 	strbeq	r1, [sl, #-3845]	; 0xfffff0fb
    1890:	07056604 	streq	r6, [r5, -r4, lsl #12]
    1894:	4a0e059f 	bmi	382f18 <_stack+0x302f18>
    1898:	05681605 	strbeq	r1, [r8, #-1541]!	; 0xfffff9fb
    189c:	07054a22 	streq	r4, [r5, -r2, lsr #20]
    18a0:	0016052e 	andseq	r0, r6, lr, lsr #10
    18a4:	4b010402 	blmi	428b4 <__bss_end__+0x32568>
    18a8:	02002205 	andeq	r2, r0, #1342177280	; 0x50000000
    18ac:	054a0104 	strbeq	r0, [sl, #-260]	; 0xfffffefc
    18b0:	04020029 	streq	r0, [r2], #-41	; 0xffffffd7
    18b4:	11052d01 	tstne	r5, r1, lsl #26
    18b8:	6904054d 	stmdbvs	r4, {r0, r2, r3, r6, r8, sl}
    18bc:	054b1605 	strbeq	r1, [fp, #-1541]	; 0xfffff9fb
    18c0:	0b054a04 	bleq	1540d8 <_stack+0xd40d8>
    18c4:	2f01054c 	svccs	0x0001054c
    18c8:	d90a0569 	stmdble	sl, {r0, r3, r5, r6, r8, sl}
    18cc:	054b0c05 	strbeq	r0, [fp, #-3077]	; 0xfffff3fb
    18d0:	0a054a07 	beq	1540f4 <_stack+0xd40f4>
    18d4:	4b06054c 	blmi	182e0c <_stack+0x102e0c>
    18d8:	05310b05 	ldreq	r0, [r1, #-2821]!	; 0xfffff4fb
    18dc:	06054a17 			; <UNDEFINED> instruction: 0x06054a17
    18e0:	4c0a054a 	cfstr32mi	mvfx0, [sl], {74}	; 0x4a
    18e4:	054b0605 	strbeq	r0, [fp, #-1541]	; 0xfffff9fb
    18e8:	0605310f 	streq	r3, [r5], -pc, lsl #2
    18ec:	6709054a 	strvs	r0, [r9, -sl, asr #10]
    18f0:	05681705 	strbeq	r1, [r8, #-1797]!	; 0xfffff8fb
    18f4:	07054a04 	streq	r4, [r5, -r4, lsl #20]
    18f8:	680e054c 	stmdavs	lr, {r2, r3, r6, r8, sl}
    18fc:	05671b05 	strbeq	r1, [r7, #-2821]!	; 0xfffff4fb
    1900:	20054a25 	andcs	r4, r5, r5, lsr #20
    1904:	6611054a 	ldrvs	r0, [r1], -sl, asr #10
    1908:	056a0e05 	strbeq	r0, [sl, #-3589]!	; 0xfffff1fb
    190c:	0d054a09 	vstreq	s8, [r5, #-36]	; 0xffffffdc
    1910:	4a13054b 	bmi	4c2e44 <_stack+0x442e44>
    1914:	05841905 	streq	r1, [r4, #2309]	; 0x905
    1918:	14054a21 	strne	r4, [r5], #-2593	; 0xfffff5df
    191c:	4b0e052e 	blmi	382ddc <_stack+0x302ddc>
    1920:	05681505 	strbeq	r1, [r8, #-1285]!	; 0xfffffafb
    1924:	04054a1f 	streq	r4, [r5], #-2591	; 0xfffff5e1
    1928:	9f070566 	svcls	0x00070566
    192c:	054a0e05 	strbeq	r0, [sl, #-3589]	; 0xfffff1fb
    1930:	04056708 	streq	r6, [r5], #-1800	; 0xfffff8f8
    1934:	4c16054d 	cfldr32mi	mvfx0, [r6], {77}	; 0x4d
    1938:	054a0405 	strbeq	r0, [sl, #-1029]	; 0xfffffbfb
    193c:	01054c0b 	tsteq	r5, fp, lsl #24
    1940:	0a05692f 	beq	15be04 <_stack+0xdbe04>
    1944:	4b1205bd 	blmi	483040 <_stack+0x403040>
    1948:	68660705 	stmdavs	r6!, {r0, r2, r8, r9, sl}^
    194c:	4c4b0e05 	mcrrmi	14, 0, r0, fp, cr5
    1950:	05670405 	strbeq	r0, [r7, #-1029]!	; 0xfffffbfb
    1954:	06054c0f 	streq	r4, [r5], -pc, lsl #24
    1958:	6709054a 	strvs	r0, [r9, -sl, asr #10]
    195c:	05681705 	strbeq	r1, [r8, #-1797]!	; 0xfffff8fb
    1960:	0a054a04 	beq	154178 <_stack+0xd4178>
    1964:	4b21054c 	blmi	842e9c <_stack+0x7c2e9c>
    1968:	054a2f05 	strbeq	r2, [sl, #-3845]	; 0xfffff0fb
    196c:	04054a2b 	streq	r4, [r5], #-2603	; 0xfffff5d5
    1970:	9f14054a 	svcls	0x0014054a
    1974:	054a1b05 	strbeq	r1, [sl, #-2821]	; 0xfffff4fb
    1978:	20052e25 	andcs	r2, r5, r5, lsr #28
    197c:	660e054a 	strvs	r0, [lr], -sl, asr #10
    1980:	054b0705 	strbeq	r0, [fp, #-1797]	; 0xfffff8fb
    1984:	16054a0e 	strne	r4, [r5], -lr, lsl #20
    1988:	4a220568 	bmi	882f30 <_stack+0x802f30>
    198c:	052e0705 	streq	r0, [lr, #-1797]!	; 0xfffff8fb
    1990:	04020016 	streq	r0, [r2], #-22	; 0xffffffea
    1994:	22054b01 	andcs	r4, r5, #1024	; 0x400
    1998:	01040200 	mrseq	r0, R12_usr
    199c:	0029054a 	eoreq	r0, r9, sl, asr #10
    19a0:	2d010402 	cfstrscs	mvf0, [r1, #-8]
    19a4:	054d1105 	strbeq	r1, [sp, #-261]	; 0xfffffefb
    19a8:	16056804 	strne	r6, [r5], -r4, lsl #16
    19ac:	4a04054c 	bmi	102ee4 <_stack+0x82ee4>
    19b0:	054c0b05 	strbeq	r0, [ip, #-2821]	; 0xfffff4fb
    19b4:	05692f01 	strbeq	r2, [r9, #-3841]!	; 0xfffff0ff
    19b8:	0b05bd0a 	bleq	170de8 <_stack+0xf0de8>
    19bc:	4a06054b 	bmi	182ef0 <_stack+0x102ef0>
    19c0:	054c0a05 	strbeq	r0, [ip, #-2565]	; 0xfffff5fb
    19c4:	0b054b06 	bleq	1545e4 <_stack+0xd45e4>
    19c8:	4a060531 	bmi	182e94 <_stack+0x102e94>
    19cc:	054c0a05 	strbeq	r0, [ip, #-2565]	; 0xfffff5fb
    19d0:	0f054b06 	svceq	0x00054b06
    19d4:	4a060531 	bmi	182ea0 <_stack+0x102ea0>
    19d8:	05670905 	strbeq	r0, [r7, #-2309]!	; 0xfffff6fb
    19dc:	04056817 	streq	r6, [r5], #-2071	; 0xfffff7e9
    19e0:	4b21054a 	blmi	842f10 <_stack+0x7c2f10>
    19e4:	054a2f05 	strbeq	r2, [sl, #-3845]	; 0xfffff0fb
    19e8:	04054a2b 	streq	r4, [r5], #-2603	; 0xfffff5d5
    19ec:	9f14054a 	svcls	0x0014054a
    19f0:	054a1b05 	strbeq	r1, [sl, #-2821]	; 0xfffff4fb
    19f4:	20052e25 	andcs	r2, r5, r5, lsr #28
    19f8:	660e054a 	strvs	r0, [lr], -sl, asr #10
    19fc:	054b0705 	strbeq	r0, [fp, #-1797]	; 0xfffff8fb
    1a00:	08054a0e 	stmdaeq	r5, {r1, r2, r3, r9, fp, lr}
    1a04:	4d040567 	cfstr32mi	mvfx0, [r4, #-412]	; 0xfffffe64
    1a08:	054c1605 	strbeq	r1, [ip, #-1541]	; 0xfffff9fb
    1a0c:	0b054a04 	bleq	154224 <_stack+0xd4224>
    1a10:	2f01054c 	svccs	0x0001054c
    1a14:	bd0a0569 	cfstr32lt	mvfx0, [sl, #-420]	; 0xfffffe5c
    1a18:	054b0c05 	strbeq	r0, [fp, #-3077]	; 0xfffff3fb
    1a1c:	12054a07 	andne	r4, r5, #28672	; 0x7000
    1a20:	4a09054c 	bmi	242f58 <_stack+0x1c2f58>
    1a24:	05670c05 	strbeq	r0, [r7, #-3077]!	; 0xfffff3fb
    1a28:	0a05680f 	beq	15ba6c <_stack+0xdba6c>
    1a2c:	4c27054a 	cfstr32mi	mvfx0, [r7], #-296	; 0xfffffed8
    1a30:	054a3505 	strbeq	r3, [sl, #-1285]	; 0xfffffafb
    1a34:	0a054a31 	beq	154300 <_stack+0xd4300>
    1a38:	9f0e054a 	svcls	0x000e054a
    1a3c:	690b0569 	stmdbvs	fp, {r0, r3, r5, r6, r8, sl}
    1a40:	054b0405 	strbeq	r0, [fp, #-1029]	; 0xfffffbfb
    1a44:	01054c0b 	tsteq	r5, fp, lsl #24
    1a48:	1205692f 	andne	r6, r5, #770048	; 0xbc000
    1a4c:	2a056783 	bcs	15b860 <_stack+0xdb860>
    1a50:	66230567 	strtvs	r0, [r3], -r7, ror #10
    1a54:	054a1e05 	strbeq	r1, [sl, #-3589]	; 0xfffff1fb
    1a58:	12054a17 	andne	r4, r5, #94208	; 0x17000
    1a5c:	4b01054a 	blmi	42f8c <__bss_end__+0x32c40>
    1a60:	83100585 	tsthi	r0, #557842432	; 0x21400000
    1a64:	054d0a05 	strbeq	r0, [sp, #-2565]	; 0xfffff5fb
    1a68:	15054c0c 	strne	r4, [r5, #-3084]	; 0xfffff3f4
    1a6c:	6607054a 	strvs	r0, [r7], -sl, asr #10
    1a70:	054b0c05 	strbeq	r0, [fp, #-3077]	; 0xfffff3fb
    1a74:	0c054a07 			; <UNDEFINED> instruction: 0x0c054a07
    1a78:	4a070568 	bmi	1c3020 <_stack+0x143020>
    1a7c:	054d0f05 	strbeq	r0, [sp, #-3845]	; 0xfffff0fb
    1a80:	0e05831e 	mcreq	3, 0, r8, cr5, cr14, {0}
    1a84:	4a0a0568 	bmi	28302c <_stack+0x20302c>
    1a88:	054b2105 	strbeq	r2, [fp, #-261]	; 0xfffffefb
    1a8c:	1505661a 	strne	r6, [r5, #-1562]	; 0xfffff9e6
    1a90:	690d054a 	stmdbvs	sp, {r1, r3, r6, r8, sl}
    1a94:	054a2305 	strbeq	r2, [sl, #-773]	; 0xfffffcfb
    1a98:	0e054b14 	vmoveq.32	d5[0], r4
    1a9c:	66190569 	ldrvs	r0, [r9], -r9, ror #10
    1aa0:	054b0e05 	strbeq	r0, [fp, #-3589]	; 0xfffff1fb
    1aa4:	07056619 	smladeq	r5, r9, r6, r6
    1aa8:	4b0d054c 	blmi	342fe0 <_stack+0x2c2fe0>
    1aac:	052f1a05 	streq	r1, [pc, #-2565]!	; 10af <_start-0x6f51>
    1ab0:	054b8210 	strbeq	r8, [fp, #-528]	; 0xfffffdf0
    1ab4:	0d052c15 	stceq	12, cr2, [r5, #-84]	; 0xffffffac
    1ab8:	4d070582 	cfstr32mi	mvfx0, [r7, #-520]	; 0xfffffdf8
    1abc:	052f0b05 	streq	r0, [pc, #-2821]!	; fbf <_start-0x7041>
    1ac0:	04054d09 	streq	r4, [r5], #-3337	; 0xfffff2f7
    1ac4:	6710054a 	ldrvs	r0, [r0, -sl, asr #10]
    1ac8:	05a00405 	streq	r0, [r0, #1029]!	; 0x405
    1acc:	01054b0b 	tsteq	r5, fp, lsl #22
    1ad0:	0f05692f 	svceq	0x0005692f
    1ad4:	4d0a0583 	cfstr32mi	mvfx0, [sl, #-524]	; 0xfffffdf4
    1ad8:	054b0c05 	strbeq	r0, [fp, #-3077]	; 0xfffff3fb
    1adc:	07054a15 	smladeq	r5, r5, sl, r4
    1ae0:	00250566 	eoreq	r0, r5, r6, ror #10
    1ae4:	4a010402 	bmi	42af4 <__bss_end__+0x327a8>
    1ae8:	02001f05 	andeq	r1, r0, #5, 30
    1aec:	054a0104 	strbeq	r0, [sl, #-260]	; 0xfffffefc
    1af0:	0a054c0f 	beq	154b34 <_stack+0xd4b34>
    1af4:	0021054a 	eoreq	r0, r1, sl, asr #10
    1af8:	4a010402 	bmi	42b08 <__bss_end__+0x327bc>
    1afc:	02001c05 	andeq	r1, r0, #1280	; 0x500
    1b00:	054a0104 	strbeq	r0, [sl, #-260]	; 0xfffffefc
    1b04:	0905680f 	stmdbeq	r5, {r0, r1, r2, r3, fp, sp, lr}
    1b08:	4c0f054a 	cfstr32mi	mvfx0, [pc], {74}	; 0x4a
    1b0c:	054a0a05 	strbeq	r0, [sl, #-2565]	; 0xfffff5fb
    1b10:	0d056811 	stceq	8, cr6, [r5, #-68]	; 0xffffffbc
    1b14:	0024054a 	eoreq	r0, r4, sl, asr #10
    1b18:	4a010402 	bmi	42b28 <__bss_end__+0x327dc>
    1b1c:	02001e05 	andeq	r1, r0, #5, 28	; 0x50
    1b20:	054a0104 	strbeq	r0, [sl, #-260]	; 0xfffffefc
    1b24:	1a054c15 	bne	154b80 <_stack+0xd4b80>
    1b28:	68190567 	ldmdavs	r9, {r0, r1, r2, r5, r6, r8, sl}
    1b2c:	054a1005 	strbeq	r1, [sl, #-5]
    1b30:	10054c22 	andne	r4, r5, r2, lsr #24
    1b34:	681e0567 	ldmdavs	lr, {r0, r1, r2, r5, r6, r8, sl}
    1b38:	054a1505 	strbeq	r1, [sl, #-1285]	; 0xfffffafb
    1b3c:	14054b22 	strne	r4, [r5], #-2850	; 0xfffff4de
    1b40:	4a210568 	bmi	8430e8 <_stack+0x7c30e8>
    1b44:	054a1005 	strbeq	r1, [sl, #-5]
    1b48:	20054b27 	andcs	r4, r5, r7, lsr #22
    1b4c:	4a1b0566 	bmi	6c30ec <_stack+0x6430ec>
    1b50:	05682005 	strbeq	r2, [r8, #-5]!
    1b54:	1b054a26 	blne	1543f4 <_stack+0xd43f4>
    1b58:	4c1a052e 	cfldr32mi	mvfx0, [sl], {46}	; 0x2e
    1b5c:	4c821005 	stcmi	0, cr1, [r2], {5}
    1b60:	11052f4b 	tstne	r5, fp, asr #30
    1b64:	691a0530 	ldmdbvs	sl, {r4, r5, r8, sl}
    1b68:	05690405 	strbeq	r0, [r9, #-1029]!	; 0xfffffbfb
    1b6c:	01054b0b 	tsteq	r5, fp, lsl #22
    1b70:	1005692f 	andne	r6, r5, pc, lsr #18
    1b74:	4c1405d7 	cfldr32mi	mvfx0, [r4], {215}	; 0xd7
    1b78:	05820805 	streq	r0, [r2, #2053]	; 0x805
    1b7c:	09054b0f 	stmdbeq	r5, {r0, r1, r2, r3, r8, r9, fp, lr}
    1b80:	4b08054d 	blmi	2030bc <_stack+0x1830bc>
    1b84:	02170568 	andseq	r0, r7, #104, 10	; 0x1a000000
    1b88:	0a051322 	beq	146818 <_stack+0xc6818>
    1b8c:	680c0582 	stmdavs	ip, {r1, r7, r8, sl}
    1b90:	22022905 	andcs	r2, r2, #81920	; 0x14000
    1b94:	67676713 			; <UNDEFINED> instruction: 0x67676713
    1b98:	05670c05 	strbeq	r0, [r7, #-3077]!	; 0xfffff3fb
    1b9c:	2f05a00e 	svccs	0x0005a00e
    1ba0:	01040200 	mrseq	r0, R12_usr
    1ba4:	002d0567 	eoreq	r0, sp, r7, ror #10
    1ba8:	ba010402 	blt	42bb8 <__bss_end__+0x3286c>
    1bac:	02001905 	andeq	r1, r0, #81920	; 0x14000
    1bb0:	054a0104 	strbeq	r0, [sl, #-260]	; 0xfffffefc
    1bb4:	04020014 	streq	r0, [r2], #-20	; 0xffffffec
    1bb8:	0f054901 	svceq	0x00054901
    1bbc:	1322024d 			; <UNDEFINED> instruction: 0x1322024d
    1bc0:	0217054b 	andseq	r0, r7, #314572800	; 0x12c00000
    1bc4:	0e051322 	cdpeq	3, 0, cr1, cr5, cr2, {1}
    1bc8:	0021054d 	eoreq	r0, r1, sp, asr #10
    1bcc:	66010402 	strvs	r0, [r1], -r2, lsl #8
    1bd0:	02001905 	andeq	r1, r0, #81920	; 0x14000
    1bd4:	054a0104 	strbeq	r0, [sl, #-260]	; 0xfffffefc
    1bd8:	0c054b0f 			; <UNDEFINED> instruction: 0x0c054b0f
    1bdc:	15220269 	strne	r0, [r2, #-617]!	; 0xfffffd97
    1be0:	692f0105 	stmdbvs	pc!, {r0, r2, r8}	; <UNPREDICTABLE>
    1be4:	05830805 	streq	r0, [r3, #2053]	; 0x805
    1be8:	1c054e06 	stcne	14, cr4, [r5], {6}
    1bec:	01040200 	mrseq	r0, R12_usr
    1bf0:	00110566 	andseq	r0, r1, r6, ror #10
    1bf4:	4a010402 	bmi	42c04 <__bss_end__+0x328b8>
    1bf8:	054c0c05 	strbeq	r0, [ip, #-3077]	; 0xfffff3fb
    1bfc:	0b056807 	bleq	15bc20 <_stack+0xdbc20>
    1c00:	660905d8 			; <UNDEFINED> instruction: 0x660905d8
    1c04:	054c1d05 	strbeq	r1, [ip, #-3333]	; 0xfffff2fb
    1c08:	0f058213 	svceq	0x00058213
    1c0c:	3016054d 	andscc	r0, r6, sp, asr #10
    1c10:	671e054b 	ldrvs	r0, [lr, -fp, asr #10]
    1c14:	054a1205 	strbeq	r1, [sl, #-517]	; 0xfffffdfb
    1c18:	2d05620f 	sfmcs	f6, 4, [r5, #-60]	; 0xffffffc4
    1c1c:	01040200 	mrseq	r0, R12_usr
    1c20:	00210566 	eoreq	r0, r1, r6, ror #10
    1c24:	4a010402 	bmi	42c34 <__bss_end__+0x328e8>
    1c28:	056d1805 	strbeq	r1, [sp, #-2053]!	; 0xfffff7fb
    1c2c:	1a05660d 	bne	15b468 <_stack+0xdb468>
    1c30:	a0220567 	eorge	r0, r2, r7, ror #10
    1c34:	05681a05 	strbeq	r1, [r8, #-2565]!	; 0xfffff5fb
    1c38:	0d05671e 	stceq	7, cr6, [r5, #-120]	; 0xffffff88
    1c3c:	00180568 	andseq	r0, r8, r8, ror #10
    1c40:	66010402 	strvs	r0, [r1], -r2, lsl #8
    1c44:	05671e05 	strbeq	r1, [r7, #-3589]!	; 0xfffff1fb
    1c48:	0583db17 	streq	sp, [r3, #2839]	; 0xb17
    1c4c:	17056623 	strne	r6, [r5, -r3, lsr #12]
    1c50:	661f054b 	ldrvs	r0, [pc], -fp, asr #10
    1c54:	054c1e05 	strbeq	r1, [ip, #-3589]	; 0xfffff1fb
    1c58:	0b056707 	bleq	15b87c <_stack+0xdb87c>
    1c5c:	01054dd8 	ldrdeq	r4, [r5, -r8]
    1c60:	0805852f 	stmdaeq	r5, {r0, r1, r2, r3, r5, r8, sl, pc}
    1c64:	4d040583 	cfstr32mi	mvfx0, [r4, #-524]	; 0xfffffdf4
    1c68:	22020805 	andcs	r0, r2, #327680	; 0x50000
    1c6c:	66060513 			; <UNDEFINED> instruction: 0x66060513
    1c70:	02001605 	andeq	r1, r0, #5242880	; 0x500000
    1c74:	054a0104 	strbeq	r0, [sl, #-260]	; 0xfffffefc
    1c78:	11056908 	tstne	r5, r8, lsl #18
    1c7c:	0d054bd7 	vstreq	d4, [r5, #-860]	; 0xfffffca4
    1c80:	30140583 	andscc	r0, r4, r3, lsl #11
    1c84:	630d054b 	movwvs	r0, #54603	; 0xd54b
    1c88:	02001905 	andeq	r1, r0, #81920	; 0x14000
    1c8c:	05660104 	strbeq	r0, [r6, #-260]!	; 0xfffffefc
    1c90:	1905890a 	stmdbne	r5, {r1, r3, r8, fp, pc}
    1c94:	4a0e0584 	bmi	3832ac <_stack+0x3032ac>
    1c98:	02003205 	andeq	r3, r0, #1342177280	; 0x50000000
    1c9c:	054a0104 	strbeq	r0, [sl, #-260]	; 0xfffffefc
    1ca0:	04020026 	streq	r0, [r2], #-38	; 0xffffffda
    1ca4:	17054a01 	strne	r4, [r5, -r1, lsl #20]
    1ca8:	4a2b054b 	bmi	ac31dc <_stack+0xa431dc>
    1cac:	052e3605 	streq	r3, [lr, #-1541]!	; 0xfffff9fb
    1cb0:	2b054a17 	blcs	154514 <_stack+0xd4514>
    1cb4:	4b0e054a 	blmi	3831e4 <_stack+0x3031e4>
    1cb8:	05672d05 	strbeq	r2, [r7, #-3333]!	; 0xfffff2fb
    1cbc:	25054a23 	strcs	r4, [r5, #-2595]	; 0xfffff5dd
    1cc0:	4a1b0568 	bmi	6c3268 <_stack+0x643268>
    1cc4:	05682205 	strbeq	r2, [r8, #-517]!	; 0xfffffdfb
    1cc8:	0f05670b 	svceq	0x0005670b
    1ccc:	4d0805d7 	cfstr32mi	mvfx0, [r8, #-860]	; 0xfffffca4
    1cd0:	05d80405 	ldrbeq	r0, [r8, #1029]	; 0x405
    1cd4:	1422020b 	strtne	r0, [r2], #-523	; 0xfffffdf5
    1cd8:	692f0105 	stmdbvs	pc!, {r0, r2, r8}	; <UNPREDICTABLE>
    1cdc:	05830805 	streq	r0, [r3, #2053]	; 0x805
    1ce0:	06054b1a 			; <UNDEFINED> instruction: 0x06054b1a
    1ce4:	6807054c 	stmdavs	r7, {r2, r3, r6, r8, sl}
    1ce8:	22020b05 	andcs	r0, r2, #5120	; 0x1400
    1cec:	66090513 			; <UNDEFINED> instruction: 0x66090513
    1cf0:	054d0b05 	strbeq	r0, [sp, #-2821]	; 0xfffff4fb
    1cf4:	054bd714 	strbeq	sp, [fp, #-1812]	; 0xfffff8ec
    1cf8:	17058310 	smladne	r5, r0, r3, r8
    1cfc:	10054b30 	andne	r4, r5, r0, lsr fp
    1d00:	001c0563 	andseq	r0, ip, r3, ror #10
    1d04:	66010402 	strvs	r0, [r1], -r2, lsl #8
    1d08:	05890d05 	streq	r0, [r9, #3333]	; 0xd05
    1d0c:	1105841c 	tstne	r5, ip, lsl r4
    1d10:	0035054a 	eorseq	r0, r5, sl, asr #10
    1d14:	4a010402 	bmi	42d24 <__bss_end__+0x329d8>
    1d18:	02002905 	andeq	r2, r0, #81920	; 0x14000
    1d1c:	054a0104 	strbeq	r0, [sl, #-260]	; 0xfffffefc
    1d20:	2e054b1a 	vmovcs.32	d5[0], r4
    1d24:	2e39054a 	cdpcs	5, 3, cr0, cr9, cr10, {2}
    1d28:	054a1a05 	strbeq	r1, [sl, #-2565]	; 0xfffff5fb
    1d2c:	11054a2e 	tstne	r5, lr, lsr #20
    1d30:	6730054b 	ldrvs	r0, [r0, -fp, asr #10]!
    1d34:	054a2605 	strbeq	r2, [sl, #-1541]	; 0xfffff9fb
    1d38:	1e056828 	cdpne	8, 0, cr6, cr5, cr8, {1}
    1d3c:	6825054a 	stmdavs	r5!, {r1, r3, r6, r8, sl}
    1d40:	05680b05 	strbeq	r0, [r8, #-2821]!	; 0xfffff4fb
    1d44:	1305da07 	movwne	sp, #23047	; 0x5a07
    1d48:	4a0905d7 	bmi	2434ac <_stack+0x1c34ac>
    1d4c:	054b0a05 	strbeq	r0, [fp, #-2565]	; 0xfffff5fb
    1d50:	1605d909 	strne	sp, [r5], -r9, lsl #18
    1d54:	4a220583 	bmi	883368 <_stack+0x803368>
    1d58:	052e0c05 	streq	r0, [lr, #-3077]!	; 0xfffff3fb
    1d5c:	07054b0e 	streq	r4, [r5, -lr, lsl #22]
    1d60:	020b054c 	andeq	r0, fp, #76, 10	; 0x13000000
    1d64:	054d1422 	strbeq	r1, [sp, #-1058]	; 0xfffffbde
    1d68:	05692f01 	strbeq	r2, [r9, #-3841]!	; 0xfffff0ff
    1d6c:	06058310 			; <UNDEFINED> instruction: 0x06058310
    1d70:	680d054e 	stmdavs	sp, {r1, r2, r3, r6, r8, sl}
    1d74:	054c0f05 	strbeq	r0, [ip, #-3845]	; 0xfffff0fb
    1d78:	0b054a1d 	bleq	1545f4 <_stack+0xd45f4>
    1d7c:	680c0567 	stmdavs	ip, {r0, r1, r2, r5, r6, r8, sl}
    1d80:	054a0705 	strbeq	r0, [sl, #-1797]	; 0xfffff8fb
    1d84:	0a05680e 	beq	15bdc4 <_stack+0xdbdc4>
    1d88:	4d12054a 	cfldr32mi	mvfx0, [r2, #-296]	; 0xfffffed8
    1d8c:	05832105 	streq	r2, [r3, #261]	; 0x105
    1d90:	0d056811 	stceq	8, cr6, [r5, #-68]	; 0xffffffbc
    1d94:	4b24054a 	blmi	9032c4 <_stack+0x8832c4>
    1d98:	05661d05 	strbeq	r1, [r6, #-3333]!	; 0xfffff2fb
    1d9c:	10054a18 	andne	r4, r5, r8, lsl sl
    1da0:	4a260569 	bmi	98334c <_stack+0x90334c>
    1da4:	054b1705 	strbeq	r1, [fp, #-1797]	; 0xfffff8fb
    1da8:	1c056911 			; <UNDEFINED> instruction: 0x1c056911
    1dac:	4b110566 	blmi	44334c <_stack+0x3c334c>
    1db0:	05661c05 	strbeq	r1, [r6, #-3077]!	; 0xfffff3fb
    1db4:	10054c0a 	andne	r4, r5, sl, lsl #24
    1db8:	2f1d054b 	svccs	0x001d054b
    1dbc:	4b821305 	blmi	fe0869d8 <_stack+0xfe0069d8>
    1dc0:	052c1805 	streq	r1, [ip, #-2053]!	; 0xfffff7fb
    1dc4:	0a058210 	beq	16260c <_stack+0xe260c>
    1dc8:	2f0e054d 	svccs	0x000e054d
    1dcc:	054c0705 	strbeq	r0, [ip, #-1797]	; 0xfffff8fb
    1dd0:	01054d0b 	tsteq	r5, fp, lsl #26
    1dd4:	0d05692f 	vstreq.16	s12, [r5, #-94]	; 0xffffffa2	; <UNPREDICTABLE>
    1dd8:	4c04059f 	cfstr32mi	mvfx0, [r4], {159}	; 0x9f
    1ddc:	22020805 	andcs	r0, r2, #327680	; 0x50000
    1de0:	66060513 			; <UNDEFINED> instruction: 0x66060513
    1de4:	02001605 	andeq	r1, r0, #5242880	; 0x500000
    1de8:	054a0104 	strbeq	r0, [sl, #-260]	; 0xfffffefc
    1dec:	0c056a0e 			; <UNDEFINED> instruction: 0x0c056a0e
    1df0:	670b0568 	strvs	r0, [fp, -r8, ror #10]
    1df4:	02001705 	andeq	r1, r0, #1310720	; 0x140000
    1df8:	05660104 	strbeq	r0, [r6, #-260]!	; 0xfffffefc
    1dfc:	04020011 	streq	r0, [r2], #-17	; 0xffffffef
    1e00:	12058201 	andne	r8, r5, #268435456	; 0x10000000
    1e04:	8217054d 	andshi	r0, r7, #322961408	; 0x13400000
    1e08:	052e0d05 	streq	r0, [lr, #-3333]!	; 0xfffff2fb
    1e0c:	054b4c0f 	strbeq	r4, [fp, #-3087]	; 0xfffff3f1
    1e10:	1105470d 	tstne	r5, sp, lsl #14
    1e14:	68170535 	ldmdavs	r7, {r0, r2, r4, r5, r8, sl}
    1e18:	02301605 	eorseq	r1, r0, #5242880	; 0x500000
    1e1c:	05831322 	streq	r1, [r3, #802]	; 0x322
    1e20:	05fc081c 	ldrbeq	r0, [ip, #2076]!	; 0x81c
    1e24:	17058221 	strne	r8, [r5, -r1, lsr #4]
    1e28:	5012052e 	andspl	r0, r2, lr, lsr #10
    1e2c:	030d054b 	movweq	r0, #54603	; 0xd54b
    1e30:	16054a70 			; <UNDEFINED> instruction: 0x16054a70
    1e34:	052e1403 	streq	r1, [lr, #-1027]!	; 0xfffffbfd
    1e38:	4a6c030d 	bmi	1b02a74 <_stack+0x1a82a74>
    1e3c:	19030b05 	stmdbne	r3, {r0, r2, r8, r9, fp}
    1e40:	4c04052e 	cfstr32mi	mvfx0, [r4], {46}	; 0x2e
    1e44:	22020b05 	andcs	r0, r2, #5120	; 0x1400
    1e48:	2f010514 	svccs	0x00010514
    1e4c:	05661903 	strbeq	r1, [r6, #-2307]!	; 0xfffff6fd
    1e50:	0e05a21f 	mcreq	2, 0, sl, cr5, cr15, {0}
    1e54:	682405bb 	stmdavs	r4!, {r0, r1, r3, r4, r5, r7, r8, sl}
    1e58:	05661e05 	strbeq	r1, [r6, #-3589]!	; 0xfffff1fb
    1e5c:	1c054a13 			; <UNDEFINED> instruction: 0x1c054a13
    1e60:	6705054b 	strvs	r0, [r5, -fp, asr #10]
    1e64:	02002705 	andeq	r2, r0, #1310720	; 0x140000
    1e68:	05660104 	strbeq	r0, [r6, #-260]!	; 0xfffffefc
    1e6c:	1105bb1e 	tstne	r5, lr, lsl fp
    1e70:	2e030567 	cfsh32cs	mvfx0, mvfx3, #55
    1e74:	05a00a05 	streq	r0, [r0, #2565]!	; 0xa05
    1e78:	05692f01 	strbeq	r2, [r9, #-3841]!	; 0xfffff0ff
    1e7c:	1805860e 	stmdane	r5, {r1, r2, r3, r9, sl, pc}
    1e80:	2e070567 	cfsh32cs	mvfx0, mvfx7, #55
    1e84:	05ba0505 	ldreq	r0, [sl, #1285]!	; 0x505
    1e88:	09054b0d 	stmdbeq	r5, {r0, r2, r3, r8, r9, fp, lr}
    1e8c:	4b11054c 	blmi	4433c4 <_stack+0x3c33c4>
    1e90:	054a1f05 	strbeq	r1, [sl, #-3845]	; 0xfffff0fb
    1e94:	13052e05 	movwne	r2, #24069	; 0x5e05
    1e98:	2e05054c 	cfsh32cs	mvfx0, mvfx5, #44
    1e9c:	4b090583 	blmi	2434b0 <_stack+0x1c34b0>
    1ea0:	056a1d05 	strbeq	r1, [sl, #-3333]!	; 0xfffff2fb
    1ea4:	0305bb09 	movweq	fp, #23305	; 0x5b09
    1ea8:	4c0a054c 	cfstr32mi	mvfx0, [sl], {76}	; 0x4c
    1eac:	692f0105 	stmdbvs	pc!, {r0, r2, r8}	; <UNPREDICTABLE>
    1eb0:	05a30e05 	streq	r0, [r3, #3589]!	; 0xe05
    1eb4:	07056718 	smladeq	r5, r8, r7, r6
    1eb8:	ba05052e 	blt	143378 <_stack+0xc3378>
    1ebc:	054b0d05 	strbeq	r0, [fp, #-3333]	; 0xfffff2fb
    1ec0:	1f054c11 	svcne	0x00054c11
    1ec4:	2e05054a 	cfsh32cs	mvfx0, mvfx5, #42
    1ec8:	054b0d05 	strbeq	r0, [fp, #-3333]	; 0xfffff2fb
    1ecc:	11054c09 	tstne	r5, r9, lsl #24
    1ed0:	4a1f054c 	bmi	7c3408 <_stack+0x743408>
    1ed4:	052e0505 	streq	r0, [lr, #-1285]!	; 0xfffffafb
    1ed8:	05bb4c1d 	ldreq	r4, [fp, #3101]!	; 0xc1d
    1edc:	1605bb09 	strne	fp, [r5], -r9, lsl #22
    1ee0:	4a240568 	bmi	903488 <_stack+0x883488>
    1ee4:	052e0a05 	streq	r0, [lr, #-2565]!	; 0xfffff5fb
    1ee8:	07054c13 	smladeq	r5, r3, ip, r4
    1eec:	4b19054a 	blmi	64341c <_stack+0x5c341c>
    1ef0:	054a2705 	strbeq	r2, [sl, #-1797]	; 0xfffff8fb
    1ef4:	19052e09 	stmdbne	r5, {r0, r3, r9, sl, fp, sp}
    1ef8:	4a1f054b 	bmi	7c342c <_stack+0x74342c>
    1efc:	052e3405 	streq	r3, [lr, #-1029]!	; 0xfffffbfb
    1f00:	0d05820b 	sfmeq	f0, 1, [r5, #-44]	; 0xffffffd4
    1f04:	690b054c 	stmdbvs	fp, {r2, r3, r6, r8, sl}
    1f08:	05681605 	strbeq	r1, [r8, #-1541]!	; 0xfffff9fb
    1f0c:	0a054a24 	beq	1547a4 <_stack+0xd47a4>
    1f10:	4b09052e 	blmi	2433d0 <_stack+0x1c33d0>
    1f14:	4c050568 	cfstr32mi	mvfx0, [r5], {104}	; 0x68
    1f18:	05680f05 	strbeq	r0, [r8, #-3845]!	; 0xfffff0fb
    1f1c:	0a054a1f 	beq	1547a0 <_stack+0xd47a0>
    1f20:	00130584 	andseq	r0, r3, r4, lsl #11
    1f24:	66010402 	strvs	r0, [r1], -r2, lsl #8
    1f28:	05680d05 	strbeq	r0, [r8, #-3333]!	; 0xfffff2fb
    1f2c:	1305831c 	movwne	r8, #21276	; 0x531c
    1f30:	4a080568 	bmi	2034d8 <_stack+0x1834d8>
    1f34:	054c2b05 	strbeq	r2, [ip, #-2821]	; 0xfffff4fb
    1f38:	18056624 	stmdane	r5, {r2, r5, r9, sl, sp, lr}
    1f3c:	6a15054a 	bvs	54346c <_stack+0x4c346c>
    1f40:	054a2305 	strbeq	r2, [sl, #-773]	; 0xfffffcfb
    1f44:	15052e09 	strne	r2, [r5, #-3593]	; 0xfffff1f7
    1f48:	4a2b054c 	bmi	ac3480 <_stack+0xa43480>
    1f4c:	054b1c05 	strbeq	r1, [fp, #-3077]	; 0xfffff3fb
    1f50:	3205851f 	andcc	r8, r5, #130023424	; 0x7c00000
    1f54:	4a09054a 	bmi	243484 <_stack+0x1c3484>
    1f58:	05690e05 	strbeq	r0, [r9, #-3589]!	; 0xfffff1fb
    1f5c:	0e056619 	mcreq	6, 0, r6, cr5, cr9, {0}
    1f60:	6619054b 	ldrvs	r0, [r9], -fp, asr #10
    1f64:	054c0705 	strbeq	r0, [ip, #-1797]	; 0xfffff8fb
    1f68:	16054b0d 	strne	r4, [r5], -sp, lsl #22
    1f6c:	820c052f 	andhi	r0, ip, #197132288	; 0xbc00000
    1f70:	054b0b05 	strbeq	r0, [fp, #-2821]	; 0xfffff4fb
    1f74:	0d052c15 	stceq	12, cr2, [r5, #-84]	; 0xffffffac
    1f78:	4f030582 	svcmi	0x00030582
    1f7c:	054c0a05 	strbeq	r0, [ip, #-2565]	; 0xfffff5fb
    1f80:	05692f01 	strbeq	r2, [r9, #-3841]!	; 0xfffff0ff
    1f84:	1805a30e 	stmdane	r5, {r1, r2, r3, r8, r9, sp, pc}
    1f88:	2e070567 	cfsh32cs	mvfx0, mvfx7, #55
    1f8c:	05ba0505 	ldreq	r0, [sl, #1285]!	; 0x505
    1f90:	11054b0d 	tstne	r5, sp, lsl #22
    1f94:	4a1f054c 	bmi	7c34cc <_stack+0x7434cc>
    1f98:	052e0505 	streq	r0, [lr, #-1285]!	; 0xfffffafb
    1f9c:	09054b0d 	stmdbeq	r5, {r0, r2, r3, r8, r9, fp, lr}
    1fa0:	4c11054c 	cfldr32mi	mvfx0, [r1], {76}	; 0x4c
    1fa4:	054a1f05 	strbeq	r1, [sl, #-3845]	; 0xfffff0fb
    1fa8:	1d052e05 	stcne	14, cr2, [r5, #-20]	; 0xffffffec
    1fac:	0905bb4c 	stmdbeq	r5, {r2, r3, r6, r8, r9, fp, ip, sp, pc}
    1fb0:	681605bb 	ldmdavs	r6, {r0, r1, r3, r4, r5, r7, r8, sl}
    1fb4:	054a2405 	strbeq	r2, [sl, #-1029]	; 0xfffffbfb
    1fb8:	16052e0a 	strne	r2, [r5], -sl, lsl #28
    1fbc:	01040200 	mrseq	r0, R12_usr
    1fc0:	0024054b 	eoreq	r0, r4, fp, asr #10
    1fc4:	4a010402 	bmi	42fd4 <__bss_end__+0x32c88>
    1fc8:	02003005 	andeq	r3, r0, #5
    1fcc:	052d0104 	streq	r0, [sp, #-260]!	; 0xfffffefc
    1fd0:	05684d09 	strbeq	r4, [r8, #-3337]!	; 0xfffff2f7
    1fd4:	0e054c05 	cdpeq	12, 0, cr4, cr5, cr5, {0}
    1fd8:	01040200 	mrseq	r0, R12_usr
    1fdc:	680d0566 	stmdavs	sp, {r1, r2, r5, r6, r8, sl}
    1fe0:	05831c05 	streq	r1, [r3, #3077]	; 0xc05
    1fe4:	08056813 	stmdaeq	r5, {r0, r1, r4, fp, sp, lr}
    1fe8:	4c2b054a 	cfstr32mi	mvfx0, [fp], #-296	; 0xfffffed8
    1fec:	05662405 	strbeq	r2, [r6, #-1029]!	; 0xfffffbfb
    1ff0:	15054a18 	strne	r4, [r5, #-2584]	; 0xfffff5e8
    1ff4:	4a23056a 	bmi	8c35a4 <_stack+0x8435a4>
    1ff8:	052e0905 	streq	r0, [lr, #-2309]!	; 0xfffff6fb
    1ffc:	2b054c15 	blcs	155058 <_stack+0xd5058>
    2000:	4b1c054a 	blmi	703530 <_stack+0x683530>
    2004:	05851f05 	streq	r1, [r5, #3845]	; 0xf05
    2008:	09054a32 	stmdbeq	r5, {r1, r4, r5, r9, fp, lr}
    200c:	690e054a 	stmdbvs	lr, {r1, r3, r6, r8, sl}
    2010:	05661905 	strbeq	r1, [r6, #-2309]!	; 0xfffff6fb
    2014:	19054b0e 	stmdbne	r5, {r1, r2, r3, r8, r9, fp, lr}
    2018:	4c070566 	cfstr32mi	mvfx0, [r7], {102}	; 0x66
    201c:	054b0d05 	strbeq	r0, [fp, #-3333]	; 0xfffff2fb
    2020:	0c052f16 	stceq	15, cr2, [r5], {22}
    2024:	4b0b0582 	blmi	2c3634 <_stack+0x243634>
    2028:	052c1505 	streq	r1, [ip, #-1285]!	; 0xfffffafb
    202c:	0305820d 	movweq	r8, #21005	; 0x520d
    2030:	4c0a054f 	cfstr32mi	mvfx0, [sl], {79}	; 0x4f
    2034:	6a2f0105 	bvs	bc2450 <_stack+0xb42450>
    2038:	05870e05 	streq	r0, [r7, #3589]	; 0xe05
    203c:	07056718 	smladeq	r5, r8, r7, r6
    2040:	ba05052e 	blt	143500 <_stack+0xc3500>
    2044:	054b0d05 	strbeq	r0, [fp, #-3333]	; 0xfffff2fb
    2048:	11054c09 	tstne	r5, r9, lsl #24
    204c:	4a1f054c 	bmi	7c3584 <_stack+0x743584>
    2050:	052e0505 	streq	r0, [lr, #-1285]!	; 0xfffffafb
    2054:	09054c15 	stmdbeq	r5, {r0, r2, r4, sl, fp, lr}
    2058:	2e07054a 	cfsh32cs	mvfx0, mvfx7, #42
    205c:	054a1505 	strbeq	r1, [sl, #-1285]	; 0xfffffafb
    2060:	0a054a07 	beq	154884 <_stack+0xd4884>
    2064:	691f054b 	ldmdbvs	pc, {r0, r1, r3, r6, r8, sl}	; <UNPREDICTABLE>
    2068:	05bb1505 	ldreq	r1, [fp, #1285]!	; 0x505
    206c:	0d054a09 	vstreq	s8, [r5, #-36]	; 0xffffffdc
    2070:	6921054b 	stmdbvs	r1!, {r0, r1, r3, r6, r8, sl}
    2074:	05bb0d05 	ldreq	r0, [fp, #3333]!	; 0xd05
    2078:	24056a16 	strcs	r6, [r5], #-2582	; 0xfffff5ea
    207c:	2e0a054a 	cfsh32cs	mvfx0, mvfx10, #42
    2080:	054c1d05 	strbeq	r1, [ip, #-3333]	; 0xfffff2fb
    2084:	0705bb13 	smladeq	r5, r3, fp, fp
    2088:	4b0b054a 	blmi	2c35b8 <_stack+0x2435b8>
    208c:	05691f05 	strbeq	r1, [r9, #-3845]!	; 0xfffff0fb
    2090:	0905bb0b 	stmdbeq	r5, {r0, r1, r3, r8, r9, fp, ip, sp, pc}
    2094:	4c05056a 	cfstr32mi	mvfx0, [r5], {106}	; 0x6a
    2098:	056a0f05 	strbeq	r0, [sl, #-3845]!	; 0xfffff0fb
    209c:	0a056813 	beq	15c0f0 <_stack+0xdc0f0>
    20a0:	4c1b054a 	cfldr32mi	mvfx0, [fp], {74}	; 0x4a
    20a4:	05670905 	strbeq	r0, [r7, #-2309]!	; 0xfffff6fb
    20a8:	0f056818 	svceq	0x00056818
    20ac:	4b1b054a 	blmi	6c35dc <_stack+0x6435dc>
    20b0:	05681505 	strbeq	r1, [r8, #-1285]!	; 0xfffffafb
    20b4:	09054a27 	stmdbeq	r5, {r0, r1, r2, r5, r9, fp, lr}
    20b8:	4b2d054a 	blmi	b435e8 <_stack+0xac35e8>
    20bc:	05662605 	strbeq	r2, [r6, #-1541]!	; 0xfffff9fb
    20c0:	26054a1a 			; <UNDEFINED> instruction: 0x26054a1a
    20c4:	4a2c0568 	bmi	b0366c <_stack+0xa8366c>
    20c8:	052e1a05 	streq	r1, [lr, #-2565]!	; 0xfffff5fb
    20cc:	0c054c15 	stceq	12, cr4, [r5], {21}
    20d0:	4c17054a 	cfldr32mi	mvfx0, [r7], {74}	; 0x4a
    20d4:	054a2705 	strbeq	r2, [sl, #-1797]	; 0xfffff8fb
    20d8:	05d96725 	ldrbeq	r6, [r9, #1829]	; 0x725
    20dc:	0505bb15 	streq	fp, [r5, #-2837]	; 0xfffff4eb
    20e0:	4c12054a 	cfldr32mi	mvfx0, [r2], {74}	; 0x4a
    20e4:	05820805 	streq	r0, [r2, #2053]	; 0x805
    20e8:	2f4b4c07 	svccs	0x004b4c07
    20ec:	05320305 	ldreq	r0, [r2, #-773]!	; 0xfffffcfb
    20f0:	01054c0a 	tsteq	r5, sl, lsl #24
    20f4:	0322052f 			; <UNDEFINED> instruction: 0x0322052f
    20f8:	03056612 	movweq	r6, #22034	; 0x5612
    20fc:	00050583 	andeq	r0, r5, r3, lsl #11
    2100:	68010402 	stmdavs	r1, {r1, sl}
    2104:	15030105 	strne	r0, [r3, #-261]	; 0xfffffefb
    2108:	bf050582 	svclt	0x00050582
    210c:	02058330 	andeq	r8, r5, #48, 6	; 0xc0000000
    2110:	69050568 	stmdbvs	r5, {r3, r5, r6, r8, sl}
    2114:	054a2f05 	strbeq	r2, [sl, #-3845]	; 0xfffff0fb
    2118:	1d054f05 	stcne	15, cr4, [r5, #-20]	; 0xffffffec
    211c:	4e05054a 	cfsh32mi	mvfx0, mvfx5, #42
    2120:	054a2005 	strbeq	r2, [sl, #-5]
    2124:	4a130305 	bmi	4c2d40 <_stack+0x442d40>
    2128:	08316830 	ldmdaeq	r1!, {r4, r5, fp, sp, lr}
    212c:	053f083f 	ldreq	r0, [pc, #-2111]!	; 18f5 <_start-0x670b>
    2130:	06022f01 	streq	r2, [r2], -r1, lsl #30
    2134:	c4010100 	strgt	r0, [r1], #-256	; 0xffffff00
    2138:	03000000 	movweq	r0, #0
    213c:	0000a100 	andeq	sl, r0, r0, lsl #2
    2140:	fb010200 	blx	4294a <__bss_end__+0x325fe>
    2144:	01000d0e 	tsteq	r0, lr, lsl #26
    2148:	00010101 	andeq	r0, r1, r1, lsl #2
    214c:	00010000 	andeq	r0, r1, r0
    2150:	682f0100 	stmdavs	pc!, {r8}	; <UNPREDICTABLE>
    2154:	2f656d6f 	svccs	0x00656d6f
    2158:	6b727472 	blvs	1c9f328 <_stack+0x1c1f328>
    215c:	7365442f 	cmnvc	r5, #788529152	; 0x2f000000
    2160:	706f746b 	rsbvc	r7, pc, fp, ror #8
    2164:	736f6c2f 	cmnvc	pc, #12032	; 0x2f00
    2168:	6b5f696d 	blvs	17dc724 <_stack+0x175c724>
    216c:	6e656d6f 	cdpvs	13, 6, cr6, cr5, cr15, {3}
    2170:	69726174 	ldmdbvs	r2!, {r2, r4, r5, r6, r8, sp, lr}^
    2174:	2f6f6173 	svccs	0x006f6173
    2178:	627a6576 	rsbsvs	r6, sl, #494927872	; 0x1d800000
    217c:	2f383061 	svccs	0x00383061
    2180:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
    2184:	2f006c65 	svccs	0x00006c65
    2188:	2f727375 	svccs	0x00727375
    218c:	2f62696c 	svccs	0x0062696c
    2190:	2f636367 	svccs	0x00636367
    2194:	2d6d7261 	sfmcs	f7, 2, [sp, #-388]!	; 0xfffffe7c
    2198:	656e6f6e 	strbvs	r6, [lr, #-3950]!	; 0xfffff092
    219c:	6261652d 	rsbvs	r6, r1, #188743680	; 0xb400000
    21a0:	2e392f69 	cdpcs	15, 3, cr2, cr9, cr9, {3}
    21a4:	2f312e32 	svccs	0x00312e32
    21a8:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
    21ac:	00656475 	rsbeq	r6, r5, r5, ror r4
    21b0:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
    21b4:	6d72612d 	ldfvse	f6, [r2, #-180]!	; 0xffffff4c
    21b8:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
    21bc:	00632e72 	rsbeq	r2, r3, r2, ror lr
    21c0:	72000001 	andvc	r0, r0, #1
    21c4:	612d6970 			; <UNDEFINED> instruction: 0x612d6970
    21c8:	69746d72 	ldmdbvs	r4!, {r1, r4, r5, r6, r8, sl, fp, sp, lr}^
    21cc:	2e72656d 	cdpcs	5, 7, cr6, cr2, cr13, {3}
    21d0:	00010068 	andeq	r0, r1, r8, rrx
    21d4:	64747300 	ldrbtvs	r7, [r4], #-768	; 0xfffffd00
    21d8:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
    21dc:	00020068 	andeq	r0, r2, r8, rrx
    21e0:	27050000 	strcs	r0, [r5, -r0]
    21e4:	fc020500 	stc2	5, cr0, [r2], {-0}
    21e8:	030000ec 	movweq	r0, #236	; 0xec
    21ec:	0c050111 	stfeqs	f0, [r5], {17}
    21f0:	6701054b 	strvs	r0, [r1, -fp, asr #10]
    21f4:	05841c05 	streq	r1, [r4, #3077]	; 0xc05
    21f8:	08024c01 	stmdaeq	r2, {r0, sl, fp, lr}
    21fc:	11010100 	mrsne	r0, (UNDEF: 17)
    2200:	03000002 	movweq	r0, #2
    2204:	0000a500 	andeq	sl, r0, r0, lsl #10
    2208:	fb010200 	blx	42a12 <__bss_end__+0x326c6>
    220c:	01000d0e 	tsteq	r0, lr, lsl #26
    2210:	00010101 	andeq	r0, r1, r1, lsl #2
    2214:	00010000 	andeq	r0, r1, r0
    2218:	682f0100 	stmdavs	pc!, {r8}	; <UNPREDICTABLE>
    221c:	2f656d6f 	svccs	0x00656d6f
    2220:	6b727472 	blvs	1c9f3f0 <_stack+0x1c1f3f0>
    2224:	7365442f 	cmnvc	r5, #788529152	; 0x2f000000
    2228:	706f746b 	rsbvc	r7, pc, fp, ror #8
    222c:	736f6c2f 	cmnvc	pc, #12032	; 0x2f00
    2230:	6b5f696d 	blvs	17dc7ec <_stack+0x175c7ec>
    2234:	6e656d6f 	cdpvs	13, 6, cr6, cr5, cr15, {3}
    2238:	69726174 	ldmdbvs	r2!, {r2, r4, r5, r6, r8, sp, lr}^
    223c:	2f6f6173 	svccs	0x006f6173
    2240:	627a6576 	rsbsvs	r6, sl, #494927872	; 0x1d800000
    2244:	2f383061 	svccs	0x00383061
    2248:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
    224c:	2f006c65 	svccs	0x00006c65
    2250:	2f727375 	svccs	0x00727375
    2254:	2f62696c 	svccs	0x0062696c
    2258:	2f636367 	svccs	0x00636367
    225c:	2d6d7261 	sfmcs	f7, 2, [sp, #-388]!	; 0xfffffe7c
    2260:	656e6f6e 	strbvs	r6, [lr, #-3950]!	; 0xfffff092
    2264:	6261652d 	rsbvs	r6, r1, #188743680	; 0xb400000
    2268:	2e392f69 	cdpcs	15, 3, cr2, cr9, cr9, {3}
    226c:	2f312e32 	svccs	0x00312e32
    2270:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
    2274:	00656475 	rsbeq	r6, r5, r5, ror r4
    2278:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
    227c:	7875612d 	ldmdavc	r5!, {r0, r2, r3, r5, r8, sp, lr}^
    2280:	0100632e 	tsteq	r0, lr, lsr #6
    2284:	70720000 	rsbsvc	r0, r2, r0
    2288:	75612d69 	strbvc	r2, [r1, #-3433]!	; 0xfffff297
    228c:	00682e78 	rsbeq	r2, r8, r8, ror lr
    2290:	73000001 	movwvc	r0, #1
    2294:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
    2298:	00682e74 	rsbeq	r2, r8, r4, ror lr
    229c:	72000002 	andvc	r0, r0, #2
    22a0:	672d6970 			; <UNDEFINED> instruction: 0x672d6970
    22a4:	2e6f6970 			; <UNDEFINED> instruction: 0x2e6f6970
    22a8:	00010068 	andeq	r0, r1, r8, rrx
    22ac:	01050000 	mrseq	r0, (UNDEF: 5)
    22b0:	38020500 	stmdacc	r2, {r8, sl}
    22b4:	030000ed 	movweq	r0, #237	; 0xed
    22b8:	0c050113 	stfeqs	f0, [r5], {19}
    22bc:	6701054b 	strvs	r0, [r1, -fp, asr #10]
    22c0:	05820a03 	streq	r0, [r2, #2563]	; 0xa03
    22c4:	9e09030e 	cdpls	3, 0, cr0, cr9, cr14, {0}
    22c8:	05661805 	strbeq	r1, [r6, #-2053]!	; 0xfffff7fb
    22cc:	17054f0e 	strne	r4, [r5, -lr, lsl #30]
    22d0:	4d0e0566 	cfstr32mi	mvfx0, [lr, #-408]	; 0xfffffe68
    22d4:	05661805 	strbeq	r1, [r6, #-2053]!	; 0xfffff7fb
    22d8:	12054d07 	andne	r4, r5, #448	; 0x1c0
    22dc:	661b0567 	ldrvs	r0, [fp], -r7, ror #10
    22e0:	05681205 	strbeq	r1, [r8, #-517]!	; 0xfffffdfb
    22e4:	0e05661b 	mcreq	6, 0, r6, cr5, cr11, {0}
    22e8:	6617054c 	ldrvs	r0, [r7], -ip, asr #10
    22ec:	054d0e05 	strbeq	r0, [sp, #-3589]	; 0xfffff1fb
    22f0:	0e056617 	mcreq	6, 0, r6, cr5, cr7, {0}
    22f4:	6617054c 	ldrvs	r0, [r7], -ip, asr #10
    22f8:	054e2b05 	strbeq	r2, [lr, #-2821]	; 0xfffff4fb
    22fc:	36054a25 	strcc	r4, [r5], -r5, lsr #20
    2300:	2e0e0566 	cfsh32cs	mvfx0, mvfx14, #54
    2304:	05661805 	strbeq	r1, [r6, #-2053]!	; 0xfffff7fb
    2308:	68673205 	stmdavs	r7!, {r0, r2, r9, ip, sp}^
    230c:	054a1a05 	strbeq	r1, [sl, #-2565]	; 0xfffff5fb
    2310:	05054b0b 	streq	r4, [r5, #-2827]	; 0xfffff4f5
    2314:	0017054a 	andseq	r0, r7, sl, asr #10
    2318:	2e030402 	cdpcs	4, 0, cr0, cr3, cr2, {0}
    231c:	02001005 	andeq	r1, r0, #5
    2320:	05660104 	strbeq	r0, [r6, #-260]!	; 0xfffffefc
    2324:	04020005 	streq	r0, [r2], #-5
    2328:	054b2e01 	strbeq	r2, [fp, #-3585]	; 0xfffff1ff
    232c:	0b054a1e 	bleq	154bac <_stack+0xd4bac>
    2330:	4a05054b 	bmi	143864 <_stack+0xc3864>
    2334:	02001705 	andeq	r1, r0, #1310720	; 0x140000
    2338:	052e0304 	streq	r0, [lr, #-772]!	; 0xfffffcfc
    233c:	04020010 	streq	r0, [r2], #-16
    2340:	05056601 	streq	r6, [r5, #-1537]	; 0xfffff9ff
    2344:	01040200 	mrseq	r0, R12_usr
    2348:	1e054b2e 	vmlane.f64	d4, d5, d30
    234c:	4d0e054a 	cfstr32mi	mvfx0, [lr, #-296]	; 0xfffffed8
    2350:	05661805 	strbeq	r1, [r6, #-2053]!	; 0xfffff7fb
    2354:	056a4b01 	strbeq	r4, [sl, #-2817]!	; 0xfffff4ff
    2358:	1705a10a 	strne	sl, [r5, -sl, lsl #2]
    235c:	01040200 	mrseq	r0, R12_usr
    2360:	0020052e 	eoreq	r0, r0, lr, lsr #10
    2364:	82010402 	andhi	r0, r1, #33554432	; 0x2000000
    2368:	02000a05 	andeq	r0, r0, #20480	; 0x5000
    236c:	052e0104 	streq	r0, [lr, #-260]!	; 0xfffffefc
    2370:	0e054c11 	mcreq	12, 0, r4, cr5, cr1, {0}
    2374:	6616054d 	ldrvs	r0, [r6], -sp, asr #10
    2378:	054c0505 	strbeq	r0, [ip, #-1285]	; 0xfffffafb
    237c:	1b054b01 	blne	154f88 <_stack+0xd4f88>
    2380:	4b080568 	blmi	203928 <_stack+0x183928>
    2384:	02001505 	andeq	r1, r0, #20971520	; 0x1400000
    2388:	052e0104 	streq	r0, [lr, #-260]!	; 0xfffffefc
    238c:	0402001e 	streq	r0, [r2], #-30	; 0xffffffe2
    2390:	08058201 	stmdaeq	r5, {r0, r9, pc}
    2394:	01040200 	mrseq	r0, R12_usr
    2398:	4b13052e 	blmi	4c3858 <_stack+0x443858>
    239c:	059f0105 	ldreq	r0, [pc, #261]	; 24a9 <_start-0x5b57>
    23a0:	08058419 	stmdaeq	r5, {r0, r3, r4, sl, pc}
    23a4:	2f1d0583 	svccs	0x001d0583
    23a8:	05660505 	strbeq	r0, [r6, #-1285]!	; 0xfffffafb
    23ac:	08056509 	stmdaeq	r5, {r0, r3, r8, sl, sp, lr}
    23b0:	4d01054a 	cfstr32mi	mvfx0, [r1, #-296]	; 0xfffffed8
    23b4:	05841b05 	streq	r1, [r4, #2821]	; 0xb05
    23b8:	17058407 	strne	r8, [r5, -r7, lsl #8]
    23bc:	01040200 	mrseq	r0, R12_usr
    23c0:	0012054c 	andseq	r0, r2, ip, asr #10
    23c4:	f2010402 	vshl.s8	d0, d2, d1
    23c8:	02000805 	andeq	r0, r0, #327680	; 0x50000
    23cc:	052e0104 	streq	r0, [lr, #-260]!	; 0xfffffefc
    23d0:	04020012 	streq	r0, [r2], #-18	; 0xffffffee
    23d4:	0c056601 	stceq	6, cr6, [r5], {1}
    23d8:	01040200 	mrseq	r0, R12_usr
    23dc:	0007054a 	andeq	r0, r7, sl, asr #10
    23e0:	67010402 	strvs	r0, [r1, -r2, lsl #8]
    23e4:	02000305 	andeq	r0, r0, #335544320	; 0x14000000
    23e8:	05bb0104 	ldreq	r0, [fp, #260]!	; 0x104
    23ec:	04020005 	streq	r0, [r2], #-5
    23f0:	03056901 	movweq	r6, #22785	; 0x5901
    23f4:	01040200 	mrseq	r0, R12_usr
    23f8:	01052108 	tsteq	r5, r8, lsl #2
    23fc:	84180567 	ldrhi	r0, [r8], #-1383	; 0xfffffa99
    2400:	059f0305 	ldreq	r0, [pc, #773]	; 270d <_start-0x58f3>
    2404:	0d056701 	stceq	7, cr6, [r5, #-4]
    2408:	4b0a0568 	blmi	2839b0 <_stack+0x2039b0>
    240c:	024b0105 	subeq	r0, fp, #1073741825	; 0x40000001
    2410:	01010004 	tsteq	r1, r4
    2414:	000001dc 	ldrdeq	r0, [r0], -ip
    2418:	00a70003 	adceq	r0, r7, r3
    241c:	01020000 	mrseq	r0, (UNDEF: 2)
    2420:	000d0efb 	strdeq	r0, [sp], -fp
    2424:	01010101 	tsteq	r1, r1, lsl #2
    2428:	01000000 	mrseq	r0, (UNDEF: 0)
    242c:	2f010000 	svccs	0x00010000
    2430:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
    2434:	7274722f 	rsbsvc	r7, r4, #-268435454	; 0xf0000002
    2438:	65442f6b 	strbvs	r2, [r4, #-3947]	; 0xfffff095
    243c:	6f746b73 	svcvs	0x00746b73
    2440:	6f6c2f70 	svcvs	0x006c2f70
    2444:	5f696d73 	svcpl	0x00696d73
    2448:	656d6f6b 	strbvs	r6, [sp, #-3947]!	; 0xfffff095
    244c:	7261746e 	rsbvc	r7, r1, #1845493760	; 0x6e000000
    2450:	6f617369 	svcvs	0x00617369
    2454:	7a65762f 	bvc	195fd18 <_stack+0x18dfd18>
    2458:	38306162 	ldmdacc	r0!, {r1, r5, r6, r8, sp, lr}
    245c:	72656b2f 	rsbvc	r6, r5, #48128	; 0xbc00
    2460:	006c656e 	rsbeq	r6, ip, lr, ror #10
    2464:	7273752f 	rsbsvc	r7, r3, #197132288	; 0xbc00000
    2468:	62696c2f 	rsbvs	r6, r9, #12032	; 0x2f00
    246c:	6363672f 	cmnvs	r3, #12320768	; 0xbc0000
    2470:	6d72612f 	ldfvse	f6, [r2, #-188]!	; 0xffffff44
    2474:	6e6f6e2d 	cdpvs	14, 6, cr6, cr15, cr13, {1}
    2478:	61652d65 	cmnvs	r5, r5, ror #26
    247c:	392f6962 	stmdbcc	pc!, {r1, r5, r6, r8, fp, sp, lr}	; <UNPREDICTABLE>
    2480:	312e322e 			; <UNDEFINED> instruction: 0x312e322e
    2484:	636e692f 	cmnvs	lr, #770048	; 0xbc000
    2488:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
    248c:	70720000 	rsbsvc	r0, r2, r0
    2490:	70672d69 	rsbvc	r2, r7, r9, ror #26
    2494:	632e6f69 			; <UNDEFINED> instruction: 0x632e6f69
    2498:	00000100 	andeq	r0, r0, r0, lsl #2
    249c:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
    24a0:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
    24a4:	00000200 	andeq	r0, r0, r0, lsl #4
    24a8:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
    24ac:	65736162 	ldrbvs	r6, [r3, #-354]!	; 0xfffffe9e
    24b0:	0100682e 	tsteq	r0, lr, lsr #16
    24b4:	70720000 	rsbsvc	r0, r2, r0
    24b8:	70672d69 	rsbvc	r2, r7, r9, ror #26
    24bc:	682e6f69 	stmdavs	lr!, {r0, r3, r5, r6, r8, r9, sl, fp, sp, lr}
    24c0:	00000100 	andeq	r0, r0, r0, lsl #2
    24c4:	00010500 	andeq	r0, r1, r0, lsl #10
    24c8:	f0f80205 			; <UNDEFINED> instruction: 0xf0f80205
    24cc:	10030000 	andne	r0, r3, r0
    24d0:	4b0c0501 	blmi	3038dc <_stack+0x2838dc>
    24d4:	86670105 	strbthi	r0, [r7], -r5, lsl #2
    24d8:	05f32005 	ldrbeq	r2, [r3, #5]!
    24dc:	3705663e 	smladxcc	r5, lr, r6, r6
    24e0:	2e1305ba 	cfcmp64cs	r0, mvdx3, mvdx10
    24e4:	054b1e05 	strbeq	r1, [fp, #-3589]	; 0xfffff1fb
    24e8:	29054a12 	stmdbcs	r5, {r1, r4, r9, fp, lr}
    24ec:	0830052f 	ldmdaeq	r0!, {r0, r1, r2, r3, r5, r8, sl}
    24f0:	4a1d053c 	bmi	7439e8 <_stack+0x6c39e8>
    24f4:	054a1205 	strbeq	r1, [sl, #-517]	; 0xfffffdfb
    24f8:	18054a0f 	stmdane	r5, {r0, r1, r2, r3, r9, fp, lr}
    24fc:	2e240567 	cfsh64cs	mvdx0, mvdx4, #55
    2500:	3c082b05 			; <UNDEFINED> instruction: 0x3c082b05
    2504:	054a1805 	strbeq	r1, [sl, #-2053]	; 0xfffff7fb
    2508:	05674a0f 	strbeq	r4, [r7, #-2575]!	; 0xfffff5f1
    250c:	05866701 	streq	r6, [r6, #1793]	; 0x701
    2510:	01059f05 	tsteq	r5, r5, lsl #30
    2514:	05056a83 	streq	r6, [r5, #-2691]	; 0xfffff57d
    2518:	8301059f 	movwhi	r0, #5535	; 0x159f
    251c:	9f16056a 	svcls	0x0016056a
    2520:	054c1205 	strbeq	r1, [ip, #-517]	; 0xfffffdfb
    2524:	0d056605 	stceq	6, cr6, [r5, #-20]	; 0xffffffec
    2528:	05820b03 	streq	r0, [r2, #2819]	; 0xb03
    252c:	2e78031d 	mrccs	3, 3, r0, cr8, cr13, {0}
    2530:	05822605 	streq	r2, [r2, #1541]	; 0x605
    2534:	26052e2c 	strcs	r2, [r5], -ip, lsr #28
    2538:	2e140566 	cfmsc32cs	mvfx0, mvfx4, mvfx6
    253c:	054b0d05 	strbeq	r0, [fp, #-3333]	; 0xfffff2fb
    2540:	2605311d 			; <UNDEFINED> instruction: 0x2605311d
    2544:	2e360582 	cfadd32cs	mvfx0, mvfx6, mvfx2
    2548:	054a2c05 	strbeq	r2, [sl, #-3077]	; 0xfffff3fb
    254c:	14054a26 	strne	r4, [r5], #-2598	; 0xfffff5da
    2550:	4b0d052e 	blmi	343a10 <_stack+0x2c3a10>
    2554:	05340705 	ldreq	r0, [r4, #-1797]!	; 0xfffff8fb
    2558:	1405680b 	strne	r6, [r5], #-2059	; 0xfffff7f5
    255c:	4d0c0567 	cfstr32mi	mvfx0, [ip, #-412]	; 0xfffffe64
    2560:	862f0105 	strthi	r0, [pc], -r5, lsl #2
    2564:	059f0905 	ldreq	r0, [pc, #2309]	; 2e71 <_start-0x518f>
    2568:	09058207 	stmdbeq	r5, {r0, r1, r2, r9, pc}
    256c:	6901054b 	stmdbvs	r1, {r0, r1, r3, r6, r8, sl}
    2570:	052d0905 	streq	r0, [sp, #-2309]!	; 0xfffff6fb
    2574:	056a6701 	strbeq	r6, [sl, #-1793]!	; 0xfffff8ff
    2578:	05059f12 	streq	r9, [r5, #-3858]	; 0xfffff0ee
    257c:	030d0566 	movweq	r0, #54630	; 0xd566
    2580:	2305820b 	movwcs	r8, #21003	; 0x520b
    2584:	052e7803 	streq	r7, [lr, #-2051]!	; 0xfffff7fd
    2588:	1d056614 	stcne	6, cr6, [r5, #-80]	; 0xffffffb0
    258c:	2f0d0566 	svccs	0x000d0566
    2590:	05312d05 	ldreq	r2, [r1, #-3333]!	; 0xfffff2fb
    2594:	14054a23 	strne	r4, [r5], #-2595	; 0xfffff5dd
    2598:	661d054a 	ldrvs	r0, [sp], -sl, asr #10
    259c:	052f0d05 	streq	r0, [pc, #-3333]!	; 189f <_start-0x6761>
    25a0:	05863301 	streq	r3, [r6, #769]	; 0x301
    25a4:	05059f12 	streq	r9, [r5, #-3858]	; 0xfffff0ee
    25a8:	030d0566 	movweq	r0, #54630	; 0xd566
    25ac:	2305820b 	movwcs	r8, #21003	; 0x520b
    25b0:	052e7803 	streq	r7, [lr, #-2051]!	; 0xfffff7fd
    25b4:	1d056614 	stcne	6, cr6, [r5, #-80]	; 0xffffffb0
    25b8:	2f0d0566 	svccs	0x000d0566
    25bc:	05312d05 	ldreq	r2, [r1, #-3333]!	; 0xfffff2fb
    25c0:	14054a23 	strne	r4, [r5], #-2595	; 0xfffff5dd
    25c4:	661d054a 	ldrvs	r0, [sp], -sl, asr #10
    25c8:	052f0d05 	streq	r0, [pc, #-3333]!	; 18cb <_start-0x6735>
    25cc:	05863301 	streq	r3, [r6, #769]	; 0x301
    25d0:	2005f307 	andcs	pc, r5, r7, lsl #6
    25d4:	01040200 	mrseq	r0, R12_usr
    25d8:	67090566 	strvs	r0, [r9, -r6, ror #10]
    25dc:	05690105 	strbeq	r0, [r9, #-261]!	; 0xfffffefb
    25e0:	25052c0c 	strcs	r2, [r5, #-3084]	; 0xfffff3f4
    25e4:	01040200 	mrseq	r0, R12_usr
    25e8:	67090566 	strvs	r0, [r9, -r6, ror #10]
    25ec:	02670105 	rsbeq	r0, r7, #1073741825	; 0x40000001
    25f0:	01010006 	tsteq	r1, r6
    25f4:	0000012c 	andeq	r0, r0, ip, lsr #2
    25f8:	00b30003 	adcseq	r0, r3, r3
    25fc:	01020000 	mrseq	r0, (UNDEF: 2)
    2600:	000d0efb 	strdeq	r0, [sp], -fp
    2604:	01010101 	tsteq	r1, r1, lsl #2
    2608:	01000000 	mrseq	r0, (UNDEF: 0)
    260c:	2f010000 	svccs	0x00010000
    2610:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
    2614:	7274722f 	rsbsvc	r7, r4, #-268435454	; 0xf0000002
    2618:	65442f6b 	strbvs	r2, [r4, #-3947]	; 0xfffff095
    261c:	6f746b73 	svcvs	0x00746b73
    2620:	6f6c2f70 	svcvs	0x006c2f70
    2624:	5f696d73 	svcpl	0x00696d73
    2628:	656d6f6b 	strbvs	r6, [sp, #-3947]!	; 0xfffff095
    262c:	7261746e 	rsbvc	r7, r1, #1845493760	; 0x6e000000
    2630:	6f617369 	svcvs	0x00617369
    2634:	7a65762f 	bvc	195fef8 <_stack+0x18dfef8>
    2638:	38306162 	ldmdacc	r0!, {r1, r5, r6, r8, sp, lr}
    263c:	72656b2f 	rsbvc	r6, r5, #48128	; 0xbc00
    2640:	006c656e 	rsbeq	r6, ip, lr, ror #10
    2644:	7273752f 	rsbsvc	r7, r3, #197132288	; 0xbc00000
    2648:	62696c2f 	rsbvs	r6, r9, #12032	; 0x2f00
    264c:	6363672f 	cmnvs	r3, #12320768	; 0xbc0000
    2650:	6d72612f 	ldfvse	f6, [r2, #-188]!	; 0xffffff44
    2654:	6e6f6e2d 	cdpvs	14, 6, cr6, cr15, cr13, {1}
    2658:	61652d65 	cmnvs	r5, r5, ror #26
    265c:	392f6962 	stmdbcc	pc!, {r1, r5, r6, r8, fp, sp, lr}	; <UNPREDICTABLE>
    2660:	312e322e 			; <UNDEFINED> instruction: 0x312e322e
    2664:	636e692f 	cmnvs	lr, #770048	; 0xbc000
    2668:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
    266c:	70720000 	rsbsvc	r0, r2, r0
    2670:	6e692d69 	cdpvs	13, 6, cr2, cr9, cr9, {3}
    2674:	72726574 	rsbsvc	r6, r2, #116, 10	; 0x1d000000
    2678:	73747075 	cmnvc	r4, #117	; 0x75
    267c:	0100632e 	tsteq	r0, lr, lsr #6
    2680:	79740000 	ldmdbvc	r4!, {}^	; <UNPREDICTABLE>
    2684:	2d736570 	cfldr64cs	mvdx6, [r3, #-448]!	; 0xfffffe40
    2688:	682e746d 	stmdavs	lr!, {r0, r2, r3, r5, r6, sl, ip, sp, lr}
    268c:	00000100 	andeq	r0, r0, r0, lsl #2
    2690:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
    2694:	65746e69 	ldrbvs	r6, [r4, #-3689]!	; 0xfffff197
    2698:	70757272 	rsbsvc	r7, r5, r2, ror r2
    269c:	682e7374 	stmdavs	lr!, {r2, r4, r5, r6, r8, r9, ip, sp, lr}
    26a0:	00000100 	andeq	r0, r0, r0, lsl #2
    26a4:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
    26a8:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
    26ac:	00000200 	andeq	r0, r0, r0, lsl #4
    26b0:	00010500 	andeq	r0, r1, r0, lsl #10
    26b4:	f5380205 			; <UNDEFINED> instruction: 0xf5380205
    26b8:	1b030000 	blne	c26c0 <_stack+0x426c0>
    26bc:	4b0c0501 	blmi	303ac8 <_stack+0x283ac8>
    26c0:	05670105 	strbeq	r0, [r7, #-261]!	; 0xfffffefb
    26c4:	24058937 	strcs	r8, [r5], #-2359	; 0xfffff6c9
    26c8:	032d0582 			; <UNDEFINED> instruction: 0x032d0582
    26cc:	02058209 	andeq	r8, r5, #-1879048192	; 0x90000000
    26d0:	0301059f 	movweq	r0, #5535	; 0x159f
    26d4:	0574080b 	ldrbeq	r0, [r4, #-2059]!	; 0xfffff7f5
    26d8:	2e77030f 	cdpcs	3, 7, cr0, cr7, cr15, {0}
    26dc:	05830305 	streq	r0, [r3, #773]	; 0x305
    26e0:	0305300f 	movweq	r3, #20495	; 0x500f
    26e4:	300f0583 	andcc	r0, pc, r3, lsl #11
    26e8:	05830305 	streq	r0, [r3, #773]	; 0x305
    26ec:	23053001 	movwcs	r3, #20481	; 0x5001
    26f0:	83020584 	movwhi	r0, #9604	; 0x2584
    26f4:	92081205 	andls	r1, r8, #1342177280	; 0x50000000
    26f8:	01058484 	smlabbeq	r5, r4, r4, r8
    26fc:	842c0584 	strthi	r0, [ip], #-1412	; 0xfffffa7c
    2700:	05830205 	streq	r0, [r3, #517]	; 0x205
    2704:	09054a1e 	stmdbeq	r5, {r1, r2, r3, r4, r9, fp, lr}
    2708:	6602054b 	strvs	r0, [r2], -fp, asr #10
    270c:	4a1a054b 	bmi	683c40 <_stack+0x603c40>
    2710:	054b0105 	strbeq	r0, [fp, #-261]	; 0xfffffefb
    2714:	0905682c 	stmdbeq	r5, {r2, r3, r5, fp, sp, lr}
    2718:	66020583 	strvs	r0, [r2], -r3, lsl #11
    271c:	024b0105 	subeq	r0, fp, #1073741825	; 0x40000001
    2720:	01010006 	tsteq	r1, r6
    2724:	000000e0 	andeq	r0, r0, r0, ror #1
    2728:	00a10003 	adceq	r0, r1, r3
    272c:	01020000 	mrseq	r0, (UNDEF: 2)
    2730:	000d0efb 	strdeq	r0, [sp], -fp
    2734:	01010101 	tsteq	r1, r1, lsl #2
    2738:	01000000 	mrseq	r0, (UNDEF: 0)
    273c:	2f010000 	svccs	0x00010000
    2740:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
    2744:	7274722f 	rsbsvc	r7, r4, #-268435454	; 0xf0000002
    2748:	65442f6b 	strbvs	r2, [r4, #-3947]	; 0xfffff095
    274c:	6f746b73 	svcvs	0x00746b73
    2750:	6f6c2f70 	svcvs	0x006c2f70
    2754:	5f696d73 	svcpl	0x00696d73
    2758:	656d6f6b 	strbvs	r6, [sp, #-3947]!	; 0xfffff095
    275c:	7261746e 	rsbvc	r7, r1, #1845493760	; 0x6e000000
    2760:	6f617369 	svcvs	0x00617369
    2764:	7a65762f 	bvc	1960028 <_stack+0x18e0028>
    2768:	38306162 	ldmdacc	r0!, {r1, r5, r6, r8, sp, lr}
    276c:	72656b2f 	rsbvc	r6, r5, #48128	; 0xbc00
    2770:	006c656e 	rsbeq	r6, ip, lr, ror #10
    2774:	7273752f 	rsbsvc	r7, r3, #197132288	; 0xbc00000
    2778:	62696c2f 	rsbvs	r6, r9, #12032	; 0x2f00
    277c:	6363672f 	cmnvs	r3, #12320768	; 0xbc0000
    2780:	6d72612f 	ldfvse	f6, [r2, #-188]!	; 0xffffff44
    2784:	6e6f6e2d 	cdpvs	14, 6, cr6, cr15, cr13, {1}
    2788:	61652d65 	cmnvs	r5, r5, ror #26
    278c:	392f6962 	stmdbcc	pc!, {r1, r5, r6, r8, fp, sp, lr}	; <UNPREDICTABLE>
    2790:	312e322e 			; <UNDEFINED> instruction: 0x312e322e
    2794:	636e692f 	cmnvs	lr, #770048	; 0xbc000
    2798:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
    279c:	70720000 	rsbsvc	r0, r2, r0
    27a0:	79732d69 	ldmdbvc	r3!, {r0, r3, r5, r6, r8, sl, fp, sp}^
    27a4:	6d697473 	cfstrdvs	mvd7, [r9, #-460]!	; 0xfffffe34
    27a8:	632e7265 			; <UNDEFINED> instruction: 0x632e7265
    27ac:	00000100 	andeq	r0, r0, r0, lsl #2
    27b0:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
    27b4:	74737973 	ldrbtvc	r7, [r3], #-2419	; 0xfffff68d
    27b8:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
    27bc:	0100682e 	tsteq	r0, lr, lsr #16
    27c0:	74730000 	ldrbtvc	r0, [r3], #-0
    27c4:	746e6964 	strbtvc	r6, [lr], #-2404	; 0xfffff69c
    27c8:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
    27cc:	05000000 	streq	r0, [r0, #-0]
    27d0:	02050001 	andeq	r0, r5, #1
    27d4:	0000f714 	andeq	pc, r0, r4, lsl r7	; <UNPREDICTABLE>
    27d8:	05011103 	streq	r1, [r1, #-259]	; 0xfffffefd
    27dc:	01054b0c 	tsteq	r5, ip, lsl #22
    27e0:	2a058567 	bcs	163d84 <_stack+0xe3d84>
    27e4:	82170583 	andshi	r0, r7, #549453824	; 0x20c00000
    27e8:	05300a05 	ldreq	r0, [r0, #-2565]!	; 0xfffff5fb
    27ec:	0402001c 	streq	r0, [r2], #-28	; 0xffffffe4
    27f0:	29052e01 	stmdbcs	r5, {r0, r9, sl, fp, sp}
    27f4:	01040200 	mrseq	r0, R12_usr
    27f8:	000a0582 	andeq	r0, sl, r2, lsl #11
    27fc:	4a010402 	bmi	4380c <__bss_end__+0x334c0>
    2800:	026a0105 	rsbeq	r0, sl, #1073741825	; 0x40000001
    2804:	0101000a 	tsteq	r1, sl
    2808:	000000ca 	andeq	r0, r0, sl, asr #1
    280c:	00a70003 	adceq	r0, r7, r3
    2810:	01020000 	mrseq	r0, (UNDEF: 2)
    2814:	000d0efb 	strdeq	r0, [sp], -fp
    2818:	01010101 	tsteq	r1, r1, lsl #2
    281c:	01000000 	mrseq	r0, (UNDEF: 0)
    2820:	2f010000 	svccs	0x00010000
    2824:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
    2828:	7274722f 	rsbsvc	r7, r4, #-268435454	; 0xf0000002
    282c:	65442f6b 	strbvs	r2, [r4, #-3947]	; 0xfffff095
    2830:	6f746b73 	svcvs	0x00746b73
    2834:	6f6c2f70 	svcvs	0x006c2f70
    2838:	5f696d73 	svcpl	0x00696d73
    283c:	656d6f6b 	strbvs	r6, [sp, #-3947]!	; 0xfffff095
    2840:	7261746e 	rsbvc	r7, r1, #1845493760	; 0x6e000000
    2844:	6f617369 	svcvs	0x00617369
    2848:	7a65762f 	bvc	196010c <_stack+0x18e010c>
    284c:	38306162 	ldmdacc	r0!, {r1, r5, r6, r8, sp, lr}
    2850:	72656b2f 	rsbvc	r6, r5, #48128	; 0xbc00
    2854:	006c656e 	rsbeq	r6, ip, lr, ror #10
    2858:	7273752f 	rsbsvc	r7, r3, #197132288	; 0xbc00000
    285c:	62696c2f 	rsbvs	r6, r9, #12032	; 0x2f00
    2860:	6363672f 	cmnvs	r3, #12320768	; 0xbc0000
    2864:	6d72612f 	ldfvse	f6, [r2, #-188]!	; 0xffffff44
    2868:	6e6f6e2d 	cdpvs	14, 6, cr6, cr15, cr13, {1}
    286c:	61652d65 	cmnvs	r5, r5, ror #26
    2870:	392f6962 	stmdbcc	pc!, {r1, r5, r6, r8, fp, sp, lr}	; <UNPREDICTABLE>
    2874:	312e322e 			; <UNDEFINED> instruction: 0x312e322e
    2878:	636e692f 	cmnvs	lr, #770048	; 0xbc000
    287c:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0xfffffa94
    2880:	70720000 	rsbsvc	r0, r2, r0
    2884:	61752d69 	cmnvs	r5, r9, ror #26
    2888:	632e7472 			; <UNDEFINED> instruction: 0x632e7472
    288c:	00000100 	andeq	r0, r0, r0, lsl #2
    2890:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
    2894:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
    2898:	00000200 	andeq	r0, r0, r0, lsl #4
    289c:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
    28a0:	65736162 	ldrbvs	r6, [r3, #-354]!	; 0xfffffe9e
    28a4:	0100682e 	tsteq	r0, lr, lsr #16
    28a8:	70720000 	rsbsvc	r0, r2, r0
    28ac:	61752d69 	cmnvs	r5, r9, ror #26
    28b0:	682e7472 	stmdavs	lr!, {r1, r4, r5, r6, sl, ip, sp, lr}
    28b4:	00000100 	andeq	r0, r0, r0, lsl #2
    28b8:	001f0500 	andseq	r0, pc, r0, lsl #10
    28bc:	f7980205 			; <UNDEFINED> instruction: 0xf7980205
    28c0:	0e030000 	cdpeq	0, 0, cr0, cr3, cr0, {0}
    28c4:	4b090501 	blmi	243cd0 <_stack+0x1c3cd0>
    28c8:	05670105 	strbeq	r0, [r7, #-261]!	; 0xfffffefb
    28cc:	01058418 	tsteq	r5, r8, lsl r4
    28d0:	0008024c 	andeq	r0, r8, ip, asr #4
    28d4:	01e40101 	mvneq	r0, r1, lsl #2
    28d8:	00030000 	andeq	r0, r3, r0
    28dc:	00000095 	muleq	r0, r5, r0
    28e0:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
    28e4:	0101000d 	tsteq	r1, sp
    28e8:	00000101 	andeq	r0, r0, r1, lsl #2
    28ec:	00000100 	andeq	r0, r0, r0, lsl #2
    28f0:	6f682f01 	svcvs	0x00682f01
    28f4:	722f656d 	eorvc	r6, pc, #457179136	; 0x1b400000
    28f8:	2f6b7274 	svccs	0x006b7274
    28fc:	6b736544 	blvs	1cdbe14 <_stack+0x1c5be14>
    2900:	2f706f74 	svccs	0x00706f74
    2904:	6d736f6c 	ldclvs	15, cr6, [r3, #-432]!	; 0xfffffe50
    2908:	6f6b5f69 	svcvs	0x006b5f69
    290c:	746e656d 	strbtvc	r6, [lr], #-1389	; 0xfffffa93
    2910:	73697261 	cmnvc	r9, #268435462	; 0x10000006
    2914:	762f6f61 	strtvc	r6, [pc], -r1, ror #30
    2918:	61627a65 	cmnvs	r2, r5, ror #20
    291c:	6b2f3830 	blvs	bd09e4 <_stack+0xb509e4>
    2920:	656e7265 	strbvs	r7, [lr, #-613]!	; 0xfffffd9b
    2924:	752f006c 	strvc	r0, [pc, #-108]!	; 28c0 <_start-0x5740>
    2928:	6c2f7273 	sfmvs	f7, 4, [pc], #-460	; 2764 <_start-0x589c>
    292c:	672f6269 	strvs	r6, [pc, -r9, ror #4]!
    2930:	612f6363 			; <UNDEFINED> instruction: 0x612f6363
    2934:	6e2d6d72 	mcrvs	13, 1, r6, cr13, cr2, {3}
    2938:	2d656e6f 	stclcs	14, cr6, [r5, #-444]!	; 0xfffffe44
    293c:	69626165 	stmdbvs	r2!, {r0, r2, r5, r6, r8, sp, lr}^
    2940:	322e392f 	eorcc	r3, lr, #770048	; 0xbc000
    2944:	692f312e 	stmdbvs	pc!, {r1, r2, r3, r5, r8, ip, sp}	; <UNPREDICTABLE>
    2948:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
    294c:	00006564 	andeq	r6, r0, r4, ror #10
    2950:	6c647473 	cfstrdvs	mvd7, [r4], #-460	; 0xfffffe34
    2954:	632e6269 			; <UNDEFINED> instruction: 0x632e6269
    2958:	00000100 	andeq	r0, r0, r0, lsl #2
    295c:	6c647473 	cfstrdvs	mvd7, [r4], #-460	; 0xfffffe34
    2960:	682e6269 	stmdavs	lr!, {r0, r3, r5, r6, r9, sp, lr}
    2964:	00000100 	andeq	r0, r0, r0, lsl #2
    2968:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
    296c:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
    2970:	00000200 	andeq	r0, r0, r0, lsl #4
    2974:	00140500 	andseq	r0, r4, r0, lsl #10
    2978:	f7d40205 			; <UNDEFINED> instruction: 0xf7d40205
    297c:	0f030000 	svceq	0x00030000
    2980:	4b0b0501 	blmi	2c3d8c <_stack+0x243d8c>
    2984:	05661305 	strbeq	r1, [r6, #-773]!	; 0xfffffcfb
    2988:	13054b0b 	movwne	r4, #23307	; 0x5b0b
    298c:	4b010566 	blmi	43f2c <__bss_end__+0x33be0>
    2990:	05841a05 	streq	r1, [r4, #2565]	; 0xa05
    2994:	26058310 			; <UNDEFINED> instruction: 0x26058310
    2998:	4b090582 	blmi	243fa8 <_stack+0x1c3fa8>
    299c:	054b0405 	strbeq	r0, [fp, #-1029]	; 0xfffffbfb
    29a0:	0d056707 	stceq	7, cr6, [r5, #-28]	; 0xffffffe4
    29a4:	4a05052f 	bmi	143e68 <_stack+0xc3e68>
    29a8:	4b670c05 	blmi	19c59c4 <_stack+0x19459c4>
    29ac:	05840f05 	streq	r0, [r4, #3845]	; 0xf05
    29b0:	06054b0e 	streq	r4, [r5], -lr, lsl #22
    29b4:	670d054a 	strvs	r0, [sp, -sl, asr #10]
    29b8:	05831d05 	streq	r1, [r3, #3333]	; 0xd05
    29bc:	14054a25 	strne	r4, [r5], #-2597	; 0xfffff5db
    29c0:	4b1d054a 	blmi	743ef0 <_stack+0x6c3ef0>
    29c4:	054a1405 	strbeq	r1, [sl, #-1029]	; 0xfffffbfb
    29c8:	0605680d 	streq	r6, [r5], -sp, lsl #16
    29cc:	670f0568 	strvs	r0, [pc, -r8, ror #10]
    29d0:	05860405 	streq	r0, [r6, #1029]	; 0x405
    29d4:	04052c14 	streq	r2, [r5], #-3092	; 0xfffff3ec
    29d8:	03070568 	movweq	r0, #30056	; 0x7568
    29dc:	1c052e6e 	stcne	14, cr2, [r5], {110}	; 0x6e
    29e0:	05661503 	strbeq	r1, [r6, #-1283]!	; 0xfffffafd
    29e4:	01056814 	tsteq	r5, r4, lsl r8
    29e8:	8416054b 	ldrhi	r0, [r6], #-1355	; 0xfffffab5
    29ec:	05831005 	streq	r1, [r3, #5]
    29f0:	06058226 	streq	r8, [r5], -r6, lsr #4
    29f4:	6707054b 	strvs	r0, [r7, -fp, asr #10]
    29f8:	052f0505 	streq	r0, [pc, #-1285]!	; 24fb <_start-0x5b05>
    29fc:	054b830c 	strbeq	r8, [fp, #-780]	; 0xfffffcf4
    2a00:	0d058406 	cfstrseq	mvf8, [r5, #-24]	; 0xffffffe8
    2a04:	4b160567 	blmi	583fa8 <_stack+0x503fa8>
    2a08:	4b4a1405 	blmi	1287a24 <_stack+0x1207a24>
    2a0c:	05670f05 	strbeq	r0, [r7, #-3845]!	; 0xfffff0fb
    2a10:	0c058904 			; <UNDEFINED> instruction: 0x0c058904
    2a14:	4b150529 	blmi	543ec0 <_stack+0x4c3ec0>
    2a18:	4b4a1305 	blmi	1287634 <_stack+0x1207634>
    2a1c:	05671405 	strbeq	r1, [r7, #-1029]!	; 0xfffffbfb
    2a20:	07056804 	streq	r6, [r5, -r4, lsl #16]
    2a24:	052e7003 	streq	r7, [lr, #-3]!
    2a28:	66130301 	ldrvs	r0, [r3], -r1, lsl #6
    2a2c:	05a03105 	streq	r3, [r0, #261]!	; 0x105
    2a30:	0205bc08 	andeq	fp, r5, #8, 24	; 0x800
    2a34:	0013054a 	andseq	r0, r3, sl, asr #10
    2a38:	2f030402 	svccs	0x00030402
    2a3c:	02000705 	andeq	r0, r0, #1310720	; 0x140000
    2a40:	05660304 	strbeq	r0, [r6, #-772]!	; 0xfffffcfc
    2a44:	0402000d 	streq	r0, [r2], #-13
    2a48:	0b056603 	bleq	15c25c <_stack+0xdc25c>
    2a4c:	03040200 	movweq	r0, #16896	; 0x4200
    2a50:	0017052e 	andseq	r0, r7, lr, lsr #10
    2a54:	2d030402 	cfstrscs	mvf0, [r3, #-8]
    2a58:	02000205 	andeq	r0, r0, #1342177280	; 0x50000000
    2a5c:	05660104 	strbeq	r0, [r6, #-260]!	; 0xfffffefc
    2a60:	2b058501 	blcs	163e6c <_stack+0xe3e6c>
    2a64:	d80805a0 	stmdale	r8, {r5, r7, r8, sl}
    2a68:	054a0205 	strbeq	r0, [sl, #-517]	; 0xfffffdfb
    2a6c:	04020006 	streq	r0, [r2], #-6
    2a70:	0a052f03 	beq	14e684 <_stack+0xce684>
    2a74:	03040200 	movweq	r0, #16896	; 0x4200
    2a78:	00170566 	andseq	r0, r7, r6, ror #10
    2a7c:	49030402 	stmdbmi	r3, {r1, sl}
    2a80:	02000205 	andeq	r0, r0, #1342177280	; 0x50000000
    2a84:	05660104 	strbeq	r0, [r6, #-260]!	; 0xfffffefc
    2a88:	31058501 	tstcc	r5, r1, lsl #10
    2a8c:	bc0805a0 	cfstr32lt	mvfx0, [r8], {160}	; 0xa0
    2a90:	054a0205 	strbeq	r0, [sl, #-517]	; 0xfffffdfb
    2a94:	06052f09 	streq	r2, [r5], -r9, lsl #30
    2a98:	2e130566 	cfmsc32cs	mvfx0, mvfx3, mvfx6
    2a9c:	05661005 	strbeq	r1, [r6, #-5]!
    2aa0:	0b052e05 	bleq	14e2bc <_stack+0xce2bc>
    2aa4:	0017054b 	andseq	r0, r7, fp, asr #10
    2aa8:	48020402 	stmdami	r2, {r1, sl}
    2aac:	02000205 	andeq	r0, r0, #1342177280	; 0x50000000
    2ab0:	05660104 	strbeq	r0, [r6, #-260]!	; 0xfffffefc
    2ab4:	01058809 	tsteq	r5, r9, lsl #16
    2ab8:	0008022f 	andeq	r0, r8, pc, lsr #4
    2abc:	01240101 			; <UNDEFINED> instruction: 0x01240101
    2ac0:	00030000 	andeq	r0, r3, r0
    2ac4:	00000052 	andeq	r0, r0, r2, asr r0
    2ac8:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
    2acc:	0101000d 	tsteq	r1, sp
    2ad0:	00000101 	andeq	r0, r0, r1, lsl #2
    2ad4:	00000100 	andeq	r0, r0, r0, lsl #2
    2ad8:	6f682f01 	svcvs	0x00682f01
    2adc:	722f656d 	eorvc	r6, pc, #457179136	; 0x1b400000
    2ae0:	2f6b7274 	svccs	0x006b7274
    2ae4:	6b736544 	blvs	1cdbffc <_stack+0x1c5bffc>
    2ae8:	2f706f74 	svccs	0x00706f74
    2aec:	6d736f6c 	ldclvs	15, cr6, [r3, #-432]!	; 0xfffffe50
    2af0:	6f6b5f69 	svcvs	0x006b5f69
    2af4:	746e656d 	strbtvc	r6, [lr], #-1389	; 0xfffffa93
    2af8:	73697261 	cmnvc	r9, #268435462	; 0x10000006
    2afc:	762f6f61 	strtvc	r6, [pc], -r1, ror #30
    2b00:	61627a65 	cmnvs	r2, r5, ror #20
    2b04:	762f3830 			; <UNDEFINED> instruction: 0x762f3830
    2b08:	65627a65 	strbvs	r7, [r2, #-2661]!	; 0xfffff59b
    2b0c:	38760000 	ldmdacc	r6!, {}^	; <UNPREDICTABLE>
    2b10:	2e61325f 	mcrcs	2, 3, r3, cr1, cr15, {2}
    2b14:	00010063 	andeq	r0, r1, r3, rrx
    2b18:	1b050000 	blne	142b20 <_stack+0xc2b20>
    2b1c:	a0020500 	andge	r0, r2, r0, lsl #10
    2b20:	190000fb 	stmdbne	r0, {r0, r1, r3, r4, r5, r6, r7}
    2b24:	05850905 	streq	r0, [r5, #2309]	; 0x905
    2b28:	05054a03 	streq	r4, [r5, #-2563]	; 0xfffff5fd
    2b2c:	03040200 	movweq	r0, #16896	; 0x4200
    2b30:	04020030 	streq	r0, [r2], #-48	; 0xffffffd0
    2b34:	02006703 	andeq	r6, r0, #786432	; 0xc0000
    2b38:	00670304 	rsbeq	r0, r7, r4, lsl #6
    2b3c:	67030402 	strvs	r0, [r3, -r2, lsl #8]
    2b40:	02001805 	andeq	r1, r0, #327680	; 0x50000
    2b44:	05610304 	strbeq	r0, [r1, #-772]!	; 0xfffffcfc
    2b48:	04020003 	streq	r0, [r2], #-3
    2b4c:	01056601 	tsteq	r5, r1, lsl #12
    2b50:	841b056e 	ldrhi	r0, [fp], #-1390	; 0xfffffa92
    2b54:	05850905 	streq	r0, [r5, #2309]	; 0x905
    2b58:	05054a03 	streq	r4, [r5, #-2563]	; 0xfffff5fd
    2b5c:	03040200 	movweq	r0, #16896	; 0x4200
    2b60:	04020030 	streq	r0, [r2], #-48	; 0xffffffd0
    2b64:	02006703 	andeq	r6, r0, #786432	; 0xc0000
    2b68:	00670304 	rsbeq	r0, r7, r4, lsl #6
    2b6c:	67030402 	strvs	r0, [r3, -r2, lsl #8]
    2b70:	03040200 	movweq	r0, #16896	; 0x4200
    2b74:	04020067 	streq	r0, [r2], #-103	; 0xffffff99
    2b78:	18056703 	stmdane	r5, {r0, r1, r8, r9, sl, sp, lr}
    2b7c:	03040200 	movweq	r0, #16896	; 0x4200
    2b80:	05667903 	strbeq	r7, [r6, #-2307]!	; 0xfffff6fd
    2b84:	04020003 	streq	r0, [r2], #-3
    2b88:	01056601 	tsteq	r5, r1, lsl #12
    2b8c:	05660a03 	strbeq	r0, [r6, #-2563]!	; 0xfffff5fd
    2b90:	0905841b 	stmdbeq	r5, {r0, r1, r3, r4, sl, pc}
    2b94:	4a030585 	bmi	c41b0 <_stack+0x441b0>
    2b98:	02000505 	andeq	r0, r0, #20971520	; 0x1400000
    2b9c:	00300304 	eorseq	r0, r0, r4, lsl #6
    2ba0:	67030402 	strvs	r0, [r3, -r2, lsl #8]
    2ba4:	03040200 	movweq	r0, #16896	; 0x4200
    2ba8:	04020067 	streq	r0, [r2], #-103	; 0xffffff99
    2bac:	02006703 	andeq	r6, r0, #786432	; 0xc0000
    2bb0:	00670304 	rsbeq	r0, r7, r4, lsl #6
    2bb4:	67030402 	strvs	r0, [r3, -r2, lsl #8]
    2bb8:	02001805 	andeq	r1, r0, #327680	; 0x50000
    2bbc:	79030304 	stmdbvc	r3, {r2, r8, r9}
    2bc0:	00030566 	andeq	r0, r3, r6, ror #10
    2bc4:	66010402 	strvs	r0, [r1], -r2, lsl #8
    2bc8:	0a030105 	beq	c2fe4 <_stack+0x42fe4>
    2bcc:	84190566 	ldrhi	r0, [r9], #-1382	; 0xfffffa9a
    2bd0:	67870305 	strvs	r0, [r7, r5, lsl #6]
    2bd4:	d7310d05 	ldrle	r0, [r1, -r5, lsl #26]!
    2bd8:	d90305d7 	stmdble	r3, {r0, r1, r2, r4, r6, r7, r8, sl}
    2bdc:	01056767 	tsteq	r5, r7, ror #14
    2be0:	00060267 	andeq	r0, r6, r7, ror #4
    2be4:	Address 0x0000000000002be4 is out of bounds.


Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	0000000c 	andeq	r0, r0, ip
   4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
   8:	7c020001 	stcvc	0, cr0, [r2], {1}
   c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  10:	0000001c 	andeq	r0, r0, ip, lsl r0
  14:	00000000 	andeq	r0, r0, r0
  18:	00008148 	andeq	r8, r0, r8, asr #2
  1c:	00000078 	andeq	r0, r0, r8, ror r0
  20:	8b080e42 	blhi	203930 <_stack+0x183930>
  24:	42018e02 	andmi	r8, r1, #2, 28
  28:	76040b0c 	strvc	r0, [r4], -ip, lsl #22
  2c:	00080d0c 	andeq	r0, r8, ip, lsl #26
  30:	0000000c 	andeq	r0, r0, ip
  34:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  38:	7c020001 	stcvc	0, cr0, [r2], {1}
  3c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  40:	0000001c 	andeq	r0, r0, ip, lsl r0
  44:	00000030 	andeq	r0, r0, r0, lsr r0
  48:	000081c0 	andeq	r8, r0, r0, asr #3
  4c:	00000028 	andeq	r0, r0, r8, lsr #32
  50:	8b080e42 	blhi	203960 <_stack+0x183960>
  54:	42018e02 	andmi	r8, r1, #2, 28
  58:	4e040b0c 	vmlami.f64	d0, d4, d12
  5c:	00080d0c 	andeq	r0, r8, ip, lsl #26
  60:	0000001c 	andeq	r0, r0, ip, lsl r0
  64:	00000030 	andeq	r0, r0, r0, lsr r0
  68:	000081e8 	andeq	r8, r0, r8, ror #3
  6c:	00000034 	andeq	r0, r0, r4, lsr r0
  70:	8b040e42 	blhi	103980 <_stack+0x83980>
  74:	0b0d4201 	bleq	350880 <_stack+0x2d0880>
  78:	420d0d52 	andmi	r0, sp, #5248	; 0x1480
  7c:	00000ecb 	andeq	r0, r0, fp, asr #29
  80:	0000001c 	andeq	r0, r0, ip, lsl r0
  84:	00000030 	andeq	r0, r0, r0, lsr r0
  88:	0000821c 	andeq	r8, r0, ip, lsl r2
  8c:	00000148 	andeq	r0, r0, r8, asr #2
  90:	8b040e42 	blhi	1039a0 <_stack+0x839a0>
  94:	0b0d4201 	bleq	3508a0 <_stack+0x2d08a0>
  98:	0d0d9c02 	stceq	12, cr9, [sp, #-8]
  9c:	000ecb42 	andeq	ip, lr, r2, asr #22
  a0:	0000001c 	andeq	r0, r0, ip, lsl r0
  a4:	00000030 	andeq	r0, r0, r0, lsr r0
  a8:	00008364 	andeq	r8, r0, r4, ror #6
  ac:	00000128 	andeq	r0, r0, r8, lsr #2
  b0:	8b040e42 	blhi	1039c0 <_stack+0x839c0>
  b4:	0b0d4201 	bleq	3508c0 <_stack+0x2d08c0>
  b8:	0d0d8c02 	stceq	12, cr8, [sp, #-8]
  bc:	000ecb42 	andeq	ip, lr, r2, asr #22
  c0:	0000001c 	andeq	r0, r0, ip, lsl r0
  c4:	00000030 	andeq	r0, r0, r0, lsr r0
  c8:	0000848c 	andeq	r8, r0, ip, lsl #9
  cc:	00000070 	andeq	r0, r0, r0, ror r0
  d0:	8b080e42 	blhi	2039e0 <_stack+0x1839e0>
  d4:	42018e02 	andmi	r8, r1, #2, 28
  d8:	72040b0c 	andvc	r0, r4, #12, 22	; 0x3000
  dc:	00080d0c 	andeq	r0, r8, ip, lsl #26
  e0:	0000001c 	andeq	r0, r0, ip, lsl r0
  e4:	00000030 	andeq	r0, r0, r0, lsr r0
  e8:	000084fc 	strdeq	r8, [r0], -ip
  ec:	00000090 	muleq	r0, r0, r0
  f0:	8b080e42 	blhi	203a00 <_stack+0x183a00>
  f4:	42018e02 	andmi	r8, r1, #2, 28
  f8:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
  fc:	080d0c42 	stmdaeq	sp, {r1, r6, sl, fp}
 100:	0000001c 	andeq	r0, r0, ip, lsl r0
 104:	00000030 	andeq	r0, r0, r0, lsr r0
 108:	0000858c 	andeq	r8, r0, ip, lsl #11
 10c:	00000054 	andeq	r0, r0, r4, asr r0
 110:	8b040e42 	blhi	103a20 <_stack+0x83a20>
 114:	0b0d4201 	bleq	350920 <_stack+0x2d0920>
 118:	420d0d62 	andmi	r0, sp, #6272	; 0x1880
 11c:	00000ecb 	andeq	r0, r0, fp, asr #29
 120:	00000020 	andeq	r0, r0, r0, lsr #32
 124:	00000030 	andeq	r0, r0, r0, lsr r0
 128:	000085e0 	andeq	r8, r0, r0, ror #11
 12c:	00000368 	andeq	r0, r0, r8, ror #6
 130:	8b080e42 	blhi	203a40 <_stack+0x183a40>
 134:	42018e02 	andmi	r8, r1, #2, 28
 138:	03040b0c 	movweq	r0, #19212	; 0x4b0c
 13c:	0d0c01ae 	stfeqs	f0, [ip, #-696]	; 0xfffffd48
 140:	00000008 	andeq	r0, r0, r8
 144:	0000001c 	andeq	r0, r0, ip, lsl r0
 148:	00000030 	andeq	r0, r0, r0, lsr r0
 14c:	00008948 	andeq	r8, r0, r8, asr #18
 150:	0000017c 	andeq	r0, r0, ip, ror r1
 154:	8b080e42 	blhi	203a64 <_stack+0x183a64>
 158:	42018e02 	andmi	r8, r1, #2, 28
 15c:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 160:	080d0cb8 	stmdaeq	sp, {r3, r4, r5, r7, sl, fp}
 164:	0000001c 	andeq	r0, r0, ip, lsl r0
 168:	00000030 	andeq	r0, r0, r0, lsr r0
 16c:	00008ac4 	andeq	r8, r0, r4, asr #21
 170:	00000134 	andeq	r0, r0, r4, lsr r1
 174:	8b080e42 	blhi	203a84 <_stack+0x183a84>
 178:	42018e02 	andmi	r8, r1, #2, 28
 17c:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 180:	080d0c94 	stmdaeq	sp, {r2, r4, r7, sl, fp}
 184:	00000014 	andeq	r0, r0, r4, lsl r0
 188:	00000030 	andeq	r0, r0, r0, lsr r0
 18c:	00008bf8 	strdeq	r8, [r0], -r8	; <UNPREDICTABLE>
 190:	00000014 	andeq	r0, r0, r4, lsl r0
 194:	8b040e42 	blhi	103aa4 <_stack+0x83aa4>
 198:	0b0d4201 	bleq	3509a4 <_stack+0x2d09a4>
 19c:	00000018 	andeq	r0, r0, r8, lsl r0
 1a0:	00000030 	andeq	r0, r0, r0, lsr r0
 1a4:	00008c0c 	andeq	r8, r0, ip, lsl #24
 1a8:	00000058 	andeq	r0, r0, r8, asr r0
 1ac:	8b080e42 	blhi	203abc <_stack+0x183abc>
 1b0:	42018e02 	andmi	r8, r1, #2, 28
 1b4:	00040b0c 	andeq	r0, r4, ip, lsl #22
 1b8:	0000001c 	andeq	r0, r0, ip, lsl r0
 1bc:	00000030 	andeq	r0, r0, r0, lsr r0
 1c0:	00008c64 	andeq	r8, r0, r4, ror #24
 1c4:	0000005c 	andeq	r0, r0, ip, asr r0
 1c8:	8b080e42 	blhi	203ad8 <_stack+0x183ad8>
 1cc:	42018e02 	andmi	r8, r1, #2, 28
 1d0:	68040b0c 	stmdavs	r4, {r2, r3, r8, r9, fp}
 1d4:	00080d0c 	andeq	r0, r8, ip, lsl #26
 1d8:	00000020 	andeq	r0, r0, r0, lsr #32
 1dc:	00000030 	andeq	r0, r0, r0, lsr r0
 1e0:	00008cc0 	andeq	r8, r0, r0, asr #25
 1e4:	00000424 	andeq	r0, r0, r4, lsr #8
 1e8:	8b080e42 	blhi	203af8 <_stack+0x183af8>
 1ec:	42018e02 	andmi	r8, r1, #2, 28
 1f0:	03040b0c 	movweq	r0, #19212	; 0x4b0c
 1f4:	0d0c020c 	sfmeq	f0, 4, [ip, #-48]	; 0xffffffd0
 1f8:	00000008 	andeq	r0, r0, r8
 1fc:	0000001c 	andeq	r0, r0, ip, lsl r0
 200:	00000030 	andeq	r0, r0, r0, lsr r0
 204:	000090e4 	andeq	r9, r0, r4, ror #1
 208:	00000098 	muleq	r0, r8, r0
 20c:	8b080e42 	blhi	203b1c <_stack+0x183b1c>
 210:	42018e02 	andmi	r8, r1, #2, 28
 214:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 218:	080d0c46 	stmdaeq	sp, {r1, r2, r6, sl, fp}
 21c:	0000001c 	andeq	r0, r0, ip, lsl r0
 220:	00000030 	andeq	r0, r0, r0, lsr r0
 224:	0000917c 	andeq	r9, r0, ip, ror r1
 228:	000000e0 	andeq	r0, r0, r0, ror #1
 22c:	8b080e42 	blhi	203b3c <_stack+0x183b3c>
 230:	42018e02 	andmi	r8, r1, #2, 28
 234:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 238:	080d0c6a 	stmdaeq	sp, {r1, r3, r5, r6, sl, fp}
 23c:	0000001c 	andeq	r0, r0, ip, lsl r0
 240:	00000030 	andeq	r0, r0, r0, lsr r0
 244:	0000925c 	andeq	r9, r0, ip, asr r2
 248:	000001a0 	andeq	r0, r0, r0, lsr #3
 24c:	8b080e42 	blhi	203b5c <_stack+0x183b5c>
 250:	42018e02 	andmi	r8, r1, #2, 28
 254:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 258:	080d0cca 	stmdaeq	sp, {r1, r3, r6, r7, sl, fp}
 25c:	0000001c 	andeq	r0, r0, ip, lsl r0
 260:	00000030 	andeq	r0, r0, r0, lsr r0
 264:	000093fc 	strdeq	r9, [r0], -ip
 268:	000000e8 	andeq	r0, r0, r8, ror #1
 26c:	8b080e42 	blhi	203b7c <_stack+0x183b7c>
 270:	42018e02 	andmi	r8, r1, #2, 28
 274:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 278:	080d0c6e 	stmdaeq	sp, {r1, r2, r3, r5, r6, sl, fp}
 27c:	0000001c 	andeq	r0, r0, ip, lsl r0
 280:	00000030 	andeq	r0, r0, r0, lsr r0
 284:	000094e4 	andeq	r9, r0, r4, ror #9
 288:	00000044 	andeq	r0, r0, r4, asr #32
 28c:	8b040e42 	blhi	103b9c <_stack+0x83b9c>
 290:	0b0d4201 	bleq	350a9c <_stack+0x2d0a9c>
 294:	420d0d5a 	andmi	r0, sp, #5760	; 0x1680
 298:	00000ecb 	andeq	r0, r0, fp, asr #29
 29c:	0000001c 	andeq	r0, r0, ip, lsl r0
 2a0:	00000030 	andeq	r0, r0, r0, lsr r0
 2a4:	00009528 	andeq	r9, r0, r8, lsr #10
 2a8:	0000004c 	andeq	r0, r0, ip, asr #32
 2ac:	8b040e42 	blhi	103bbc <_stack+0x83bbc>
 2b0:	0b0d4201 	bleq	350abc <_stack+0x2d0abc>
 2b4:	420d0d5e 	andmi	r0, sp, #6016	; 0x1780
 2b8:	00000ecb 	andeq	r0, r0, fp, asr #29
 2bc:	0000001c 	andeq	r0, r0, ip, lsl r0
 2c0:	00000030 	andeq	r0, r0, r0, lsr r0
 2c4:	00009574 	andeq	r9, r0, r4, ror r5
 2c8:	00000138 	andeq	r0, r0, r8, lsr r1
 2cc:	8b080e42 	blhi	203bdc <_stack+0x183bdc>
 2d0:	42018e02 	andmi	r8, r1, #2, 28
 2d4:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 2d8:	080d0c96 	stmdaeq	sp, {r1, r2, r4, r7, sl, fp}
 2dc:	0000001c 	andeq	r0, r0, ip, lsl r0
 2e0:	00000030 	andeq	r0, r0, r0, lsr r0
 2e4:	000096ac 	andeq	r9, r0, ip, lsr #13
 2e8:	00000064 	andeq	r0, r0, r4, rrx
 2ec:	8b080e42 	blhi	203bfc <_stack+0x183bfc>
 2f0:	42018e02 	andmi	r8, r1, #2, 28
 2f4:	6c040b0c 			; <UNDEFINED> instruction: 0x6c040b0c
 2f8:	00080d0c 	andeq	r0, r8, ip, lsl #26
 2fc:	0000001c 	andeq	r0, r0, ip, lsl r0
 300:	00000030 	andeq	r0, r0, r0, lsr r0
 304:	00009710 	andeq	r9, r0, r0, lsl r7
 308:	00000138 	andeq	r0, r0, r8, lsr r1
 30c:	8b080e42 	blhi	203c1c <_stack+0x183c1c>
 310:	42018e02 	andmi	r8, r1, #2, 28
 314:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 318:	080d0c96 	stmdaeq	sp, {r1, r2, r4, r7, sl, fp}
 31c:	0000001c 	andeq	r0, r0, ip, lsl r0
 320:	00000030 	andeq	r0, r0, r0, lsr r0
 324:	00009848 	andeq	r9, r0, r8, asr #16
 328:	00000164 	andeq	r0, r0, r4, ror #2
 32c:	8b080e42 	blhi	203c3c <_stack+0x183c3c>
 330:	42018e02 	andmi	r8, r1, #2, 28
 334:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 338:	080d0cac 	stmdaeq	sp, {r2, r3, r5, r7, sl, fp}
 33c:	0000001c 	andeq	r0, r0, ip, lsl r0
 340:	00000030 	andeq	r0, r0, r0, lsr r0
 344:	000099ac 	andeq	r9, r0, ip, lsr #19
 348:	00000048 	andeq	r0, r0, r8, asr #32
 34c:	8b040e42 	blhi	103c5c <_stack+0x83c5c>
 350:	0b0d4201 	bleq	350b5c <_stack+0x2d0b5c>
 354:	420d0d5c 	andmi	r0, sp, #92, 26	; 0x1700
 358:	00000ecb 	andeq	r0, r0, fp, asr #29
 35c:	0000001c 	andeq	r0, r0, ip, lsl r0
 360:	00000030 	andeq	r0, r0, r0, lsr r0
 364:	000099f4 	strdeq	r9, [r0], -r4
 368:	00000028 	andeq	r0, r0, r8, lsr #32
 36c:	8b080e42 	blhi	203c7c <_stack+0x183c7c>
 370:	42018e02 	andmi	r8, r1, #2, 28
 374:	4e040b0c 	vmlami.f64	d0, d4, d12
 378:	00080d0c 	andeq	r0, r8, ip, lsl #26
 37c:	0000001c 	andeq	r0, r0, ip, lsl r0
 380:	00000030 	andeq	r0, r0, r0, lsr r0
 384:	00009a1c 	andeq	r9, r0, ip, lsl sl
 388:	00000050 	andeq	r0, r0, r0, asr r0
 38c:	8b080e42 	blhi	203c9c <_stack+0x183c9c>
 390:	42018e02 	andmi	r8, r1, #2, 28
 394:	62040b0c 	andvs	r0, r4, #12, 22	; 0x3000
 398:	00080d0c 	andeq	r0, r8, ip, lsl #26
 39c:	0000001c 	andeq	r0, r0, ip, lsl r0
 3a0:	00000030 	andeq	r0, r0, r0, lsr r0
 3a4:	00009a6c 	andeq	r9, r0, ip, ror #20
 3a8:	00000150 	andeq	r0, r0, r0, asr r1
 3ac:	8b080e42 	blhi	203cbc <_stack+0x183cbc>
 3b0:	42018e02 	andmi	r8, r1, #2, 28
 3b4:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 3b8:	080d0ca2 	stmdaeq	sp, {r1, r5, r7, sl, fp}
 3bc:	0000001c 	andeq	r0, r0, ip, lsl r0
 3c0:	00000030 	andeq	r0, r0, r0, lsr r0
 3c4:	00009bbc 			; <UNDEFINED> instruction: 0x00009bbc
 3c8:	00000124 	andeq	r0, r0, r4, lsr #2
 3cc:	8b040e42 	blhi	103cdc <_stack+0x83cdc>
 3d0:	0b0d4201 	bleq	350bdc <_stack+0x2d0bdc>
 3d4:	0d0d8a02 	vstreq	s16, [sp, #-8]
 3d8:	000ecb42 	andeq	ip, lr, r2, asr #22
 3dc:	00000020 	andeq	r0, r0, r0, lsr #32
 3e0:	00000030 	andeq	r0, r0, r0, lsr r0
 3e4:	00009ce0 	andeq	r9, r0, r0, ror #25
 3e8:	00000324 	andeq	r0, r0, r4, lsr #6
 3ec:	8b040e42 	blhi	103cfc <_stack+0x83cfc>
 3f0:	0b0d4201 	bleq	350bfc <_stack+0x2d0bfc>
 3f4:	0d018a03 	vstreq	s16, [r1, #-12]
 3f8:	0ecb420d 	cdpeq	2, 12, cr4, cr11, cr13, {0}
 3fc:	00000000 	andeq	r0, r0, r0
 400:	00000020 	andeq	r0, r0, r0, lsr #32
 404:	00000030 	andeq	r0, r0, r0, lsr r0
 408:	0000a004 	andeq	sl, r0, r4
 40c:	000002e0 	andeq	r0, r0, r0, ror #5
 410:	8b080e42 	blhi	203d20 <_stack+0x183d20>
 414:	42018e02 	andmi	r8, r1, #2, 28
 418:	03040b0c 	movweq	r0, #19212	; 0x4b0c
 41c:	0d0c016a 	stfeqs	f0, [ip, #-424]	; 0xfffffe58
 420:	00000008 	andeq	r0, r0, r8
 424:	0000001c 	andeq	r0, r0, ip, lsl r0
 428:	00000030 	andeq	r0, r0, r0, lsr r0
 42c:	0000a2e4 	andeq	sl, r0, r4, ror #5
 430:	000000ac 	andeq	r0, r0, ip, lsr #1
 434:	8b080e42 	blhi	203d44 <_stack+0x183d44>
 438:	42018e02 	andmi	r8, r1, #2, 28
 43c:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 440:	080d0c50 	stmdaeq	sp, {r4, r6, sl, fp}
 444:	0000001c 	andeq	r0, r0, ip, lsl r0
 448:	00000030 	andeq	r0, r0, r0, lsr r0
 44c:	0000a390 	muleq	r0, r0, r3
 450:	00000060 	andeq	r0, r0, r0, rrx
 454:	8b080e42 	blhi	203d64 <_stack+0x183d64>
 458:	42018e02 	andmi	r8, r1, #2, 28
 45c:	6a040b0c 	bvs	103094 <_stack+0x83094>
 460:	00080d0c 	andeq	r0, r8, ip, lsl #26
 464:	0000001c 	andeq	r0, r0, ip, lsl r0
 468:	00000030 	andeq	r0, r0, r0, lsr r0
 46c:	0000a3f0 	strdeq	sl, [r0], -r0
 470:	00000068 	andeq	r0, r0, r8, rrx
 474:	8b080e42 	blhi	203d84 <_stack+0x183d84>
 478:	42018e02 	andmi	r8, r1, #2, 28
 47c:	6e040b0c 	vmlavs.f64	d0, d4, d12
 480:	00080d0c 	andeq	r0, r8, ip, lsl #26
 484:	0000001c 	andeq	r0, r0, ip, lsl r0
 488:	00000030 	andeq	r0, r0, r0, lsr r0
 48c:	0000a458 	andeq	sl, r0, r8, asr r4
 490:	00000034 	andeq	r0, r0, r4, lsr r0
 494:	8b080e42 	blhi	203da4 <_stack+0x183da4>
 498:	42018e02 	andmi	r8, r1, #2, 28
 49c:	54040b0c 	strpl	r0, [r4], #-2828	; 0xfffff4f4
 4a0:	00080d0c 	andeq	r0, r8, ip, lsl #26
 4a4:	0000001c 	andeq	r0, r0, ip, lsl r0
 4a8:	00000030 	andeq	r0, r0, r0, lsr r0
 4ac:	0000a48c 	andeq	sl, r0, ip, lsl #9
 4b0:	000000c0 	andeq	r0, r0, r0, asr #1
 4b4:	8b080e42 	blhi	203dc4 <_stack+0x183dc4>
 4b8:	42018e02 	andmi	r8, r1, #2, 28
 4bc:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 4c0:	080d0c5a 	stmdaeq	sp, {r1, r3, r4, r6, sl, fp}
 4c4:	0000001c 	andeq	r0, r0, ip, lsl r0
 4c8:	00000030 	andeq	r0, r0, r0, lsr r0
 4cc:	0000a54c 	andeq	sl, r0, ip, asr #10
 4d0:	00000068 	andeq	r0, r0, r8, rrx
 4d4:	8b080e42 	blhi	203de4 <_stack+0x183de4>
 4d8:	42018e02 	andmi	r8, r1, #2, 28
 4dc:	6e040b0c 	vmlavs.f64	d0, d4, d12
 4e0:	00080d0c 	andeq	r0, r8, ip, lsl #26
 4e4:	0000001c 	andeq	r0, r0, ip, lsl r0
 4e8:	00000030 	andeq	r0, r0, r0, lsr r0
 4ec:	0000a5b4 			; <UNDEFINED> instruction: 0x0000a5b4
 4f0:	0000007c 	andeq	r0, r0, ip, ror r0
 4f4:	8b080e42 	blhi	203e04 <_stack+0x183e04>
 4f8:	42018e02 	andmi	r8, r1, #2, 28
 4fc:	78040b0c 	stmdavc	r4, {r2, r3, r8, r9, fp}
 500:	00080d0c 	andeq	r0, r8, ip, lsl #26
 504:	00000020 	andeq	r0, r0, r0, lsr #32
 508:	00000030 	andeq	r0, r0, r0, lsr r0
 50c:	0000a630 	andeq	sl, r0, r0, lsr r6
 510:	00000648 	andeq	r0, r0, r8, asr #12
 514:	8b080e42 	blhi	203e24 <_stack+0x183e24>
 518:	42018e02 	andmi	r8, r1, #2, 28
 51c:	03040b0c 	movweq	r0, #19212	; 0x4b0c
 520:	0d0c031e 	stceq	3, cr0, [ip, #-120]	; 0xffffff88
 524:	00000008 	andeq	r0, r0, r8
 528:	0000001c 	andeq	r0, r0, ip, lsl r0
 52c:	00000030 	andeq	r0, r0, r0, lsr r0
 530:	0000ac78 	andeq	sl, r0, r8, ror ip
 534:	000000b8 	strheq	r0, [r0], -r8
 538:	8b040e42 	blhi	103e48 <_stack+0x83e48>
 53c:	0b0d4201 	bleq	350d48 <_stack+0x2d0d48>
 540:	0d0d5402 	cfstrseq	mvf5, [sp, #-8]
 544:	000ecb42 	andeq	ip, lr, r2, asr #22
 548:	00000020 	andeq	r0, r0, r0, lsr #32
 54c:	00000030 	andeq	r0, r0, r0, lsr r0
 550:	0000ad30 	andeq	sl, r0, r0, lsr sp
 554:	00000a2c 	andeq	r0, r0, ip, lsr #20
 558:	8b080e42 	blhi	203e68 <_stack+0x183e68>
 55c:	42018e02 	andmi	r8, r1, #2, 28
 560:	03040b0c 	movweq	r0, #19212	; 0x4b0c
 564:	0d0c0510 	cfstr32eq	mvfx0, [ip, #-64]	; 0xffffffc0
 568:	00000008 	andeq	r0, r0, r8
 56c:	00000020 	andeq	r0, r0, r0, lsr #32
 570:	00000030 	andeq	r0, r0, r0, lsr r0
 574:	0000b75c 	andeq	fp, r0, ip, asr r7
 578:	00000234 	andeq	r0, r0, r4, lsr r2
 57c:	8b080e42 	blhi	203e8c <_stack+0x183e8c>
 580:	42018e02 	andmi	r8, r1, #2, 28
 584:	03040b0c 	movweq	r0, #19212	; 0x4b0c
 588:	0d0c0114 	stfeqs	f0, [ip, #-80]	; 0xffffffb0
 58c:	00000008 	andeq	r0, r0, r8
 590:	00000020 	andeq	r0, r0, r0, lsr #32
 594:	00000030 	andeq	r0, r0, r0, lsr r0
 598:	0000b990 	muleq	r0, r0, r9
 59c:	00000214 	andeq	r0, r0, r4, lsl r2
 5a0:	8b080e42 	blhi	203eb0 <_stack+0x183eb0>
 5a4:	42018e02 	andmi	r8, r1, #2, 28
 5a8:	03040b0c 	movweq	r0, #19212	; 0x4b0c
 5ac:	0d0c0104 	stfeqs	f0, [ip, #-16]
 5b0:	00000008 	andeq	r0, r0, r8
 5b4:	0000001c 	andeq	r0, r0, ip, lsl r0
 5b8:	00000030 	andeq	r0, r0, r0, lsr r0
 5bc:	0000bba4 	andeq	fp, r0, r4, lsr #23
 5c0:	0000016c 	andeq	r0, r0, ip, ror #2
 5c4:	8b080e42 	blhi	203ed4 <_stack+0x183ed4>
 5c8:	42018e02 	andmi	r8, r1, #2, 28
 5cc:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 5d0:	080d0cb0 	stmdaeq	sp, {r4, r5, r7, sl, fp}
 5d4:	0000001c 	andeq	r0, r0, ip, lsl r0
 5d8:	00000030 	andeq	r0, r0, r0, lsr r0
 5dc:	0000bd10 	andeq	fp, r0, r0, lsl sp
 5e0:	00000160 	andeq	r0, r0, r0, ror #2
 5e4:	8b080e42 	blhi	203ef4 <_stack+0x183ef4>
 5e8:	42018e02 	andmi	r8, r1, #2, 28
 5ec:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 5f0:	080d0caa 	stmdaeq	sp, {r1, r3, r5, r7, sl, fp}
 5f4:	0000001c 	andeq	r0, r0, ip, lsl r0
 5f8:	00000030 	andeq	r0, r0, r0, lsr r0
 5fc:	0000be70 	andeq	fp, r0, r0, ror lr
 600:	000000dc 	ldrdeq	r0, [r0], -ip
 604:	8b080e42 	blhi	203f14 <_stack+0x183f14>
 608:	42018e02 	andmi	r8, r1, #2, 28
 60c:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 610:	080d0c68 	stmdaeq	sp, {r3, r5, r6, sl, fp}
 614:	00000020 	andeq	r0, r0, r0, lsr #32
 618:	00000030 	andeq	r0, r0, r0, lsr r0
 61c:	0000bf4c 	andeq	fp, r0, ip, asr #30
 620:	0000022c 	andeq	r0, r0, ip, lsr #4
 624:	8b080e42 	blhi	203f34 <_stack+0x183f34>
 628:	42018e02 	andmi	r8, r1, #2, 28
 62c:	03040b0c 	movweq	r0, #19212	; 0x4b0c
 630:	0d0c0110 	stfeqs	f0, [ip, #-64]	; 0xffffffc0
 634:	00000008 	andeq	r0, r0, r8
 638:	00000020 	andeq	r0, r0, r0, lsr #32
 63c:	00000030 	andeq	r0, r0, r0, lsr r0
 640:	0000c178 	andeq	ip, r0, r8, ror r1
 644:	0000020c 	andeq	r0, r0, ip, lsl #4
 648:	8b080e42 	blhi	203f58 <_stack+0x183f58>
 64c:	42018e02 	andmi	r8, r1, #2, 28
 650:	03040b0c 	movweq	r0, #19212	; 0x4b0c
 654:	0d0c0100 	stfeqs	f0, [ip, #-0]
 658:	00000008 	andeq	r0, r0, r8
 65c:	0000001c 	andeq	r0, r0, ip, lsl r0
 660:	00000030 	andeq	r0, r0, r0, lsr r0
 664:	0000c384 	andeq	ip, r0, r4, lsl #7
 668:	000001d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 66c:	8b080e42 	blhi	203f7c <_stack+0x183f7c>
 670:	42018e02 	andmi	r8, r1, #2, 28
 674:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 678:	080d0ce2 	stmdaeq	sp, {r1, r5, r6, r7, sl, fp}
 67c:	0000001c 	andeq	r0, r0, ip, lsl r0
 680:	00000030 	andeq	r0, r0, r0, lsr r0
 684:	0000c554 	andeq	ip, r0, r4, asr r5
 688:	000001a8 	andeq	r0, r0, r8, lsr #3
 68c:	8b080e42 	blhi	203f9c <_stack+0x183f9c>
 690:	42018e02 	andmi	r8, r1, #2, 28
 694:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 698:	080d0cce 	stmdaeq	sp, {r1, r2, r3, r6, r7, sl, fp}
 69c:	0000001c 	andeq	r0, r0, ip, lsl r0
 6a0:	00000030 	andeq	r0, r0, r0, lsr r0
 6a4:	0000c6fc 	strdeq	ip, [r0], -ip	; <UNPREDICTABLE>
 6a8:	0000014c 	andeq	r0, r0, ip, asr #2
 6ac:	8b080e42 	blhi	203fbc <_stack+0x183fbc>
 6b0:	42018e02 	andmi	r8, r1, #2, 28
 6b4:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 6b8:	080d0ca0 	stmdaeq	sp, {r5, r7, sl, fp}
 6bc:	00000020 	andeq	r0, r0, r0, lsr #32
 6c0:	00000030 	andeq	r0, r0, r0, lsr r0
 6c4:	0000c848 	andeq	ip, r0, r8, asr #16
 6c8:	00000234 	andeq	r0, r0, r4, lsr r2
 6cc:	8b080e42 	blhi	203fdc <_stack+0x183fdc>
 6d0:	42018e02 	andmi	r8, r1, #2, 28
 6d4:	03040b0c 	movweq	r0, #19212	; 0x4b0c
 6d8:	0d0c0114 	stfeqs	f0, [ip, #-80]	; 0xffffffb0
 6dc:	00000008 	andeq	r0, r0, r8
 6e0:	0000001c 	andeq	r0, r0, ip, lsl r0
 6e4:	00000030 	andeq	r0, r0, r0, lsr r0
 6e8:	0000ca7c 	andeq	ip, r0, ip, ror sl
 6ec:	000000ac 	andeq	r0, r0, ip, lsr #1
 6f0:	8b080e42 	blhi	204000 <_stack+0x184000>
 6f4:	42018e02 	andmi	r8, r1, #2, 28
 6f8:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 6fc:	080d0c50 	stmdaeq	sp, {r4, r6, sl, fp}
 700:	0000001c 	andeq	r0, r0, ip, lsl r0
 704:	00000030 	andeq	r0, r0, r0, lsr r0
 708:	0000cb28 	andeq	ip, r0, r8, lsr #22
 70c:	000000dc 	ldrdeq	r0, [r0], -ip
 710:	8b080e42 	blhi	204020 <_stack+0x184020>
 714:	42018e02 	andmi	r8, r1, #2, 28
 718:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 71c:	080d0c68 	stmdaeq	sp, {r3, r5, r6, sl, fp}
 720:	0000001c 	andeq	r0, r0, ip, lsl r0
 724:	00000030 	andeq	r0, r0, r0, lsr r0
 728:	0000cc04 	andeq	ip, r0, r4, lsl #24
 72c:	00000058 	andeq	r0, r0, r8, asr r0
 730:	8b080e42 	blhi	204040 <_stack+0x184040>
 734:	42018e02 	andmi	r8, r1, #2, 28
 738:	66040b0c 	strvs	r0, [r4], -ip, lsl #22
 73c:	00080d0c 	andeq	r0, r8, ip, lsl #26
 740:	0000001c 	andeq	r0, r0, ip, lsl r0
 744:	00000030 	andeq	r0, r0, r0, lsr r0
 748:	0000cc5c 	andeq	ip, r0, ip, asr ip
 74c:	000001b8 			; <UNDEFINED> instruction: 0x000001b8
 750:	8b080e42 	blhi	204060 <_stack+0x184060>
 754:	42018e02 	andmi	r8, r1, #2, 28
 758:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 75c:	080d0cd6 	stmdaeq	sp, {r1, r2, r4, r6, r7, sl, fp}
 760:	0000001c 	andeq	r0, r0, ip, lsl r0
 764:	00000030 	andeq	r0, r0, r0, lsr r0
 768:	0000ce14 	andeq	ip, r0, r4, lsl lr
 76c:	00000188 	andeq	r0, r0, r8, lsl #3
 770:	8b080e42 	blhi	204080 <_stack+0x184080>
 774:	42018e02 	andmi	r8, r1, #2, 28
 778:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 77c:	080d0cbe 	stmdaeq	sp, {r1, r2, r3, r4, r5, r7, sl, fp}
 780:	0000001c 	andeq	r0, r0, ip, lsl r0
 784:	00000030 	andeq	r0, r0, r0, lsr r0
 788:	0000cf9c 	muleq	r0, ip, pc	; <UNPREDICTABLE>
 78c:	00000158 	andeq	r0, r0, r8, asr r1
 790:	8b080e42 	blhi	2040a0 <_stack+0x1840a0>
 794:	42018e02 	andmi	r8, r1, #2, 28
 798:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 79c:	080d0ca6 	stmdaeq	sp, {r1, r2, r5, r7, sl, fp}
 7a0:	0000001c 	andeq	r0, r0, ip, lsl r0
 7a4:	00000030 	andeq	r0, r0, r0, lsr r0
 7a8:	0000d0f4 	strdeq	sp, [r0], -r4
 7ac:	00000120 	andeq	r0, r0, r0, lsr #2
 7b0:	8b080e42 	blhi	2040c0 <_stack+0x1840c0>
 7b4:	42018e02 	andmi	r8, r1, #2, 28
 7b8:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 7bc:	080d0c8a 	stmdaeq	sp, {r1, r3, r7, sl, fp}
 7c0:	0000001c 	andeq	r0, r0, ip, lsl r0
 7c4:	00000030 	andeq	r0, r0, r0, lsr r0
 7c8:	0000d214 	andeq	sp, r0, r4, lsl r2
 7cc:	000000c4 	andeq	r0, r0, r4, asr #1
 7d0:	8b080e42 	blhi	2040e0 <_stack+0x1840e0>
 7d4:	42018e02 	andmi	r8, r1, #2, 28
 7d8:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 7dc:	080d0c5c 	stmdaeq	sp, {r2, r3, r4, r6, sl, fp}
 7e0:	0000001c 	andeq	r0, r0, ip, lsl r0
 7e4:	00000030 	andeq	r0, r0, r0, lsr r0
 7e8:	0000d2d8 	ldrdeq	sp, [r0], -r8
 7ec:	00000064 	andeq	r0, r0, r4, rrx
 7f0:	8b040e42 	blhi	104100 <_stack+0x84100>
 7f4:	0b0d4201 	bleq	351000 <_stack+0x2d1000>
 7f8:	420d0d6a 	andmi	r0, sp, #6784	; 0x1a80
 7fc:	00000ecb 	andeq	r0, r0, fp, asr #29
 800:	0000001c 	andeq	r0, r0, ip, lsl r0
 804:	00000030 	andeq	r0, r0, r0, lsr r0
 808:	0000d33c 	andeq	sp, r0, ip, lsr r3
 80c:	0000017c 	andeq	r0, r0, ip, ror r1
 810:	8b080e42 	blhi	204120 <_stack+0x184120>
 814:	42018e02 	andmi	r8, r1, #2, 28
 818:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 81c:	080d0cb8 	stmdaeq	sp, {r3, r4, r5, r7, sl, fp}
 820:	0000001c 	andeq	r0, r0, ip, lsl r0
 824:	00000030 	andeq	r0, r0, r0, lsr r0
 828:	0000d4b8 			; <UNDEFINED> instruction: 0x0000d4b8
 82c:	000001b4 			; <UNDEFINED> instruction: 0x000001b4
 830:	8b080e42 	blhi	204140 <_stack+0x184140>
 834:	42018e02 	andmi	r8, r1, #2, 28
 838:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 83c:	080d0cd4 	stmdaeq	sp, {r2, r4, r6, r7, sl, fp}
 840:	00000020 	andeq	r0, r0, r0, lsr #32
 844:	00000030 	andeq	r0, r0, r0, lsr r0
 848:	0000d66c 	andeq	sp, r0, ip, ror #12
 84c:	00000290 	muleq	r0, r0, r2
 850:	8b080e42 	blhi	204160 <_stack+0x184160>
 854:	42018e02 	andmi	r8, r1, #2, 28
 858:	03040b0c 	movweq	r0, #19212	; 0x4b0c
 85c:	0d0c0142 	stfeqs	f0, [ip, #-264]	; 0xfffffef8
 860:	00000008 	andeq	r0, r0, r8
 864:	0000001c 	andeq	r0, r0, ip, lsl r0
 868:	00000030 	andeq	r0, r0, r0, lsr r0
 86c:	0000d8fc 	strdeq	sp, [r0], -ip
 870:	000001d4 	ldrdeq	r0, [r0], -r4
 874:	8b040e42 	blhi	104184 <_stack+0x84184>
 878:	0b0d4201 	bleq	351084 <_stack+0x2d1084>
 87c:	0d0de202 	sfmeq	f6, 1, [sp, #-8]
 880:	000ecb42 	andeq	ip, lr, r2, asr #22
 884:	00000020 	andeq	r0, r0, r0, lsr #32
 888:	00000030 	andeq	r0, r0, r0, lsr r0
 88c:	0000dad0 	ldrdeq	sp, [r0], -r0
 890:	0000020c 	andeq	r0, r0, ip, lsl #4
 894:	8b080e42 	blhi	2041a4 <_stack+0x1841a4>
 898:	42018e02 	andmi	r8, r1, #2, 28
 89c:	03040b0c 	movweq	r0, #19212	; 0x4b0c
 8a0:	0d0c0100 	stfeqs	f0, [ip, #-0]
 8a4:	00000008 	andeq	r0, r0, r8
 8a8:	00000020 	andeq	r0, r0, r0, lsr #32
 8ac:	00000030 	andeq	r0, r0, r0, lsr r0
 8b0:	0000dcdc 	ldrdeq	sp, [r0], -ip
 8b4:	0000026c 	andeq	r0, r0, ip, ror #4
 8b8:	8b080e42 	blhi	2041c8 <_stack+0x1841c8>
 8bc:	42018e02 	andmi	r8, r1, #2, 28
 8c0:	03040b0c 	movweq	r0, #19212	; 0x4b0c
 8c4:	0d0c0130 	stfeqs	f0, [ip, #-192]	; 0xffffff40
 8c8:	00000008 	andeq	r0, r0, r8
 8cc:	0000001c 	andeq	r0, r0, ip, lsl r0
 8d0:	00000030 	andeq	r0, r0, r0, lsr r0
 8d4:	0000df48 	andeq	sp, r0, r8, asr #30
 8d8:	00000164 	andeq	r0, r0, r4, ror #2
 8dc:	8b080e42 	blhi	2041ec <_stack+0x1841ec>
 8e0:	42018e02 	andmi	r8, r1, #2, 28
 8e4:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 8e8:	080d0cac 	stmdaeq	sp, {r2, r3, r5, r7, sl, fp}
 8ec:	00000020 	andeq	r0, r0, r0, lsr #32
 8f0:	00000030 	andeq	r0, r0, r0, lsr r0
 8f4:	0000e0ac 	andeq	lr, r0, ip, lsr #1
 8f8:	0000022c 	andeq	r0, r0, ip, lsr #4
 8fc:	8b080e42 	blhi	20420c <_stack+0x18420c>
 900:	42018e02 	andmi	r8, r1, #2, 28
 904:	03040b0c 	movweq	r0, #19212	; 0x4b0c
 908:	0d0c0110 	stfeqs	f0, [ip, #-64]	; 0xffffffc0
 90c:	00000008 	andeq	r0, r0, r8
 910:	0000001c 	andeq	r0, r0, ip, lsl r0
 914:	00000030 	andeq	r0, r0, r0, lsr r0
 918:	0000e2d8 	ldrdeq	lr, [r0], -r8
 91c:	000000b8 	strheq	r0, [r0], -r8
 920:	8b080e42 	blhi	204230 <_stack+0x184230>
 924:	42018e02 	andmi	r8, r1, #2, 28
 928:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 92c:	080d0c56 	stmdaeq	sp, {r1, r2, r4, r6, sl, fp}
 930:	0000001c 	andeq	r0, r0, ip, lsl r0
 934:	00000030 	andeq	r0, r0, r0, lsr r0
 938:	0000e390 	muleq	r0, r0, r3
 93c:	000000c4 	andeq	r0, r0, r4, asr #1
 940:	8b080e42 	blhi	204250 <_stack+0x184250>
 944:	42018e02 	andmi	r8, r1, #2, 28
 948:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 94c:	080d0c5c 	stmdaeq	sp, {r2, r3, r4, r6, sl, fp}
 950:	00000020 	andeq	r0, r0, r0, lsr #32
 954:	00000030 	andeq	r0, r0, r0, lsr r0
 958:	0000e454 	andeq	lr, r0, r4, asr r4
 95c:	000002b4 			; <UNDEFINED> instruction: 0x000002b4
 960:	8b080e42 	blhi	204270 <_stack+0x184270>
 964:	42018e02 	andmi	r8, r1, #2, 28
 968:	03040b0c 	movweq	r0, #19212	; 0x4b0c
 96c:	0d0c0154 	stfeqs	f0, [ip, #-336]	; 0xfffffeb0
 970:	00000008 	andeq	r0, r0, r8
 974:	00000020 	andeq	r0, r0, r0, lsr #32
 978:	00000030 	andeq	r0, r0, r0, lsr r0
 97c:	0000e708 	andeq	lr, r0, r8, lsl #14
 980:	00000230 	andeq	r0, r0, r0, lsr r2
 984:	8b080e42 	blhi	204294 <_stack+0x184294>
 988:	42018e02 	andmi	r8, r1, #2, 28
 98c:	03040b0c 	movweq	r0, #19212	; 0x4b0c
 990:	0d0c0112 	stfeqs	f0, [ip, #-72]	; 0xffffffb8
 994:	00000008 	andeq	r0, r0, r8
 998:	00000020 	andeq	r0, r0, r0, lsr #32
 99c:	00000030 	andeq	r0, r0, r0, lsr r0
 9a0:	0000e938 	andeq	lr, r0, r8, lsr r9
 9a4:	000002b0 			; <UNDEFINED> instruction: 0x000002b0
 9a8:	8b080e42 	blhi	2042b8 <_stack+0x1842b8>
 9ac:	42018e02 	andmi	r8, r1, #2, 28
 9b0:	03040b0c 	movweq	r0, #19212	; 0x4b0c
 9b4:	0d0c0152 	stfeqs	f0, [ip, #-328]	; 0xfffffeb8
 9b8:	00000008 	andeq	r0, r0, r8
 9bc:	00000018 	andeq	r0, r0, r8, lsl r0
 9c0:	00000030 	andeq	r0, r0, r0, lsr r0
 9c4:	0000ebe8 	andeq	lr, r0, r8, ror #23
 9c8:	0000002c 	andeq	r0, r0, ip, lsr #32
 9cc:	8b080e42 	blhi	2042dc <_stack+0x1842dc>
 9d0:	42018e02 	andmi	r8, r1, #2, 28
 9d4:	00040b0c 	andeq	r0, r4, ip, lsl #22
 9d8:	0000001c 	andeq	r0, r0, ip, lsl r0
 9dc:	00000030 	andeq	r0, r0, r0, lsr r0
 9e0:	0000ec14 	andeq	lr, r0, r4, lsl ip
 9e4:	000000e8 	andeq	r0, r0, r8, ror #1
 9e8:	8b080e42 	blhi	2042f8 <_stack+0x1842f8>
 9ec:	42018e02 	andmi	r8, r1, #2, 28
 9f0:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 9f4:	080d0c6e 	stmdaeq	sp, {r1, r2, r3, r5, r6, sl, fp}
 9f8:	0000000c 	andeq	r0, r0, ip
 9fc:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 a00:	7c020001 	stcvc	0, cr0, [r2], {1}
 a04:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 a08:	0000001c 	andeq	r0, r0, ip, lsl r0
 a0c:	000009f8 	strdeq	r0, [r0], -r8
 a10:	0000ecfc 	strdeq	lr, [r0], -ip
 a14:	00000024 	andeq	r0, r0, r4, lsr #32
 a18:	8b040e42 	blhi	104328 <_stack+0x84328>
 a1c:	0b0d4201 	bleq	351228 <_stack+0x2d1228>
 a20:	420d0d4a 	andmi	r0, sp, #4736	; 0x1280
 a24:	00000ecb 	andeq	r0, r0, fp, asr #29
 a28:	0000001c 	andeq	r0, r0, ip, lsl r0
 a2c:	000009f8 	strdeq	r0, [r0], -r8
 a30:	0000ed20 	andeq	lr, r0, r0, lsr #26
 a34:	00000018 	andeq	r0, r0, r8, lsl r0
 a38:	8b040e42 	blhi	104348 <_stack+0x84348>
 a3c:	0b0d4201 	bleq	351248 <_stack+0x2d1248>
 a40:	420d0d44 	andmi	r0, sp, #68, 26	; 0x1100
 a44:	00000ecb 	andeq	r0, r0, fp, asr #29
 a48:	0000000c 	andeq	r0, r0, ip
 a4c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 a50:	7c020001 	stcvc	0, cr0, [r2], {1}
 a54:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 a58:	0000001c 	andeq	r0, r0, ip, lsl r0
 a5c:	00000a48 	andeq	r0, r0, r8, asr #20
 a60:	0000ed38 	andeq	lr, r0, r8, lsr sp
 a64:	00000024 	andeq	r0, r0, r4, lsr #32
 a68:	8b040e42 	blhi	104378 <_stack+0x84378>
 a6c:	0b0d4201 	bleq	351278 <_stack+0x2d1278>
 a70:	420d0d4a 	andmi	r0, sp, #4736	; 0x1280
 a74:	00000ecb 	andeq	r0, r0, fp, asr #29
 a78:	0000001c 	andeq	r0, r0, ip, lsl r0
 a7c:	00000a48 	andeq	r0, r0, r8, asr #20
 a80:	0000ed5c 	andeq	lr, r0, ip, asr sp
 a84:	0000019c 	muleq	r0, ip, r1
 a88:	8b080e42 	blhi	204398 <_stack+0x184398>
 a8c:	42018e02 	andmi	r8, r1, #2, 28
 a90:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 a94:	080d0cc8 	stmdaeq	sp, {r3, r6, r7, sl, fp}
 a98:	0000001c 	andeq	r0, r0, ip, lsl r0
 a9c:	00000a48 	andeq	r0, r0, r8, asr #20
 aa0:	0000eef8 	strdeq	lr, [r0], -r8
 aa4:	00000064 	andeq	r0, r0, r4, rrx
 aa8:	8b080e42 	blhi	2043b8 <_stack+0x1843b8>
 aac:	42018e02 	andmi	r8, r1, #2, 28
 ab0:	6c040b0c 			; <UNDEFINED> instruction: 0x6c040b0c
 ab4:	00080d0c 	andeq	r0, r8, ip, lsl #26
 ab8:	0000001c 	andeq	r0, r0, ip, lsl r0
 abc:	00000a48 	andeq	r0, r0, r8, asr #20
 ac0:	0000ef5c 	andeq	lr, r0, ip, asr pc
 ac4:	0000004c 	andeq	r0, r0, ip, asr #32
 ac8:	8b040e42 	blhi	1043d8 <_stack+0x843d8>
 acc:	0b0d4201 	bleq	3512d8 <_stack+0x2d12d8>
 ad0:	420d0d5e 	andmi	r0, sp, #6016	; 0x1780
 ad4:	00000ecb 	andeq	r0, r0, fp, asr #29
 ad8:	0000001c 	andeq	r0, r0, ip, lsl r0
 adc:	00000a48 	andeq	r0, r0, r8, asr #20
 ae0:	0000efa8 	andeq	lr, r0, r8, lsr #31
 ae4:	0000004c 	andeq	r0, r0, ip, asr #32
 ae8:	8b080e42 	blhi	2043f8 <_stack+0x1843f8>
 aec:	42018e02 	andmi	r8, r1, #2, 28
 af0:	60040b0c 	andvs	r0, r4, ip, lsl #22
 af4:	00080d0c 	andeq	r0, r8, ip, lsl #26
 af8:	0000001c 	andeq	r0, r0, ip, lsl r0
 afc:	00000a48 	andeq	r0, r0, r8, asr #20
 b00:	0000eff4 	strdeq	lr, [r0], -r4
 b04:	000000c0 	andeq	r0, r0, r0, asr #1
 b08:	8b080e42 	blhi	204418 <_stack+0x184418>
 b0c:	42018e02 	andmi	r8, r1, #2, 28
 b10:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 b14:	080d0c5a 	stmdaeq	sp, {r1, r3, r4, r6, sl, fp}
 b18:	0000001c 	andeq	r0, r0, ip, lsl r0
 b1c:	00000a48 	andeq	r0, r0, r8, asr #20
 b20:	0000f0b4 	strheq	pc, [r0], -r4	; <UNPREDICTABLE>
 b24:	0000002c 	andeq	r0, r0, ip, lsr #32
 b28:	8b080e42 	blhi	204438 <_stack+0x184438>
 b2c:	42018e02 	andmi	r8, r1, #2, 28
 b30:	50040b0c 	andpl	r0, r4, ip, lsl #22
 b34:	00080d0c 	andeq	r0, r8, ip, lsl #26
 b38:	00000018 	andeq	r0, r0, r8, lsl r0
 b3c:	00000a48 	andeq	r0, r0, r8, asr #20
 b40:	0000f0e0 	andeq	pc, r0, r0, ror #1
 b44:	00000018 	andeq	r0, r0, r8, lsl r0
 b48:	8b080e42 	blhi	204458 <_stack+0x184458>
 b4c:	42018e02 	andmi	r8, r1, #2, 28
 b50:	00040b0c 	andeq	r0, r4, ip, lsl #22
 b54:	0000000c 	andeq	r0, r0, ip
 b58:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 b5c:	7c020001 	stcvc	0, cr0, [r2], {1}
 b60:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 b64:	0000001c 	andeq	r0, r0, ip, lsl r0
 b68:	00000b54 	andeq	r0, r0, r4, asr fp
 b6c:	0000f0f8 	strdeq	pc, [r0], -r8
 b70:	00000024 	andeq	r0, r0, r4, lsr #32
 b74:	8b040e42 	blhi	104484 <_stack+0x84484>
 b78:	0b0d4201 	bleq	351384 <_stack+0x2d1384>
 b7c:	420d0d4a 	andmi	r0, sp, #4736	; 0x1280
 b80:	00000ecb 	andeq	r0, r0, fp, asr #29
 b84:	0000001c 	andeq	r0, r0, ip, lsl r0
 b88:	00000b54 	andeq	r0, r0, r4, asr fp
 b8c:	0000f11c 	andeq	pc, r0, ip, lsl r1	; <UNPREDICTABLE>
 b90:	0000010c 	andeq	r0, r0, ip, lsl #2
 b94:	8b040e42 	blhi	1044a4 <_stack+0x844a4>
 b98:	0b0d4201 	bleq	3513a4 <_stack+0x2d13a4>
 b9c:	0d0d7e02 	stceq	14, cr7, [sp, #-8]
 ba0:	000ecb42 	andeq	ip, lr, r2, asr #22
 ba4:	0000001c 	andeq	r0, r0, ip, lsl r0
 ba8:	00000b54 	andeq	r0, r0, r4, asr fp
 bac:	0000f228 	andeq	pc, r0, r8, lsr #4
 bb0:	00000030 	andeq	r0, r0, r0, lsr r0
 bb4:	8b080e42 	blhi	2044c4 <_stack+0x1844c4>
 bb8:	42018e02 	andmi	r8, r1, #2, 28
 bbc:	52040b0c 	andpl	r0, r4, #12, 22	; 0x3000
 bc0:	00080d0c 	andeq	r0, r8, ip, lsl #26
 bc4:	0000001c 	andeq	r0, r0, ip, lsl r0
 bc8:	00000b54 	andeq	r0, r0, r4, asr fp
 bcc:	0000f258 	andeq	pc, r0, r8, asr r2	; <UNPREDICTABLE>
 bd0:	00000030 	andeq	r0, r0, r0, lsr r0
 bd4:	8b080e42 	blhi	2044e4 <_stack+0x1844e4>
 bd8:	42018e02 	andmi	r8, r1, #2, 28
 bdc:	52040b0c 	andpl	r0, r4, #12, 22	; 0x3000
 be0:	00080d0c 	andeq	r0, r8, ip, lsl #26
 be4:	0000001c 	andeq	r0, r0, ip, lsl r0
 be8:	00000b54 	andeq	r0, r0, r4, asr fp
 bec:	0000f288 	andeq	pc, r0, r8, lsl #5
 bf0:	000000d4 	ldrdeq	r0, [r0], -r4
 bf4:	8b040e42 	blhi	104504 <_stack+0x84504>
 bf8:	0b0d4201 	bleq	351404 <_stack+0x2d1404>
 bfc:	0d0d6202 	sfmeq	f6, 4, [sp, #-8]
 c00:	000ecb42 	andeq	ip, lr, r2, asr #22
 c04:	0000001c 	andeq	r0, r0, ip, lsl r0
 c08:	00000b54 	andeq	r0, r0, r4, asr fp
 c0c:	0000f35c 	andeq	pc, r0, ip, asr r3	; <UNPREDICTABLE>
 c10:	00000054 	andeq	r0, r0, r4, asr r0
 c14:	8b080e42 	blhi	204524 <_stack+0x184524>
 c18:	42018e02 	andmi	r8, r1, #2, 28
 c1c:	64040b0c 	strvs	r0, [r4], #-2828	; 0xfffff4f4
 c20:	00080d0c 	andeq	r0, r8, ip, lsl #26
 c24:	0000001c 	andeq	r0, r0, ip, lsl r0
 c28:	00000b54 	andeq	r0, r0, r4, asr fp
 c2c:	0000f3b0 			; <UNDEFINED> instruction: 0x0000f3b0
 c30:	00000088 	andeq	r0, r0, r8, lsl #1
 c34:	8b040e42 	blhi	104544 <_stack+0x84544>
 c38:	0b0d4201 	bleq	351444 <_stack+0x2d1444>
 c3c:	420d0d7c 	andmi	r0, sp, #124, 26	; 0x1f00
 c40:	00000ecb 	andeq	r0, r0, fp, asr #29
 c44:	0000001c 	andeq	r0, r0, ip, lsl r0
 c48:	00000b54 	andeq	r0, r0, r4, asr fp
 c4c:	0000f438 	andeq	pc, r0, r8, lsr r4	; <UNPREDICTABLE>
 c50:	00000088 	andeq	r0, r0, r8, lsl #1
 c54:	8b040e42 	blhi	104564 <_stack+0x84564>
 c58:	0b0d4201 	bleq	351464 <_stack+0x2d1464>
 c5c:	420d0d7c 	andmi	r0, sp, #124, 26	; 0x1f00
 c60:	00000ecb 	andeq	r0, r0, fp, asr #29
 c64:	0000001c 	andeq	r0, r0, ip, lsl r0
 c68:	00000b54 	andeq	r0, r0, r4, asr fp
 c6c:	0000f4c0 	andeq	pc, r0, r0, asr #9
 c70:	00000078 	andeq	r0, r0, r8, ror r0
 c74:	8b080e42 	blhi	204584 <_stack+0x184584>
 c78:	42018e02 	andmi	r8, r1, #2, 28
 c7c:	76040b0c 	strvc	r0, [r4], -ip, lsl #22
 c80:	00080d0c 	andeq	r0, r8, ip, lsl #26
 c84:	0000000c 	andeq	r0, r0, ip
 c88:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 c8c:	7c020001 	stcvc	0, cr0, [r2], {1}
 c90:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 c94:	0000001c 	andeq	r0, r0, ip, lsl r0
 c98:	00000c84 	andeq	r0, r0, r4, lsl #25
 c9c:	0000f538 	andeq	pc, r0, r8, lsr r5	; <UNPREDICTABLE>
 ca0:	00000024 	andeq	r0, r0, r4, lsr #32
 ca4:	8b040e42 	blhi	1045b4 <_stack+0x845b4>
 ca8:	0b0d4201 	bleq	3514b4 <_stack+0x2d14b4>
 cac:	420d0d4a 	andmi	r0, sp, #4736	; 0x1280
 cb0:	00000ecb 	andeq	r0, r0, fp, asr #29
 cb4:	0000001c 	andeq	r0, r0, ip, lsl r0
 cb8:	00000c84 	andeq	r0, r0, r4, lsl #25
 cbc:	0000f55c 	andeq	pc, r0, ip, asr r5	; <UNPREDICTABLE>
 cc0:	00000020 	andeq	r0, r0, r0, lsr #32
 cc4:	8b040e42 	blhi	1045d4 <_stack+0x845d4>
 cc8:	0b0d4201 	bleq	3514d4 <_stack+0x2d14d4>
 ccc:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 cd0:	00000ecb 	andeq	r0, r0, fp, asr #29
 cd4:	0000001c 	andeq	r0, r0, ip, lsl r0
 cd8:	00000c84 	andeq	r0, r0, r4, lsl #25
 cdc:	0000f57c 	andeq	pc, r0, ip, ror r5	; <UNPREDICTABLE>
 ce0:	00000094 	muleq	r0, r4, r0
 ce4:	8b040e42 	blhi	1045f4 <_stack+0x845f4>
 ce8:	0b0d4201 	bleq	3514f4 <_stack+0x2d14f4>
 cec:	0d0d4202 	sfmeq	f4, 4, [sp, #-8]
 cf0:	000ecb42 	andeq	ip, lr, r2, asr #22
 cf4:	0000001c 	andeq	r0, r0, ip, lsl r0
 cf8:	00000c84 	andeq	r0, r0, r4, lsl #25
 cfc:	0000f610 	andeq	pc, r0, r0, lsl r6	; <UNPREDICTABLE>
 d00:	00000084 	andeq	r0, r0, r4, lsl #1
 d04:	8b040e42 	blhi	104614 <_stack+0x84614>
 d08:	0b0d4201 	bleq	351514 <_stack+0x2d1514>
 d0c:	420d0d7a 	andmi	r0, sp, #7808	; 0x1e80
 d10:	00000ecb 	andeq	r0, r0, fp, asr #29
 d14:	0000001c 	andeq	r0, r0, ip, lsl r0
 d18:	00000c84 	andeq	r0, r0, r4, lsl #25
 d1c:	0000f694 	muleq	r0, r4, r6
 d20:	00000050 	andeq	r0, r0, r0, asr r0
 d24:	8b080e42 	blhi	204634 <_stack+0x184634>
 d28:	42018e02 	andmi	r8, r1, #2, 28
 d2c:	62040b0c 	andvs	r0, r4, #12, 22	; 0x3000
 d30:	00080d0c 	andeq	r0, r8, ip, lsl #26
 d34:	0000001c 	andeq	r0, r0, ip, lsl r0
 d38:	00000c84 	andeq	r0, r0, r4, lsl #25
 d3c:	0000f6e4 	andeq	pc, r0, r4, ror #13
 d40:	00000030 	andeq	r0, r0, r0, lsr r0
 d44:	8b080e42 	blhi	204654 <_stack+0x184654>
 d48:	42018e02 	andmi	r8, r1, #2, 28
 d4c:	52040b0c 	andpl	r0, r4, #12, 22	; 0x3000
 d50:	00080d0c 	andeq	r0, r8, ip, lsl #26
 d54:	0000000c 	andeq	r0, r0, ip
 d58:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 d5c:	7c020001 	stcvc	0, cr0, [r2], {1}
 d60:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 d64:	0000001c 	andeq	r0, r0, ip, lsl r0
 d68:	00000d54 	andeq	r0, r0, r4, asr sp
 d6c:	0000f714 	andeq	pc, r0, r4, lsl r7	; <UNPREDICTABLE>
 d70:	00000024 	andeq	r0, r0, r4, lsr #32
 d74:	8b040e42 	blhi	104684 <_stack+0x84684>
 d78:	0b0d4201 	bleq	351584 <_stack+0x2d1584>
 d7c:	420d0d4a 	andmi	r0, sp, #4736	; 0x1280
 d80:	00000ecb 	andeq	r0, r0, fp, asr #29
 d84:	0000001c 	andeq	r0, r0, ip, lsl r0
 d88:	00000d54 	andeq	r0, r0, r4, asr sp
 d8c:	0000f738 	andeq	pc, r0, r8, lsr r7	; <UNPREDICTABLE>
 d90:	00000060 	andeq	r0, r0, r0, rrx
 d94:	8b040e42 	blhi	1046a4 <_stack+0x846a4>
 d98:	0b0d4201 	bleq	3515a4 <_stack+0x2d15a4>
 d9c:	420d0d68 	andmi	r0, sp, #104, 26	; 0x1a00
 da0:	00000ecb 	andeq	r0, r0, fp, asr #29
 da4:	0000000c 	andeq	r0, r0, ip
 da8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 dac:	7c020001 	stcvc	0, cr0, [r2], {1}
 db0:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 db4:	0000001c 	andeq	r0, r0, ip, lsl r0
 db8:	00000da4 	andeq	r0, r0, r4, lsr #27
 dbc:	0000f798 	muleq	r0, r8, r7
 dc0:	00000024 	andeq	r0, r0, r4, lsr #32
 dc4:	8b040e42 	blhi	1046d4 <_stack+0x846d4>
 dc8:	0b0d4201 	bleq	3515d4 <_stack+0x2d15d4>
 dcc:	420d0d4a 	andmi	r0, sp, #4736	; 0x1280
 dd0:	00000ecb 	andeq	r0, r0, fp, asr #29
 dd4:	0000001c 	andeq	r0, r0, ip, lsl r0
 dd8:	00000da4 	andeq	r0, r0, r4, lsr #27
 ddc:	0000f7bc 			; <UNDEFINED> instruction: 0x0000f7bc
 de0:	00000018 	andeq	r0, r0, r8, lsl r0
 de4:	8b040e42 	blhi	1046f4 <_stack+0x846f4>
 de8:	0b0d4201 	bleq	3515f4 <_stack+0x2d15f4>
 dec:	420d0d44 	andmi	r0, sp, #68, 26	; 0x1100
 df0:	00000ecb 	andeq	r0, r0, fp, asr #29
 df4:	0000000c 	andeq	r0, r0, ip
 df8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 dfc:	7c020001 	stcvc	0, cr0, [r2], {1}
 e00:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 e04:	0000001c 	andeq	r0, r0, ip, lsl r0
 e08:	00000df4 	strdeq	r0, [r0], -r4
 e0c:	0000f7d4 	ldrdeq	pc, [r0], -r4
 e10:	00000040 	andeq	r0, r0, r0, asr #32
 e14:	8b040e42 	blhi	104724 <_stack+0x84724>
 e18:	0b0d4201 	bleq	351624 <_stack+0x2d1624>
 e1c:	420d0d58 	andmi	r0, sp, #88, 26	; 0x1600
 e20:	00000ecb 	andeq	r0, r0, fp, asr #29
 e24:	0000001c 	andeq	r0, r0, ip, lsl r0
 e28:	00000df4 	strdeq	r0, [r0], -r4
 e2c:	0000f814 	andeq	pc, r0, r4, lsl r8	; <UNPREDICTABLE>
 e30:	00000130 	andeq	r0, r0, r0, lsr r1
 e34:	8b040e42 	blhi	104744 <_stack+0x84744>
 e38:	0b0d4201 	bleq	351644 <_stack+0x2d1644>
 e3c:	0d0d9002 	stceq	0, cr9, [sp, #-8]
 e40:	000ecb42 	andeq	ip, lr, r2, asr #22
 e44:	0000001c 	andeq	r0, r0, ip, lsl r0
 e48:	00000df4 	strdeq	r0, [r0], -r4
 e4c:	0000f944 	andeq	pc, r0, r4, asr #18
 e50:	000000f8 	strdeq	r0, [r0], -r8
 e54:	8b040e42 	blhi	104764 <_stack+0x84764>
 e58:	0b0d4201 	bleq	351664 <_stack+0x2d1664>
 e5c:	0d0d7402 	cfstrseq	mvf7, [sp, #-8]
 e60:	000ecb42 	andeq	ip, lr, r2, asr #22
 e64:	0000001c 	andeq	r0, r0, ip, lsl r0
 e68:	00000df4 	strdeq	r0, [r0], -r4
 e6c:	0000fa3c 	andeq	pc, r0, ip, lsr sl	; <UNPREDICTABLE>
 e70:	00000074 	andeq	r0, r0, r4, ror r0
 e74:	8b040e42 	blhi	104784 <_stack+0x84784>
 e78:	0b0d4201 	bleq	351684 <_stack+0x2d1684>
 e7c:	420d0d72 	andmi	r0, sp, #7296	; 0x1c80
 e80:	00000ecb 	andeq	r0, r0, fp, asr #29
 e84:	0000001c 	andeq	r0, r0, ip, lsl r0
 e88:	00000df4 	strdeq	r0, [r0], -r4
 e8c:	0000fab0 			; <UNDEFINED> instruction: 0x0000fab0
 e90:	0000006c 	andeq	r0, r0, ip, rrx
 e94:	8b040e42 	blhi	1047a4 <_stack+0x847a4>
 e98:	0b0d4201 	bleq	3516a4 <_stack+0x2d16a4>
 e9c:	420d0d6e 	andmi	r0, sp, #7040	; 0x1b80
 ea0:	00000ecb 	andeq	r0, r0, fp, asr #29
 ea4:	0000001c 	andeq	r0, r0, ip, lsl r0
 ea8:	00000df4 	strdeq	r0, [r0], -r4
 eac:	0000fb1c 	andeq	pc, r0, ip, lsl fp	; <UNPREDICTABLE>
 eb0:	00000084 	andeq	r0, r0, r4, lsl #1
 eb4:	8b040e42 	blhi	1047c4 <_stack+0x847c4>
 eb8:	0b0d4201 	bleq	3516c4 <_stack+0x2d16c4>
 ebc:	420d0d7a 	andmi	r0, sp, #7808	; 0x1e80
 ec0:	00000ecb 	andeq	r0, r0, fp, asr #29
 ec4:	0000000c 	andeq	r0, r0, ip
 ec8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 ecc:	7c020001 	stcvc	0, cr0, [r2], {1}
 ed0:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 ed4:	0000001c 	andeq	r0, r0, ip, lsl r0
 ed8:	00000ec4 	andeq	r0, r0, r4, asr #29
 edc:	0000fba0 	andeq	pc, r0, r0, lsr #23
 ee0:	00000074 	andeq	r0, r0, r4, ror r0
 ee4:	8b080e42 	blhi	2047f4 <_stack+0x1847f4>
 ee8:	42018e02 	andmi	r8, r1, #2, 28
 eec:	74040b0c 	strvc	r0, [r4], #-2828	; 0xfffff4f4
 ef0:	00080d0c 	andeq	r0, r8, ip, lsl #26
 ef4:	0000001c 	andeq	r0, r0, ip, lsl r0
 ef8:	00000ec4 	andeq	r0, r0, r4, asr #29
 efc:	0000fc14 	andeq	pc, r0, r4, lsl ip	; <UNPREDICTABLE>
 f00:	0000008c 	andeq	r0, r0, ip, lsl #1
 f04:	8b080e42 	blhi	204814 <_stack+0x184814>
 f08:	42018e02 	andmi	r8, r1, #2, 28
 f0c:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 f10:	080d0c40 	stmdaeq	sp, {r6, sl, fp}
 f14:	0000001c 	andeq	r0, r0, ip, lsl r0
 f18:	00000ec4 	andeq	r0, r0, r4, asr #29
 f1c:	0000fca0 	andeq	pc, r0, r0, lsr #25
 f20:	0000008c 	andeq	r0, r0, ip, lsl #1
 f24:	8b080e42 	blhi	204834 <_stack+0x184834>
 f28:	42018e02 	andmi	r8, r1, #2, 28
 f2c:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 f30:	080d0c40 	stmdaeq	sp, {r6, sl, fp}
 f34:	0000001c 	andeq	r0, r0, ip, lsl r0
 f38:	00000ec4 	andeq	r0, r0, r4, asr #29
 f3c:	0000fd2c 	andeq	pc, r0, ip, lsr #26
 f40:	000000a4 	andeq	r0, r0, r4, lsr #1
 f44:	8b080e42 	blhi	204854 <_stack+0x184854>
 f48:	42018e02 	andmi	r8, r1, #2, 28
 f4c:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
 f50:	080d0c4c 	stmdaeq	sp, {r2, r3, r6, sl, fp}

Disassembly of section .debug_str:

00000000 <.debug_str>:
       0:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; ffffff4c <_stack+0xfff7ff4c>
       4:	74722f65 	ldrbtvc	r2, [r2], #-3941	; 0xfffff09b
       8:	442f6b72 	strtmi	r6, [pc], #-2930	; 10 <_start-0x7ff0>
       c:	746b7365 	strbtvc	r7, [fp], #-869	; 0xfffffc9b
      10:	6c2f706f 	stcvs	0, cr7, [pc], #-444	; fffffe5c <_stack+0xfff7fe5c>
      14:	696d736f 	stmdbvs	sp!, {r0, r1, r2, r3, r5, r6, r8, r9, ip, sp, lr}^
      18:	6d6f6b5f 	fstmdbxvs	pc!, {d22-d68}	;@ Deprecated
      1c:	61746e65 	cmnvs	r4, r5, ror #28
      20:	61736972 	cmnvs	r3, r2, ror r9
      24:	65762f6f 	ldrbvs	r2, [r6, #-3951]!	; 0xfffff091
      28:	3061627a 	rsbcc	r6, r1, sl, ror r2
      2c:	656b2f38 	strbvs	r2, [fp, #-3896]!	; 0xfffff0c8
      30:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
      34:	6174732f 	cmnvs	r4, pc, lsr #6
      38:	532e7472 			; <UNDEFINED> instruction: 0x532e7472
      3c:	6f682f00 	svcvs	0x00682f00
      40:	722f656d 	eorvc	r6, pc, #457179136	; 0x1b400000
      44:	2f6b7274 	svccs	0x006b7274
      48:	6b736544 	blvs	1cd9560 <_stack+0x1c59560>
      4c:	2f706f74 	svccs	0x00706f74
      50:	6d736f6c 	ldclvs	15, cr6, [r3, #-432]!	; 0xfffffe50
      54:	6f6b5f69 	svcvs	0x006b5f69
      58:	746e656d 	strbtvc	r6, [lr], #-1389	; 0xfffffa93
      5c:	73697261 	cmnvc	r9, #268435462	; 0x10000006
      60:	762f6f61 	strtvc	r6, [pc], -r1, ror #30
      64:	61627a65 	cmnvs	r2, r5, ror #20
      68:	47003830 	smladxmi	r0, r0, r8, r3
      6c:	4120554e 			; <UNDEFINED> instruction: 0x4120554e
      70:	2e322053 	mrccs	0, 1, r2, cr2, cr3, {2}
      74:	6c003433 	cfstrsvs	mvf3, [r0], {51}	; 0x33
      78:	20676e6f 	rsbcs	r6, r7, pc, ror #28
      7c:	676e6f6c 	strbvs	r6, [lr, -ip, ror #30]!
      80:	746e6920 	strbtvc	r6, [lr], #-2336	; 0xfffff6e0
      84:	73635f00 	cmnvc	r3, #0, 30
      88:	74726174 	ldrbtvc	r6, [r2], #-372	; 0xfffffe8c
      8c:	5f007075 	svcpl	0x00007075
      90:	7373625f 	cmnvc	r3, #-268435451	; 0xf0000005
      94:	6174735f 	cmnvs	r4, pc, asr r3
      98:	5f5f7472 	svcpl	0x005f7472
      9c:	625f5f00 	subsvs	r5, pc, #0, 30
      a0:	655f7373 	ldrbvs	r7, [pc, #-883]	; fffffd35 <_stack+0xfff7fd35>
      a4:	5f5f646e 	svcpl	0x005f646e
      a8:	6e6f6c00 	cdpvs	12, 6, cr6, cr15, cr0, {0}
      ac:	6f6c2067 	svcvs	0x006c2067
      b0:	7520676e 	strvc	r6, [r0, #-1902]!	; 0xfffff892
      b4:	6769736e 	strbvs	r7, [r9, -lr, ror #6]!
      b8:	2064656e 	rsbcs	r6, r4, lr, ror #10
      bc:	00746e69 	rsbseq	r6, r4, r9, ror #28
      c0:	69736e75 	ldmdbvs	r3!, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
      c4:	64656e67 	strbtvs	r6, [r5], #-3687	; 0xfffff199
      c8:	61686320 	cmnvs	r8, r0, lsr #6
      cc:	4e470072 	mcrmi	0, 2, r0, cr7, cr2, {3}
      d0:	31432055 	qdaddcc	r2, r5, r3
      d4:	2e392037 	mrccs	0, 1, r2, cr9, cr7, {1}
      d8:	20312e32 	eorscs	r2, r1, r2, lsr lr
      dc:	39313032 	ldmdbcc	r1!, {r1, r4, r5, ip, sp}
      e0:	35323031 	ldrcc	r3, [r2, #-49]!	; 0xffffffcf
      e4:	65722820 	ldrbvs	r2, [r2, #-2080]!	; 0xfffff7e0
      e8:	7361656c 	cmnvc	r1, #108, 10	; 0x1b000000
      ec:	5b202965 	blpl	80a688 <_stack+0x78a688>
      f0:	2f4d5241 	svccs	0x004d5241
      f4:	2d6d7261 	sfmcs	f7, 2, [sp, #-388]!	; 0xfffffe7c
      f8:	72622d39 	rsbvc	r2, r2, #3648	; 0xe40
      fc:	68636e61 	stmdavs	r3!, {r0, r5, r6, r9, sl, fp, sp, lr}^
     100:	76657220 	strbtvc	r7, [r5], -r0, lsr #4
     104:	6f697369 	svcvs	0x00697369
     108:	3732206e 	ldrcc	r2, [r2, -lr, rrx]!
     10c:	39393537 	ldmdbcc	r9!, {r0, r1, r2, r4, r5, r8, sl, ip, sp}
     110:	6d2d205d 	stcvs	0, cr2, [sp, #-372]!	; 0xfffffe8c
     114:	616f6c66 	cmnvs	pc, r6, ror #24
     118:	62612d74 	rsbvs	r2, r1, #116, 26	; 0x1d00
     11c:	6f733d69 	svcvs	0x00733d69
     120:	70667466 	rsbvc	r7, r6, r6, ror #8
     124:	666d2d20 	strbtvs	r2, [sp], -r0, lsr #26
     128:	6e3d7570 	mrcvs	5, 1, r7, cr13, cr0, {3}
     12c:	2d6e6f65 	stclcs	15, cr6, [lr, #-404]!	; 0xfffffe6c
     130:	76706676 			; <UNDEFINED> instruction: 0x76706676
     134:	6d2d2034 	stcvs	0, cr2, [sp, #-208]!	; 0xffffff30
     138:	656e7574 	strbvs	r7, [lr, #-1396]!	; 0xfffffa8c
     13c:	726f633d 	rsbvc	r6, pc, #-201326592	; 0xf4000000
     140:	2d786574 	cfldr64cs	mvdx6, [r8, #-464]!	; 0xfffffe30
     144:	2d203761 	stccs	7, cr3, [r0, #-388]!	; 0xfffffe7c
     148:	6d72616d 	ldfvse	f6, [r2, #-436]!	; 0xfffffe4c
     14c:	616d2d20 	cmnvs	sp, r0, lsr #26
     150:	3d686372 	stclcc	3, cr6, [r8, #-456]!	; 0xfffffe38
     154:	766d7261 	strbtvc	r7, [sp], -r1, ror #4
     158:	2b657637 	blcs	195da3c <_stack+0x18dda3c>
     15c:	646d6973 	strbtvs	r6, [sp], #-2419	; 0xfffff68d
     160:	20672d20 	rsbcs	r2, r7, r0, lsr #26
     164:	00304f2d 	eorseq	r4, r0, sp, lsr #30
     168:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; b4 <_start-0x7f4c>
     16c:	74722f65 	ldrbtvc	r2, [r2], #-3941	; 0xfffff09b
     170:	442f6b72 	strtmi	r6, [pc], #-2930	; 178 <_start-0x7e88>
     174:	746b7365 	strbtvc	r7, [fp], #-869	; 0xfffffc9b
     178:	6c2f706f 	stcvs	0, cr7, [pc], #-444	; ffffffc4 <_stack+0xfff7ffc4>
     17c:	696d736f 	stmdbvs	sp!, {r0, r1, r2, r3, r5, r6, r8, r9, ip, sp, lr}^
     180:	6d6f6b5f 	fstmdbxvs	pc!, {d22-d68}	;@ Deprecated
     184:	61746e65 	cmnvs	r4, r5, ror #28
     188:	61736972 	cmnvs	r3, r2, ror r9
     18c:	65762f6f 	ldrbvs	r2, [r6, #-3951]!	; 0xfffff091
     190:	3061627a 	rsbcc	r6, r1, sl, ror r2
     194:	656b2f38 	strbvs	r2, [fp, #-3896]!	; 0xfffff0c8
     198:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
     19c:	7473632f 	ldrbtvc	r6, [r3], #-815	; 0xfffffcd1
     1a0:	75747261 	ldrbvc	r7, [r4, #-609]!	; 0xfffffd9f
     1a4:	00632e70 	rsbeq	r2, r3, r0, ror lr
     1a8:	5f737362 	svcpl	0x00737362
     1ac:	00646e65 	rsbeq	r6, r4, r5, ror #28
     1b0:	726f6873 	rsbvc	r6, pc, #7536640	; 0x730000
     1b4:	6e752074 	mrcvs	0, 3, r2, cr5, cr4, {3}
     1b8:	6e676973 			; <UNDEFINED> instruction: 0x6e676973
     1bc:	69206465 	stmdbvs	r0!, {r0, r2, r5, r6, sl, sp, lr}
     1c0:	7300746e 	movwvc	r7, #1134	; 0x46e
     1c4:	74726f68 	ldrbtvc	r6, [r2], #-3944	; 0xfffff098
     1c8:	746e6920 	strbtvc	r6, [lr], #-2336	; 0xfffff6e0
     1cc:	5f737400 	svcpl	0x00737400
     1d0:	61736964 	cmnvs	r3, r4, ror #18
     1d4:	64656c62 	strbtvs	r6, [r5], #-3170	; 0xfffff39e
     1d8:	6d687300 	stclvs	3, cr7, [r8, #-0]
     1dc:	725f6d65 	subsvc	r6, pc, #6464	; 0x1940
     1e0:	636f6c64 	cmnvs	pc, #100, 24	; 0x6400
     1e4:	6873006b 	ldmdavs	r3!, {r0, r1, r3, r5, r6}^
     1e8:	5f6d656d 	svcpl	0x006d656d
     1ec:	64616568 	strbtvs	r6, [r1], #-1384	; 0xfffffa98
     1f0:	64007265 	strvs	r7, [r0], #-613	; 0xfffffd9b
     1f4:	6c617461 	cfstrdvs	mvd7, [r1], #-388	; 0xfffffe7c
     1f8:	73006e65 	movwvc	r6, #3685	; 0xe65
     1fc:	6b737470 	blvs	1cdd3c4 <_stack+0x1c5d3c4>
     200:	6c656400 	cfstrdvs	mvd6, [r5], #-0
     204:	5f657465 	svcpl	0x00657465
     208:	786f626d 	stmdavc	pc!, {r0, r2, r3, r5, r6, r9, sp, lr}^	; <UNPREDICTABLE>
     20c:	6f6c7300 	svcvs	0x006c7300
     210:	66666f74 	uqsub16vs	r6, r6, r4
     214:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     218:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     21c:	0030324f 	eorseq	r3, r0, pc, asr #4
     220:	5f495052 	svcpl	0x00495052
     224:	4f495047 	svcmi	0x00495047
     228:	52003132 	andpl	r3, r0, #-2147483636	; 0x8000000c
     22c:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     230:	324f4950 	subcc	r4, pc, #80, 18	; 0x140000
     234:	50520032 	subspl	r0, r2, r2, lsr r0
     238:	50475f49 	subpl	r5, r7, r9, asr #30
     23c:	33324f49 	teqcc	r2, #292	; 0x124
     240:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     244:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     248:	0034324f 	eorseq	r3, r4, pc, asr #4
     24c:	5f495052 	svcpl	0x00495052
     250:	4f495047 	svcmi	0x00495047
     254:	52003532 	andpl	r3, r0, #209715200	; 0xc800000
     258:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     25c:	324f4950 	subcc	r4, pc, #80, 18	; 0x140000
     260:	50520036 	subspl	r0, r2, r6, lsr r0
     264:	50475f49 	subpl	r5, r7, r9, asr #30
     268:	37324f49 	ldrcc	r4, [r2, -r9, asr #30]!
     26c:	6f682f00 	svcvs	0x00682f00
     270:	722f656d 	eorvc	r6, pc, #457179136	; 0x1b400000
     274:	2f6b7274 	svccs	0x006b7274
     278:	6b736544 	blvs	1cd9790 <_stack+0x1c59790>
     27c:	2f706f74 	svccs	0x00706f74
     280:	6d736f6c 	ldclvs	15, cr6, [r3, #-432]!	; 0xfffffe50
     284:	6f6b5f69 	svcvs	0x006b5f69
     288:	746e656d 	strbtvc	r6, [lr], #-1389	; 0xfffffa93
     28c:	73697261 	cmnvc	r9, #268435462	; 0x10000006
     290:	762f6f61 	strtvc	r6, [pc], -r1, ror #30
     294:	61627a65 	cmnvs	r2, r5, ror #20
     298:	6b2f3830 	blvs	bce360 <_stack+0xb4e360>
     29c:	656e7265 	strbvs	r7, [lr, #-613]!	; 0xfffffd9b
     2a0:	656b2f6c 	strbvs	r2, [fp, #-3948]!	; 0xfffff094
     2a4:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
     2a8:	5200632e 	andpl	r6, r0, #-1207959552	; 0xb8000000
     2ac:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     2b0:	324f4950 	subcc	r4, pc, #80, 18	; 0x140000
     2b4:	65640039 	strbvs	r0, [r4, #-57]!	; 0xffffffc7
     2b8:	6574656c 	ldrbvs	r6, [r4, #-1388]!	; 0xfffffa94
     2bc:	7361745f 	cmnvc	r1, #1593835520	; 0x5f000000
     2c0:	626d5f6b 	rsbvs	r5, sp, #428	; 0x1ac
     2c4:	6900786f 	stmdbvs	r0, {r0, r1, r2, r3, r5, r6, fp, ip, sp, lr}
     2c8:	7a616c7a 	bvc	185b4b8 <_stack+0x17db4b8>
     2cc:	6d697400 	cfstrdvs	mvd7, [r9, #-0]
     2d0:	745f7265 	ldrbvc	r7, [pc], #-613	; 2d8 <_start-0x7d28>
     2d4:	00657079 	rsbeq	r7, r5, r9, ror r0
     2d8:	76657270 			; <UNDEFINED> instruction: 0x76657270
     2dc:	70737573 	rsbsvc	r7, r3, r3, ror r5
     2e0:	69617700 	stmdbvs	r1!, {r8, r9, sl, ip, sp, lr}^
     2e4:	6e6f5f74 	mcrvs	15, 3, r5, cr15, cr4, {3}
     2e8:	6d69745f 	cfstrdvs	mvd7, [r9, #-380]!	; 0xfffffe84
     2ec:	6e007265 	cdpvs	2, 0, cr7, cr0, cr5, {3}
     2f0:	5f747865 	svcpl	0x00747865
     2f4:	5f6d6974 	svcpl	0x006d6974
     2f8:	70737573 	rsbsvc	r7, r3, r3, ror r5
     2fc:	54554d00 	ldrbpl	r4, [r5], #-3328	; 0xfffff300
     300:	6c005845 	stcvs	8, cr5, [r0], {69}	; 0x45
     304:	6c657665 	stclvs	6, cr7, [r5], #-404	; 0xfffffe6c
     308:	00746567 	rsbseq	r6, r4, r7, ror #10
     30c:	5f747570 	svcpl	0x00747570
     310:	646e6f63 	strbtvs	r6, [lr], #-3939	; 0xfffff09d
     314:	73656d5f 	cmnvc	r5, #6080	; 0x17c0
     318:	65676173 	strbvs	r6, [r7, #-371]!	; 0xfffffe8d
     31c:	73757300 	cmnvc	r5, #0, 6
     320:	72747070 	rsbsvc	r7, r4, #112	; 0x70
     324:	6d756400 	cfldrdvs	mvd6, [r5, #-0]
     328:	6300796d 	movwvs	r7, #2413	; 0x96d
     32c:	74616572 	strbtvc	r6, [r1], #-1394	; 0xfffffa8e
     330:	626d5f65 	rsbvs	r5, sp, #404	; 0x194
     334:	7400786f 	strvc	r7, [r0], #-2159	; 0xfffff791
     338:	6c61746f 	cfstrdvs	mvd7, [r1], #-444	; 0xfffffe44
     33c:	6d69745f 	cfstrdvs	mvd7, [r9, #-380]!	; 0xfffffe84
     340:	69685f65 	stmdbvs	r8!, {r0, r2, r5, r6, r8, r9, sl, fp, ip, lr}^
     344:	63796300 	cmnvs	r9, #0, 6
     348:	0073756c 	rsbseq	r7, r3, ip, ror #10
     34c:	5f495052 	svcpl	0x00495052
     350:	4f495047 	svcmi	0x00495047
     354:	52003033 	andpl	r3, r0, #51	; 0x33
     358:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     35c:	334f4950 	movtcc	r4, #63824	; 0xf950
     360:	50520031 	subspl	r0, r2, r1, lsr r0
     364:	50475f49 	subpl	r5, r7, r9, asr #30
     368:	32334f49 	eorscc	r4, r3, #292	; 0x124
     36c:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     370:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     374:	0033334f 	eorseq	r3, r3, pc, asr #6
     378:	5f495052 	svcpl	0x00495052
     37c:	4f495047 	svcmi	0x00495047
     380:	52003433 	andpl	r3, r0, #855638016	; 0x33000000
     384:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     388:	334f4950 	movtcc	r4, #63824	; 0xf950
     38c:	50520035 	subspl	r0, r2, r5, lsr r0
     390:	50475f49 	subpl	r5, r7, r9, asr #30
     394:	36334f49 	ldrtcc	r4, [r3], -r9, asr #30
     398:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     39c:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     3a0:	0037334f 	eorseq	r3, r7, pc, asr #6
     3a4:	5f495052 	svcpl	0x00495052
     3a8:	4f495047 	svcmi	0x00495047
     3ac:	52003833 	andpl	r3, r0, #3342336	; 0x330000
     3b0:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     3b4:	334f4950 	movtcc	r4, #63824	; 0xf950
     3b8:	6f630039 	svcvs	0x00630039
     3bc:	7374746e 	cmnvc	r4, #1845493760	; 0x6e000000
     3c0:	6174006b 	cmnvs	r4, fp, rrx
     3c4:	745f6b73 	ldrbvc	r6, [pc], #-2931	; 3cc <_start-0x7c34>
     3c8:	00656d69 	rsbeq	r6, r5, r9, ror #26
     3cc:	65746e65 	ldrbvs	r6, [r4, #-3685]!	; 0xfffff19b
     3d0:	72635f72 	rsbvc	r5, r3, #456	; 0x1c8
     3d4:	65737469 	ldrbvs	r7, [r3, #-1129]!	; 0xfffffb97
     3d8:	50520063 	subspl	r0, r2, r3, rrx
     3dc:	50475f49 	subpl	r5, r7, r9, asr #30
     3e0:	00394f49 	eorseq	r4, r9, r9, asr #30
     3e4:	6d736c72 	ldclvs	12, cr6, [r3, #-456]!	; 0xfffffe38
     3e8:	74007874 	strvc	r7, [r0], #-2164	; 0xfffff78c
     3ec:	73656d69 	cmnvc	r5, #6720	; 0x1a40
     3f0:	6563696c 	strbvs	r6, [r3, #-2412]!	; 0xfffff694
     3f4:	616e655f 	cmnvs	lr, pc, asr r5
     3f8:	00656c62 	rsbeq	r6, r5, r2, ror #24
     3fc:	5f495052 	svcpl	0x00495052
     400:	4f495047 	svcmi	0x00495047
     404:	52003034 	andpl	r3, r0, #52	; 0x34
     408:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     40c:	344f4950 	strbcc	r4, [pc], #-2384	; 414 <_start-0x7bec>
     410:	50520031 	subspl	r0, r2, r1, lsr r0
     414:	50475f49 	subpl	r5, r7, r9, asr #30
     418:	32344f49 	eorscc	r4, r4, #292	; 0x124
     41c:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     420:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     424:	0033344f 	eorseq	r3, r3, pc, asr #8
     428:	5f495052 	svcpl	0x00495052
     42c:	4f495047 	svcmi	0x00495047
     430:	52003434 	andpl	r3, r0, #52, 8	; 0x34000000
     434:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     438:	344f4950 	strbcc	r4, [pc], #-2384	; 440 <_start-0x7bc0>
     43c:	50520035 	subspl	r0, r2, r5, lsr r0
     440:	50475f49 	subpl	r5, r7, r9, asr #30
     444:	36344f49 	ldrtcc	r4, [r4], -r9, asr #30
     448:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     44c:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     450:	0037344f 	eorseq	r3, r7, pc, asr #8
     454:	5f495052 	svcpl	0x00495052
     458:	4f495047 	svcmi	0x00495047
     45c:	52003834 	andpl	r3, r0, #52, 16	; 0x340000
     460:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     464:	344f4950 	strbcc	r4, [pc], #-2384	; 46c <_start-0x7b94>
     468:	656e0039 	strbvs	r0, [lr, #-57]!	; 0xffffffc7
     46c:	745f7478 	ldrbvc	r7, [pc], #-1144	; 474 <_start-0x7b8c>
     470:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
     474:	676f6c00 	strbvs	r6, [pc, -r0, lsl #24]!
     478:	00726567 	rsbseq	r6, r2, r7, ror #10
     47c:	746e6975 	strbtvc	r6, [lr], #-2421	; 0xfffff68b
     480:	745f3233 	ldrbvc	r3, [pc], #-563	; 488 <_start-0x7b78>
     484:	63697400 	cmnvs	r9, #0, 8
     488:	6f635f6b 	svcvs	0x00635f6b
     48c:	65746e75 	ldrbvs	r6, [r4, #-3701]!	; 0xfffff18b
     490:	65730072 	ldrbvs	r0, [r3, #-114]!	; 0xffffff8e
     494:	745f646e 	ldrbvc	r6, [pc], #-1134	; 49c <_start-0x7b64>
     498:	5f6b7361 	svcpl	0x006b7361
     49c:	7373656d 	cmnvc	r3, #457179136	; 0x1b400000
     4a0:	00656761 	rsbeq	r6, r5, r1, ror #14
     4a4:	52505f49 	subspl	r5, r0, #292	; 0x124
     4a8:	49524f49 	ldmdbmi	r2, {r0, r3, r6, r8, r9, sl, fp, lr}^
     4ac:	73005954 	movwvc	r5, #2388	; 0x954
     4b0:	6d656d68 	stclvs	13, cr6, [r5, #-416]!	; 0xfffffe60
     4b4:	6c72775f 	ldclvs	7, cr7, [r2], #-380	; 0xfffffe84
     4b8:	006b636f 	rsbeq	r6, fp, pc, ror #6
     4bc:	706f7473 	rsbvc	r7, pc, r3, ror r4	; <UNPREDICTABLE>
     4c0:	6d69745f 	cfstrdvs	mvd7, [r9, #-380]!	; 0xfffffe84
     4c4:	5f007265 	svcpl	0x00007265
     4c8:	7365645f 	cmnvc	r5, #1593835520	; 0x5f000000
     4cc:	796f7274 	stmdbvc	pc!, {r2, r4, r5, r6, r9, ip, sp, lr}^	; <UNPREDICTABLE>
     4d0:	7361745f 	cmnvc	r1, #1593835520	; 0x5f000000
     4d4:	7263006b 	rsbvc	r0, r3, #107	; 0x6b
     4d8:	65746165 	ldrbvs	r6, [r4, #-357]!	; 0xfffffe9b
     4dc:	7361745f 	cmnvc	r1, #1593835520	; 0x5f000000
     4e0:	626d5f6b 	rsbvs	r5, sp, #428	; 0x1ac
     4e4:	6d00786f 	stcvs	8, cr7, [r0, #-444]	; 0xfffffe44
     4e8:	78657475 	stmdavc	r5!, {r0, r2, r4, r5, r6, sl, ip, sp, lr}^
     4ec:	6c644900 			; <UNDEFINED> instruction: 0x6c644900
     4f0:	646e4865 	strbtvs	r4, [lr], #-2149	; 0xfffff79b
     4f4:	646c4f00 	strbtvs	r4, [ip], #-3840	; 0xfffff100
     4f8:	656d6954 	strbvs	r6, [sp, #-2388]!	; 0xfffff6ac
     4fc:	00746e49 	rsbseq	r6, r4, r9, asr #28
     500:	726f6261 	rsbvc	r6, pc, #268435462	; 0x10000006
     504:	00746d74 	rsbseq	r6, r4, r4, ror sp
     508:	616c6564 	cmnvs	ip, r4, ror #10
     50c:	61745f79 	cmnvs	r4, r9, ror pc
     510:	74006b73 	strvc	r6, [r0], #-2931	; 0xfffff48d
     514:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
     518:	6e75665f 	mrcvs	6, 3, r6, cr5, cr15, {2}
     51c:	6e61685f 	mcrvs	8, 3, r6, cr1, cr15, {2}
     520:	72656c64 	rsbvc	r6, r5, #100, 24	; 0x6400
     524:	49524300 	ldmdbmi	r2, {r8, r9, lr}^
     528:	45535f54 	ldrbmi	r5, [r3, #-3924]	; 0xfffff0ac
     52c:	52005443 	andpl	r5, r0, #1124073472	; 0x43000000
     530:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     534:	354f4950 	strbcc	r4, [pc, #-2384]	; fffffbec <_stack+0xfff7fbec>
     538:	50520031 	subspl	r0, r2, r1, lsr r0
     53c:	50475f49 	subpl	r5, r7, r9, asr #30
     540:	32354f49 	eorscc	r4, r5, #292	; 0x124
     544:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     548:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     54c:	0033354f 	eorseq	r3, r3, pc, asr #10
     550:	5f495052 	svcpl	0x00495052
     554:	4f495047 	svcmi	0x00495047
     558:	72003035 	andvc	r3, r0, #53	; 0x35
     55c:	79646165 	stmdbvc	r4!, {r0, r2, r5, r6, r8, sp, lr}^
     560:	6c696174 	stfvse	f6, [r9], #-464	; 0xfffffe30
     564:	73617400 	cmnvc	r1, #0, 8
     568:	61685f6b 	cmnvs	r8, fp, ror #30
     56c:	656c646e 	strbvs	r6, [ip, #-1134]!	; 0xfffffb92
     570:	65670072 	strbvs	r0, [r7, #-114]!	; 0xffffff8e
     574:	72617074 	rsbvc	r7, r1, #116	; 0x74
     578:	00736d61 	rsbseq	r6, r3, r1, ror #26
     57c:	5f746567 	svcpl	0x00746567
     580:	7373656d 	cmnvc	r3, #457179136	; 0x1b400000
     584:	00656761 	rsbeq	r6, r5, r1, ror #14
     588:	4954544d 	ldmdbmi	r4, {r0, r2, r3, r6, sl, ip, lr}^
     58c:	0052454d 	subseq	r4, r2, sp, asr #10
     590:	70736964 	rsbsvc	r6, r3, r4, ror #18
     594:	646f6d5f 	strbtvs	r6, [pc], #-3423	; 59c <_start-0x7a64>
     598:	73750065 	cmnvc	r5, #101	; 0x65
     59c:	695f7265 	ldmdbvs	pc, {r0, r2, r5, r6, r9, ip, sp, lr}^	; <UNPREDICTABLE>
     5a0:	6d00746e 	cfstrsvs	mvf7, [r0, #-440]	; 0xfffffe48
     5a4:	69745f74 	ldmdbvs	r4!, {r2, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
     5a8:	0072656d 	rsbseq	r6, r2, sp, ror #10
     5ac:	63617473 	cmnvs	r1, #1929379840	; 0x73000000
     5b0:	656c5f6b 	strbvs	r5, [ip, #-3947]!	; 0xfffff095
     5b4:	7562006e 	strbvc	r0, [r2, #-110]!	; 0xffffff92
     5b8:	46006666 	strmi	r6, [r0], -r6, ror #12
     5bc:	554f5f53 	strbpl	r5, [pc, #-3923]	; fffff671 <_stack+0xfff7f671>
     5c0:	54555054 	ldrbpl	r5, [r5], #-84	; 0xffffffac
     5c4:	535f4900 	cmppl	pc, #0, 18
     5c8:	4a4e4154 	bmi	1390b20 <_stack+0x1310b20>
     5cc:	65740045 	ldrbvs	r0, [r4, #-69]!	; 0xffffffbb
     5d0:	0031706d 	eorseq	r7, r1, sp, rrx
     5d4:	706d6574 	rsbvc	r6, sp, r4, ror r5
     5d8:	65730032 	ldrbvs	r0, [r3, #-50]!	; 0xffffffce
     5dc:	69645f74 	stmdbvs	r4!, {r2, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
     5e0:	6c626173 	stfvse	f6, [r2], #-460	; 0xfffffe34
     5e4:	68730065 	ldmdavs	r3!, {r0, r2, r5, r6}^
     5e8:	5f6d656d 	svcpl	0x006d656d
     5ec:	70726468 	rsbsvc	r6, r2, r8, ror #8
     5f0:	72754300 	rsbsvc	r4, r5, #0, 6
     5f4:	6d695472 	cfstrdvs	mvd5, [r9, #-456]!	; 0xfffffe38
     5f8:	73007265 	movwvc	r7, #613	; 0x265
     5fc:	65707375 	ldrbvs	r7, [r0, #-885]!	; 0xfffffc8b
     600:	4900646e 	stmdbmi	r0, {r1, r2, r3, r5, r6, sl, sp, lr}
     604:	4745525f 	smlsldmi	r5, r5, pc, r2	; <UNPREDICTABLE>
     608:	52545349 	subspl	r5, r4, #603979777	; 0x24000001
     60c:	68730049 	ldmdavs	r3!, {r0, r3, r6}^
     610:	5f6d656d 	svcpl	0x006d656d
     614:	6f6c6e75 	svcvs	0x006c6e75
     618:	66006b63 	strvs	r6, [r0], -r3, ror #22
     61c:	7367616c 	cmnvc	r7, #108, 2
     620:	6d697400 	cfstrdvs	mvd7, [r9, #-0]
     624:	696c7365 	stmdbvs	ip!, {r0, r2, r5, r6, r8, r9, ip, sp, lr}^
     628:	645f6563 	ldrbvs	r6, [pc], #-1379	; 630 <_start-0x79d0>
     62c:	62617369 	rsbvs	r7, r1, #-1543503871	; 0xa4000001
     630:	7400656c 	strvc	r6, [r0], #-1388	; 0xfffffa94
     634:	6c61746f 	cfstrdvs	mvd7, [r1], #-444	; 0xfffffe44
     638:	6d69745f 	cfstrdvs	mvd7, [r9, #-380]!	; 0xfffffe84
     63c:	6f6c5f65 	svcvs	0x006c5f65
     640:	66640077 			; <UNDEFINED> instruction: 0x66640077
     644:	73006d73 	movwvc	r6, #3443	; 0xd73
     648:	655f7465 	ldrbvs	r7, [pc, #-1125]	; 1eb <_start-0x7e15>
     64c:	6c62616e 	stfvse	f6, [r2], #-440	; 0xfffffe48
     650:	65720065 	ldrbvs	r0, [r2, #-101]!	; 0xffffff9b
     654:	6d5f6461 	cfldrdvs	mvd6, [pc, #-388]	; 4d8 <_start-0x7b28>
     658:	61737365 	cmnvs	r3, r5, ror #6
     65c:	73006567 	movwvc	r6, #1383	; 0x567
     660:	63746977 	cmnvs	r4, #1949696	; 0x1dc000
     664:	61725f68 	cmnvs	r2, r8, ror #30
     668:	5f006574 	svcpl	0x00006574
     66c:	6168635f 	cmnvs	r8, pc, asr r3
     670:	5f65676e 	svcpl	0x0065676e
     674:	6b736174 	blvs	1cd8c4c <_stack+0x1c58c4c>
     678:	72005f5f 	andvc	r5, r0, #380	; 0x17c
     67c:	79646165 	stmdbvc	r4!, {r0, r2, r5, r6, r8, sp, lr}^
     680:	64616568 	strbtvs	r6, [r1], #-1384	; 0xfffffa98
     684:	61747300 	cmnvs	r4, r0, lsl #6
     688:	656c6b63 	strbvs	r6, [ip, #-2915]!	; 0xfffff49d
     68c:	6564006e 	strbvs	r0, [r4, #-110]!	; 0xffffff92
     690:	6574656c 	ldrbvs	r6, [r4, #-1388]!	; 0xfffffa94
     694:	6d69745f 	cfstrdvs	mvd7, [r9, #-380]!	; 0xfffffe84
     698:	63007265 	movwvs	r7, #613	; 0x265
     69c:	7261656c 	rsbvc	r6, r1, #108, 10	; 0x1b000000
     6a0:	7361745f 	cmnvc	r1, #1593835520	; 0x5f000000
     6a4:	626d5f6b 	rsbvs	r5, sp, #428	; 0x1ac
     6a8:	6700786f 	strvs	r7, [r0, -pc, ror #16]
     6ac:	745f7465 	ldrbvc	r7, [pc], #-1125	; 6b4 <_start-0x794c>
     6b0:	5f6b7361 	svcpl	0x006b7361
     6b4:	7373656d 	cmnvc	r3, #457179136	; 0x1b400000
     6b8:	00656761 	rsbeq	r6, r5, r1, ror #14
     6bc:	67617461 	strbvs	r7, [r1, -r1, ror #8]!
     6c0:	736d0073 	cmnvc	sp, #115	; 0x73
     6c4:	6e656c67 	cdpvs	12, 6, cr6, cr5, cr7, {3}
     6c8:	435f5300 	cmpmi	pc, #0, 6
     6cc:	544e554f 	strbpl	r5, [lr], #-1359	; 0xfffffab1
     6d0:	646c4f00 	strbtvs	r4, [ip], #-3840	; 0xfffff100
     6d4:	69544d52 	ldmdbvs	r4, {r1, r4, r6, r8, sl, fp, lr}^
     6d8:	6e49656d 	cdpvs	5, 4, cr6, cr9, cr13, {3}
     6dc:	6f6e0074 	svcvs	0x006e0074
     6e0:	4d006976 	vstrmi.16	s12, [r0, #-236]	; 0xffffff14	; <UNPREDICTABLE>
     6e4:	00584f42 	subseq	r4, r8, r2, asr #30
     6e8:	6d767372 	ldclvs	3, cr7, [r6, #-456]!	; 0xfffffe38
     6ec:	53007874 	movwpl	r7, #2164	; 0x874
     6f0:	54504d45 	ldrbpl	r4, [r0], #-3397	; 0xfffff2bb
     6f4:	72500052 	subsvc	r0, r0, #82	; 0x52
     6f8:	69547665 	ldmdbvs	r4, {r0, r2, r5, r6, r9, sl, ip, sp, lr}^
     6fc:	0072656d 	rsbseq	r6, r2, sp, ror #10
     700:	746e6975 	strbtvc	r6, [lr], #-2421	; 0xfffff68b
     704:	00745f38 	rsbseq	r5, r4, r8, lsr pc
     708:	6c6c696b 			; <UNDEFINED> instruction: 0x6c6c696b
     70c:	7361745f 	cmnvc	r1, #1593835520	; 0x5f000000
     710:	626d006b 	rsbvs	r0, sp, #107	; 0x6b
     714:	00727470 	rsbseq	r7, r2, r0, ror r4
     718:	7478656e 	ldrbtvc	r6, [r8], #-1390	; 0xfffffa92
     71c:	6d65735f 	stclvs	3, cr7, [r5, #-380]!	; 0xfffffe84
     720:	7375735f 	cmnvc	r5, #2080374785	; 0x7c000001
     724:	65640070 	strbvs	r0, [r4, #-112]!	; 0xffffff90
     728:	5f79616c 	svcpl	0x0079616c
     72c:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
     730:	6f747300 	svcvs	0x00747300
     734:	69745f70 	ldmdbvs	r4!, {r4, r5, r6, r8, r9, sl, fp, ip, lr}^
     738:	6c73656d 	cfldr64vs	mvdx6, [r3], #-436	; 0xfffffe4c
     73c:	00656369 	rsbeq	r6, r5, r9, ror #6
     740:	574f5f53 	smlsldpl	r5, pc, r3, pc	; <UNPREDICTABLE>
     744:	0052454e 	subseq	r4, r2, lr, asr #10
     748:	5f495052 	svcpl	0x00495052
     74c:	4f495047 	svcmi	0x00495047
     750:	50520030 	subspl	r0, r2, r0, lsr r0
     754:	50475f49 	subpl	r5, r7, r9, asr #30
     758:	00314f49 	eorseq	r4, r1, r9, asr #30
     75c:	5f495052 	svcpl	0x00495052
     760:	4f495047 	svcmi	0x00495047
     764:	50520032 	subspl	r0, r2, r2, lsr r0
     768:	50475f49 	subpl	r5, r7, r9, asr #30
     76c:	00334f49 	eorseq	r4, r3, r9, asr #30
     770:	5f495052 	svcpl	0x00495052
     774:	4f495047 	svcmi	0x00495047
     778:	50520034 	subspl	r0, r2, r4, lsr r0
     77c:	50475f49 	subpl	r5, r7, r9, asr #30
     780:	00354f49 	eorseq	r4, r5, r9, asr #30
     784:	5f495052 	svcpl	0x00495052
     788:	4f495047 	svcmi	0x00495047
     78c:	50520036 	subspl	r0, r2, r6, lsr r0
     790:	50475f49 	subpl	r5, r7, r9, asr #30
     794:	00374f49 	eorseq	r4, r7, r9, asr #30
     798:	5f495052 	svcpl	0x00495052
     79c:	4f495047 	svcmi	0x00495047
     7a0:	6c630038 	stclvs	0, cr0, [r3], #-224	; 0xffffff20
     7a4:	5f726165 	svcpl	0x00726165
     7a8:	786f626d 	stmdavc	pc!, {r0, r2, r3, r5, r6, r9, sp, lr}^	; <UNPREDICTABLE>
     7ac:	77656e00 	strbvc	r6, [r5, -r0, lsl #28]!
     7b0:	6d69745f 	cfstrdvs	mvd7, [r9, #-380]!	; 0xfffffe84
     7b4:	616c0065 	cmnvs	ip, r5, rrx
     7b8:	745f7473 	ldrbvc	r7, [pc], #-1139	; 7c0 <_start-0x7840>
     7bc:	006b7361 	rsbeq	r7, fp, r1, ror #6
     7c0:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
     7c4:	72745f72 	rsbsvc	r5, r4, #456	; 0x1c8
     7c8:	72656769 	rsbvc	r6, r5, #27525120	; 0x1a40000
     7cc:	79727400 	ldmdbvc	r2!, {sl, ip, sp, lr}^
     7d0:	73767372 	cmnvc	r6, #-939524095	; 0xc8000001
     7d4:	544d006d 	strbpl	r0, [sp], #-109	; 0xffffff93
     7d8:	454d4954 	strbmi	r4, [sp, #-2388]	; 0xfffff6ac
     7dc:	444e4852 	strbmi	r4, [lr], #-2130	; 0xfffff7ae
     7e0:	73617400 	cmnvc	r1, #0, 8
     7e4:	6f6e5f6b 	svcvs	0x006e5f6b
     7e8:	6d697400 	cfstrdvs	mvd7, [r9, #-0]
     7ec:	665f7265 	ldrbvs	r7, [pc], -r5, ror #4
     7f0:	705f6e75 	subsvc	r6, pc, r5, ror lr	; <UNPREDICTABLE>
     7f4:	726f6972 	rsbvc	r6, pc, #1867776	; 0x1c8000
     7f8:	00797469 	rsbseq	r7, r9, r9, ror #8
     7fc:	48515f53 	ldmdami	r1, {r0, r1, r4, r6, r8, r9, sl, fp, ip, lr}^
     800:	54594200 	ldrbpl	r4, [r9], #-512	; 0xfffffe00
     804:	5f530045 	svcpl	0x00530045
     808:	73005451 	movwvc	r5, #1105	; 0x451
     80c:	755f7465 	ldrbvc	r7, [pc, #-1125]	; 3af <_start-0x7c51>
     810:	5f726573 	svcpl	0x00726573
     814:	37746e69 	ldrbcc	r6, [r4, -r9, ror #28]!
     818:	4f570030 	svcmi	0x00570030
     81c:	64004452 	strvs	r4, [r0], #-1106	; 0xfffffbae
     820:	78746d66 	ldmdavc	r4!, {r1, r2, r5, r6, r8, sl, fp, sp, lr}^
     824:	696e6900 	stmdbvs	lr!, {r8, fp, sp, lr}^
     828:	72635f74 	rsbvc	r5, r3, #116, 30	; 0x1d0
     82c:	65737469 	ldrbvs	r7, [r3, #-1129]!	; 0xfffffb97
     830:	6c720063 	ldclvs	0, cr0, [r2], #-396	; 0xfffffe74
     834:	635f6d73 	cmpvs	pc, #7360	; 0x1cc0
     838:	746e756f 	strbtvc	r7, [lr], #-1391	; 0xfffffa91
     83c:	6c644900 			; <UNDEFINED> instruction: 0x6c644900
     840:	73615465 	cmnvc	r1, #1694498816	; 0x65000000
     844:	6c4f006b 	mcrrvs	0, 6, r0, pc, cr11
     848:	73694464 	cmnvc	r9, #100, 8	; 0x64000000
     84c:	746e4970 	strbtvc	r4, [lr], #-2416	; 0xfffff690
     850:	6d657300 	stclvs	3, cr7, [r5, #-0]
     854:	726f6661 	rsbvc	r6, pc, #101711872	; 0x6100000
     858:	4e494c00 	cdpmi	12, 4, cr4, cr9, cr0, {0}
     85c:	6174004b 	cmnvs	r4, fp, asr #32
     860:	6d5f6b73 	vldrvs	d22, [pc, #-460]	; 69c <_start-0x7964>
     864:	5f786f62 	svcpl	0x00786f62
     868:	7373656d 	cmnvc	r3, #457179136	; 0x1b400000
     86c:	73656761 	cmnvc	r5, #25427968	; 0x1840000
     870:	565f4900 	ldrbpl	r4, [pc], -r0, lsl #18
     874:	454d4552 	strbmi	r4, [sp, #-1362]	; 0xfffffaae
     878:	41545300 	cmpmi	r4, r0, lsl #6
     87c:	465f4b43 	ldrbmi	r4, [pc], -r3, asr #22
     880:	454d4152 	strbmi	r4, [sp, #-338]	; 0xfffffeae
     884:	72617000 	rsbvc	r7, r1, #0
     888:	69006d61 	stmdbvs	r0, {r0, r5, r6, r8, sl, fp, sp, lr}
     88c:	6d74696e 			; <UNDEFINED> instruction: 0x6d74696e
     890:	68730074 	ldmdavs	r3!, {r2, r4, r5, r6}^
     894:	5f6d656d 	svcpl	0x006d656d
     898:	6e676973 			; <UNDEFINED> instruction: 0x6e676973
     89c:	72757461 	rsbsvc	r7, r5, #1627389952	; 0x61000000
     8a0:	74730065 	ldrbtvc	r0, [r3], #-101	; 0xffffff9b
     8a4:	5f747261 	svcpl	0x00747261
     8a8:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
     8ac:	4d485300 	stclmi	3, cr5, [r8, #-0]
     8b0:	485f4d45 	ldmdami	pc, {r0, r2, r6, r8, sl, fp, lr}^	; <UNPREDICTABLE>
     8b4:	45444145 	strbmi	r4, [r4, #-325]	; 0xfffffebb
     8b8:	68730052 	ldmdavs	r3!, {r1, r4, r6}^
     8bc:	5f6d656d 	svcpl	0x006d656d
     8c0:	6f6c6c61 	svcvs	0x006c6c61
     8c4:	69740063 	ldmdbvs	r4!, {r0, r1, r5, r6}^
     8c8:	5f72656d 	svcpl	0x0072656d
     8cc:	006d6573 	rsbeq	r6, sp, r3, ror r5
     8d0:	75716572 	ldrbvc	r6, [r1, #-1394]!	; 0xfffffa8e
     8d4:	00747365 	rsbseq	r7, r4, r5, ror #6
     8d8:	716d6573 	smcvc	54867	; 0xd653
     8dc:	65756575 	ldrbvs	r6, [r5, #-1397]!	; 0xfffffa8b
     8e0:	5f79625f 	svcpl	0x0079625f
     8e4:	6f697270 	svcvs	0x00697270
     8e8:	79746972 	ldmdbvc	r4!, {r1, r4, r5, r6, r8, fp, sp, lr}^
     8ec:	6d697400 	cfstrdvs	mvd7, [r9, #-0]
     8f0:	74656765 	strbtvc	r6, [r5], #-1893	; 0xfffff89b
     8f4:	5f534600 	svcpl	0x00534600
     8f8:	55504e49 	ldrbpl	r4, [r0, #-3657]	; 0xfffff1b7
     8fc:	69750054 	ldmdbvs	r5!, {r2, r4, r6}^
     900:	3631746e 	ldrtcc	r7, [r1], -lr, ror #8
     904:	7300745f 	movwvc	r7, #1119	; 0x45f
     908:	5f646e65 	svcpl	0x00646e65
     90c:	646e6f63 	strbtvs	r6, [lr], #-3939	; 0xfffff09d
     910:	7361745f 	cmnvc	r1, #1593835520	; 0x5f000000
     914:	656d5f6b 	strbvs	r5, [sp, #-3947]!	; 0xfffff095
     918:	67617373 			; <UNDEFINED> instruction: 0x67617373
     91c:	78650065 	stmdavc	r5!, {r0, r2, r5, r6}^
     920:	746d7469 	strbtvc	r7, [sp], #-1129	; 0xfffffb97
     924:	6c656400 	cfstrdvs	mvd6, [r5], #-0
     928:	00546174 	subseq	r6, r4, r4, ror r1
     92c:	41505f49 	cmpmi	r0, r9, asr #30
     930:	544e4552 	strbpl	r4, [lr], #-1362	; 0xfffffaae
     934:	73617400 	cmnvc	r1, #0, 8
     938:	75725f6b 	ldrbvc	r5, [r2, #-3947]!	; 0xfffff095
     93c:	72656e6e 	rsbvc	r6, r5, #1760	; 0x6e0
     940:	69616d00 	stmdbvs	r1!, {r8, sl, fp, sp, lr}^
     944:	786f626c 	stmdavc	pc!, {r2, r3, r5, r6, r9, sp, lr}^	; <UNPREDICTABLE>
     948:	73740070 	cmnvc	r4, #112	; 0x70
     94c:	7461725f 	strbtvc	r7, [r1], #-607	; 0xfffffda1
     950:	69640065 	stmdbvs	r4!, {r0, r2, r5, r6}^
     954:	74617073 	strbtvc	r7, [r1], #-115	; 0xffffff8d
     958:	73006863 	movwvc	r6, #2147	; 0x863
     95c:	6b636174 	blvs	18d8f34 <_stack+0x1858f34>
     960:	6d656d5f 	stclvs	13, cr6, [r5, #-380]!	; 0xfffffe84
     964:	6d697400 	cfstrdvs	mvd7, [r9, #-0]
     968:	635f7265 	cmpvs	pc, #1342177286	; 0x50000006
     96c:	746e756f 	strbtvc	r7, [lr], #-1391	; 0xfffffa91
     970:	7375735f 	cmnvc	r5, #2080374785	; 0x7c000001
     974:	75720070 	ldrbvc	r0, [r2, #-112]!	; 0xffffff90
     978:	6e696e6e 	cdpvs	14, 6, cr6, cr9, cr14, {3}
     97c:	6c720067 	ldclvs	0, cr0, [r2], #-412	; 0xfffffe64
     980:	74006d73 	strvc	r6, [r0], #-3443	; 0xfffff28d
     984:	5f656d69 	svcpl	0x00656d69
     988:	70737573 	rsbsvc	r7, r3, r3, ror r5
     98c:	6d687300 	stclvs	3, cr7, [r8, #-0]
     990:	705f6d65 	subsvc	r6, pc, r5, ror #26
     994:	63007274 	movwvs	r7, #628	; 0x274
     998:	74737275 	ldrbtvc	r7, [r3], #-629	; 0xfffffd8b
     99c:	00657461 	rsbeq	r7, r5, r1, ror #8
     9a0:	72617473 	rsbvc	r7, r1, #1929379840	; 0x73000000
     9a4:	6f705f74 	svcvs	0x00705f74
     9a8:	00746e69 	rsbseq	r6, r4, r9, ror #28
     9ac:	7473756a 	ldrbtvc	r7, [r3], #-1386	; 0xfffffa96
     9b0:	7972745f 	ldmdbvc	r2!, {r0, r1, r2, r3, r4, r6, sl, ip, sp, lr}^
     9b4:	61656c00 	cmnvs	r5, r0, lsl #24
     9b8:	635f6576 	cmpvs	pc, #494927872	; 0x1d800000
     9bc:	73746972 	cmnvc	r4, #1867776	; 0x1c8000
     9c0:	67006365 	strvs	r6, [r0, -r5, ror #6]
     9c4:	61747465 	cmnvs	r4, r5, ror #8
     9c8:	74736b73 	ldrbtvc	r6, [r3], #-2931	; 0xfffff48d
     9cc:	00657461 	rsbeq	r7, r5, r1, ror #8
     9d0:	52646c4f 	rsbpl	r6, r4, #20224	; 0x4f00
     9d4:	746e494d 	strbtvc	r4, [lr], #-2381	; 0xfffff6b3
     9d8:	54003531 	strpl	r3, [r0], #-1329	; 0xfffffacf
     9dc:	6e486b73 	vmovvs.8	d8[3], r6
     9e0:	6d730064 	ldclvs	0, cr0, [r3, #-400]!	; 0xfffffe70
     9e4:	4d747550 	cfldr64mi	mvdx7, [r4, #-320]!	; 0xfffffec0
     9e8:	6e006773 	mcrvs	7, 0, r6, cr0, cr3, {3}
     9ec:	5f747865 	svcpl	0x00747865
     9f0:	64616572 	strbtvs	r6, [r1], #-1394	; 0xfffffa8e
     9f4:	70630079 	rsbvc	r0, r3, r9, ror r0
     9f8:	6d007273 	sfmvs	f7, 4, [r0, #-460]	; 0xfffffe34
     9fc:	736c6961 	cmnvc	ip, #1589248	; 0x184000
     a00:	6d727400 	cfldrdvs	mvd7, [r2, #-0]
     a04:	53007172 	movwpl	r7, #370	; 0x172
     a08:	6e487379 	mcrvs	3, 2, r7, cr8, cr9, {3}
     a0c:	65720064 	ldrbvs	r0, [r2, #-100]!	; 0xffffff9c
     a10:	6e696461 	cdpvs	4, 6, cr6, cr9, cr1, {3}
     a14:	756f635f 	strbvc	r6, [pc, #-863]!	; 6bd <_start-0x7943>
     a18:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
     a1c:	6e696c00 	cdpvs	12, 6, cr6, cr9, cr0, {0}
     a20:	5f64656b 	svcpl	0x0064656b
     a24:	7473696c 	ldrbtvc	r6, [r3], #-2412	; 0xfffff694
     a28:	6d687300 	stclvs	3, cr7, [r8, #-0]
     a2c:	735f6d65 	cmpvc	pc, #6464	; 0x1940
     a30:	75746174 	ldrbvc	r6, [r4, #-372]!	; 0xfffffe8c
     a34:	5f490073 	svcpl	0x00490073
     a38:	54495753 	strbpl	r5, [r9], #-1875	; 0xfffff8ad
     a3c:	49004843 	stmdbmi	r0, {r0, r1, r6, fp, lr}
     a40:	705f4153 	subsvc	r4, pc, r3, asr r1	; <UNPREDICTABLE>
     a44:	71007274 	tstvc	r0, r4, ror r2
     a48:	65756575 	ldrbvs	r6, [r5, #-1397]!	; 0xfffffa8b
     a4c:	79727400 	ldmdbvc	r2!, {sl, ip, sp, lr}^
     a50:	6972635f 	ldmdbvs	r2!, {r0, r1, r2, r3, r4, r6, r8, r9, sp, lr}^
     a54:	63657374 	cmnvs	r5, #116, 6	; 0xd0000001
     a58:	555f4900 	ldrbpl	r4, [pc, #-2304]	; 160 <_start-0x7ea0>
     a5c:	4b4f525a 	blmi	13d53cc <_stack+0x13553cc>
     a60:	6f6c7300 	svcvs	0x006c7300
     a64:	6b007374 	blvs	1d83c <__bss_end__+0xd4f0>
     a68:	656e7265 	strbvs	r7, [lr, #-613]!	; 0xfffffd9b
     a6c:	616d5f6c 	cmnvs	sp, ip, ror #30
     a70:	70006e69 	andvc	r6, r0, r9, ror #28
     a74:	6d5f7475 	cfldrdvs	mvd7, [pc, #-468]	; 8a8 <_start-0x7758>
     a78:	61737365 	cmnvs	r3, r5, ror #6
     a7c:	67006567 	strvs	r6, [r0, -r7, ror #10]
     a80:	61687465 	cmnvs	r8, r5, ror #8
     a84:	656c646e 	strbvs	r6, [ip, #-1134]!	; 0xfffffb92
     a88:	4e490072 	mcrmi	0, 2, r0, cr9, cr2, {3}
     a8c:	54504654 	ldrbpl	r4, [r0], #-1620	; 0xfffff9ac
     a90:	65670052 	strbvs	r0, [r7, #-82]!	; 0xffffffae
     a94:	6f635f74 	svcvs	0x00635f74
     a98:	6d5f646e 	cfldrdvs	mvd6, [pc, #-440]	; 8e8 <_start-0x7718>
     a9c:	61737365 	cmnvs	r3, r5, ror #6
     aa0:	74006567 	strvc	r6, [r0], #-1383	; 0xfffffa99
     aa4:	746b7361 	strbtvc	r7, [fp], #-865	; 0xfffffc9f
     aa8:	00656d69 	rsbeq	r6, r5, r9, ror #26
     aac:	656d6954 	strbvs	r6, [sp, #-2388]!	; 0xfffff6ac
     ab0:	4f746e49 	svcmi	0x00746e49
     ab4:	00676972 	rsbeq	r6, r7, r2, ror r9
     ab8:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
     abc:	6e616863 	cdpvs	8, 6, cr6, cr1, cr3, {3}
     ac0:	74006567 	strvc	r6, [r0], #-1383	; 0xfffffa99
     ac4:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
     ac8:	6174735f 	cmnvs	r4, pc, asr r3
     acc:	00737574 	rsbseq	r7, r3, r4, ror r5
     ad0:	6f666966 	svcvs	0x00666966
     ad4:	746e6900 	strbtvc	r6, [lr], #-2304	; 0xfffff700
     ad8:	635f3037 	cmpvs	pc, #55	; 0x37
     adc:	746e756f 	strbtvc	r7, [lr], #-1391	; 0xfffffa91
     ae0:	74007265 	strvc	r7, [r0], #-613	; 0xfffffd9b
     ae4:	735f6d69 	cmpvc	pc, #6720	; 0x1a40
     ae8:	68707375 	ldmdavs	r0!, {r0, r2, r4, r5, r6, r8, r9, ip, sp, lr}^
     aec:	00646165 	rsbeq	r6, r4, r5, ror #2
     af0:	574f5f53 	smlsldpl	r5, pc, r3, pc	; <UNPREDICTABLE>
     af4:	544e434e 	strbpl	r4, [lr], #-846	; 0xfffffcb2
     af8:	61747300 	cmnvs	r4, r0, lsl #6
     afc:	745f7472 	ldrbvc	r7, [pc], #-1138	; b04 <_start-0x74fc>
     b00:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
     b04:	61747300 	cmnvs	r4, r0, lsl #6
     b08:	705f6b63 	subsvc	r6, pc, r3, ror #22
     b0c:	73007274 	movwvc	r7, #628	; 0x274
     b10:	7465476d 	strbtvc	r4, [r5], #-1901	; 0xfffff893
     b14:	0067734d 	rsbeq	r7, r7, sp, asr #6
     b18:	5f495052 	svcpl	0x00495052
     b1c:	4f495047 	svcmi	0x00495047
     b20:	54003832 	strpl	r3, [r0], #-2098	; 0xfffff7ce
     b24:	446b7361 	strbtmi	r7, [fp], #-865	; 0xfffffc9f
     b28:	00707369 	rsbseq	r7, r0, r9, ror #6
     b2c:	6b657473 	blvs	195dd00 <_stack+0x18ddd00>
     b30:	006e656c 	rsbeq	r6, lr, ip, ror #10
     b34:	656d6873 	strbvs	r6, [sp, #-2163]!	; 0xfffff78d
     b38:	72665f6d 	rsbvc	r5, r6, #436	; 0x1b4
     b3c:	46006565 	strmi	r6, [r0], -r5, ror #10
     b40:	4c415f53 	mcrrmi	15, 5, r5, r1, cr3
     b44:	46003054 			; <UNDEFINED> instruction: 0x46003054
     b48:	4c415f53 	mcrrmi	15, 5, r5, r1, cr3
     b4c:	46003154 			; <UNDEFINED> instruction: 0x46003154
     b50:	4c415f53 	mcrrmi	15, 5, r5, r1, cr3
     b54:	46003254 			; <UNDEFINED> instruction: 0x46003254
     b58:	4c415f53 	mcrrmi	15, 5, r5, r1, cr3
     b5c:	46003354 			; <UNDEFINED> instruction: 0x46003354
     b60:	4c415f53 	mcrrmi	15, 5, r5, r1, cr3
     b64:	46003454 			; <UNDEFINED> instruction: 0x46003454
     b68:	4c415f53 	mcrrmi	15, 5, r5, r1, cr3
     b6c:	74003554 	strvc	r3, [r0], #-1364	; 0xfffffaac
     b70:	665f6b73 			; <UNDEFINED> instruction: 0x665f6b73
     b74:	69006e75 	stmdbvs	r0, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}
     b78:	77735f6e 	ldrbvc	r5, [r3, -lr, ror #30]!
     b7c:	68637469 	stmdavs	r3!, {r0, r3, r5, r6, sl, ip, sp, lr}^
     b80:	00676e69 	rsbeq	r6, r7, r9, ror #28
     b84:	524c5f49 	subpl	r5, ip, #292	; 0x124
     b88:	7263004e 	rsbvc	r0, r3, #78	; 0x4e
     b8c:	65746165 	ldrbvs	r6, [r4, #-357]!	; 0xfffffe9b
     b90:	7361745f 	cmnvc	r1, #1593835520	; 0x5f000000
     b94:	656c006b 	strbvs	r0, [ip, #-107]!	; 0xffffff95
     b98:	636c6576 	cmnvs	ip, #494927872	; 0x1d800000
     b9c:	676e6168 	strbvs	r6, [lr, -r8, ror #2]!
     ba0:	6f640065 	svcvs	0x00640065
     ba4:	656c6275 	strbvs	r6, [ip, #-629]!	; 0xfffffd8b
     ba8:	58544d00 	ldmdapl	r4, {r8, sl, fp, lr}^
     bac:	00525450 	subseq	r5, r2, r0, asr r4
     bb0:	615f746d 	cmpvs	pc, sp, ror #8
     bb4:	72007463 	andvc	r7, r0, #1660944384	; 0x63000000
     bb8:	5f646165 	svcpl	0x00646165
     bbc:	6b736174 	blvs	1cd9194 <_stack+0x1c59194>
     bc0:	73656d5f 	cmnvc	r5, #6080	; 0x17c0
     bc4:	65676173 	strbvs	r6, [r7, #-371]!	; 0xfffffe8d
     bc8:	73795300 	cmnvc	r9, #0, 6
     bcc:	6e69614d 	powvsem	f6, f1, #5.0
     bd0:	616e6574 	smcvs	58964	; 0xe654
     bd4:	0065636e 	rsbeq	r6, r5, lr, ror #6
     bd8:	656d6954 	strbvs	r6, [sp, #-2388]!	; 0xfffff6ac
     bdc:	73694c72 	cmnvc	r9, #29184	; 0x7200
     be0:	61654874 	smcvs	21636	; 0x5484
     be4:	72630064 	rsbvc	r0, r3, #100	; 0x64
     be8:	65746165 	ldrbvs	r6, [r4, #-357]!	; 0xfffffe9b
     bec:	6d69745f 	cfstrdvs	mvd7, [r9, #-380]!	; 0xfffffe84
     bf0:	67007265 	strvs	r7, [r0, -r5, ror #4]
     bf4:	635f7465 	cmpvs	pc, #1694498816	; 0x65000000
     bf8:	5f646e6f 	svcpl	0x00646e6f
     bfc:	6b736174 	blvs	1cd91d4 <_stack+0x1c591d4>
     c00:	73656d5f 	cmnvc	r5, #6080	; 0x17c0
     c04:	65676173 	strbvs	r6, [r7, #-371]!	; 0xfffffe8d
     c08:	6d695400 	cfstrdvs	mvd5, [r9, #-0]
     c0c:	6e487265 	cdpvs	2, 4, cr7, cr8, cr5, {3}
     c10:	68730064 	ldmdavs	r3!, {r2, r5, r6}^
     c14:	745f746f 	ldrbvc	r7, [pc], #-1135	; c1c <_start-0x73e4>
     c18:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
     c1c:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     c20:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     c24:	0030314f 	eorseq	r3, r0, pc, asr #2
     c28:	5f495052 	svcpl	0x00495052
     c2c:	4f495047 	svcmi	0x00495047
     c30:	52003131 	andpl	r3, r0, #1073741836	; 0x4000000c
     c34:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     c38:	314f4950 	cmpcc	pc, r0, asr r9	; <UNPREDICTABLE>
     c3c:	50520032 	subspl	r0, r2, r2, lsr r0
     c40:	50475f49 	subpl	r5, r7, r9, asr #30
     c44:	33314f49 	teqcc	r1, #292	; 0x124
     c48:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     c4c:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     c50:	0034314f 	eorseq	r3, r4, pc, asr #2
     c54:	5f495052 	svcpl	0x00495052
     c58:	4f495047 	svcmi	0x00495047
     c5c:	52003531 	andpl	r3, r0, #205520896	; 0xc400000
     c60:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     c64:	314f4950 	cmpcc	pc, r0, asr r9	; <UNPREDICTABLE>
     c68:	50520036 	subspl	r0, r2, r6, lsr r0
     c6c:	50475f49 	subpl	r5, r7, r9, asr #30
     c70:	37314f49 	ldrcc	r4, [r1, -r9, asr #30]!
     c74:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     c78:	4950475f 	ldmdbmi	r0, {r0, r1, r2, r3, r4, r6, r8, r9, sl, lr}^
     c7c:	0038314f 	eorseq	r3, r8, pc, asr #2
     c80:	5f495052 	svcpl	0x00495052
     c84:	4f495047 	svcmi	0x00495047
     c88:	4c003931 			; <UNDEFINED> instruction: 0x4c003931
     c8c:	0064616f 	rsbeq	r6, r4, pc, ror #2
     c90:	6f6c6552 	svcvs	0x006c6552
     c94:	52006461 	andpl	r6, r0, #1627389952	; 0x61000000
     c98:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
     c9c:	72417465 	subvc	r7, r1, #1694498816	; 0x65000000
     ca0:	6d69546d 	cfstrdvs	mvd5, [r9, #-436]!	; 0xfffffe4c
     ca4:	72007265 	andvc	r7, r0, #1342177286	; 0x50000006
     ca8:	615f6970 	cmpvs	pc, r0, ror r9	; <UNPREDICTABLE>
     cac:	745f6d72 	ldrbvc	r6, [pc], #-3442	; cb4 <_start-0x734c>
     cb0:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
     cb4:	7200745f 	andvc	r7, r0, #1593835520	; 0x5f000000
     cb8:	72416970 	subvc	r6, r1, #112, 18	; 0x1c0000
     cbc:	6d69546d 	cfstrdvs	mvd5, [r9, #-436]!	; 0xfffffe4c
     cc0:	52007265 	andpl	r7, r0, #1342177286	; 0x50000006
     cc4:	52495741 	subpl	r5, r9, #17039360	; 0x1040000
     cc8:	614d0051 	qdaddvs	r0, r1, sp
     ccc:	64656b73 	strbtvs	r6, [r5], #-2931	; 0xfffff48d
     cd0:	00515249 	subseq	r5, r1, r9, asr #4
     cd4:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; c20 <_start-0x73e0>
     cd8:	74722f65 	ldrbtvc	r2, [r2], #-3941	; 0xfffff09b
     cdc:	442f6b72 	strtmi	r6, [pc], #-2930	; ce4 <_start-0x731c>
     ce0:	746b7365 	strbtvc	r7, [fp], #-869	; 0xfffffc9b
     ce4:	6c2f706f 	stcvs	0, cr7, [pc], #-444	; b30 <_start-0x74d0>
     ce8:	696d736f 	stmdbvs	sp!, {r0, r1, r2, r3, r5, r6, r8, r9, ip, sp, lr}^
     cec:	6d6f6b5f 	fstmdbxvs	pc!, {d22-d68}	;@ Deprecated
     cf0:	61746e65 	cmnvs	r4, r5, ror #28
     cf4:	61736972 	cmnvs	r3, r2, ror r9
     cf8:	65762f6f 	ldrbvs	r2, [r6, #-3951]!	; 0xfffff091
     cfc:	3061627a 	rsbcc	r6, r1, sl, ror r2
     d00:	656b2f38 	strbvs	r2, [fp, #-3896]!	; 0xfffff0c8
     d04:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
     d08:	6970722f 	ldmdbvs	r0!, {r0, r1, r2, r3, r5, r9, ip, sp, lr}^
     d0c:	6d72612d 	ldfvse	f6, [r2, #-180]!	; 0xffffff4c
     d10:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
     d14:	00632e72 	rsbeq	r2, r3, r2, ror lr
     d18:	44657250 	strbtmi	r7, [r5], #-592	; 0xfffffdb0
     d1c:	64697669 	strbtvs	r7, [r9], #-1641	; 0xfffff997
     d20:	46007265 	strmi	r7, [r0], -r5, ror #4
     d24:	52656572 	rsbpl	r6, r5, #478150656	; 0x1c800000
     d28:	696e6e75 	stmdbvs	lr!, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
     d2c:	6f43676e 	svcvs	0x0043676e
     d30:	65746e75 	ldrbvs	r6, [r4, #-3701]!	; 0xfffff18b
     d34:	6f430072 	svcvs	0x00430072
     d38:	6f72746e 	svcvs	0x0072746e
     d3c:	5052006c 	subspl	r0, r2, ip, rrx
     d40:	72415f49 	subvc	r5, r1, #292	; 0x124
     d44:	6d69546d 	cfstrdvs	mvd5, [r9, #-436]!	; 0xfffffe4c
     d48:	6e497265 	cdpvs	2, 4, cr7, cr9, cr5, {3}
     d4c:	49007469 	stmdbmi	r0, {r0, r3, r5, r6, sl, ip, sp, lr}
     d50:	6c435152 	stfvse	f5, [r3], {82}	; 0x52
     d54:	00726165 	rsbseq	r6, r2, r5, ror #2
     d58:	4c5f554d 	cfldr64mi	mvdx5, [pc], {77}	; 0x4d
     d5c:	4d005253 	sfmmi	f5, 4, [r0, #-332]	; 0xfffffeb4
     d60:	4f495f55 	svcmi	0x00495f55
     d64:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     d68:	7875415f 	ldmdavc	r5!, {r0, r1, r2, r3, r4, r6, r8, lr}^
     d6c:	696e694d 	stmdbvs	lr!, {r0, r2, r3, r6, r8, fp, sp, lr}^
     d70:	74726155 	ldrbtvc	r6, [r2], #-341	; 0xfffffeab
     d74:	64616552 	strbtvs	r6, [r1], #-1362	; 0xfffffaae
     d78:	5f554d00 	svcpl	0x00554d00
     d7c:	41524353 	cmpmi	r2, r3, asr r3
     d80:	00484354 	subeq	r4, r8, r4, asr r3
     d84:	425f554d 	subsmi	r5, pc, #322961408	; 0x13400000
     d88:	00445541 	subeq	r5, r4, r1, asr #10
     d8c:	73746962 	cmnvc	r4, #1605632	; 0x188000
     d90:	49505300 	ldmdbmi	r0, {r8, r9, ip, lr}^
     d94:	45505f30 	ldrbmi	r5, [r0, #-3888]	; 0xfffff0d0
     d98:	4d004b45 	vstrmi	d4, [r0, #-276]	; 0xfffffeec
     d9c:	49495f55 	stmdbmi	r9, {r0, r2, r4, r6, r8, r9, sl, fp, ip, lr}^
     da0:	554d0052 	strbpl	r0, [sp, #-82]	; 0xffffffae
     da4:	4154535f 	cmpmi	r4, pc, asr r3
     da8:	65670054 	strbvs	r0, [r7, #-84]!	; 0xffffffac
     dac:	00686374 	rsbeq	r6, r8, r4, ror r3
     db0:	6e697270 	mcrvs	2, 3, r7, cr9, cr0, {3}
     db4:	74735f74 	ldrbtvc	r5, [r3], #-3956	; 0xfffff08c
     db8:	50530072 	subspl	r0, r3, r2, ror r0
     dbc:	505f3149 	subspl	r3, pc, r9, asr #2
     dc0:	004b4545 	subeq	r4, fp, r5, asr #10
     dc4:	6e697270 	mcrvs	2, 3, r7, cr9, cr0, {3}
     dc8:	756e5f74 	strbvc	r5, [lr, #-3956]!	; 0xfffff08c
     dcc:	5053006d 	subspl	r0, r3, sp, rrx
     dd0:	495f3149 	ldmdbmi	pc, {r0, r3, r6, r8, ip, sp}^	; <UNPREDICTABLE>
     dd4:	5053004f 	subspl	r0, r3, pc, asr #32
     dd8:	435f3149 	cmpmi	pc, #1073741842	; 0x40000012
     ddc:	304c544e 	subcc	r5, ip, lr, asr #8
     de0:	49505300 	ldmdbmi	r0, {r8, r9, ip, lr}^
     de4:	4e435f31 	mcrmi	15, 2, r5, cr3, cr1, {1}
     de8:	00314c54 	eorseq	r4, r1, r4, asr ip
     dec:	30495053 	subcc	r5, r9, r3, asr r0
     df0:	004f495f 	subeq	r4, pc, pc, asr r9	; <UNPREDICTABLE>
     df4:	5f495052 	svcpl	0x00495052
     df8:	4d787541 	cfldr64mi	mvdx7, [r8, #-260]!	; 0xfffffefc
     dfc:	55696e69 	strbpl	r6, [r9, #-3689]!	; 0xfffff197
     e00:	49747261 	ldmdbmi	r4!, {r0, r5, r6, r9, ip, sp, lr}^
     e04:	0074696e 	rsbseq	r6, r4, lr, ror #18
     e08:	5f787561 	svcpl	0x00787561
     e0c:	682f0074 	stmdavs	pc!, {r2, r4, r5, r6}	; <UNPREDICTABLE>
     e10:	2f656d6f 	svccs	0x00656d6f
     e14:	6b727472 	blvs	1c9dfe4 <_stack+0x1c1dfe4>
     e18:	7365442f 	cmnvc	r5, #788529152	; 0x2f000000
     e1c:	706f746b 	rsbvc	r7, pc, fp, ror #8
     e20:	736f6c2f 	cmnvc	pc, #12032	; 0x2f00
     e24:	6b5f696d 	blvs	17db3e0 <_stack+0x175b3e0>
     e28:	6e656d6f 	cdpvs	13, 6, cr6, cr5, cr15, {3}
     e2c:	69726174 	ldmdbvs	r2!, {r2, r4, r5, r6, r8, sp, lr}^
     e30:	2f6f6173 	svccs	0x006f6173
     e34:	627a6576 	rsbsvs	r6, sl, #494927872	; 0x1d800000
     e38:	2f383061 	svccs	0x00383061
     e3c:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
     e40:	722f6c65 	eorvc	r6, pc, #25856	; 0x6500
     e44:	612d6970 			; <UNDEFINED> instruction: 0x612d6970
     e48:	632e7875 			; <UNDEFINED> instruction: 0x632e7875
     e4c:	5f554d00 	svcpl	0x00554d00
     e50:	4c544e43 	mrrcmi	14, 4, r4, r4, cr3	; <UNPREDICTABLE>
     e54:	49505300 	ldmdbmi	r0, {r8, r9, ip, lr}^
     e58:	4e435f30 	mcrmi	15, 2, r5, cr3, cr0, {1}
     e5c:	00304c54 	eorseq	r4, r0, r4, asr ip
     e60:	30495053 	subcc	r5, r9, r3, asr r0
     e64:	544e435f 	strbpl	r4, [lr], #-863	; 0xfffffca1
     e68:	5300314c 	movwpl	r3, #332	; 0x14c
     e6c:	5f304950 	svcpl	0x00304950
     e70:	54415453 	strbpl	r5, [r1], #-1107	; 0xfffffbad
     e74:	414e4500 	cmpmi	lr, r0, lsl #10
     e78:	53454c42 	movtpl	r4, #23618	; 0x5c42
     e7c:	5f554d00 	svcpl	0x00554d00
     e80:	00524549 	subseq	r4, r2, r9, asr #10
     e84:	64756162 	ldrbtvs	r6, [r5], #-354	; 0xfffffe9e
     e88:	5f554d00 	svcpl	0x00554d00
     e8c:	0052434d 	subseq	r4, r2, sp, asr #6
     e90:	5f495052 	svcpl	0x00495052
     e94:	41746547 	cmnmi	r4, r7, asr #10
     e98:	53007875 	movwpl	r7, #2165	; 0x875
     e9c:	5f314950 	svcpl	0x00314950
     ea0:	54415453 	strbpl	r5, [r1], #-1107	; 0xfffffbad
     ea4:	69727000 	ldmdbvs	r2!, {ip, sp, lr}^
     ea8:	635f746e 	cmpvs	pc, #1845493760	; 0x6e000000
     eac:	00726168 	rsbseq	r6, r2, r8, ror #2
     eb0:	4d5f554d 	cfldr64mi	mvdx5, [pc, #-308]	; d84 <_start-0x727c>
     eb4:	61005253 	tstvs	r0, r3, asr r2
     eb8:	6c697875 	stclvs	8, cr7, [r9], #-468	; 0xfffffe2c
     ebc:	7972616c 	ldmdbvc	r2!, {r2, r3, r5, r6, r8, sp, lr}^
     ec0:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     ec4:	7875415f 	ldmdavc	r5!, {r0, r1, r2, r3, r4, r6, r8, lr}^
     ec8:	696e694d 	stmdbvs	lr!, {r0, r2, r3, r6, r8, fp, sp, lr}^
     ecc:	74726155 	ldrbtvc	r6, [r2], #-341	; 0xfffffeab
     ed0:	74697257 	strbtvc	r7, [r9], #-599	; 0xfffffda9
     ed4:	554d0065 	strbpl	r0, [sp, #-101]	; 0xffffff9b
     ed8:	52434c5f 	subpl	r4, r3, #24320	; 0x5f00
     edc:	73657200 	cmnvc	r5, #0, 4
     ee0:	65767265 	ldrbvs	r7, [r6, #-613]!	; 0xfffffd9b
     ee4:	72003164 	andvc	r3, r0, #100, 2
     ee8:	72657365 	rsbvc	r7, r5, #-1811939327	; 0x94000001
     eec:	32646576 	rsbcc	r6, r4, #494927872	; 0x1d800000
     ef0:	73657200 	cmnvc	r5, #0, 4
     ef4:	65767265 	ldrbvs	r7, [r6, #-613]!	; 0xfffffd9b
     ef8:	72003364 	andvc	r3, r0, #100, 6	; 0x90000001
     efc:	6c757365 	ldclvs	3, cr7, [r5], #-404	; 0xfffffe6c
     f00:	50470074 	subpl	r0, r7, r4, ror r0
     f04:	30544553 	subscc	r4, r4, r3, asr r5
     f08:	53504700 	cmppl	r0, #0, 14
     f0c:	00315445 	eorseq	r5, r1, r5, asr #8
     f10:	53465047 	movtpl	r5, #24647	; 0x6047
     f14:	00304c45 	eorseq	r4, r0, r5, asr #24
     f18:	53465047 	movtpl	r5, #24647	; 0x6047
     f1c:	00314c45 	eorseq	r4, r1, r5, asr #24
     f20:	53465047 	movtpl	r5, #24647	; 0x6047
     f24:	00324c45 	eorseq	r4, r2, r5, asr #24
     f28:	53465047 	movtpl	r5, #24647	; 0x6047
     f2c:	00334c45 	eorseq	r4, r3, r5, asr #24
     f30:	53465047 	movtpl	r5, #24647	; 0x6047
     f34:	00344c45 	eorseq	r4, r4, r5, asr #24
     f38:	53465047 	movtpl	r5, #24647	; 0x6047
     f3c:	00354c45 	eorseq	r4, r5, r5, asr #24
     f40:	45465047 	strbmi	r5, [r6, #-71]	; 0xffffffb9
     f44:	7200314e 	andvc	r3, r0, #-2147483629	; 0x80000013
     f48:	70476970 	subvc	r6, r7, r0, ror r9
     f4c:	52006f69 	andpl	r6, r0, #420	; 0x1a4
     f50:	495f4950 	ldmdbmi	pc, {r4, r6, r8, fp, lr}^	; <UNPREDICTABLE>
     f54:	4e555f4f 	cdpmi	15, 5, cr5, cr5, cr15, {2}
     f58:	574f4e4b 	strbpl	r4, [pc, -fp, asr #28]
     f5c:	5052004e 	subspl	r0, r2, lr, asr #32
     f60:	65535f49 	ldrbvs	r5, [r3, #-3913]	; 0xfffff0b7
     f64:	69704774 	ldmdbvs	r0!, {r2, r4, r5, r6, r8, r9, sl, lr}^
     f68:	74754f6f 	ldrbtvc	r4, [r5], #-3951	; 0xfffff091
     f6c:	00747570 	rsbseq	r7, r4, r0, ror r5
     f70:	45525047 	ldrbmi	r5, [r2, #-71]	; 0xffffffb9
     f74:	4700304e 	strmi	r3, [r0, -lr, asr #32]
     f78:	4e455250 	mcrmi	2, 2, r5, cr5, cr0, {2}
     f7c:	50470031 	subpl	r0, r7, r1, lsr r0
     f80:	304e4548 	subcc	r4, lr, r8, asr #10
     f84:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
     f88:	7465535f 	strbtvc	r5, [r5], #-863	; 0xfffffca1
     f8c:	6f697047 	svcvs	0x00697047
     f90:	466e6950 			; <UNDEFINED> instruction: 0x466e6950
     f94:	74636e75 	strbtvc	r6, [r3], #-3701	; 0xfffff18b
     f98:	006e6f69 	rsbeq	r6, lr, r9, ror #30
     f9c:	756c6176 	strbvc	r6, [ip, #-374]!	; 0xfffffe8a
     fa0:	65520065 	ldrbvs	r0, [r2, #-101]	; 0xffffff9b
     fa4:	76726573 			; <UNDEFINED> instruction: 0x76726573
     fa8:	00306465 	eorseq	r6, r0, r5, ror #8
     fac:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
     fb0:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
     fb4:	65520031 	ldrbvs	r0, [r2, #-49]	; 0xffffffcf
     fb8:	76726573 			; <UNDEFINED> instruction: 0x76726573
     fbc:	00326465 	eorseq	r6, r2, r5, ror #8
     fc0:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
     fc4:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
     fc8:	65520033 	ldrbvs	r0, [r2, #-51]	; 0xffffffcd
     fcc:	76726573 			; <UNDEFINED> instruction: 0x76726573
     fd0:	00346465 	eorseq	r6, r4, r5, ror #8
     fd4:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
     fd8:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
     fdc:	50470035 	subpl	r0, r7, r5, lsr r0
     fe0:	30534445 	subscc	r4, r3, r5, asr #8
     fe4:	45504700 	ldrbmi	r4, [r0, #-1792]	; 0xfffff900
     fe8:	00315344 	eorseq	r5, r1, r4, asr #6
     fec:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
     ff0:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
     ff4:	65520038 	ldrbvs	r0, [r2, #-56]	; 0xffffffc8
     ff8:	76726573 			; <UNDEFINED> instruction: 0x76726573
     ffc:	00396465 	eorseq	r6, r9, r5, ror #8
    1000:	6c657366 	stclvs	3, cr7, [r5], #-408	; 0xfffffe68
    1004:	6765725f 			; <UNDEFINED> instruction: 0x6765725f
    1008:	69706700 	ldmdbvs	r0!, {r8, r9, sl, sp, lr}^
    100c:	5047006f 	subpl	r0, r7, pc, rrx
    1010:	00445550 	subeq	r5, r4, r0, asr r5
    1014:	5f495052 	svcpl	0x00495052
    1018:	47746553 			; <UNDEFINED> instruction: 0x47746553
    101c:	496f6970 	stmdbmi	pc!, {r4, r5, r6, r8, fp, sp, lr}^	; <UNPREDICTABLE>
    1020:	7475706e 	ldrbtvc	r7, [r5], #-110	; 0xffffff92
    1024:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
    1028:	7465475f 	strbtvc	r4, [r5], #-1887	; 0xfffff8a1
    102c:	6f697047 	svcvs	0x00697047
    1030:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
    1034:	7465535f 	strbtvc	r5, [r5], #-863	; 0xfffffca1
    1038:	6f697047 	svcvs	0x00697047
    103c:	72006f4c 	andvc	r6, r0, #76, 30	; 0x130
    1040:	675f6970 			; <UNDEFINED> instruction: 0x675f6970
    1044:	5f6f6970 	svcpl	0x006f6970
    1048:	5f6e6970 	svcpl	0x006e6970
    104c:	50470074 	subpl	r0, r7, r4, ror r0
    1050:	304e454c 	subcc	r4, lr, ip, asr #10
    1054:	41504700 	cmpmi	r0, r0, lsl #14
    1058:	304e4546 	subcc	r4, lr, r6, asr #10
    105c:	41504700 	cmpmi	r0, r0, lsl #14
    1060:	314e4546 	cmpcc	lr, r6, asr #10
    1064:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
    1068:	7465535f 	strbtvc	r5, [r5], #-863	; 0xfffffca1
    106c:	6f697047 	svcvs	0x00697047
    1070:	756c6156 	strbvc	r6, [ip, #-342]!	; 0xfffffeaa
    1074:	50520065 	subspl	r0, r2, r5, rrx
    1078:	4f495f49 	svcmi	0x00495f49
    107c:	004f4c5f 	subeq	r4, pc, pc, asr ip	; <UNPREDICTABLE>
    1080:	4c435047 	mcrrmi	0, 4, r5, r3, cr7
    1084:	52003152 	andpl	r3, r0, #-2147483628	; 0x80000014
    1088:	72657365 	rsbvc	r7, r5, #-1811939327	; 0x94000001
    108c:	31646576 	smccc	18006	; 0x4656
    1090:	50470031 	subpl	r0, r7, r1, lsr r0
    1094:	4e455241 	cdpmi	2, 4, cr5, cr5, cr1, {2}
    1098:	50520030 	subspl	r0, r2, r0, lsr r0
    109c:	4f495f49 	svcmi	0x00495f49
    10a0:	0049485f 	subeq	r4, r9, pc, asr r8
    10a4:	454c5047 	strbmi	r5, [ip, #-71]	; 0xffffffb9
    10a8:	4700314e 	strmi	r3, [r0, -lr, asr #2]
    10ac:	56454c50 			; <UNDEFINED> instruction: 0x56454c50
    10b0:	70720030 	rsbsvc	r0, r2, r0, lsr r0
    10b4:	65725f69 	ldrbvs	r5, [r2, #-3945]!	; 0xfffff097
    10b8:	77725f67 	ldrbvc	r5, [r2, -r7, ror #30]!
    10bc:	4700745f 	smlsdmi	r0, pc, r4, r7	; <UNPREDICTABLE>
    10c0:	44555050 	ldrbmi	r5, [r5], #-80	; 0xffffffb0
    10c4:	304b4c43 	subcc	r4, fp, r3, asr #24
    10c8:	73655200 	cmnvc	r5, #0, 4
    10cc:	65767265 	ldrbvs	r7, [r6, #-613]!	; 0xfffffd9b
    10d0:	00303164 	eorseq	r3, r0, r4, ror #2
    10d4:	52415047 	subpl	r5, r1, #71	; 0x47
    10d8:	00314e45 	eorseq	r4, r1, r5, asr #28
    10dc:	5f697072 	svcpl	0x00697072
    10e0:	6f697067 	svcvs	0x00697067
    10e4:	746c615f 	strbtvc	r6, [ip], #-351	; 0xfffffea1
    10e8:	6e75665f 	mrcvs	6, 3, r6, cr5, cr15, {2}
    10ec:	6f697463 	svcvs	0x00697463
    10f0:	00745f6e 	rsbseq	r5, r4, lr, ror #30
    10f4:	636e7566 	cmnvs	lr, #427819008	; 0x19800000
    10f8:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
    10fc:	6970675f 	ldmdbvs	r0!, {r0, r1, r2, r3, r4, r6, r8, r9, sl, sp, lr}^
    1100:	61765f6f 	cmnvs	r6, pc, ror #30
    1104:	5f65756c 	svcpl	0x0065756c
    1108:	50470074 	subpl	r0, r7, r4, ror r0
    110c:	43445550 	movtmi	r5, #17744	; 0x4550
    1110:	00314b4c 	eorseq	r4, r1, ip, asr #22
    1114:	5f495052 	svcpl	0x00495052
    1118:	4f5f4f49 	svcmi	0x005f4f49
    111c:	682f004e 	stmdavs	pc!, {r1, r2, r3, r6}	; <UNPREDICTABLE>
    1120:	2f656d6f 	svccs	0x00656d6f
    1124:	6b727472 	blvs	1c9e2f4 <_stack+0x1c1e2f4>
    1128:	7365442f 	cmnvc	r5, #788529152	; 0x2f000000
    112c:	706f746b 	rsbvc	r7, pc, fp, ror #8
    1130:	736f6c2f 	cmnvc	pc, #12032	; 0x2f00
    1134:	6b5f696d 	blvs	17db6f0 <_stack+0x175b6f0>
    1138:	6e656d6f 	cdpvs	13, 6, cr6, cr5, cr15, {3}
    113c:	69726174 	ldmdbvs	r2!, {r2, r4, r5, r6, r8, sp, lr}^
    1140:	2f6f6173 	svccs	0x006f6173
    1144:	627a6576 	rsbsvs	r6, sl, #494927872	; 0x1d800000
    1148:	2f383061 	svccs	0x00383061
    114c:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
    1150:	722f6c65 	eorvc	r6, pc, #25856	; 0x6500
    1154:	672d6970 			; <UNDEFINED> instruction: 0x672d6970
    1158:	2e6f6970 			; <UNDEFINED> instruction: 0x2e6f6970
    115c:	50470063 	subpl	r0, r7, r3, rrx
    1160:	3156454c 	cmpcc	r6, ip, asr #10
    1164:	73655200 	cmnvc	r5, #0, 4
    1168:	65767265 	ldrbvs	r7, [r6, #-613]!	; 0xfffffd9b
    116c:	47003664 	strmi	r3, [r0, -r4, ror #12]
    1170:	4e454850 	mcrmi	8, 2, r4, cr5, cr0, {2}
    1174:	50520031 	subspl	r0, r2, r1, lsr r0
    1178:	65535f49 	ldrbvs	r5, [r3, #-3913]	; 0xfffff0b7
    117c:	69704774 	ldmdbvs	r0!, {r2, r4, r5, r6, r8, r9, sl, lr}^
    1180:	0069486f 	rsbeq	r4, r9, pc, ror #16
    1184:	5f495052 	svcpl	0x00495052
    1188:	4f5f4f49 	svcmi	0x005f4f49
    118c:	72004646 	andvc	r4, r0, #73400320	; 0x4600000
    1190:	725f6970 	subsvc	r6, pc, #112, 18	; 0x1c0000
    1194:	775f6765 	ldrbvc	r6, [pc, -r5, ror #14]
    1198:	00745f6f 	rsbseq	r5, r4, pc, ror #30
    119c:	65736552 	ldrbvs	r6, [r3, #-1362]!	; 0xfffffaae
    11a0:	64657672 	strbtvs	r7, [r5], #-1650	; 0xfffff98e
    11a4:	73660037 	cmnvc	r6, #55	; 0x37
    11a8:	635f6c65 	cmpvs	pc, #25856	; 0x6500
    11ac:	0079706f 	rsbseq	r7, r9, pc, rrx
    11b0:	5f697072 	svcpl	0x00697072
    11b4:	5f676572 	svcpl	0x00676572
    11b8:	745f6f72 	ldrbvc	r6, [pc], #-3954	; 11c0 <_start-0x6e40>
    11bc:	46504700 	ldrbmi	r4, [r0], -r0, lsl #14
    11c0:	00304e45 	eorseq	r4, r0, r5, asr #28
    11c4:	5f697072 	svcpl	0x00697072
    11c8:	6f697067 	svcvs	0x00697067
    11cc:	5200745f 	andpl	r7, r0, #1593835520	; 0x5f000000
    11d0:	545f4950 	ldrbpl	r4, [pc], #-2384	; 11d8 <_start-0x6e28>
    11d4:	6c67676f 	stclvs	7, cr6, [r7], #-444	; 0xfffffe44
    11d8:	69704765 	ldmdbvs	r0!, {r0, r2, r5, r6, r8, r9, sl, lr}^
    11dc:	5052006f 	subspl	r0, r2, pc, rrx
    11e0:	65475f49 	strbvs	r5, [r7, #-3913]	; 0xfffff0b7
    11e4:	69704774 	ldmdbvs	r0!, {r2, r4, r5, r6, r8, r9, sl, lr}^
    11e8:	6c61566f 	stclvs	6, cr5, [r1], #-444	; 0xfffffe44
    11ec:	47006575 	smlsdxmi	r0, r5, r5, r6
    11f0:	524c4350 	subpl	r4, ip, #80, 6	; 0x40000001
    11f4:	70720030 	rsbsvc	r0, r2, r0, lsr r0
    11f8:	51524969 	cmppl	r2, r9, ror #18
    11fc:	746e6f43 	strbtvc	r6, [lr], #-3907	; 0xfffff0bd
    1200:	6c6c6f72 	stclvs	15, cr6, [ip], #-456	; 0xfffffe38
    1204:	44007265 	strmi	r7, [r0], #-613	; 0xfffffd9b
    1208:	62617369 	rsbvs	r7, r1, #-1543503871	; 0xa4000001
    120c:	425f656c 	subsmi	r6, pc, #108, 10	; 0x1b000000
    1210:	63697361 	cmnvs	r9, #-2080374783	; 0x84000001
    1214:	5152495f 	cmppl	r2, pc, asr r9
    1218:	682f0073 	stmdavs	pc!, {r0, r1, r4, r5, r6}	; <UNPREDICTABLE>
    121c:	2f656d6f 	svccs	0x00656d6f
    1220:	6b727472 	blvs	1c9e3f0 <_stack+0x1c1e3f0>
    1224:	7365442f 	cmnvc	r5, #788529152	; 0x2f000000
    1228:	706f746b 	rsbvc	r7, pc, fp, ror #8
    122c:	736f6c2f 	cmnvc	pc, #12032	; 0x2f00
    1230:	6b5f696d 	blvs	17db7ec <_stack+0x175b7ec>
    1234:	6e656d6f 	cdpvs	13, 6, cr6, cr5, cr15, {3}
    1238:	69726174 	ldmdbvs	r2!, {r2, r4, r5, r6, r8, sp, lr}^
    123c:	2f6f6173 	svccs	0x006f6173
    1240:	627a6576 	rsbsvs	r6, sl, #494927872	; 0x1d800000
    1244:	2f383061 	svccs	0x00383061
    1248:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
    124c:	722f6c65 	eorvc	r6, pc, #25856	; 0x6500
    1250:	692d6970 	pushvs	{r4, r5, r6, r8, fp, sp, lr}
    1254:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
    1258:	74707572 	ldrbtvc	r7, [r0], #-1394	; 0xfffffa8e
    125c:	00632e73 	rsbeq	r2, r3, r3, ror lr
    1260:	5f514946 	svcpl	0x00514946
    1264:	746e6f63 	strbtvc	r6, [lr], #-3939	; 0xfffff09d
    1268:	006c6f72 	rsbeq	r6, ip, r2, ror pc
    126c:	5f515249 	svcpl	0x00515249
    1270:	69736162 	ldmdbvs	r3!, {r1, r5, r6, r8, sp, lr}^
    1274:	65705f63 	ldrbvs	r5, [r0, #-3939]!	; 0xfffff09d
    1278:	6e69646e 	cdpvs	4, 6, cr6, cr9, cr14, {3}
    127c:	6e450067 	cdpvs	0, 4, cr0, cr5, cr7, {3}
    1280:	656c6261 	strbvs	r6, [ip, #-609]!	; 0xfffffd9f
    1284:	7361425f 	cmnvc	r1, #-268435451	; 0xf0000005
    1288:	495f6369 	ldmdbmi	pc, {r0, r3, r5, r6, r8, r9, sp, lr}^	; <UNPREDICTABLE>
    128c:	00735152 	rsbseq	r5, r3, r2, asr r1
    1290:	62616e45 	rsbvs	r6, r1, #1104	; 0x450
    1294:	495f656c 	ldmdbmi	pc, {r2, r3, r5, r6, r8, sl, sp, lr}^	; <UNPREDICTABLE>
    1298:	5f735152 	svcpl	0x00735152
    129c:	6e450031 	mcrvs	0, 2, r0, cr5, cr1, {1}
    12a0:	656c6261 	strbvs	r6, [ip, #-609]!	; 0xfffffd9f
    12a4:	5152495f 	cmppl	r2, pc, asr r9
    12a8:	00325f73 	eorseq	r5, r2, r3, ror pc
    12ac:	5f637673 	svcpl	0x00637673
    12b0:	646e6168 	strbtvs	r6, [lr], #-360	; 0xfffffe98
    12b4:	0072656c 	rsbseq	r6, r2, ip, ror #10
    12b8:	5f697072 	svcpl	0x00697072
    12bc:	5f717269 	svcpl	0x00717269
    12c0:	746e6f63 	strbtvc	r6, [lr], #-3939	; 0xfffff09d
    12c4:	6c6c6f72 	stclvs	15, cr6, [ip], #-456	; 0xfffffe38
    12c8:	745f7265 	ldrbvc	r7, [pc], #-613	; 12d0 <_start-0x6d30>
    12cc:	71726900 	cmnvc	r2, r0, lsl #18
    12d0:	6e61685f 	mcrvs	8, 3, r6, cr1, cr15, {2}
    12d4:	72656c64 	rsbvc	r6, r5, #100, 24	; 0x6400
    12d8:	67657200 	strbvs	r7, [r5, -r0, lsl #4]!
    12dc:	65760073 	ldrbvs	r0, [r6, #-115]!	; 0xffffff8d
    12e0:	6e5f7463 	cdpvs	4, 5, cr7, cr15, cr3, {3}
    12e4:	64006d75 	strvs	r6, [r0], #-3445	; 0xfffff28b
    12e8:	75616665 	strbvc	r6, [r1, #-1637]!	; 0xfffff99b
    12ec:	685f746c 	ldmdavs	pc, {r2, r3, r5, r6, sl, ip, sp, lr}^	; <UNPREDICTABLE>
    12f0:	6c646e61 	stclvs	14, cr6, [r4], #-388	; 0xfffffe7c
    12f4:	52007265 	andpl	r7, r0, #1342177286	; 0x50000006
    12f8:	475f4950 			; <UNDEFINED> instruction: 0x475f4950
    12fc:	72497465 	subvc	r7, r9, #1694498816	; 0x65000000
    1300:	6e6f4371 	mcrvs	3, 3, r4, cr15, cr1, {3}
    1304:	6c6f7274 	sfmvs	f7, 2, [pc], #-464	; 113c <_start-0x6ec4>
    1308:	0072656c 	rsbseq	r6, r2, ip, ror #10
    130c:	76746567 	ldrbtvc	r6, [r4], -r7, ror #10
    1310:	00746365 	rsbseq	r6, r4, r5, ror #6
    1314:	76746573 			; <UNDEFINED> instruction: 0x76746573
    1318:	00746365 	rsbseq	r6, r4, r5, ror #6
    131c:	74636576 	strbtvc	r6, [r3], #-1398	; 0xfffffa8a
    1320:	0073726f 	rsbseq	r7, r3, pc, ror #4
    1324:	5f515249 	svcpl	0x00515249
    1328:	646e6570 	strbtvs	r6, [lr], #-1392	; 0xfffffa90
    132c:	5f676e69 	svcpl	0x00676e69
    1330:	69440032 	stmdbvs	r4, {r1, r4, r5}^
    1334:	6c626173 	stfvse	f6, [r2], #-460	; 0xfffffe34
    1338:	52495f65 	subpl	r5, r9, #404	; 0x194
    133c:	315f7351 	cmpcc	pc, r1, asr r3	; <UNPREDICTABLE>
    1340:	73694400 	cmnvc	r9, #0, 8
    1344:	656c6261 	strbvs	r6, [ip, #-609]!	; 0xfffffd9f
    1348:	5152495f 	cmppl	r2, pc, asr r9
    134c:	00325f73 	eorseq	r5, r2, r3, ror pc
    1350:	5f515249 	svcpl	0x00515249
    1354:	646e6570 	strbtvs	r6, [lr], #-1392	; 0xfffffa90
    1358:	5f676e69 	svcpl	0x00676e69
    135c:	70720031 	rsbsvc	r0, r2, r1, lsr r0
    1360:	73795369 	cmnvc	r9, #-1543503871	; 0xa4000001
    1364:	546d6574 	strbtpl	r6, [sp], #-1396	; 0xfffffa8c
    1368:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
    136c:	6d6f6300 	stclvs	3, cr6, [pc, #-0]	; 1374 <_start-0x6c8c>
    1370:	65726170 	ldrbvs	r6, [r2, #-368]!	; 0xfffffe90
    1374:	6f630030 	svcvs	0x00630030
    1378:	7261706d 	rsbvc	r7, r1, #109	; 0x6d
    137c:	63003165 	movwvs	r3, #357	; 0x165
    1380:	61706d6f 	cmnvs	r0, pc, ror #26
    1384:	00326572 	eorseq	r6, r2, r2, ror r5
    1388:	706d6f63 	rsbvc	r6, sp, r3, ror #30
    138c:	33657261 	cmncc	r5, #268435462	; 0x10000006
    1390:	756f6300 	strbvc	r6, [pc, #-768]!	; 1098 <_start-0x6f68>
    1394:	7265746e 	rsbvc	r7, r5, #1845493760	; 0x6e000000
    1398:	0069685f 	rsbeq	r6, r9, pc, asr r8
    139c:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 12e8 <_start-0x6d18>
    13a0:	74722f65 	ldrbtvc	r2, [r2], #-3941	; 0xfffff09b
    13a4:	442f6b72 	strtmi	r6, [pc], #-2930	; 13ac <_start-0x6c54>
    13a8:	746b7365 	strbtvc	r7, [fp], #-869	; 0xfffffc9b
    13ac:	6c2f706f 	stcvs	0, cr7, [pc], #-444	; 11f8 <_start-0x6e08>
    13b0:	696d736f 	stmdbvs	sp!, {r0, r1, r2, r3, r5, r6, r8, r9, ip, sp, lr}^
    13b4:	6d6f6b5f 	fstmdbxvs	pc!, {d22-d68}	;@ Deprecated
    13b8:	61746e65 	cmnvs	r4, r5, ror #28
    13bc:	61736972 	cmnvs	r3, r2, ror r9
    13c0:	65762f6f 	ldrbvs	r2, [r6, #-3951]!	; 0xfffff091
    13c4:	3061627a 	rsbcc	r6, r1, sl, ror r2
    13c8:	656b2f38 	strbvs	r2, [fp, #-3896]!	; 0xfffff0c8
    13cc:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
    13d0:	6970722f 	ldmdbvs	r0!, {r0, r1, r2, r3, r5, r9, ip, sp, lr}^
    13d4:	7379732d 	cmnvc	r9, #-1275068416	; 0xb4000000
    13d8:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
    13dc:	00632e72 	rsbeq	r2, r3, r2, ror lr
    13e0:	746e6f63 	strbtvc	r6, [lr], #-3939	; 0xfffff09d
    13e4:	5f6c6f72 	svcpl	0x006c6f72
    13e8:	74617473 	strbtvc	r7, [r1], #-1139	; 0xfffffb8d
    13ec:	63007375 	movwvs	r7, #885	; 0x375
    13f0:	746e756f 	strbtvc	r7, [lr], #-1391	; 0xfffffa91
    13f4:	6c5f7265 	lfmvs	f7, 2, [pc], {101}	; 0x65
    13f8:	5052006f 	subspl	r0, r2, pc, rrx
    13fc:	65475f49 	strbvs	r5, [r7, #-3913]	; 0xfffff0b7
    1400:	73795374 	cmnvc	r9, #116, 6	; 0xd0000001
    1404:	546d6574 	strbtpl	r6, [sp], #-1396	; 0xfffffa8c
    1408:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
    140c:	49505200 	ldmdbmi	r0, {r9, ip, lr}^
    1410:	6961575f 	stmdbvs	r1!, {r0, r1, r2, r3, r4, r6, r8, r9, sl, ip, lr}^
    1414:	63694d74 	cmnvs	r9, #116, 26	; 0x1d00
    1418:	65536f72 	ldrbvs	r6, [r3, #-3954]	; 0xfffff08e
    141c:	646e6f63 	strbtvs	r6, [lr], #-3939	; 0xfffff09d
    1420:	70720073 	rsbsvc	r0, r2, r3, ror r0
    1424:	79735f69 	ldmdbvc	r3!, {r0, r3, r5, r6, r8, r9, sl, fp, ip, lr}^
    1428:	69745f73 	ldmdbvs	r4!, {r0, r1, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
    142c:	5f72656d 	svcpl	0x0072656d
    1430:	4c490074 	mcrrmi	0, 7, r0, r9, cr4
    1434:	2f005250 	svccs	0x00005250
    1438:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
    143c:	7274722f 	rsbsvc	r7, r4, #-268435454	; 0xf0000002
    1440:	65442f6b 	strbvs	r2, [r4, #-3947]	; 0xfffff095
    1444:	6f746b73 	svcvs	0x00746b73
    1448:	6f6c2f70 	svcvs	0x006c2f70
    144c:	5f696d73 	svcpl	0x00696d73
    1450:	656d6f6b 	strbvs	r6, [sp, #-3947]!	; 0xfffff095
    1454:	7261746e 	rsbvc	r7, r1, #1845493760	; 0x6e000000
    1458:	6f617369 	svcvs	0x00617369
    145c:	7a65762f 	bvc	195ed20 <_stack+0x18ded20>
    1460:	38306162 	ldmdacc	r0!, {r1, r5, r6, r8, sp, lr}
    1464:	72656b2f 	rsbvc	r6, r5, #48128	; 0xbc00
    1468:	2f6c656e 	svccs	0x006c656e
    146c:	2d697072 	stclcs	0, cr7, [r9, #-456]!	; 0xfffffe38
    1470:	74726175 	ldrbtvc	r6, [r2], #-373	; 0xfffffe8b
    1474:	5200632e 	andpl	r6, r0, #-1207959552	; 0xb8000000
    1478:	555f4950 	ldrbpl	r4, [pc, #-2384]	; b30 <_start-0x74d0>
    147c:	49747261 	ldmdbmi	r4!, {r0, r5, r6, r9, ip, sp, lr}^
    1480:	0074696e 	rsbseq	r6, r4, lr, ror #18
    1484:	55697072 	strbpl	r7, [r9, #-114]!	; 0xffffff8e
    1488:	00747261 	rsbseq	r7, r4, r1, ror #4
    148c:	5f495052 	svcpl	0x00495052
    1490:	55746547 	ldrbpl	r6, [r4, #-1351]!	; 0xfffffab9
    1494:	00747261 	rsbseq	r7, r4, r1, ror #4
    1498:	45525352 	ldrbmi	r5, [r2, #-850]	; 0xfffffcae
    149c:	49005243 	stmdbmi	r0, {r0, r1, r6, r9, ip, lr}
    14a0:	00445242 	subeq	r5, r4, r2, asr #4
    14a4:	4852434c 	ldmdami	r2, {r2, r3, r6, r8, r9, lr}^
    14a8:	69707200 	ldmdbvs	r0!, {r9, ip, sp, lr}^
    14ac:	7261755f 	rsbvc	r7, r1, #398458880	; 0x17c00000
    14b0:	00745f74 	rsbseq	r5, r4, r4, ror pc
    14b4:	43534d49 	cmpmi	r3, #4672	; 0x1240
    14b8:	4c464900 	mcrrmi	9, 0, r4, r6, cr0	; <UNPREDICTABLE>
    14bc:	42460053 	submi	r0, r6, #83	; 0x53
    14c0:	5f004452 	svcpl	0x00004452
    14c4:	657a6973 	ldrbvs	r6, [sl, #-2419]!	; 0xfffff68d
    14c8:	6f726600 	svcvs	0x00726600
    14cc:	6d5f006d 	ldclvs	0, cr0, [pc, #-436]	; 1320 <_start-0x6ce0>
    14d0:	6572705f 	ldrbvs	r7, [r2, #-95]!	; 0xffffffa1
    14d4:	656d0076 	strbvs	r0, [sp, #-118]!	; 0xffffff8a
    14d8:	0065736d 	rsbeq	r7, r5, sp, ror #6
    14dc:	5f6d656d 	svcpl	0x006d656d
    14e0:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
    14e4:	6d5f7300 	ldclvs	3, cr7, [pc, #-0]	; 14ec <_start-0x6b14>
    14e8:	625f6d65 	subsvs	r6, pc, #6464	; 0x1940
    14ec:	6b636f6c 	blvs	18dd2a4 <_stack+0x185d2a4>
    14f0:	5f00745f 	svcpl	0x0000745f
    14f4:	5f6d656d 	svcpl	0x006d656d
    14f8:	636f6c62 	cmnvs	pc, #25088	; 0x6200
    14fc:	682f006b 	stmdavs	pc!, {r0, r1, r3, r5, r6}	; <UNPREDICTABLE>
    1500:	2f656d6f 	svccs	0x00656d6f
    1504:	6b727472 	blvs	1c9e6d4 <_stack+0x1c1e6d4>
    1508:	7365442f 	cmnvc	r5, #788529152	; 0x2f000000
    150c:	706f746b 	rsbvc	r7, pc, fp, ror #8
    1510:	736f6c2f 	cmnvc	pc, #12032	; 0x2f00
    1514:	6b5f696d 	blvs	17dbad0 <_stack+0x175bad0>
    1518:	6e656d6f 	cdpvs	13, 6, cr6, cr5, cr15, {3}
    151c:	69726174 	ldmdbvs	r2!, {r2, r4, r5, r6, r8, sp, lr}^
    1520:	2f6f6173 	svccs	0x006f6173
    1524:	627a6576 	rsbsvs	r6, sl, #494927872	; 0x1d800000
    1528:	2f383061 	svccs	0x00383061
    152c:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
    1530:	732f6c65 			; <UNDEFINED> instruction: 0x732f6c65
    1534:	696c6474 	stmdbvs	ip!, {r2, r4, r5, r6, sl, sp, lr}^
    1538:	00632e62 	rsbeq	r2, r3, r2, ror #28
    153c:	6d656d5f 	stclvs	13, cr6, [r5, #-380]!	; 0xfffffe84
    1540:	6572665f 	ldrbvs	r6, [r2, #-1631]!	; 0xfffff9a1
    1544:	6d5f0065 	ldclvs	0, cr0, [pc, #-404]	; 13b8 <_start-0x6c48>
    1548:	78656e5f 	stmdavc	r5!, {r0, r1, r2, r3, r4, r6, r9, sl, fp, sp, lr}^
    154c:	656d0074 	strbvs	r0, [sp, #-116]!	; 0xffffff8c
    1550:	0070636d 	rsbseq	r6, r0, sp, ror #6
    1554:	6d5f6d5f 	ldclvs	13, cr6, [pc, #-380]	; 13e0 <_start-0x6c20>
    1558:	6d006469 	cfstrsvs	mvf6, [r0, #-420]	; 0xfffffe5c
    155c:	6d636d65 	stclvs	13, cr6, [r3, #-404]!	; 0xfffffe6c
    1560:	6c616d00 	stclvs	13, cr6, [r1], #-0
    1564:	00636f6c 	rsbeq	r6, r3, ip, ror #30
    1568:	665f6d5f 			; <UNDEFINED> instruction: 0x665f6d5f
    156c:	00656572 	rsbeq	r6, r5, r2, ror r5
    1570:	6e697270 	mcrvs	2, 3, r7, cr9, cr0, {3}
    1574:	2f003274 	svccs	0x00003274
    1578:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xfffff098
    157c:	7274722f 	rsbsvc	r7, r4, #-268435454	; 0xf0000002
    1580:	65442f6b 	strbvs	r2, [r4, #-3947]	; 0xfffff095
    1584:	6f746b73 	svcvs	0x00746b73
    1588:	6f6c2f70 	svcvs	0x006c2f70
    158c:	5f696d73 	svcpl	0x00696d73
    1590:	656d6f6b 	strbvs	r6, [sp, #-3947]!	; 0xfffff095
    1594:	7261746e 	rsbvc	r7, r1, #1845493760	; 0x6e000000
    1598:	6f617369 	svcvs	0x00617369
    159c:	7a65762f 	bvc	195ee60 <_stack+0x18dee60>
    15a0:	38306162 	ldmdacc	r0!, {r1, r5, r6, r8, sp, lr}
    15a4:	7a65762f 	bvc	195ee68 <_stack+0x18dee68>
    15a8:	762f6562 	strtvc	r6, [pc], -r2, ror #10
    15ac:	61325f38 	teqvs	r2, r8, lsr pc
    15b0:	7000632e 	andvc	r6, r0, lr, lsr #6
    15b4:	746e6972 	strbtvc	r6, [lr], #-2418	; 0xfffff68e
    15b8:	72700031 	rsbsvc	r0, r0, #49	; 0x31
    15bc:	33746e69 	cmncc	r4, #1680	; 0x690
    15c0:	72506800 	subsvc	r6, r0, #0, 16
    15c4:	31746e69 	cmncc	r4, r9, ror #28
    15c8:	72506800 	subsvc	r6, r0, #0, 16
    15cc:	32746e69 	rsbscc	r6, r4, #1680	; 0x690
    15d0:	72506800 	subsvc	r6, r0, #0, 16
    15d4:	33746e69 	cmncc	r4, #1680	; 0x690
	...

Disassembly of section .ARM.attributes:

00000000 <_stack-0x80000>:
   0:	00003441 	andeq	r3, r0, r1, asr #8
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	0000002a 	andeq	r0, r0, sl, lsr #32
  10:	45563705 	ldrbmi	r3, [r6, #-1797]	; 0xfffff8fb
  14:	070a0600 	streq	r0, [sl, -r0, lsl #12]
  18:	09010841 	stmdbeq	r1, {r0, r6, fp}
  1c:	0c050a02 			; <UNDEFINED> instruction: 0x0c050a02
  20:	14041202 	strne	r1, [r4], #-514	; 0xfffffdfe
  24:	17011501 	strne	r1, [r1, -r1, lsl #10]
  28:	1a011803 	bne	4603c <__bss_end__+0x35cf0>
  2c:	2a012201 	bcs	48838 <__bss_end__+0x384ec>
  30:	44022c01 	strmi	r2, [r2], #-3073	; 0xfffff3ff
  34:	Address 0x0000000000000034 is out of bounds.

