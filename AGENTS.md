# AGENTS.md

Scope: this file applies to the whole repository.

## Purpose

This is a C++17 project template for local, token-efficient AI-assisted development. Keep durable project knowledge in repository files so humans and agents share the same sources of truth.

## Required Reading Order

For non-trivial work, read only what is relevant after this sequence:

1. `README.md` for the project summary and quick start.
2. `.agents/INDEX.md` to choose the single owning document for the topic.
3. `.agents/CONVENTIONS.md` before changing paths, targets, naming, style, documentation, or agent guidance.
4. Topic-specific files from `.agents/INDEX.md`.

## Repository Rules

- Keep changes scoped to the requested behavior and respect existing uncommitted user changes.
- Follow `.agents/CONVENTIONS.md` for layout, CMake, dependency, generated-file, documentation, agent, and editor boundaries.
- Use command and validation guidance from `.agents/utilities/cmake.md`, `.agents/utilities/git.md`, and `.agents/scripts/README.md`.
- Read `.agents/utilities/cmake.md` before changing dependency behavior.
- Use `.agents/scripts/deps.sh` when checking installed tools or dependency-provider behavior.
- Do not modify `.agents/skills/caveman*` or `.agents/skills/cavecrew` unless the user explicitly asks for those folders.

## Codex MCP Workflow

Project-scoped Codex MCP configuration lives in `.codex/config.toml`.

- Use Serena for semantic code navigation and symbolic edits when it is available.
- Follow Serena's startup reminder: activate the project and read Serena's instructions before broad code exploration.
- Use CocoIndex for codebase indexing and natural-language code search when it is available.
- If an MCP server is unavailable, fall back to local files and targeted `rg` searches. Mention limitations in the final response only when they affect confidence.

## Before Final Response

- Confirm the newest user request was addressed.
- Mention files changed.
- Mention validation commands and results.
- State any command that could not be run and why.
