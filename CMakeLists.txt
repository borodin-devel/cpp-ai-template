cmake_minimum_required(VERSION 3.28)

project(
  cpp_ai_template
  VERSION 0.1.0
  DESCRIPTION "C++ project template for local AI-assisted development"
  LANGUAGES CXX
)

include(CTest)
include(cmake/Dependencies.cmake)
include(cmake/Packaging.cmake)
include(cmake/ProjectOptions.cmake)
include(cmake/Sanitizers.cmake)
include(cmake/Warnings.cmake)

cpp_ai_template_set_project_defaults()

set(cpp_ai_template_generated_include_dir "${CMAKE_CURRENT_BINARY_DIR}/generated")
configure_file(
  cmake/version_config.hpp.in
  "${cpp_ai_template_generated_include_dir}/cpp_ai_template/version_config.hpp"
  @ONLY)

add_library(cpp_ai_template)
add_library(cpp_ai_template::cpp_ai_template ALIAS cpp_ai_template)

target_sources(
  cpp_ai_template
  PRIVATE src/version.cpp
  PUBLIC FILE_SET HEADERS BASE_DIRS include FILES include/cpp_ai_template/version.hpp)

target_include_directories(cpp_ai_template PRIVATE "${cpp_ai_template_generated_include_dir}")
target_compile_features(cpp_ai_template PUBLIC cxx_std_17)

cpp_ai_template_apply_sanitizers(cpp_ai_template)
cpp_ai_template_apply_warnings(cpp_ai_template)

add_executable(cpp_ai_template_app examples/app/main.cpp)
target_link_libraries(cpp_ai_template_app PRIVATE cpp_ai_template::cpp_ai_template)
target_compile_features(cpp_ai_template_app PRIVATE cxx_std_17)
cpp_ai_template_apply_sanitizers(cpp_ai_template_app)
cpp_ai_template_apply_warnings(cpp_ai_template_app)

if(BUILD_TESTING)
  cpp_ai_template_find_test_dependencies()

  add_executable(cpp_ai_template_tests tests/version_test.cpp)
  target_link_libraries(cpp_ai_template_tests PRIVATE cpp_ai_template::cpp_ai_template GTest::gtest_main)
  target_compile_definitions(cpp_ai_template_tests PRIVATE CPP_AI_TEMPLATE_EXPECTED_VERSION="${PROJECT_VERSION}")
  target_compile_features(cpp_ai_template_tests PRIVATE cxx_std_17)
  cpp_ai_template_apply_sanitizers(cpp_ai_template_tests)
  cpp_ai_template_apply_warnings(cpp_ai_template_tests)

  include(GoogleTest)
  gtest_discover_tests(cpp_ai_template_tests)
endif()
