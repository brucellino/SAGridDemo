#/bin/bash
# download the package from the LFC and unpack it
ROOTSYS=$1
PYTHIA8=$2
source ${ROOTSYS}/bin/thisroot.sh

# run the root pythia8 example
root.exe -b -q pythia8.C
