# Command Index

Use these commands from the repository root.

## Configure

```sh
cmake --preset debug
```

Expected: CMake configures `build/debug` with Ninja.

Failure notes:

- Missing Ninja means the system lacks the preset generator.
- GoogleTest download failures are dependency/network failures unless source changes caused them.

## Build

```sh
cmake --build --preset debug
```

Expected: builds `cpp_ai_template`, `cpp_ai_template_app`, and `cpp_ai_template_tests`.

Failure notes:

- Compiler warnings may indicate project issues because project targets use warning flags.
- Dependency build failures under `build/debug/_deps/` should be separated from project target failures.

## Test

```sh
ctest --preset debug
```

Expected: all discovered GoogleTest tests pass.

Failure notes:

- If no tests are discovered, check `gtest_discover_tests` and whether `cpp_ai_template_tests` built.

## Run Example

```sh
./build/debug/cpp_ai_template_app
```

Expected: prints `cpp_ai_template 0.1.0`.

## Format

```sh
clang-format -i include/cpp_ai_template/*.hpp src/*.cpp examples/app/*.cpp tests/*.cpp
```

Expected: C++ files are formatted according to `.clang-format`.

Failure notes:

- Missing `clang-format` is a toolchain issue, not a source issue.

## Static Analysis

```sh
clang-tidy src/version.cpp -- -Iinclude -std=c++17
```

Expected: clang-tidy runs with repository `.clang-tidy` defaults.

Failure notes:

- Missing `clang-tidy` is a toolchain issue.
- Some warnings may be advisory unless the build enables warnings-as-errors.

## Preset Discovery

```sh
cmake --list-presets
```

Expected: lists `debug`, `release`, `relwithdebinfo`, `asan`, and `ubsan`.

## Agent Scripts

Run the standard full check:

```sh
.agents/scripts/check.sh
```

Bootstrap after clone or clean:

```sh
.agents/scripts/bootstrap.sh
```

Print an on-demand repository context snapshot:

```sh
.agents/scripts/context.sh
```

Format tracked C++ files:

```sh
.agents/scripts/format.sh
```

Run clang-tidy over tracked C++ source files:

```sh
.agents/scripts/lint.sh
```

Run configure, build, and tests:

```sh
.agents/scripts/validate.sh
```

Run sanitizer validation:

```sh
.agents/scripts/sanitize.sh
```

Remove generated build directories:

```sh
.agents/scripts/clean.sh
```
