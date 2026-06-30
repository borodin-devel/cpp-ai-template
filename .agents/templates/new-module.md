# New C++ Module Template

Use this template when adding a new library module.

## Inputs

- Module name: `module_name`
- Public header: `include/cpp_ai_template/module_name.hpp`
- Source file: `src/module_name.cpp`
- Test file: `tests/module_name_test.cpp`

## Steps

1. Add public API in `include/cpp_ai_template/module_name.hpp`.
2. Add implementation in `src/module_name.cpp`.
3. Add tests in `tests/module_name_test.cpp`.
4. Update `CMakeLists.txt`:
   - add the source file to `cpp_ai_template`
   - add the header file to the public header file set
   - add the test file to `cpp_ai_template_tests`
5. Run formatting and validation.
6. Update docs only if layout, commands, or public behavior changed.

## Header Pattern

```cpp
#pragma once

namespace cpp_ai_template {

// Public declarations.

} // namespace cpp_ai_template
```

## Source Pattern

```cpp
#include "cpp_ai_template/module_name.hpp"

namespace cpp_ai_template {

// Implementation.

} // namespace cpp_ai_template
```

## Test Pattern

```cpp
#include "cpp_ai_template/module_name.hpp"

#include <gtest/gtest.h>

TEST(ModuleNameTest, DoesExpectedThing) {
  EXPECT_TRUE(true);
}
```

## Validation

```sh
.agents/scripts/format.sh
.agents/scripts/check.sh
```

For low-level or ownership-sensitive changes:

```sh
.agents/scripts/sanitize.sh
```
