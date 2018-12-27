cmake_minimum_required(VERSION 3.6)
project(libcxxabi)

if (UNIX AND NOT APPLE)
    SET(CMAKE_C_COMPILER "clang")
    SET(CMAKE_CXX_COMPILER "clang++")
endif ()

set(libcxxabi_sources
        ${CMAKE_SOURCE_DIR}/external/libcxxabi/src/abort_message.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxxabi/src/cxa_aux_runtime.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxxabi/src/cxa_default_handlers.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxxabi/src/cxa_demangle.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxxabi/src/cxa_exception.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxxabi/src/cxa_exception_storage.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxxabi/src/cxa_guard.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxxabi/src/cxa_handlers.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxxabi/src/cxa_personality.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxxabi/src/cxa_thread_atexit.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxxabi/src/cxa_unexpected.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxxabi/src/cxa_vector.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxxabi/src/cxa_virtual.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxxabi/src/fallback_malloc.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxxabi/src/private_typeinfo.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxxabi/src/stdlib_exception.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxxabi/src/stdlib_new_delete.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxxabi/src/stdlib_stdexcept.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxxabi/src/stdlib_typeinfo.cpp
        )

set(libcxxabi_cflag "")

if(UNIX)
    set(libcxxabi_cflag "${libcxxabi_cflag} -fPIC")
endif()

#启用libcxx
set(libcxxabi_cflag "${libcxxabi_cflag} ${global_libcxx_cxxflags}")

#添加宏定义，目的是为了移除一部分实现，如断言，否则编译成功，执行可能有问题
set(libcxxabi_cflag "${libcxxabi_cflag} -DNDEBUG -UDEBUG")

set(libcxxabi_cxxflag "${libcxxabi_cflag} -std=gnu++14 -fexceptions -Wall -Wextra -Wno-unused-function -Werror")

if(UNIX AND NOT APPLE)
    set(libcxxabi_cxxflag "${libcxxabi_cxxflag} -Wno-macro-redefined")
endif()

include_directories(
        ${libcxx_header}
        ${libcxxabi_header}
        ${compiler_rt_header}
)

set(CMAKE_C_FLAGS ${libcxxabi_cflag})
set(CMAKE_CXX_FLAGS ${libcxxabi_cxxflag})
if(UNIX)
    if(USE_32BITS)
        message(STATUS "using 32bits")
        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -m32")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m32")
    endif()
endif()
add_library(cxxabi STATIC ${libcxxabi_sources})
