# Testing

Tests use GoogleTest and CTest. Test files live under `tests/` and are built into `cpp_ai_template_tests`.

## Run Tests

Use the debug configure, build, and test commands from `docs/TOOL_RULES/README.md`.

## Add A Test

Create a file under `tests/` with the suffix `_test.cpp`.

Example:

```cpp
#include "cpp_ai_template/version.hpp"

#include <gtest/gtest.h>

TEST(VersionTest, ReturnsProjectVersion) {
  EXPECT_FALSE(cpp_ai_template::version().empty());
}
```

Add the file to `cpp_ai_template_tests` in `CMakeLists.txt`:

```cmake
add_executable(cpp_ai_template_tests tests/version_test.cpp)
```

If there are multiple files, prefer `target_sources` or a short explicit source list over broad globbing.

## Test Discovery

`CMakeLists.txt` uses:

```cmake
include(GoogleTest)
gtest_discover_tests(cpp_ai_template_tests)
```

CTest discovers GoogleTest cases from the built test executable.

## Sanitizer Tests

Use `docs/VALIDATION.md` and `docs/TOOL_RULES/README.md` for sanitizer validation commands.

## Failure Notes

- A compile failure in `cpp_ai_template_tests` is usually a project or test issue.
- A failure under `build/*/_deps/` is usually dependency-related.
- If CTest reports no tests, check that the test executable built and `gtest_discover_tests` ran.
