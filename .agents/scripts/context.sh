#!/bin/sh

set -eu

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)

cd "$repo_root"

if [ ! -f build/debug/compile_commands.json ]; then
  cmake --preset debug >/dev/null
fi

print_tracked() {
  title=$1
  shift

  printf '\n## %s\n\n' "$title"
  git ls-files --cached --others --exclude-standard "$@" |
    while IFS= read -r path; do
      if [ -e "$path" ]; then
        printf -- '- %s\n' "$path"
      fi
    done
}

printf '# Repository Context\n'
printf '\nRoot: `%s`\n' "$repo_root"

printf '\n## CMake Presets\n\n'
cmake --list-presets | sed 's/^/    /'

printf '\n## Declared CMake Targets\n\n'
awk '
  /^[[:space:]]*add_(library|executable)\(/ {
    line = $0
    sub(/^[^(]*\(/, "", line)
    split(line, parts, /[[:space:]\)]/)
    if (parts[1] != "") {
      print "- " parts[1]
    }
  }
' CMakeLists.txt

printf '\n## Compile Database\n\n'
printf -- '- `%s`\n' "build/debug/compile_commands.json"

print_tracked "Project Entry Points" \
  README.md \
  AGENTS.md \
  CMakeLists.txt \
  CMakePresets.json

print_tracked "CMake Modules" 'cmake/*'
print_tracked "Public Headers" 'include/*.hpp' 'include/*.h' 'include/*/*.hpp' 'include/*/*.h'
print_tracked "Sources" 'src/*.cpp' 'src/*.cc' 'src/*.cxx' 'src/*/*.cpp' 'src/*/*.cc' 'src/*/*.cxx'
print_tracked "Examples" 'examples/*.cpp' 'examples/*.cc' 'examples/*.cxx' 'examples/*/*.cpp' 'examples/*/*.cc' 'examples/*/*.cxx'
print_tracked "Tests" 'tests/*_test.cpp' 'tests/**/*_test.cpp'
print_tracked "Agent Guidance" \
  .agents/README.md \
  .agents/INDEX.md \
  .agents/CONVENTIONS.md \
  .agents/utilities/git.md \
  .agents/utilities/cmake.md
print_tracked "Subagents" '.agents/subagents/*/README.md' '.agents/subagents/*/SKILL.md'
print_tracked "Local Skills" '.agents/skills/*/README.md' '.agents/skills/*/SKILL.md'
print_tracked "Agent Scripts" '.agents/scripts/*.sh' '.agents/scripts/README.md'
print_tracked "Codex Guidance" '.codex/*.md'
print_tracked "VS Code Workspace" '.vscode/*'

printf '\n## Ignored Generated Paths\n\n'
printf -- '- `build/`\n'
printf -- '- `out/`\n'
printf -- '- `cmake-build-*`\n'
