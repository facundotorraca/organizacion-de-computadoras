#ifndef MERGE_SORT_H
#define MERGE_SORT_H

#include <math.h>

/*--------------------ESTO VA EN MIPS-------------------*/
// Shift left one position starting from pos
// The (p) array is modified in place
void _shift_left(int p[], int pos, int start) {
    while (pos != start) {
        p[pos] = p[pos - 1];
        pos--;
    }
}

// Merges two subarrays of P[] in place.
// The subarray is P[l..m] with the
// subarray p[m+1..r].
void _merge(int p[], int l, int m, int r) {

    // if the direct merge is already sorted
    if (p[m] <= p[m + 1])
        return;

    // Two pointers to maintain start
    // of both arrays to merge
    int i = l;
    int j = m + 1;

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

// Sort a subarray of p array recursively.
// The subarray is p[l..r]. The array is
// modified in place. (l) is the left index,
// (r) is the right index.
void _merge_sort_rec(int p[], int l, int r) {
	if (l < r) {
		//middle of the vector (p)
		int m = l+(r-l)/2;

		_merge_sort_rec(p, l, m);
		_merge_sort_rec(p, m+1, r);

		_merge(p, l, m, r);
	}
}
/*------------------------------------------------------*/

// Receives a pointer to the array to be sorted (p)
// and an integer with the size of the array (size).
// Sorts the array modifing the original one.
void merge_sort(int p[], int size) {
    // a0 a1 a2 a3
    // Replace by Assembler Function merge_sort_MIPS(p, size);
    _merge_sort_rec(p, 0, size - 1);
}

#endif
