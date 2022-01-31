# -*- mode: cmake; -*-
# Time-stamp: <>
################################################################################
# %f --  [CMake](http://www.cmake.org/) Configuration
#                 ____ __  __       _        _     _     _
#                / ___|  \/  | __ _| | _____| |   (_)___| |_ ___
#               | |   | |\/| |/ _` | |/ / _ \ |   | / __| __/ __|
#               | |___| |  | | (_| |   <  __/ |___| \__ \ |_\__ \
#                \____|_|  |_|\__,_|_|\_\___|_____|_|___/\__|___/
#
################################################################################
cmake_minimum_required (VERSION 3.18.0)
project (%@ CXX)


#SET(CMAKE_VERBOSE_MAKEFILE on )
#SET(CMAKE_BUILD_TYPE       Release)

#enable_testing()

# find_package(MPI REQUIRED)
# set_property( DIRECTORY PROPERTY COMPILE_DEFINITIONS ${MPI_CXX_COMPILE_FLAGS} )
# include_directories(SYSTEM ${MPI_CXX_INCLUDE_PATH})
# list(APPEND EXTRALIBS ${MPI_CXX_LIBRARIES})

#====== [Boost](http://www.boost.org/) ======
# Note: uBlas is part of the 'numeric' library and is NOT a compiled library
#set(Boost_USE_STATIC_LIBS    OFF)
#set(Boost_USE_MULTITHREADED  ON)
#set(Boost_USE_STATIC_RUNTIME OFF)
#add_definitions( -DNDEBUG -DBOOST_UBLAS_NDEBUG )
#find_package(Boost COMPONENTS serialization random program_options timer system unit_test_framework REQUIRED)
#include_directories(SYSTEM ${Boost_INCLUDE_DIRS})
#list(APPEND EXTRALIBS ${Boost_LIBRARIES})

#======== [Eigen](http://eigen.tuxfamily.org/) ====================
#set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/")
#find_package(Eigen REQUIRED)
#include_directories(${EIGEN_INCLUDE_DIRS})

#=== Headers
set(%b_HEADERS Tools.h %b.h)

add_executable(%b    main.cpp ${%b_HEADERS})
target_link_libraries(%b ${EXTRALIBS})

# add_executable(hello_world_nonblocking hello_world_nonblocking.cpp)
# target_link_libraries(hello_world_nonblocking ${EXTRALIBS})

# add_test(hello_world_mpi_4 ${MPIEXEC} ${MPIEXEC_NUMPROC_FLAG} 4 ${MPIEXEC_PREFLAGS} "${CMAKE_CURRENT_BINARY_DIR}/hello_world" ${MPIEXEC_POSTFLAGS} )
# set_tests_properties( hello_world_mpi_4 PROPERTIES PROCESSORS 4 )

# add_test(hello_world_nonblocking_mpi_4 ${MPIEXEC} ${MPIEXEC_NUMPROC_FLAG} 4 ${MPIEXEC_PREFLAGS} "${CMAKE_CURRENT_BINARY_DIR}/hello_world_nonblocking" ${MPIEXEC_POSTFLAGS} )
# set_tests_properties( hello_world_nonblocking_mpi_4 PROPERTIES PROCESSORS 4 )

#==========================================================
# add a target to generate API documentation with Doxygen
#find_package(Doxygen)
#if(DOXYGEN_FOUND)
#  configure_file(${CMAKE_CURRENT_SOURCE_DIR}/Doxyfile.in ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile @ONLY)
#  add_custom_target(doc
#    ${DOXYGEN_EXECUTABLE} ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile
#    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
#    COMMENT "Generating API documentation with Doxygen" VERBATIM
#    )
#endif(DOXYGEN_FOUND)

