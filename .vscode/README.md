# VS Code Workspace Files

This directory contains editor defaults for the C++ template. The files are intended to be portable across machines and focused on local CMake, C++, debugging, formatting, testing, and pure Git workflows.

## Files

- `extensions.json`: recommended VS Code extensions for this workspace.
- `settings.json`: workspace settings for CMake, C++17, formatting, `clangd`, and Git.
- `tasks.json`: preset-based configure, build, and test tasks plus script-backed format, lint, and clean tasks.
- `launch.json`: debugger launch configurations for CMake targets and fallback preset executable paths.
- `c_cpp_properties.json`: Microsoft C/C++ fallback configuration delegated to CMake Tools.
- `cpp.code-snippets`: reusable C++, CMake, and GoogleTest snippets.

## Convention

Do not change these files based only on the extensions installed on one local machine. Treat them as template defaults. If a setting depends on a recommended extension, keep that dependency explicit in `extensions.json`.
