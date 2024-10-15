# distutils: language=c++

from libcpp.memory cimport make_shared, shared_ptr

cdef extern from "include/boost/geometry/geometries/point.hpp" namespace "boost::geometry::model":
    cdef cppclass point[CoordinateType, DimensionCount, CoordinateSystem]:
        point() except +
        point(const CoordinateType& v0) except +
        point(const CoordinateType& v0, const CoordinateType& v1)
        point(const CoordinateType& v0, const CoordinateType& v1, const CoordinateType& v2)

        const CoordinateType& get[K]() const
        void set[K](const CoordinateType& value)