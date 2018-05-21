cmake_minimum_required (VERSION 2.8)
project(LightFw)
include_directories(./include/dpdk)
add_definitions("-Wall -g")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -march=native -m64")
set(EXECUTABLE_OUTPUT_PATH "${PROJECT_SOURCE_DIR}/../target/bin")

set(LIB_PATH ${PROJECT_SOURCE_DIR}/../target/lib/ /usr/lib /usr/lib64 )
set(COMMON_LIBRARIES dpdk pthread dl numa)

link_directories(${LIB_PATH})
add_executable(start main.c)
target_link_libraries(start ${COMMON_LIBRARIES})

