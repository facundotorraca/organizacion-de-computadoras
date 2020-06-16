#include <sys/regdef.h>
#include "mergesortrec.S"
#include "mymalloc.S"

#define MS_A1_OFF 44
#define MS_A0_OFF 40
#define MS_STACK_SZ 40
#define MS_RA_OFF 32
#define MS_FP_OFF 28
#define MS_GP_OFF 24
#define MS_LTA_OFF 16

.data
err_msg: .asciiz "Mymalloc error\n"

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
    .frame fp, MS_STACK_SZ, ra  # 16 -> SRA | 8 -> LTA | 16 -> ABA

    # stack frame creation
    subu sp, sp, MS_STACK_SZ    # callee stack -> [sp, sp + 40]

    # saved register area (SRA)
                                # padding in (36 + sp) | callee stack
    sw ra, MS_RA_OFF(sp)        # save ra in (32 + sp) | callee stack
    sw fp, MS_FP_OFF(sp)        # save fp in (28 + sp) | callee stack
    .cprestore MS_GP_OFF        # save gp in (MS_GP_OFF + sp) | callee stack

    move fp, sp                 # fp = sp

    # fill ABA caller
                                # a3 reserved area     | caller stack
                                # a2 reserved area     | caller stack
    sw a1, MS_A1_OFF(fp)        # save a1 in (44 + sp) | caller stack
    sw a0, MS_A0_OFF(fp)        # save a1 in (40 + sp) | caller stack

    # local and temporary area (LTA)
                                # padding stack[sp + 20]
    sll a0, a1, 2               # a0 = array size * 4 (bytes)
    jal mymalloc                # call void* mymalloc(size_t)
                                # return value stored in v0

    beqz v0, _exit              # if mymalloc failed then v0=NULL and we call exit syscall

    sw v0, MS_LTA_OFF(fp)       # aux_array saved in LTA

    lw a0, MS_A0_OFF(fp)        # retrieve a0 from ABA - a0 = stack[40 + fp]
    lw a1, MS_A1_OFF(fp)        # retrieve a1 from ABA - a1 = stack[44 + fp]

    subu t1, a1, 1              # calculate right index (t1 = size - 1)

    # a0 = array pointer (P)
    move a1, v0                 # a1 = v0 = merge aux array pointer (T)
    move a2, zero               # a2 = left index (L) = 0
    move a3, t1                 # a3 = t1 = right index (R) = size - 1

    # argument building area (ABA)
    # reserved MS_LTA_OFF bytes for callee

    jal _merge_sort_rec

    lw a0, MS_LTA_OFF(fp)       # load aux_array in a0
    jal myfree                  # free memory requested by aux_array

#--------------------RETURN-----------------------#
_return_ms:
    # retreive registers from SRA
    lw	gp, MS_GP_OFF(sp)
    lw	fp, MS_FP_OFF(sp)
    lw	ra, MS_RA_OFF(sp)
    addiu sp, sp, MS_STACK_SZ   # increment stack pointer
    jr	ra                      # jump to return address
#-------------------------------------------------#

#-------------------EXIT_SYS---------------------#
_exit:
    #Write err_msg to stderr
    li a0, 2                    # a0 = stderr fd=2
    li a1, err_msg              # a1 = err_msg
    li a2, 15                   # a2 = strlen(err_msg)
    li v0, SYS_write            # Syscall write(2, err_msg, strlen(err_msg)
    syscall

    addiu sp, sp, MS_STACK_SZ   # increment stack pointer
    li  a0, -1                  # exit value = -1
    li  v0, 17                  # Syscall exit2 = 17
    syscall
#-------------------------------------------------#

.end merge_sort
#-----------------------------------------------------------------------#
