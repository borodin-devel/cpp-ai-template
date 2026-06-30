# Validation

Use the smallest validation level that proves the change. Broaden validation when a change touches shared behavior, build logic, dependencies, or tests.

## Levels

### Syntax

Use for file-format-only changes.

```sh
python3 -m json.tool CMakePresets.json
```

### Configure

Use after CMake, dependency, preset, or toolchain changes.

```sh
cmake --preset debug
```

### Build

Use after source, header, CMake, or warning-policy changes.

```sh
cmake --build --preset debug
```

### Test

Use after behavior, tests, dependencies, or target wiring changes.

```sh
ctest --preset debug
```

### Sanitizers

Use when memory safety, undefined behavior, ownership, or low-level code changes.

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

Agent helper:

```sh
.agents/scripts/sanitize.sh
```

## Common Full Check

```sh
cmake --preset debug
cmake --build --preset debug
ctest --preset debug
```

Agent helper:

```sh
.agents/scripts/check.sh
```

Bootstrap after clone or clean:

```sh
.agents/scripts/bootstrap.sh
```

## Formatting

```sh
clang-format -i include/cpp_ai_template/*.hpp src/*.cpp examples/app/*.cpp tests/*.cpp
```

## Static Analysis

```sh
clang-tidy src/version.cpp -- -Iinclude -std=c++17
```

## Failure Interpretation

- Missing tools such as `cmake`, `ninja`, `clang-format`, or `clang-tidy` are environment failures.
- Dependency download failures are network/dependency failures unless a CMake change caused the wrong URL, version, or hash.
- Failures under `build/*/_deps/` usually belong to third-party dependency resolution.
- Project target failures usually mention `cpp_ai_template`, `cpp_ai_template_app`, or `cpp_ai_template_tests`.
- If configure and build run at the same time against one build directory, rerun sequentially before treating the result as a project failure.
