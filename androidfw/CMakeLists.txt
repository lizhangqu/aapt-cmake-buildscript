cmake_minimum_required(VERSION 3.6)
project(androidfw)

if (UNIX AND NOT APPLE)
    SET(CMAKE_C_COMPILER "clang")
    SET(CMAKE_CXX_COMPILER "clang++")
endif ()

set(androidfw_sources
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/ApkAssets.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/Asset.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/AssetDir.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/AssetManager.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/AssetManager2.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/AttributeResolution.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/ChunkIterator.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/Idmap.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/LoadedArsc.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/LocaleData.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/misc.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/ObbFile.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/ResourceTypes.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/ResourceUtils.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/StreamingZipInflater.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/TypeWrappers.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/Util.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/ZipFileRO.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/ZipUtils.cpp
#        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/Helper.cpp
        )

set(androidfw_cflag "-Werror -Wall -Wunused -Wunreachable-code -DSTATIC_ANDROIDFW_FOR_TOOLS")

if(UNIX)
    set(androidfw_cflag "${androidfw_cflag} -fPIC")
endif()

if(WIN32)
    set(androidfw_cflag "${androidfw_cflag} -D_GNU_SOURCE=1 -D__STDC_FORMAT_MACROS -Wno-error=strict-aliasing -Wno-missing-field-initializers")
endif()

if(UNIX AND NOT APPLE)
    set(androidfw_cflag "${androidfw_cflag} -Wno-unknown-attributes")
endif()

if(UNIX AND NOT APPLE)
    #启用libcxx
    set(androidfw_cflag "${androidfw_cflag} ${global_libcxx_cxxflags}")
endif()

#添加宏定义，目的是为了移除一部分实现，如断言，否则编译成功，执行可能有问题
set(androidfw_cflag "${androidfw_cflag} -DNDEBUG -UDEBUG")

set(androidfw_cxxflag "${androidfw_cflag} -std=gnu++14")

include_directories(
        ${androidfw_header}
        ${base_header}
        ${libziparchive_header}
        ${libutils_header}
        ${libcutils_header}
        ${liblog_header}
        ${libsystem_header}
        ${native_header}
        ${zlib_header}
)

#mac不参与下面三个库的编译，否则libaapt2_jni有问题
if(UNIX AND NOT APPLE)
    include_directories(
            ${libcxx_header}
            ${libcxxabi_header}
            ${compiler_rt_header}
    )
endif()

set(CMAKE_C_FLAGS ${androidfw_cflag})
set(CMAKE_CXX_FLAGS ${androidfw_cxxflag})
if(UNIX)
    if(USE_32BITS)
        message(STATUS "using 32bits")
        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -m32")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m32")
    endif()
endif()
add_library(androidfw STATIC ${androidfw_sources})
target_link_libraries(androidfw ziparchive base log cutils utils zlib)

if(UNIX AND NOT APPLE)
    target_link_libraries(androidfw cxx cxxabi compiler_rt)
endif()
