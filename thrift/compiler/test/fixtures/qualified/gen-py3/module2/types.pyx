#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#
cimport cython as __cython
from cpython.bytes cimport PyBytes_AsStringAndSize
from cpython.object cimport PyTypeObject, Py_LT, Py_LE, Py_EQ, Py_NE, Py_GT, Py_GE
from libcpp.memory cimport shared_ptr, make_shared, unique_ptr, make_unique
from libcpp.string cimport string
from libcpp cimport bool as cbool
from libcpp.iterator cimport inserter as cinserter
from cpython cimport bool as pbool
from cython.operator cimport dereference as deref, preincrement as inc, address as ptr_address
import thrift.py3.types
cimport thrift.py3.types
cimport thrift.py3.exceptions
from thrift.py3.std_libcpp cimport sv_to_str as __sv_to_str, string_view as __cstring_view
from thrift.py3.types cimport (
    cSetOp as __cSetOp,
    richcmp as __richcmp,
    set_op as __set_op,
    setcmp as __setcmp,
    list_index as __list_index,
    list_count as __list_count,
    list_slice as __list_slice,
    list_getitem as __list_getitem,
    set_iter as __set_iter,
    map_iter as __map_iter,
    map_contains as __map_contains,
    map_getitem as __map_getitem,
    reference_shared_ptr as __reference_shared_ptr,
    get_field_name_by_index as __get_field_name_by_index,
    reset_field as __reset_field,
    translate_cpp_enum_to_python,
    SetMetaClass as __SetMetaClass,
    const_pointer_cast,
    constant_shared_ptr,
    NOTSET as __NOTSET,
    EnumData as __EnumData,
    EnumFlagsData as __EnumFlagsData,
    UnionTypeEnumData as __UnionTypeEnumData,
    createEnumDataForUnionType as __createEnumDataForUnionType,
)
cimport thrift.py3.std_libcpp as std_libcpp
cimport thrift.py3.serializer as serializer
import folly.iobuf as __iobuf
from folly.optional cimport cOptional
from folly.memory cimport to_shared_ptr as __to_shared_ptr
from folly.range cimport Range as __cRange

import sys
from collections.abc import Sequence, Set, Mapping, Iterable
import weakref as __weakref
import builtins as _builtins
cimport module0.types as _module0_types
import module0.types as _module0_types
cimport module1.types as _module1_types
import module1.types as _module1_types

cimport module2.types_reflection as _types_reflection



@__cython.auto_pickle(False)
cdef class Struct(thrift.py3.types.Struct):
    def __init__(Struct self, **kwargs):
        self._cpp_obj = make_shared[cStruct]()
        self._fields_setter = __fbthrift_types_fields.__Struct_FieldsSetter.create(self._cpp_obj.get())
        super().__init__(**kwargs)

    def __call__(Struct self, **kwargs):
        if not kwargs:
            return self
        cdef Struct __fbthrift_inst = Struct.__new__(Struct)
        __fbthrift_inst._cpp_obj = make_shared[cStruct](deref(self._cpp_obj))
        __fbthrift_inst._fields_setter = __fbthrift_types_fields.__Struct_FieldsSetter.create(__fbthrift_inst._cpp_obj.get())
        for __fbthrift_name, __fbthrift_value in kwargs.items():
            __fbthrift_inst.__fbthrift_set_field(__fbthrift_name, __fbthrift_value)
        return __fbthrift_inst

    cdef void __fbthrift_set_field(self, str name, object value) except *:
        self._fields_setter.set_field(name.encode("utf-8"), value)

    cdef object __fbthrift_isset(self):
        return thrift.py3.types._IsSet("Struct", {
          "first": deref(self._cpp_obj).first_ref().has_value(),
          "second": deref(self._cpp_obj).second_ref().has_value(),
        })

    @staticmethod
    cdef create(shared_ptr[cStruct] cpp_obj):
        __fbthrift_inst = <Struct>Struct.__new__(Struct)
        __fbthrift_inst._cpp_obj = cmove(cpp_obj)
        return __fbthrift_inst

    @property
    def first(self):

        if self.__fbthrift_cached_first is None:
            self.__fbthrift_cached_first = _module0_types.Struct.create(__reference_shared_ptr(deref(self._cpp_obj).first_ref().ref(), self._cpp_obj))
        return self.__fbthrift_cached_first

    @property
    def second(self):

        if self.__fbthrift_cached_second is None:
            self.__fbthrift_cached_second = _module1_types.Struct.create(__reference_shared_ptr(deref(self._cpp_obj).second_ref().ref(), self._cpp_obj))
        return self.__fbthrift_cached_second


    def __hash__(Struct self):
        return  super().__hash__()

    def __copy__(Struct self):
        cdef shared_ptr[cStruct] cpp_obj = make_shared[cStruct](
            deref(self._cpp_obj)
        )
        return Struct.create(cmove(cpp_obj))

    def __richcmp__(self, other, int op):
        r = self.__cmp_sametype(other, op)
        return __richcmp[cStruct](
            self._cpp_obj,
            (<Struct>other)._cpp_obj,
            op,
        ) if r is None else r

    @staticmethod
    def __get_reflection__():
        return _types_reflection.get_reflection__Struct()

    cdef __cstring_view __fbthrift_get_field_name_by_index(self, size_t idx):
        return __get_field_name_by_index[cStruct](idx)

    def __cinit__(self):
        self.__fbthrift_struct_size = 2

    cdef __iobuf.IOBuf _serialize(Struct self, __Protocol proto):
        cdef unique_ptr[__iobuf.cIOBuf] data
        with nogil:
            data = cmove(serializer.cserialize[cStruct](self._cpp_obj.get(), proto))
        return __iobuf.from_unique_ptr(cmove(data))

    cdef cuint32_t _deserialize(Struct self, const __iobuf.cIOBuf* buf, __Protocol proto) except? 0:
        cdef cuint32_t needed
        self._cpp_obj = make_shared[cStruct]()
        with nogil:
            needed = serializer.cdeserialize[cStruct](buf, self._cpp_obj.get(), proto)
        return needed


@__cython.auto_pickle(False)
cdef class BigStruct(thrift.py3.types.Struct):
    def __init__(BigStruct self, **kwargs):
        self._cpp_obj = make_shared[cBigStruct]()
        self._fields_setter = __fbthrift_types_fields.__BigStruct_FieldsSetter.create(self._cpp_obj.get())
        super().__init__(**kwargs)

    def __call__(BigStruct self, **kwargs):
        if not kwargs:
            return self
        cdef BigStruct __fbthrift_inst = BigStruct.__new__(BigStruct)
        __fbthrift_inst._cpp_obj = make_shared[cBigStruct](deref(self._cpp_obj))
        __fbthrift_inst._fields_setter = __fbthrift_types_fields.__BigStruct_FieldsSetter.create(__fbthrift_inst._cpp_obj.get())
        for __fbthrift_name, __fbthrift_value in kwargs.items():
            __fbthrift_inst.__fbthrift_set_field(__fbthrift_name, __fbthrift_value)
        return __fbthrift_inst

    cdef void __fbthrift_set_field(self, str name, object value) except *:
        self._fields_setter.set_field(name.encode("utf-8"), value)

    cdef object __fbthrift_isset(self):
        return thrift.py3.types._IsSet("BigStruct", {
          "s": deref(self._cpp_obj).s_ref().has_value(),
          "id": deref(self._cpp_obj).id_ref().has_value(),
        })

    @staticmethod
    cdef create(shared_ptr[cBigStruct] cpp_obj):
        __fbthrift_inst = <BigStruct>BigStruct.__new__(BigStruct)
        __fbthrift_inst._cpp_obj = cmove(cpp_obj)
        return __fbthrift_inst

    @property
    def s(self):

        if self.__fbthrift_cached_s is None:
            self.__fbthrift_cached_s = Struct.create(__reference_shared_ptr(deref(self._cpp_obj).s_ref().ref(), self._cpp_obj))
        return self.__fbthrift_cached_s

    @property
    def id(self):

        return deref(self._cpp_obj).id_ref().value()


    def __hash__(BigStruct self):
        return  super().__hash__()

    def __copy__(BigStruct self):
        cdef shared_ptr[cBigStruct] cpp_obj = make_shared[cBigStruct](
            deref(self._cpp_obj)
        )
        return BigStruct.create(cmove(cpp_obj))

    def __richcmp__(self, other, int op):
        r = self.__cmp_sametype(other, op)
        return __richcmp[cBigStruct](
            self._cpp_obj,
            (<BigStruct>other)._cpp_obj,
            op,
        ) if r is None else r

    @staticmethod
    def __get_reflection__():
        return _types_reflection.get_reflection__BigStruct()

    cdef __cstring_view __fbthrift_get_field_name_by_index(self, size_t idx):
        return __get_field_name_by_index[cBigStruct](idx)

    def __cinit__(self):
        self.__fbthrift_struct_size = 2

    cdef __iobuf.IOBuf _serialize(BigStruct self, __Protocol proto):
        cdef unique_ptr[__iobuf.cIOBuf] data
        with nogil:
            data = cmove(serializer.cserialize[cBigStruct](self._cpp_obj.get(), proto))
        return __iobuf.from_unique_ptr(cmove(data))

    cdef cuint32_t _deserialize(BigStruct self, const __iobuf.cIOBuf* buf, __Protocol proto) except? 0:
        cdef cuint32_t needed
        self._cpp_obj = make_shared[cBigStruct]()
        with nogil:
            needed = serializer.cdeserialize[cBigStruct](buf, self._cpp_obj.get(), proto)
        return needed


c2 = Struct.create(constant_shared_ptr(cc2()))
c3 = Struct.create(constant_shared_ptr(cc3()))
c4 = Struct.create(constant_shared_ptr(cc4()))
