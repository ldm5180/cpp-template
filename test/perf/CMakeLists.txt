# Special macro for adding performance tests.
macro(add_perf_test target target_test)
  set(perf_test_targets ${perf_test_targets} ${target_test} PARENT_SCOPE)

  add_custom_target(all_${target_test} ALL DEPENDS run_${target_test})
  add_custom_target(run_${target_test} DEPENDS ${target_test}.passed)

  # Change format of output by adding options here, like this...
  #set(benchmark_options "--benchmark_out=${CMAKE_SOURCE_DIR}/test/perf/outputs/${target_test}.csv" "--benchmark_out_format=csv")
  
  add_custom_command(OUTPUT ${target_test}.passed
    PRE_BUILD COMMAND ${target_test} ${benchmark_options}
    COMMAND ${CMAKE_COMMAND} -E touch ${target_test}.passed
    DEPENDS ${target_test})
endmacro(add_perf_test)

add_executable(string string.cpp)
target_link_libraries(string benchmark)
add_perf_test(bench_string string)
