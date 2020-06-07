
benchmark-b2:     file format elf32-tradbigmips


Disassembly of section .init:

000005e8 <_init>:
 5e8:	3c1c0062 	lui	gp,0x62
 5ec:	279c9a38 	addiu	gp,gp,-26056
 5f0:	0399e021 	addu	gp,gp,t9
 5f4:	27bdffe0 	addiu	sp,sp,-32
 5f8:	afbc0010 	sw	gp,16(sp)
 5fc:	afbf001c 	sw	ra,28(sp)
 600:	8f82805c 	lw	v0,-32676(gp)
 604:	10400004 	beqz	v0,618 <_init+0x30>
 608:	00000000 	nop
 60c:	8f99805c 	lw	t9,-32676(gp)
 610:	0320f809 	jalr	t9
 614:	00000000 	nop
 618:	8fbf001c 	lw	ra,28(sp)
 61c:	03e00008 	jr	ra
 620:	27bd0020 	addiu	sp,sp,32

Disassembly of section .text:

00100000 <__start>:
  100000:	03e00025 	move	zero,ra
  100004:	04110001 	bal	10000c <__start+0xc>
  100008:	00000000 	nop
  10000c:	3c1c0052 	lui	gp,0x52
  100010:	279ca014 	addiu	gp,gp,-24556
  100014:	039fe021 	addu	gp,gp,ra
  100018:	0000f825 	move	ra,zero
  10001c:	8f848018 	lw	a0,-32744(gp)
  100020:	8fa50000 	lw	a1,0(sp)
  100024:	27a60004 	addiu	a2,sp,4
  100028:	2401fff8 	li	at,-8
  10002c:	03a1e824 	and	sp,sp,at
  100030:	27bdffe0 	addiu	sp,sp,-32
  100034:	8f87801c 	lw	a3,-32740(gp)
  100038:	8f888020 	lw	t0,-32736(gp)
  10003c:	afa80010 	sw	t0,16(sp)
  100040:	afa20014 	sw	v0,20(sp)
  100044:	afbd0018 	sw	sp,24(sp)
  100048:	8f998058 	lw	t9,-32680(gp)
  10004c:	0320f809 	jalr	t9
  100050:	00000000 	nop

00100054 <hlt>:
  100054:	1000ffff 	b	100054 <hlt>
  100058:	00000000 	nop
  10005c:	00000000 	nop

00100060 <deregister_tm_clones>:
  100060:	3c1c0052 	lui	gp,0x52
  100064:	279c9fc0 	addiu	gp,gp,-24640
  100068:	0399e021 	addu	gp,gp,t9
  10006c:	8f848028 	lw	a0,-32728(gp)
  100070:	8f828024 	lw	v0,-32732(gp)
  100074:	24842024 	addiu	a0,a0,8228
  100078:	24420003 	addiu	v0,v0,3
  10007c:	00441023 	subu	v0,v0,a0
  100080:	2c420007 	sltiu	v0,v0,7
  100084:	14400005 	bnez	v0,10009c <deregister_tm_clones+0x3c>
  100088:	8f998060 	lw	t9,-32672(gp)
  10008c:	13200003 	beqz	t9,10009c <deregister_tm_clones+0x3c>
  100090:	00000000 	nop
  100094:	03200008 	jr	t9
  100098:	00000000 	nop
  10009c:	03e00008 	jr	ra
  1000a0:	00000000 	nop

001000a4 <register_tm_clones>:
  1000a4:	3c1c0052 	lui	gp,0x52
  1000a8:	279c9f7c 	addiu	gp,gp,-24708
  1000ac:	0399e021 	addu	gp,gp,t9
  1000b0:	8f848028 	lw	a0,-32728(gp)
  1000b4:	8f858024 	lw	a1,-32732(gp)
  1000b8:	24842024 	addiu	a0,a0,8228
  1000bc:	00a42823 	subu	a1,a1,a0
  1000c0:	00052883 	sra	a1,a1,0x2
  1000c4:	000517c2 	srl	v0,a1,0x1f
  1000c8:	00452821 	addu	a1,v0,a1
  1000cc:	00052843 	sra	a1,a1,0x1
  1000d0:	10a00005 	beqz	a1,1000e8 <register_tm_clones+0x44>
  1000d4:	8f998050 	lw	t9,-32688(gp)
  1000d8:	13200003 	beqz	t9,1000e8 <register_tm_clones+0x44>
  1000dc:	00000000 	nop
  1000e0:	03200008 	jr	t9
  1000e4:	00000000 	nop
  1000e8:	03e00008 	jr	ra
  1000ec:	00000000 	nop

001000f0 <__do_global_dtors_aux>:
  1000f0:	3c1c0052 	lui	gp,0x52
  1000f4:	279c9f30 	addiu	gp,gp,-24784
  1000f8:	0399e021 	addu	gp,gp,t9
  1000fc:	27bdffe0 	addiu	sp,sp,-32
  100100:	afb00018 	sw	s0,24(sp)
  100104:	8f908028 	lw	s0,-32728(gp)
  100108:	afbc0010 	sw	gp,16(sp)
  10010c:	afbf001c 	sw	ra,28(sp)
  100110:	92022090 	lbu	v0,8336(s0)
  100114:	1440000d 	bnez	v0,10014c <__do_global_dtors_aux+0x5c>
  100118:	8f828064 	lw	v0,-32668(gp)
  10011c:	10400005 	beqz	v0,100134 <__do_global_dtors_aux+0x44>
  100120:	8f82802c 	lw	v0,-32724(gp)
  100124:	8f998064 	lw	t9,-32668(gp)
  100128:	0320f809 	jalr	t9
  10012c:	8c440000 	lw	a0,0(v0)
  100130:	8fbc0010 	lw	gp,16(sp)
  100134:	8f998030 	lw	t9,-32720(gp)
  100138:	27390060 	addiu	t9,t9,96
  10013c:	0411ffc8 	bal	100060 <deregister_tm_clones>
  100140:	00000000 	nop
  100144:	24020001 	li	v0,1
  100148:	a2022090 	sb	v0,8336(s0)
  10014c:	8fbf001c 	lw	ra,28(sp)
  100150:	8fb00018 	lw	s0,24(sp)
  100154:	03e00008 	jr	ra
  100158:	27bd0020 	addiu	sp,sp,32

0010015c <frame_dummy>:
  10015c:	3c1c0052 	lui	gp,0x52
  100160:	279c9ec4 	addiu	gp,gp,-24892
  100164:	0399e021 	addu	gp,gp,t9
  100168:	8f828028 	lw	v0,-32728(gp)
  10016c:	27bdffe0 	addiu	sp,sp,-32
  100170:	2444200c 	addiu	a0,v0,8204
  100174:	afbc0010 	sw	gp,16(sp)
  100178:	afbf001c 	sw	ra,28(sp)
  10017c:	8c820000 	lw	v0,0(a0)
  100180:	14400006 	bnez	v0,10019c <frame_dummy+0x40>
  100184:	8f998054 	lw	t9,-32684(gp)
  100188:	8f998030 	lw	t9,-32720(gp)
  10018c:	8fbf001c 	lw	ra,28(sp)
  100190:	273900a4 	addiu	t9,t9,164
  100194:	1000ffc3 	b	1000a4 <register_tm_clones>
  100198:	27bd0020 	addiu	sp,sp,32
  10019c:	1320fffa 	beqz	t9,100188 <frame_dummy+0x2c>
  1001a0:	00000000 	nop
  1001a4:	0320f809 	jalr	t9
  1001a8:	00000000 	nop
  1001ac:	1000fff6 	b	100188 <frame_dummy+0x2c>
  1001b0:	8fbc0010 	lw	gp,16(sp)
	...

00200000 <main>:

	.globl	main
	.ent	main
main:
	.set	noreorder
	.cpload	t9
  200000:	3c1c0042 	lui	gp,0x42
  200004:	279ca020 	addiu	gp,gp,-24544
  200008:	0399e021 	addu	gp,gp,t9
	.set	nomacro
	addiu	sp, sp, -24
  20000c:	27bdffe8 	addiu	sp,sp,-24
	sw	fp, 20(sp)
  200010:	afbe0014 	sw	s8,20(sp)
	move	fp, sp
  200014:	03a0f025 	move	s8,sp
	.cprestore	0
  200018:	afbc0000 	sw	gp,0(sp)

	la	t0, aligned
  20001c:	8f888034 	lw	t0,-32716(gp)
  200020:	25080000 	addiu	t0,t0,0
	li	t1, 100
  200024:	24090064 	li	t1,100
	...

00300000 <loop>:
	.align	20
loop:	lw	t2, 0(t0)
  300000:	8d0a0000 	lw	t2,0(t0)
	addu	t0, t0, 16 
  300004:	25080010 	addiu	t0,t0,16
	subu	t1, t1, 1
  300008:	2529ffff 	addiu	t1,t1,-1
	bnez	t1, loop
  30000c:	1520fffc 	bnez	t1,300000 <loop>

	# Destruimos el stack frame antes de retornar de main().
	#
	move	sp, fp
  300010:	03c0e825 	move	sp,s8
	lw	fp, 20(sp)
  300014:	8fbe0014 	lw	s8,20(sp)
	addiu	sp, sp, 24
  300018:	27bd0018 	addiu	sp,sp,24

	# Para volver al sistema operativo cargamos un código de retorno nulo.
	#
	move	v0, zero
  30001c:	00001025 	move	v0,zero
	jr	ra
  300020:	03e00008 	jr	ra
  300024:	00000000 	nop
	...

00400000 <__libc_csu_init>:
  400000:	3c1c0022 	lui	gp,0x22
  400004:	279ca020 	addiu	gp,gp,-24544
  400008:	0399e021 	addu	gp,gp,t9
  40000c:	27bdffc8 	addiu	sp,sp,-56
  400010:	8f998038 	lw	t9,-32712(gp)
  400014:	afbc0010 	sw	gp,16(sp)
  400018:	afb50030 	sw	s5,48(sp)
  40001c:	00c0a825 	move	s5,a2
  400020:	afb4002c 	sw	s4,44(sp)
  400024:	00a0a025 	move	s4,a1
  400028:	afb30028 	sw	s3,40(sp)
  40002c:	00809825 	move	s3,a0
  400030:	afb20024 	sw	s2,36(sp)
  400034:	afb0001c 	sw	s0,28(sp)
  400038:	afbf0034 	sw	ra,52(sp)
  40003c:	0320f809 	jalr	t9
  400040:	afb10020 	sw	s1,32(sp)
  400044:	8fbc0010 	lw	gp,16(sp)
  400048:	8f90803c 	lw	s0,-32708(gp)
  40004c:	8f928040 	lw	s2,-32704(gp)
  400050:	02509023 	subu	s2,s2,s0
  400054:	00129083 	sra	s2,s2,0x2
  400058:	12400009 	beqz	s2,400080 <__libc_csu_init+0x80>
  40005c:	00008825 	move	s1,zero
  400060:	8e190000 	lw	t9,0(s0)
  400064:	26310001 	addiu	s1,s1,1
  400068:	02a03025 	move	a2,s5
  40006c:	02802825 	move	a1,s4
  400070:	0320f809 	jalr	t9
  400074:	02602025 	move	a0,s3
  400078:	1651fff9 	bne	s2,s1,400060 <__libc_csu_init+0x60>
  40007c:	26100004 	addiu	s0,s0,4
  400080:	8fbf0034 	lw	ra,52(sp)
  400084:	8fb50030 	lw	s5,48(sp)
  400088:	8fb4002c 	lw	s4,44(sp)
  40008c:	8fb30028 	lw	s3,40(sp)
  400090:	8fb20024 	lw	s2,36(sp)
  400094:	8fb10020 	lw	s1,32(sp)
  400098:	8fb0001c 	lw	s0,28(sp)
  40009c:	03e00008 	jr	ra
  4000a0:	27bd0038 	addiu	sp,sp,56

004000a4 <__libc_csu_fini>:
  4000a4:	03e00008 	jr	ra
  4000a8:	00000000 	nop
  4000ac:	00000000 	nop

Disassembly of section .MIPS.stubs:

004000b0 <_MIPS_STUBS_>:
  4000b0:	8f998010 	lw	t9,-32752(gp)
  4000b4:	03e07825 	move	t7,ra
  4000b8:	0320f809 	jalr	t9
  4000bc:	2418000b 	li	t8,11
	...

Disassembly of section .fini:

004000d0 <_fini>:
  4000d0:	3c1c0022 	lui	gp,0x22
  4000d4:	279c9f50 	addiu	gp,gp,-24752
  4000d8:	0399e021 	addu	gp,gp,t9
  4000dc:	27bdffe0 	addiu	sp,sp,-32
  4000e0:	afbc0010 	sw	gp,16(sp)
  4000e4:	afbf001c 	sw	ra,28(sp)
  4000e8:	8fbf001c 	lw	ra,28(sp)
  4000ec:	03e00008 	jr	ra
  4000f0:	27bd0020 	addiu	sp,sp,32
