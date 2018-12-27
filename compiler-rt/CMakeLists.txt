cmake_minimum_required(VERSION 3.6)
project(compiler-rt)

if (UNIX AND NOT APPLE)
    SET(CMAKE_C_COMPILER "clang")
    SET(CMAKE_CXX_COMPILER "clang++")
endif ()

set(compiler_rt_sources
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/absvdi2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/absvsi2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/absvti2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/adddf3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/addsf3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/addtf3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/addvdi3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/addvsi3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/addvti3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/ashldi3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/ashlti3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/ashrdi3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/ashrti3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/clear_cache.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/clzdi2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/clzsi2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/clzti2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/cmpdi2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/cmpti2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/comparedf2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/comparesf2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/comparetf2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/ctzdi2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/ctzsi2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/ctzti2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/divdc3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/divdf3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/divdi3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/divmoddi4.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/divmodsi4.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/divsc3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/divsf3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/divsi3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/divtf3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/divti3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/divxc3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/eprintf.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/extenddftf2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/extendhfsf2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/extendsfdf2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/extendsftf2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/ffsdi2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/ffsti2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/fixdfdi.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/fixdfsi.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/fixdfti.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/fixsfdi.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/fixsfsi.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/fixsfti.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/fixtfdi.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/fixtfsi.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/fixtfti.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/fixunsdfdi.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/fixunsdfsi.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/fixunsdfti.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/fixunssfdi.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/fixunssfsi.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/fixunssfti.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/fixunstfdi.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/fixunstfsi.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/fixunstfti.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/fixunsxfdi.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/fixunsxfsi.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/fixunsxfti.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/fixxfdi.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/fixxfti.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/floatdidf.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/floatdisf.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/floatdixf.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/floatsidf.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/floatsisf.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/floatsitf.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/floattidf.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/floattisf.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/floattixf.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/floatundidf.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/floatundisf.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/floatundixf.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/floatunsidf.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/floatunsisf.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/floatunsitf.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/floatuntidf.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/floatuntisf.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/floatuntixf.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/gcc_personality_v0.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/int_util.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/lshrdi3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/lshrti3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/moddi3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/modsi3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/modti3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/muldc3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/muldf3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/muldi3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/mulodi4.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/mulosi4.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/muloti4.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/mulsc3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/mulsf3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/multf3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/multi3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/mulvdi3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/mulvsi3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/mulvti3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/mulxc3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/negdf2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/negdi2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/negsf2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/negti2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/negvdi2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/negvsi2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/negvti2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/paritydi2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/paritysi2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/parityti2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/popcountdi2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/popcountsi2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/popcountti2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/powidf2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/powisf2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/powitf2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/powixf2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/subdf3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/subsf3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/subtf3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/subvdi3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/subvsi3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/subvti3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/trampoline_setup.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/truncdfhf2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/truncdfsf2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/truncsfhf2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/trunctfdf2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/trunctfsf2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/ucmpdi2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/ucmpti2.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/udivdi3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/udivmoddi4.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/udivmodsi4.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/udivmodti4.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/udivsi3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/udivti3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/umoddi3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/umodsi3.c
         ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/umodti3.c
        )

        
if(UNIX)
    list(APPEND compiler_rt_sources  ${CMAKE_SOURCE_DIR}/external/compiler-rt/lib/builtins/enable_execute_stack.c)
endif()

set(compiler_rt_cflag "-Wno-unused-parameter -Werror")

if(UNIX)
    set(compiler_rt_cflag "${compiler_rt_cflag} -fPIC")
endif()

#添加宏定义，目的是为了移除一部分实现，如断言，否则编译成功，执行可能有问题
set(compiler_rt_cflag "${compiler_rt_cflag} -DNDEBUG -UDEBUG")

set(compiler_rt_cxxflag "${compiler_rt_cflag} -std=c++14")

include_directories(
        ${compiler_rt_header}
)

set(CMAKE_C_FLAGS ${compiler_rt_cflag})
set(CMAKE_CXX_FLAGS ${compiler_rt_cxxflag})
if(UNIX)
    if(USE_32BITS)
        message(STATUS "using 32bits")
        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -m32")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m32")
    endif()
endif()
add_library(compiler_rt STATIC ${compiler_rt_sources})
