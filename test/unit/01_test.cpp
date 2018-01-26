#include <GUnit.h>

#include "01.hpp"

using namespace aoc;

GTEST("AOC 2017: 01") {

  SHOULD("compute captcha example 1") { EXPECT_EQ(3, captcha("1122")); }

  SHOULD("compute captcha example 2") { EXPECT_EQ(4, captcha("1111")); }

  SHOULD("compute captcha example 3") { EXPECT_EQ(0, captcha("1234")); }

  SHOULD("compute captcha example 4") { EXPECT_EQ(9, captcha("91212129")); }
}
