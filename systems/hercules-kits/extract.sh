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

# DOS/VS 5-pack
if [ -e $DIST/dosvs-5pk/DOSVS_5Pack_V1.0-full.zip ]; then
    enter dosvs-5pk
    unzip -u $DIST/dosvs-5pk/DOSVS_5Pack_V1.0-full.zip
fi

# MVS TK3
if [ -e $DIST/mvs-tk3/MVS_Turnkey_Volker_V3.zip ]; then
    enter mvs-tk3
    unzip -u $DIST/mvs-tk3/MVS_Turnkey_Volker_V3.zip
    rm -rf hercules-* hercwin-* c3270-* cygwin RECYCLER
fi

# MVS TK4
if [ -e $DIST/mvs-tk4/tk4-_v1.00_current.zip ]; then
    enter mvs-tk4
    unzip -u $DIST/mvs-tk4/tk4-_v1.00_current.zip
    unzip -u $DIST/mvs-tk4/tk4-cbt.zip
    unzip -u $DIST/mvs-tk4/tk4-source.zip
    rm -rf hercules ctca_demo *.bat unattended/set_*
    echo "CONSOLE" > unattended/mode
    mv mvs run.sh
fi

# MVS CE
if [ -e $DIST/mvs-ce/MVSCE.release.v1.0.6.tar ]; then
    enter mvs-ce-v1.0.6
    tar xfv $DIST/mvs-ce/MVSCE.release.v1.0.6.tar
    mv MVSCE/* .
    rmdir MVSCE
    rm start_mvs.sh
    mv conf/local.cnf hercules.ini
    mv conf/mvsce.rc  hercules.rc
    rmdir conf
fi

# VM/370 CE
if [ -e $DIST/vm370-ce/VM370CE.V1.R1.1.zip ]; then
    enter vm370-ce-v1-r1.1
    unzip_unroot $DIST/vm370-ce/VM370CE.V1.R1.1.zip VM370CE.V1.R1.1
    rm -rf WC3270 log.txt
    rm vm370ce.sh vm370ce.cmd
    mv vm370ce.conf hercules.ini
fi
if [ -e $DIST/vm370-ce/VM370CE.V1.R1.2.zip ]; then
    enter vm370-ce-v1-r1.2
    unzip_unroot $DIST/vm370-ce/VM370CE.V1.R1.2.zip VM370CE.V1.R1.2
    rm -rf WC3270 log.txt
    rm vm370ce.sh vm370ce.cmd
    mv vm370ce.conf hercules.ini
fi

# Fix script permissions
cd $ROOT
chmod +x build/*/*.sh
