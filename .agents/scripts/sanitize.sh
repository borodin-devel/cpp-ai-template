#!/bin/sh

set -eu

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)

cd "$repo_root"

cmake --version
ninja --version
c++ --version

cmake --preset asan
cmake --build --preset asan
ctest --preset asan

cmake --preset ubsan
cmake --build --preset ubsan
ctest --preset ubsan
