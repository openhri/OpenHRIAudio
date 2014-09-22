# - Find sndfile
# Find the native sndfile includes and libraries
#
#  SNDFILE_INCLUDE_DIR - where to find sndfile.h, etc.
#  SNDFILE_LIBRARIES   - List of libraries when using libsndfile.
#  SNDFILE_FOUND       - True if libsndfile found.

set(CMAKE_PREFIX_PATH "C:/Program Files")

if(SNDFILE_INCLUDE_DIR)
    # Already in cache, be silent	
    set(SNDFILE_FIND_QUIETLY TRUE)
endif(SNDFILE_INCLUDE_DIR)

find_path(SNDFILE_INCLUDE_DIR 
          NAMES
	    sndfile.h
	  PATH
	  Mega-Nerd/libsndfile/include
	  HINTS
	    C:/Program Files
	    "${CMAKE_PREFIX_PAT}/Mega-Nerd/libsndfile/include"
	    #C:/Program Files/Mega-Nerd/libsndfile/include
	  )
find_library(SNDFILE_LIB libsndfile-1.lib 
        HINTS C:/Program Files/Mega-Nerd/libsndfile/lib			 
	)
 find_path(PORTAUDIO_INCLUDE_DIR
    NAMES
      portaudio.h
    PATHS
      /usr/include
      /usr/local/include
      /opt/local/include
      /sw/include
      f:/programme/portaudio/include
  )

find_library(SNDFILE_LIBRARY NAMES sndfile sndfile-1)

# Handle the QUIETLY and REQUIRED arguments and set SNDFILE_FOUND to TRUE if
# all listed variables are TRUE.
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(SNDFILE DEFAULT_MSG SNDFILE_LIBRARY SNDFILE_INCLUDE_DIR)

if(SNDFILE_FOUND)
  set(SNDFILE_LIBRARIES ${SNDFILE_LIBRARY})
else(SNDFILE_FOUND)
  set(SNDFILE_LIBRARIES)
endif(SNDFILE_FOUND)

message(STATUS "----------------")
message(STATUS "${SNDFILE_LIB}")
message(STATUS "----------------")
mark_as_advanced(SNDFILE_INCLUDE_DIR SNDFILE_LIBRARY)
