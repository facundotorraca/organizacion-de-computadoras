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

addiu fp, 4, fp
sw ra, fp

subu t0, a1, 1           # calculate right index (t0 = size - 1)
addiu fp, 4, fp          # increment frame pointer
sw t0 , fp               # push rigth index to stack

addiu fp, 4, fp          # increment frame pointer
sw zero , fp             # push 0 to stack

addiu fp, 4, fp          # increment frame pointer
sw a0, fp                # push a0 to stack

jal merge_sort_rec       # jump to merge sort recursive

#Popping return address
lw t0, fp                # pop P in t1
subu fp, fp, 4           # decrement frame pointer

jal t0




# merge sort recursive that receives by stack
# an array pointer (P), the left index (L)
# and the right index (R). Sorts the array pointed by P
merge_sort_rec:
# 1st stack element --> array pointer (P)    load in t1
# 2nd stack element --> left index    (L)    load in t2
# 3rd stack element --> right index   (R)    load in t3

li t0, 4                 # t0 <-- 4

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
srl t4, t4, 2             # t4 <-- t4 / 2
addu t4, t4, t2           # t4 <-- t4 + L
#t4 <-- L (R - L) / 2

# second call with (Middle+1 - R) range
addiu fp, 4, fp
sw ra, fp

addiu fp, 4, fp          # increment frame pointer
sw t3 , fp               # push R (tr) to stack

addiu fp, 4, fp          # increment frame pointer
addiu t4, t4, 1          # t4 <-- middle(t4) + 1
sw t4, fp                # push middle+1 (t4) to stack

addiu fp, 4, fp          # increment frame pointer
sw t1 , fp               # push P (t1) to stack

# first call with (L - Middle) range
addiu fp, 4, fp
sw ra, fp

addiu fp, 4, fp          # increment frame pointer
sw t4, fp                # push middle (t4) to stack

addiu fp, 4, fp          # increment frame pointer
sw t2 , fp               # push L (t2) to stack

addiu fp, 4, fp          # increment frame pointer
sw t1 , fp               # push P (t1) to stack

jal merge_sort_rec
jal merge_sort_rec

#aca va el merge

END:
lw t0, fp                # pop P in t1
subu fp, fp, 4           # decrement frame pointer
jal t0



#aca va algo
