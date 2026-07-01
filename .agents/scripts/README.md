# Agent Scripts

Run scripts from anywhere inside the repository; each script resolves the repository root before executing.

Command, dependency, validation, and failure notes live in `.agents/utilities/cmake.md` and `.agents/utilities/git.md`.

## Script Groups

- Standard checks: `check.sh`, `validate.sh`, `sanitize.sh`, `bootstrap.sh`.
- Inspection and setup: `context.sh`, `deps.sh`, `lint.sh`.
- Source modification: `format.sh`.
- Generated-file cleanup: `clean.sh`.

Inspection and setup scripts can create or update generated build state. `context.sh` and `lint.sh` may configure `build/debug`; `deps.sh` configures `build/dependency-check` and writes a temporary log under `/tmp`.

Configure steps may download GoogleTest through CMake `FetchContent` when no system `GTest` package is available; classify network failures separately from project source failures.
