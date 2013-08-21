#/bin/bash
ROOT_VERSION=v5.34.09
ROOT_TARBALL=root_${ROOT_VERSION}.source.tar.gz
ROOT_URL=ftp://root.cern.ch/root/${ROOT_TARBALL}

wget $ROOT_URL
tar xvfz ${ROOT_TARBALL}
cd root

./configure --prefix=/tmp --minimal --enable-pythia8 --with-pythia8-libdir=/tmp/lib/ --with-pythia8-incdir=/tmp/include/ --etcdir=/tmp/etc

nice -n20 make -j4
make install
source /tmp/bin/thisroot.sh
rootn.exe -b -q
