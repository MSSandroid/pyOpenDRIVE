# distutils: language=c++

cdef extern from "../src/OpenDriveMap.cpp":
    pass
cdef extern from "../src/Geometries/Spiral.cpp":
    pass
cdef extern from "../src/Geometries/Spiral/odrSpiral.cpp":
    pass
cdef extern from "../src/Geometries/ParamPoly3.cpp":
    pass
cdef extern from "../src/Geometries/Arc.cpp":
    pass
cdef extern from "../src/Geometries/Line.cpp":
    pass

from libcpp.vector cimport vector
from libcpp.map cimport map
from libcpp.pair cimport pair
from libcpp.string cimport string
from libcpp cimport bool
from libcpp.memory cimport make_shared, shared_ptr, unique_ptr

from pyOpenDRIVE.XmlNode cimport XmlNode, xml_document
from pyOpenDRIVE.Road cimport Road
from pyOpenDRIVE.RoadObject cimport RoadObject
from pyOpenDRIVE.Lane cimport Lane
from pyOpenDRIVE.Junction cimport Junction
from pyOpenDRIVE.RoadNetworkMesh cimport RoadNetworkMesh
from pyOpenDRIVE.RoutingGraph cimport RoutingGraph

# from pyOpenDrive.Boost_Point cimport point as boost_point
# from pyOpenDrive.Boost_Box cimport box as boost_box
# from pyOpenDrive.Boost_Polygon cimport polygon as boost_polygon
# from pyOpenDrive.Boost_Multi_Polygon cimport multi_polygon as boost_multi_polygon
# from pyOpenDrive.Boost_Ring cimport ring as boost_ring
# from pyOpenDrive.Boost_RTree cimport rtree as boost_rtree
# from pyOpenDrive.Boost_RStar cimport rstar as boost_rstar

cdef extern from "include/boost/geometry/core/cs.hpp" namespace "boost::geometry::cs":
    cdef extern cppclass cartesian

cdef extern from "OpenDriveMap.h" namespace "odr":

    # ctypedef int rstar_max "16"
    # ctypedef int rstar_min "4"
    # ctypedef int point_dims "2"

    # ctypedef boost_point[float, point_dims, cartesian] point
    # ctypedef boost_box[point] box
    # ctypedef boost_polygon[point] polygon
    # ctypedef boost_multi_polygon[polygon] multi_polygon
    # ctypedef boost_ring[point] ring
    # ctypedef boost_rstar[rstar_max, rstar_min] rstar
    # ctypedef pair[box, unsigned] value
    # ctypedef pair[Lane, ring] LanePair

    cdef cppclass OpenDriveMap:
        OpenDriveMap(const string& xodr_file, const bool center_map, const bool with_road_objects, const bool with_lateral_profile, const bool with_lane_height, const bool abs_z_for_for_local_road_obj_outline, const bool fix_spiral_edge_cases, const bool with_road_signals) except +

        vector[Road] get_roads() const
        vector[Junction] get_junctions() const

        RoadNetworkMesh get_road_network_mesh(const double eps) const
        RoutingGraph get_routing_graph() const

        string proj4
        double x_offs
        double y_offs
        const string xodr_file
        xml_document xml_doc

        map[string, Road] id_to_road
        map[string, Junction] id_to_junction

        # Nova-specific bindings below
        # boost_rtree[value, rstar] generate_mesh_tree()
        # boost_rtree[value, rstar] generate_object_tree()
        # unique_ptr[RoadNetworkMesh] road_mesh_

        # vector[ring] get_drivable_lane_polygons(float res)
        # vector[pair[Lane, ring]] get_lane_polygons(float res, bool drivable_only)
        # vector[pair[RoadObject, point]] get_road_object_centers()

        # unique_ptr[vector[pair[Lane, ring]]] drivable_lane_polygons_
        # unique_ptr[vector[pair[Lane, ring]]] lane_polygons_
        # vector[pair[RoadObject, point]] object_centers_
        # unique_ptr[vector[ring]] road_polygons_
        # unique_ptr[boost_rtree[value, rstar]] rtree_


cdef class PyOpenDriveMap:
    cdef inline OpenDriveMap* unwrap(this):
        return this.c_self.get()

    cdef shared_ptr[OpenDriveMap] c_self