# distutils: language=c++

from libcpp.memory cimport make_shared, shared_ptr

cdef extern from "include/boost/geometry/geometries/box.hpp" namespace "boost::geometry::model":
    cdef cppclass box[Point]:
        box()
        box(const Point& min_corner, const Point& max_corner)

        const Point& min_corner() const
        const Point& max_corner() const
        Point& min_corner()
        Point& max_corner()