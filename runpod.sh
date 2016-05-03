rm /nfs/dust/cms/user/tlapsien/tmp/*.*
export TMPDIR=/nfs/dust/cms/user/tlapsien/tmp
#source /afs/naf.desy.de/group/cms/proof/PoD/PoD_env.sh
module use -a /afs/desy.de/group/cms/modulefiles/; module load pod
pod-server start
pod-submit  -n $1 -r ge
nodes=`pod-info -n`;
while (( $nodes < $1 )) { echo $nodes von $1; nodes=`pod-info -n`;sleep 1; }
echo -en  "$nodes von $1"
echo -en $'\r'
echo Ready to start job!!!

sframe_main $2
pod-server stop