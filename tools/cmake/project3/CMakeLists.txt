cmake_minimum_required(VERSION 2.8)
project(useHello)
file(GLOB_RECURSE SRC_FILES src/*.cpp)   
add_library(hello SHARED ${SRC_FILES})
# add_library(hello SHARED src/libHello.cpp)

include_directories(include) 
add_executable(useHello useHello.cpp)
target_link_libraries(useHello hello)
