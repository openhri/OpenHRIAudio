#
# CMake for WavPlayer Component
#

cmake_minimum_required(VERSION 2.8 FATAL_ERROR)

project(WebRTCVAD)

#file(TO_CMAKE_PATH $ENV{RTM_ROOT} rtm_root)

set(CMAKE_ALLOW_LOOSE_LOOP_CONSTRUCTS true)
set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/../cmake" "${PROJECT_SOURCE_DIR}/cmake_modules")


set(LINUX_PACKAGE_GENERATOR "DEB")
#set(LINUX_PACKAGE_GENERATOR "RPM")

#setting  for OpenHRI

set(SRC_DIRS 
   ${PROJECT_SOURCE_DIR}/../../src)
set(VAD_DIR ${PROJECT_SOURCE_DIR}/../../src/thirdparty/webrtc/common_audio/vad )
set(SP_DIR ${PROJECT_SOURCE_DIR}/../../src/thirdparty/webrtc/common_audio/signal_processing )

set(VAD_SRCS 
   "${VAD_DIR}/vad_filterbank.c"	
   "${VAD_DIR}/vad_core.c"
   "${VAD_DIR}/vad_gmm.c"
   "${VAD_DIR}/vad_sp.c"
   "${VAD_DIR}/webrtc_vad.c" )

set(SP_SRCS 
   "${SP_DIR}/division_operations.c"
   "${SP_DIR}/energy.c"
   "${SP_DIR}/get_scaling_square.c")

list(APPEND INCLUDE_DIRS 
   "${PROJECT_SOURCE_DIR}/../../src/thirdparty/webrtc"
   "${PROJECT_SOURCE_DIR}/../../src/thirdparty/webrtc/common_audio/vad"
   "${PROJECT_SOURCE_DIR}/../../src/thirdparty/webrtc/common_audio/vad/include"
   "${PROJECT_SOURCE_DIR}/../../src/thirdparty/webrtc/common_audio/signal_processing/include"
)

# component settings
set(RTC_NAME "${PROJECT_NAME}")
set(RTC_VERSION "1.0.0")
set(RTC_LANG "c++")
set(RTC_DESCRIPTION "Sound play Module by using SndFile Library")
set(RTC_VENDOR "AIST")
set(RTC_MAINTAINER "openrtp@m.aist.go.jp")


string(TOLOWER ${RTC_NAME} PACKAGE_NAME)
set(PACKAGE_VERSION "${RTC_VERSION_MAJOR}.${RTC_VERSION_MINOR}.${RTC_VERSION_PATCH}")

set(LIBS_SRCS ${SRC_DIRS}/${PROJECT_NAME}.cpp ${VAD_SRCS} ${SP_SRCS})

set(LIBS_INCS ${SRC_DIRS}/${PROJECT_NAME}.h )

set(EXEC_SRCS ${SRC_DIRS}/${PROJECT_NAME}Comp.cpp)

set(OTHER_SRCS CMakeLists.txt Doxyfile.in
               ${PROJECT_NAME}.conf rtc.conf)

include(RTC)
