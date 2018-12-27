cmake_minimum_required(VERSION 3.6)
project(aapt_static)

if (UNIX AND NOT APPLE)
    SET(CMAKE_C_COMPILER "clang")
    SET(CMAKE_CXX_COMPILER "clang++")
endif ()

set(aapt_static_sources
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt/AaptAssets.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt/AaptConfig.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt/AaptUtil.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt/AaptXml.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt/ApkBuilder.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt/Command.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt/CrunchCache.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt/FileFinder.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt/Images.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt/Package.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt/pseudolocalize.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt/Resource.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt/ResourceFilter.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt/ResourceIdCache.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt/ResourceTable.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt/SourcePos.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt/StringPool.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt/WorkQueue.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt/XMLNode.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt/ZipEntry.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt/ZipFile.cpp
        )

set(aapt_static_cflag
        "-Werror -Wall -Wno-format-y2k -DSTATIC_ANDROIDFW_FOR_TOOLS"
        )

if (WIN32)
    set(aapt_static_cflag "${aapt_static_cflag} -D_GNU_SOURCE=1 -D__STDC_FORMAT_MACROS -Wno-error=unused-but-set-variable")
endif ()

if(UNIX)
    set(aapt_static_cflag "${aapt_static_cflag} -fPIC")
endif()

string(TIMESTAMP VERSION "%Y%m%d%H%M%S")
set(aapt_static_cflag "${aapt_static_cflag} -DAAPT_VERSION=\\\"${VERSION}\\\"")

if(UNIX AND NOT APPLE)
    #启用libcxx
    set(aapt_static_cflag "${aapt_static_cflag} ${global_libcxx_cxxflags}")
endif()

#添加宏定义，目的是为了移除一部分实现，如断言，否则编译成功，执行可能有问题
set(aapt_static_cflag "${aapt_static_cflag} -DNDEBUG -UDEBUG")

if (APPLE)
    set(aapt_static_cflag "${aapt_static_cflag} -D_DARWIN_UNLIMITED_STREAMS")
endif ()

set(aapt_static_cxxflag "${aapt_static_cflag} -std=gnu++14")

include_directories(
        ${aapt_header}
        ${androidfw_header}
        ${libpng_header}
        ${libutils_header}
        ${liblog_header}
        ${libcutils_header}
        ${expat_header}
        ${libziparchive_header}
        ${base_header}
        ${zlib_header}
        ${libsystem_header}
        ${native_header}
)

#mac不参与下面三个库的编译，否则libaapt2_jni有问题
if(UNIX AND NOT APPLE)
    include_directories(
            ${libcxx_header}
            ${libcxxabi_header}
            ${compiler_rt_header}
    )
endif()

set(CMAKE_C_FLAGS ${aapt_static_cflag})
set(CMAKE_CXX_FLAGS ${aapt_static_cxxflag})
if(UNIX)
    if(USE_32BITS)
        message(STATUS "using 32bits")
        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -m32")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m32")
    endif()
endif()

add_library(aapt_static STATIC ${aapt_static_sources})
target_link_libraries(aapt_static androidfw png utils log cutils expat ziparchive base zlib)

if(UNIX AND NOT APPLE)
    target_link_libraries(aapt_static cxx cxxabi compiler_rt)
endif()
