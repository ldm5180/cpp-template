#include <catch.hpp>

#include "num_gen/num_gen.hpp"

TEST_CASE("Num Gen", "[numgen]") {
  NumGen sut{};

  SECTION("start with 0") { REQUIRE(0 == sut()); }

  SECTION("increment") {
    REQUIRE(0 == sut());
    REQUIRE(1 == sut());
    REQUIRE(2 == sut());
  }
}
