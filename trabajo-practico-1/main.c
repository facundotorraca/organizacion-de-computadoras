#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#include "vector.h"
#include "merge_sort.h"

#define ARGS_MAX 5
#define ERROR -1
#define SUCCESS 0
#define DELIMITER " "


const char* get_flag(int argc, const char* argv[]) {
    if (argc > ARGS_MAX)
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

//TODO: Manejar archivos de entrada y salida y considerar el caso de guion
//TODO: Funcion de print help y print version

int main(int argc, const char* argv[]) {
    const char* flag = get_flag(argc, argv);
    if (!flag) {
        fprintf(stderr, "Error: Too many args\n");
        return ERROR;
    }

    const char* input = NULL;
    const char* output = NULL;

    FILE* input_file = NULL;
    FILE* output_file = NULL;
    if (argc == 2){
        if (strcmp(argv[1], "-h") == 0 || strcmp(argv[1], "--help") == 0){
            print_help();
            return SUCCESS;
        } else if(strcmp(argv[1], "-V") == 0 || strcmp(argv[1], "--version") == 0){
            print_version();
            return SUCCESS;
        }
    } else if (argc == 3) {
        if (strcmp(argv[1], "-i") != 0 && strcmp(argv[1], "-o") != 0){
            fprintf(stderr, "Error: Unknown flag, use -i or -o\n");
            return ERROR;
        }
        if (strcmp(argv[1], "-i") != 0) {
            input =argv[2];

        } else if (strcmp(argv[1], "-o") != 0) {
            output = argv[2];

        }

    } else if (argc == 5) {
        bool mask_1 = (strcmp(argv[1], "-i") == 0 && strcmp(argv[3], "-o") == 0);
        bool mask_2 = (strcmp(argv[1], "-o") == 0 && strcmp(argv[3], "-i") == 0);
        if (!mask_1 && !mask_2) {
            fprintf(stderr, "Error: Wrong use of flags, use -h to get ayuda\n");
            return ERROR;
        }
        if (mask_1) {
            input = argv[2];
            output = argv[4];
        } else if (mask_2) {
            input = argv[4];
            output = argv[2];
        }

    }

    if (input) {
        input_file = fopen(input, "r+");
        if (!input_file) {
            fprintf(stderr, "File not found\n");
            return ERROR;
        }
    }
    if (output) {
        output_file = fopen(output, "w+");
        if (!output_file) {
            if(input_file) {
                fclose(input_file);
            }
            fprintf(stderr, "File not found\n");
            return ERROR;
        }
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
    if (input_file) {
        fclose(input_file);
    }
    if (output_file) {
        fclose(output_file);
    }

    return SUCCESS;
}
