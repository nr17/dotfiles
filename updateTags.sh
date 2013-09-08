#!/bin/bash

echo "updating tags and cscope references"

cd $SRC_ROOT
echo "Running ctags"
ctags -R $SRC_ROOT/
if [ $? != 0 ]
then
    echo "ctags failed, exiting ..."
    exit 2
else
    echo "ctags creation successful..."
fi

echo "Running cscope"
if [ $# = 0 ]
then
    ~/mysetup/cscope_src.sh 
else
    ~/mysetup/cscope_src.sh 1
fi


cd -
