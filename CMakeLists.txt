cmake_minimum_required(VERSION 3.8)
project(aapt_cmake_buildscript)

set(androidfw_header
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/include
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw
        )

set(native_header
        ${CMAKE_SOURCE_DIR}/frameworks/native/include
        )

set(aapt_header
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt
        )

set(aapt2_header
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2
        )

set(expat_header
        ${CMAKE_SOURCE_DIR}/external/expat
        )

set(libpng_header
        ${CMAKE_SOURCE_DIR}/external/libpng
        )

set(protobuf_header
        ${CMAKE_SOURCE_DIR}/external/protobuf/android
        ${CMAKE_SOURCE_DIR}/external/protobuf/src
        )

set(safe_iop_header
        ${CMAKE_SOURCE_DIR}/external/safe-iop/include
        )


set(zlib_header
        ${CMAKE_SOURCE_DIR}/external/zlib
        ${CMAKE_SOURCE_DIR}/external/zlib/src
        )

set(base_header
        ${CMAKE_SOURCE_DIR}/system/core/base/include
        )

set(libcutils_header
        ${CMAKE_SOURCE_DIR}/system/core/libcutils
        ${CMAKE_SOURCE_DIR}/system/core/libcutils/include
        )

set(liblog_header
        ${CMAKE_SOURCE_DIR}/system/core/liblog/include
        )

set(libutils_header
        ${CMAKE_SOURCE_DIR}/system/core/libutils
        ${CMAKE_SOURCE_DIR}/system/core/libutils/include
        )

set(libziparchive_header
        ${CMAKE_SOURCE_DIR}/system/core/libziparchive
        ${CMAKE_SOURCE_DIR}/system/core/libziparchive/include
        )

set(libbacktrace_header
        ${CMAKE_SOURCE_DIR}/system/core/libbacktrace/include
        )

set(libsystem_header
        ${CMAKE_SOURCE_DIR}/system/core/libsystem/include
        )

add_subdirectory(${CMAKE_SOURCE_DIR}/buildscript/androidfw)
add_subdirectory(${CMAKE_SOURCE_DIR}/buildscript/base)
add_subdirectory(${CMAKE_SOURCE_DIR}/buildscript/liblog)
add_subdirectory(${CMAKE_SOURCE_DIR}/buildscript/zlib)
add_subdirectory(${CMAKE_SOURCE_DIR}/buildscript/libpng)
add_subdirectory(${CMAKE_SOURCE_DIR}/buildscript/libziparchive)
add_subdirectory(${CMAKE_SOURCE_DIR}/buildscript/expat)
add_subdirectory(${CMAKE_SOURCE_DIR}/buildscript/libcutils)
add_subdirectory(${CMAKE_SOURCE_DIR}/buildscript/libutils)
add_subdirectory(${CMAKE_SOURCE_DIR}/buildscript/protobuf)
add_subdirectory(${CMAKE_SOURCE_DIR}/buildscript/aapt)
add_subdirectory(${CMAKE_SOURCE_DIR}/buildscript/aapt2)

add_dependencies(aapt2 protoc)