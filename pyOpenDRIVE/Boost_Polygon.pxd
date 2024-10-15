# distutils: language=c++

from libcpp.vector cimport vector
from libcpp.memory cimport make_shared, shared_ptr
from pyOpenDRIVE.Boost_Ring cimport ring as boost_ring

cdef extern from "include/boost/geometry/geometries/polygon.hpp" namespace "boost::geometry::model":
    cdef cppclass polygon[Point]:
        ctypedef Point point_type
        ctypedef boost_ring[Point] ring_type
        ctypedef vector[ring_type] inner_container_type

        const ring_type& outer() const
        const inner_container_type& inners() const
        ring_type& outer()
        inner_container_type& inners()

        polygon() except +
        
        void clear()