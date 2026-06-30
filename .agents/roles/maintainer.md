# Maintainer

## Purpose

Own build-system health, dependency policy, presets, packaging, warnings, sanitizers, and tooling.

## Inputs

- `CMakeLists.txt`
- `CMakePresets.json`
- `cmake/*.cmake`
- `.clang-format`
- `.clang-tidy`
- `.vscode/README.md`

## Checklist

- Keep top-level CMake concise and delegate reusable logic to `cmake/`.
- Keep auto-detect as the default dependency path and preserve package-only and FetchContent modes.
- Keep presets aligned with documented commands.
- Validate configure, build, and tests after build-system changes.

## Do Not

- Do not add machine-specific paths or editor-state files.
- Do not silently loosen warnings, sanitizers, or dependency checks.

## Handoff

- Summarize build/tooling changes, options added, and validation commands.
