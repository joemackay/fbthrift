#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#

from libcpp.memory cimport shared_ptr, make_shared, unique_ptr, make_unique
from libcpp.string cimport string
from libcpp cimport bool as cbool
from libcpp.iterator cimport inserter as cinserter
from cpython cimport bool as pbool
from libc.stdint cimport int8_t, int16_t, int32_t, int64_t, uint32_t
from cython.operator cimport dereference as deref, preincrement as inc
import thrift.py3.types
cimport thrift.py3.types
cimport thrift.py3.exceptions
from thrift.py3.types import NOTSET
from thrift.py3.types cimport translate_cpp_enum_to_python
cimport thrift.py3.std_libcpp as std_libcpp
from thrift.py3.serializer cimport IOBuf
from thrift.py3.serializer import Protocol
cimport thrift.py3.serializer as serializer
from thrift.py3.serializer import deserialize, serialize
from folly.optional cimport cOptional

import sys
import itertools
from collections import Sequence, Set, Mapping, Iterable
from enum import Enum
import warnings
cimport includes.types as _includes_types
import includes.types as _includes_types




cdef cMyStruct _MyStruct_defaults = cMyStruct()

cdef class MyStruct(thrift.py3.types.Struct):

    def __init__(
        MyStruct self,
        MyIncludedField=None,
        MyOtherIncludedField=None,
        MyIncludedInt=None
    ):
        self._cpp_obj = move(MyStruct._make_instance(
          NULL,
          MyIncludedField,
          MyOtherIncludedField,
          MyIncludedInt,
        ))

    def __call__(
        MyStruct self,
        MyIncludedField=NOTSET,
        MyOtherIncludedField=NOTSET,
        MyIncludedInt=NOTSET
    ):
        changes = any((
            MyIncludedField is not NOTSET,

            MyOtherIncludedField is not NOTSET,

            MyIncludedInt is not NOTSET,
        ))

        if not changes:
            return self

        inst = <MyStruct>MyStruct.__new__(MyStruct)
        inst._cpp_obj = move(MyStruct._make_instance(
          self._cpp_obj.get(),
          MyIncludedField,
          MyOtherIncludedField,
          MyIncludedInt,
        ))
        return inst

    @staticmethod
    cdef unique_ptr[cMyStruct] _make_instance(
        cMyStruct* base_instance,
        object MyIncludedField,
        object MyOtherIncludedField,
        object MyIncludedInt
    ) except *:
        cdef unique_ptr[cMyStruct] c_inst
        if base_instance:
            c_inst = make_unique[cMyStruct](deref(base_instance))
        else:
            c_inst = make_unique[cMyStruct]()

        if base_instance:
            # Convert None's to default value.
            if MyIncludedField is None:
                deref(c_inst).MyIncludedField = _MyStruct_defaults.MyIncludedField
                deref(c_inst).__isset.MyIncludedField = False
            elif MyIncludedField is NOTSET:
                MyIncludedField = None

            if MyOtherIncludedField is None:
                deref(c_inst).MyOtherIncludedField = _MyStruct_defaults.MyOtherIncludedField
                deref(c_inst).__isset.MyOtherIncludedField = False
            elif MyOtherIncludedField is NOTSET:
                MyOtherIncludedField = None

            if MyIncludedInt is None:
                deref(c_inst).MyIncludedInt = _MyStruct_defaults.MyIncludedInt
                deref(c_inst).__isset.MyIncludedInt = False
            elif MyIncludedInt is NOTSET:
                MyIncludedInt = None

        if MyIncludedField is not None:
            deref(c_inst).MyIncludedField = deref((<_includes_types.Included?> MyIncludedField)._cpp_obj)
            deref(c_inst).__isset.MyIncludedField = True

        if MyOtherIncludedField is not None:
            deref(c_inst).MyOtherIncludedField = deref((<_includes_types.Included?> MyOtherIncludedField)._cpp_obj)
            deref(c_inst).__isset.MyOtherIncludedField = True

        if MyIncludedInt is not None:
            deref(c_inst).MyIncludedInt = MyIncludedInt
            deref(c_inst).__isset.MyIncludedInt = True

        # in C++ you don't have to call move(), but this doesn't translate
        # into a C++ return statement, so you do here
        return move_unique(c_inst)

    def __iter__(self):
        yield 'MyIncludedField', self.MyIncludedField
        yield 'MyOtherIncludedField', self.MyOtherIncludedField
        yield 'MyIncludedInt', self.MyIncludedInt

    def __bool__(self):
        return deref(self._cpp_obj).__isset.MyIncludedField or deref(self._cpp_obj).__isset.MyOtherIncludedField or deref(self._cpp_obj).__isset.MyIncludedInt

    @staticmethod
    cdef create(shared_ptr[cMyStruct] cpp_obj):
        inst = <MyStruct>MyStruct.__new__(MyStruct)
        inst._cpp_obj = cpp_obj
        return inst

    @property
    def MyIncludedField(self):
        if self.__MyIncludedField is None:
            self.__MyIncludedField = _includes_types.Included.create(make_shared[_includes_types.cIncluded](deref(self._cpp_obj).MyIncludedField))
        return self.__MyIncludedField

    @property
    def MyOtherIncludedField(self):
        if not deref(self._cpp_obj).__isset.MyOtherIncludedField:
            return None

        if self.__MyOtherIncludedField is None:
            self.__MyOtherIncludedField = _includes_types.Included.create(make_shared[_includes_types.cIncluded](deref(self._cpp_obj).MyOtherIncludedField))
        return self.__MyOtherIncludedField

    @property
    def MyIncludedInt(self):
        return self._cpp_obj.get().MyIncludedInt


    def __hash__(MyStruct self):
        if not self.__hash:
            self.__hash = hash((
            self.MyIncludedField,
            self.MyOtherIncludedField,
            self.MyIncludedInt,
            ))
        return self.__hash

    def __repr__(MyStruct self):
        return f'MyStruct(MyIncludedField={repr(self.MyIncludedField)}, MyOtherIncludedField={repr(self.MyOtherIncludedField)}, MyIncludedInt={repr(self.MyIncludedInt)})'
    def __richcmp__(self, other, op):
        cdef int cop = op
        if cop not in (2, 3):
            raise TypeError("unorderable types: {}, {}".format(self, other))
        if not (
                isinstance(self, MyStruct) and
                isinstance(other, MyStruct)):
            if cop == 2:  # different types are never equal
                return False
            else:         # different types are always notequal
                return True

        cdef cMyStruct cself = deref((<MyStruct>self)._cpp_obj)
        cdef cMyStruct cother = deref((<MyStruct>other)._cpp_obj)
        cdef cbool cmp = cself == cother
        if cop == 2:
            return cmp
        return not cmp

    cdef bytes _serialize(MyStruct self, proto):
        cdef string c_str
        if proto is Protocol.COMPACT:
            serializer.CompactSerialize[cMyStruct](deref(self._cpp_obj.get()), &c_str)
        elif proto is Protocol.BINARY:
            serializer.BinarySerialize[cMyStruct](deref(self._cpp_obj.get()), &c_str)
        elif proto is Protocol.JSON:
            serializer.JSONSerialize[cMyStruct](deref(self._cpp_obj.get()), &c_str)
        return <bytes> c_str

    cdef uint32_t _deserialize(MyStruct self, const IOBuf* buf, proto):
        cdef uint32_t needed
        if proto is Protocol.COMPACT:
            needed = serializer.CompactDeserialize[cMyStruct](buf, deref(self._cpp_obj.get()))
        elif proto is Protocol.BINARY:
            needed = serializer.BinaryDeserialize[cMyStruct](buf, deref(self._cpp_obj.get()))
        elif proto is Protocol.JSON:
            needed = serializer.JSONDeserialize[cMyStruct](buf, deref(self._cpp_obj.get()))
        return needed

    def __reduce__(self):
        return (deserialize, (MyStruct, serialize(self)))


