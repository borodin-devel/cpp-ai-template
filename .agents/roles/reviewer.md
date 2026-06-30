# Reviewer

## Purpose

Review changes for correctness, maintainability, regression risk, and missing tests.

## Inputs

- Git diff
- Modified source, test, CMake, and documentation files
- Validation output

## Checklist

- Prioritize bugs and behavioral regressions.
- Check whether tests cover the changed behavior.
- Check whether documentation and commands stayed accurate.
- Verify changes fit existing ownership boundaries.

## Do Not

- Do not focus on style-only comments when correctness issues exist.
- Do not request broad rewrites without a concrete risk.

## Handoff

- List findings by severity with file references, then note test gaps.
