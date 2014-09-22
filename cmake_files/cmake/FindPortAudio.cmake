# - Try to find Portaudio
# Once done this will define
#
#  PORTAUDIO_FOUND - system has Portaudio
#  PORTAUDIO_INCLUDE_DIRS - the Portaudio include directory
#  PORTAUDIO_LIB - Link these to use Portaudio
#  PORTAUDIO_DEFINITIONS - Compiler switches required for using Portaudio
#  PORTAUDIO_VERSION - Portaudio version
#
#  Copyright (c) 2006 Andreas Schneider <mail@cynapses.org>
#
# Redistribution and use is allowed according to the terms of the New BSD license.
# For details see the accompanying COPYING-CMAKE-SCRIPTS file.
#

if (PORTAUDIO_LIB AND PORTAUDIO_INCLUDE_DIRS)
  # in cache already
  set(PORTAUDIO_FOUND TRUE)

else (PORTAUDIO_LIB AND PORTAUDIO_INCLUDE_DIRS)
  # WIN32‚Å‚È‚¯‚ê‚ÎAFindPagConfig‚ð“Ç‚Ýž‚ñ‚ÅApkg_check_modules‚Åportaudio-2.0‚ðŒŸõ
  if (NOT WIN32)
    include(FindPkgConfig)
    #pkg_check_modules(PORTAUDIO2 portaudio-2.0)

    if (PORTAUDIO2_FOUND)
      set(PORTAUDIO_INCLUDE_DIRS
        ${PORTAUDIO2_INCLUDE_DIRS}
      )
      if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
        set(PORTAUDIO_LIB "${PORTAUDIO2_LIB_DIRS}/lib${PORTAUDIO2_LIB}.dylib")

      else (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
        set(PORTAUDIO_LIB
          ${PORTAUDIO2_LIB}
        )

      endif (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")

      set(PORTAUDIO_FOUND TRUE)
    else (PORTAUDIO2_FOUND)

      find_path(PORTAUDIO_INCLUDE_DIR
        NAMES
          portaudio.h
        PATHS
          /usr/include
          /usr/local/include
          /opt/local/include
          /sw/include
      )

      find_library(PORTAUDIO_LIB
        NAMES
          portaudio
        PATHS
          /usr/lib
          /usr/local/lib
          /opt/local/lib
          /sw/lib
      )

      find_path(PORTAUDIO_LIB_DIR
        NAMES
          portaudio
        PATHS
          /usr/lib
          /usr/local/lib
          /opt/local/lib
          /sw/lib
      )

      #set(PORTAUDIO_INCLUDE_DIRS
      #  ${PORTAUDIO_INCLUDE_DIR}
      #)
      #set(PORTAUDIO_LIB
      #  ${PORTAUDIO_LIB}
      #)

      #set(PORTAUDIO_LIB_DIRS
      #  ${PORTAUDIO_LIB_DIR}
      #)

      if (PORTAUDIO_INCLUDE_DIRS AND PORTAUDIO_LIB)
        set(PORTAUDIO_FOUND TRUE)
      endif (PORTAUDIO_INCLUDE_DIRS AND PORTAUDIO_LIB)

      if (PORTAUDIO_FOUND)
        if (NOT Portaudio_FIND_QUIETLY)
          message(STATUS "Found Portaudio: ${PORTAUDIO_LIB}")
        endif (NOT Portaudio_FIND_QUIETLY)
      else (PORTAUDIO_FOUND)
        if (Portaudio_FIND_REQUIRED)
          message(FATAL_ERROR "Could not find Portaudio")
        endif (Portaudio_FIND_REQUIRED)
      endif (PORTAUDIO_FOUND)
    endif (PORTAUDIO2_FOUND)

    message(STATUS "PORTAUDIO_LIB = ${PORTAUDIO_LIB}")
    message(STATUS "PORTAUDIO_INCLUDE_DIR = ${PORTAUDIO_INCLUDE_DIR}")
    message(STATUS "PORTAUDIO_LIB_DIR = ${PORTAUDIO_LIB_DIR}")

  else (NOT WIN32)

# setting 
    file(TO_CMAKE_PATH $ENV{PORTAUDIO_DIR} PORTAUDIO_DIR)

      if(PORTAUDIO_DIR)
        message(STATUS "PORTAUDIO_DIR=${PORTAUDIO_DIR}")
      else(PORTAUDIO_DIR)
#        MESSAGE(FATAL_ERROR "Not found PORTAUDIO_DIR. Set PORTAUDIO directry path to PORTAUDIO_DIR env.")
      endif(PORTAUDIO_DIR)

message(STATUS "------->>>${PORTAUDIO_DIR}")
    
    find_path(PORTAUDIO_INCLUDE_DIR
      NAMES
        portaudio.h
      HINTS
        ${PORTAUDIO_DIR}/include
    )

    find_library(PORTAUDIO_LIB
      NAMES
        portaudio_x86.lib
      HINTS
        ${PORTAUDIO_DIR}/lib
        ${PORTAUDIO_DIR}/*/Release
        ${PORTAUDIO_DIR}/*/Degub
    )

    find_path(POATAUDIO_LIB_DIR
      NAMES
        portaudio_x86.lib
      HINTS
        ${PORTAUDIO_DIR}/lib
        ${PORTAUDIO_DIR}/*/Release
        ${PORTAUDIO_DIR}/*/Degub
    )

#    set(PORTAUDIO_LIB portaudio_x86.lib CACHE STRING "portaudio library name for x86")


    if (PORTAUDIO_INCLUDE_DIRS AND PORTAUDIO_LIB)
      set(PORTAUDIO_FOUND TRUE)
    endif (PORTAUDIO_INCLUDE_DIRS AND PORTAUDIO_LIB)



    if (PORTAUDIO_FOUND)

      if (NOT Portaudio_FIND_QUIETLY)
        message(STATUS "Found Portaudio: ${PORTAUDIO_LIB}")
      endif (NOT Portaudio_FIND_QUIETLY)
    else (PORTAUDIO_FOUND)
      if (Portaudio_FIND_REQUIRED)
        message(FATAL_ERROR "Could not find Portaudio")
      endif (Portaudio_FIND_REQUIRED)
    endif (PORTAUDIO_FOUND)

    message(STATUS "PORTAUDIO_LIB = ${PORTAUDIO_LIB}")
    message(STATUS "PORTAUDIO_INCLUDE_DIR = ${PORTAUDIO_INCLUDE_DIR}")
    message(STATUS "PORTAUDIO_LIB_DIR = ${PORTAUDIO_LIB_DIR}")

  endif (NOT WIN32)

  # show the PORTAUDIO_INCLUDE_DIRS and PORTAUDIO_LIB variables only in the advanced view
#  mark_as_advanced(PORTAUDIO_INCLUDE_DIRS PORTAUDIO_LIB)


endif (PORTAUDIO_LIB AND PORTAUDIO_INCLUDE_DIRS)
