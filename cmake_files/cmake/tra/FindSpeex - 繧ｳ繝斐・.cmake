# - Try to find Speex
# Once done this will define
#
#  SPEEX_FOUND - system has Speex
#  SPEEX_INCLUDE_DIRS - the Speex include directory
#  SPEEX_LIBRARIES - Link these to use Speex
#  SPEEX_DEFINITIONS - Compiler switches required for using Speex
#  SPEEX_VERSION - Speex version
#
#  Copyright (c) 2006 Andreas Schneider <mail@cynapses.org>
#
# Redistribution and use is allowed according to the terms of the New BSD license.
# For details see the accompanying COPYING-CMAKE-SCRIPTS file.
#



if (SPEEX_LIBRARIES AND SPEEX_INCLUDE_DIRS)
  # in cache already
  set(SPEEX_FOUND TRUE)

else (SPEEX_LIBRARIES AND SPEEX_INCLUDE_DIRS)
  # WIN32Ç≈Ç»ÇØÇÍÇŒÅAFindPagConfigÇì«Ç›çûÇÒÇ≈ÅApkg_check_modulesÇ≈speex-2.0Çåüçı
  if (NOT WIN32)
    include(FindPkgConfig)
    pkg_check_modules(SPEEX2 speex-2.0)

    if (SPEEX2_FOUND)
      set(SPEEX_INCLUDE_DIRS
        ${SPEEX2_INCLUDE_DIRS}
      )
      if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
        set(SPEEX_LIBRARIES "${SPEEX2_LIBRARY_DIRS}/lib${SPEEX2_LIBRARIES}.dylib")

      else (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
        set(SPEEX_LIBRARIES
          ${SPEEX2_LIBRARIES}
        )

      endif (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
      set(SPEEX_VERSION
        19
      )
      set(SPEEX_FOUND TRUE)
    else (SPEEX2_FOUND)
      find_path(SPEEX_INCLUDE_DIR
        NAMES
          speex.h
        PATHS
          /usr/include
          /usr/local/include
          /opt/local/include
          /sw/include
      )

      find_library(SPEEX_LIBRARY
        NAMES
          speex
        PATHS
          /usr/lib
          /usr/local/lib
          /opt/local/lib
          /sw/lib
      )

      find_path(SPEEX_LIBRARY_DIR
        NAMES
          speex
        PATHS
          /usr/lib
          /usr/local/lib
          /opt/local/lib
          /sw/lib
      )

      set(SPEEX_INCLUDE_DIRS
        ${SPEEX_INCLUDE_DIR}
      )
      set(SPEEX_LIBRARIES
        ${SPEEX_LIBRARY}
      )

      set(SPEEX_LIBRARY_DIRS
        ${SPEEX_LIBRARY_DIR}
      )

      set(SPEEX_VERSION
        18
      )

      if (SPEEX_INCLUDE_DIRS AND SPEEX_LIBRARIES)
        set(SPEEX_FOUND TRUE)
      endif (SPEEX_INCLUDE_DIRS AND SPEEX_LIBRARIES)

      if (SPEEX_FOUND)
        if (NOT SPEEX_FIND_QUIETLY)
          message(STATUS "Found SPEEX: ${SPEEX_LIBRARIES}")
        endif (NOT SPEEX_FIND_QUIETLY)
      else (SPEEX_FOUND)
        if (SPEEX_FIND_REQUIRED)
          message(FATAL_ERROR "Could not find SPEEX")
        endif (SPEEX_FIND_REQUIRED)
      endif (SPEEX_FOUND)
    endif (SPEEX2_FOUND)

  else (NOT WIN32)


    find_path(SPEEX_INCLUDE_DIR
      NAMES
        speex/speex.h
      PATHS
	 ../../../speex-*rc*-*/include/speex
	 ../../../speex-*rc*_*/include/speex
	 ../../../speex-*rc*/include
	 ../../../speex/include
    )

    find_path(SPEEX_LIBRARY_DIR
      NAMES
        libspeex.lib
      PATHS
         ../../../speex-*rc*/win32/VS2013/libspeex/Release
    )

    if (SPEEX_INCLUDE_DIRS AND SPEEX_LIBRARIES)
      set(SPEEX_FOUND TRUE)
    endif (SPEEX_INCLUDE_DIRS AND SPEEX_LIBRARIES)



    if (SPEEX_FOUND)

      if (NOT SPEEX_FIND_QUIETLY)
        message(STATUS "Found SPEEX: ${SPEEX_LIBRARIES}")
      endif (NOT SPEEX_FIND_QUIETLY)
    else (SPEEX_FOUND)
      if (SPEEX_FIND_REQUIRED)
        message(FATAL_ERROR "Could not find SPEEX")
      endif (SPEEX_FIND_REQUIRED)
    endif (SPEEX_FOUND)

    set(SPEEX_LIB "libspeex.lib")
    set(SPEEX_INCLUDE_DIR ${SPEEX_INCLUDE_DIR})
    set(SPEEX_LIBRARY_DIR ${SPEEX_LIBRARY_DIR})

    message(STATUS "SPEEX_LIB = ${SPEEX_LIB}")
    message(STATUS "SPEEX_INCLUDE_DIR = ${SPEEX_INCLUDE_DIR}")
    message(STATUS "SPEEX_LIBRARY_DIR = ${SPEEX_LIBRARY_DIR}")

  endif (NOT WIN32)

  # show the SPEEX_INCLUDE_DIRS and SPEEX_LIBRARIES variables only in the advanced view
  mark_as_advanced(SPEEX_INCLUDE_DIRS SPEEX_LIBRARIES)


endif (SPEEX_LIBRARIES AND SPEEX_INCLUDE_DIRS)
