#!/bin/bash

#Experiment name corresponds to name of config file and sif template
expname=$1
source Config/run.config

source Config/"$expname".config

mkdir $WORKDIR/$RUN_NAME/Results/$expname
cd $WORKDIR/$RUN_NAME/Results/$expname

sifName=$expname.sif
ScketchPath=$HOME_PATH/Scketches/Sif
scketch="$ScketchPath/scketch$sifName"

echo $sketch

cat $scketch | sed -e "s#<FileSource>#$FileSource#g" \
		 -e "s#<ResultsPath>#$ResultsPath#g" \
		 -e "s#<MeshPath>#$MeshPath#g" \
                 -e "s#<Restart>#$Restart#g" \
                 -e "s#<ExecPath>#$Executables#g" \
                 -e "s#<RestartPosition>#$RestartPosition#g" \
                 -e "s#<outIntervals>#$outIntervals#g" \
                 -e "s#<Intervals>#$Intervals#g" \
                 -e "s#<TimeStep>#$TimeStep#g" \
                 -e "s#<C>#$C#g" \
                 -e "s#<eta>#$eta#g" \
                 -e "s#<accum>#$accum#g" \
                 -e "s#<name>#$name#g" \
		 -e "s#<mesh>#$MESH_NAME#g" > $HOME_PATH/Runs/$RUN_NAME/$sifName



