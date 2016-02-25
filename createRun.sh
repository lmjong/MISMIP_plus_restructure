#!/bin/bash

# Include all the variables which are common to the scripts in the config file so they are only included once.
source Config/run.config

echo "Creating Run $RUN_NAME"

mkdir Runs/$RUN_NAME
mkdir Runs/$RUN_NAME/Config
cp Config/* Runs/$RUN_NAME/Config
mkdir $WORKDIR/$RUN_NAME
mkdir $WORKDIR/$RUN_NAME/Executables
mkdir $WORKDIR/$RUN_NAME/Results

#cp Scripts/* Runs/$RUN_NAME
cp Scketches/MakefileScketch Runs/$RUN_NAME/

cat Scketches/MakefileScketch | sed -e "s#<Executables>#$WORKDIR/$RUN_NAME/Executables#g" \
	-e "s#<SOLVERS_SRC>#$SOLVERS_SRC#g" \
	-e "s#<NN_HOME>#$NN_HOME#g" \
	-e "s#<CS_HOME>#$CSA_HOME#g" \
	-e "s#<ELMER_Scatter>#$Elmer_Scatter#g"> Runs/$RUN_NAME/Makefile


cp ./Scripts/scriptMesh.sh  Runs/$RUN_NAME/scriptMesh.sh

cp ./Scripts/scriptInitDomain.sh  Runs/$RUN_NAME/scriptInitDomain.sh
cp ./Scripts/scriptExecute.sh  Runs/$RUN_NAME/scriptExecute.sh
cp ./Scripts/scriptAfterRun.sh  Runs/$RUN_NAME/scriptAfterRun.sh

echo "generating sifs from templates and config files"

`./Scripts/generateSif.sh MP0`
`./Scripts/generateSif.sh MP1r`
`./Scripts/generateSif.sh MP1rr`
`./Scripts/generateSif.sh MP1ra`
`./Scripts/generateSif.sh MP2r`
`./Scripts/generateSif.sh MP2rr`
`./Scripts/generateSif.sh MP2ra`

cd Runs/$RUN_NAME
make GridDataReader
make Scattered2DDataInterpolator
make all
