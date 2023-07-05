#!/bin/bash

set -e

ROOT=$PWD
DIST=$PWD/download

sha256sum -c SHA256SUMS

rm -rf build

enter() {
    echo Extracting for $1...
    mkdir -p $ROOT/build/$1
    cp -r $ROOT/common/* $ROOT/build/$1
    cd $ROOT/build/$1
}

unzip_unroot() {
    unzip -u $1
    mv $2/* .
    rmdir $2
}

if [ -e $DIST/mvs-tk4/tk4-_v1.00_current.zip ]; then
    enter mvs-tk4
    unzip -u $DIST/mvs-tk4/tk4-_v1.00_current.zip
    unzip -u $DIST/mvs-tk4/tk4-cbt.zip
    unzip -u $DIST/mvs-tk4/tk4-source.zip
fi

if [ -e $DIST/vm370-ce/VM370CE.V1.R1.1.zip ]; then
    enter vm370-ce-v1-r1.1
    unzip_unroot $DIST/vm370-ce/VM370CE.V1.R1.1.zip VM370CE.V1.R1.1
fi
if [ -e $DIST/vm370-ce/VM370CE.V1.R1.2.zip ]; then
    enter vm370-ce-v1-r1.2
    unzip_unroot $DIST/vm370-ce/VM370CE.V1.R1.2.zip VM370CE.V1.R1.2
fi
