#!/bin/bash
module load apps/autodock-vina/autodock-vina-1_1_2-spack
module load compilers/devtoolset/7
module load mpi/openmpi/3.1.3-gnu

#Compile the application.
ls > ligandlist ./Ligand
mkdir -p Output
mkdir -p ProcessedLigand
make
