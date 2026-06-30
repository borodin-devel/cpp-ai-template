# AI Workflow

Use local repository files as shared memory. Keep prompts short by writing durable context into the owning documents listed in `docs/INDEX.md`.

## Default Role Sequence

Use this sequence for non-trivial work:

1. `architect`: define scope, affected files, risks, and validation plan.
2. `developer`: implement the focused change.
3. `tester`: run validation and classify failures.
4. `reviewer`: inspect diff, risks, tests, and documentation.
5. `documenter`: update user-facing or agent-facing docs when needed.

Use `maintainer` when the task touches CMake, dependencies, presets, warnings, sanitizers, packaging, or editor/tooling defaults.

## Handoffs

For reusable non-trivial handoffs, use `.agents/HANDOFF_TEMPLATE.md` and record scope, files, commands, result, and next action.

## Context And Search

- Start with `docs/INDEX.md` and the topic owner instead of reading every Markdown file.
- Use `docs/TOOL_RULES/README.md` for verified commands.
- Use `docs/VALIDATION.md` for validation scope.
- Prefer targeted `rg` searches from `docs/INDEX.md` over broad recursive scans.
- Do not duplicate long guidance across role files, Codex files, and docs.

## Boundaries

Follow `docs/CONVENTIONS.md` for agent-file, editor-file, generated-file, documentation, CMake, dependency, and layout boundaries.
