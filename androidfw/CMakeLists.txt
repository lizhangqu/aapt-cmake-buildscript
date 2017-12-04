cmake_minimum_required(VERSION 3.8)
project(androidfw)

set(androidfw_sources
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/AssetManager2.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/AssetManager.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/ResourceTypes.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/StreamingZipInflater.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/TypeWrappers.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/Util.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/ZipFileRO.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/ZipUtils.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/AssetDir.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/misc.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/LocaleData.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/AttributeResolution.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/ObbFile.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/ChunkIterator.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/Asset.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/ApkAssets.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/LoadedArsc.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/libs/androidfw/ResourceUtils.cpp
        )

set(androidfw_cflag
        "-Werror -Wall -Wunused -Wunreachable-code -DSTATIC_ANDROIDFW_FOR_TOOLS"
        )

set(androidfw_cxxflag
        "${androidfw_cflag} -std=gnu++14"
        )

include_directories(
        ${androidfw_header}
        ${base_header}
        ${libziparchive_header}
        ${libutils_header}
        ${libcutils_header}
        ${liblog_header}
        ${libsystem_header}
        ${native_header}
)

set(CMAKE_C_FLAGS ${androidfw_cflag})
set(CMAKE_CXX_FLAGS ${androidfw_cxxflag})
add_library(androidfw STATIC ${androidfw_sources})
target_link_libraries(androidfw ziparchive base log cutils utils zlib)
