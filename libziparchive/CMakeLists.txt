cmake_minimum_required(VERSION 3.6)
project(libziparchive)

if (UNIX AND NOT APPLE)
    SET(CMAKE_C_COMPILER "clang")
    SET(CMAKE_CXX_COMPILER "clang++")
endif ()

set(libziparchive_sources
        ${CMAKE_SOURCE_DIR}/system/core/libziparchive/zip_archive.cc
        ${CMAKE_SOURCE_DIR}/system/core/libziparchive/zip_archive_stream_entry.cc
        ${CMAKE_SOURCE_DIR}/system/core/libziparchive/zip_writer.cc
        )

set(libziparchive_cflag "-DZLIB_CONST -Werror -Wall -D_FILE_OFFSET_BITS=64")

if(WIN32)
    set(libziparchive_cflag "${libziparchive_cflag} -mno-ms-bitfields -D_GNU_SOURCE=1 -D__STDC_FORMAT_MACROS -Wno-error=strict-aliasing -Wno-error=unused-variable")
endif()

if(UNIX)
    set(libziparchive_cflag "${libziparchive_cflag} -fPIC")
endif()

if(UNIX AND NOT APPLE)
    #启用libcxx
    set(libziparchive_cflag "${libziparchive_cflag} ${global_libcxx_cxxflags}")
endif()


#添加宏定义，目的是为了移除一部分实现，如断言，否则编译成功，执行可能有问题
set(libziparchive_cflag "${libziparchive_cflag} -DNDEBUG -UDEBUG")

set(libziparchive_cxxflag "${libziparchive_cflag} -std=gnu++14 -Wold-style-cast -Wno-missing-field-initializers")

if(UNIX AND NOT APPLE)
    set(libziparchive_cxxflag "${libziparchive_cxxflag} -Wno-unknown-attributes")
endif()

include_directories(
        ${libziparchive_header}
        ${base_header}
        ${liblog_header}
        ${libutils_header}
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

set(CMAKE_C_FLAGS ${libziparchive_cflag})
set(CMAKE_CXX_FLAGS ${libziparchive_cxxflag})
if(UNIX)
    if(USE_32BITS)
        message(STATUS "using 32bits")
        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -m32")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m32")
    endif()
endif()
add_library(ziparchive STATIC ${libziparchive_sources})
target_link_libraries(ziparchive base log zlib utils)

