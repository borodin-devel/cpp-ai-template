# AGENTS.md

Scope: this file applies to the whole repository.

## Project Context

This is a C++17 project template for local, token-efficient AI-assisted development. Keep reusable project knowledge in repository files so humans and agents can inspect the same sources.

Read these first for non-trivial work:

- `README.md` for the project summary and quick-start commands.
- `docs/PROJECT_LAYOUT.md` for directories, target names, and naming conventions.
- `.codex/commands.md` for verified local commands.
- `.codex/checklists.md` for task-specific checks.
- `docs/AI_WORKFLOW.md` for role sequencing and handoffs.
- `docs/DEPENDENCIES.md` before changing dependency behavior.

## Working Rules

- Keep changes scoped to the requested behavior and respect existing uncommitted user changes.
- Use CMake presets instead of ad hoc build directories.
- Keep reusable build behavior in focused `cmake/*.cmake` modules, not in an oversized top-level `CMakeLists.txt`.
- Put public headers in `include/cpp_ai_template/`, implementation in `src/`, examples in `examples/`, and GoogleTest tests in `tests/*_test.cpp`.
- Use the `cpp_ai_template` namespace for project C++ code.
- Do not commit generated files or local runtime state. `build/`, `.serena/`, and `.cocoindex_code/` are ignored.
- Keep AI-agent behavior in `AGENTS.md`, `.agents/`, `.codex/`, or `docs/`. Keep `.vscode/` limited to portable editor defaults.

## Dependencies

Dependency policy lives in `cmake/Dependencies.cmake` and detailed usage lives in `docs/DEPENDENCIES.md`.

- The default GoogleTest provider mode is `auto`: use an installed package if CMake can find one, otherwise use the pinned FetchContent archive.
- Supported provider modes are `auto`, `package`, and `fetchcontent`.
- `CPP_AI_TEMPLATE_ALLOW_FETCHCONTENT` controls whether FetchContent fallback is allowed.
- Run `.agents/scripts/deps.sh` when checking installed tools or dependency-provider behavior.
- Do not change dependency versions, URLs, hashes, or provider defaults casually. Treat those as build-system changes and validate accordingly.

## Commands

Use these from the repository root:

```sh
cmake --preset debug
cmake --build --preset debug
ctest --preset debug
```

Common helpers:

```sh
.agents/scripts/check.sh
.agents/scripts/format.sh
.agents/scripts/lint.sh
.agents/scripts/sanitize.sh
.agents/scripts/deps.sh
.agents/scripts/context.sh
```

Choose validation from `docs/VALIDATION.md`. Use the smallest validation level that proves the change, and broaden it for CMake, dependency, target wiring, or behavior changes.

## Codex MCP Workflow

Project-scoped Codex MCP configuration lives in `.codex/config.toml`.

- Use Serena for semantic code navigation and symbolic edits when it is available.
- Follow Serena's startup reminder: activate the project and read Serena's instructions before broad code exploration.
- Use CocoIndex for codebase indexing and natural-language code search when it is available.
- If an MCP server is unavailable, fall back to local files and `rg`, and mention the limitation in the final response when it affects confidence.

## Documentation

- Update `README.md` for user-facing command or workflow changes.
- Update `.codex/commands.md` when verified commands change.
- Update `docs/PROJECT_LAYOUT.md` when layout, target names, or naming conventions change.
- Keep docs concise and avoid duplicating long guidance across files.

## Before Final Response

- Confirm the newest user request was addressed.
- Mention files changed.
- Mention validation commands and results.
- State any command that could not be run and why.
