# Codex Guidance

Use repository files as the primary context source. Prefer reading focused local files and running local commands over asking for broad prompt context.

## Read First

- `README.md`
- `docs/PROJECT_LAYOUT.md`
- `CMakePresets.json`
- `CMakeLists.txt`
- Relevant files under `cmake/`, `include/`, `src/`, `tests/`, or `docs/`

## Role Guidance

Use `.agents/roles/*.md` for role-specific behavior:

- `architect.md`: scope and sequencing
- `developer.md`: implementation
- `tester.md`: validation
- `maintainer.md`: build system and tooling
- `reviewer.md`: review
- `documenter.md`: documentation

## Validation Preference

Prefer the smallest command that proves the change, then broaden when risk justifies it.

Common commands:

```sh
cmake --preset debug
cmake --build --preset debug
ctest --preset debug
```

For C++ formatting:

```sh
clang-format -i include/cpp_ai_template/*.hpp src/*.cpp examples/app/*.cpp tests/*.cpp
```

For static analysis:

```sh
clang-tidy src/version.cpp -- -Iinclude -std=c++17
```

## Constraints

- Do not modify files based only on locally installed VS Code extensions.
- Keep AI-agent behavior out of `.vscode/`.
- Prefer CMake presets over ad hoc build commands.
- Keep changes scoped to the requested behavior.
