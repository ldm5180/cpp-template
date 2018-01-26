include_directories(${CMAKE_SOURCE_DIR}/vendor/catch2/single_include)

# Special macro for adding unit tests.
#   Call this macro with the name of the test you are using, the source
#   files, and any libs that need to be linked.
macro(add_unit_test target_test sources)
  set(target "${target_test}_test")
  add_executable(${target_test} ${CMAKE_SOURCE_DIR}/test/catch/catch_main.cpp ${sources})
  target_link_libraries(${target_test} "${ARGN}")

  set(unit_test_targets ${unit_test_targets} ${target_test} PARENT_SCOPE)

  add_test(${target} ${CMAKE_BINARY_DIR}/share/${PROJECT_NAME}/${target_test})

  add_custom_target(all_${target_test} ALL DEPENDS run_${target_test})
  add_custom_target(run_${target_test} DEPENDS ${target_test}.passed)

  add_custom_command(OUTPUT ${target_test}.passed
    PRE_BUILD COMMAND ${target_test}
    COMMAND ${CMAKE_COMMAND} -E touch ${target_test}.passed
    DEPENDS ${target_test})
endmacro(add_unit_test)

add_unit_test(catch_unit_test 01_test.cpp)
