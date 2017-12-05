cmake_minimum_required(VERSION 3.8)
project(libprotobuf)

SET (CMAKE_C_COMPILER "/usr/bin/clang")
SET (CMAKE_CXX_COMPILER "/usr/bin/clang++")

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

set(libprotobuf_cflag
        "-Wno-sign-compare -Wno-unused-parameter -Wno-sign-promo -Wno-error=return-type -DGOOGLE_PROTOBUF_NO_RTTI"
        )

#官方的编译选项中没有此项
set(libprotobuf_cflag "${libprotobuf_cflag} -Wno-deprecated-declarations")

set(libprotobuf_cxxflag "${libprotobuf_cflag} -std=gnu++14"
        )

include_directories(
        ${protobuf_header}
)

set(CMAKE_C_FLAGS ${libprotobuf_cflag})
set(CMAKE_CXX_FLAGS ${libprotobuf_cxxflag})
add_library(protobuf STATIC ${libprotobuf_sources})
