#include <stdlib.h>
#include <stdio.h>
#include "factorial.h"

int main(int argc, const char* argv[]){
	unsigned int res = factorial(15);
	fprintf(stdout, "factorial 15: %u\n", res);
	return 0;
}


