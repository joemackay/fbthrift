/**
 * Autogenerated by Thrift
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */

#include "src/gen-py3/module/metadata.h"

#include <thrift/lib/py3/metadata.h>

namespace cpp2 {
::apache::thrift::metadata::ThriftMetadata module_getThriftModuleMetadata() {
  ::apache::thrift::metadata::ThriftMetadata metadata;
  ::apache::thrift::metadata::ThriftServiceContext serviceContext;
  ::apache::thrift::detail::md::StructMetadata<Empty>::gen(metadata);
  ::apache::thrift::detail::md::StructMetadata<Nada>::gen(metadata);
  return metadata;
}
} // namespace cpp2
