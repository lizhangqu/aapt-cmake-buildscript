cmake_minimum_required(VERSION 3.8)
project(expat)

if(UNIX AND NOT APPLE)
    SET (CMAKE_C_COMPILER "/usr/bin/clang")
    SET (CMAKE_CXX_COMPILER "/usr/bin/clang++")
endif()

set(expat_sources
        ${CMAKE_SOURCE_DIR}/external/expat/lib/xmlparse.c
        ${CMAKE_SOURCE_DIR}/external/expat/lib/xmlrole.c
        ${CMAKE_SOURCE_DIR}/external/expat/lib/xmltok.c
        )

include_directories(
        ${expat_header}
)

set(expat_cflag "-Wall -Werror -Wmissing-prototypes -Wstrict-prototypes -Wno-unused-parameter -Wno-missing-field-initializers -fexceptions -DHAVE_EXPAT_CONFIG_H")

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
add_library(expat STATIC ${expat_sources})





