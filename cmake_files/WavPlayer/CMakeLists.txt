#
# CMake for WavPlayer Component
#

cmake_minimum_required(VERSION 2.8 FATAL_ERROR)

project(WavPlayer)

#file(TO_CMAKE_PATH $ENV{RTM_ROOT} rtm_root)

set(CMAKE_ALLOW_LOOSE_LOOP_CONSTRUCTS true)
set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/../cmake" "${PROJECT_SOURCE_DIR}/cmake_modules")

set(LINUX_PACKAGE_GENERATOR "DEB")
#set(LINUX_PACKAGE_GENERATOR "RPM")

#setting  for OpenHRI
set(SRC_DIRS "${PROJECT_SOURCE_DIR}/../../src")
find_package(SndFile REQUIRED)
find_package(gtkmm-2.4 REQUIRED)

if (WIN32)
   set(SNDFILE_LIBRARIES ${SNDFILE_LIB})
else (WIN32)
    list(APPEND INCLUDE_DIRS ${GTKMM_INCLUDE_DIRS})
    list(APPEND LIBRARIES ${GTKMM_LIBS} ${SNDFILE_LIBRARIES})
endif (WIN32)

ADD_DEFINITIONS(-DPACKAGE="${PACKAGE}" -DLOCALEDIR="${LOCALEDIR}")


# component settings
set(RTC_NAME "${PROJECT_NAME}")
set(RTC_VERSION "1.0.0")
set(RTC_LANG "c++")
set(RTC_DESCRIPTION "Sound play Module by using SndFile Library")
set(RTC_VENDOR "AIST")
set(RTC_MAINTAINER "openrtp@m.aist.go.jp")


string(TOLOWER ${RTC_NAME} PACKAGE_NAME)
set(PACKAGE_VERSION "${RTC_VERSION_MAJOR}.${RTC_VERSION_MINOR}.${RTC_VERSION_PATCH}")

set(LIBS_SRCS ${SRC_DIRS}/${PROJECT_NAME}.cpp)

set(LIBS_INCS ${SRC_DIRS}/${PROJECT_NAME}.h)

set(EXEC_SRCS ${SRC_DIRS}/${PROJECT_NAME}Comp.cpp)

set(OTHER_SRCS CMakeLists.txt Doxyfile.in
               ${PROJECT_NAME}.conf rtc.conf)


include(RTC)
