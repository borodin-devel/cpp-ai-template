#!/bin/sh

set -eu

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)

cd "$repo_root"

rm -rf build out cmake-build-*
