#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include <stdint.h>
#include <esp_implementation.h>

void *malloc(size_t n)
{
	return pvPortMalloc(n);
}

void free(void *p)
{
	vPortFree(p);
}

void* realloc(void* ptr, size_t size)
{
	pvPortRealloc(ptr, size);
}

void *zalloc(size_t n)
{
	return pvPortZalloc(n);
}

void* calloc (size_t num, size_t size)
{
	return zalloc(num * size);
}
