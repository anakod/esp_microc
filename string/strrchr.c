#include <string.h>

inline char *strrchr(const char *s, int c)
{
	return (char *)ets_strrchr(s, c);
}
