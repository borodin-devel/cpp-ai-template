option(CPP_AI_TEMPLATE_ALLOW_FETCHCONTENT "Use FetchContent for managed third-party dependencies" ON)
set(CPP_AI_TEMPLATE_GOOGLETEST_PROVIDER
    "auto"
    CACHE STRING "GoogleTest provider: fetchcontent, package, or auto")
set_property(CACHE CPP_AI_TEMPLATE_GOOGLETEST_PROVIDER PROPERTY STRINGS fetchcontent package auto)

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
