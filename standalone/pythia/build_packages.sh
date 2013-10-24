#!/bin/bash
# main file to build the packages
# the subdirectory that will be used to contain the relocatable packages
# this is used as --prefix for the various packages
. grid-variables.sh
BUILD_TAG=1.0
BUILD_DIR=pythia-demo
mkdir -p ${BUILD_DIR}
#./install-HepMC.sh ${BUILD_DIR}
# check the output - TODO

#./install-pythia.sh ${BUILD_DIR}
# check the output - TODO

#./install-root.sh ${BUILD_DIR}
# now get all the libraries into a single tarball

cd ${BUILD_DIR}
# remove some bloat from the tarball - we won't need it later
rm -rf share/doc/root
tar cfz --exclude="*.o" --exclude="*.d" ${BUILD_DIR}-${BUILD_TAG}.tar.gz bin lib etc include xmldoc

# register it to the LFC
LFC_HOST=`lcg-infosites --vo ${VO} lfc`
if [ -z ${LFC_HOST} ] ; then
	echo "no LFC host found - cannot register the file to LFC"
	# try to put it directly on an SE - we'll just loop over them in the way they were given to us
	# TODO - this should probably be fixed to use $CLOSE_SE
	for SE in ${N_SES} ; do 
		 uberftp -retry 3  -hash ${SE} "cd /tmp; put ${BUILD_DIR}-${BUILD_TAG}.tar.gz"
	done
else
	echo "We are using LFC host : ${LFC_HOST}"
	echo "Attempting to register file in file catalog"
	# choose a random SE in the range of SE's that we have to work with:
	SE=$RANDOM
	let "SE %= ${N_SES}"
	echo "using Storage Element ${SE} of ${N_SES} : ${SES[SE]}"
	lcg-cr -v -d ${SE} -l /grid/sagrid/pythia-demo/${BUILD_DIR}-${BUILD_TAG}.tar.gz
	if [ $? -ne 0 ]; then 
		echo "something went wrong with the upload - try a different SE"
		# TODO - choose a different SE which isn't the one already used.
		# probably should use a hash here and remove the entries which have been used
		# then select a different random entry
	else
		echo "file successfully uploaded"
	fi  # if fail
fi # if LFC host is set
	
