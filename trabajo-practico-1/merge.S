#include <sys/regdef.h>

.text
.align 2

.ent merge
.globl merge
#--------------------------------MERGE----------------------------------#
merge:
    # a0 -> array pointer (P)
    # a1 -> merge aux array pointer (T)
    # a2 -> left index (L)
    # a3 -> right index (R)

    # fp -> stack begin
    # 32 -> stack size
    # ra -> retunr addr
    .frame fp, 32, ra  # 16 -> SRA | 16 -> LTA
    .set noreorder
    .cpload t9
    .set reorder
    # leaf-function -> ABA is not created

    # stack frame creation
    subu sp, sp, 32     # callee stack -> [sp, sp + 32]

    # fill ABA caller
    sw a3, 44(sp)       # save a3 in (44 + sp) | caller stack
    sw a2, 40(sp)       # save a2 in (40 + sp) | caller stack
    sw a1, 36(sp)       # save a1 in (36 + sp) | caller stack
    sw a0, 32(sp)       # save a0 in (32 + sp) | caller stack

    # saved register area (SRA)
                        # padding in (28 + sp) | callee stack
    sw ra, 24(sp)       # save ra in (24 + sp) | callee stack
    sw fp, 20(sp)       # save fp in (20 + sp) | callee stack
    .cprestore 16       # save gp in (16 + sp) | callee stack

    move fp, sp         # fp = sp

    # temps regs that dont change values during the execution
    # t0 -> array middle index  (m)
    # t1 -> left subarray size  (l_size)
    # t2 -> right subarray size (r_size)

    # t3, t4, t5, t6, t7 -> free to use

    #calculates the middle of the array
    subu t0, a3, a2     # t0 <-- R - L
    srl t0, t0, 1       # t0 <-- t0 / 2
    addu t0, t0, a2     # t0 <-- t0 + L
    # t0 <-- L (R - L) / 2 = m

    # calculate l_size
    subu t1, t0, a2     # t1 <-- m - L
    addiu t1, t1, 1     # t1 <-- t1 + 1 = l_size

    # calculate r_size
    subu t2, a3, t0     #t2 <-- R - m (r_size)

    sw zero, 0(fp)      # save i = 0 in (0 + fp)
    sw zero, 4(fp)      # save j = 0 in (4 + fp)
    sw a2, 8(fp)        # save k = L in (8 + fp)

#-----------------WHILE LEFT AND RIGHT-------------------#
while_lr:               # while (i < l_size && j < r_size)
    lw t3, 0(fp)        # t3 <-- i
    lw t4, 4(fp)        # t4 <-- j

    bge t3, t1, end_lr  # if (i >= l_size) jump to end_lr
    bge t4, t2, end_lr  # if (j >= r_size) jump to end_lr

    addu t3, a2, t3     # t3 <-- L + i | index
    addu t4, t0, t4     # t4 <-- m + j
    addiu t4, t4, 1     # t4 <-- m + j + 1 | index

    sll t3, t3, 2       # t3 <-- (t3 * 4) | memory pos
    sll t4, t4, 2       # t4 <-- (t4 * 4) | memory pos

    addu t5, t3, a0     # t5 <-- &p[l + i] | memory pos
    lw t5, 0(t5)        # t5 <-- p[l + i]  | value

    addu t6, t4, a0     # t6 <-- &p[m + 1 + j] | memory pos
    lw t6, 0(t6)        # t6 <-- p[m + 1 + j]  | value

    blt t6, t5, else_lr # if (p[m + 1 + j] < p[l + i] ) jump to else_lr

    lw t7, 8(fp)        # t7 <-- k
    sll t7, t7, 2       # t7 <-- (k*4)
    addu t7, a1, t7     # t7 <-- t + (k*4) = &t[k] | memory pos
    sw t5, 0(t7)        # t[k] = p[l + i]

    lw t7, 0(fp)        # t7 <-- i
    addiu t7, t7, 1     # t7 <-- i + 1
    sw t7, 0(fp)        # i  <-- i + 1

    la t7, inc_k_lr     # t7 <-- address of inc_k_lr
    jr t7               # jump to inc_k_lr

else_lr:

    lw t7, 8(fp)        # t7 <-- k
    sll t7, t7, 2       # t7 <-- (k*4)
    addu t7, a1, t7     # t7 <-- t + (k*4) = &t[k] | memory pos
    sw t6, 0(t7)        # t[k] = p[m + 1 + j]

    lw t7, 4(fp)        # t7 <-- j
    addiu t7, t7, 1     # t7 <-- j + 1
    sw t7, 4(fp)        # j  <-- j + 1

    # continue to inc_k_lr

inc_k_lr:
    lw t7, 8(fp)        # t7 <-- k
    addiu t7, t7, 1     # t7 <-- k + 1
    sw t7, 8(fp)        # k  <-- k + 1

    la t7, while_lr     # t7 <-- address of while_lr
    jr t7               # jump to while_lr

end_lr:
    nop                 # continue to while_l
#--------------------------------------------------------#

#-----------------------WHILE LEFT-----------------------#
# copy the remaining elements of left side, if there are any.
while_l:                # while (i < l_size)

    lw t3, 0(fp)        # t3 <-- i
    bge t3, t1, end_l   # if (i < l_size) jump to end_l

    addu t3, t3, a2     # t3 <-- L + i
    sll t3, t3, 2       # t3 <-- (t3 * 4)  | memory pos
    addu t5, t3, a0     # t5 <-- &p[l + i] | memory pos
    lw t5, 0(t5)        # t5 <-- p[l + i]  | value

    lw t7, 8(fp)        # t7 <-- k
    sll t7, t7, 2       # t7 <-- (k*4)
    addu t7, a1, t7     # t7 <-- t + (k*4) = &t[k] | mem_pos
    sw t5, 0(t7)        # t[k] = p[l + i]

    lw t3, 0(fp)        # t3 <-- i
    addiu t3, t3, 1     # t3 <-- i + 1
    sw t3, 0(fp)        # i  <-- i + 1

    lw t7, 8(fp)        # t7 <-- k
    addiu t7, t7, 1     # t7 <-- k + 1
    sw t7, 8(fp)        # k  <-- k + 1

    la t7, while_l      # t7 <-- address of while_l
    jr t7               # jump to while_l

end_l:
    nop                 # continue to while_r
#--------------------------------------------------------#

#----------------------WHILE RIGHT-----------------------#
# copy the remaining elements of right side, if there are any.
while_r:                # while (j < r_size)

    lw t4, 4(fp)        # t4 <-- j
    bge t4, t2, end_r   # if (j >= r_size) jump to end_r

    addu t4, t0, t4     # t4 <--  m + j
    addiu t4, t4, 1     # t4 <--  m + j + 1 | index
    sll t4, t4, 2       # t4 <-- (t4 * 4) | mem_pos
    addu t6, t4, a0     # t6 <-- &p[m + j + 1] | mem_pos
    lw t6, 0(t6)        # t6 <-- p[m + j + 1] | value

    lw t7, 8(fp)        # t7 <-- k
    sll t7, t7, 2       # t7 <-- (k*4)
    addu t7, a1, t7     # t7 <-- t + (k*4) = &t[k] | mem_pos
    sw t6, 0(t7)        # t[k] = p[m + j + 1]

    lw t4, 4(fp)        # t7 <-- j
    addiu t4, t4, 1     # t7 <-- j + 1
    sw t4, 4(fp)        # j  <-- j + 1

    lw t7, 8(fp)        # t7 <-- k
    addiu t7, t7, 1     # t7 <-- k + 1
    sw t7, 8(fp)        # k  <-- k + 1

    la t7, while_r      # t7 <-- address of while_r
    jr t7               # jump to while_r

end_r:
    nop                 # continue to for
#--------------------------------------------------------#

#-------------------------FOR----------------------------#
    # Copy auxiliary elements on the original array.

    lw t3, 8(fp)        # t3 <-- k
    move t4, a2         # t4 <-- i = L

for:
    blt t3, t4, _return # for (i = l; i < k; i++)
    sll t5, t4, 2       # t5 <-- (i*4)
    addu t6, t5, a1     # t6 <-- &t[i] | mem_pos
    lw t6, 0(t6)        # t6 <-- t[i] | value

    addu t7, t5, a0     # t7 <-- &p[i] | mem_pos
    sw  t6, 0(t7)       # p[i] = t[i];

    addiu t4, t4, 1     # t4 <-- t4 + 1

    la t7, for          # t7 <-- address of for
    jr t7               # jump to for
#--------------------------------------------------------#

#-------------------------RETURN-------------------------#
_return:
    # retreive registers from SRA
    lw	gp, 16(sp)
    lw	fp, 20(sp)
    lw	ra, 24(sp)
    addiu sp, sp, 32    # increment stack pointer
    jr	ra              # jump to return address
#--------------------------------------------------------#

.end merge
#-----------------------------------------------------------------------#
