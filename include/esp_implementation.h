#ifndef _ESP_IMPL_H_
#define _ESP_IMPL_H_

extern int ets_memcmp(const void *s1, const void *s2, size_t n);
extern void *ets_memcpy(void *dest, const void *src, size_t n);
extern void *ets_memset(void *s, int c, size_t n);

int ets_vsprintf(char *str, const char *format, va_list argptr);
int ets_vsnprintf(char *buffer, size_t sizeOfBuffer, const char *format, va_list argptr);

extern int ets_strcmp(const char *s1, const char *s2);
extern char *ets_strcpy(char *dest, const char *src);
//extern int os_random();
//extern char *ets_strdup(const char *str); // :(
const char * ets_strrchr(const char *str, int character);
extern size_t ets_strlen(const char *s);
extern int ets_strncmp(const char *s1, const char *s2, int len);
extern char *ets_strncpy(char *dest, const char *src, size_t n);
extern char *ets_strstr(const char *haystack, const char *needle);

extern void *pvPortMalloc(size_t xWantedSize);
extern void *pvPortZalloc(size_t);
extern void *pvPortRealloc(void *mem, size_t newsize);
extern void vPortFree(void *ptr);
extern void *vPortMalloc(size_t xWantedSize);

extern int os_printf_plus(const char *format, ...)  __attribute__ ((format (printf, 1, 2)));

#define debugf os_printf_plus
#endif
