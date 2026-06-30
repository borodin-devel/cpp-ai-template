# Validation

Use the smallest validation level that proves the change. Broaden validation when a change touches shared behavior, build logic, dependencies, target wiring, tests, or low-level code.

Commands and helper-script descriptions live in `docs/TOOL_RULES/README.md`.

## Levels

- Syntax: file-format-only changes, such as JSON or Markdown structure checks.
- Configure: CMake, dependency, preset, or toolchain changes.
- Build: source, header, CMake, or warning-policy changes.
- Test: behavior, tests, dependencies, or target wiring changes.
- Sanitizers: memory-safety, undefined-behavior, ownership, or other low-level changes.

## Recommended Commands

```sh
cmake --preset debug
cmake --build --preset debug
ctest --preset debug
```

For all standard local checks:

```sh
.agents/scripts/check.sh
```

For sanitizer validation:

```sh
.agents/scripts/sanitize.sh
```

## Failure Classification

Use `docs/TOOL_RULES/README.md` for shared failure notes and `docs/TROUBLESHOOTING.md` for detailed diagnosis.
