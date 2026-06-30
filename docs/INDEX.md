# Documentation Index

Use this file as the navigation source of truth. Each document owns one topic; link here instead of repeating the same commands, paths, or rules elsewhere.

## Start Here

- `README.md`: project purpose, requirements, and quick start for humans.
- `AGENTS.md`: repository-wide agent rules and required reading order.
- `docs/PROJECT_LAYOUT.md`: directory ownership, target names, and naming conventions.
- `docs/TOOL_RULES/`: callable-program rules for Git, CMake, CTest, formatters, linters, and helper scripts.

## Topic References

- `docs/CONVENTIONS.md`: shared conventions for C++, CMake, documentation, editor files, generated files, and agent files.
- `docs/TOOL_RULES/README.md`: verified command catalog and helper-script purpose.
- `docs/VALIDATION.md`: validation levels, when to broaden checks, and failure classification.
- `docs/CMAKE.md`: CMake targets, presets, modules, and options.
- `docs/DEPENDENCIES.md`: dependency policy and GoogleTest provider modes.
- `docs/TESTING.md`: GoogleTest and CTest test authoring guidance.
- `docs/AI_WORKFLOW.md`: AI role sequence, handoffs, and context-use rules.
- `docs/REVIEW.md`: review severity, checklist, and output format.
- `docs/TROUBLESHOOTING.md`: common failure diagnosis.
- `docs/ROADMAP.md`: intentional deferred work and future directions.

## Search Instructions

From the repository root, prefer targeted searches:

```sh
rg "term" README.md AGENTS.md docs .agents .codex cmake include src tests
rg --files -g '*.md' -g 'CMakeLists.txt' -g 'CMakePresets.json'
```

Avoid recursive tools that do not respect ignores, such as `grep -R` or `ls -R`, in large worktrees.

## Update Rules

- Add new durable guidance to the single owning document above.
- Put short navigational links in other files instead of duplicating content.
- Update this index when adding, removing, or renaming documentation files.
- Update `docs/PROJECT_LAYOUT.md` for path, target, or naming changes.
- Update `docs/TOOL_RULES/README.md` when a verified command changes.
- Put callable-program rules in `docs/TOOL_RULES/README.md`.
- Keep the only Codex-specific Markdown file at `.codex/README.md`.
