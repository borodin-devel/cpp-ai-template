# Dependencies

Dependency policy lives in `cmake/Dependencies.cmake`. Keep dependency versions, hashes, and fetch-control options there.

## Policy

- Default to installed packages when available, then FetchContent for template consistency.
- Keep explicit modes for system packages, FetchContent, and auto-detect-then-fetch.
- Keep dependency resolution in focused `cmake/*.cmake` modules.

## GoogleTest

Tests use GoogleTest through `GTest::gtest_main`.

Provider modes:

- `auto`: use an installed package if CMake can find one; otherwise fetch the pinned archive. This is the default.
- `fetchcontent`: fetch the pinned GoogleTest archive.
- `package`: require an installed system/package-manager GoogleTest package.

Current version and archive hash are defined in `cmake/Dependencies.cmake`:

- `CPP_AI_TEMPLATE_GOOGLETEST_VERSION`
- `CPP_AI_TEMPLATE_GOOGLETEST_SHA256`
- `CPP_AI_TEMPLATE_GOOGLETEST_PROVIDER`
- `CPP_AI_TEMPLATE_ALLOW_FETCHCONTENT`

## Check Installed Dependencies

Use the dependency helper to inspect local tools and whether system GoogleTest is visible to CMake:

```sh
.agents/scripts/deps.sh
```

The helper uses `build/dependency-check/` so it does not alter the main debug, release, or sanitizer build caches.

## Select A Provider

Default auto-detect mode:

```sh
cmake --preset debug -DCPP_AI_TEMPLATE_GOOGLETEST_PROVIDER=auto
```

Always use the pinned FetchContent dependency:

```sh
cmake --preset debug -DCPP_AI_TEMPLATE_GOOGLETEST_PROVIDER=fetchcontent
```

## Require System Packages

To require a system-provided GoogleTest package:

```sh
cmake --preset debug -DCPP_AI_TEMPLATE_GOOGLETEST_PROVIDER=package
```

If GoogleTest is not installed, CMake will fail during configure with a dependency error.

Use a pre-downloaded or local GoogleTest source tree with CMake's standard FetchContent override:

```sh
cmake --preset debug \
  -DCPP_AI_TEMPLATE_GOOGLETEST_PROVIDER=fetchcontent \
  -DFETCHCONTENT_SOURCE_DIR_GOOGLETEST=/path/to/googletest
```

Disable all FetchContent fallback paths:

```sh
cmake --preset debug -DCPP_AI_TEMPLATE_ALLOW_FETCHCONTENT=OFF
```

## Failure Notes

- URL, version, and hash mismatches are project dependency configuration issues.
- Connection failures are environment or network issues.
- Failures under `build/*/_deps/` usually come from third-party dependency configuration or build steps.
