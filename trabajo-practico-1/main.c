#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "vector.h"
#include "merge_sort.h"

#define ARGS 2
#define ERROR -1
#define SUCCESS 0
#define DELIMITER " "


const char* get_filename(int argc, const char* argv[]) {
    if (argc != ARGS)
        return NULL;
    return argv[1];
}

int parse_vec_buffer(char* buffer, vector_t* vector) {
    vector_clear(vector);

    char* str_num = strtok (buffer, DELIMITER);
    while (str_num != NULL) {
        int number = strtol(str_num, NULL, 10);
        vector_push(vector, number);
        str_num = strtok (NULL, DELIMITER);
    }

    return SUCCESS;
}

int read_vector(FILE* input_file, vector_t* vector) {
    size_t size_buff = 0;
    char* buffer = NULL;

    ssize_t bytes_read = getline(&buffer, &size_buff, input_file);

    if (bytes_read == ERROR || bytes_read == 0)
        return ERROR;

    parse_vec_buffer(buffer, vector);

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

    vector_t vector;
    vector_init(&vector);

    while (read_vector(input_file, &vector) == SUCCESS) {
        printf("NOT SORTED\n");
        for (size_t i = 0; i < vector.size; i++)
            printf("%i",vector.array[i]);
        printf("\n");

        printf("SORTED\n");
        mergeSort(vector.array, 0, vector.size-1);
        for (size_t i = 0; i < vector.size; i++)
            printf("%i",vector.array[i]);
        printf("\n\n");

        //sort vector
        //print vector
    }

    vector_destroy(&vector);
    fclose(input_file);
    return SUCCESS;
}
