cmake_minimum_required(VERSION 3.8)
project(aapt2_static)

if(UNIX AND NOT APPLE)
    SET (CMAKE_C_COMPILER "/usr/bin/clang")
    SET (CMAKE_CXX_COMPILER "/usr/bin/clang++")
endif()

set(aapt2_static_sources
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/cmd/Compile.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/cmd/Diff.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/cmd/Dump.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/cmd/Link.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/cmd/Optimize.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/cmd/Util.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/compile/IdAssigner.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/compile/InlineXmlFormatParser.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/compile/NinePatch.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/compile/Png.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/compile/PngChunkFilter.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/compile/PngCrunch.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/compile/PseudolocaleGenerator.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/compile/Pseudolocalizer.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/compile/XmlIdCollector.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/configuration/ConfigurationParser.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/filter/AbiFilter.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/filter/ConfigFilter.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/flatten/Archive.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/flatten/TableFlattener.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/flatten/XmlFlattener.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/io/BigBufferStreams.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/io/File.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/io/FileInputStream.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/io/FileSystem.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/io/StringInputStream.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/io/Util.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/io/ZipArchive.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/link/AutoVersioner.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/link/ManifestFixer.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/link/ProductFilter.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/link/PrivateAttributeMover.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/link/ReferenceLinker.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/link/TableMerger.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/link/XmlCompatVersioner.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/link/XmlNamespaceRemover.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/link/XmlReferenceLinker.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/optimize/ResourceDeduper.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/optimize/VersionCollapser.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/process/SymbolTable.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/proto/ProtoHelpers.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/proto/TableProtoDeserializer.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/proto/TableProtoSerializer.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/split/TableSplitter.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/text/Unicode.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/text/Utf8Iterator.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/unflatten/BinaryResourceParser.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/unflatten/ResChunkPullParser.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/util/BigBuffer.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/util/Files.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/util/Util.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/ConfigDescription.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/Debug.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/DominatorTree.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/Flags.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/java/AnnotationProcessor.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/java/ClassDefinition.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/java/JavaClassGenerator.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/java/ManifestClassGenerator.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/java/ProguardRules.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/LoadedApk.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/Locale.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/Resource.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/ResourceParser.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/ResourceTable.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/ResourceUtils.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/ResourceValues.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/SdkConstants.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/StringPool.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/xml/XmlActionExecutor.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/xml/XmlDom.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/xml/XmlPullParser.cpp
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/xml/XmlUtil.cpp
        #生成的文件在这个目录
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/frameworks/base/tools/aapt2/Resources.pb.cc
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/frameworks/base/tools/aapt2/ResourcesInternal.pb.cc
        )

set(aapt2_static_cflag "-Werror -Wall -Wno-unused-parameter")

if(UNIX AND NOT APPLE)
    set(aapt2_static_cflag "${aapt2_static_cflag} -Wno-unused-variable")
endif()

#启用libcxx
set(aapt2_static_cflag "${aapt2_static_cflag} ${global_libcxx_cxxflags}")

#添加宏定义，目的是为了移除一部分实现，如断言，否则编译成功，执行可能有问题
set(aapt2_static_cflag "${aapt2_static_cflag} -DNDEBUG -UDEBUG")

if (APPLE)
    set(aapt2_static_cflag "${aapt2_static_cflag} -D_DARWIN_UNLIMITED_STREAMS")
endif ()

#官方的编译选项中没有此项
set(aapt2_static_cflag "${aapt2_static_cflag} -Wno-deprecated-declarations")

set(aapt2_static_cxxflag "${aapt2_static_cflag} -std=gnu++14 -Wno-missing-field-initializers -fno-exceptions")

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
        #生成的文件头文件
        ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2/frameworks/base/tools/aapt2/
)

set(CMAKE/C_FLAGS ${aapt2_static_cflag})
set(CMAKE_CXX_FLAGS ${aapt2_static_cxxflag})

add_library(aapt2_static STATIC ${aapt2_static_sources})
target_link_libraries(aapt2_static expat androidfw base cutils log png utils ziparchive zlib protobuf cxx cxxabi compiler_rt)

MESSAGE(STATUS "如果在cmake里调用aprotoc将.proto文件转为.cc和.h时会出现找不到文件的问题，将对应命令拷贝到命令行执行，生成Format.pb.cc和Format.pb.h")
MESSAGE(STATUS "======================================命令开始======================================")
MESSAGE(STATUS "cd ${CMAKE_SOURCE_DIR}/frameworks/base/tools/aapt2 && ${CMAKE_BINARY_DIR}/buildscript/protobuf/aprotoc/aprotoc --cpp_out=. Format.proto")
MESSAGE(STATUS "======================================命令结束======================================")
add_custom_target(protobuffer_h
        WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
        COMMAND ${CMAKE_BINARY_DIR}/buildscript/protobuf/aprotoc/aprotoc frameworks/base/tools/aapt2/Resources.proto frameworks/base/tools/aapt2/ResourcesInternal.proto  --cpp_out=frameworks/base/tools/aapt2
        DEPENDS aprotoc
        )
add_dependencies(aapt2_static protobuffer_h)
