cmake_minimum_required(VERSION 2.8 FATAL_ERROR)

project(OpenHRIAudio)
SUBDIRS(cmake_files)
set(SolutionDir ${PROJECT_SOURCE_DIR})

set(PACKAGE "${project}")
SET(LOCALEDIR "${CMAKE_INSTALL_PREFIX}/share")

IF(NOT EXISTS "${SolutionDir}/bin")
  file(MAKE_DIRECTORY "${SolutionDir}/bin")
ENDIF(NOT EXISTS "${SolutionDir}/bin")
