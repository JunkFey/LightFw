include ../Makefile
.PHONY:cc_dpdk clean_dpdk
cc_dpdk:
	$(MAKE) -C ./build/
	
clean_dpdk:
	$(MAKE) -C ./build clean
