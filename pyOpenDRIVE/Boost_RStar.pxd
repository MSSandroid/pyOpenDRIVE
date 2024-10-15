# distutils: language=c++

from libcpp.memory cimport make_shared, shared_ptr

cdef extern from "include/boost/geometry/index/parameters.hpp" namespace "boost::geometry::index":
    cdef cppclass rstar[MaxElements, MinElements]:
        const size_t max_elements
        const size_t min_elements
        const size_t reinserted_elements
        const size_t overlap_cost_threshold

        @staticmethod
        size_t get_max_elements()
        @staticmethod
        size_t get_min_elements()
        @staticmethod
        size_t get_reinserted_elements()
        @staticmethod
        size_t get_overlap_cost_threshold()