cmake_minimum_required(VERSION 3.6)
project(expat)

if (UNIX AND NOT APPLE)
    SET(CMAKE_C_COMPILER "clang")
    SET(CMAKE_CXX_COMPILER "clang++")
endif ()

set(expat_sources
        ${CMAKE_SOURCE_DIR}/external/expat/lib/loadlibrary.c
        ${CMAKE_SOURCE_DIR}/external/expat/lib/xmlparse.c
        ${CMAKE_SOURCE_DIR}/external/expat/lib/xmlrole.c
        ${CMAKE_SOURCE_DIR}/external/expat/lib/xmltok.c
        )

include_directories(
        ${expat_header}
)

set(expat_cflag "-Wall -Werror -Wmissing-prototypes -Wstrict-prototypes -Wno-unused-parameter -Wno-unused-function -Wno-missing-field-initializers -fexceptions -DHAVE_EXPAT_CONFIG_H -UWIN32_LEAN_AND_MEAN")

if(UNIX)
    set(expat_cflag "${expat_cflag} -fPIC")
endif()

#添加宏定义，目的是为了移除一部分实现，如断言，否则编译成功，执行可能有问题
set(expat_cflag "${expat_cflag} -DNDEBUG -UDEBUG")

if(APPLE)
    set(expat_cflag "${expat_cflag} -fno-common")
endif()

if(WIN32)
    set(expat_cflag "${expat_cflag} -Wno-unused-but-set-variable")
endif()

set(CMAKE_C_FLAGS ${expat_cflag})
if(UNIX)
    if(USE_32BITS)
        message(STATUS "using 32bits")
        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -m32")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m32")
    endif()
endif()
add_library(expat STATIC ${expat_sources})





