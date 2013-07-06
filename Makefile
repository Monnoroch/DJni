ifeq ($(V_OS),)
	TMP_UNAME := $(shell uname)

	ifeq ($(TMP_UNAME), Linux)
		V_OS := Linux
	endif

	ifeq ($(TMP_UNAME), Darwin)
		V_OS := Mac
	endif
	
	ifeq ($(firstword $(subst _, ,$(TMP_UNAME))), MINGW32)
		V_OS := Win
	endif
endif

ifeq ($(ARCH),)
	ARCH := $(shell uname -m)
	ifeq ($(ARCH),unknown)
		ARCH := $$(shell uname -i)
	endif
	ifeq ($(ARCH),i686)
		ARCH := x86
	endif
endif

ifeq ($(BUILD_MODE),)
	BUILD_MODE := DEBUG
	#BUILD_MODE := RELEASE
endif

###################################################

SOURSE := jni/jni.d jni/JniHelper.d jni/JniProxy.d jni/JavaVM.d jni/JavaEnv.d jni/JavaObject.d jni/JavaClass.d jni/JavaString.d jni/JavaArray.d jni/JavaMethod.d jni/JavaField.d
HEADERS := 

# arch flag
ifeq ($(ARCH),x86)
	COMPILER_ARCH_FLAG := -m32
endif

ifeq ($(ARCH),x86_64)
	COMPILER_ARCH_FLAG := -m64 -version=MSym64
endif

COMPILER_FlAGS_BASIC := -c $(COMPILER_ARCH_FLAG)

ifneq ($(V_OS), Win)
	COMPILER_FlAGS_BASIC += -fPIC
endif

COMPILER_FLAGS_DEBUG   := -debug
COMPILER_FLAGS_RELEASE := -O -release -inline

###############

COMPILER_FLAGS := $(COMPILER_FlAGS_BASIC) $(COMPILER_FLAGS_$(BUILD_MODE))

# Defines RESULT_NAME
# Needs V_OS and OUTPUT_TYPE

RESULT_NAME := libDJni.a
COMPILER := dmd

###################################################

INCLUDES := $(LOCAL_PATH)

CFLAGS := $(COMPILER_FLAGS)

###################################################

OBJECTS        := $(SOURSE:%.d=%.o)
EXPORT_HEADERS := $(HEADERS)

###################################################

all: build

%.o: %.d
	$(COMPILER) $(CFLAGS) $(addprefix -I, $(INCLUDES)) $< -of$@

test:

$(RESULT_NAME): $(OBJECTS)
	ar rvs $@ $(OBJECTS)

build: $(RESULT_NAME)

clean:
	rm -f $(RESULT_NAME)
	rm -f $(OBJECTS)

rebuild: clean build
