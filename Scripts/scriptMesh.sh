source Config/run.config

scketchMesh=$ScketchPath/Mesh/scketchMesh$Type.geo

cat $scketchMesh | sed -e "s#<Resolution>#$Resolution#g" \
                -e "s#<boxposLen>#$boxposLen#g" \
                -e "s#<boxposX>#$boxposX#g" \
		-e "s#<Resolution3>#$Resolution3#g" \
		-e "s#<Resolution2>#$Resolution2#g"> $MESH_NAME.geo


$GMSH $MESH_NAME.geo -2
mkdir $MeshPath
cp $MESH_NAME.msh $MeshPath/
cd $MeshPath
if [ $numParts.gt.0 ];
then
        echo "Meshing with partitions"
        ElmerGrid 14 2 $MESH_NAME.msh -autoclean -order 1.0 0.1 0.01 -merge 10 -metis $numParts
else
        echo "Meshing single partition"
        ElmerGrid 14 2 $MESH_NAME.msh -autoclean -order 1.0 0.1 0.01 -merge 10
fi
