#ifndef _MYMALLOC_H_INCLUDED_
#define _MYMALLOC_H_INCLUDED_
#include <stdlib.h>

extern void *mymalloc(size_t size);
extern void myfree(void * ptr);

#endif
