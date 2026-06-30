# Packaging and install support are intentionally disabled in the starter template.
# Enable this module when the project is ready to publish installable CMake targets.
#
# include(CMakePackageConfigHelpers)
# include(GNUInstallDirs)
#
# install(
#   TARGETS cpp_ai_template
#   EXPORT cpp_ai_templateTargets
#   FILE_SET HEADERS
# )
#
# install(
#   EXPORT cpp_ai_templateTargets
#   NAMESPACE cpp_ai_template::
#   DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/cpp_ai_template
# )
#
# configure_package_config_file(
#   ${CMAKE_CURRENT_SOURCE_DIR}/cmake/cpp_ai_templateConfig.cmake.in
#   ${CMAKE_CURRENT_BINARY_DIR}/cpp_ai_templateConfig.cmake
#   INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/cpp_ai_template
# )
#
# write_basic_package_version_file(
#   ${CMAKE_CURRENT_BINARY_DIR}/cpp_ai_templateConfigVersion.cmake
#   VERSION ${PROJECT_VERSION}
#   COMPATIBILITY SameMajorVersion
# )
#
# install(
#   FILES
#     ${CMAKE_CURRENT_BINARY_DIR}/cpp_ai_templateConfig.cmake
#     ${CMAKE_CURRENT_BINARY_DIR}/cpp_ai_templateConfigVersion.cmake
#   DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/cpp_ai_template
# )
