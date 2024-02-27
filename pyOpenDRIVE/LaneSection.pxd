# distutils: language=c++

cdef extern from "../src/LaneSection.cpp":
    pass

from libcpp.vector cimport vector
from libcpp.map cimport map
from libcpp.set cimport set
from libcpp.string cimport string
from libcpp cimport bool
from libcpp.memory cimport make_shared, shared_ptr

from pyOpenDrive cimport Lane

cdef extern from "LaneSection.h" namespace "odr":
    cdef cppclass LaneSection:
        LaneSection(string road_id, double s0) except +

        int  get_lane_id(const double s, const double t) const
        Lane get_lane(const double s, const double t) const

        string road_id
        double s0
        map[int, Lane] id_to_lane

cdef class PyLaneSection:
    cdef shared_ptr[LaneSection] c_self