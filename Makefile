
.PHONY:all dpdk dpdk_clean 
MAKE = make
RM = rm -rf
CP = cp -Rf
MKDIR = mkdir -p 
DPDK_SRC = ./dpdk
TARGET = ./target
INC=$(shell pwd)/app/include/dpdk

ARCH  ?= x86_64
CPU_CFLAGS  ?= -m64
CPU_ASFLAGS ?= -felf64
RTE_OBJCOPY_TARGET = elf64-x86-64
RTE_OBJCOPY_ARCH = i386:x86-64
MACHINE_CFLAGS = -march=native
C_FLAGS +=CPU_CFLAGS MACHINE_CFLAGS
export C_FLAGS
app:dpdk
	@export C_INCLUDE_PATH="$(INC):C_INCLUDE_PATH" && $(MAKE) -C ./app
	@$(CP) ./app/start $(TARGET)/lib
dpdk:
	@$(MKDIR) $(TARGET)/dpdk
	@$(MKDIR) $(TARGET)/lib
	@cd $(DPDK_SRC) && $(MAKE) -f dpdk.mak cc_dpdk

dpdk_clean:
	@cd $(DPDK_SRC) && $(MAKE) -f dpdk.mak clean_dpdk 
	@$(RM) $(TARGET)/dpdk
all: app dpdk
	
clean:dpdk_clean
	@$(RM) $(TARGET)

