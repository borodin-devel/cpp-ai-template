# Agent Scripts

Run scripts from anywhere inside the repository; each script resolves the repository root before executing.

The canonical command catalog and failure notes live in `docs/TOOL_RULES/README.md`. Validation scope lives in `docs/VALIDATION.md`.

## Script Groups

- Standard checks: `check.sh`, `validate.sh`, `sanitize.sh`, `bootstrap.sh`.
- Read-only inspection: `context.sh`, `deps.sh`, `lint.sh`.
- Source modification: `format.sh`.
- Generated-file cleanup: `clean.sh`.

Configure steps may download GoogleTest through CMake `FetchContent` when no system `GTest` package is available; classify network failures separately from project source failures.
