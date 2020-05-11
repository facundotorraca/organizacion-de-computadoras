#include <sys/regdef.h>
.text
.align 2
.globl merge_sort
.ent merge_sort

merge_sort:
.frame fp, 16, ra
.set noreorder
.cpload t9
.set reorder
subu sp, sp, 16

#A0 ARRAY POINTER
#A1 SIZE

addiu fp, 4, fp          # muevo el stack pointer
sw a0, fp                # guardo lo que hay en A0 en el stack

addiu fp, 4, fp          # muevo el stack pointer
sw zero , fp               # guardo 0 en el stack
#--- verificar zero ----

subu t0, a1, 1

addiu fp, 4, fp          # muevo el stack pointer
sw t0 , fp               # guardo lo que hay en t0 en el stack

b merge_sort_rec








merge_sort_rec:

#A0 ARRAY POINTER
#A1 LEFT INDEX
#A2 RIGHT INDEX

.frame fp, 16, ra
.set noreorder
.cpload t9
.set reorder
subu sp, sp, 16

ble a2, a1, END         # branch en menor o igual

addiu fp, 4, fp          # muevo el stack pointer
sw a1, fp                # guardo lo que hay en A1 en el stack

addiu fp, 4, fp          # muevo el stack pointer
sw a2, fp                # guardo lo que hay en A2 en el stock

sub t0, a2, a1           # r - l
srl t2, t0, 2            # (r - l ) / 2
addu t1, a1, t2          # l + (r - l) / 2

call

END:
lw fp, 4(sp)
addu sp, sp, 16
j ra
.end merge_sort


void mergeSort(int arr[], int l, int r)
{
	if (l < r)
	{
		// Same as (l+r)/2, but avoids overflow for
		// large l and h
		int m = l+(r-l)/2;

		// Sort first and second halves
		mergeSort(arr, l, m);
		mergeSort(arr, m+1, r);

		merge(arr, l, m, r);
	}
}
