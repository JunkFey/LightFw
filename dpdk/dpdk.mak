include ../Makefile
.PHONY: clean_dpdk lib_dpdk
cc_dpdk:lib_dpdk
	@find ./build/  -name "*.o"  -exec cp {} ../target/dpdk  \;	
	@ar crv ../target/lib/libdpdk.a ../target/dpdk/*.o > /dev/null
lib_dpdk:
	@chmod u+x ./buildtools/*
	$(MAKE) -C ./build/
	
clean_dpdk:
	$(MAKE) -C ./build clean
