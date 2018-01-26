North Denver Metro C++ Meetup's Coding Dojo: Advent of Code 2017
https://adventofcode.com/

# Build

Compiles debug mode by default.

To build and run unit tests:

```
mkdir build
cd build
cmake ../cpp-template
make
```

To build an optimized version:
```
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ../cpp-template
make
```

Binary is located in the build directory under the version you build:
release or debug.

GUnit/GoogleTest is enabled by default. Switch to catch in the file
`test/CMakeLists.txt`.