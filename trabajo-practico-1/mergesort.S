#include <sys/regdef.h>
#include "mergesortrec.S"
#include "mymalloc.S"

.text
.align 2

.ent merge_sort
.globl merge_sort
#-----------------------------MERGE-SORT--------------------------------#
merge_sort:
    # a0 -> array pointer
    # a1 -> array size

    # fp -> stack begin
    # 40 -> stack size
    # ra -> retunr addr
	.frame fp, 40, ra	# 16 -> SRA | 8 -> LTA | 16 -> ABA

    # stack frame creation
    subu sp, sp, 40		# callee stack -> [sp, sp + 40]

    # saved register area (SRA)
                        # padding in (36 + sp) | callee stack
    .cprestore 24	    # save gp in (24 + sp) | callee stack
    sw ra, 32(sp)	    # save ra in (32 + sp) | callee stack
    sw fp, 28(sp)	    # save fp in (28 + sp) | callee stack

    move fp, sp         # fp = sp

    # fill ABA caller
                        # a3 reserved area     | caller stack
                      	# a2 reserved area     | caller stack
    sw a1, 44(fp)      	# save a1 in (44 + sp) | caller stack
    sw a0, 40(fp)       # save a1 in (40 + sp) | caller stack

    # local and temporary area (LTA)
                        # padding stack[sp + 20]
    sll a0, a1, 2       # a0 = array size * 4 (bytes)
    #jal mymalloc       # call void* mymalloc(size_t)
                        # return value stored in v0

    li v0, 5
    sw v0, 16(fp)       # aux_array saved in LTA

    lw a0, 40(fp)       # retrieve a0 from ABA - a0 = stack[40 + fp]
    lw a1, 44(fp)       # retrieve a1 from ABA - a1 = stack[44 + fp]

    subu t1, a1, 1      # calculate right index (t1 = size - 1)

    move a0, a0         # redundant (a0 = array pointer (P))
    move a1, v0         # a1 = v0 = merge aux array pointer (T)
    move a2, zero       # a2 = left index (L) = 0
    move a3, t1         # a3 = t1 = right index (R) = size - 1

    # argument building area (ABA)
    # reserved 16 bytes for callee

    jal _merge_sort_rec

    lw a0, 16(fp)       # load aux_array in a0
    jal myfree          # free memory requested by aux_array

#--------------------RETURN-----------------------#
_return_ms:
    # retreive registers from SRA
    lw	gp, 24(sp)
    lw	fp, 28(sp)
    lw	ra, 32(sp)
    addiu sp, sp, 40    # increment stack pointer
    jr	ra              # jump to return address
#-------------------------------------------------#

.end merge_sort
#-----------------------------------------------------------------------#
