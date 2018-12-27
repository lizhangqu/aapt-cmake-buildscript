cmake_minimum_required(VERSION 3.6)
project(libprotobuf)

if (UNIX AND NOT APPLE)
    SET(CMAKE_C_COMPILER "clang")
    SET(CMAKE_CXX_COMPILER "clang++")
endif ()

set(libprotobuf_sources
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/stubs/atomicops_internals_x86_gcc.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/stubs/atomicops_internals_x86_msvc.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/stubs/bytestream.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/stubs/common.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/stubs/int128.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/stubs/once.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/stubs/status.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/stubs/statusor.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/stubs/stringpiece.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/stubs/stringprintf.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/stubs/structurally_valid.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/stubs/strutil.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/stubs/time.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/arena.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/arenastring.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/extension_set.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/generated_message_util.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/message_lite.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/repeated_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/wire_format_lite.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/io/coded_stream.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/io/zero_copy_stream.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/io/zero_copy_stream_impl_lite.cc
        )

set(libprotobuf_cflag "-Wno-sign-compare -Wno-unused-parameter -Wno-sign-promo -Wno-error=return-type -DGOOGLE_PROTOBUF_NO_RTTI")

if(UNIX)
    set(libprotobuf_cflag "${libprotobuf_cflag} -fPIC")
endif()

if(UNIX AND NOT APPLE)
    #启用libcxx
    set(libprotobuf_cflag "${libprotobuf_cflag} ${global_libcxx_cxxflags}")
endif()

#添加宏定义，目的是为了移除一部分实现，如断言，否则编译成功，执行可能有问题
set(libprotobuf_cflag "${libprotobuf_cflag} -DNDEBUG -UDEBUG")

#官方的编译选项中没有此项
set(libprotobuf_cflag "${libprotobuf_cflag} -Wno-deprecated-declarations")

set(libprotobuf_cxxflag "${libprotobuf_cflag} -std=gnu++14"
        )

include_directories(
        ${protobuf_header}
)

#mac不参与下面三个库的编译，否则libaapt2_jni有问题
if(UNIX AND NOT APPLE)
    include_directories(
            ${libcxx_header}
            ${libcxxabi_header}
            ${compiler_rt_header}
    )
endif()

set(CMAKE_C_FLAGS ${libprotobuf_cflag})
set(CMAKE_CXX_FLAGS ${libprotobuf_cxxflag})
if(UNIX)
    if(USE_32BITS)
        message(STATUS "using 32bits")
        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -m32")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m32")
    endif()
endif()
add_library(protobuf STATIC ${libprotobuf_sources})
