# Style

Formatting and static-analysis configuration are source-of-truth files. Use this document as a short reference.

## C++ Formatting

Source of truth: `.clang-format`.

Current defaults:

- LLVM-based style.
- C++17.
- 2-space indentation.
- 120-column limit.
- Attached braces.
- Include sorting enabled.
- `#pragma once` for headers.

Format changed C++ files with:

```sh
clang-format -i include/cpp_ai_template/*.hpp src/*.cpp examples/app/*.cpp tests/*.cpp
```

## C++ Naming

Source of truth: `.clang-tidy`.

Current defaults:

- namespaces: `lower_case`
- classes, structs, enums: `CamelCase`
- functions: `lower_case`
- variables and members: `lower_case`
- private/protected members: trailing underscore
- namespace: `cpp_ai_template`

## CMake Style

- Keep `CMakeLists.txt` target-focused.
- Put reusable logic in `cmake/*.cmake`.
- Prefer target-local properties and options.
- Prefer CMake presets over ad hoc commands.
- Use project option names with the `CPP_AI_TEMPLATE_` prefix.

## Documentation Style

- Keep docs short and operational.
- Prefer local file references over duplicated explanations.
- Include exact commands when they are verified.
- Keep AI-agent behavior in `.agents/`, `.codex/`, and `docs/`.
- Keep `.vscode/` limited to portable editor defaults.
