#include <stdlib.h>
#include <signal.h>
#include <esp_implementation.h>
#include "syscall.h"

_Noreturn void abort(void)
{
	debugf("***ABORT***");
	//raise(SIGABRT);
	//raise(SIGKILL);
	for (;;);
}
