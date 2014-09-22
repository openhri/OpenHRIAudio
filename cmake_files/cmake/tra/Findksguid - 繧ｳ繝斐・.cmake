# Find ksguid library
# Find the native ksguid includes and library
# This module defines
#  KSGUID_INCLUDE_DIRS, where to find sndfile.h, Set when
#                        KSGUID_INCLUDE_DIR is found.
#  KSGUID_LIBRARIES, libraries to link against to use ksguid.
#  KSGUID_ROOT_DIR, The base directory to search for ksguid.
#                    This can also be an environment variable.
#  KSGUID_FOUND, If false, do not try to use ksguid.
#
# also defined, but not for general use are
#  KSGUID_LIBRARY, where to find the ksguid library.

#=============================================================================
# Copyright 2002-2009 Kitware, Inc.
#
# Distributed under the OSI-approved BSD License (the "License");
# see accompanying file Copyright.txt for details.
#
# This software is distributed WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the License for more information.
#=============================================================================
# (To distribute this file outside of CMake, substitute the full
#  License text for the above reference.)

# If KSGUID_ROOT_DIR was defined in the environment, use it.
IF(NOT KSGUID_ROOT_DIR AND NOT $ENV{KSGUID_ROOT_DIR} STREQUAL "")
  SET(KSGUID_ROOT_DIR $ENV{KSGUID_ROOT_DIR})
ENDIF()

file(TO_CMAKE_PATH $ENV{WindowsSDK_dir} WSDK_dir)

set(KSGUID_LIB "ksguid.lib")
set(KSGUID_LIBRARY_DIR ${WSDK_dir})

    message(STATUS "KSGUID_LIB = ${PORTAUDIO_LIB}")
#    message(STATUS "KSGUID_INCLUDE_DIR = ${KSGUID_INCLUDE_DIR}")
    message(STATUS "KSGUID_LIBRARY_DIR = ${KSGUID_LIBRARY_DIR}")

  mark_as_advanced(KSGUID_LIBRARY_DIR)
