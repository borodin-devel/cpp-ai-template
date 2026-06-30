#!/bin/sh

set -eu

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)

cd "$repo_root"

cmake --version
ninja --version
c++ --version

cmake --preset debug
cmake --build --preset debug
ctest --preset debug
