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
#define ENDLINE '\n'
#define NULLTER '\0'

/*-----------------------exec-modes----------------------*/
#define H_MODE 1
#define V_MODE 2
#define I_MODE 3
#define O_MODE 4
#define IO_MODE 5
#define OI_MODE 6
#define STD_MODE 7
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


/*----------------------get-flags------------------------*/
bool is_help_flag(const char* flag) {
    return (strcmp(flag, HELP_FLAG) == 0 ||
            strcmp(flag, HELP_FLAG_EXT) == 0);
}

bool is_version_flag(const char* flag) {
    return (strcmp(flag, VERSION_FLAG) == 0 ||
            strcmp(flag, VERSION_FLAG_EXT) == 0);
}

bool is_input_flag(const char* flag) {
    return (strcmp(flag, INPUT_FLAG) == 0 ||
            strcmp(flag, INPUT_FLAG_EXT) == 0);
}

bool is_output_flag(const char* flag) {
    return (strcmp(flag, OUTPUT_FLAG) == 0 ||
            strcmp(flag, OUTPUT_FLAG_EXT) == 0);
}
/*-------------------------------------------------------*/


/*-----------------get-exectuion-modes-------------------*/
int get_2args_mode(char* const argv[]) {
    const char* flag = argv[1];

    if (is_help_flag(flag))
        return H_MODE;

    if (is_version_flag(flag))
        return V_MODE;

    return ERROR;
}

int get_3args_mode(char* const argv[]) {
    const char* flag = argv[1];

    if (is_input_flag(flag))
        return I_MODE;

    if (is_output_flag(flag))
        return O_MODE;

    return ERROR;
}

int get_5args_mode(char* const argv[]) {
    const char* flag_1 = argv[1];
    const char* flag_2 = argv[3];

    bool input_flag_frt = is_input_flag(flag_1);
    bool input_flag_scd = is_input_flag(flag_2);

    bool output_flag_frt = is_output_flag(flag_1);
    bool output_flag_scd = is_output_flag(flag_2);

    if (input_flag_frt && output_flag_scd)
        return IO_MODE;

    if (output_flag_frt && input_flag_scd)
        return OI_MODE;

    return ERROR;
}

int get_exec_mode(int argc, char* const argv[]) {
    switch (argc) {
        case 1:
            return STD_MODE;
        case 2:
            return get_2args_mode(argv);
        case 3:
            return get_3args_mode(argv);
        case 5:
            return get_5args_mode(argv);
        default:
            return ERROR;
    }
}
/*-------------------------------------------------------*/


/*-----------------auxiliary-functions-------------------*/
void remove_endline(char* s) {
    size_t len = strlen(s);
    if (s[len - 1] == ENDLINE)
        s[len - 1] = NULLTER;
}

int parse_vec_buffer(char* buffer, vector_t* vector) {
    vector_clear(vector);

    remove_endline(buffer);

    char* str_num = strtok(buffer, DELIMITER);
    while (str_num != NULL) {
        int number = strtol(str_num, NULL, 10);
        vector_push(vector, number);
        str_num = strtok(NULL, DELIMITER);
    }

    return SUCCESS;
}

int read_vector(FILE* i_file, vector_t* vector) {
    char* buffer = NULL;
    size_t size_buff = 0;

    ssize_t bytes_read = getline(&buffer, &size_buff, i_file);

    if (bytes_read == ERROR || bytes_read == 0) {
        if (bytes_read == ERROR) perror(NULL);
        free(buffer);
        return ERROR;
    }

    parse_vec_buffer(buffer, vector);

    free(buffer);
    return SUCCESS;
}

void print_sorted_vec(FILE* o_file, vector_t* vector) {
    if (vector) {
        for (size_t i = 0; i < vector->size; i++)
            fprintf(o_file, "%i ", vector->array[i]);
    }

    fprintf(o_file,"\n");
}
/*-------------------------------------------------------*/


/*--------------------exectuion-modes--------------------*/
int help() {
    printf("Usage:\n");
    printf("\ttp1 -h\n");
    printf("\ttp1 -V\n");
    printf("\ttp1 -i in_file -o out_file\n");
    printf("Options:\n");
    printf("\t-V, --version Print version and quit.\n");
    printf("\t-h, --help Print this information and quit.\n");
    printf("\t-i, --input Specify input stream/file, '-' for stdin\n");
    printf("\t-o, --output Specify output stream/file, '-' for stdout.\n");
    printf("Examples:\n");
    printf("\ttp1 < in.txt > out.txt\n");
    printf("\tcat in.txt | tp1 -i - > out.txt\n");
    return SUCCESS;
}

int version() {
    printf("vsorter version: 1.0.0\n");
    return SUCCESS;
}

void sort(FILE* i_file, FILE* o_file) {
    vector_t vector;
    vector_init(&vector);

    while (read_vector(i_file, &vector) == SUCCESS) {
        if (!vector_empty(&vector)) {
            merge_sort(vector.array, vector.size);
            print_sorted_vec(o_file, &vector);
        } else
            print_sorted_vec(o_file,  NULL);
    }

    vector_destroy(&vector);
}
/*-------------------------------------------------------*/

int main(int argc, char* const argv[]) {
    char* i_filename = STD_FILE; FILE* i_file = stdin;
    char* o_filename = STD_FILE; FILE* o_file = stdout;

    int mode = get_exec_mode(argc, argv);


    switch (mode) {
        case V_MODE:
            return version();
        case H_MODE:
            return help();
<<<<<<< HEAD
        case STD_MODE:
            break;
=======
	case STD_MODE:
	    break;
>>>>>>> a788b753a31c2bb08ad0e80115423706c477ef97
        case I_MODE: {
            i_filename = argv[2];
            break;
        }
        case O_MODE: {
            o_filename = argv[2];
            break;
        }
        case IO_MODE: {
            i_filename = argv[2];
            o_filename = argv[4];
            break;
        }
        case OI_MODE: {
            i_filename = argv[4];
            o_filename = argv[2];
            break;
        }
        default: {
            fprintf(stderr,"unrecognized command line option");
            return ERROR;
        }
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
