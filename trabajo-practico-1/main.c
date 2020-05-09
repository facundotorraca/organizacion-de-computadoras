#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include "vector.h"
#include "merge_sort.h"

#define ERROR -1
#define SUCCESS 0
#define DELIMITER " "

#define H_MODE 1
#define V_MODE 2
#define I_MODE 3
#define O_MODE 4
#define IO_MODE 5
#define OI_MODE 6
#define STD_MODE 7

#define HELP_FLAG "-h"
#define HELP_FLAG_EXT "--help"

#define VERSION_FLAG "-V"
#define VERSION_FLAG_EXT "--version"

#define INPUT_FLAG "-i"
#define OUTPUT_FLAG "-o"

/*-----------------get-exectuion-modes-------------------*/
int get_2args_mode(char* const argv[]) {
    const char* flag = argv[1];

    if (strcmp(flag, HELP_FLAG) == 0 || strcmp(flag, HELP_FLAG_EXT) == 0)
        return H_MODE;
    if (strcmp(flag, VERSION_FLAG) == 0 || strcmp(flag, VERSION_FLAG_EXT) == 0)
        return V_MODE;
    return ERROR;
}

int get_3args_mode(char* const argv[]) {
    const char* flag = argv[1];

    if (strcmp(flag, INPUT_FLAG) == 0)
        return I_MODE;
    if (strcmp(flag, OUTPUT_FLAG) == 0)
        return O_MODE;
    return ERROR;
}

int get_5args_mode(char* const argv[]) {
    const char* flag_1 = argv[1];
    const char* flag_2 = argv[3];

    if (strcmp(flag_1, INPUT_FLAG) == 0 && strcmp(flag_2, OUTPUT_FLAG) == 0)
        return IO_MODE;
    if (strcmp(flag_1, OUTPUT_FLAG) == 0 && strcmp(flag_2, INPUT_FLAG) == 0)
        return OI_MODE;
    return ERROR;
}

int get_exec_mode(int argc, char* const argv[]) {
    if (argc == 1)
        return STD_MODE;
    if (argc == 2)
        return get_2args_mode(argv);
    if (argc == 3)
        return get_3args_mode(argv);
    if (argc == 5)
        return get_5args_mode(argv);
    return ERROR;
}
/*-------------------------------------------------------*/

/*-----------------auxiliary-functions-------------------*/
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

void print_sorted_vec(FILE* o_file, vector_t* vector) {
    for (size_t i = 0; i < vector->size; i++)
        fprintf(o_file, "%i ", vector->array[i]);
    fprintf(o_file,"\n");
}
/*-------------------------------------------------------*/

/*--------------------exectuion-modes--------------------*/
int version() {
    printf("ACA VA LA VERSION\n");
    return SUCCESS;
}

int help() {
    printf("ACA VA LA AYUDA\n");
    return SUCCESS;
}

int sort(FILE* i_file, FILE* o_file) {
    vector_t vector;
    vector_init(&vector);

    while (read_vector(i_file, &vector) == SUCCESS) {
        mergeSort(vector.array, 0, vector.size-1);
        print_sorted_vec(o_file, &vector);
    }

    vector_destroy(&vector);
}
/*-------------------------------------------------------*/

int main(int argc, char* const argv[]) {
    char* i_filename = NULL; FILE* i_file = stdin;
    char* o_filename = NULL; FILE* o_file = stdout;

    int mode = get_exec_mode(argc, argv);
    if (mode == ERROR) {
        fprintf(stderr,"unrecognized command line option");
        return ERROR;
    }

    if (mode == V_MODE) {
        return version();
    }
    if (mode == H_MODE) {
        return help();
    }
    if (mode == I_MODE) {
        i_filename = argv[2];
    }
    if (mode == O_MODE) {
        o_filename = argv[2];
    }
    if (mode == IO_MODE) {
        i_filename = argv[2];
        o_filename = argv[4];
    }
    if (mode == OI_MODE) {
        o_filename = argv[2];
        i_filename = argv[4];
    }

    if (i_filename) {
        i_file = fopen(i_filename, "r+");
        if (!i_file) {
            fprintf(stderr, "could not open input file\n");
            return ERROR;
        }
    }
    if (o_filename) {
        o_file = fopen(o_filename, "w+");
        if (!o_file) {
            fprintf(stderr, "could not open input file\n");
            if (i_filename) fclose(i_file);
            return ERROR;
        }
    }

    sort(i_file, o_file);

    if (i_filename) fclose(i_file);
    if (o_filename) fclose(o_file);
    return SUCCESS;
}
