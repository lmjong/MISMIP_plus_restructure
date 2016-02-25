source Config/run.config

iter=$( awk '/Time:/ {print $3}' output.out | tail -1 )
iter=$((iter / 100 ))
echo $iter

timea=$(awk '/Time:/ {print $4}' output.out | tail -1)
echo $timea

mkdir $ResultsPath/$1
mv $MeshPath/$MESH_NAME/*vtu $ResultsPath/$1
echo $1 $iter $timea >> Run.db 
