#include <stdio.h>
#include <stdlib.h>

int main(void) {
    int n;

    for (size_t i = 0; i < 20000; i++) {
	n = rand() % 100;
        printf("%i ", n);
    }

    return 0;
}
