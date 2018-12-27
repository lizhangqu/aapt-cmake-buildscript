cmake_minimum_required(VERSION 3.6)
project(libcutils)

if (UNIX AND NOT APPLE)
    SET(CMAKE_C_COMPILER "clang")
    SET(CMAKE_CXX_COMPILER "clang++")
endif ()

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
        )

if (WIN32)
    list(APPEND libcutils_sources
            ${CMAKE_SOURCE_DIR}/system/core/libcutils/socket_inaddr_any_server_windows.cpp
            ${CMAKE_SOURCE_DIR}/system/core/libcutils/socket_network_client_windows.cpp
            ${CMAKE_SOURCE_DIR}/system/core/libcutils/sockets_windows.cpp
            )
elseif (UNIX)
    list(APPEND libcutils_sources
            ${CMAKE_SOURCE_DIR}/system/core/libcutils/android_get_control_file.cpp
            ${CMAKE_SOURCE_DIR}/system/core/libcutils/fs.cpp
            ${CMAKE_SOURCE_DIR}/system/core/libcutils/multiuser.cpp
            ${CMAKE_SOURCE_DIR}/system/core/libcutils/socket_inaddr_any_server_unix.cpp
            ${CMAKE_SOURCE_DIR}/system/core/libcutils/socket_local_client_unix.cpp
            ${CMAKE_SOURCE_DIR}/system/core/libcutils/socket_local_server_unix.cpp
            ${CMAKE_SOURCE_DIR}/system/core/libcutils/socket_network_client_unix.cpp
            ${CMAKE_SOURCE_DIR}/system/core/libcutils/sockets_unix.cpp
            ${CMAKE_SOURCE_DIR}/system/core/libcutils/str_parms.cpp
            )
endif ()

set(libcutils_cflag "-Werror -Wall -Wextra -D__STDC_FORMAT_MACROS")

if (WIN32)
    set(libcutils_cflag "${libcutils_cflag} -D_GNU_SOURCE -Wno-error=unused-parameter")
endif ()

if (UNIX)
    set(libcutils_cflag "${libcutils_cflag} -fPIC")
endif ()

#aosp中没有此编译选项
set(libcutils_cflag "${libcutils_cflag} -Wno-deprecated-declarations")

if (UNIX AND NOT APPLE)
    #启用libcxx
    set(libcutils_cflag "${libcutils_cflag} ${global_libcxx_cxxflags}")
endif ()

#添加宏定义，目的是为了移除一部分实现，如断言，否则编译成功，执行可能有问题
set(libcutils_cflag "${libcutils_cflag} -DNDEBUG -UDEBUG")

set(libcutils_cxxflag "${libcutils_cflag} -std=gnu++14")

#c使用gun99，避免被cxxflag引入，放在cxxflag后面
set(libcutils_cflag "${libcutils_cflag} -std=gnu99")

include_directories(
        ${libcutils_header}
        ${libutils_header}
        ${liblog_header}
)

#mac不参与下面三个库的编译，否则libaapt2_jni有问题
if (UNIX AND NOT APPLE)
    include_directories(
            ${libcxx_header}
            ${libcxxabi_header}
            ${compiler_rt_header}
    )
endif ()

set(CMAKE_C_FLAGS ${libcutils_cflag})
set(CMAKE_CXX_FLAGS ${libcutils_cxxflag})
if (UNIX)
    if (USE_32BITS)
        message(STATUS "using 32bits")
        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -m32")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m32")
    endif ()
endif ()
add_library(cutils STATIC ${libcutils_sources})
target_link_libraries(cutils log)
