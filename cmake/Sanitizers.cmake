option(CPP_AI_TEMPLATE_ENABLE_ASAN "Enable AddressSanitizer for supported compilers" OFF)
option(CPP_AI_TEMPLATE_ENABLE_UBSAN "Enable UndefinedBehaviorSanitizer for supported compilers" OFF)

function(cpp_ai_template_apply_sanitizers target)
  if(NOT CPP_AI_TEMPLATE_ENABLE_ASAN AND NOT CPP_AI_TEMPLATE_ENABLE_UBSAN)
    return()
  endif()

  if(NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang|GNU")
    message(WARNING "Sanitizer options are only configured for Clang and GNU compilers")
    return()
  endif()

  set(sanitizers)

  if(CPP_AI_TEMPLATE_ENABLE_ASAN)
    list(APPEND sanitizers address)
  endif()

  if(CPP_AI_TEMPLATE_ENABLE_UBSAN)
    list(APPEND sanitizers undefined)
  endif()

  list(JOIN sanitizers "," sanitizer_flags)

  target_compile_options(${target} PRIVATE -fsanitize=${sanitizer_flags} -fno-omit-frame-pointer)
  target_link_options(${target} PRIVATE -fsanitize=${sanitizer_flags})
endfunction()
