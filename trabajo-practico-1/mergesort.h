#ifndef MERGE_SORT_H
#define MERGE_SORT_H

#include <stdlib.h>
#include <math.h>

// Merges two subarrays of arr[]. The subarray is arr[l..m]
// with the subarray is arr[m+1..r]. Receives an auxiliary
// array to do the merge (t). It is guaranteed that (t)
// has enougth size to store the entire array.

/*
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
*/

void _merge_sort_rec(int p[], int t[], int l, int r) {
	if (l < r) {
		//middle of the vector (p)
		int m = l+(r-l)/2;

		_merge_sort_rec(p, t, l, m);
		_merge_sort_rec(p, t, m+1, r);

		_merge(p, t, l, r);
	}
}

extern void merge(int p[], int t[], int l, int r);

// Receives a pointer to the array to be sorted (p)
// and an integer with the size of the array (size).
// Sorts the array modifing the original one.
void merge_sort(int p[], int size) {
    // auxiliary array used for merge
    int* t = calloc(size, sizeof(int));

    _merge_sort_rec(p, t, 0, size - 1);

    // free auxiliary array
    free(t);
}

#endif
