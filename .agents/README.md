# Agent Workspace

This directory contains local multiagent guidance, subagent definitions, utility references, and helper scripts.

## Topic Ownership

- Repository-wide rules: `AGENTS.md`.
- Guidance navigation and search: `.agents/INDEX.md`.
- Shared layout, CMake, dependency, generated-file, editor, agent, and documentation conventions: `.agents/CONVENTIONS.md`.
- Git guidance: `.agents/utilities/git.md`.
- CMake, CTest, dependency, and validation guidance: `.agents/utilities/cmake.md`.
- Helper scripts: `.agents/scripts/`.
- Subagents: `.agents/subagents/`.

## Subagents

- `architect`: planning, workflow control, sequencing, boundaries, and handoffs.
- `developer`: focused source, test, CMake, or documentation changes.
- `maintainer`: build system, dependency policy, presets, packaging, and tooling.
- `tester`: local validation, regression checks, and failure reproduction.
- `reviewer`: correctness, maintainability, risks, and missing tests.
- `documenter`: concise human-facing and agent-facing documentation.

Each subagent directory contains:

- `README.md`: human-readable directory description.
- `SKILL.md`: agent-facing workflow, script range, and handoff contract.

## Protected Skill Folders

The caveman skill folders under `.agents/skills/` are not part of the subagent migration. They are local skills and should stay unchanged unless directly requested.
