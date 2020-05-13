#include <sys/regdef.h>
#include "mymalloc.S"

.text
.align 2
.globl merge_sort
.ent merge_sort


merge_sort:

	.frame 	fp,40,ra
  subu 	sp,sp,40 	#Stack frame creation

  #Saved register area.
	.cprestore 24		# Save gp in (24 + sp)
	sw	ra,32(sp)   #
	sw	fp,28(sp)	  #
	move	fp,sp     #

	sw	a0,40(fp)	#ABA
	sw	a0,16(fp)	#LTA
	lw	t0,16(fp) #
	li	t1,2      #
	bltu	t0,t1,ret1
