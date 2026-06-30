# Project Layout

This file owns repository paths, target names, and naming conventions.

## Entry Points

- `README.md`: project purpose, requirements, and quick start.
- `docs/INDEX.md`: documentation navigation and search instructions.
- `CMakeLists.txt`: target graph and top-level build behavior.
- `CMakePresets.json`: supported configure, build, and test presets.

## Directories

- `include/cpp_ai_template/`: public library headers.
- `src/`: library implementation files.
- `examples/`: runnable example applications.
- `tests/`: GoogleTest-based tests.
- `cmake/`: focused CMake modules for dependencies, options, warnings, sanitizers, and packaging.
- `docs/`: human and agent-readable project documentation.
- `.agents/`: local multiagent roles, templates, handoffs, and helper scripts.
- `.codex/`: Codex MCP configuration only.
- `docs/TOOL_RULES/`: callable-program rules for Git, CMake, CTest, formatters, linters, and helper scripts.
- `.codex/README.md`: Codex-specific Markdown guidance.
- `.vscode/`: portable VS Code workspace defaults.

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

## Layout Rules

Shared layout, generated-file, agent-file, and editor-file rules live in `docs/CONVENTIONS.md`.
