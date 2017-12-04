cmake_minimum_required(VERSION 3.8)
project(libutils)

set(libutils_sources
        ${CMAKE_SOURCE_DIR}/system/core/libutils/CallStack.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libutils/FileMap.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libutils/JenkinsHash.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libutils/NativeHandle.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libutils/Printer.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libutils/PropertyMap.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libutils/RefBase.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libutils/SharedBuffer.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libutils/Static.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libutils/StopWatch.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libutils/String8.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libutils/String16.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libutils/StrongPointer.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libutils/SystemClock.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libutils/Threads.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libutils/Timers.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libutils/Tokenizer.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libutils/Unicode.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libutils/VectorImpl.cpp
        ${CMAKE_SOURCE_DIR}/system/core/libutils/misc.cpp
        )

set(libutils_cflag
        "-Wall -Werror -DLIBUTILS_NATIVE=1"
        )

if(APPLE)
    set(libutils_cflag "${libutils_cflag} -Wno-unused-parameter")
endif()

if(UNIX AND NOT APPLE)
    set(libutils_sources
            "${libutils_sources}"
            ${CMAKE_SOURCE_DIR}/system/core/libutils/Looper.cpp
            ${CMAKE_SOURCE_DIR}/system/core/libutils/ProcessCallStack.cpp
            )
endif()

set(libutils_cxxflag
        "${libutils_cflag} -std=gnu++14"
        )

include_directories(
        ${libutils_header}
        ${safe_iop_header}
        ${liblog_header}
        ${libbacktrace_header}
        ${libcutils_header}
        ${libsystem_header}
)

set(CMAKE_C_FLAGS ${libutils_cflag})
set(CMAKE_CXX_FLAGS ${libutils_cxxflag})
add_library(utils STATIC ${libutils_sources})
target_link_libraries(utils log)
