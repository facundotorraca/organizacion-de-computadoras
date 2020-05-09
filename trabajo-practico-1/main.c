#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define ARGS 2
#define ERROR -1
#define SUCCESS 0
#define DELIMITER " "
#define INIT_SIZE 256

/*
typedef struct vector {
    int* vector;
    size_t size;
    size_t max_size;
} vector_t
*/



//EST NO ES MI0

// Merges two subarrays of arr[].
// First subarray is arr[l..m]
// Second subarray is arr[m+1..r]
void merge(int arr[], int l, int m, int r)
{
	int i, j, k;
	int n1 = m - l + 1;
	int n2 = r - m;

	/* create temp arrays */
	int L[n1], R[n2];

	/* Copy data to temp arrays L[] and R[] */
	for (i = 0; i < n1; i++)
		L[i] = arr[l + i];
	for (j = 0; j < n2; j++)
		R[j] = arr[m + 1+ j];

	/* Merge the temp arrays back into arr[l..r]*/
	i = 0; // Initial index of first subarray
	j = 0; // Initial index of second subarray
	k = l; // Initial index of merged subarray
	while (i < n1 && j < n2) {
		if (L[i] <= R[j]) {
			arr[k] = L[i];
			i++;
		}
		else
		{
			arr[k] = R[j];
			j++;
		}
		k++;
	}

	/* Copy the remaining elements of L[], if there
	are any */
	while (i < n1)
	{
		arr[k] = L[i];
		i++;
		k++;
	}

	/* Copy the remaining elements of R[], if there
	are any */
	while (j < n2)
	{
		arr[k] = R[j];
		j++;
		k++;
	}
}

/* l is for left index and r is right index of the
sub-array of arr to be sorted */
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
/////////////////////////////////////////////////////

const char* get_filename(int argc, const char* argv[]) {
    if (argc != ARGS)
        return NULL;
    return argv[1];
}

int parse_vec_buffer(char* buffer, int* vector[],  size_t* size, size_t* max_size) {
    (*size) = 0;

    char* str_num = strtok (buffer, DELIMITER);
    while (str_num != NULL) {
        int number = strtol(str_num, NULL, 10);
        (*vector)[*size] = number;
        (*size)++;
        str_num = strtok (NULL, DELIMITER);
    }

    return SUCCESS;
}

int read_vector(FILE* input_file, int* vector[], size_t* size, size_t* max_size) {
    size_t size_buff = 0;
    char* buffer = NULL;

    ssize_t bytes_read = getline(&buffer, &size_buff, input_file);

    if (bytes_read == ERROR || bytes_read == 0)
        return ERROR;

    parse_vec_buffer(buffer, vector, size, max_size);

    free(buffer);
    return SUCCESS;
}

int main(int argc, const char* argv[]) {
    const char* filename = get_filename(argc, argv);
    if (!filename) {
        fprintf(stderr, "Filename not specified\n");
        return ERROR;
    }

    FILE* input_file = fopen(filename, "r+");
    if (!input_file) {
        fprintf(stderr, "File not found\n");
        return ERROR;
    }

    int* vector = calloc(INIT_SIZE, sizeof(int));
    size_t size = 0;
    size_t max_size = INIT_SIZE;

    if (!vector) {
        fprintf(stderr, "Allocation error\n");
        fclose(input_file);
        return ERROR;
    }

    while (read_vector(input_file, &vector, &size, &max_size) == SUCCESS) {\
        printf("NOT SORTED\n");
        for (size_t i = 0; i < size; i++)
            printf("%i",vector[i]);
        printf("\n");

        printf("SORTED\n");
        mergeSort(vector, 0, size-1);
        for (size_t i = 0; i < size; i++)
            printf("%i",vector[i]);
        printf("\n\n");

        //sort vector
        //print vector
    }

    free(vector);
    fclose(input_file);
    return SUCCESS;
}
