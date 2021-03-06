num=$(tail -1 Run.db | awk '{print $1}')
run=<run>
mesh=Mesh
name=Run$(( num + 1 ))
echo $name
nameRestart=Run$(( num ))
echo $nameRestart
host=lachouf2
numParts=<numParts>

HomePath=/home/lmjong/Work_with_Rupert/MISOMIP_FISOC/MISMIP_plus/CM_MISMIP+_MERINO/MISMIP+
WorkPath=/r510/home/imerino/work1/MISMIP+_Prueba
mkdir $WorkPath/$run/Results/$name

sifName=$name.sif
ScketchPath=$HomePath/Scketches/Sif/
scketch=$ScketchPath/scketchInterpolation.sif

ExecPath=<Executables>
ResultsPath=../Results/$name
OutputPath=../Results/$name
MeshPath=<MeshNamePath>

Restart=../Results/$nameRestart/$nameRestart.result
RestartPosition=0
outIntervals=1

!C=1.0e-2
C=1.0e-2
eta=0.2924017738212866
accum=0.3


cat $scketch | sed -e "s#<FileSource>#$FileSource#g" \
		 -e "s#<ResultsPath>#$ResultsPath#g" \
		 -e "s#<MeshPath>#$MeshPath#g" \
                 -e "s#<Restart>#$Restart#g" \
                 -e "s#<outIntervals>#$outIntervals#g" \
                 -e "s#<SourcesPath>#$SourcesPath#g" \
                 -e "s#<RestartPosition>#$RestartPosition#g" \
                 -e "s#<C>#$C#g" \
                 -e "s#<ExecPath>#$ExecPath#g" \
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
