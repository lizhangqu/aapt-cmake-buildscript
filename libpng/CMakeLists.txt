cmake_minimum_required(VERSION 3.8)
project(libpng)

SET (CMAKE_C_COMPILER "/usr/bin/clang")
SET (CMAKE_CXX_COMPILER "/usr/bin/clang++")

set(libpng_sources
        ${CMAKE_SOURCE_DIR}/external/libpng/png.c
        ${CMAKE_SOURCE_DIR}/external/libpng/pngerror.c
        ${CMAKE_SOURCE_DIR}/external/libpng/pngget.c
        ${CMAKE_SOURCE_DIR}/external/libpng/pngmem.c
        ${CMAKE_SOURCE_DIR}/external/libpng/pngpread.c
        ${CMAKE_SOURCE_DIR}/external/libpng/pngread.c
        ${CMAKE_SOURCE_DIR}/external/libpng/pngrio.c
        ${CMAKE_SOURCE_DIR}/external/libpng/pngrtran.c
        ${CMAKE_SOURCE_DIR}/external/libpng/pngrutil.c
        ${CMAKE_SOURCE_DIR}/external/libpng/pngset.c
        ${CMAKE_SOURCE_DIR}/external/libpng/pngtrans.c
        ${CMAKE_SOURCE_DIR}/external/libpng/pngwio.c
        ${CMAKE_SOURCE_DIR}/external/libpng/pngwrite.c
        ${CMAKE_SOURCE_DIR}/external/libpng/pngwtran.c
        ${CMAKE_SOURCE_DIR}/external/libpng/pngwutil.c
        ${CMAKE_SOURCE_DIR}/external/libpng/intel/intel_init.c
        ${CMAKE_SOURCE_DIR}/external/libpng/intel/filter_sse2_intrinsics.c
        )

include_directories(
        ${libpng_header}
)

set(libpng_cflag
        "-std=gnu89 -Wall -Werror -Wno-unused-parameter -DPNG_INTEL_SSE_OPT=1"
        )

set(CMAKE_C_FLAGS ${libpng_cflag})
add_library(png STATIC ${libpng_sources})
target_link_libraries(png zlib)