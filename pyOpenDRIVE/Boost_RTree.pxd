# distutils: language=c++

from libcpp.vector cimport vector
from libcpp.memory cimport make_shared, shared_ptr

cdef extern from "include/boost/geometry/index/rtree.hpp" namespace "boost::geometry::index":
    cdef cppclass rtree[Value, Parameters]:
        ctypedef extern IndexableGetter