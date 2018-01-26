cmake_minimum_required(VERSION 2.8)

# Name the project.
project(project-template)

# CMake helper scripts.
set (CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR}/.cmake)

# Setup some common things.
include(build_type)
include(git_hooks)
include(compiler_flags)  

# Testing libraries.
include(gtest)

# Project specific include directories.
include_directories(include)

# Add the directories containing more CMakeLists.
add_subdirectory(src)
add_subdirectory(test)
