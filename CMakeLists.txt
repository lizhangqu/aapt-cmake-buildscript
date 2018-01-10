cmake_minimum_required(VERSION 3.6)
project(aapt_cmake_buildscript)

#纯头文件引用
set(native_header
        ${CMAKE_SOURCE_DIR}/frameworks/native/include
        )
set(safe_iop_header
        ${CMAKE_SOURCE_DIR}/external/safe-iop/include
        )
set(libbacktrace_header
        ${CMAKE_SOURCE_DIR}/system/core/libbacktrace
        ${CMAKE_SOURCE_DIR}/system/core/libbacktrace/include
        )
set(libsystem_header
        ${CMAKE_SOURCE_DIR}/system/core/libsystem/include
        )

#源码和头文件引用
set(androidfw_header
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/include
        )
set(expat_header
        ${CMAKE_SOURCE_DIR}/external/expat
        ${CMAKE_SOURCE_DIR}/external/expat/lib
        )
set(libpng_header
        ${CMAKE_SOURCE_DIR}/external/libpng
        )
set(protobuf_header
        ${CMAKE_SOURCE_DIR}/external/protobuf/android
        ${CMAKE_SOURCE_DIR}/external/protobuf/src
        )
set(zlib_header
        ${CMAKE_SOURCE_DIR}/external/zlib
        ${CMAKE_SOURCE_DIR}/external/zlib/src
        )

set(libcxx_header
        ${CMAKE_SOURCE_DIR}/external/libcxx/include
        )

set(libcxxabi_header
        ${CMAKE_SOURCE_DIR}/external/libcxxabi/include
        )

set(compiler_rt_header
        ${CMAKE_SOURCE_DIR}/external/compiler-rt/include
        )

set(base_header
        ${CMAKE_SOURCE_DIR}/system/core/base/include
        )
set(libcutils_header
        ${CMAKE_SOURCE_DIR}/system/core/libcutils
        ${CMAKE_SOURCE_DIR}/system/core/libcutils/include
        )
set(liblog_header
        ${CMAKE_SOURCE_DIR}/system/core/liblog
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
set(libnativehelper_header
        ${CMAKE_SOURCE_DIR}/libnativehelper/include_jni
        )
#aapt头文件
set(aapt_header
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt
        )
#aapt2头文件
set(aapt2_header
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2
        )

set(global_libcxx_cxxflags "-nostdinc++ -DLIBCXX_BUILDING_LIBCXXABI -D_LIBCPP_BUILDING_LIBRARY")


MESSAGE(STATUS "当前CMAKE_SOURCE_DIR目录: ${CMAKE_SOURCE_DIR}")
#添加子目录构建脚本
add_subdirectory(${CMAKE_SOURCE_DIR}/buildscript/libcxx)
add_subdirectory(${CMAKE_SOURCE_DIR}/buildscript/libcxxabi)
add_subdirectory(${CMAKE_SOURCE_DIR}/buildscript/compiler-rt)
add_subdirectory(${CMAKE_SOURCE_DIR}/buildscript/zlib)
add_subdirectory(${CMAKE_SOURCE_DIR}/buildscript/libpng)
add_subdirectory(${CMAKE_SOURCE_DIR}/buildscript/androidfw)
add_subdirectory(${CMAKE_SOURCE_DIR}/buildscript/base)
add_subdirectory(${CMAKE_SOURCE_DIR}/buildscript/liblog)
add_subdirectory(${CMAKE_SOURCE_DIR}/buildscript/libziparchive)
add_subdirectory(${CMAKE_SOURCE_DIR}/buildscript/expat)
add_subdirectory(${CMAKE_SOURCE_DIR}/buildscript/libcutils)
add_subdirectory(${CMAKE_SOURCE_DIR}/buildscript/libutils)
add_subdirectory(${CMAKE_SOURCE_DIR}/buildscript/protobuf/libprotobuf-cpp-lite)
add_subdirectory(${CMAKE_SOURCE_DIR}/buildscript/protobuf/aprotoc)
add_subdirectory(${CMAKE_SOURCE_DIR}/buildscript/aapt_static)
add_subdirectory(${CMAKE_SOURCE_DIR}/buildscript/aapt)
add_subdirectory(${CMAKE_SOURCE_DIR}/buildscript/aapt2_static)
add_subdirectory(${CMAKE_SOURCE_DIR}/buildscript/aapt2)
add_subdirectory(${CMAKE_SOURCE_DIR}/buildscript/aapt2_jni)

