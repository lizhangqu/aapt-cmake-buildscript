cmake_minimum_required(VERSION 3.8)
project(aapt)

#set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -s")
#set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -O3")
#set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -O3")
#set(CMAKE_STATIC_LINKER_FLAGS_RELEASE "${CMAKE_STATIC_LINKER_FLAGS_RELEASE} -s")
#set(CMAKE_SHARED_LINKER_FLAGS_RELEASE "${CMAKE_SHARED_LINKER_FLAGS_RELEASE} -s")
#set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -O3")
#set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -O3")
#set(CMAKE_STATIC_LINKER_FLAGS_DEBUG "${CMAKE_STATIC_LINKER_FLAGS_DEBUG} -s")
#set(CMAKE_SHARED_LINKER_FLAGS_DEBUG "${CMAKE_SHARED_LINKER_FLAGS_DEBUG} -s")

set(aapt_sources
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
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt/Main.cpp
        )

set(aapt_cflag
        "-Werror -Wall -Wno-format-y2k -DSTATIC_ANDROIDFW_FOR_TOOLS"
        )

if(APPLE)
    set(aapt_cflag "${aapt_cflag} -D_DARWIN_UNLIMITED_STREAMS")
endif()

#
#set(aapt_cflag
#        "${aapt_cflag} -O3"
#        )

set(aapt_cxxflag
        "${aapt_cflag} -std=gnu++14"
        )

include_directories(
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


set(CMAKE_C_FLAGS ${aapt_cflag})
set(CMAKE_CXX_FLAGS ${aapt_cxxflag})

add_executable(aapt ${aapt_sources})
target_link_libraries(aapt androidfw png utils log cutils expat ziparchive base zlib)

