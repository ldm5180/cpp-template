#include <catch.hpp>

#include "01.hpp"

using namespace aoc;

TEST_CASE("AOC 2017: 01", "[01]") {
  SECTION("compute captcha example 1") { REQUIRE(3 == captcha("1122")); }

  SECTION("compute captcha example 2") { REQUIRE(4 == captcha("1111")); }

  SECTION("compute captcha example 3") { REQUIRE(0 == captcha("1234")); }

  SECTION("compute captcha example 4") { REQUIRE(9 == captcha("91212129")); }
}
