# Testing

Tests use GoogleTest and CTest. Test files live under `tests/` and are built into `cpp_ai_template_tests`.

## Run Tests

```sh
cmake --preset debug
cmake --build --preset debug
ctest --preset debug
```

## Add A Test

Create a file under `tests/` with the suffix `_test.cpp`.

Example:

```cpp
#include "cpp_ai_template/version.hpp"

#include <gtest/gtest.h>

TEST(VersionTest, ReturnsProjectVersion) {
  EXPECT_EQ(cpp_ai_template::version(), "0.1.0");
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

Use sanitizer presets for memory-safety and undefined-behavior-sensitive changes:

```sh
cmake --preset asan
cmake --build --preset asan
ctest --preset asan
```

```sh
cmake --preset ubsan
cmake --build --preset ubsan
ctest --preset ubsan
```

## Failure Notes

- A compile failure in `cpp_ai_template_tests` is usually a project or test issue.
- A failure under `build/*/_deps/` is usually dependency-related.
- If CTest reports no tests, check that the test executable built and `gtest_discover_tests` ran.
