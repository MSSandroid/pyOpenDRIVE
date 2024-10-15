# distutils: language=c++

from libcpp.vector cimport vector
from libcpp.memory cimport make_shared, shared_ptr

cdef extern from "include/boost/geometry/geometries/ring.hpp" namespace "boost::geometry::model":
    cdef cppclass ring[Point](vector[Point]):
        ring() except +