#include <catch.hpp>

#include "header_only/header.hpp"

TEST_CASE("Header Only", "[header]") {
  LibHeader::HeaderOnly sut{2, 42};

  SECTION("multiply") { REQUIRE((2 * 42) == sut.mult()); }
  SECTION("add") { REQUIRE((2 + 42) == sut.add()); }
}
