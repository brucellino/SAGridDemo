# PYTHIA8 Demo


The aim of the demonstration is to run a large Monte-Carlo simulation 
of particle physics collisions in order to reproduce some interesting  
plots in the field. This is meant to be a demonstrative simulation, 
showing not only how the grid can be useful for physics, but also how 
to execute large analyses in a distributed environment, assuming as 
little as possible about the deployed software. 


## Problem statement

TODO


## Required packages

We are going to be simulating pure physics with PYTHIA, with no 
detector equipment. However, we would like to be able to store the 
output in ROOT files (see http://root.cern.ch for more). Therefore, we 
need to distributed the ROOT headers and libraries for Pythia to be 
compiled against in order for ROOT files to be written. 

Pythia also requires HepMC libraries for the Monte-Carlo.

## Excution Workflow

### Compilation of the runtime environment
We are assuming that the required packages are not available on the 
execution node, which means that we have to compile them and 
distrbiute them along with our jobs. This is the so-called "glide-in" 
method for running jobs on the grid. 

The file `build_packages.sh` is provided in order to build the 
dependencies and a sample JDL is also provided for the submission of 
this job. Note that the output sandbox (ie the eventually built 
libraries) is too large to be transferred back to the user via the 
gLite WMS sandbox and should therefore be stored either on the LFC, or 
on a remote file system such as one of the SE's, using the 
`OutputSandboxBaseDestURL` specifier. 

This example stores it on the LFC

### Simple execution
A single run of the simulation can be run by submitting 
`run-pythia.jdl`. Do this first to check that everything is working 
and that a small root file is produced.

### Parametrised execution
