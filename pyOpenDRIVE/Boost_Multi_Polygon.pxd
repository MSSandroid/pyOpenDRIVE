# distutils: language=c++

from libcpp.vector cimport vector
from libcpp.memory cimport make_shared, shared_ptr

cdef extern from "include/boost/geometry/geometries/multi_polygon.hpp" namespace "boost::geometry::model":
    cdef cppclass multi_polygon[Polygon](vector[Polygon]):
        ctypedef vector[Polygon] base_type

        multi_polygon() except +