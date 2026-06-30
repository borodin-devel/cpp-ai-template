# Project Layout

This repository is a C++17 template for local AI-assisted development. Prefer reading local files before asking for broad context.

## Where To Look First

- `README.md`: project summary and quick-start commands.
- `CMakeLists.txt`: target graph and top-level build behavior.
- `CMakePresets.json`: supported configure, build, and test presets.
- `cmake/`: reusable CMake policy modules.
- `.vscode/README.md`: VS Code workspace conventions.
- `.clang-format` and `.clang-tidy`: formatting and static-analysis rules.

## Directories

- `include/cpp_ai_template/`: public library headers.
- `src/`: library implementation files.
- `examples/`: runnable example applications.
- `tests/`: GoogleTest-based tests.
- `cmake/`: focused CMake modules for dependencies, options, warnings, sanitizers, and packaging.
- `docs/`: human and agent-readable project documentation.
- `.vscode/`: portable VS Code workspace defaults.
- `.agents/`: reserved for local multiagent role definitions and workflows.
- `.codex/`: reserved for local Codex-specific guidance and assets.

## Naming

- CMake project: `cpp_ai_template`.
- Main library target: `cpp_ai_template`.
- Public alias target: `cpp_ai_template::cpp_ai_template`.
- Example executable: `cpp_ai_template_app`.
- Test executable: `cpp_ai_template_tests`.
- C++ namespace: `cpp_ai_template`.
- Header files: `include/cpp_ai_template/*.hpp`.
- Source files: `src/*.cpp`.
- Test files: `tests/*_test.cpp`.

## Conventions

- Keep reusable build behavior in `cmake/*.cmake` instead of expanding `CMakeLists.txt`.
- Keep generated files under `build/` or another ignored build directory.
- Keep AI-agent behavior in repository files such as `.agents/`, `.codex/`, and `docs/`, not in editor-specific integration.
- Prefer CMake presets over ad hoc configure/build commands.
