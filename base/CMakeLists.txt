cmake_minimum_required(VERSION 3.8)
project(base)

SET (CMAKE_C_COMPILER "/usr/bin/clang")
SET (CMAKE_CXX_COMPILER "/usr/bin/clang++")

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

#添加宏定义，目的是为了移除一部分实现，如断言，否则编译成功，执行可能有问题
set(base_cflag "${base_cflag} -DNDEBUG -UDEBUG")

set(base_cxxflag
        "${base_cflag} -std=gnu++14 -Wexit-time-destructors"
        )

set(CMAKE_C_FLAGS ${base_cflag})
set(CMAKE_CXX_FLAGS ${base_cxxflag})

add_library(base STATIC ${base_sources})
target_link_libraries(base log)





