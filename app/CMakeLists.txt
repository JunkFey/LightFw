cmake_minimum_required (VERSION 2.8)
project(vFW)
include_directories(./include/dpdk)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -march=native -m64")
set(EXECUTABLE_OUTPUT_PATH "../target/bin")
link_directories(/home/jz/vFW/target/lib/ /usr/lib /usr/lib64)
add_executable(start main.c)
target_link_libraries(start libdpdk.a libpthread.so.0 libdl.so.2 libnuma.so)

