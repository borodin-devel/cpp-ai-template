# Agent Roles

This directory contains lightweight role cards, templates, and helper scripts for local multiagent workflows.

## Topic Ownership

- Repository-wide rules: `AGENTS.md`.
- Documentation navigation and search: `docs/INDEX.md`.
- Shared layout, CMake, dependency, generated-file, editor, and documentation conventions: `docs/CONVENTIONS.md`.
- Role sequencing and handoffs: `docs/AI_WORKFLOW.md`.
- Commands and validation: `docs/TOOL_RULES/README.md` and `docs/VALIDATION.md`.

## Roles

- `architect`: scope, sequencing, boundaries, and tradeoffs.
- `developer`: focused source, test, CMake, or documentation changes.
- `tester`: local validation, regression checks, and failure reproduction.
- `maintainer`: build system, dependency policy, presets, packaging, and tooling.
- `reviewer`: correctness, maintainability, risks, and missing tests.
- `documenter`: concise human-facing and agent-facing documentation.

## Role Card Format

Each role card should use this structure:

```md
# Role Name

## Purpose
## Inputs
## Checklist
## Handoff
```

Keep role cards short. Put reusable cross-cutting rules in the owning document from `docs/INDEX.md` instead of repeating them here.
