# Contributing

This repository is designed for local, AI-assisted C++ development. Keep changes small, validated, and easy to inspect from files.

## Workflow

Use plain Git workflow:

```sh
git status
git diff
git add <files>
git commit
```

Prefer focused commits that group one logical change. Do not commit generated build outputs.

## Before Editing

- Read `README.md`.
- Read `docs/PROJECT_LAYOUT.md`.
- For build or dependency changes, read the relevant files under `cmake/`.
- For agent-assisted work, use `.agents/` and `.codex/` guidance.

## Validation

Use `docs/VALIDATION.md` to choose the smallest useful validation level.

Common full check:

```sh
cmake --preset debug
cmake --build --preset debug
ctest --preset debug
```

## Style

- C++ code is formatted with `.clang-format`.
- Static-analysis defaults live in `.clang-tidy`.
- Build behavior belongs in `CMakeLists.txt`, `CMakePresets.json`, and `cmake/*.cmake`.
- Editor defaults under `.vscode/` must stay portable.

## AI-Agent Guidance

- Keep reusable agent behavior in `.agents/`, `.codex/`, or `docs/`.
- Do not encode AI-agent behavior in `.vscode/`.
- Prefer local files and command output over repeated prompt context.
- Do not modify files based only on extensions installed on one local machine.
