
.PHONY:all dpdk dpdk_clean 
MAKE = make
RM = rm -rf
MKDIR = mkdir -p 
DPDK_SRC = ./dpdk
TARGET = ./target

dpdk:
	@$(MKDIR) $(TARGET)/dpdk
	@$(MKDIR) $(TARGET)/lib
	@cd $(DPDK_SRC) && $(MAKE) -f dpdk.mak cc_dpdk

dpdk_clean:
	@cd $(DPDK_SRC) && $(MAKE) -f dpdk.mak clean_dpdk 
	@$(RM) $(TARGET)/dpdk
all: dpdk
	
clean:dpdk_clean
	@$(RM) $(TARGET)
