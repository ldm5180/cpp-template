#include <catch.hpp>

#include "simplelib/simple.hpp"

TEST_CASE("Simple", "[simple]") {
  SECTION("has default value") { REQUIRE(0 == LibSimple::Simple{}.value()); }

  SECTION("has initialized value") {
    REQUIRE(42 == LibSimple::Simple(42).value());
  }
}
