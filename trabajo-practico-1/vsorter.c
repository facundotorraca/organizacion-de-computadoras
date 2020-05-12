#define _GNU_SOURCE

#include <stdio.h>
#include "vector.h"
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include "mergesort.h"

#define ERROR -1
#define SUCCESS 0
#define STD_FILE "-"
#define DELIMITER " "

/*-----------------------exec-modes----------------------*/
#define H_MODE 1
#define V_MODE 2
#define IO_MODE 3
#define OI_MODE 4
/*-------------------------------------------------------*/

/*------------------------flags--------------------------*/
#define HELP_FLAG "-h"
#define HELP_FLAG_EXT "--help"

#define VERSION_FLAG "-V"
#define VERSION_FLAG_EXT "--version"

#define INPUT_FLAG "-i"
#define INPUT_FLAG_EXT "--input"

#define OUTPUT_FLAG "-o"
#define OUTPUT_FLAG_EXT "--output"
/*-------------------------------------------------------*/

/*-----------------get-exectuion-modes-------------------*/
int get_2args_mode(char* const argv[]) {
    const char* flag = argv[1];

    bool help_flag = (strcmp(flag, HELP_FLAG) == 0 ||
                      strcmp(flag, HELP_FLAG_EXT) == 0);

    if (help_flag)
        return H_MODE;

    bool version_flag = (strcmp(flag, VERSION_FLAG) == 0 ||
                         strcmp(flag, VERSION_FLAG_EXT) == 0);

    if (version_flag)
        return V_MODE;

    return ERROR;
}

int get_5args_mode(char* const argv[]) {
    const char* flag_1 = argv[1];
    const char* flag_2 = argv[3];

    bool input_flag_frt = (strcmp(flag_1, INPUT_FLAG) == 0 ||
                           strcmp(flag_1, INPUT_FLAG_EXT) == 0);

    bool input_flag_scd = (strcmp(flag_2, INPUT_FLAG) == 0 ||
                           strcmp(flag_2, INPUT_FLAG_EXT) == 0);

    bool output_flag_frt = (strcmp(flag_1, OUTPUT_FLAG) == 0 ||
                            strcmp(flag_1, OUTPUT_FLAG_EXT) == 0);

    bool output_flag_scd = (strcmp(flag_2, OUTPUT_FLAG) == 0 ||
                            strcmp(flag_2, OUTPUT_FLAG_EXT) == 0);

    if (input_flag_frt && output_flag_scd)
        return IO_MODE;
    if (output_flag_frt && input_flag_scd)
        return OI_MODE;
    return ERROR;
}

int get_exec_mode(int argc, char* const argv[]) {
    if (argc == 2)
        return get_2args_mode(argv);
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

int read_vector(FILE* i_file, vector_t* vector) {
    char* buffer = NULL;
    size_t size_buff = 0;

    ssize_t bytes_read = getline(&buffer, &size_buff, i_file);

    if (bytes_read == ERROR || bytes_read == 0) {
        perror(NULL); //print errno is stderr
        free(buffer);
        return ERROR;
    }

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
int help() {
    printf("ACA VA LA AYUDA\n");
    return SUCCESS;
}

int version() {
    printf("ACA VA LA VERSION\n");
    return SUCCESS;
}

void sort(FILE* i_file, FILE* o_file) {
    vector_t vector;
    vector_init(&vector);

    while (read_vector(i_file, &vector) == SUCCESS) {
        merge_sort(vector.array, vector.size);
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

    if (mode == V_MODE)
        return version();
    if (mode == H_MODE)
        return help();

    if (mode == IO_MODE) {
        i_filename = argv[2];
        o_filename = argv[4];
    } else /*mode == OI_MODE*/ {
        i_filename = argv[4];
        o_filename = argv[2];
    }

    bool input_is_std = (strcmp(i_filename, STD_FILE) == 0);
    bool output_is_std = (strcmp(o_filename, STD_FILE) == 0);

    if (!input_is_std) {
        i_file = fopen(i_filename, "r+");
        if (!i_file) {
            fprintf(stderr, "could not open input file\n");
            return ERROR;
        }
    }
    if (!output_is_std) {
        o_file = fopen(o_filename, "w+");
        if (!o_file) {
            fprintf(stderr, "could not open output file\n");
            if (!input_is_std) fclose(i_file);
            return ERROR;
        }
    }

    sort(i_file, o_file);

    if (!input_is_std) fclose(i_file);
    if (!output_is_std) fclose(o_file);
    return SUCCESS;
}




//PUTO EL QUE LLEGO HASTA ACA
