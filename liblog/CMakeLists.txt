cmake_minimum_required(VERSION 3.8)
project(liblog)

if(UNIX AND NOT APPLE)
    SET (CMAKE_C_COMPILER "/usr/bin/clang")
    SET (CMAKE_CXX_COMPILER "/usr/bin/clang++")
endif()

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
        ${CMAKE_SOURCE_DIR}/system/core/liblog/event_tag_map.cpp
        )

set(liblog_cflag "-DFAKE_LOG_DEVICE=1 -Werror -fvisibility=hidden -DLIBLOG_LOG_TAG=1006 -DSNET_EVENT_LOG_TAG=1397638484")

#启用libcxx
set(liblog_cflag "${liblog_cflag} ${global_libcxx_cxxflags}")

#添加宏定义，目的是为了移除一部分实现，如断言，否则编译成功，执行可能有问题
set(liblog_cflag "${liblog_cflag} -DNDEBUG -UDEBUG")

set(liblog_cxxflag "${liblog_cflag} -std=gnu++14")

include_directories(
        ${libcxx_header}
        ${libcxxabi_header}
        ${compiler_rt_header}
        ${liblog_header}
        ${libcutils_header}
        ${libsystem_header}
        ${libutils_header}
)

set(CMAKE_C_FLAGS ${liblog_cflag})
set(CMAKE_CXX_FLAGS ${liblog_cxxflag})
add_library(log STATIC ${liblog_sources} ${liblog_host_sources})
target_link_libraries(log cxx cxxabi compiler_rt)



