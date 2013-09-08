#!/bin/sh

date
INCDIR=
TMPDIR=/tmp
#CSCOPE_DIR=$SRC_ROOT/cscope_dir
CSCOPE_DIR=$SRC_ROOT
export INCDIR TMPDIR

#echo "Subject: Failed build of src cscope file"

if [ $# = 0 ]
then
        make_list=0
else
        make_list=1
fi

if [ $make_list = 1 ]
then
        echo "making list of files for CSCOPE..."
        find  $SRC_ROOT/ -type f -print | \
        egrep '(\.[chs]$|\.cpp$|\.cc$|\.hh$|\.hpp$|\.x$)' > $CSCOPE_DIR/src.files
else
        echo "Not making list of files for CSCOPE..."

fi

echo "Running cscope....."
LANG=C /usr/bin/cscope -q -b -i $CSCOPE_DIR/src.files -f $CSCOPE_DIR/src.out

S=$?
if [ $S != 0 ]; then
   echo "cscope failed!"
   df $TMPDIR $CSCOPE_DIR
   ls -lsrt $CSCOPE_DIR | tail -5

fi
echo "Done building cscope src"
date


