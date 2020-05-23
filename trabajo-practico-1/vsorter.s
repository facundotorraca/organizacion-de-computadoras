	.file	1 "vsorter.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	vector_init
	.set	nomips16
	.set	nomicromips
	.ent	vector_init
	.type	vector_init, @function
vector_init:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,32($fp)
	li	$5,4			# 0x4
	li	$4,256			# 0x100
	lw	$2,%call16(calloc)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,calloc
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$3,$2
	lw	$2,32($fp)
	sw	$3,0($2)
	lw	$2,32($fp)
	li	$3,256			# 0x100
	sw	$3,8($2)
	lw	$2,32($fp)
	sw	$0,4($2)
	move	$2,$0
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	vector_init
	.size	vector_init, .-vector_init
	.align	2
	.globl	vector_push
	.set	nomips16
	.set	nomicromips
	.ent	vector_push
	.type	vector_push, @function
vector_push:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-8
	sw	$fp,4($sp)
	move	$fp,$sp
	sw	$4,8($fp)
	sw	$5,12($fp)
	lw	$2,8($fp)
	lw	$3,0($2)
	lw	$2,8($fp)
	lw	$2,4($2)
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$3,12($fp)
	sw	$3,0($2)
	lw	$2,8($fp)
	lw	$2,4($2)
	addiu	$3,$2,1
	lw	$2,8($fp)
	sw	$3,4($2)
	nop
	move	$sp,$fp
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	vector_push
	.size	vector_push, .-vector_push
	.align	2
	.globl	vector_clear
	.set	nomips16
	.set	nomicromips
	.ent	vector_clear
	.type	vector_clear, @function
vector_clear:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,32($fp)
	lw	$2,32($fp)
	lw	$3,0($2)
	lw	$2,32($fp)
	lw	$2,8($2)
	move	$6,$2
	move	$5,$0
	move	$4,$3
	lw	$2,%call16(memset)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,memset
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,32($fp)
	sw	$0,4($2)
	nop
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	vector_clear
	.size	vector_clear, .-vector_clear
	.align	2
	.globl	vector_destroy
	.set	nomips16
	.set	nomicromips
	.ent	vector_destroy
	.type	vector_destroy, @function
vector_destroy:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,32($fp)
	lw	$2,32($fp)
	lw	$2,0($2)
	move	$4,$2
	lw	$2,%call16(free)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,free
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,32($fp)
	li	$3,256			# 0x100
	sw	$3,8($2)
	lw	$2,32($fp)
	sw	$0,0($2)
	lw	$2,32($fp)
	sw	$0,4($2)
	nop
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	vector_destroy
	.size	vector_destroy, .-vector_destroy
	.rdata
	.align	2
$LC0:
	.ascii	"-h\000"
	.align	2
$LC1:
	.ascii	"--help\000"
	.text
	.align	2
	.globl	is_help_flag
	.set	nomips16
	.set	nomicromips
	.ent	is_help_flag
	.type	is_help_flag, @function
is_help_flag:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,32($fp)
	lw	$2,%got($LC0)($28)
	addiu	$5,$2,%lo($LC0)
	lw	$4,32($fp)
	lw	$2,%call16(strcmp)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strcmp
1:	jalr	$25
	nop

	lw	$28,16($fp)
	beq	$2,$0,$L7
	nop

	lw	$2,%got($LC1)($28)
	addiu	$5,$2,%lo($LC1)
	lw	$4,32($fp)
	lw	$2,%call16(strcmp)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strcmp
1:	jalr	$25
	nop

	lw	$28,16($fp)
	bne	$2,$0,$L8
	nop

$L7:
	li	$2,1			# 0x1
	b	$L9
	nop

$L8:
	move	$2,$0
$L9:
	andi	$2,$2,0x1
	andi	$2,$2,0x00ff
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	is_help_flag
	.size	is_help_flag, .-is_help_flag
	.rdata
	.align	2
$LC2:
	.ascii	"-V\000"
	.align	2
$LC3:
	.ascii	"--version\000"
	.text
	.align	2
	.globl	is_version_flag
	.set	nomips16
	.set	nomicromips
	.ent	is_version_flag
	.type	is_version_flag, @function
is_version_flag:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,32($fp)
	lw	$2,%got($LC2)($28)
	addiu	$5,$2,%lo($LC2)
	lw	$4,32($fp)
	lw	$2,%call16(strcmp)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strcmp
1:	jalr	$25
	nop

	lw	$28,16($fp)
	beq	$2,$0,$L12
	nop

	lw	$2,%got($LC3)($28)
	addiu	$5,$2,%lo($LC3)
	lw	$4,32($fp)
	lw	$2,%call16(strcmp)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strcmp
1:	jalr	$25
	nop

	lw	$28,16($fp)
	bne	$2,$0,$L13
	nop

$L12:
	li	$2,1			# 0x1
	b	$L14
	nop

$L13:
	move	$2,$0
$L14:
	andi	$2,$2,0x1
	andi	$2,$2,0x00ff
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	is_version_flag
	.size	is_version_flag, .-is_version_flag
	.rdata
	.align	2
$LC4:
	.ascii	"-i\000"
	.align	2
$LC5:
	.ascii	"--input\000"
	.text
	.align	2
	.globl	is_input_flag
	.set	nomips16
	.set	nomicromips
	.ent	is_input_flag
	.type	is_input_flag, @function
is_input_flag:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,32($fp)
	lw	$2,%got($LC4)($28)
	addiu	$5,$2,%lo($LC4)
	lw	$4,32($fp)
	lw	$2,%call16(strcmp)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strcmp
1:	jalr	$25
	nop

	lw	$28,16($fp)
	beq	$2,$0,$L17
	nop

	lw	$2,%got($LC5)($28)
	addiu	$5,$2,%lo($LC5)
	lw	$4,32($fp)
	lw	$2,%call16(strcmp)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strcmp
1:	jalr	$25
	nop

	lw	$28,16($fp)
	bne	$2,$0,$L18
	nop

$L17:
	li	$2,1			# 0x1
	b	$L19
	nop

$L18:
	move	$2,$0
$L19:
	andi	$2,$2,0x1
	andi	$2,$2,0x00ff
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	is_input_flag
	.size	is_input_flag, .-is_input_flag
	.rdata
	.align	2
$LC6:
	.ascii	"-o\000"
	.align	2
$LC7:
	.ascii	"--output\000"
	.text
	.align	2
	.globl	is_output_flag
	.set	nomips16
	.set	nomicromips
	.ent	is_output_flag
	.type	is_output_flag, @function
is_output_flag:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,32($fp)
	lw	$2,%got($LC6)($28)
	addiu	$5,$2,%lo($LC6)
	lw	$4,32($fp)
	lw	$2,%call16(strcmp)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strcmp
1:	jalr	$25
	nop

	lw	$28,16($fp)
	beq	$2,$0,$L22
	nop

	lw	$2,%got($LC7)($28)
	addiu	$5,$2,%lo($LC7)
	lw	$4,32($fp)
	lw	$2,%call16(strcmp)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strcmp
1:	jalr	$25
	nop

	lw	$28,16($fp)
	bne	$2,$0,$L23
	nop

$L22:
	li	$2,1			# 0x1
	b	$L24
	nop

$L23:
	move	$2,$0
$L24:
	andi	$2,$2,0x1
	andi	$2,$2,0x00ff
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	is_output_flag
	.size	is_output_flag, .-is_output_flag
	.align	2
	.globl	get_2args_mode
	.set	nomips16
	.set	nomicromips
	.ent	get_2args_mode
	.type	get_2args_mode, @function
get_2args_mode:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,40($fp)
	lw	$2,40($fp)
	lw	$2,4($2)
	sw	$2,24($fp)
	lw	$4,24($fp)
	lw	$2,%got(is_help_flag)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,is_help_flag
1:	jalr	$25
	nop

	lw	$28,16($fp)
	beq	$2,$0,$L27
	nop

	li	$2,1			# 0x1
	b	$L28
	nop

$L27:
	lw	$4,24($fp)
	lw	$2,%got(is_version_flag)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,is_version_flag
1:	jalr	$25
	nop

	lw	$28,16($fp)
	beq	$2,$0,$L29
	nop

	li	$2,2			# 0x2
	b	$L28
	nop

$L29:
	li	$2,-1			# 0xffffffffffffffff
$L28:
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	get_2args_mode
	.size	get_2args_mode, .-get_2args_mode
	.align	2
	.globl	get_3args_mode
	.set	nomips16
	.set	nomicromips
	.ent	get_3args_mode
	.type	get_3args_mode, @function
get_3args_mode:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,40($fp)
	lw	$2,40($fp)
	lw	$2,4($2)
	sw	$2,24($fp)
	lw	$4,24($fp)
	lw	$2,%got(is_input_flag)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,is_input_flag
1:	jalr	$25
	nop

	lw	$28,16($fp)
	beq	$2,$0,$L31
	nop

	li	$2,3			# 0x3
	b	$L32
	nop

$L31:
	lw	$4,24($fp)
	lw	$2,%got(is_output_flag)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,is_output_flag
1:	jalr	$25
	nop

	lw	$28,16($fp)
	beq	$2,$0,$L33
	nop

	li	$2,4			# 0x4
	b	$L32
	nop

$L33:
	li	$2,-1			# 0xffffffffffffffff
$L32:
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	get_3args_mode
	.size	get_3args_mode, .-get_3args_mode
	.align	2
	.globl	get_5args_mode
	.set	nomips16
	.set	nomicromips
	.ent	get_5args_mode
	.type	get_5args_mode, @function
get_5args_mode:
	.frame	$fp,48,$31		# vars= 16, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$fp,40($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,48($fp)
	lw	$2,48($fp)
	lw	$2,4($2)
	sw	$2,24($fp)
	lw	$2,48($fp)
	lw	$2,12($2)
	sw	$2,28($fp)
	lw	$4,24($fp)
	lw	$2,%got(is_input_flag)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,is_input_flag
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sb	$2,32($fp)
	lw	$4,28($fp)
	lw	$2,%got(is_input_flag)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,is_input_flag
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sb	$2,33($fp)
	lw	$4,24($fp)
	lw	$2,%got(is_output_flag)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,is_output_flag
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sb	$2,34($fp)
	lw	$4,28($fp)
	lw	$2,%got(is_output_flag)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,is_output_flag
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sb	$2,35($fp)
	lbu	$2,32($fp)
	beq	$2,$0,$L35
	nop

	lbu	$2,35($fp)
	beq	$2,$0,$L35
	nop

	li	$2,5			# 0x5
	b	$L36
	nop

$L35:
	lbu	$2,34($fp)
	beq	$2,$0,$L37
	nop

	lbu	$2,33($fp)
	beq	$2,$0,$L37
	nop

	li	$2,6			# 0x6
	b	$L36
	nop

$L37:
	li	$2,-1			# 0xffffffffffffffff
$L36:
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	addiu	$sp,$sp,48
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	get_5args_mode
	.size	get_5args_mode, .-get_5args_mode
	.align	2
	.globl	get_exec_mode
	.set	nomips16
	.set	nomicromips
	.ent	get_exec_mode
	.type	get_exec_mode, @function
get_exec_mode:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,32($fp)
	sw	$5,36($fp)
	lw	$2,32($fp)
	li	$3,2			# 0x2
	beq	$2,$3,$L40
	nop

	slt	$3,$2,3
	beq	$3,$0,$L41
	nop

	li	$3,1			# 0x1
	beq	$2,$3,$L42
	nop

	b	$L39
	nop

$L41:
	li	$3,3			# 0x3
	beq	$2,$3,$L43
	nop

	li	$3,5			# 0x5
	beq	$2,$3,$L44
	nop

	b	$L39
	nop

$L42:
	li	$2,7			# 0x7
	b	$L45
	nop

$L40:
	lw	$4,36($fp)
	lw	$2,%got(get_2args_mode)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,get_2args_mode
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L45
	nop

$L43:
	lw	$4,36($fp)
	lw	$2,%got(get_3args_mode)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,get_3args_mode
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L45
	nop

$L44:
	lw	$4,36($fp)
	lw	$2,%got(get_5args_mode)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,get_5args_mode
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L45
	nop

$L39:
	li	$2,-1			# 0xffffffffffffffff
$L45:
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	get_exec_mode
	.size	get_exec_mode, .-get_exec_mode
	.rdata
	.align	2
$LC8:
	.ascii	" \000"
	.text
	.align	2
	.globl	parse_vec_buffer
	.set	nomips16
	.set	nomicromips
	.ent	parse_vec_buffer
	.type	parse_vec_buffer, @function
parse_vec_buffer:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,40($fp)
	sw	$5,44($fp)
	lw	$4,44($fp)
	lw	$2,%got(vector_clear)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,vector_clear
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC8)($28)
	addiu	$5,$2,%lo($LC8)
	lw	$4,40($fp)
	lw	$2,%call16(strtok)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strtok
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
	b	$L47
	nop

$L48:
	li	$6,10			# 0xa
	move	$5,$0
	lw	$4,24($fp)
	lw	$2,%call16(strtol)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strtol
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,28($fp)
	lw	$5,28($fp)
	lw	$4,44($fp)
	lw	$2,%got(vector_push)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,vector_push
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC8)($28)
	addiu	$5,$2,%lo($LC8)
	move	$4,$0
	lw	$2,%call16(strtok)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strtok
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
$L47:
	lw	$2,24($fp)
	bne	$2,$0,$L48
	nop

	move	$2,$0
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	parse_vec_buffer
	.size	parse_vec_buffer, .-parse_vec_buffer
	.align	2
	.globl	read_vector
	.set	nomips16
	.set	nomicromips
	.ent	read_vector
	.type	read_vector, @function
read_vector:
	.frame	$fp,48,$31		# vars= 16, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$fp,40($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,48($fp)
	sw	$5,52($fp)
	sw	$0,28($fp)
	sw	$0,32($fp)
	addiu	$3,$fp,32
	addiu	$2,$fp,28
	lw	$6,48($fp)
	move	$5,$3
	move	$4,$2
	lw	$2,%call16(getline)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,getline
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,24($fp)
	lw	$3,24($fp)
	li	$2,-1			# 0xffffffffffffffff
	beq	$3,$2,$L51
	nop

	lw	$2,24($fp)
	bne	$2,$0,$L52
	nop

$L51:
	lw	$3,24($fp)
	li	$2,-1			# 0xffffffffffffffff
	bne	$3,$2,$L53
	nop

	move	$4,$0
	lw	$2,%call16(perror)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,perror
1:	jalr	$25
	nop

	lw	$28,16($fp)
$L53:
	lw	$2,28($fp)
	move	$4,$2
	lw	$2,%call16(free)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,free
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,-1			# 0xffffffffffffffff
	b	$L55
	nop

$L52:
	lw	$2,28($fp)
	lw	$5,52($fp)
	move	$4,$2
	lw	$2,%got(parse_vec_buffer)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,parse_vec_buffer
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,28($fp)
	move	$4,$2
	lw	$2,%call16(free)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,free
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$2,$0
$L55:
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	addiu	$sp,$sp,48
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	read_vector
	.size	read_vector, .-read_vector
	.rdata
	.align	2
$LC9:
	.ascii	"%i \000"
	.text
	.align	2
	.globl	print_sorted_vec
	.set	nomips16
	.set	nomicromips
	.ent	print_sorted_vec
	.type	print_sorted_vec, @function
print_sorted_vec:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,40($fp)
	sw	$5,44($fp)
	sw	$0,24($fp)
	b	$L57
	nop

$L58:
	lw	$2,44($fp)
	lw	$3,0($2)
	lw	$2,24($fp)
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$2,0($2)
	move	$6,$2
	lw	$2,%got($LC9)($28)
	addiu	$5,$2,%lo($LC9)
	lw	$4,40($fp)
	lw	$2,%call16(fprintf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fprintf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
$L57:
	lw	$2,44($fp)
	lw	$3,4($2)
	lw	$2,24($fp)
	sltu	$2,$2,$3
	bne	$2,$0,$L58
	nop

	lw	$5,40($fp)
	li	$4,10			# 0xa
	lw	$2,%call16(fputc)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fputc
1:	jalr	$25
	nop

	lw	$28,16($fp)
	nop
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	print_sorted_vec
	.size	print_sorted_vec, .-print_sorted_vec
	.rdata
	.align	2
$LC10:
	.ascii	"Usage:\000"
	.align	2
$LC11:
	.ascii	"\011tp1 -h\000"
	.align	2
$LC12:
	.ascii	"\011tp1 -V\000"
	.align	2
$LC13:
	.ascii	"\011tp1 -i in_file -o out_file\000"
	.align	2
$LC14:
	.ascii	"Options:\000"
	.align	2
$LC15:
	.ascii	"\011-V, --version Print version and quit.\000"
	.align	2
$LC16:
	.ascii	"\011-h, --help Print this information and quit.\000"
	.align	2
$LC17:
	.ascii	"\011-i, --input Specify input stream/file, '-' for stdin"
	.ascii	"\000"
	.align	2
$LC18:
	.ascii	"\011-o, --output Specify output stream/file, '-' for std"
	.ascii	"out.\000"
	.align	2
$LC19:
	.ascii	"Examples:\000"
	.align	2
$LC20:
	.ascii	"\011tp1 < in.txt > out.txt\000"
	.align	2
$LC21:
	.ascii	"\011cat in.txt | tp1 -i - > out.txt\000"
	.text
	.align	2
	.globl	help
	.set	nomips16
	.set	nomicromips
	.ent	help
	.type	help, @function
help:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	.cprestore	16
	lw	$2,%got($LC10)($28)
	addiu	$4,$2,%lo($LC10)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC11)($28)
	addiu	$4,$2,%lo($LC11)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC12)($28)
	addiu	$4,$2,%lo($LC12)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC13)($28)
	addiu	$4,$2,%lo($LC13)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC14)($28)
	addiu	$4,$2,%lo($LC14)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC15)($28)
	addiu	$4,$2,%lo($LC15)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC16)($28)
	addiu	$4,$2,%lo($LC16)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC17)($28)
	addiu	$4,$2,%lo($LC17)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC18)($28)
	addiu	$4,$2,%lo($LC18)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC19)($28)
	addiu	$4,$2,%lo($LC19)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC20)($28)
	addiu	$4,$2,%lo($LC20)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,%got($LC21)($28)
	addiu	$4,$2,%lo($LC21)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$2,$0
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	help
	.size	help, .-help
	.rdata
	.align	2
$LC22:
	.ascii	"vsorter version: 1.0.0\000"
	.text
	.align	2
	.globl	version
	.set	nomips16
	.set	nomicromips
	.ent	version
	.type	version, @function
version:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	.cprestore	16
	lw	$2,%got($LC22)($28)
	addiu	$4,$2,%lo($LC22)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$2,$0
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	version
	.size	version, .-version
	.align	2
	.globl	sort
	.set	nomips16
	.set	nomicromips
	.ent	sort
	.type	sort, @function
sort:
	.frame	$fp,48,$31		# vars= 16, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$fp,40($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,48($fp)
	sw	$5,52($fp)
	addiu	$2,$fp,24
	move	$4,$2
	lw	$2,%got(vector_init)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,vector_init
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L64
	nop

$L65:
	lw	$2,24($fp)
	lw	$3,28($fp)
	move	$5,$3
	move	$4,$2
	lw	$2,%call16(merge_sort)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,merge_sort
1:	jalr	$25
	nop

	lw	$28,16($fp)
	addiu	$2,$fp,24
	move	$5,$2
	lw	$4,52($fp)
	lw	$2,%got(print_sorted_vec)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,print_sorted_vec
1:	jalr	$25
	nop

	lw	$28,16($fp)
$L64:
	addiu	$2,$fp,24
	move	$5,$2
	lw	$4,48($fp)
	lw	$2,%got(read_vector)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,read_vector
1:	jalr	$25
	nop

	lw	$28,16($fp)
	beq	$2,$0,$L65
	nop

	addiu	$2,$fp,24
	move	$4,$2
	lw	$2,%got(vector_destroy)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,vector_destroy
1:	jalr	$25
	nop

	lw	$28,16($fp)
	nop
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	addiu	$sp,$sp,48
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	sort
	.size	sort, .-sort
	.rdata
	.align	2
$LC23:
	.ascii	"-\000"
	.align	2
$LC24:
	.ascii	"unrecognized command line option\000"
	.align	2
$LC25:
	.ascii	"r+\000"
	.align	2
$LC26:
	.ascii	"could not open input file\012\000"
	.align	2
$LC27:
	.ascii	"w+\000"
	.align	2
$LC28:
	.ascii	"could not open output file\012\000"
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,56,$31		# vars= 24, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-56
	sw	$31,52($sp)
	sw	$fp,48($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,56($fp)
	sw	$5,60($fp)
	lw	$2,%got($LC23)($28)
	addiu	$2,$2,%lo($LC23)
	sw	$2,24($fp)
	lw	$2,%got(stdin)($28)
	lw	$2,0($2)
	sw	$2,28($fp)
	lw	$2,%got($LC23)($28)
	addiu	$2,$2,%lo($LC23)
	sw	$2,32($fp)
	lw	$2,%got(stdout)($28)
	lw	$2,0($2)
	sw	$2,36($fp)
	lw	$5,60($fp)
	lw	$4,56($fp)
	lw	$2,%got(get_exec_mode)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,get_exec_mode
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,40($fp)
	lw	$2,40($fp)
	sltu	$2,$2,7
	beq	$2,$0,$L67
	nop

	lw	$2,40($fp)
	sll	$3,$2,2
	lw	$2,%got($L69)($28)
	addiu	$2,$2,%lo($L69)
	addu	$2,$3,$2
	lw	$2,0($2)
	addu	$2,$2,$28
	jr	$2
	nop

	.rdata
	.align	2
	.align	2
$L69:
	.gpword	$L67
	.gpword	$L68
	.gpword	$L70
	.gpword	$L71
	.gpword	$L72
	.gpword	$L73
	.gpword	$L74
	.text
$L70:
	lw	$2,%got(version)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,version
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L75
	nop

$L68:
	lw	$2,%got(help)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,help
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L75
	nop

$L71:
	lw	$2,60($fp)
	lw	$2,8($2)
	sw	$2,24($fp)
	b	$L76
	nop

$L72:
	lw	$2,60($fp)
	lw	$2,8($2)
	sw	$2,32($fp)
	b	$L76
	nop

$L73:
	lw	$2,60($fp)
	lw	$2,8($2)
	sw	$2,24($fp)
	lw	$2,60($fp)
	lw	$2,16($2)
	sw	$2,32($fp)
	b	$L76
	nop

$L74:
	lw	$2,60($fp)
	lw	$2,16($2)
	sw	$2,24($fp)
	lw	$2,60($fp)
	lw	$2,8($2)
	sw	$2,32($fp)
	b	$L76
	nop

$L67:
	lw	$2,%got(stderr)($28)
	lw	$2,0($2)
	move	$7,$2
	li	$6,32			# 0x20
	li	$5,1			# 0x1
	lw	$2,%got($LC24)($28)
	addiu	$4,$2,%lo($LC24)
	lw	$2,%call16(fwrite)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,-1			# 0xffffffffffffffff
	b	$L75
	nop

$L76:
	lw	$2,%got($LC23)($28)
	addiu	$5,$2,%lo($LC23)
	lw	$4,24($fp)
	lw	$2,%call16(strcmp)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strcmp
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sltu	$2,$2,1
	sb	$2,44($fp)
	lw	$2,%got($LC23)($28)
	addiu	$5,$2,%lo($LC23)
	lw	$4,32($fp)
	lw	$2,%call16(strcmp)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,strcmp
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sltu	$2,$2,1
	sb	$2,45($fp)
	lbu	$2,44($fp)
	xori	$2,$2,0x1
	andi	$2,$2,0x00ff
	beq	$2,$0,$L77
	nop

	lw	$2,%got($LC25)($28)
	addiu	$5,$2,%lo($LC25)
	lw	$4,24($fp)
	lw	$2,%call16(fopen)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fopen
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,28($fp)
	lw	$2,28($fp)
	bne	$2,$0,$L77
	nop

	lw	$2,%got(stderr)($28)
	lw	$2,0($2)
	move	$7,$2
	li	$6,26			# 0x1a
	li	$5,1			# 0x1
	lw	$2,%got($LC26)($28)
	addiu	$4,$2,%lo($LC26)
	lw	$2,%call16(fwrite)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	nop

	lw	$28,16($fp)
	li	$2,-1			# 0xffffffffffffffff
	b	$L75
	nop

$L77:
	lbu	$2,45($fp)
	xori	$2,$2,0x1
	andi	$2,$2,0x00ff
	beq	$2,$0,$L78
	nop

	lw	$2,%got($LC27)($28)
	addiu	$5,$2,%lo($LC27)
	lw	$4,32($fp)
	lw	$2,%call16(fopen)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fopen
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,36($fp)
	lw	$2,36($fp)
	bne	$2,$0,$L78
	nop

	lw	$2,%got(stderr)($28)
	lw	$2,0($2)
	move	$7,$2
	li	$6,27			# 0x1b
	li	$5,1			# 0x1
	lw	$2,%got($LC28)($28)
	addiu	$4,$2,%lo($LC28)
	lw	$2,%call16(fwrite)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fwrite
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lbu	$2,44($fp)
	xori	$2,$2,0x1
	andi	$2,$2,0x00ff
	beq	$2,$0,$L79
	nop

	lw	$4,28($fp)
	lw	$2,%call16(fclose)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	nop

	lw	$28,16($fp)
$L79:
	li	$2,-1			# 0xffffffffffffffff
	b	$L75
	nop

$L78:
	lw	$5,36($fp)
	lw	$4,28($fp)
	lw	$2,%got(sort)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,sort
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lbu	$2,44($fp)
	xori	$2,$2,0x1
	andi	$2,$2,0x00ff
	beq	$2,$0,$L80
	nop

	lw	$4,28($fp)
	lw	$2,%call16(fclose)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	nop

	lw	$28,16($fp)
$L80:
	lbu	$2,45($fp)
	xori	$2,$2,0x1
	andi	$2,$2,0x00ff
	beq	$2,$0,$L81
	nop

	lw	$4,36($fp)
	lw	$2,%call16(fclose)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	nop

	lw	$28,16($fp)
$L81:
	move	$2,$0
$L75:
	move	$sp,$fp
	lw	$31,52($sp)
	lw	$fp,48($sp)
	addiu	$sp,$sp,56
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
