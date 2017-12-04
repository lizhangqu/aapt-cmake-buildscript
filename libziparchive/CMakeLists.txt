cmake_minimum_required(VERSION 3.8)
project(libziparchive)

set(libziparchive_sources
        ${CMAKE_SOURCE_DIR}/system/core/libziparchive/zip_archive.cc
        ${CMAKE_SOURCE_DIR}/system/core/libziparchive/zip_archive_stream_entry.cc
        ${CMAKE_SOURCE_DIR}/system/core/libziparchive/zip_writer.cc
        )


set(libziparchive_cflag
        "-DZLIB_CONST -Werror -Wall -D_FILE_OFFSET_BITS=64"
        )

set(libziparchive_cxxflag
        "${libziparchive_cflag} -std=gnu++14 -Wold-style-cast -Wno-missing-field-initializers"
        )

include_directories(
        ${libziparchive_header}
        ${base_header}
        ${liblog_header}
        ${libutils_header}
)

set(CMAKE_C_FLAGS ${libziparchive_cflag})
set(CMAKE_CXX_FLAGS ${libziparchive_cxxflag})
add_library(ziparchive STATIC ${libziparchive_sources})
target_link_libraries(ziparchive base log zlib utils)

