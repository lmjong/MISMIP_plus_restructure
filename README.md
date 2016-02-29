Restructured MISMIP+ experiment organisation


Steps to set up the MISMIP experiments
--------------------------------------

1. Edit Config/run.config with the paths and relevant data
2. run createRun.sh. This will create a new dir in Runs with the name of the new run. It will copy the scipts, sif files and a directory with the config files into the new dir.
3. cd into the new run dir just created
4. run scriptMesh.sh
5. run scriptInitDomain.sh
6. run script runSif.sh with an experiment name as the argument.
 
Order of the sif files to be run for the MISMIP+ experiments

InitDomain.sif (create the bedrock and upper and lower surfaces)
IceInit.sif (spinup to steady state)
Ice0.sif (control experiment)
Ice1r.sif 
Ice1ra.sif
Ice1rr.sif
Ice2r.sif
Ice2ra.sif
Ice2rr.sif



