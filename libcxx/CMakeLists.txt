cmake_minimum_required(VERSION 3.6)
project(libcxx)

if (UNIX AND NOT APPLE)
    SET(CMAKE_C_COMPILER "clang")
    SET(CMAKE_CXX_COMPILER "clang++")
endif ()

set(libcxx_sources
        ${CMAKE_SOURCE_DIR}/external/libcxx/src/algorithm.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxx/src/any.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxx/src/bind.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxx/src/chrono.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxx/src/condition_variable.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxx/src/debug.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxx/src/exception.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxx/src/future.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxx/src/hash.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxx/src/ios.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxx/src/iostream.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxx/src/locale.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxx/src/memory.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxx/src/mutex.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxx/src/new.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxx/src/optional.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxx/src/random.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxx/src/regex.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxx/src/shared_mutex.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxx/src/stdexcept.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxx/src/string.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxx/src/strstream.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxx/src/system_error.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxx/src/thread.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxx/src/typeinfo.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxx/src/utility.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxx/src/valarray.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxx/src/variant.cpp
        ${CMAKE_SOURCE_DIR}/external/libcxx/src/vector.cpp
        )

set(libcxx_cflag "")

if(UNIX)
    set(libcxx_cflag "${libcxx_cflag} -fPIC")
endif()

#启用libcxx
set(libcxx_cflag "${libcxx_cflag} ${global_libcxx_cxxflags}")

#添加宏定义，目的是为了移除一部分实现，如断言，否则编译成功，执行可能有问题
set(libcxx_cflag "${libcxx_cflag} -DNDEBUG -UDEBUG")

set(libcxx_cxxflag "${libcxx_cflag} -std=gnu++14")

include_directories(
        ${libcxx_header}
        ${libcxxabi_header}
        ${compiler_rt_header}
)

set(CMAKE_C_FLAGS ${libcxx_cflag})
set(CMAKE_CXX_FLAGS ${libcxx_cxxflag})
if(UNIX)
    if(USE_32BITS)
        message(STATUS "using 32bits")
        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -m32")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m32")
    endif()
endif()
add_library(cxx STATIC ${libcxx_sources})

if (UNIX AND NOT APPLE)
    target_link_libraries(cxx rt pthread dl)
endif ()
