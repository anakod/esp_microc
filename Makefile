# Base directory for the compiler
XTENSA_TOOLS_ROOT ?= c:/Espressif/xtensa-lx106-elf/bin

# base directory of the ESP8266 SDK package, absolute
SDK_BASE	?= c:/Espressif/ESP8266_SDK

BUILD_DIR	?= build

EXTRA_INCDIR    =  include $(SDK_BASE)/include

EXTRA_INCDIR	:= $(addprefix -I,$(EXTRA_INCDIR))
CC = $(XTENSA_TOOLS_ROOT)/xtensa-lx106-elf-gcc
AR = $(XTENSA_TOOLS_ROOT)/xtensa-lx106-elf-ar
OBJCOPY = $(XTENSA_TOOLS_ROOT)/xtensa-lx106-elf-objcopy

CFLAGS += -Os -g -mlongcalls -nostdlib -D__ets__ -Iinternal/ $(EXTRA_INCDIR)
CFLAGS += -D__ets__

##########################

SRC_CTYPE = isalpha.c isascii.c isblank.c iscntrl.c isdigit.c isgraph.c islower.c isprint.c ispunct.c isspace.c isupper.c toascii.c tolower.c toupper.c isxdigit.c
SRC_STD = abs.c atof.c atoi.c atol.c atoll.c labs.c llabs.c strtod.c strtol.c
SRC_MATH = __cos.c __cosdf.c __cosl.c __expo2.c __expo2f.c __fpclassify.c __fpclassifyf.c __fpclassifyl.c __invtrigl.c __polevll.c __rem_pio2.c __rem_pio2_large.c __rem_pio2f.c __rem_pio2l.c __signbit.c __signbitf.c __signbitl.c __sin.c __sindf.c __sinl.c __tan.c __tandf.c __tanl.c acos.c acosf.c acosh.c acoshf.c acoshl.c acosl.c asin.c asinf.c asinh.c asinhf.c asinhl.c asinl.c atan.c atan2.c atan2f.c atan2l.c atanf.c atanh.c atanhf.c atanhl.c atanl.c cbrt.c cbrtf.c cbrtl.c ceil.c ceilf.c ceill.c copysign.c copysignf.c copysignl.c cos.c cosf.c cosh.c coshf.c coshl.c cosl.c erf.c erff.c erfl.c exp.c exp2.c exp2f.c exp2l.c exp10.c exp10f.c exp10l.c expf.c expl.c expm1.c expm1f.c expm1l.c fabs.c fabsf.c fabsl.c fdim.c fdimf.c fdiml.c finite.c finitef.c floor.c floorf.c floorl.c fma.c fmaf.c fmal.c fmax.c fmaxf.c fmaxl.c fmin.c fminf.c fminl.c fmod.c fmodf.c fmodl.c frexp.c frexpf.c frexpl.c hypot.c hypotf.c hypotl.c ilogb.c ilogbf.c ilogbl.c j0.c j0f.c j1.c j1f.c jn.c jnf.c ldexp.c ldexpf.c ldexpl.c lgamma.c lgamma_r.c lgammaf.c lgammaf_r.c lgammal.c llrint.c llrintf.c llrintl.c llround.c llroundf.c llroundl.c log.c log1p.c log1pf.c log1pl.c log2.c log2f.c log2l.c log10.c log10f.c log10l.c logb.c logbf.c logbl.c logf.c logl.c lrint.c lrintf.c lrintl.c lround.c lroundf.c lroundl.c modf.c modff.c modfl.c nan.c nanf.c nanl.c nearbyint.c nearbyintf.c nearbyintl.c nextafter.c nextafterf.c nextafterl.c nexttoward.c nexttowardf.c nexttowardl.c pow.c powf.c powl.c remainder.c remainderf.c remainderl.c remquo.c remquof.c remquol.c rint.c rintf.c rintl.c round.c roundf.c roundl.c scalb.c scalbf.c scalbln.c scalblnf.c scalblnl.c scalbn.c scalbnf.c scalbnl.c signgam.c significand.c significandf.c sin.c sincos.c sincosf.c sincosl.c sinf.c sinh.c sinhf.c sinhl.c sinl.c sqrt.c sqrtf.c sqrtl.c tan.c tanf.c tanh.c tanhf.c tanhl.c tanl.c tgamma.c tgammaf.c tgammal.c trunc.c truncf.c truncl.c
SRC_STR = memrchr.c  strcasecmp.c  strcasestr.c  strcat.c  strdup.c  strlcat.c  strncasecmp.c  strncat.c  strndup.c  strtok.c  strtok_r.c  memchr.c  memmem.c strchr.c strrchr.c strchrnul.c
SRC_INTR = floatscan.c intscan.c shgetc.c version.c
SRC_SINGLE = malloc/malloc.c exit/abort.c errno/__errno_location.c
SRC_IO = snprintf.c sprintf.c vsnprintf.c vsprintf.c __uflow.c __toread.c __stdio_exit.c
SOURCES = $(addprefix internal/,$(SRC_INTR)) $(addprefix ctype/,$(SRC_CTYPE)) $(addprefix stdio/,$(SRC_IO)) $(addprefix stdlib/,$(SRC_STD)) $(addprefix math/,$(SRC_MATH)) $(addprefix string/,$(SRC_STR)) $(SRC_SINGLE)
OBJECTS = $(SOURCES:.c=.o)

all: libmicroc

libmicroc: $(OBJECTS) | dirs
	$(AR) rcs $(BUILD_DIR)/libmicroc.a $(OBJECTS)

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<
	$(OBJCOPY) --rename-section .text=.irom0.text --rename-section .literal=.irom0.literal $@

dirs:
	mkdir -p $(BUILD_DIR)

clean:
	rm $(OBJECTS) $(BUILD_DIR)/libmicroc.a