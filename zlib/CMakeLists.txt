cmake_minimum_required(VERSION 3.8)
project(zlib)

set(zlib_sources
        ${CMAKE_SOURCE_DIR}/external/zlib/src/adler32.c
        ${CMAKE_SOURCE_DIR}/external/zlib/src/compress.c
        ${CMAKE_SOURCE_DIR}/external/zlib/src/crc32.c
        ${CMAKE_SOURCE_DIR}/external/zlib/src/deflate.c
        ${CMAKE_SOURCE_DIR}/external/zlib/src/gzclose.c
        ${CMAKE_SOURCE_DIR}/external/zlib/src/gzlib.c
        ${CMAKE_SOURCE_DIR}/external/zlib/src/gzread.c
        ${CMAKE_SOURCE_DIR}/external/zlib/src/gzwrite.c
        ${CMAKE_SOURCE_DIR}/external/zlib/src/infback.c
        ${CMAKE_SOURCE_DIR}/external/zlib/src/inflate.c
        ${CMAKE_SOURCE_DIR}/external/zlib/src/inftrees.c
        ${CMAKE_SOURCE_DIR}/external/zlib/src/inffast.c
        ${CMAKE_SOURCE_DIR}/external/zlib/src/trees.c
        ${CMAKE_SOURCE_DIR}/external/zlib/src/uncompr.c
        ${CMAKE_SOURCE_DIR}/external/zlib/src/zutil.c
        )

include_directories(
        ${zlib_header}
)

set(zlib_cflag
        "-O3 -DUSE_MMAP -DZLIB_CONST -Wall -Werror"
        )

set(CMAKE_C_FLAGS ${zlib_cflag})
add_library(zlib STATIC ${zlib_sources})
