# Agent Conventions

This file owns shared repository conventions. Link here instead of repeating these rules elsewhere.

## Project Layout

- Public headers live in `include/cpp_ai_template/`.
- Library implementation files live in `src/`.
- Example programs live in `examples/`.
- GoogleTest tests live in `tests/` and use the `*_test.cpp` suffix.
- Reusable CMake logic lives in focused `cmake/*.cmake` modules.
- Local multiagent guidance lives in `.agents/`.
- Codex-specific configuration lives in `.codex/`.
- Portable VS Code workspace defaults live in `.vscode/`.

## Names

- CMake project: `cpp_ai_template`.
- Main library target: `cpp_ai_template`.
- Public alias target: `cpp_ai_template::cpp_ai_template`.
- Example executable: `cpp_ai_template_app`.
- Test executable: `cpp_ai_template_tests`.
- C++ namespace: `cpp_ai_template`.
- Header files: `include/cpp_ai_template/*.hpp`.
- Source files: `src/*.cpp`.
- Test files: `tests/*_test.cpp`.

## C++ Style

Use `.clang-format` as formatting source of truth and `.clang-tidy` as static-analysis and naming source of truth.

To inspect the current style:

```sh
sed -n '1,220p' .clang-format
sed -n '1,260p' .clang-tidy
```

Current C++ style:

- C++17.
- LLVM-based formatting.
- 2-space indentation.
- 120-column limit.
- Attached braces.
- Case-sensitive sorted includes.
- `#pragma once` headers.
- Lower-case namespaces.
- CamelCase classes, structs, and enums.
- Lower-case functions and variables.
- Trailing underscores for private and protected members.

Format changed C and C++ files through:

```sh
.agents/scripts/format.sh
```

Run static analysis through:

```sh
.agents/scripts/lint.sh
```

## Comments

- Prefer clear code and names over explanatory comments.
- Add comments for non-obvious rationale, invariants, ownership, lifetimes, platform constraints, or dependency behavior.
- Do not write comments that restate the next line of code.
- Keep public API comments concise and behavior-focused.
- Keep Markdown comments out of generated examples unless they are part of the example.

## CMake

- Use CMake presets instead of ad hoc build directories.
- Keep `CMakeLists.txt` target-focused.
- Put reusable build behavior in focused `cmake/*.cmake` modules.
- Prefer target-local properties and options over global compile flags.
- Prefix project options with `CPP_AI_TEMPLATE_`.
- Do not run configure and build concurrently against the same build directory.

Detailed command and failure guidance lives in `.agents/utilities/cmake.md`.

## Dependencies

- Dependency policy lives in `cmake/Dependencies.cmake`.
- GoogleTest resolution lives in `cmake/GoogleTest.cmake`.
- Do not change versions, URLs, hashes, or provider defaults unless the task explicitly requires a dependency-policy change.
- Use `.agents/scripts/deps.sh` to inspect tool versions and GoogleTest provider availability.

## Generated And Local Files

- Do not commit generated files or local runtime state.
- Ignored generated paths include `build/`, `out/`, `cmake-build-*`, `.serena/`, and `.cocoindex_code/`.
- Use `.agents/scripts/clean.sh` to remove common generated build directories only when cleanup is requested or needed.

## Documentation

- Keep documentation concise and operational.
- Prefer exact commands and local file links over long prose.
- Document implemented behavior only.
- Do not duplicate command catalogs, layout rules, dependency policy, or validation levels.
- `README.md` files describe directory contents for humans. Put agent workflow instructions in `SKILL.md`.

## Agent And Editor Boundaries

- Tool-neutral AI-agent behavior belongs in `AGENTS.md` and `.agents/`.
- Subagent behavior belongs under `.agents/subagents/<name>/SKILL.md`.
- Helper-script behavior belongs in `.agents/scripts/README.md` and the scripts themselves.
- Codex-specific Markdown belongs in `.codex/README.md`; Codex MCP configuration remains in `.codex/config.toml`.
- `.vscode/` is limited to portable editor defaults and recommendations.
- Do not modify repository files based only on extensions or settings installed on one local machine.
- Do not modify `.agents/skills/caveman*` or `.agents/skills/cavecrew` unless the user explicitly asks for those folders.
