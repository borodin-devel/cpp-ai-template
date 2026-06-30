# Tool Rules

This file owns rules for callable programs and local command workflows. Keep project concepts in the topic docs and keep tool-specific agent integrations, such as Codex MCP notes, in the tool's own config area.

## General Command Rules

- Run commands from the repository root unless a script states otherwise.
- Prefer CMake presets and repository scripts over ad hoc build directories or one-off command sequences.
- Use the smallest command that proves the current change, then broaden according to `docs/VALIDATION.md`.
- Classify missing tools, network failures, dependency failures, and project target failures separately.

## CMake And CTest

Core debug workflow:

```sh
cmake --preset debug
cmake --build --preset debug
ctest --preset debug
```

Additional preset discovery and configure commands:

```sh
cmake --list-presets
cmake --preset release
cmake --preset relwithdebinfo
cmake --preset asan
cmake --preset ubsan
```

Rules:

- Do not create undocumented build directories for normal validation.
- Do not run configure and build concurrently against the same build directory.
- Treat missing Ninja as an environment issue, not as a reason to change presets.
- Treat failures under `build/*/_deps/` as third-party dependency-resolution or dependency-build failures unless project changes caused them.

## Git

Inspect worktree state with:

```sh
git status --short
git diff
git diff --staged
```

Rules:

- Prefer focused commits that describe one logical change.
- Do not rewrite unrelated local changes.
- Do not commit generated build outputs or local runtime state.
- Use `git status --ignored --short` when checking ignored generated files.

## Formatting And Static Analysis

```sh
.agents/scripts/format.sh
.agents/scripts/lint.sh
```

Rules:

- Missing `clang-format` or `clang-tidy` is a toolchain issue.
- Format changed C and C++ files through the repository script.
- Run lint after configuring when static-analysis coverage is required.

## Agent Helper Scripts

- `.agents/scripts/bootstrap.sh`: print tool versions, then configure, build, and test the debug preset.
- `.agents/scripts/check.sh`: verify formatting, run lint, then run debug validation.
- `.agents/scripts/clean.sh`: remove `build/`, `out/`, and `cmake-build-*`.
- `.agents/scripts/context.sh`: print a Markdown snapshot of local project context.
- `.agents/scripts/deps.sh`: inspect tool versions and GoogleTest provider availability.
- `.agents/scripts/format.sh`: format tracked C and C++ files with `clang-format -i`.
- `.agents/scripts/lint.sh`: configure debug and run `clang-tidy` on tracked C++ sources.
- `.agents/scripts/sanitize.sh`: configure, build, and test ASAN and UBSAN presets.
- `.agents/scripts/validate.sh`: configure, build, and test the debug preset.

## Run The Example

```sh
./build/debug/cpp_ai_template_app
```

Expected output starts with `cpp_ai_template` followed by the project version.
