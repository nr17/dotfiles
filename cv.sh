
cv() {
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/:/opt/lib
    echo "Select View...."
    echo "1. openchange-dev"
    echo "2. samba"
    echo "3. old"
    echo "4. bigSky"
    echo "5. bigSkyDev"
    echo "6. frox"
    echo "7. cax-2.0"

    read i

    export CSCOPE_EDITOR=vim

    if [ $i -eq 1 ]
    then
      export SRC_ROOT=~/openchange
    elif [ $i -eq 2 ]
    then
      export SRC_ROOT=~/VIEWS/samba-4.0.9
    elif [ $i -eq 3 ]
    then
      export SRC_ROOT=~/old_code/nrana-vm-mainline
    elif [ $i -eq 4 ]
    then
      export P4CLIENT=nirana-chimera_1.0
      export SRC_ROOT=~/VIEWS/bigSky
    elif [ $i -eq 5 ]
    then
      export P4CLIENT=nirana-laptop-chimera-app-acc
      export SRC_ROOT=~/VIEWS/bigSkyDev
    elif [ $i -eq 6 ]
    then
      export SRC_ROOT=~/VIEWS/frox-0.7.18
    elif [ $i -eq 7 ]
    then
      export SRC_ROOT=~/VIEWS/cax-2.00beta1
    fi 
    
    export CSCOPE_DB=$SRC_ROOT/src.out
}



