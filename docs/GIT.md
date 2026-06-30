# Git Workflow

This repository assumes plain Git. Do not require GitHub, GitLens, or hosted-service integration for local development.

## Inspect Worktree

```sh
git status --short
git diff
git diff --staged
```

## Commit

Prefer focused commits that describe one logical change.

```sh
git add <files>
git commit
```

Commit message style:

```text
Short imperative summary

Optional body explaining why the change was made.
```

Examples:

```text
Add CMake warning policy
Document validation workflow
```

## Cleanup

Remove generated build directories:

```sh
.agents/scripts/clean.sh
```

Check ignored files:

```sh
git status --ignored --short
```

## Rules

- Do not commit generated build outputs.
- Do not rewrite unrelated local changes.
- Keep `.vscode/` portable and project-owned.
- Keep AI-agent behavior in `.agents/`, `.codex/`, and `docs/`.
