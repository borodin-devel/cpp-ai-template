# AI Workflow

Use local files as shared memory. Keep prompts short by writing reusable context into `.agents/`, `.codex/`, and `docs/`.

## Default Role Sequence

Use this sequence for non-trivial work:

1. `architect`: define scope, affected files, risks, and validation plan.
2. `developer`: implement the focused change.
3. `tester`: run validation and classify failures.
4. `reviewer`: inspect diff, risks, tests, and documentation.
5. `documenter`: update user-facing or agent-facing docs when needed.

Use `maintainer` when the task touches CMake, dependencies, presets, warnings, sanitizers, packaging, or editor/tooling defaults.

## Handoffs

For non-trivial work, write a handoff using `.agents/HANDOFF_TEMPLATE.md`.

Handoffs should record:

- scope
- files read or changed
- commands run
- result
- next action

## Token-Saving Rules

- Read `README.md`, `docs/PROJECT_LAYOUT.md`, and relevant local files before asking for broad context.
- Use `.codex/commands.md` for verified commands.
- Use `.codex/checklists.md` for task-specific checks.
- Prefer command output and file references over prose summaries.
- Keep role files and handoffs short.
- Do not duplicate long guidance across multiple files.

## Validation

Choose validation from `docs/VALIDATION.md`.

Default full check:

```sh
cmake --preset debug
cmake --build --preset debug
ctest --preset debug
```

## Boundaries

- AI-agent behavior belongs in `.agents/`, `.codex/`, and `docs/`.
- `.vscode/` is for portable editor defaults only.
- Do not modify files based only on locally installed VS Code extensions.
