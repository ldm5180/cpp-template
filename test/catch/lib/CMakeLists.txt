set(simplelib_srcs simplelib.cpp)
set(simplelib_libs simple)
add_unit_test(catch_simplelib "${simplelib_srcs}" "${simplelib_libs}")

set(header_only_srcs header_only.cpp num_gen.cpp)
add_unit_test(catch_header_only_lib "${header_only_srcs}")
