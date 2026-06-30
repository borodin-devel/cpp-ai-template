# Agent Scripts

Run scripts from anywhere inside the repository. Each script resolves the repository root before executing.

## Default

Use this for the standard full check:

```sh
.agents/scripts/check.sh
```

It verifies formatting, runs lint, configures, builds, and tests the debug preset.

## Read-Only Checks

- `check.sh`: verifies formatting, runs lint, then runs validation.
- `context.sh`: prints an on-demand Markdown context snapshot.
- `deps.sh`: checks local tool versions and whether a system GoogleTest package is visible to CMake.
- `lint.sh`: refreshes the debug preset, then runs `clang-tidy` on tracked C++ source files.
- `validate.sh`: runs debug configure, build, and tests.
- `sanitize.sh`: runs ASAN and UBSAN configure, build, and tests.
- `bootstrap.sh`: prints tool versions, then runs debug configure, build, and tests.

These scripts may create or update files under ignored build directories such as `build/`.

## Modifies Source Files

- `format.sh`: formats tracked C/C++ files with `clang-format -i`.

## Removes Generated Files

- `clean.sh`: removes `build/`, `out/`, and `cmake-build-*`.

## Network Notes

Configure steps may download GoogleTest through CMake `FetchContent` when no system `GTest` package is available. Network failures during dependency download should be classified separately from project source failures.
