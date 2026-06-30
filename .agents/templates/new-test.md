# New Test Template

Use this template when adding tests for existing behavior.

## Inputs

- Behavior under test: `behavior_name`
- Test file: `tests/behavior_name_test.cpp`
- Target under test: `cpp_ai_template::cpp_ai_template`

## Naming

- Test files use `tests/*_test.cpp`.
- Test suites use `CamelCase`, ending in `Test`.
- Test names describe expected behavior.

Example:

```cpp
TEST(VersionTest, ReturnsProjectVersion) {
  EXPECT_FALSE(cpp_ai_template::version().empty());
}
```

## Steps

1. Read the behavior under test.
2. Add or update a GoogleTest file under `tests/`.
3. Update `cpp_ai_template_tests` in `CMakeLists.txt` if a new file was added.
4. Keep tests deterministic and local.
5. Run formatting and validation.

## CMake Wiring

For a new test file, add it to the test executable source list:

```cmake
add_executable(cpp_ai_template_tests tests/version_test.cpp tests/behavior_name_test.cpp)
```

For several files, prefer an explicit list or `target_sources` over broad globbing.

## Validation

```sh
.agents/scripts/format.sh
.agents/scripts/check.sh
```

For low-level or ownership-sensitive behavior:

```sh
.agents/scripts/sanitize.sh
```
