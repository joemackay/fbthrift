#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#

from libc.stdint cimport (
    int8_t as cint8_t,
    int16_t as cint16_t,
    int32_t as cint32_t,
    int64_t as cint64_t,
    uint32_t as cuint32_t,
)
from libcpp.string cimport string
from libcpp cimport bool as cbool, nullptr, nullptr_t
from cpython cimport bool as pbool
from libcpp.memory cimport shared_ptr, unique_ptr
from libcpp.utility cimport move as cmove
from libcpp.vector cimport vector
from libcpp.set cimport set as cset
from libcpp.map cimport map as cmap, pair as cpair
from thrift.py3.exceptions cimport cTException
cimport folly.iobuf as __iobuf
cimport thrift.py3.exceptions
cimport thrift.py3.types
from thrift.py3.common cimport Protocol as __Protocol
from thrift.py3.types cimport (
    bstring,
    bytes_to_string,
    field_ref as __field_ref,
    optional_field_ref as __optional_field_ref,
    required_field_ref as __required_field_ref,
)
from folly.optional cimport cOptional as __cOptional

cimport my.namespacing.test.module.module.types_fields as __fbthrift_types_fields

cdef extern from "src/gen-py3/module/types.h":
  pass





cdef extern from "src/gen-cpp2/module_types_custom_protocol.h" namespace "::cpp2":
    cdef cppclass cFoo__isset "::cpp2::Foo::__isset":
        bint MyInt

    cdef cppclass cFoo "::cpp2::Foo":
        cFoo() except +
        cFoo(const cFoo&) except +
        bint operator==(cFoo&)
        bint operator!=(cFoo&)
        bint operator<(cFoo&)
        bint operator>(cFoo&)
        bint operator<=(cFoo&)
        bint operator>=(cFoo&)
        __field_ref[cint64_t] MyInt_ref()
        cint64_t MyInt
        cFoo__isset __isset




cdef class Foo(thrift.py3.types.Struct):
    cdef shared_ptr[cFoo] _cpp_obj
    cdef __fbthrift_types_fields.__Foo_FieldsSetter _fields_setter

    @staticmethod
    cdef create(shared_ptr[cFoo])



