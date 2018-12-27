cmake_minimum_required(VERSION 3.6)
project(aapt)

if (UNIX AND NOT APPLE)
    SET(CMAKE_C_COMPILER "clang")
    SET(CMAKE_CXX_COMPILER "clang++")
endif ()

set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -s")
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -O3")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -O3")
set(CMAKE_STATIC_LINKER_FLAGS_RELEASE "${CMAKE_STATIC_LINKER_FLAGS_RELEASE} -s")
set(CMAKE_SHARED_LINKER_FLAGS_RELEASE "${CMAKE_SHARED_LINKER_FLAGS_RELEASE} -s")
set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -O3")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -O3")
set(CMAKE_STATIC_LINKER_FLAGS_DEBUG "${CMAKE_STATIC_LINKER_FLAGS_DEBUG} -s")
set(CMAKE_SHARED_LINKER_FLAGS_DEBUG "${CMAKE_SHARED_LINKER_FLAGS_DEBUG} -s")


set(aapt_sources
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt/Main.cpp
        )

set(aapt_cflag "-Werror -Wall -Wno-format-y2k -DSTATIC_ANDROIDFW_FOR_TOOLS")

if(UNIX)
    set(aapt_cflag "${aapt_cflag} -fPIC")
endif()

if(UNIX AND NOT APPLE)
    #启用libcxx
    set(aapt_cflag "${aapt_cflag} ${global_libcxx_cxxflags} -Wno-unused-command-line-argument")
endif()

#添加宏定义，目的是为了移除一部分实现，如断言，否则编译成功，执行可能有问题
set(aapt_cflag "${aapt_cflag} -DNDEBUG -UDEBUG")

string(TIMESTAMP VERSION "%Y%m%d%H%M%S")
set(aapt_cflag "${aapt_cflag} -DAAPT_VERSION=\\\"${VERSION}\\\"")


if(APPLE)
    set(aapt_cflag "${aapt_cflag} -D_DARWIN_UNLIMITED_STREAMS")
endif()

set(aapt_cflag "${aapt_cflag} -O3 ")

if(UNIX AND NOT APPLE)
    set(aapt_static_cxxflag "${aapt_static_cxxflag} -Wno-unknown-attributes")
endif()

set(aapt_cxxflag "${aapt_cflag} -std=gnu++14")

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
        ${aapt_header}
)

#mac不参与下面三个库的编译，否则libaapt2_jni有问题
if(UNIX AND NOT APPLE)
    include_directories(
            ${libcxx_header}
            ${libcxxabi_header}
            ${compiler_rt_header}
    )
endif()

set(CMAKE_C_FLAGS ${aapt_cflag})
set(CMAKE_CXX_FLAGS ${aapt_cxxflag})
if(UNIX)
    if(USE_32BITS)
        message(STATUS "using 32bits")
        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -m32")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m32")
    endif()
endif()

add_executable(aapt ${aapt_sources})
target_link_libraries(aapt aapt_static androidfw png utils log cutils expat ziparchive base zlib)

if (WIN32)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -static")
    target_link_libraries(aapt stdc++ winpthread)
endif ()

if(UNIX AND NOT APPLE)
    target_link_libraries(aapt cxx cxxabi compiler_rt)
endif()
