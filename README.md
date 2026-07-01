# cpp-ai-template

C++17 project template for local, token-efficient AI-assisted development.

The template keeps build, test, formatting, static-analysis, and editor behavior in repository files so humans and agents can inspect local sources instead of relying on repeated prompt context.

## Requirements

- CMake 3.28 or newer
- Ninja
- C++17 compiler
- VS Code with recommended extensions from `.vscode/extensions.json`
- Optional local tools: `clang-format`, `clang-tidy`

## Quick Start

Configure, build, and test the default debug preset:

```sh
cmake --preset debug
cmake --build --preset debug
ctest --preset debug
```

Run the example app:

```sh
./build/debug/cpp_ai_template_app
```

Other presets:

```sh
cmake --preset release
cmake --preset relwithdebinfo
cmake --preset asan
cmake --preset ubsan
```

Format C++ files:

```sh
.agents/scripts/format.sh
```

Run static analysis after configuring:

```sh
.agents/scripts/lint.sh
```

## Layout

See `.agents/INDEX.md` for repository guidance navigation and `.agents/CONVENTIONS.md` for repository structure, target names, naming conventions, and style.

## AI-Assisted Workflow

AI-agent and editor boundaries are defined in `.agents/CONVENTIONS.md`. Subagent definitions live in `.agents/subagents/`.

### Serena And CocoIndex For Codex

This repo includes project-scoped Codex MCP configuration for:

- Serena: semantic code navigation and symbolic editing tools.
- CocoIndex: codebase indexing and natural-language code search.

Install both tools with UV:

```sh
uv tool install serena-agent
uv tool install cocoindex-code
```

Verify the installed entrypoints:

```sh
serena --version
cocoindex-code --help
```

The project wiring lives in `.codex/config.toml`. It starts Serena with the Codex context and project auto-detection, starts CocoIndex with `cocoindex-code serve`, and enables Serena hooks that remind Codex to activate the project and use Serena symbolic tools before overusing raw file reads or grep.

If your UV tool directory is not under `~/.local/share/uv/tools/`, update the `command` paths in `.codex/config.toml` to match:

```sh
uv tool dir
```

Use with Codex:

```sh
codex mcp list
```

Expected: `serena` and `cocoindex` are listed as enabled for this trusted project. Restart the Codex session after changing MCP config.

CocoIndex keeps local runtime and index files in `.cocoindex_code/`, which is ignored by Git. To prebuild or refresh the local index outside Codex:

```sh
cocoindex-code index
```

Serena keeps local hook/session state in `.serena/`, also ignored by Git. In a Codex session, follow the Serena startup reminder: activate the project and read Serena's instructions before doing code exploration.
