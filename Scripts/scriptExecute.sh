#!/bin/sh
expname=$1
source Config/run.config
source Config/"$expname".config

#prevrun = $(tail -1 Run.db | awk '{print $1}')

num=`cat Run.db |grep "$expname" | wc -l` 
#number=${num:3:6}
run=$expname
mesh=$MESH_NAME
name="$expname"_"$num"
echo $name
#test if this is the first run of this experiment, if not set restart to previous run
if [ $num -gt 0 ]
then
	numPrev=$(( num-1 ))
	nameRestart="$expname"_"$numPrev"
        RestartPosition=0
fi
echo $nameRestart
Restart=../../"$nameRestart".result
mkdir -p $WORKDIR/$run/Results/$name

sifName=$name.sif
ScketchPath=$HOME_PATH/Scketches/Sif
scketch=$ScketchPath/scketchRestart.sif



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
		 -e "s#<mesh>#$mesh#g" > $sifName

echo $sifName >> toto
mv toto ELMERSOLVER_STARTINFO
if [ $numParts.gt.0 ];
then
        mpirun -n $numParts  ElmerSolver_mpi > output.out
else
         ElmerSolver $sifName > output.out
fi
./scriptAfterRun.sh $name
