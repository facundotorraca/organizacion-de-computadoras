#include <sys/regdef.h>
#include "merge.S"

#define MSR_A3_OFF 52
#define MSR_A2_OFF 48
#define MSR_A1_OFF 44
#define MSR_A0_OFF 40

#define MSR_RA_OFF 32
#define MSR_FP_OFF 28
#define MSR_GP_OFF 24

#define MSR_LTA_OFF 16
#define MSR_STACK_SZ 40

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
    .frame fp, MSR_STACK_SZ, ra     # 16 -> SRA | 8 -> LTA | 16 -> ABA

    # stack frame creation
    subu sp, sp, MSR_STACK_SZ       # callee stack -> [sp, sp + 40]

    # saved register area (SRA)
                                    # padding in (36 + sp) | callee stack
    sw ra, MSR_RA_OFF(sp)           # save ra in (32 + sp) | callee stack
    sw fp, MSR_FP_OFF(sp)           # save fp in (28 + sp) | callee stack
    .cprestore MSR_GP_OFF           # save gp in (24 + sp) | callee stack

    move fp, sp                     # fp = sp

    # fill ABA caller
    sw a3, MSR_A3_OFF(fp)           # save a3 in (52 + sp) | caller stack
    sw a2, MSR_A2_OFF(fp)           # save a2 in (48 + sp) | caller stack
    sw a1, MSR_A1_OFF(fp)           # save a1 in (44 + sp) | caller stack
    sw a0, MSR_A0_OFF(fp)           # save a0 in (40 + sp) | caller stack

    bge a2, a3, _return_ms_rec      # if (L >= R) return
    nop

    #calculates the middle of the array
    subu t0, a3, a2                 # t0 <-- R - L
    srl t0, t0, 1                   # t0 <-- t0 / 2
    addu t0, t0, a2                 # t0 <-- t0 + L
    # t0 <-- L (R - L) / 2 = m

    # local and temporary area (LTA)
    # padding stack[sp + 20]
    sw t0, MSR_LTA_OFF(fp)

    # a0 = array pointer (P)
    # a1 = merge aux array pointer (T)
    # a2 = left index (L)
    move a3, t0                     # a3 = t0 = right index (R) = m

    jal _merge_sort_rec

    lw a3, MSR_A3_OFF(fp)           # retrieve a3 from (52 + sp) | caller stack (a3 = right index (R))
    lw a2, MSR_A2_OFF(fp)           # retrieve a2 from (48 + sp) | caller stack (a2 = left index (L))
    lw a1, MSR_A1_OFF(fp)           # retrieve a1 from (44 + sp) | caller stack (a1 = merge aux array pointer (T))
    lw a0, MSR_A0_OFF(fp)           # retrieve a0 from (40 + sp) | caller stack (a0 = array pointer (P))

    lw t0, MSR_LTA_OFF(fp)          # retrieve m
    addiu t0, t0, 1                 # m = m + 1

    # a0 = array pointer (P)
    # a1 = merge aux array pointer (T)
    move a2, t0                     # a2 = left index (L) = m + 1
    # a3 = right index (R)

    jal _merge_sort_rec

    lw a3, MSR_A3_OFF(fp)           # retrieve a3 from (52 + sp) | caller stack (a3 = right index (R))
    lw a2, MSR_A2_OFF(fp)           # retrieve a2 from (48 + sp) | caller stack (a2 = left index (L))
    lw a1, MSR_A1_OFF(fp)           # retrieve a1 from (44 + sp) | caller stack (a1 = merge aux array pointer (T))
    lw a0, MSR_A0_OFF(fp)           # retrieve a0 from (40 + sp) | caller stack (a0 = array pointer (P))

    jal merge

#--------------------RETURN-----------------------#
_return_ms_rec:
    # retreive registers from SRA
    lw	gp, MSR_GP_OFF(sp)
    lw	fp, MSR_FP_OFF(sp)
    lw	ra, MSR_RA_OFF(sp)
    addiu sp, sp, MSR_STACK_SZ      # increment stack pointer
    jr	ra                          # jump to return address
#-------------------------------------------------#

.end _merge_sort_rec
#-----------------------------------------------------------------------#
