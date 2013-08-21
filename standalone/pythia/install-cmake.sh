#!/bin/bash
# optional cmake installation script should cmake not be available

# check that cmake is on the system
if [ `which cmake` ] ; then
    echo "Cmake is already installed on this machine, exiting"
    exit 0;
fi

# if not, download it and install it to a working directory
CMAKE_VERSION=2.8.11.2
CMAKE_TARBALL=cmake-${CMAKE_VERSION}.tar.gz 
CMAKE_URL=http://www.cmake.org/files/v2.8/cmake-${CMAKE_VERSION}.tar.gz

wget ${CMAKE_URL}
tar xvfz ${CMAKE_TARBALL}
cd cmake-${CMAKE_VERSION}
./bootstrap --parallel=2 --prefix=/tmp/pythiademo-install
make

