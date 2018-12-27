cmake_minimum_required(VERSION 3.6)
project(aprotoc)

if (UNIX AND NOT APPLE)
    SET(CMAKE_C_COMPILER "clang")
    SET(CMAKE_CXX_COMPILER "clang++")
endif ()

set(aprotoc_sources
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/any.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/arena.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/arenastring.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/descriptor.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/descriptor.pb.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/descriptor_database.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/dynamic_message.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/extension_set.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/extension_set_heavy.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/generated_message_reflection.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/generated_message_util.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/map_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/message.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/message_lite.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/reflection_ops.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/repeated_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/service.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/text_format.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/unknown_field_set.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/wire_format.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/wire_format_lite.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/code_generator.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/command_line_interface.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/cpp/cpp_enum.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/cpp/cpp_enum_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/cpp/cpp_extension.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/cpp/cpp_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/cpp/cpp_file.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/cpp/cpp_generator.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/cpp/cpp_helpers.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/cpp/cpp_map_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/cpp/cpp_message.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/cpp/cpp_message_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/cpp/cpp_primitive_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/cpp/cpp_service.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/cpp/cpp_string_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/csharp/csharp_doc_comment.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/csharp/csharp_enum.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/csharp/csharp_enum_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/csharp/csharp_field_base.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/csharp/csharp_generator.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/csharp/csharp_helpers.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/csharp/csharp_map_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/csharp/csharp_message.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/csharp/csharp_message_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/csharp/csharp_primitive_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/csharp/csharp_reflection_class.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/csharp/csharp_repeated_enum_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/csharp/csharp_repeated_message_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/csharp/csharp_repeated_primitive_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/csharp/csharp_source_generator_base.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/csharp/csharp_wrapper_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/importer.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/java/java_context.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/java/java_doc_comment.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/java/java_enum.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/java/java_enum_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/java/java_enum_field_lite.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/java/java_enum_lite.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/java/java_extension.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/java/java_extension_lite.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/java/java_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/java/java_file.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/java/java_generator.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/java/java_generator_factory.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/java/java_helpers.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/java/java_lazy_message_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/java/java_lazy_message_field_lite.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/java/java_map_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/java/java_map_field_lite.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/java/java_message_builder.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/java/java_message_builder_lite.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/java/java_message.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/java/java_message_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/java/java_message_field_lite.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/java/java_message_lite.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/java/java_name_resolver.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/java/java_primitive_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/java/java_primitive_field_lite.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/java/java_service.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/java/java_shared_code_generator.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/java/java_string_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/java/java_string_field_lite.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/javamicro/javamicro_enum.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/javamicro/javamicro_enum_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/javamicro/javamicro_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/javamicro/javamicro_file.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/javamicro/javamicro_generator.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/javamicro/javamicro_helpers.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/javamicro/javamicro_message.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/javamicro/javamicro_message_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/javamicro/javamicro_primitive_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/javanano/javanano_enum.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/javanano/javanano_enum_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/javanano/javanano_extension.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/javanano/javanano_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/javanano/javanano_file.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/javanano/javanano_generator.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/javanano/javanano_helpers.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/javanano/javanano_map_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/javanano/javanano_message.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/javanano/javanano_message_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/javanano/javanano_primitive_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/js/js_generator.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/main.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/objectivec/objectivec_enum.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/objectivec/objectivec_enum_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/objectivec/objectivec_extension.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/objectivec/objectivec_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/objectivec/objectivec_file.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/objectivec/objectivec_generator.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/objectivec/objectivec_helpers.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/objectivec/objectivec_map_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/objectivec/objectivec_message.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/objectivec/objectivec_message_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/objectivec/objectivec_oneof.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/objectivec/objectivec_primitive_field.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/parser.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/plugin.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/plugin.pb.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/python/python_generator.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/ruby/ruby_generator.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/subprocess.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/compiler/zip_writer.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/io/coded_stream.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/io/gzip_stream.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/io/printer.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/io/strtod.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/io/tokenizer.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/io/zero_copy_stream.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/io/zero_copy_stream_impl.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/io/zero_copy_stream_impl_lite.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/stubs/atomicops_internals_x86_gcc.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/stubs/atomicops_internals_x86_msvc.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/stubs/common.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/stubs/int128.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/stubs/once.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/stubs/status.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/stubs/stringpiece.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/stubs/structurally_valid.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/stubs/strutil.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/stubs/substitute.cc
        ${CMAKE_SOURCE_DIR}/external/protobuf/src/google/protobuf/stubs/stringprintf.cc
        )

set(aprotoc_cflag "-Wall -Wno-error=format -Wno-error=format-extra-args -Wno-error=ignored-qualifiers -Wno-error=sign-promo -Wno-unused-function -Werror -Wno-sign-compare -Wno-unused-parameter -Wno-sign-promo -Wno-error=return-type")

if(WIN32)
    set(aprotoc_cflag "${aprotoc_cflag} -Wno-error=maybe-uninitialized")
endif()


if(UNIX)
    set(aprotoc_cflag "${aprotoc_cflag} -fPIC")
endif()

#添加宏定义，目的是为了移除一部分实现，如断言，否则编译成功，执行可能有问题
set(aprotoc_cflag "${aprotoc_cflag} -DNDEBUG -UDEBUG")

#官方的编译选项中没有此项
set(aprotoc_cflag "${aprotoc_cflag} -Wno-deprecated-declarations")

#官方的编译选项中没有此项
if (APPLE)
    set(aprotoc_cflag "${aprotoc_cflag} -Wno-user-defined-warnings")
endif ()

set(aprotoc_cxxflag "${aprotoc_cflag} -std=gnu++14")

set(aprotoc_cxxflag "${aprotoc_cxxflag}")

include_directories(
        ${protobuf_header}
)

set(CMAKE_C_FLAGS ${aprotoc_cflag})
set(CMAKE_CXX_FLAGS ${aprotoc_cxxflag})
if(UNIX)
    if(USE_32BITS)
        message(STATUS "using 32bits")
        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -m32")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m32")
    endif()
endif()
add_executable(aprotoc ${aprotoc_sources})
target_link_libraries(aprotoc zlib)


