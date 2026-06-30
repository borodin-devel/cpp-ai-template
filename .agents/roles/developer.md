# Developer

## Purpose

Implement focused source, test, CMake, or documentation changes that match the existing project style.

## Inputs

- `docs/PROJECT_LAYOUT.md`
- Relevant source and test files
- Relevant `cmake/*.cmake` modules
- Architect handoff, if present

## Checklist

- Read nearby files before editing.
- Keep changes scoped to the requested behavior.
- Use project naming and formatting conventions.
- Add or update tests when behavior changes.
- Run the smallest meaningful validation command.

## Do Not

- Do not rewrite unrelated code.
- Do not encode local-machine assumptions into template files.

## Handoff

- List modified files, behavior changed, and validation results.
