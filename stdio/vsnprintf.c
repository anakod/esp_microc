#include "stdio_impl.h"
#include <limits.h>
#include <string.h>
#include <errno.h>
#include <stdint.h>
#include <esp_implementation.h>

int vsnprintf(char *s, size_t n, const char *fmt, va_list ap)
{
	return ets_vsnprintf(s, n, fmt, ap);
}
