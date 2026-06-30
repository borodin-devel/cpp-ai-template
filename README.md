# cpp-ai-template

C++17 project template for local, token-efficient AI-assisted development.

The template keeps build, test, formatting, static-analysis, and editor behavior in repository files so humans and agents can inspect local sources instead of relying on repeated prompt context.

## Requirements

- CMake 3.28 or newer
- Ninja
- C++17 compiler
- VS Code with recommended extensions from `.vscode/extensions.json`
- Optional local tools: `clang-format`, `clang-tidy`

## Quick Start

Configure, build, and test the default debug preset:

```sh
cmake --preset debug
cmake --build --preset debug
ctest --preset debug
```

Run the example app:

```sh
./build/debug/cpp_ai_template_app
```

Other presets:

```sh
cmake --preset release
cmake --preset relwithdebinfo
cmake --preset asan
cmake --preset ubsan
```

Format C++ files:

```sh
clang-format -i include/cpp_ai_template/*.hpp src/*.cpp examples/app/*.cpp tests/*.cpp
```

Run static analysis after configuring:

```sh
clang-tidy src/version.cpp -- -Iinclude -std=c++17
```

## Layout

See `docs/PROJECT_LAYOUT.md` for the repository structure, naming conventions, and where agents should look first.

## AI-Assisted Workflow

AI-agent behavior should live in repository-owned files such as `.agents/`, `.codex/`, and `docs/`. Editor files under `.vscode/` are limited to portable workspace defaults.
