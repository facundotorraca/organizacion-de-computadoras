#include <stdlib.h>
#include <stdio.h>
#include "factorial.h"

int main(int argc, const char* argv[]){
	unsigned int n;
	
	if (argc == 2) {
		n = (unsigned)atoi(argv[1]);
	} else {
		n = 15;
	}
	
	unsigned int res = factorial(n);
	fprintf(stdout, "factorial %u: %u\n", n, res);
	return 0;
}


