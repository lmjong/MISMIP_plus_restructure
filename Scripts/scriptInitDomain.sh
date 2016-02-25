source Config/run.config
source Config/initDomain.config


sifName=$name.sif

scketch=$ScketchPath/Sif/scketchInit$Type.sif

cat $scketch | sed -e "s#<FileSource>#$FileSource#g" \
                 -e "s#<Restart>#$Restart#g" \
                 -e "s#<RestartPosition>#$RestartPosition#g" \
		 -e "s#<ResultsPath>#$ResultsPath#g" \
		 -e "s#<MeshPath>#$MeshPath#g" \
                 -e "s#<ExecPath>#$Executables#g" \
                 -e "s#<name>#$name#g" \
		 -e "s#<mesh>#$MESH_NAME#g" > $sifName

echo $sifName >> toto
mv toto ELMERSOLVER_STARTINFO

if [ $Type = 'DomainCSV' ];
then
	cp ../../Data/zb.dat .
        cp ../../Data/zs.dat .
        cp ../../Data/h.dat .
fi

if [ $numParts.gt.0 ];
    then
       	mpirun -n $numParts  ElmerSolver_mpi > output.out
    else
        ElmerSolver $sifName > output.out
fi

./scriptAfterRun.sh $name
