#include <string_view>

#include <gtest/gtest.h>

#include "cpp_ai_template/version.hpp"

#ifndef CPP_AI_TEMPLATE_EXPECTED_VERSION
#error "CPP_AI_TEMPLATE_EXPECTED_VERSION must be provided by CMake"
#endif

TEST(VersionTest, ReturnsProjectVersion) {
  EXPECT_EQ(cpp_ai_template::version(), std::string_view{CPP_AI_TEMPLATE_EXPECTED_VERSION});
}
