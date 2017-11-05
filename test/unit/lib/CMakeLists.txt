set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/share/${PROJECT_NAME})

add_executable(lib_unit_test simplelib.cpp)
add_unit_test(LibUnitTests lib_unit_test simple)

add_executable(header_only_unit_test header_only.cpp num_gen.cpp)
add_unit_test(HeaderOnlyUnitTests header_only_unit_test)
