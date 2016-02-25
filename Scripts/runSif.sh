#!/bin/bash

source run.config

sifname=$1.sif

echo $sifName >> toto
mv toto ELMERSOLVER_STARTINFO
if [ $numParts.gt.0 ];
then
        mpirun -n $numParts  ElmerSolver_mpi > output.out
else
         ElmerSolver $sifName > output.out
fi
./scriptAfterRun.sh $name
