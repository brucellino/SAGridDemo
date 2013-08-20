#/bin/bash
# script to download the HepMC tarball and compile it
# should be run by the controller script
# which should compile cmake and set it in the path

HEPMC_VERSION=2.08.09
HEPMC_TARBALL=HePMC-${HEPMC_VERSION}.tar.gz
HEPMC_TARBALL_URL=http://lcgapp.cern.ch/project/simu/HepMC/download/HepMC-${HEPMC_TARBALL}

# download the HepMC tarball
wget ${HEPMC_TARBALL_URL}
tar xvfz ${HEPMC_TARBALL}
cd HepMC-${HEPMC_VERSION}
# need to make a directory for cmake to be compiled in 
mkdir build
cd build
cmake ../ Unix Makefiles -Dmomentum:GEV -Dlength:MM 
