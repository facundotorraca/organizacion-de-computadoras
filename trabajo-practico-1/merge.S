#include <sys/regdef.h>

.text
.align 2
.globl merge_sort
.ent merge_sort

# Merges two subarrays of arr[].
# First subarray is arr[l..m]
# Second subarray is arr[m+1..r]
merge:
# 1st arg s0 --> array pointer (P)
# 2nd arg s1 --> left index    (L)
# 3rd arg s2 --> middle index  (M)
# 4th arg s3 --> rigth index   (R)

#Push return address to stack
addiu fp, 4, fp             # increment frame pointer
sw ra, fp                   # push ra (return address) to stack


sll t0, s2, 2               #t0 = m*4 bytes (m es una cantidad (indice))
addiu t0, s0, t0            #t0 = p + m*4 (direccion de p[m])
lw t1, t0                   #t1 = p[m]

lw t2, 4(t0)                #t2 = p[m+1]

ble t1,t2, end              #if (p[m] <= p[m + 1]) jump to end (return)
nop

addiu t2, s1, zero          #t2 = l
addiu t3, s2, 1             #t3 = m+1


while_merge:
#p[i]=t0
#p[j]=t1
#i=t2
#j=t3

ble t2, s2, end             #t2 <= m
nop
ble t3, s3, end             #t3 <= r
nop


sll t3, t1, 2               #t3 = i*4 bytes (m es una cantidad (indice))
addiu t3, s0, t3            #t3 = p + i*4 (direccion de p[m])
lw t3, t3                   #t3 = p[i]


sll t4, t2, 2               #t4 = j*4 bytes (m es una cantidad (indice))
addiu t4, s0, t4            #t4 = p + j*4 (direccion de p[m])
lw t4, t4                   #t4 = p[j]


ble t4, t3, inc             #if p[j] >= p[i] jump to inc
nop
jr add_val                   #else p[i] > p[j] jump to add_val


inc:
addiu t2, t2, 1             #t2++
jr while_merge               #jump to while

add_val:

#Saving temp variables

addiu fp, 4, fp          # increment frame pointer
sw t3, fp                # push j to stack

addiu fp, 4, fp          # increment frame pointer
sw t2, fp                # push i to stack

addiu fp, 4, fp          # increment frame pointer
sw t1, fp                # push p[j] to stack


#Push variables for shift function
addiu fp, 4, fp          # increment frame pointer
sw t2, fp                # push i to stack

addiu fp, 4, fp          # increment frame pointer
sw t3, fp                # push j to stack

jal shift_left           #popea t2 y t3

#Pop return address to t0

lw t1, fp                # pop p[j] in t1 (el de antes, shift lo cambio al p[j])
subu fp, fp, 4           # decrement frame pointer

lw t2, fp                # pop i in t2
subu fp, fp, 4           # decrement frame pointer

lw t3, fp                # pop j in t3
subu fp, fp, 4           # decrement frame pointer

#continue with while

sll t3, t1, 2               #t3 = i*4 bytes (m es una cantidad (indice))
addiu t3, s0, t3            #t3 = p + i*4 (direccion de p[m])
sw t1, t3                   #p[i] = p[j] (el de antes)

addiu t2, t2, 1
addiu s2, s2, 1
addiu t3, t3, 1

jr while_merge


shift_left:
lw t0, fp                # pop pos in t0
subu fp, fp, 4           # decrement frame pointer

lw t1, fp                # pop start in t1
subu fp, fp, 4           # decrement frame pointer

addiu fp, 4, fp          # increment frame pointer
sw ra, fp                # push ra (return address) to stack

#push in case branch

addiu fp, 4, fp          # increment frame pointer
sw t1, fp                # push start to stack

addiu fp, 4, fp          # increment frame pointer
sw t0, fp                # push pos to stack

bne t0, t1, while_shift

#popeo
lw t0, fp                # pop pos in t0
subu fp, fp, 4           # decrement frame pointer

lw t0, fp                # pop start in t0
subu fp, fp, 4           # decrement frame pointer

lw t0, fp                # pop ra in t0
subu fp, fp, 4           # decrement frame pointer

jr t0


while_shift:
#popeo
lw t0, fp                # pop pos in t0
subu fp, fp, 4           # decrement frame pointer

lw t1, fp                # pop start in t1
subu fp, fp, 4           # decrement frame pointer

addiu fp, 4, fp          # increment frame pointer
sw ra, fp                # push return address to stack

### next lines:
#p[pos] = p[pos - 1];
#pos--;

subu t2, t0, 1              #t2 = pos - 1
sll t2, t2, 2               #t2 = (pos-1)*4 bytes (pos es una cantidad (indice))
addiu t2, s0, t2            #t2 = p + (pos-1)*4 (direccion de p[(pos-1)])
lw t3, t2                   #t3 = p[pos-1]
sw t3, 4(t2)                #p[pos] = p[pos-1]

subu t0, t0, 1
###

lw t2, fp                # pop return address in t2
subu fp, fp, 4           # decrement frame pointer

addiu fp, 4, fp          # increment frame pointer
sw t1, fp                # push start to stack

addiu fp, 4, fp          # increment frame pointer
sw t0, fp                # push pos to stack

bne t0, t1, while_shift
nop
jre t2


end:
#Pop return address to t0
lw t0, fp                # pop ra in t0
subu fp, fp, 4           # decrement frame pointer
jr t0





/*
// Merges two subarrays of P[] in place.
// The subarray is P[l..m] with the
// subarray p[m+1..r].
void _merge(int p[], int l, int m, int r) {


    while (i <= m && j <= r) {

        if (p[i] > p[j]) {
            // Save value before shifting
            int value = p[j];

            // shift all the elements between element
            // p[i] and element p[i], right by 1.
            _shift_left(p, j, i);
            p[i] = value;

            // update all the pointers
            i++; m++; j++;
        } else {
            i++;
        }
    }
}

*/
