# CMake Reference

The build system is centered on `CMakeLists.txt`, `CMakePresets.json`, and focused modules under `cmake/`.

## Targets

- `cpp_ai_template`: main C++17 library.
- `cpp_ai_template::cpp_ai_template`: public alias for the library.
- `cpp_ai_template_app`: example executable.
- `cpp_ai_template_tests`: GoogleTest executable, enabled when `BUILD_TESTING=ON`.

## Presets

Configure/build/test presets:

- `debug`
- `release`
- `relwithdebinfo`
- `asan`
- `ubsan`

Common preset commands are in `docs/TOOL_RULES/README.md`.

## Modules

- `cmake/ProjectOptions.cmake`: project-wide C++ defaults.
- `cmake/Dependencies.cmake`: dependency policy, versions, hashes, and FetchContent control.
- `cmake/GoogleTest.cmake`: GoogleTest resolution.
- `cmake/Warnings.cmake`: compiler warning options and warnings-as-errors control.
- `cmake/Sanitizers.cmake`: AddressSanitizer and UndefinedBehaviorSanitizer target options.
- `cmake/Packaging.cmake`: commented-out install/export/package scaffold.
- `cmake/version_config.hpp.in`: generated C++ version header template sourced from `project(VERSION ...)`.
- `cmake/cpp_ai_templateConfig.cmake.in`: future package config template.

## Options

- `BUILD_TESTING`: enables test targets through CTest.
- `CPP_AI_TEMPLATE_GOOGLETEST_PROVIDER`: selects `fetchcontent`, `package`, or `auto` dependency resolution.
- `CPP_AI_TEMPLATE_ALLOW_FETCHCONTENT`: enables or disables all FetchContent dependency paths.
- `CPP_AI_TEMPLATE_GOOGLETEST_VERSION`: selected GoogleTest release version.
- `CPP_AI_TEMPLATE_GOOGLETEST_SHA256`: expected GoogleTest release archive hash.
- `CPP_AI_TEMPLATE_WARNINGS_AS_ERRORS`: treats project target warnings as errors.
- `CPP_AI_TEMPLATE_ENABLE_ASAN`: enables AddressSanitizer for project targets.
- `CPP_AI_TEMPLATE_ENABLE_UBSAN`: enables UndefinedBehaviorSanitizer for project targets.

## Conventions

Shared CMake conventions live in `docs/CONVENTIONS.md`. Dependency details live in `docs/DEPENDENCIES.md`.
