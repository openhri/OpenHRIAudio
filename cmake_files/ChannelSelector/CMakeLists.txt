#
# CMake for ChannelSelector Component
#

cmake_minimum_required(VERSION 2.8 FATAL_ERROR)

project(ChannelSelector)

#file(TO_CMAKE_PATH $ENV{RTM_ROOT} rtm_root)

set(CMAKE_ALLOW_LOOSE_LOOP_CONSTRUCTS true)
set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/../cmake" "${PROJECT_SOURCE_DIR}/cmake_modules" "${rtm_root}/cmake")

set(LINUX_PACKAGE_GENERATOR "DEB")
#set(LINUX_PACKAGE_GENERATOR "RPM")

#setting for OpenHRI
set(SRC_DIRS "${PROJECT_SOURCE_DIR}/../../src")

ADD_DEFINITIONS(-DPACKAGE="${PACKAGE}" -DLOCALEDIR="${LOCALEDIR}")

# component settings
set(RTC_NAME "${PROJECT_NAME}")
set(RTC_VERSION "1.0.0")
set(RTC_VERSION_MAJOR "1")
set(RTC_VERSION_MINOR "0")
set(RTC_VERSION_PATCH "0")
set(RTC_LANG "c++")
set(RTC_DESCRIPTION "Channnel selector module")
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
