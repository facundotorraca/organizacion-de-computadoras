#ifndef VECTOR_H
#define VECTOR_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#define ERROR -1
#define SUCCESS 0
#define INIT_SIZE 4096

typedef struct vector {
    int* array;
    size_t size;
    size_t max_size;
} vector_t;

int vector_init(vector_t* self) {
    self->array = calloc(INIT_SIZE, sizeof(int));
    self->max_size = INIT_SIZE;
    self->size = 0;
    return SUCCESS;
}

bool vector_empty(vector_t* self) {
    return self->size == 0;
}

void vector_push(vector_t* self, int n) {
    if (self->size == self->max_size - 1) {
        self->max_size = self->max_size * 2;
        realloc(self->array, self->max_size * 2);
    }

    self->array[self->size] = n;
    self->size++;
}

void vector_clear(vector_t* self) {
    memset(self->array, 0, self->max_size);
    self->size = 0;
}

void vector_destroy(vector_t* self) {
    free(self->array);
    self->max_size = INIT_SIZE;
    self->array = NULL;
    self->size = 0;
}

#endif
