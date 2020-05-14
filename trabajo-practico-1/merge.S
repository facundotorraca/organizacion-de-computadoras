#include <sys/regdef.h>
#include "mymalloc.S"

.text
.align 2
.globl merge
.ent merge

merge:
    # a0 -> array pointer (P)
    # a1 -> merge aux array pointer (T)
    # a2 -> left index (L)
    # a3 -> right index (R)

    # fp -> stack begin
    # 24 -> stack size
    # ra -> retunr addr
    .frame fp, 24, ra  # 16 -> SRA | 8 -> LTA
    # leaf-function -> ABA is not created

    # stack frame creation
    subu sp, sp, 24  # callee stack -> [sp, sp + 40]

    # fill ABA caller
    sw a3, 52(sp)       # save a3 in (52 + sp) | caller stack
    sw a2, 48(sp)       # save a2 in (48 + sp) | caller stack
    sw a1, 44(sp)       # save a1 in (44 + sp) | caller stack
    sw a0, 40(sp)       # save a0 in (40 + sp) | caller stack

    # saved register area (SRA)
                        # padding in (36 + sp) | callee stack
    sw ra, 32(sp)       # save ra in (32 + sp) | callee stack
    sw fp, 28(sp)       # save fp in (28 + sp) | callee stack
    .cprestore 24       # save gp in (24 + sp) | callee stack














void _merge(int p[], int t[], int l, int r) {
    int m = l + (r - l) / 2;   // middle of the subarray
	int l_size = m - l + 1;    // left subarray size
	int r_size = r - m;        // right subarray size

    int i = 0; // Index left subarray
    int j = 0; // Index right subarray
    int k = l; // Index merge subarray

	while (i < l_size && j < r_size) {
		if (p[l + i] <= p[m + 1 + j]) {
			t[k] = p[l + i];
			i++;
		} else {
			t[k] = p[m + 1 + j];
			j++;
		}
		k++;
	}

	// Copy the remaining elements of left side, if there are any
	while (i < l_size) {
		t[k] = p[l + i];
		i++;
		k++;
	}

	// Copy the remaining elements of right side, if there are any
	while (j < r_size) {
	    t[k] = p[m + 1 + j];
		j++;
		k++;
	}

    // Copy auxiliary elements on the original array
    for (i = l; i < k; i++)
        p[i] = t[i];
}
