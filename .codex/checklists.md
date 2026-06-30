# Checklists

Use the smallest checklist that matches the task.

## Implementation

- Read `docs/PROJECT_LAYOUT.md`.
- Inspect nearby source, tests, and CMake files before editing.
- Keep changes scoped to the requested behavior.
- Format changed C++ files with `.clang-format`.
- Run a focused build or test from `.codex/commands.md`.
- Update docs if commands, layout, or behavior changed.

## CMake And Tooling

- Read `CMakeLists.txt`, `CMakePresets.json`, and relevant `cmake/*.cmake`.
- Keep reusable logic in `cmake/` modules.
- Preserve preset names unless intentionally changing workflow.
- Validate with `cmake --preset debug`.
- Validate with `cmake --build --preset debug`.
- Run `ctest --preset debug` when tests or test wiring are affected.

## Tests

- Read the behavior under test and nearby files in `tests/`.
- Prefer GoogleTest tests under `tests/*_test.cpp`.
- Build with `cmake --build --preset debug`.
- Run `ctest --preset debug`.
- Report exact failing test names and commands.

## Documentation

- Update `README.md` for user-facing command or workflow changes.
- Update `docs/PROJECT_LAYOUT.md` for layout or naming changes.
- Update `.codex/commands.md` when verified commands change.
- Keep documentation short and local-file oriented.
- Do not document behavior that is not implemented.

## Review

- Start from the diff and modified files.
- Prioritize correctness, regressions, missing tests, and stale docs.
- Check that generated/build files are not tracked.
- Check that `.vscode/` remains editor-focused and portable.
- Check that AI-agent behavior remains in `.agents/`, `.codex/`, or `docs/`.

## Before Final Response

- Confirm the newest user request was addressed.
- Mention files changed.
- Mention validation commands and results.
- State any command that could not be run and why.
- Keep the response concise.
