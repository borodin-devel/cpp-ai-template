# Agent Roles

This directory is reserved for lightweight multiagent role cards and shared workflow notes.

Agents should prefer repository files, checklists, command output, and small written handoffs over long chat context. Role files should stay short and operational.

## Roles

- `architect`: orchestrates scope, boundaries, sequencing, and tradeoffs.
- `developer`: implements focused code changes that match the existing project style.
- `tester`: designs and runs local validation, regression checks, and failure reproduction.
- `maintainer`: owns build-system health, dependency policy, presets, packaging, and tooling.
- `reviewer`: reviews changes for correctness, maintainability, risks, and missing tests.
- `documenter`: keeps user-facing and agent-facing documentation accurate and concise.

## Role Card Format

Each role card should use this structure:

```md
# Role Name

## Purpose

One short paragraph describing what this role owns.

## Inputs

- Files, commands, or reports this role should inspect first.

## Checklist

- Concrete checks this role performs before handing off.

## Handoff

- What this role should write down for the next role.
```

## Coordination Rules

- Read `docs/PROJECT_LAYOUT.md` before making broad repository changes.
- Prefer CMake presets over ad hoc build commands.
- Keep handoffs in files when the information will be reused.
- Do not encode AI-agent behavior in `.vscode/`.
- Keep role guidance small enough to read quickly.
