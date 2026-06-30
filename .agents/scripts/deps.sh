#!/bin/sh

set -eu

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)

cd "$repo_root"

printf '%s\n' "Toolchain:"
cmake --version | sed -n '1p'
ninja --version | sed 's/^/ninja /'
c++ --version | sed -n '1p'

printf '\n%s\n' "GoogleTest package check:"

if cmake -S . -B build/dependency-check -G Ninja \
  -DCMAKE_BUILD_TYPE=Debug \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=OFF \
  -DCPP_AI_TEMPLATE_GOOGLETEST_PROVIDER=package \
  -DCPP_AI_TEMPLATE_ALLOW_FETCHCONTENT=OFF >/tmp/cpp-ai-template-deps.log 2>&1; then
  printf '%s\n' "system package: available"
else
  printf '%s\n' "system package: not available"
  sed -n '/Could NOT find GTest/,$p' /tmp/cpp-ai-template-deps.log | sed -n '1,8p'
fi

printf '\n%s\n' "Fetch modes:"
printf '%s\n' "- default: -DCPP_AI_TEMPLATE_GOOGLETEST_PROVIDER=auto"
printf '%s\n' "- installed package only: -DCPP_AI_TEMPLATE_GOOGLETEST_PROVIDER=package"
printf '%s\n' "- pinned FetchContent: -DCPP_AI_TEMPLATE_GOOGLETEST_PROVIDER=fetchcontent"
printf '%s\n' "- local source override: -DFETCHCONTENT_SOURCE_DIR_GOOGLETEST=/path/to/googletest"
