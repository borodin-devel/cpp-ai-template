# Troubleshooting

Use this guide to classify common local failures before changing project files.

## Missing Tool

Check tools:

```sh
cmake --version
ninja --version
c++ --version
clang-format --version
clang-tidy --version
```

If a command is missing, treat it as an environment issue.

## Ninja Preset Fails

Symptom:

```text
CMake was unable to find a build program corresponding to "Ninja"
```

Check:

```sh
command -v ninja
ninja --version
```

The presets intentionally use Ninja. Do not change presets based only on one machine missing Ninja.

## GoogleTest Download Fails

Check dependency visibility first:

```sh
.agents/scripts/deps.sh
```

Check:

```sh
cmake --preset debug
```

Failure classes:

- Connection failure: network or proxy issue.
- SHA256 mismatch: dependency version/hash configuration issue.
- Failure under `build/*/_deps/`: likely third-party dependency resolution or build issue.

Dependency policy is documented in `docs/DEPENDENCIES.md`.

## Disable Dependency Downloads

Require system GoogleTest:

```sh
cmake --preset debug -DCPP_AI_TEMPLATE_GOOGLETEST_PROVIDER=package
```

If GoogleTest is not installed, configure should fail with a dependency error.

Restore default fetch behavior:

```sh
cmake --preset debug -DCPP_AI_TEMPLATE_GOOGLETEST_PROVIDER=auto -DCPP_AI_TEMPLATE_ALLOW_FETCHCONTENT=ON
```

Force the pinned FetchContent archive:

```sh
cmake --preset debug -DCPP_AI_TEMPLATE_GOOGLETEST_PROVIDER=fetchcontent
```

## No Tests Discovered

Check:

```sh
cmake --build --preset debug
ctest --preset debug
```

Then inspect:

- `CMakeLists.txt`
- `tests/*_test.cpp`
- `gtest_discover_tests(cpp_ai_template_tests)`

## Concurrent Configure And Build

Do not run configure and build at the same time against the same build directory. If results look inconsistent, rerun sequentially:

```sh
cmake --preset debug
cmake --build --preset debug
ctest --preset debug
```

## VS Code Warnings

Some `.vscode` values are contributed by recommended extensions. VS Code can warn about those values until the extension is installed and enabled.

Do not modify repository files based only on extensions installed on one local machine. Keep extension-dependent settings explicit in `.vscode/extensions.json`.

## Generated Files Show Up In Git

Check:

```sh
git status --short
```

Generated build files should stay under ignored directories such as `build/`, `out/`, or `cmake-build-*`.
