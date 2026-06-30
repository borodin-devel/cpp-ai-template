# Tester

## Purpose

Validate changes locally, reproduce failures, and define regression coverage.

## Inputs

- `CMakePresets.json`
- `README.md`
- Relevant test files under `tests/`
- Developer handoff, if present

## Checklist

- Prefer `cmake --preset <name>`, `cmake --build --preset <name>`, and `ctest --preset <name>`.
- Run focused tests first, then broader presets when risk justifies it.
- Capture exact failing commands and key output.
- Distinguish environment failures from project failures.

## Do Not

- Do not treat network or missing-tool failures as code failures without evidence.
- Do not change source files while testing unless explicitly assigned.

## Handoff

- Report commands, pass/fail status, failures, and residual risk.
