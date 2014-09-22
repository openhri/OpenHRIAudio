# - Try to find Resample
# Once done this will define
#
#  RESAMPLE_FOUND - system has Resample
#  RESAMPLE_INCLUDE_DIRS - the Resample include directory
#  RESAMPLE_LIB - Link these to use Resample


if (RESAMPLE_LIB AND RESAMPLE_INCLUDE_DIRS)
  # in cache already
  set(RESAMPLE_FOUND TRUE)

else (RESAMPLE_LIB AND RESAMPLE_INCLUDE_DIRS)
  # WIN32Ç≈Ç»ÇØÇÍÇŒÅAFindPagConfigÇì«Ç›çûÇÒÇ≈ÅApkg_check_modulesÇ≈speex-2.0Çåüçı
  if (NOT WIN32)
    include(FindPkgConfig)
    #pkg_check_modules(SPEEX2 speex-2.0)

    if (RESAMPLE_FOUND)
      set(RESAMPLE_INCLUDE_DIRS
        ${RESAMPLE_INCLUDE_DIRS}
      )
      if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
        set(RESAMPLE_LIB "${RESAMPLE_LIB_DIRS}/lib${RESAMPLE_LIB}.dylib")

      else (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
        set(RESAMPLE_LIB
          ${RESAMPLE_LIB}
        )

      endif (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")

      set(RESAMPLE_FOUND TRUE)
    else (RESAMPLE_FOUND)
      find_path(RESAMPLE_INCLUDE_DIR
        NAMES
          libresample.h
        PATHS
          /usr/include
          /usr/local/include
          /opt/local/include
          /sw/include
      )

      find_library(RESAMPLE_LIB
        NAMES
          resample
        PATHS
          /usr/lib
          /usr/local/lib
          /opt/local/ib
          /sw/lib
      )

#      find_path(RESAMPLE_LIB_DIR
#        NAMES
#          resample
#        PATHS
#          /usr/lib
#          /usr/local/lib
#          /opt/local/lib
#          /sw/lib
#      )

      set(RESAMPLE_INCLUDE_DIRS
        ${RESAMPLE_INCLUDE_DIR}
      )
      set(RESAMPLE_LIB
        ${RESAMPLE_LIB}
      )

      set(RESAMPLE_LIB_DIRS
        ${RESAMPLE_LIB_DIR}
      )

      if (RESAMPLE_INCLUDE_DIRS AND RESAMPLE_LIB)
        set(RESAMPLE_FOUND TRUE)
      endif (RESAMPLE_INCLUDE_DIRS AND RESAMPLE_LIB)

      if (RESAMPLE_FOUND)
        if (NOT RESAMPLE_FIND_QUIETLY)
          message(STATUS "Found RESAMPLE: ${RESAMPLE_LIB}")
        endif (NOT RESAMPLE_FIND_QUIETLY)
      else (RESAMPLE_FOUND)
        if (RESAMPLE_FIND_REQUIRED)
          message(FATAL_ERROR "Could not find RESAMPLE")
        endif (RESAMPLE_FIND_REQUIRED)
      endif (RESAMPLE_FOUND)
    endif (RESAMPLE_FOUND)

  else (NOT WIN32)

    file(TO_CMAKE_PATH $ENV{RESAMPLE_DIR} RESAMPLE_DIR)

    if(RESAMPLE_DIR)
      message(STATUS "RESAMPLE_DIR=${RESAMPLE_DIR}")
    else(RESAMPLE_DIR)
       #set(RESAMPLE "C:/HRI_work/libresample-0.1.3")
       MESSAGE(FATAL_ERROR "Not found RESAMPLE_DIR. Set Resample directry path to RESAMPLE_DIR env.")
    endif(RESAMPLE_DIR)

    find_path(RESAMPLE_INCLUDE_DIR
      NAMES
        libresample.h
      HINTS
        ${RESAMPLE_DIR}/include
    )

    find_library(RESAMPLE_LIB
      NAMES
        libresample.lib
      HINTS
        ${RESAMPLE_DIR}/lib
        ${RESAMPLE_DIR}/*/Release
        ${RESAMPLE_DIR}/*/Degub
    )

    find_path(RESAMPLE_LIB_DIR
      NAMES
        libresample.lib
      HINTS
        ${RESAMPLE_DIR}/lib
        ${RESAMPLE_DIR}/*/Release
        ${RESAMPLE_DIR}/*/Degub
    )

    if (RESAMPLE_INCLUDE_DIR AND RESAMPLE_LIB)
      set(RESAMPLE_FOUND TRUE)
    endif (RESAMPLE_INCLUDE_DIR AND RESAMPLE_LIB)

    if (RESAMPLE_FOUND)

      if (NOT RESAMPLE_FIND_QUIETLY)
        message(STATUS "Found RESAMPLE: ${RESAMPLE_LIB}")
      endif (NOT RESAMPLE_FIND_QUIETLY)
    else (RESAMPLE_FOUND)
      if (RESAMPLE_FIND_REQUIRED)
        message(FATAL_ERROR "Could not find RESAMPLE")
      endif (RESAMPLE_FIND_REQUIRED)
    endif (RESAMPLE_FOUND)

  endif (NOT WIN32)


endif(RESAMPLE_LIB AND RESAMPLE_INCLUDE_DIRS)
