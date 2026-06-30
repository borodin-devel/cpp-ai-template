# Dependencies

Dependency policy lives in `cmake/Dependencies.cmake`. Keep dependency versions, hashes, and fetch-control options there.

## Policy

- Prefer system packages first.
- Use `FetchContent` only as a fallback.
- Keep fallback downloads controlled by an explicit option.
- Keep dependency resolution in focused `cmake/*.cmake` modules.

## GoogleTest

Tests use GoogleTest through `GTest::gtest_main`.

Resolution order:

1. `find_package(GTest QUIET)`
2. Fetch GoogleTest with `FetchContent` if it is not available locally.

Current version and archive hash are defined in `cmake/Dependencies.cmake`:

- `CPP_AI_TEMPLATE_GOOGLETEST_VERSION`
- `CPP_AI_TEMPLATE_GOOGLETEST_SHA256`

## Disable Network Fetches

To require a system-provided GoogleTest package:

```sh
cmake --preset debug -DCPP_AI_TEMPLATE_ALLOW_FETCHCONTENT=OFF
```

If GoogleTest is not installed, CMake will fail during configure with a dependency error.

## Failure Notes

- URL, version, and hash mismatches are project dependency configuration issues.
- Connection failures are environment or network issues.
- Failures under `build/*/_deps/` usually come from third-party dependency configuration or build steps.
