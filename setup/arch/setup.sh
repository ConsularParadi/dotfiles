# !/bin/bash
source ./utils.sh

envvars

##BASE
#dir=base
#cd $dir || exit
#sh ./$dir.sh
#cdback

##GNOME
#if [ $DEKSTOP_SESSION==*"gnome"* ]; then
#	dir=gnome
#	cd $dir || exit
#	sh ./$dir.sh
#	cdback
#fi

dir=wm
cd $dir || exit
sh ./$dir.sh
cdback

#TERMINAL
dir=terminal
cd $dir || exit
sh ./$dir.sh
cdback

##CODING
#dir=coding
#cd $dir || exit
#sh ./$dir.sh
#cdback

##SYSTEM
#dir=system
#cd $dir || exit
#sh ./$dir.sh
#cdback
