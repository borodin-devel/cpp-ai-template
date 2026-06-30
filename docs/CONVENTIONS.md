# Shared Conventions

This file owns rules that apply across the repository. Other documents should link here instead of restating these rules.

## C++ Layout And Naming

- Public headers live in `include/cpp_ai_template/`.
- Library implementation files live in `src/`.
- Example programs live in `examples/`.
- GoogleTest tests live in `tests/` and use the `*_test.cpp` suffix.
- Project C++ code uses the `cpp_ai_template` namespace.
- Headers use `#pragma once`.

Detailed target and directory names are in `docs/PROJECT_LAYOUT.md`.

## CMake

- Use CMake presets instead of ad hoc build directories.
- Keep `CMakeLists.txt` target-focused.
- Put reusable build behavior in focused `cmake/*.cmake` modules.
- Prefer target-local properties and options over global compile flags.
- Prefix project options with `CPP_AI_TEMPLATE_`.

Detailed CMake reference is in `docs/CMAKE.md`.

## Dependencies

- Dependency policy lives in `cmake/Dependencies.cmake`.
- Dependency usage and provider modes are documented in `docs/DEPENDENCIES.md`.
- Do not change versions, URLs, hashes, or provider defaults unless the task explicitly requires a dependency-policy change.

## Generated And Local Files

- Do not commit generated files or local runtime state.
- Ignored generated paths include `build/`, `out/`, `cmake-build-*`, `.serena/`, and `.cocoindex_code/`.
- Use `.agents/scripts/clean.sh` to remove common generated build directories.

## Agent And Editor Boundaries

- Tool-neutral AI-agent behavior belongs in `AGENTS.md`, `.agents/`, or `docs/`.
- Callable-program rules belong in `docs/TOOL_RULES/`.
- Codex-specific Markdown belongs in `.codex/README.md`; Codex MCP configuration remains in `.codex/config.toml`.
- `.vscode/` is limited to portable editor defaults and recommendations.
- Do not modify repository files based only on extensions or settings installed on one local machine.

## Style Configuration

- Formatting source of truth: `.clang-format`.
- Static-analysis and C++ naming source of truth: `.clang-tidy`.
- Format changed C++ files with `.agents/scripts/format.sh`.
- Current C++ style is LLVM-based C++17 with 2-space indentation, a 120-column limit, attached braces, sorted includes, and `#pragma once` headers.
- Current naming conventions are lower-case namespaces, CamelCase classes/structs/enums, lower-case functions and variables, and trailing underscores for private/protected members.

## Documentation

- Keep documentation concise and operational.
- Prefer exact commands and local file links over long prose.
- Avoid duplicating command catalogs, layout rules, dependency policy, or validation levels.
- Document implemented behavior only.
