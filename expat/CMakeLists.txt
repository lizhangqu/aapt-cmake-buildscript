cmake_minimum_required(VERSION 3.8)
project(expat)

set(expat_sources
        ${CMAKE_SOURCE_DIR}/external/expat/lib/xmlparse.c
        ${CMAKE_SOURCE_DIR}/external/expat/lib/xmlrole.c
        ${CMAKE_SOURCE_DIR}/external/expat/lib/xmltok.c
        )

include_directories(
        ${expat_header}
)

set(expat_cflag
        "-Wall -Werror -Wmissing-prototypes -Wstrict-prototypes -Wno-unused-parameter -Wno-missing-field-initializers -fexceptions -DHAVE_EXPAT_CONFIG_H"
        )

if(APPLE)
    set(expat_cflag "${expat_cflag} -fno-common")
elseif(UNIX)
endif()

#MESSAGE(STATUS "expat_cflag ${expat_cflag}")

set(CMAKE_C_FLAGS ${expat_cflag})
add_library(expat STATIC ${expat_sources})





