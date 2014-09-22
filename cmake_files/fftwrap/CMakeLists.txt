#
#  CMake for DSArray Component
#

cmake_minimum_required(VERSION 2.8 FATAL_ERROR)

project(fftwrap)

set(SRC_DIRS "${PROJECT_SOURCE_DIR}/../../src")

add_definitions(-DUSE_SMALLFT)
add_library(fftwrap SHARED ${SRC_DIRS}/fftwrap.c ${SRC_DIRS}/smallft.c)
