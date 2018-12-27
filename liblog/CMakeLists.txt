cmake_minimum_required(VERSION 3.6)
project(liblog)

if (UNIX AND NOT APPLE)
    SET(CMAKE_C_COMPILER "clang")
    SET(CMAKE_CXX_COMPILER "clang++")
endif ()

set(liblog_sources
        ${CMAKE_SOURCE_DIR}/system/core/liblog/config_read.c
        ${CMAKE_SOURCE_DIR}/system/core/liblog/config_write.c
        ${CMAKE_SOURCE_DIR}/system/core/liblog/local_logger.c
        ${CMAKE_SOURCE_DIR}/system/core/liblog/log_event_list.c
        ${CMAKE_SOURCE_DIR}/system/core/liblog/log_event_write.c
        ${CMAKE_SOURCE_DIR}/system/core/liblog/log_ratelimit.cpp
        ${CMAKE_SOURCE_DIR}/system/core/liblog/logger_lock.c
        ${CMAKE_SOURCE_DIR}/system/core/liblog/logger_name.c
        ${CMAKE_SOURCE_DIR}/system/core/liblog/logger_read.c
        ${CMAKE_SOURCE_DIR}/system/core/liblog/logger_write.c
        ${CMAKE_SOURCE_DIR}/system/core/liblog/logprint.c
        ${CMAKE_SOURCE_DIR}/system/core/liblog/stderr_write.c
        )

set(liblog_host_sources
        ${CMAKE_SOURCE_DIR}/system/core/liblog/fake_log_device.c
        ${CMAKE_SOURCE_DIR}/system/core/liblog/fake_writer.c
        )

if(WIN32)
    list(APPEND liblog_host_sources ${CMAKE_SOURCE_DIR}/system/core/liblog/uio.c)
elseif(UNIX)
    list(APPEND liblog_host_sources  ${CMAKE_SOURCE_DIR}/system/core/liblog/event_tag_map.cpp)
endif()

set(liblog_cflag "-DFAKE_LOG_DEVICE=1 -Werror -fvisibility=hidden -DLIBLOG_LOG_TAG=1006 -DSNET_EVENT_LOG_TAG=1397638484")

if(UNIX)
    set(liblog_cflag "${liblog_cflag} -fPIC")
endif()

if(UNIX AND NOT APPLE)
    #启用libcxx
    set(liblog_cflag "${liblog_cflag} ${global_libcxx_cxxflags}")
endif()

#添加宏定义，目的是为了移除一部分实现，如断言，否则编译成功，执行可能有问题
set(liblog_cflag "${liblog_cflag} -DNDEBUG -UDEBUG")

set(liblog_cxxflag "${liblog_cflag} -std=gnu++14")

include_directories(
        ${liblog_header}
        ${libcutils_header}
        ${libsystem_header}
        ${libutils_header}
)

#mac不参与下面三个库的编译，否则libaapt2_jni有问题
if(UNIX AND NOT APPLE)
    include_directories(
            ${libcxx_header}
            ${libcxxabi_header}
            ${compiler_rt_header}
    )
endif()

set(CMAKE_C_FLAGS ${liblog_cflag})
set(CMAKE_CXX_FLAGS ${liblog_cxxflag})
if(UNIX)
    if(USE_32BITS)
        message(STATUS "using 32bits")
        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -m32")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m32")
    endif()
endif()
add_library(log STATIC ${liblog_sources} ${liblog_host_sources})

if(UNIX AND NOT APPLE)
    target_link_libraries(log cxx cxxabi compiler_rt)
endif()


