cmake_minimum_required(VERSION 3.8)
project(libcutils)

if(UNIX AND NOT APPLE)
    SET (CMAKE_C_COMPILER "/usr/bin/clang")
    SET (CMAKE_CXX_COMPILER "/usr/bin/clang++")
endif()

set(libcutils_sources
        ${CMAKE_SOURCE_DIR}/system/core/libcutils/config_utils.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libcutils/fs_config.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libcutils/canned_fs_config.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libcutils/hashmap.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libcutils/iosched_policy.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libcutils/load_file.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libcutils/native_handle.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libcutils/open_memstream.c
        ${CMAKE_SOURCE_DIR}/system/core/libcutils/record_stream.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libcutils/sched_policy.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libcutils/sockets.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libcutils/strdup16to8.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libcutils/strdup8to16.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libcutils/strlcpy.c
        ${CMAKE_SOURCE_DIR}/system/core/libcutils/threads.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libcutils/android_get_control_file.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libcutils/fs.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libcutils/multiuser.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libcutils/socket_inaddr_any_server_unix.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libcutils/socket_local_client_unix.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libcutils/socket_local_server_unix.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libcutils/socket_network_client_unix.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libcutils/sockets_unix.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libcutils/str_parms.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libcutils/ashmem-host.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libcutils/trace-host.cpp
        )

set(libcutils_cflag
        "-Werror -Wall -Wextra"
        )

#添加宏定义，目的是为了移除一部分实现，如断言，否则编译成功，执行可能有问题
set(libcutils_cflag "${libcutils_cflag} -DNDEBUG -UDEBUG")

set(libcutils_cxxflag
        "${libcutils_cflag} -std=gnu++14"
        )

include_directories(
        ${libcutils_header}
        ${libutils_header}
        ${liblog_header}
)

set(CMAKE_C_FLAGS ${libcutils_cflag})
set(CMAKE_CXX_FLAGS ${libcutils_cxxflag})
add_library(cutils STATIC ${libcutils_sources})
target_link_libraries(cutils log)
