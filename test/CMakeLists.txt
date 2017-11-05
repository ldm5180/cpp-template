if ("${uppercase_CMAKE_BUILD_TYPE}" STREQUAL "RELEASE")
  add_subdirectory(perf)
endif()
add_subdirectory(unit)
