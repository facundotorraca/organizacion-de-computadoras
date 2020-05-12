#include <sys/regdef.h>

.text
.align 2
.globl merge_sort
.ent merge_sort

# wrapper to merge sort that receives array pointer
# and array size by args registers and push to stack
# array pointer, left index (0), and right index (size-1)
# and then call the recursive function of merge sort
merge_sort:
# a0 --> array ptr
# a1 --> array size

# wrapper that push
# register into the stack

# save s0 ... s3 in stack

addiu fp, 4, fp          # increment frame pointer
sw s3, fp                # push s3 to stack

addiu fp, 4, fp          # increment frame pointer
sw s2, fp                # push s2 to stack

addiu fp, 4, fp          # increment frame pointer
sw s1, fp                # push s1 to stack

addiu fp, 4, fp          # increment frame pointer
sw s0, fp                # push s0 to stack


#save return address
addiu fp, 4, fp          # increment frame pointer
sw ra, fp                # push ra (return address) to stack

subu t0, a1, 1           # calculate right index (t0 = size - 1)
addiu fp, 4, fp          # increment frame pointer
sw t0 , fp               # push rigth index to stack (R, right index)

addiu fp, 4, fp          # increment frame pointer
sw zero , fp             # push 0 to stack (L, left index)

addiu fp, 4, fp          # increment frame pointer
sw a0, fp                # push a0 to stack (P, ptr)

jal merge_sort_rec       # jump to merge sort recursive

#Popping return address
lw t0, fp                # pop ra (return address) in t0
subu fp, fp, 4           # decrement frame pointer

#Popping saved registers
lw s0, fp                # pop s0 from stack
subu fp, fp, 4           # decrement frame pointer

lw s1, fp                # pop s1 from stack
subu fp, fp, 4           # decrement frame pointer

lw s2, fp                # pop s2 from stack
subu fp, fp, 4           # decrement frame pointer

lw s3, fp                # pop s3 from stack
subu fp, fp, 4           # decrement frame pointer

jal t0                   #Jump to caller function



# merge sort recursive that receives by stack
# an array pointer (P), the left index (L)
# and the right index (R). Sorts the array pointed by P
merge_sort_rec:
# 1st stack element --> array pointer (P)    load in t1
# 2nd stack element --> left index    (L)    load in t2
# 3rd stack element --> right index   (R)    load in t3

lw t1, fp                # pop P in t1
subu fp, fp, 4           # decrement frame pointer

lw t2, fp                # pop L in t2
subu fp, fp, 4           # decrement frame pointer

lw t3, fp                # pop R in t3
subu fp, fp, 4           # decrement frame pointer


ble t3, t2, END          # if (R <= L) go to END

#la siguiente linea se ejecuta siempre dijo, hay que ver como evitar

#calculates the middle of the array
subu t4, t3, t2           # t4 <-- R - L
srl t4, t4, 1             # t4 <-- t4 / 2
addu t4, t4, t2           # t4 <-- t4 + L
#t4 <-- L (R - L) / 2 = M

# call to merge
addiu fp, 4, fp          # increment frame pointer
sw ra, fp                # push ra (return address) to stack

addiu fp, 4, fp
sw t3, fp                # push R (t3) to stack

addiu fp, 4, fp
sw t4, fp                # push M (t4) to stack

addiu fp, 4, fp
sw t2, fp                # push L (t2) to stack

addiu fp, 4, fp
sw t1, fp                # push P (t1) to stack


# P -> ptr    ---> s0
# L -> left   ---> s1
# M ->medio   ---> s2
# R -> right  ---> s3

# second call with (Middle+1 - R) range
addiu fp, 4, fp          # increment frame pointer
sw ra, fp                # push ra (return address) to stack

addiu fp, 4, fp          # increment frame pointer
sw t3 , fp               # push R (tr) to stack

addiu fp, 4, fp          # increment frame pointer
addiu t5, t4, 1          # t5 <-- middle(t4) + 1
sw t5, fp                # push middle+1 (t5) to stack

addiu fp, 4, fp          # increment frame pointer
sw t1 , fp               # push P (t1) to stack

# first call with (L - Middle) range
addiu fp, 4, fp          # increment frame pointer
sw ra, fp                # push ra (return address) to stack

addiu fp, 4, fp          # increment frame pointer
sw t4, fp                # push middle (t4) to stack

addiu fp, 4, fp          # increment frame pointer
sw t2 , fp               # push L (t2) to stack

addiu fp, 4, fp          # increment frame pointer
sw t1 , fp               # push P (t1) to stack

jal merge_sort_rec
jal merge_sort_rec

lw s0, fp                # pop P in s0
subu fp, fp, 4           # decrement frame pointer

lw s1, fp                # pop L in s1
subu fp, fp, 4           # decrement frame pointer

lw s2, fp                # pop M in s2
subu fp, fp, 4           # decrement frame pointer

lw s3, fp                # pop R in s3
subu fp, fp, 4           # decrement frame pointer

# P -> ptr     ---> s0
# L -> left    ---> s1
# M -> medio   ---> s2
# R -> right   ---> s3

#merge debe llamar a end para popear la direccion de retorno
jal merge #MIRAR EL RA

end:
lw t0, fp                # pop ra in t0
subu fp, fp, 4           # decrement frame pointer
jr t0                     # exit merge_sort

.end