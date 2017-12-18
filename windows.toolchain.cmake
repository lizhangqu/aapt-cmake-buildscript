# 安装 mingw-w64
# sudo apt-get install mingw-w64
# windows 64位操作系统
# -DCMAKE_TOOLCHAIN_FILE=windows.toolchain.cmake
# windows 32位操作系统
# -DCMAKE_TOOLCHAIN_FILE=windows.toolchain.cmake -DUSE_32BITS=1

set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_SYSTEM_VERSION 1)
if(USE_32BITS)
    message(STATUS "using 32bits")
    set(CMAKE_SYSTEM_PROCESSOR x86)
else()
    set(CMAKE_SYSTEM_PROCESSOR x86_64)
endif(USE_32BITS)

if(USE_32BITS)
    set(CMAKE_C_COMPILER   i686-w64-mingw32-gcc)
    set(CMAKE_CXX_COMPILER i686-w64-mingw32-g++)
    SET(CMAKE_RC_COMPILER  i686-w64-mingw32-windres)
    set(CMAKE_AR           i686-w64-mingw32-ar CACHE FILEPATH "Archiver")
    set(CMAKE_RANLIB       i686-w64-mingw32-ranlib CACHE FILEPATH "Ranlib")
    set(CMAKE_ASM_COMPILER i686-w64-mingw32-as)
    set(CMAKE_LINKER       i686-w64-mingw32-ld)
    set(CMAKE_NM           i686-w64-mingw32-nm)
    set(CMAKE_OBJCOPY      i686-w64-mingw32-objcopy)
    set(CMAKE_OBJDUMP      i686-w64-mingw32-objdump)
    set(CMAKE_STRIP        i686-w64-mingw32-strip)
else()
    set(CMAKE_C_COMPILER   x86_64-w64-mingw32-gcc)
    set(CMAKE_CXX_COMPILER x86_64-w64-mingw32-g++)
    SET(CMAKE_RC_COMPILER  x86_64-w64-mingw32-windres)
    set(CMAKE_AR           x86_64-w64-mingw32-ar CACHE FILEPATH "Archiver")
    set(CMAKE_RANLIB       x86_64-w64-mingw32-ranlib CACHE FILEPATH "Ranlib")
    set(CMAKE_ASM_COMPILER x86_64-w64-mingw32-as)
    set(CMAKE_LINKER       x86_64-w64-mingw32-ld)
    set(CMAKE_NM           x86_64-w64-mingw32-nm)
    set(CMAKE_OBJCOPY      x86_64-w64-mingw32-objcopy)
    set(CMAKE_OBJDUMP      x86_64-w64-mingw32-objdump)
    set(CMAKE_STRIP        x86_64-w64-mingw32-strip)
endif(USE_32BITS)

message(STATUS "CMAKE_C_COMPILER = ${CMAKE_C_COMPILER}")
message(STATUS "CMAKE_CXX_COMPILER = ${CMAKE_CXX_COMPILER}")
message(STATUS "CMAKE_AR = ${CMAKE_AR}")
message(STATUS "CMAKE_RANLIB = ${CMAKE_RANLIB}")
message(STATUS "CMAKE_ASM_COMPILER = ${CMAKE_ASM_COMPILER}")
message(STATUS "CMAKE_LINKER = ${CMAKE_LINKER}")
message(STATUS "CMAKE_NM = ${CMAKE_NM}")
message(STATUS "CMAKE_OBJCOPY = ${CMAKE_OBJCOPY}")
message(STATUS "CMAKE_OBJDUMP = ${CMAKE_OBJDUMP}")
message(STATUS "CMAKE_STRIP = ${CMAKE_STRIP}")

# Set or retrieve the cached flags.
# This is necessary in case the user sets/changes flags in subsequent
# configures. If we included the flags in here, they would get
# overwritten.
set(CMAKE_C_FLAGS ""
        CACHE STRING "Flags used by the compiler during all build types.")
set(CMAKE_CXX_FLAGS ""
        CACHE STRING "Flags used by the compiler during all build types.")
set(CMAKE_ASM_FLAGS ""
        CACHE STRING "Flags used by the compiler during all build types.")
set(CMAKE_C_FLAGS_DEBUG ""
        CACHE STRING "Flags used by the compiler during debug builds.")
set(CMAKE_CXX_FLAGS_DEBUG ""
        CACHE STRING "Flags used by the compiler during debug builds.")
set(CMAKE_ASM_FLAGS_DEBUG ""
        CACHE STRING "Flags used by the compiler during debug builds.")
set(CMAKE_C_FLAGS_RELEASE ""
        CACHE STRING "Flags used by the compiler during release builds.")
set(CMAKE_CXX_FLAGS_RELEASE ""
        CACHE STRING "Flags used by the compiler during release builds.")
set(CMAKE_ASM_FLAGS_RELEASE ""
        CACHE STRING "Flags used by the compiler during release builds.")
set(CMAKE_MODULE_LINKER_FLAGS ""
        CACHE STRING "Flags used by the linker during the creation of modules.")
set(CMAKE_SHARED_LINKER_FLAGS ""
        CACHE STRING "Flags used by the linker during the creation of dll's.")
set(CMAKE_EXE_LINKER_FLAGS ""
        CACHE STRING "Flags used by the linker.")

set(CMAKE_C_FLAGS             "${CMAKE_C_FLAGS}")
set(CMAKE_CXX_FLAGS           "${CMAKE_CXX_FLAGS}")
set(CMAKE_ASM_FLAGS           "${CMAKE_ASM_FLAGS}")
set(CMAKE_C_FLAGS_DEBUG       "${CMAKE_C_FLAGS_DEBUG}")
set(CMAKE_CXX_FLAGS_DEBUG     "${CMAKE_CXX_FLAGS_DEBUG}")
set(CMAKE_ASM_FLAGS_DEBUG     "${CMAKE_ASM_FLAGS_DEBUG}")
set(CMAKE_C_FLAGS_RELEASE     "${CMAKE_C_FLAGS_RELEASE}")
set(CMAKE_CXX_FLAGS_RELEASE   "${CMAKE_CXX_FLAGS_RELEASE}")
set(CMAKE_ASM_FLAGS_RELEASE   "${CMAKE_ASM_FLAGS_RELEASE}")
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS}")
set(CMAKE_MODULE_LINKER_FLAGS "${CMAKE_MODULE_LINKER_FLAGS}")
set(CMAKE_EXE_LINKER_FLAGS    "${CMAKE_EXE_LINKER_FLAGS}")

if(USE_32BITS)
    set(CMAKE_FIND_ROOT_PATH /usr/i686-w64-mingw32)
else()
    set(CMAKE_FIND_ROOT_PATH /usr/x86_64-w64-mingw32)
endif(USE_32BITS)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLYONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE BOTH)
#make VERVOSE=1 to output the log