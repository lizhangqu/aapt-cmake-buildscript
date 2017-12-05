cmake_minimum_required(VERSION 3.8)
project(libziparchive)

if(UNIX AND NOT APPLE)
    SET (CMAKE_C_COMPILER "/usr/bin/clang")
    SET (CMAKE_CXX_COMPILER "/usr/bin/clang++")
endif()

set(libziparchive_sources
        ${CMAKE_SOURCE_DIR}/system/core/libziparchive/zip_archive.cc
        ${CMAKE_SOURCE_DIR}/system/core/libziparchive/zip_archive_stream_entry.cc
        ${CMAKE_SOURCE_DIR}/system/core/libziparchive/zip_writer.cc
        )


set(libziparchive_cflag "-DZLIB_CONST -Werror -Wall -D_FILE_OFFSET_BITS=64")

#启用libcxx
set(libziparchive_cflag "${libziparchive_cflag} ${global_libcxx_cxxflags}")

#添加宏定义，目的是为了移除一部分实现，如断言，否则编译成功，执行可能有问题
set(libziparchive_cflag "${libziparchive_cflag} -DNDEBUG -UDEBUG")

set(libziparchive_cxxflag "${libziparchive_cflag} -std=gnu++14 -Wold-style-cast -Wno-missing-field-initializers")

include_directories(
        ${libcxx_header}
        ${libcxxabi_header}
        ${compiler_rt_header}
        ${libziparchive_header}
        ${base_header}
        ${liblog_header}
        ${libutils_header}
)

set(CMAKE_C_FLAGS ${libziparchive_cflag})
set(CMAKE_CXX_FLAGS ${libziparchive_cxxflag})
add_library(ziparchive STATIC ${libziparchive_sources})
target_link_libraries(ziparchive base log zlib utils)

