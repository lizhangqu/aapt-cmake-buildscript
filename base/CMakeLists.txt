cmake_minimum_required(VERSION 3.6)
project(base)

if (UNIX AND NOT APPLE)
    SET(CMAKE_C_COMPILER "clang")
    SET(CMAKE_CXX_COMPILER "clang++")
endif ()

set(base_sources
        ${CMAKE_SOURCE_DIR}/system/core/base/file.cpp
        ${CMAKE_SOURCE_DIR}/system/core/base/logging.cpp
        ${CMAKE_SOURCE_DIR}/system/core/base/parsenetaddress.cpp
        ${CMAKE_SOURCE_DIR}/system/core/base/quick_exit.cpp
        ${CMAKE_SOURCE_DIR}/system/core/base/stringprintf.cpp
        ${CMAKE_SOURCE_DIR}/system/core/base/strings.cpp
        ${CMAKE_SOURCE_DIR}/system/core/base/test_utils.cpp
        )

if(WIN32)
    list(APPEND base_sources
            ${CMAKE_SOURCE_DIR}/system/core/base/errors_windows.cpp
            ${CMAKE_SOURCE_DIR}/system/core/base/utf8.cpp
            )
elseif(UNIX)
    list(APPEND base_sources
            ${CMAKE_SOURCE_DIR}/system/core/base/chrono_utils.cpp
            ${CMAKE_SOURCE_DIR}/system/core/base/errors_unix.cpp
            )
endif()

include_directories(
        ${base_header}
)

#mac不参与下面三个库的编译，否则libaapt2_jni有问题
if(UNIX AND NOT APPLE)
    include_directories(
            ${libcxx_header}
            ${libcxxabi_header}
            ${compiler_rt_header}
    )
endif()

set(base_cflag "-Wall -Werror -Wextra")

if(WIN32)
    set(base_cflag "${base_cflag} -Wno-error=unused-parameter -D__STDC_FORMAT_MACROS")
endif()

if(UNIX)
    set(base_cflag "${base_cflag} -fPIC")
endif()

#aosp没有此编译选项
set(base_cflag "${base_cflag} -Wno-deprecated-declarations")

if(UNIX AND NOT APPLE)
    #启用libcxx
    set(base_cflag "${base_cflag} ${global_libcxx_cxxflags}")
endif()

#添加宏定义，目的是为了移除一部分实现，如断言，否则编译成功，执行可能有问题
set(base_cflag "${base_cflag} -DNDEBUG -UDEBUG")

set(base_cxxflag "${base_cflag} -std=gnu++14")

if(UNIX)
    set(base_cxxflag "${base_cxxflag} -Wexit-time-destructors")
endif()

if(UNIX AND NOT APPLE)
    set(base_cxxflag "${base_cxxflag} -Wno-unknown-attributes")
endif()

set(CMAKE_C_FLAGS ${base_cflag})
set(CMAKE_CXX_FLAGS ${base_cxxflag})
if(UNIX)
    if(USE_32BITS)
        message(STATUS "using 32bits")
        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -m32")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m32")
    endif()
endif()

add_library(base STATIC ${base_sources})
target_link_libraries(base log)

if(UNIX AND NOT APPLE)
    target_link_libraries(base cxx cxxabi compiler_rt)
endif()



