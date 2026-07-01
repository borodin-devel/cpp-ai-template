# Agent Index

This file is the navigation source of truth for repository guidance. Use it to find the single owner for each topic instead of searching every Markdown file.

## Start Here

- `README.md`: project purpose, requirements, and quick start.
- `AGENTS.md`: repository-wide agent rules and required reading order.
- `.agents/INDEX.md`: this navigation file.
- `.agents/CONVENTIONS.md`: layout, naming, code style, comments, documentation, generated-file, agent, and editor boundaries.
- `.agents/utilities/`: command guidance for local tools.
- `.agents/subagents/`: role-specific subagents, each with `README.md` and `SKILL.md`.

## Topic Owners

- `.agents/CONVENTIONS.md`: shared conventions for C++, CMake, documentation, generated files, editor files, and agent files.
- `.agents/utilities/git.md`: Git inspection, diff review, commits, and safety rules.
- `.agents/utilities/cmake.md`: CMake presets, CTest, dependencies, sanitizers, validation levels, and failure classification.
- `.agents/scripts/README.md`: helper script catalog.
- `.agents/subagents/architect/SKILL.md`: planning, sequencing, workflow control, and subagent cycling.
- `.agents/subagents/developer/SKILL.md`: focused source, test, CMake, and documentation edits.
- `.agents/subagents/maintainer/SKILL.md`: build system, dependencies, presets, warnings, sanitizers, and tooling.
- `.agents/subagents/tester/SKILL.md`: validation, reproduction, and failure classification.
- `.agents/subagents/reviewer/SKILL.md`: correctness review, regression risk, missing tests, and findings-first output.
- `.agents/subagents/documenter/SKILL.md`: concise human-facing and agent-facing documentation updates.

## Protected Paths

Do not modify caveman skill folders unless the user explicitly names them for modification:

- `.agents/skills/cavecrew/`
- `.agents/skills/caveman/`
- `.agents/skills/caveman-*`

These paths may be read as reference material when relevant.

## Search Instructions

From the repository root, prefer targeted searches:

```sh
rg "term" README.md AGENTS.md .agents .codex cmake include src tests examples
rg --files -g '*.md' -g 'CMakeLists.txt' -g 'CMakePresets.json'
```

Avoid broad recursive tools that do not respect ignores, such as `grep -R` or `ls -R`, in large worktrees.

## Update Rules

- Add durable guidance to the single owner listed above.
- Use links instead of duplicating command catalogs, layout rules, dependency policy, or validation levels.
- Update this index when adding, removing, or renaming `.agents` guidance.
- Update `.agents/CONVENTIONS.md` for path, target, naming, style, generated-file, editor, or agent-boundary changes.
- Update `.agents/utilities/cmake.md` when CMake, CTest, dependency, preset, or validation behavior changes.
- Update `.agents/utilities/git.md` when Git workflow guidance changes.
- Keep Codex-specific Markdown in `.codex/README.md`; keep Codex MCP config in `.codex/config.toml`.
