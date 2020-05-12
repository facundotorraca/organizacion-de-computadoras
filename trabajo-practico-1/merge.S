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
