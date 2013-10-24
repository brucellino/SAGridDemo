#!/bin/bash
# script to compile Pythia8
# Pythia requires HepMC
HAVE_HEPMC=0
# check for HepMC version
PYTHIA_VERSION=8176
PYTHIA_TARBALL=pythia${PYTHIA_VERSION}.tgz
PYTHIA_URL=http://home.thep.lu.se/~torbjorn/pythia8/${PYTHIA_TARBALL}

wget ${PYTHIA_URL}
tar xvfz ${PYTHIA_TARBALL}
cd pythia${PYTHIA_VERSION}
./configure --prefix=/tmp --enable-shared --with-hepmc=/tmp --with-hepmcversion=2.06.09
time make -j4 install

# check the pythia examples are working
#cd examples
#./runmains

# put the output into a tarball - we're going to want to check that



