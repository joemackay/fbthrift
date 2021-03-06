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
from folly cimport cFollyTry
from cpython.ref cimport PyObject
from thrift.py3.stream cimport (
    ClientBufferedStream, cClientBufferedStream, cClientBufferedStreamWrapper,
    ResponseAndClientBufferedStream, cResponseAndClientBufferedStream,
    ServerStream, cServerStream, ResponseAndServerStream
)
from thrift.py3.common cimport RpcOptions as __RpcOptions

cimport module.types_fields as __fbthrift_types_fields

cdef extern from "src/gen-py3/module/types.h":
  pass





cdef extern from "src/gen-cpp2/module_types_custom_protocol.h" namespace "::cpp2":
    cdef cppclass cFooEx__isset "::cpp2::FooEx::__isset":
        pass

    cdef cppclass cFooEx "::cpp2::FooEx"(cTException):
        cFooEx() except +
        cFooEx(const cFooEx&) except +
        bint operator==(cFooEx&)
        bint operator!=(cFooEx&)
        bint operator<(cFooEx&)
        bint operator>(cFooEx&)
        bint operator<=(cFooEx&)
        bint operator>=(cFooEx&)
        cFooEx__isset __isset




cdef class FooEx(thrift.py3.exceptions.GeneratedError):
    cdef shared_ptr[cFooEx] _cpp_obj
    cdef __fbthrift_types_fields.__FooEx_FieldsSetter _fields_setter

    @staticmethod
    cdef create(shared_ptr[cFooEx])




cdef class ClientBufferedStream__i32(ClientBufferedStream):
    cdef unique_ptr[cClientBufferedStreamWrapper[cint32_t]] _gen

    @staticmethod
    cdef create(cClientBufferedStream[cint32_t]& c_obj, __RpcOptions rpc_options)

    @staticmethod
    cdef void callback(
        cFollyTry[__cOptional[cint32_t]]&& res,
        PyObject* userdata,
    )

cdef class ServerStream__i32(ServerStream):
    pass


cdef class ResponseAndClientBufferedStream__i32_i32(ResponseAndClientBufferedStream):
    cdef ClientBufferedStream__i32 _stream
    cdef cint32_t _response

    @staticmethod
    cdef create(cResponseAndClientBufferedStream[cint32_t, cint32_t]& c_obj, __RpcOptions rpc_options)


cdef class ResponseAndServerStream__i32_i32(ResponseAndServerStream):
    pass

