#include <gtest/gtest.h>

#include "cpp_ai_template/version.hpp"

TEST(VersionTest, ReturnsProjectVersion) {
  EXPECT_EQ(cpp_ai_template::version(), "0.1.0");
}
