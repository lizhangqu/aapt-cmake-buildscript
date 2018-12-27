cmake_minimum_required(VERSION 3.6)
project(libpng)

if (UNIX AND NOT APPLE)
    SET(CMAKE_C_COMPILER "clang")
    SET(CMAKE_CXX_COMPILER "clang++")
endif ()

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
        ${CMAKE_SOURCE_DIR}/external/libpng/contrib/intel/intel_init.c
        ${CMAKE_SOURCE_DIR}/external/libpng/contrib/intel/filter_sse2_intrinsics.c
        )

include_directories(
        ${libpng_header}
        ${zlib_header}
)

set(libpng_cflag "-std=gnu89 -Wall -Werror -Wno-unused-parameter -DPNG_INTEL_SSE_OPT=1")

if(UNIX)
    set(libpng_cflag "${libpng_cflag} -fPIC")
endif()

#添加宏定义，目的是为了移除一部分实现，如断言，否则编译成功，执行可能有问题
set(libpng_cflag "${libpng_cflag} -DNDEBUG -UDEBUG")

set(CMAKE_C_FLAGS ${libpng_cflag})
if(UNIX)
    if(USE_32BITS)
        message(STATUS "using 32bits")
        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -m32")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m32")
    endif()
endif()
add_library(png STATIC ${libpng_sources})
target_link_libraries(png zlib)