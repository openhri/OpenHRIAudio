# - Try to find Resample
# Once done this will define
#
#  RESAMPLE_FOUND - system has Resample
#  RESAMPLE_INCLUDE_DIRS - the Resample include directory
#  RESAMPLE_LIBRARIES - Link these to use Resample
#  RESAMPLE_DEFINITIONS - Compiler switches required for using Resample
#  RESAMPLE_VERSION - Resample version
#
#  Copyright (c) 2006 Andreas Schneider <mail@cynapses.org>
#
# Redistribution and use is allowed according to the terms of the New BSD license.
# For details see the accompanying COPYING-CMAKE-SCRIPTS file.
#



if (RESAMPLE_LIBRARIES AND RESAMPLE_INCLUDE_DIRS)
  # in cache already
  set(RESAMPLE_FOUND TRUE)

else (RESAMPLE_LIBRARIES AND RESAMPLE_INCLUDE_DIRS)
  # WIN32Ç≈Ç»ÇØÇÍÇŒÅAFindPagConfigÇì«Ç›çûÇÒÇ≈ÅApkg_check_modulesÇ≈Resample-2.0Çåüçı
  if (NOT WIN32)
    include(FindPkgConfig)
    pkg_check_modules(RESAMPLE2 Resample-2.0)

    if (RESAMPLE2_FOUND)
      set(RESAMPLE_INCLUDE_DIRS
        ${RESAMPLE2_INCLUDE_DIRS}
      )
      if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
        set(RESAMPLE_LIBRARIES "${RESAMPLE2_LIBRARY_DIRS}/lib${RESAMPLE2_LIBRARIES}.dylib")

      else (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
        set(RESAMPLE_LIBRARIES
          ${RESAMPLE2_LIBRARIES}
        )

      endif (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
      set(RESAMPLE_VERSION
        19
      )
      set(RESAMPLE_FOUND TRUE)
    else (RESAMPLE2_FOUND)
      find_path(RESAMPLE_INCLUDE_DIR
        NAMES
          Resample.h
        PATHS
          /usr/include
          /usr/local/include
          /opt/local/include
          /sw/include
      )

      find_library(RESAMPLE_LIBRARY
        NAMES
          Resample
        PATHS
          /usr/lib
          /usr/local/lib
          /opt/local/lib
          /sw/lib
      )

      find_path(RESAMPLE_LIBRARY_DIR
        NAMES
          Resample
        PATHS
          /usr/lib
          /usr/local/lib
          /opt/local/lib
          /sw/lib
      )

      set(RESAMPLE_INCLUDE_DIRS
        ${RESAMPLE_INCLUDE_DIR}
      )
      set(RESAMPLE_LIBRARIES
        ${RESAMPLE_LIBRARY}
      )

      set(RESAMPLE_LIBRARY_DIRS
        ${RESAMPLE_LIBRARY_DIR}
      )

      set(RESAMPLE_VERSION
        18
      )

      if (RESAMPLE_INCLUDE_DIRS AND RESAMPLE_LIBRARIES)
        set(RESAMPLE_FOUND TRUE)
      endif (RESAMPLE_INCLUDE_DIRS AND RESAMPLE_LIBRARIES)

      if (RESAMPLE_FOUND)
        if (NOT Resample_FIND_QUIETLY)
          message(STATUS "Found Resample: ${RESAMPLE_LIBRARIES}")
        endif (NOT Resample_FIND_QUIETLY)
      else (RESAMPLE_FOUND)
        if (Resample_FIND_REQUIRED)
          message(FATAL_ERROR "Could not find Resample")
        endif (Resample_FIND_REQUIRED)
      endif (RESAMPLE_FOUND)
    endif (RESAMPLE2_FOUND)

  else (NOT WIN32)


    find_path(RESAMPLE_INCLUDE_DIR
      NAMES
        libresample.h
      PATHS
        ../../../audacity-src-*/lib-src/libresample/include
    )

    find_path(RESAMPLE_LIBRARY_DIR
      NAMES
        libresample.lib
      PATHS
         ../../../audacity-src-*/lib-src/libresample/VS2013
         ../../../audacity-src-*/lib-src/libresample/win
    )


    if (RESAMPLE_INCLUDE_DIRS AND RESAMPLE_LIBRARIES)
      set(RESAMPLE_FOUND TRUE)
    endif (RESAMPLE_INCLUDE_DIRS AND RESAMPLE_LIBRARIES)



    if (RESAMPLE_FOUND)

      if (NOT Resample_FIND_QUIETLY)
        message(STATUS "Found Resample: ${RESAMPLE_LIBRARIES}")
      endif (NOT Resample_FIND_QUIETLY)
    else (RESAMPLE_FOUND)
      if (Resample_FIND_REQUIRED)
        message(FATAL_ERROR "Could not find Resample")
      endif (Resample_FIND_REQUIRED)
    endif (RESAMPLE_FOUND)

    set(RESAMPLE_LIB "libresample.lib")
    set(RESAMPLE_INCLUDE_DIR ${RESAMPLE_INCLUDE_DIR})
    set(RESAMPLE_LIBRARY_DIR ${RESAMPLE_LIBRARY_DIR})

    message(STATUS "RESAMPLE_LIB = ${RESAMPLE_LIB}")
    message(STATUS "RESAMPLE_INCLUDE_DIR = ${RESAMPLE_INCLUDE_DIR}")
    message(STATUS "RESAMPLE_LIBRARY_DIR = ${RESAMPLE_LIBRARY_DIR}")

  endif (NOT WIN32)

  # show the RESAMPLE_INCLUDE_DIRS and RESAMPLE_LIBRARIES variables only in the advanced view
  mark_as_advanced(RESAMPLE_INCLUDE_DIRS RESAMPLE_LIBRARIES)


endif (RESAMPLE_LIBRARIES AND RESAMPLE_INCLUDE_DIRS)
