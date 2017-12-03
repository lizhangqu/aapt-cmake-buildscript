cmake_minimum_required(VERSION 3.8)
project(base)

set(base_sources
        ${CMAKE_SOURCE_DIR}/system/core/base/file.cpp
        ${CMAKE_SOURCE_DIR}/system/core/base/logging.cpp
        ${CMAKE_SOURCE_DIR}/system/core/base/parsenetaddress.cpp
        ${CMAKE_SOURCE_DIR}/system/core/base/quick_exit.cpp
        ${CMAKE_SOURCE_DIR}/system/core/base/stringprintf.cpp
        ${CMAKE_SOURCE_DIR}/system/core/base/strings.cpp
        ${CMAKE_SOURCE_DIR}/system/core/base/test_utils.cpp
        ${CMAKE_SOURCE_DIR}/system/core/base/chrono_utils.cpp
        ${CMAKE_SOURCE_DIR}/system/core/base/errors_unix.cpp
        )

include_directories(
        ${base_header}
)

set(base_cflag "-Wall -Werror -Wextra"
        )

set(base_cxxflag
        "${base_cflag} -std=gnu++14"
        )
set(CMAKE_C_FLAGS ${base_cflag})
set(CMAKE_CXX_FLAGS ${base_cxxflag})

add_library(base STATIC ${base_sources})





