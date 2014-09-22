# - Try to find Speex
# Once done this will define
#
#  SPEEX_FOUND - system has Speex
#  SPEEX_INCLUDE_DIRS - the Speex include directory
#  SPEEX_LIB - Link these to use Speex



if (SPEEX_LIB AND SPEEX_INCLUDE_DIRS)
  # in cache already
  set(SPEEX_FOUND TRUE)

else (SPEEX_LIB AND SPEEX_INCLUDE_DIRS)
  # WIN32‚Å‚È‚¯‚ê‚ÎAFindPagConfig‚ð“Ç‚Ýž‚ñ‚ÅApkg_check_modules‚Åspeex-2.0‚ðŒŸõ
  if (NOT WIN32)
    include(FindPkgConfig)
    #pkg_check_modules(SPEEX2 speex-2.0)

    if (SPEEX2_FOUND)
      set(SPEEX_INCLUDE_DIRS
        ${SPEEX2_INCLUDE_DIRS}
      )
      if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
        set(SPEEX_LIB "${SPEEX2_LIB_DIRS}/lib${SPEEX2_LIB}.dylib")

      else (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
        set(SPEEX_LIB
          ${SPEEX2_LIB}
        )

      endif (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")

      set(SPEEX_FOUND TRUE)
    else (SPEEX2_FOUND)
      find_path(SPEEX_INCLUDE_DIR
        NAMES
          speex/speex_echo.h
        PATHS
          /usr/include
          /usr/local/include
          /opt/local/include
          /sw/include
      )

      find_library(SPEEX_LIB
        NAMES
          speexdsp
        PATHS
          /usr/lib
          /usr/local/lib
          /opt/local/lib
          /sw/lib
      )

#      find_path(SPEEX_LIB_DIR
#        NAMES
#          libspeexdsp.so
#        PATHS
#          /usr/lib
#          /usr/local/lib
#          /opt/local/lib
#          /sw/lib
#      )

      set(SPEEX_INCLUDE_DIRS
        ${SPEEX_INCLUDE_DIR}
      )
      set(SPEEX_LIB
        ${SPEEX_LIB}
      )

      set(SPEEX_LIB_DIRS
        ${SPEEX_LIB_DIR}
      )

message(STATUS "spx_inc_dir---> ${SPEEX_INCLUDE_DIRS}")
message(STATUS "spx_lib---> ${SPEEX_LIB}")
message(STATUS "spx_lib_dir---> ${SPEEX_LIB_DIRS}")

      set(SPEEX_VERSION
        18
      )

      if (SPEEX_INCLUDE_DIRS AND SPEEX_LIB)
        set(SPEEX_FOUND TRUE)
      endif (SPEEX_INCLUDE_DIRS AND SPEEX_LIB)

      if (SPEEX_FOUND)
        if (NOT SPEEX_FIND_QUIETLY)
          message(STATUS "Found SPEEX: ${SPEEX_LIB}")
        endif (NOT SPEEX_FIND_QUIETLY)
      else (SPEEX_FOUND)
        if (SPEEX_FIND_REQUIRED)
          message(FATAL_ERROR "Could not find SPEEX")
        endif (SPEEX_FIND_REQUIRED)
      endif (SPEEX_FOUND)
    endif (SPEEX2_FOUND)

  else (NOT WIN32)

#kokokara 

    file(TO_CMAKE_PATH $ENV{SPEEX_DIR} SPEEX_DIR)

    if(SPEEX_DIR)
      message(STATUS "SPEEX_DIR=${SPEEX_DIR}")
    else(SPEEX_DIR)
       MESSAGE(FATAL_ERROR "Not found SPEEX_DIR. Set Speex directry path to SPEEX_DIR env.")
    endif(SPEEX_DIR)

    find_path(SPEEX_INCLUDE_DIR
      NAMES
        speex/speex.h
      HINTS
        ${SPEEX_DIR}/include
      PATHS
        ${SPEEX_DIR}
    )

    find_library(SPEEX_LIB
      NAMES
        libspeex.lib
      HINTS
        ${SPEEX_DIR}/lib
        ${SPEEX_DIR}/*/Release
        ${SPEEX_DIR}/*/Degub
      PATHS
         ${SPEEX_DIR}
    )

    find_path(SPEEX_LIB_DIR
      NAMES
        libspeex.lib
      HINTS
        ${SPEEX_DIR}/*/lib
        ${SPEEX_DIR}/*/Release
        ${SPEEX_DIR}/*/Degub
      PATHS
         ${SPEEX_DIR}
    )

    if (SPEEX_INCLUDE_DIR AND SPEEX_LIB)
      set(SPEEX_FOUND TRUE)
    endif (SPEEX_INCLUDE_DIR AND SPEEX_LIB)

    if (SPEEX_FOUND)

      if (NOT SPEEX_FIND_QUIETLY)
        message(STATUS "Found SPEEX: ${SPEEX_LIB}")
      endif (NOT SPEEX_FIND_QUIETLY)
    else (SPEEX_FOUND)
      if (SPEEX_FIND_REQUIRED)
        message(FATAL_ERROR "Could not find SPEEX")
      endif (SPEEX_FIND_REQUIRED)
    endif (SPEEX_FOUND)

  endif (NOT WIN32)

  # show the SPEEX_INCLUDE_DIRS and SPEEX_LIB variables only in the advanced view
#mark_as_advanced(FORCE SPEEX_DIR SPEEX_INCLUDE_DIRS SPEEX_LIB)


endif (SPEEX_LIB AND SPEEX_INCLUDE_DIRS)
