
benchmark-b3:     file format elf32-tradbigmips


Disassembly of section .init:

000005c8 <_init>:
 5c8:	3c1c0021 	lui	gp,0x21
 5cc:	279cda38 	addiu	gp,gp,-9672
 5d0:	0399e021 	addu	gp,gp,t9
 5d4:	27bdffe0 	addiu	sp,sp,-32
 5d8:	afbc0010 	sw	gp,16(sp)
 5dc:	afbf001c 	sw	ra,28(sp)
 5e0:	8f828058 	lw	v0,-32680(gp)
 5e4:	10400004 	beqz	v0,5f8 <_init+0x30>
 5e8:	00000000 	nop
 5ec:	8f998058 	lw	t9,-32680(gp)
 5f0:	0320f809 	jalr	t9
 5f4:	00000000 	nop
 5f8:	8fbf001c 	lw	ra,28(sp)
 5fc:	03e00008 	jr	ra
 600:	27bd0020 	addiu	sp,sp,32

Disassembly of section .text:

00000610 <__start>:
 610:	03e00025 	move	zero,ra
 614:	04110001 	bal	61c <__start+0xc>
 618:	00000000 	nop
 61c:	3c1c0021 	lui	gp,0x21
 620:	279cd9e4 	addiu	gp,gp,-9756
 624:	039fe021 	addu	gp,gp,ra
 628:	0000f825 	move	ra,zero
 62c:	8f848018 	lw	a0,-32744(gp)
 630:	8fa50000 	lw	a1,0(sp)
 634:	27a60004 	addiu	a2,sp,4
 638:	2401fff8 	li	at,-8
 63c:	03a1e824 	and	sp,sp,at
 640:	27bdffe0 	addiu	sp,sp,-32
 644:	8f87801c 	lw	a3,-32740(gp)
 648:	8f888020 	lw	t0,-32736(gp)
 64c:	afa80010 	sw	t0,16(sp)
 650:	afa20014 	sw	v0,20(sp)
 654:	afbd0018 	sw	sp,24(sp)
 658:	8f998054 	lw	t9,-32684(gp)
 65c:	0320f809 	jalr	t9
 660:	00000000 	nop

00000664 <hlt>:
 664:	1000ffff 	b	664 <hlt>
 668:	00000000 	nop
 66c:	00000000 	nop

00000670 <deregister_tm_clones>:
 670:	3c1c0021 	lui	gp,0x21
 674:	279cd990 	addiu	gp,gp,-9840
 678:	0399e021 	addu	gp,gp,t9
 67c:	8f848028 	lw	a0,-32728(gp)
 680:	8f828024 	lw	v0,-32732(gp)
 684:	24846004 	addiu	a0,a0,24580
 688:	24420003 	addiu	v0,v0,3
 68c:	00441023 	subu	v0,v0,a0
 690:	2c420007 	sltiu	v0,v0,7
 694:	14400005 	bnez	v0,6ac <deregister_tm_clones+0x3c>
 698:	8f99805c 	lw	t9,-32676(gp)
 69c:	13200003 	beqz	t9,6ac <deregister_tm_clones+0x3c>
 6a0:	00000000 	nop
 6a4:	03200008 	jr	t9
 6a8:	00000000 	nop
 6ac:	03e00008 	jr	ra
 6b0:	00000000 	nop

000006b4 <register_tm_clones>:
 6b4:	3c1c0021 	lui	gp,0x21
 6b8:	279cd94c 	addiu	gp,gp,-9908
 6bc:	0399e021 	addu	gp,gp,t9
 6c0:	8f848028 	lw	a0,-32728(gp)
 6c4:	8f858024 	lw	a1,-32732(gp)
 6c8:	24846004 	addiu	a0,a0,24580
 6cc:	00a42823 	subu	a1,a1,a0
 6d0:	00052883 	sra	a1,a1,0x2
 6d4:	000517c2 	srl	v0,a1,0x1f
 6d8:	00452821 	addu	a1,v0,a1
 6dc:	00052843 	sra	a1,a1,0x1
 6e0:	10a00005 	beqz	a1,6f8 <register_tm_clones+0x44>
 6e4:	8f99804c 	lw	t9,-32692(gp)
 6e8:	13200003 	beqz	t9,6f8 <register_tm_clones+0x44>
 6ec:	00000000 	nop
 6f0:	03200008 	jr	t9
 6f4:	00000000 	nop
 6f8:	03e00008 	jr	ra
 6fc:	00000000 	nop

00000700 <__do_global_dtors_aux>:
 700:	3c1c0021 	lui	gp,0x21
 704:	279cd900 	addiu	gp,gp,-9984
 708:	0399e021 	addu	gp,gp,t9
 70c:	27bdffe0 	addiu	sp,sp,-32
 710:	afb00018 	sw	s0,24(sp)
 714:	8f908028 	lw	s0,-32728(gp)
 718:	afbc0010 	sw	gp,16(sp)
 71c:	afbf001c 	sw	ra,28(sp)
 720:	92026070 	lbu	v0,24688(s0)
 724:	1440000d 	bnez	v0,75c <__do_global_dtors_aux+0x5c>
 728:	8f828060 	lw	v0,-32672(gp)
 72c:	10400005 	beqz	v0,744 <__do_global_dtors_aux+0x44>
 730:	8f82802c 	lw	v0,-32724(gp)
 734:	8f998060 	lw	t9,-32672(gp)
 738:	0320f809 	jalr	t9
 73c:	8c440000 	lw	a0,0(v0)
 740:	8fbc0010 	lw	gp,16(sp)
 744:	8f998030 	lw	t9,-32720(gp)
 748:	27390670 	addiu	t9,t9,1648
 74c:	0411ffc8 	bal	670 <deregister_tm_clones>
 750:	00000000 	nop
 754:	24020001 	li	v0,1
 758:	a2026070 	sb	v0,24688(s0)
 75c:	8fbf001c 	lw	ra,28(sp)
 760:	8fb00018 	lw	s0,24(sp)
 764:	03e00008 	jr	ra
 768:	27bd0020 	addiu	sp,sp,32

0000076c <frame_dummy>:
 76c:	3c1c0021 	lui	gp,0x21
 770:	279cd894 	addiu	gp,gp,-10092
 774:	0399e021 	addu	gp,gp,t9
 778:	8f828034 	lw	v0,-32716(gp)
 77c:	27bdffe0 	addiu	sp,sp,-32
 780:	24441008 	addiu	a0,v0,4104
 784:	afbc0010 	sw	gp,16(sp)
 788:	afbf001c 	sw	ra,28(sp)
 78c:	8c820000 	lw	v0,0(a0)
 790:	14400006 	bnez	v0,7ac <frame_dummy+0x40>
 794:	8f998050 	lw	t9,-32688(gp)
 798:	8f998030 	lw	t9,-32720(gp)
 79c:	8fbf001c 	lw	ra,28(sp)
 7a0:	273906b4 	addiu	t9,t9,1716
 7a4:	1000ffc3 	b	6b4 <register_tm_clones>
 7a8:	27bd0020 	addiu	sp,sp,32
 7ac:	1320fffa 	beqz	t9,798 <frame_dummy+0x2c>
 7b0:	00000000 	nop
 7b4:	0320f809 	jalr	t9
 7b8:	00000000 	nop
 7bc:	1000fff6 	b	798 <frame_dummy+0x2c>
 7c0:	8fbc0010 	lw	gp,16(sp)
	...

000007d0 <main>:

	.globl	main
	.ent	main
main:
	.set	noreorder
	.cpload	t9
 7d0:	3c1c0021 	lui	gp,0x21
 7d4:	279cd830 	addiu	gp,gp,-10192
 7d8:	0399e021 	addu	gp,gp,t9
	.set	nomacro
	addiu	sp, sp, -24
 7dc:	27bdffe8 	addiu	sp,sp,-24
	sw	fp, 20(sp)
 7e0:	afbe0014 	sw	s8,20(sp)
	move	fp, sp
 7e4:	03a0f025 	move	s8,sp
	.cprestore	0
 7e8:	afbc0000 	sw	gp,0(sp)

	la	t0, aligned0
 7ec:	8f888028 	lw	t0,-32728(gp)
 7f0:	25080000 	addiu	t0,t0,0
	la	t1, aligned1
 7f4:	8f898028 	lw	t1,-32728(gp)
 7f8:	25292000 	addiu	t1,t1,8192
	la	t2, aligned2
 7fc:	8f8a8028 	lw	t2,-32728(gp)
 800:	254a4000 	addiu	t2,t2,16384
	li	t3, 256
 804:	240b0100 	li	t3,256

00000808 <loop>:
loop:	lw	t4, 0(t0)
 808:	8d0c0000 	lw	t4,0(t0)
	lw	t5, 0(t1)
 80c:	8d2d0000 	lw	t5,0(t1)
	addu	t6, t5, t4
 810:	01ac7021 	addu	t6,t5,t4
	sw	t6, 0(t2)
 814:	ad4e0000 	sw	t6,0(t2)
	addu	t0, t0, 4
 818:	25080004 	addiu	t0,t0,4
	addu	t1, t1, 4
 81c:	25290004 	addiu	t1,t1,4
	addu	t2, t2, 4
 820:	254a0004 	addiu	t2,t2,4
	subu	t3, t3, 1
 824:	256bffff 	addiu	t3,t3,-1
	bnez	t3, loop
 828:	1560fff7 	bnez	t3,808 <loop>

	# Destruimos el stack frame antes de retornar de main().
	#
	move	sp, fp
 82c:	03c0e825 	move	sp,s8
	lw	fp, 20(sp)
 830:	8fbe0014 	lw	s8,20(sp)
	addiu	sp, sp, 24
 834:	27bd0018 	addiu	sp,sp,24

	# Para volver al sistema operativo cargamos un codigo de retorno nulo.
	#
	move	v0, zero
 838:	00001025 	move	v0,zero
	jr	ra
 83c:	03e00008 	jr	ra

00000840 <__libc_csu_init>:
 840:	3c1c0021 	lui	gp,0x21
 844:	279cd7c0 	addiu	gp,gp,-10304
 848:	0399e021 	addu	gp,gp,t9
 84c:	27bdffc8 	addiu	sp,sp,-56
 850:	8f998038 	lw	t9,-32712(gp)
 854:	afbc0010 	sw	gp,16(sp)
 858:	afb50030 	sw	s5,48(sp)
 85c:	00c0a825 	move	s5,a2
 860:	afb4002c 	sw	s4,44(sp)
 864:	00a0a025 	move	s4,a1
 868:	afb30028 	sw	s3,40(sp)
 86c:	00809825 	move	s3,a0
 870:	afb20024 	sw	s2,36(sp)
 874:	afb0001c 	sw	s0,28(sp)
 878:	afbf0034 	sw	ra,52(sp)
 87c:	0411ff52 	bal	5c8 <_init>
 880:	afb10020 	sw	s1,32(sp)
 884:	8fbc0010 	lw	gp,16(sp)
 888:	8f90803c 	lw	s0,-32708(gp)
 88c:	8f928040 	lw	s2,-32704(gp)
 890:	02509023 	subu	s2,s2,s0
 894:	00129083 	sra	s2,s2,0x2
 898:	12400009 	beqz	s2,8c0 <__libc_csu_init+0x80>
 89c:	00008825 	move	s1,zero
 8a0:	8e190000 	lw	t9,0(s0)
 8a4:	26310001 	addiu	s1,s1,1
 8a8:	02a03025 	move	a2,s5
 8ac:	02802825 	move	a1,s4
 8b0:	0320f809 	jalr	t9
 8b4:	02602025 	move	a0,s3
 8b8:	1651fff9 	bne	s2,s1,8a0 <__libc_csu_init+0x60>
 8bc:	26100004 	addiu	s0,s0,4
 8c0:	8fbf0034 	lw	ra,52(sp)
 8c4:	8fb50030 	lw	s5,48(sp)
 8c8:	8fb4002c 	lw	s4,44(sp)
 8cc:	8fb30028 	lw	s3,40(sp)
 8d0:	8fb20024 	lw	s2,36(sp)
 8d4:	8fb10020 	lw	s1,32(sp)
 8d8:	8fb0001c 	lw	s0,28(sp)
 8dc:	03e00008 	jr	ra
 8e0:	27bd0038 	addiu	sp,sp,56

000008e4 <__libc_csu_fini>:
 8e4:	03e00008 	jr	ra
 8e8:	00000000 	nop
 8ec:	00000000 	nop

Disassembly of section .MIPS.stubs:

000008f0 <_MIPS_STUBS_>:
 8f0:	8f998010 	lw	t9,-32752(gp)
 8f4:	03e07825 	move	t7,ra
 8f8:	0320f809 	jalr	t9
 8fc:	2418000b 	li	t8,11
	...

Disassembly of section .fini:

00000910 <_fini>:
 910:	3c1c0021 	lui	gp,0x21
 914:	279cd6f0 	addiu	gp,gp,-10512
 918:	0399e021 	addu	gp,gp,t9
 91c:	27bdffe0 	addiu	sp,sp,-32
 920:	afbc0010 	sw	gp,16(sp)
 924:	afbf001c 	sw	ra,28(sp)
 928:	8fbf001c 	lw	ra,28(sp)
 92c:	03e00008 	jr	ra
 930:	27bd0020 	addiu	sp,sp,32
