function(cpp_ai_template_find_googletest)
  find_package(GTest QUIET)

  if(GTest_FOUND)
    return()
  endif()

  if(NOT CPP_AI_TEMPLATE_ALLOW_FETCHCONTENT)
    find_package(GTest REQUIRED)
    return()
  endif()

  include(FetchContent)

  FetchContent_Declare(
    googletest
    URL https://github.com/google/googletest/archive/refs/tags/v${CPP_AI_TEMPLATE_GOOGLETEST_VERSION}.tar.gz
    URL_HASH SHA256=${CPP_AI_TEMPLATE_GOOGLETEST_SHA256})

  set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
  FetchContent_MakeAvailable(googletest)
endfunction()
