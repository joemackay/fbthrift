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




cdef cFoo _Foo_defaults = cFoo()

cdef class Foo(thrift.py3.types.Struct):

    def __init__(
        Foo self,
        myInteger=None,
        myString=None,
        myBools=None,
        myNumbers=None
    ):
        self._cpp_obj = move(Foo._make_instance(
          NULL,
          myInteger,
          myString,
          myBools,
          myNumbers,
        ))

    def __call__(
        Foo self,
        myInteger=NOTSET,
        myString=NOTSET,
        myBools=NOTSET,
        myNumbers=NOTSET
    ):
        changes = any((
            myInteger is not NOTSET,

            myString is not NOTSET,

            myBools is not NOTSET,

            myNumbers is not NOTSET,
        ))

        if not changes:
            return self

        inst = <Foo>Foo.__new__(Foo)
        inst._cpp_obj = move(Foo._make_instance(
          self._cpp_obj.get(),
          myInteger,
          myString,
          myBools,
          myNumbers,
        ))
        return inst

    @staticmethod
    cdef unique_ptr[cFoo] _make_instance(
        cFoo* base_instance,
        object myInteger,
        object myString,
        object myBools,
        object myNumbers
    ) except *:
        cdef unique_ptr[cFoo] c_inst
        if base_instance:
            c_inst = make_unique[cFoo](deref(base_instance))
        else:
            c_inst = make_unique[cFoo]()

        if base_instance:
            # Convert None's to default value.
            if myInteger is None:
                deref(c_inst).myInteger = _Foo_defaults.myInteger
            elif myInteger is NOTSET:
                myInteger = None

            if myString is None:
                deref(c_inst).myString = _Foo_defaults.myString
                deref(c_inst).__isset.myString = False
            elif myString is NOTSET:
                myString = None

            if myBools is None:
                deref(c_inst).myBools = _Foo_defaults.myBools
                deref(c_inst).__isset.myBools = False
            elif myBools is NOTSET:
                myBools = None

            if myNumbers is None:
                deref(c_inst).myNumbers = _Foo_defaults.myNumbers
            elif myNumbers is NOTSET:
                myNumbers = None

        if myInteger is not None:
            deref(c_inst).myInteger = myInteger
        if myString is not None:
            deref(c_inst).myString = myString.encode('UTF-8')
            deref(c_inst).__isset.myString = True

        if myBools is not None:
            deref(c_inst).myBools = <vector[cbool]>deref(List__bool(myBools)._cpp_obj)
            deref(c_inst).__isset.myBools = True

        if myNumbers is not None:
            deref(c_inst).myNumbers = <vector[int32_t]>deref(List__i32(myNumbers)._cpp_obj)
        # in C++ you don't have to call move(), but this doesn't translate
        # into a C++ return statement, so you do here
        return move_unique(c_inst)

    def __iter__(self):
        yield 'myInteger', self.myInteger
        yield 'myString', self.myString
        yield 'myBools', self.myBools
        yield 'myNumbers', self.myNumbers

    def __bool__(self):
        return True or deref(self._cpp_obj).__isset.myString or deref(self._cpp_obj).__isset.myBools or True

    @staticmethod
    cdef create(shared_ptr[cFoo] cpp_obj):
        inst = <Foo>Foo.__new__(Foo)
        inst._cpp_obj = cpp_obj
        return inst

    @property
    def myInteger(self):
        return self._cpp_obj.get().myInteger

    @property
    def myString(self):
        if not deref(self._cpp_obj).__isset.myString:
            return None

        return (<bytes>self._cpp_obj.get().myString).decode('UTF-8')

    @property
    def myBools(self):
        if not deref(self._cpp_obj).__isset.myBools:
            return None

        if self.__myBools is None:
            self.__myBools = List__bool.create(make_shared[vector[cbool]](deref(self._cpp_obj).myBools))
        return self.__myBools

    @property
    def myNumbers(self):
        if self.__myNumbers is None:
            self.__myNumbers = List__i32.create(make_shared[vector[int32_t]](deref(self._cpp_obj).myNumbers))
        return self.__myNumbers


    def __hash__(Foo self):
        if not self.__hash:
            self.__hash = hash((
            self.myInteger,
            self.myString,
            self.myBools,
            self.myNumbers,
            ))
        return self.__hash

    def __repr__(Foo self):
        return f'Foo(myInteger={repr(self.myInteger)}, myString={repr(self.myString)}, myBools={repr(self.myBools)}, myNumbers={repr(self.myNumbers)})'
    def __richcmp__(self, other, op):
        cdef int cop = op
        if cop not in (2, 3):
            raise TypeError("unorderable types: {}, {}".format(self, other))
        if not (
                isinstance(self, Foo) and
                isinstance(other, Foo)):
            if cop == 2:  # different types are never equal
                return False
            else:         # different types are always notequal
                return True

        cdef cFoo cself = deref((<Foo>self)._cpp_obj)
        cdef cFoo cother = deref((<Foo>other)._cpp_obj)
        cdef cbool cmp = cself == cother
        if cop == 2:
            return cmp
        return not cmp

    cdef bytes _serialize(Foo self, proto):
        cdef string c_str
        if proto is Protocol.COMPACT:
            serializer.CompactSerialize[cFoo](deref(self._cpp_obj.get()), &c_str)
        elif proto is Protocol.BINARY:
            serializer.BinarySerialize[cFoo](deref(self._cpp_obj.get()), &c_str)
        elif proto is Protocol.JSON:
            serializer.JSONSerialize[cFoo](deref(self._cpp_obj.get()), &c_str)
        return <bytes> c_str

    cdef uint32_t _deserialize(Foo self, const IOBuf* buf, proto):
        cdef uint32_t needed
        if proto is Protocol.COMPACT:
            needed = serializer.CompactDeserialize[cFoo](buf, deref(self._cpp_obj.get()))
        elif proto is Protocol.BINARY:
            needed = serializer.BinaryDeserialize[cFoo](buf, deref(self._cpp_obj.get()))
        elif proto is Protocol.JSON:
            needed = serializer.JSONDeserialize[cFoo](buf, deref(self._cpp_obj.get()))
        return needed

    def __reduce__(self):
        return (deserialize, (Foo, serialize(self)))


cdef class List__bool:
    def __init__(self, items=None):
        if isinstance(items, List__bool):
            self._cpp_obj = (<List__bool> items)._cpp_obj
        else:
            self._cpp_obj = move(List__bool._make_instance(items))

    @staticmethod
    cdef create(shared_ptr[vector[cbool]] c_items):
        inst = <List__bool>List__bool.__new__(List__bool)
        inst._cpp_obj = c_items
        return inst

    @staticmethod
    cdef unique_ptr[vector[cbool]] _make_instance(object items) except *:
        cdef unique_ptr[vector[cbool]] c_inst = make_unique[vector[cbool]]()
        if items:
            for item in items:
                deref(c_inst).push_back(item)
        return move_unique(c_inst)

    def __add__(object self, object other):
        return type(self)(itertools.chain(self, other))

    def __getitem__(self, object index_obj):
        cdef shared_ptr[vector[cbool]] c_inst
        cdef cbool citem
        if isinstance(index_obj, slice):
            c_inst = make_shared[vector[cbool]]()
            start_val = index_obj.start
            stop_val = index_obj.stop
            step_val = index_obj.step
            sz = deref(self._cpp_obj).size()

            if step_val == 0 or step_val is None:
                step_val = 1
            if step_val > 0:
                if start_val is None:
                    start_val = 0
                elif start_val > sz:
                    start_val = sz
                if stop_val is None:
                    stop_val = sz
                elif stop_val > sz:
                    stop_val = sz
            else:
                if start_val is None:
                    start_val = sz - 1
                elif start_val > sz - 1:
                    start_val = sz - 1
                if stop_val is None:
                    stop_val = -1
                elif stop_val > sz - 1:
                    stop_val = sz - 1

            index = start_val
            while ((step_val > 0 and index < stop_val) or
                   (step_val < 0 and index > stop_val)):
                citem = deref(self._cpp_obj.get())[index]
                deref(c_inst).push_back(citem)
                index += step_val
            return List__bool.create(c_inst)
        else:
            index = <int?>index_obj
            size = len(self)
            # Convert a negative index
            if index < 0:
                index = size + index
            if index >= size or index < 0:
                raise IndexError('list index out of range')
            citem = deref(self._cpp_obj.get())[index]
            return citem

    def __len__(self):
        return deref(self._cpp_obj).size()

    def __richcmp__(self, other, op):
        cdef int cop = op
        if cop not in (2, 3):
            raise TypeError("unorderable types: {}, {}".format(type(self), type(other)))
        if not (isinstance(self, Iterable) and isinstance(other, Iterable)):
            return cop != 2
        if (len(self) != len(other)):
            return cop != 2

        for one, two in zip(self, other):
            if one != two:
                return cop != 2

        return cop == 2

    def __hash__(self):
        if not self.__hash:
            self.__hash = hash(tuple(self))
        return self.__hash

    def __contains__(self, item):
        if not self:
            return False
        cdef cbool citem = item
        cdef vector[cbool] vec = deref(
            self._cpp_obj.get())
        return std_libcpp.find(vec.begin(), vec.end(), citem) != vec.end()

    def __iter__(self):
        if not self:
            raise StopIteration
        cdef cbool citem
        for citem in deref(self._cpp_obj):
            yield citem

    def __repr__(self):
        if not self:
            return 'i[]'
        return f'i[{", ".join(map(repr, self))}]'

    def __reversed__(self):
        if not self:
            raise StopIteration
        cdef cbool citem
        cdef vector[cbool] vec = deref(
            self._cpp_obj.get())
        cdef vector[cbool].reverse_iterator loc = vec.rbegin()
        while loc != vec.rend():
            citem = deref(loc)
            yield citem
            inc(loc)

    def index(self, item):
        if not self:
            raise ValueError(f'{item} is not in list')
        cdef cbool citem = item
        cdef vector[cbool] vec = deref(self._cpp_obj.get())
        cdef vector[cbool].iterator loc = std_libcpp.find(vec.begin(), vec.end(), citem)
        if loc != vec.end():
            return <int64_t> std_libcpp.distance(vec.begin(), loc)
        raise ValueError(f'{item} is not in list')

    def count(self, item):
        if not self:
            return 0
        cdef cbool citem = item
        cdef vector[cbool] vec = deref(self._cpp_obj.get())
        return <int64_t> std_libcpp.count(vec.begin(), vec.end(), citem)


Sequence.register(List__bool)

cdef class List__i32:
    def __init__(self, items=None):
        if isinstance(items, List__i32):
            self._cpp_obj = (<List__i32> items)._cpp_obj
        else:
            self._cpp_obj = move(List__i32._make_instance(items))

    @staticmethod
    cdef create(shared_ptr[vector[int32_t]] c_items):
        inst = <List__i32>List__i32.__new__(List__i32)
        inst._cpp_obj = c_items
        return inst

    @staticmethod
    cdef unique_ptr[vector[int32_t]] _make_instance(object items) except *:
        cdef unique_ptr[vector[int32_t]] c_inst = make_unique[vector[int32_t]]()
        if items:
            for item in items:
                deref(c_inst).push_back(item)
        return move_unique(c_inst)

    def __add__(object self, object other):
        return type(self)(itertools.chain(self, other))

    def __getitem__(self, object index_obj):
        cdef shared_ptr[vector[int32_t]] c_inst
        cdef int32_t citem
        if isinstance(index_obj, slice):
            c_inst = make_shared[vector[int32_t]]()
            start_val = index_obj.start
            stop_val = index_obj.stop
            step_val = index_obj.step
            sz = deref(self._cpp_obj).size()

            if step_val == 0 or step_val is None:
                step_val = 1
            if step_val > 0:
                if start_val is None:
                    start_val = 0
                elif start_val > sz:
                    start_val = sz
                if stop_val is None:
                    stop_val = sz
                elif stop_val > sz:
                    stop_val = sz
            else:
                if start_val is None:
                    start_val = sz - 1
                elif start_val > sz - 1:
                    start_val = sz - 1
                if stop_val is None:
                    stop_val = -1
                elif stop_val > sz - 1:
                    stop_val = sz - 1

            index = start_val
            while ((step_val > 0 and index < stop_val) or
                   (step_val < 0 and index > stop_val)):
                citem = deref(self._cpp_obj.get())[index]
                deref(c_inst).push_back(citem)
                index += step_val
            return List__i32.create(c_inst)
        else:
            index = <int?>index_obj
            size = len(self)
            # Convert a negative index
            if index < 0:
                index = size + index
            if index >= size or index < 0:
                raise IndexError('list index out of range')
            citem = deref(self._cpp_obj.get())[index]
            return citem

    def __len__(self):
        return deref(self._cpp_obj).size()

    def __richcmp__(self, other, op):
        cdef int cop = op
        if cop not in (2, 3):
            raise TypeError("unorderable types: {}, {}".format(type(self), type(other)))
        if not (isinstance(self, Iterable) and isinstance(other, Iterable)):
            return cop != 2
        if (len(self) != len(other)):
            return cop != 2

        for one, two in zip(self, other):
            if one != two:
                return cop != 2

        return cop == 2

    def __hash__(self):
        if not self.__hash:
            self.__hash = hash(tuple(self))
        return self.__hash

    def __contains__(self, item):
        if not self:
            return False
        cdef int32_t citem = item
        cdef vector[int32_t] vec = deref(
            self._cpp_obj.get())
        return std_libcpp.find(vec.begin(), vec.end(), citem) != vec.end()

    def __iter__(self):
        if not self:
            raise StopIteration
        cdef int32_t citem
        for citem in deref(self._cpp_obj):
            yield citem

    def __repr__(self):
        if not self:
            return 'i[]'
        return f'i[{", ".join(map(repr, self))}]'

    def __reversed__(self):
        if not self:
            raise StopIteration
        cdef int32_t citem
        cdef vector[int32_t] vec = deref(
            self._cpp_obj.get())
        cdef vector[int32_t].reverse_iterator loc = vec.rbegin()
        while loc != vec.rend():
            citem = deref(loc)
            yield citem
            inc(loc)

    def index(self, item):
        if not self:
            raise ValueError(f'{item} is not in list')
        cdef int32_t citem = item
        cdef vector[int32_t] vec = deref(self._cpp_obj.get())
        cdef vector[int32_t].iterator loc = std_libcpp.find(vec.begin(), vec.end(), citem)
        if loc != vec.end():
            return <int64_t> std_libcpp.distance(vec.begin(), loc)
        raise ValueError(f'{item} is not in list')

    def count(self, item):
        if not self:
            return 0
        cdef int32_t citem = item
        cdef vector[int32_t] vec = deref(self._cpp_obj.get())
        return <int64_t> std_libcpp.count(vec.begin(), vec.end(), citem)


Sequence.register(List__i32)

