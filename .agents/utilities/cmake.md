# CMake Utility

Use this file for CMake, CTest, dependency, validation, and local failure guidance.

## Targets

- `cpp_ai_template`: main C++17 library.
- `cpp_ai_template::cpp_ai_template`: public alias for the library.
- `cpp_ai_template_app`: example executable.
- `cpp_ai_template_tests`: GoogleTest executable, enabled when `BUILD_TESTING=ON`.

## Presets

Configure, build, and test the debug preset:

```sh
cmake --preset debug
cmake --build --preset debug
ctest --preset debug
```

Discover and configure other presets:

```sh
cmake --list-presets
cmake --preset release
cmake --preset relwithdebinfo
cmake --preset asan
cmake --preset ubsan
```

Run sanitizer validation:

```sh
.agents/scripts/sanitize.sh
```

`sanitize.sh` disables LeakSanitizer leak detection with `detect_leaks=0` so AddressSanitizer validation can run in ptrace-backed agent sandboxes. Run `cmake --preset asan`, `cmake --build --preset asan`, and `ctest --preset asan` manually outside those sandboxes when leak detection itself is the validation target.

## Modules

- `cmake/ProjectOptions.cmake`: project-wide C++ defaults.
- `cmake/Dependencies.cmake`: dependency policy, versions, hashes, and FetchContent control.
- `cmake/GoogleTest.cmake`: GoogleTest resolution.
- `cmake/Warnings.cmake`: compiler warning options and warnings-as-errors control.
- `cmake/Sanitizers.cmake`: AddressSanitizer and UndefinedBehaviorSanitizer target options.
- `cmake/Packaging.cmake`: install/export/package scaffold.
- `cmake/version_config.hpp.in`: generated C++ version header template sourced from `project(VERSION ...)`.
- `cmake/cpp_ai_templateConfig.cmake.in`: package config template.

## Options

- `BUILD_TESTING`: enables test targets through CTest.
- `CPP_AI_TEMPLATE_GOOGLETEST_PROVIDER`: selects `fetchcontent`, `package`, or `auto`.
- `CPP_AI_TEMPLATE_ALLOW_FETCHCONTENT`: enables or disables FetchContent dependency paths.
- `CPP_AI_TEMPLATE_GOOGLETEST_VERSION`: selected GoogleTest release version.
- `CPP_AI_TEMPLATE_GOOGLETEST_SHA256`: expected GoogleTest release archive hash.
- `CPP_AI_TEMPLATE_WARNINGS_AS_ERRORS`: treats project target warnings as errors.
- `CPP_AI_TEMPLATE_ENABLE_ASAN`: enables AddressSanitizer for project targets.
- `CPP_AI_TEMPLATE_ENABLE_UBSAN`: enables UndefinedBehaviorSanitizer for project targets.

## Dependencies

Default GoogleTest provider mode:

```sh
cmake --preset debug -DCPP_AI_TEMPLATE_GOOGLETEST_PROVIDER=auto
```

Pinned FetchContent mode:

```sh
cmake --preset debug -DCPP_AI_TEMPLATE_GOOGLETEST_PROVIDER=fetchcontent
```

Installed package only:

```sh
cmake --preset debug -DCPP_AI_TEMPLATE_GOOGLETEST_PROVIDER=package
```

Disable all FetchContent fallback paths:

```sh
cmake --preset debug -DCPP_AI_TEMPLATE_ALLOW_FETCHCONTENT=OFF
```

Use a local GoogleTest source tree:

```sh
cmake --preset debug \
  -DCPP_AI_TEMPLATE_GOOGLETEST_PROVIDER=fetchcontent \
  -DFETCHCONTENT_SOURCE_DIR_GOOGLETEST=/path/to/googletest
```

Check local dependency visibility:

```sh
.agents/scripts/deps.sh
```

## Testing

Tests use GoogleTest and CTest. Test files live under `tests/` and use the `*_test.cpp` suffix.

Minimal test file shape:

```cpp
#include "cpp_ai_template/version.hpp"

#include <gtest/gtest.h>

TEST(VersionTest, ReturnsProjectVersion) {
  EXPECT_FALSE(cpp_ai_template::version().empty());
}
```

Add test files explicitly to `cpp_ai_template_tests` in `CMakeLists.txt`; prefer an explicit source list over broad globbing.

## Validation Levels

- Syntax: file-format-only changes, such as JSON or Markdown structure checks.
- Configure: CMake, dependency, preset, or toolchain changes.
- Build: source, header, CMake, or warning-policy changes.
- Test: behavior, tests, dependencies, or target wiring changes.
- Sanitizers: memory-safety, undefined-behavior, ownership, or low-level changes.

Start with the smallest validation that proves the change. Broaden when changes touch shared behavior, build logic, dependencies, target wiring, tests, or low-level code.

## Failure Classification

- Missing `cmake`, `ninja`, `c++`, `clang-format`, or `clang-tidy`: environment issue.
- Ninja preset failure because Ninja is missing: environment issue; do not change presets.
- Connection failure while downloading GoogleTest: network or proxy issue.
- GoogleTest SHA256 mismatch: dependency configuration issue.
- Failures under `build/*/_deps/`: usually third-party dependency resolution or dependency build issue.
- Compile failure in `cpp_ai_template_tests`: usually project or test issue.
- CTest reports no tests: check that `cpp_ai_template_tests` built and `gtest_discover_tests` ran.

Do not run configure and build at the same time against the same build directory.
