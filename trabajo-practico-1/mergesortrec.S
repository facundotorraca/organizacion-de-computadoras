#include <sys/regdef.h>
#include "merge.S"

.text
.align 2

.ent _merge_sort_rec
.globl _merge_sort_rec
#-------------------------MERGE-SORT-RECURSIVE--------------------------#
_merge_sort_rec:
    # a0 -> array pointer (P)
    # a1 -> merge aux array pointer (T)
    # a2 -> left index (L)
    # a3 -> right index (R)

    # fp -> stack begin
    # 40 -> stack size
    # ra -> return addr
    .frame fp, 40, ra   # 16 -> SRA | 8 -> LTA | 16 -> ABA

    # stack frame creation
    subu sp, sp, 40     # callee stack -> [sp, sp + 40]

    # saved register area (SRA)
                        # padding in (36 + sp) | callee stack
    sw ra, 32(sp)       # save ra in (32 + sp) | callee stack
    sw fp, 28(sp)       # save fp in (28 + sp) | callee stack
    .cprestore 24       # save gp in (24 + sp) | callee stack

    move fp, sp         # fp = sp

    # fill ABA caller
    sw a3, 52(fp)       # save a3 in (52 + sp) | caller stack
    sw a2, 48(fp)       # save a2 in (48 + sp) | caller stack
    sw a1, 44(fp)       # save a1 in (44 + sp) | caller stack
    sw a0, 40(fp)       # save a0 in (40 + sp) | caller stack

    bge a2, a3, _return_ms_rec # if (L >= R) return
    nop

    #calculates the middle of the array
    subu t0, a3, a2     # t0 <-- R - L
    srl t0, t0, 1       # t0 <-- t0 / 2
    addu t0, t0, a2     # t0 <-- t0 + L
    # t0 <-- L (R - L) / 2 = m

    # local and temporary area (LTA)
    # padding stack[sp + 20]
    sw t0, 16(fp)

    # a0 = array pointer (P)
    # a1 = merge aux array pointer (T)
    # a2 = left index (L)
    move a3, t0         # a3 = t0 = right index (R) = m

    jal _merge_sort_rec

    lw a3, 52(fp)       # retrieve a3 from (52 + sp) | caller stack (a3 = right index (R))
    lw a2, 48(fp)       # retrieve a2 from (48 + sp) | caller stack (a2 = left index (L))
    lw a1, 44(fp)       # retrieve a1 from (44 + sp) | caller stack (a1 = merge aux array pointer (T))
    lw a0, 40(fp)       # retrieve a0 from (40 + sp) | caller stack (a0 = array pointer (P))

    lw t0, 16(fp)       # retrieve m
    addiu t0, t0, 1     # m = m + 1

    # a0 = array pointer (P)
    # a1 = merge aux array pointer (T)
    move a2, t0         # a2 = left index (L) = m + 1
    # a3 = right index (R)

    jal _merge_sort_rec

    lw a3, 52(fp)       # retrieve a3 from (52 + sp) | caller stack (a3 = right index (R))
    lw a2, 48(fp)       # retrieve a2 from (48 + sp) | caller stack (a2 = left index (L))
    lw a1, 44(fp)       # retrieve a1 from (44 + sp) | caller stack (a1 = merge aux array pointer (T))
    lw a0, 40(fp)       # retrieve a0 from (40 + sp) | caller stack (a0 = array pointer (P))

    jal merge

#--------------------RETURN-----------------------#
_return_ms_rec:
    # retreive registers from SRA
    lw	gp, 24(sp)
    lw	fp, 28(sp)
    lw	ra, 32(sp)
    addiu sp, sp, 40    # increment stack pointer
    jr	ra              # jump to return address
#-------------------------------------------------#

.end _merge_sort_rec
#-----------------------------------------------------------------------#
