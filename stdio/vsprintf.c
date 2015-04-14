#include <stdio.h>
#include <limits.h>

int vsprintf(char *s, const char *fmt, va_list ap)
{
	return ets_vsprintf(s, fmt, ap);
}
