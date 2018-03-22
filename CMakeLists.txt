cmake_minimum_required(VERSION 3.7)
project(Filozofowie)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_FLAGS "-lncurses")

set(SOURCE_FILES main.cpp)
add_executable(Filozofowie ${SOURCE_FILES})