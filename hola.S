#include <sys/regdef.h>
#include <sys/syscall.h>

.data
hola: .asciiz "Hola\n"
msg: .asciiz "%d\n"

.text
.align 2

.ent main_tst
.globl main_tst

main_tst:
	.frame fp, 16, ra

	.set noreorder
	.cpload t9
	.set reorder

	subu sp, sp, 40
	sw ra, 8(sp)
	sw fp, 4(sp)
	.cprestore 0
	
	move fp, sp

	la t0, hola

	li a0, 1
	la a1, hola
	li a2, 6 
	li v0, SYS_write     #write
	syscall

	li a0, 1
	la a1, msg
	move a2, t0
	li a3, 4
	li v0, SYS_write
	syscall

	#la t0, hola
	#li v0, 1      #print int
	#syscall	

	addiu v0, zero, 0
	lw ra, 8(sp)
	lw fp, 4(sp)
	lw gp, 0(sp)
	addiu sp, sp, 40
	jr ra

.end main_tst


