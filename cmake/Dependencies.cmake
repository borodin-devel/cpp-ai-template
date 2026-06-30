option(CPP_AI_TEMPLATE_ALLOW_FETCHCONTENT "Allow CMake to download missing third-party dependencies" ON)

set(CPP_AI_TEMPLATE_GOOGLETEST_VERSION
    "1.15.2"
    CACHE STRING "GoogleTest version used by the test suite")
set(CPP_AI_TEMPLATE_GOOGLETEST_SHA256
    "7b42b4d6ed48810c5362c265a17faebe90dc2373c885e5216439d37927f02926"
    CACHE STRING "SHA256 for the GoogleTest release archive")

function(cpp_ai_template_find_test_dependencies)
  include(cmake/GoogleTest.cmake)
  cpp_ai_template_find_googletest()
endfunction()
