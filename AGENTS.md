# AGENTS.md

Scope: this file applies to the whole repository.

## Purpose

This is a C++17 project template for local, token-efficient AI-assisted development. Keep durable project knowledge in repository files so humans and agents share the same sources of truth.

## Required Reading Order

For non-trivial work, read only what is relevant after this sequence:

1. `README.md` for the project summary and quick start.
2. `docs/INDEX.md` to choose the single owning document for the topic.
3. `docs/PROJECT_LAYOUT.md` before changing paths, targets, or naming.
4. `docs/CONVENTIONS.md` for shared rules that should not be repeated elsewhere.
5. Topic-specific docs from `docs/INDEX.md`.

## Repository Rules

- Keep changes scoped to the requested behavior and respect existing uncommitted user changes.
- Follow `docs/CONVENTIONS.md` for layout, CMake, dependency, generated-file, documentation, agent, and editor boundaries.
- Use commands from `docs/TOOL_RULES/README.md` and validation levels from `docs/VALIDATION.md`.
- Read `docs/DEPENDENCIES.md` before changing dependency behavior.
- Use `.agents/scripts/deps.sh` when checking installed tools or dependency-provider behavior.

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
