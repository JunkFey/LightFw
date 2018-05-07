
.PHONY:all clean dpdk dpdk_clean
MAKE = make
DPDK_SRC = ./dpdk
dpdk:
	cd $(DPDK_SRC) && $(MAKE) -f dpdk.mak cc_dpdk

dpdk_clean:
	cd $(DPDK_SRC) && $(MAKE) -f dpdk.mak clean_dpdk 

all:dpdk
	
clean:dpdk_clean
