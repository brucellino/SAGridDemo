#!/bin/bash
export VO="sagrid" # VO under which the jobs will run
export LCG_GFAL_INFOSYS="top-bdii.c4.csir.co.za:2170" # top-bdii
export LFC_TOPDIR="/grid/sagrid/pythia-demo" # this can be set to wherever you have write permissions on the LFC
# find the number of SE's we can use by interrogating infosites
# we need to remove the first two lines because of the formatting 
# that infosites returns :
# lcg-infosites --vo sagrid se
# Avail Space(kB)  Used Space(kB)  Type 	SE
# ------------------------------------------
# since we don't know how many there are to start off with, we need to 
# tail the output and strip the first two lines
export N_SES=$(expr `lcg-infosites --vo sagrid se |wc -l` - 2) 
echo "We have found ${N_SES} storage elemetns:	"
# create an array of SE names 
export SES=(`lcg-infosites --vo sagrid se | tail -n ${N_SES} | awk '{print $4}'`)
for SE in ${SES[@]}; do
	echo ${SE}
done
	
