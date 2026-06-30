#!/bin/sh

set -eu

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)

cd "$repo_root"

command -v clang-tidy >/dev/null 2>&1

cmake --preset debug

git ls-files \
  '*.cc' \
  '*.cpp' \
  '*.cxx' \
  | xargs -r clang-tidy -p build/debug
