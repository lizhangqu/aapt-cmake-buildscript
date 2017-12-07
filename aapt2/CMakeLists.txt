cmake_minimum_required(VERSION 3.8)
project(aapt2)

if(UNIX AND NOT APPLE)
    SET (CMAKE_C_COMPILER "/usr/bin/clang")
    SET (CMAKE_CXX_COMPILER "/usr/bin/clang++")
endif()

set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -s")
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -O3")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -O3")
set(CMAKE_STATIC_LINKER_FLAGS_RELEASE "${CMAKE_STATIC_LINKER_FLAGS_RELEASE} -s")
set(CMAKE_SHARED_LINKER_FLAGS_RELEASE "${CMAKE_SHARED_LINKER_FLAGS_RELEASE} -s")
set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -O3")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -O3")
set(CMAKE_STATIC_LINKER_FLAGS_DEBUG "${CMAKE_STATIC_LINKER_FLAGS_DEBUG} -s")
set(CMAKE_SHARED_LINKER_FLAGS_DEBUG "${CMAKE_SHARED_LINKER_FLAGS_DEBUG} -s")

set(aapt2_sources
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/Main.cpp
        )

set(aapt2_cflag "-Werror -Wall -Wno-unused-parameter")

#启用libcxx
set(aapt2_cflag "${aapt2_cflag} ${global_libcxx_cxxflags} -Wno-unused-command-line-argument")

#添加宏定义，目的是为了移除一部分实现，如断言，否则编译成功，执行可能有问题
set(aapt2_cflag "${aapt2_cflag} -DNDEBUG -UDEBUG")

if (APPLE)
    set(aapt2_cflag "${aapt2_cflag} -D_DARWIN_UNLIMITED_STREAMS")
endif ()


#官方的编译选项中没有此项
set(aapt2_cflag "${aapt2_cflag} -Wno-deprecated-declarations")

set(aapt2_cflag "${aapt2_cflag} -O3")

set(aapt2_cxxflag "${aapt2_cflag} -std=gnu++14 -Wno-missing-field-initializers -fno-exceptions")

include_directories(
        ${libcxx_header}
        ${libcxxabi_header}
        ${compiler_rt_header}
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
)

set(CMAKE_C_FLAGS ${aapt2_cflag})
set(CMAKE_CXX_FLAGS ${aapt2_cxxflag})

add_executable(aapt2 ${aapt2_sources})
target_link_libraries(aapt2 aapt2_static expat androidfw base cutils log png utils ziparchive zlib protobuf cxx cxxabi compiler_rt)
