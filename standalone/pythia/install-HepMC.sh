#/bin/bash
# script to download the HepMC tarball and compile it
# should be run by the controller script
# which should compile cmake and set it in the path

HEPMC_VERSION=2.06.09
HEPMC_TARBALL=HepMC-${HEPMC_VERSION}.tar.gz
HEPMC_TARBALL_URL=http://lcgapp.cern.ch/project/simu/HepMC/download/${HEPMC_TARBALL}

echo "preparing to download ${HEPMC_TARBALL} from http://lcgapp.cern.ch/project/simu/HepMC/download/"

# check that it is not already in the directory
# optional - not expected to happen on WN, since each 
# run will happen in a separate sandbox

# download the HepMC tarball
wget ${HEPMC_TARBALL_URL}
tar xvfz ${HEPMC_TARBALL}
cd HepMC-${HEPMC_VERSION}
# we are going to be using the autotools distributed with the package to build it
./configure --prefix=/tmp --with-momentum=GEV --with-length=MM

# check the result - if the build failed, clean up
if [ $? == 0 ] ; then
    echo "configure successful ?"
else
    echo "configure failed - cleaining up"
    cd ../
    rm -rf ${HEPMC_TARBALL}
    rm -rf HepMC-${HEPMC_VERSION}
    exit 1
fi

# proceed to build the application
make -j4 install
# check the result - if the build failed, clean up                                                                                          
if [ $? == 0 ] ; then
    echo "build successful ?" # further checks later
else
    echo "build failed - cleaining up"
    cd ../
    rm -rf ${HEPMC_TARBALL}
    rm -rf HepMC-${HEPMC_VERSION}
    exit 1
fi


