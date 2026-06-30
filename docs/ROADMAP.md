# Roadmap

This file records intentional direction and deferred work for the template.

## Current Baseline

- C++17 library, example app, and GoogleTest test target.
- CMake presets for debug, release, relwithdebinfo, ASAN, and UBSAN.
- Local formatting, linting, validation, sanitizer, bootstrap, and clean scripts.
- VS Code workspace defaults without AI-agent behavior.
- Lightweight `.agents/` roles, `.codex/config.toml` MCP configuration, and Codex guidance in `.codex/README.md`.
- Short documentation for layout, conventions, commands, CMake, dependencies, validation, testing, review, troubleshooting, AI workflow, and Git.

## Deferred

- Packaging/install/export behavior is intentionally present only as commented scaffold in `cmake/Packaging.cmake`.
- Additional dependencies are deferred until the template has a concrete use case.
- More source modules are deferred until a real project is generated from the template.
- CI integration is deferred. The repository is designed to work with plain local Git first.

## Possible Future Work

- Add configurable project renaming scripts.
- Add optional package-manager examples for system dependencies.
- Add more test examples for fixtures, parameterized tests, and failure cases.
- Add benchmark support when a benchmark framework is selected.
- Add documentation generation when a documentation tool is selected.

## Multiagent Next Steps

- Add role-specific examples for handoffs.
- Add task templates for common changes such as new library module, new test, and CMake option.
- Add a lightweight review report template.
