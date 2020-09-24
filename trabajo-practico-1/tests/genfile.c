#include <stdio.h>
#include <stdlib.h>

#define MB40 10485760

int main(void) {
    int32_t n;

    for (size_t i = 0; i < MB40/4; i++) {
        n = rand() % 100;
        printf("%i ", n);
    }

    return 0;
}
