cmake_minimum_required(VERSION 3.6)
project(aapt2_jni)

if (UNIX AND NOT APPLE)
    SET(CMAKE_C_COMPILER "clang")
    SET(CMAKE_CXX_COMPILER "clang++")
endif ()

set(aapt2_jni_sources
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/jni/aapt2_jni.cpp
        )

set(aapt2_jni_cflag "-Werror -Wall -Wno-unused-parameter")

if (WIN32)
    set(aapt2_jni_cflag "${aapt2_jni_cflag} -D__STDC_FORMAT_MACROS -Wno-error=maybe-uninitialized -Wno-error=unused-variable")
endif ()

if(UNIX)
    set(aapt2_jni_cflag "${aapt2_jni_cflag} -fPIC")
endif()

if(UNIX AND NOT APPLE)
    #启用libcxx
    set(aapt2_jni_cflag "${aapt2_jni_cflag} ${global_libcxx_cxxflags} -Wno-unused-command-line-argument")
endif()

#添加宏定义，目的是为了移除一部分实现，如断言，否则编译成功，执行可能有问题
set(aapt2_jni_cflag "${aapt2_jni_cflag} -DNDEBUG -UDEBUG")

if (APPLE)
    set(aapt2_jni_cflag "${aapt2_jni_cflag} -D_DARWIN_UNLIMITED_STREAMS")
endif ()


#官方的编译选项中没有此项
set(aapt2_jni_cflag "${aapt2_jni_cflag} -Wno-deprecated-declarations")

set(aapt2_jni_cxxflag "${aapt2_jni_cflag} -std=gnu++14 -Wno-missing-field-initializers -fno-exceptions")

if(UNIX AND NOT APPLE)
    set(aapt2_jni_cxxflag "${aapt2_jni_cxxflag} -Wno-unknown-attributes")
endif()

include_directories(
        ${protobuf_header}
        ${androidfw_header}
        ${base_header}
        ${libziparchive_header}
        ${liblog_header}
        ${libcutils_header}
        ${libutils_header}
        ${libsystem_header}
        ${zlib_header}
        ${native_header}
        ${aapt2_header}
        ${libpng_header}
        ${expat_header}
        ${libnativehelper_header}
)

#mac不参与下面三个库的编译，否则libaapt2_jni有问题
if(UNIX AND NOT APPLE)
    include_directories(
            ${libcxx_header}
            ${libcxxabi_header}
            ${compiler_rt_header}
    )
endif()

set(CMAKE_C_FLAGS ${aapt2_jni_cflag})
set(CMAKE_CXX_FLAGS ${aapt2_jni_cxxflag})
if(UNIX)
    if(USE_32BITS)
        message(STATUS "using 32bits")
        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -m32")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m32")
    endif()
endif()

add_library(aapt2_jni SHARED ${aapt2_jni_sources})
target_link_libraries(aapt2_jni aapt2_static expat androidfw base cutils log png utils ziparchive zlib protobuf)

if (WIN32)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -static")
    target_link_libraries(aapt2_jni stdc++ winpthread)
endif ()


if(UNIX AND NOT APPLE)
    target_link_libraries(aapt2_jni cxx cxxabi compiler_rt)
endif()
