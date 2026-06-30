#!/bin/sh

set -eu

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)

cd "$repo_root"

command -v clang-format >/dev/null 2>&1

git ls-files \
  '*.c' \
  '*.cc' \
  '*.cpp' \
  '*.cxx' \
  '*.h' \
  '*.hh' \
  '*.hpp' \
  '*.hxx' \
  '*.ipp' \
  '*.tpp' \
  | xargs -r clang-format -i
