function(cpp_ai_template_find_googletest)
  set(valid_providers fetchcontent package auto)
  string(TOLOWER "${CPP_AI_TEMPLATE_GOOGLETEST_PROVIDER}" googletest_provider)

  if(NOT googletest_provider IN_LIST valid_providers)
    message(
      FATAL_ERROR
        "Unsupported CPP_AI_TEMPLATE_GOOGLETEST_PROVIDER='${CPP_AI_TEMPLATE_GOOGLETEST_PROVIDER}'. "
        "Use one of: fetchcontent, package, auto.")
  endif()

  if(googletest_provider STREQUAL "package")
    find_package(GTest REQUIRED)
    message(STATUS "Using system GoogleTest package")
    return()
  endif()

  if(googletest_provider STREQUAL "auto")
    find_package(GTest QUIET)

    if(GTest_FOUND)
      message(STATUS "Using system GoogleTest package")
      return()
    endif()
  endif()

  if(NOT CPP_AI_TEMPLATE_ALLOW_FETCHCONTENT)
    message(
      FATAL_ERROR
        "GoogleTest provider '${googletest_provider}' requires FetchContent, "
        "but CPP_AI_TEMPLATE_ALLOW_FETCHCONTENT is OFF. "
        "Use -DCPP_AI_TEMPLATE_GOOGLETEST_PROVIDER=package to require an installed package.")
  endif()

  message(STATUS "Using FetchContent GoogleTest ${CPP_AI_TEMPLATE_GOOGLETEST_VERSION}")

  include(FetchContent)

  FetchContent_Declare(
    googletest
    URL https://github.com/google/googletest/archive/refs/tags/v${CPP_AI_TEMPLATE_GOOGLETEST_VERSION}.tar.gz
    URL_HASH SHA256=${CPP_AI_TEMPLATE_GOOGLETEST_SHA256})

  set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
  FetchContent_MakeAvailable(googletest)
endfunction()
