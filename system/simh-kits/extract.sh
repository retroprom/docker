#!/bin/bash

set -e

ROOT=$PWD
DIST=$PWD/download

sha256sum -c SHA256SUMS

rm -rf build

enter() {
    echo Extracting for $1...
    mkdir -p $ROOT/build/$1
    cp -r $ROOT/$1/* $ROOT/build/$1
    cd $ROOT/build/$1
}

enter id32-unix-v6
unzip -u $DIST/iu6swre.zip

enter id32-unix-v7
unzip -u $DIST/iu7swre.zip

enter pdp11-rsts-v7
tar xfvz $DIST/rstsv7gen.tar.Z
tar xfvz $DIST/rstsv7swre.tar.Z

enter pdp11-rt11-v4
tar xfvz $DIST/rt11swre.tar.Z

enter pdp11-rt11-v5;
tar xfvz $DIST/rtv53swre.tar.Z

enter pdp11-unix-v5;
unzip -u $DIST/uv5swre.zip

enter pdp11-unix-v6;
unzip -u $DIST/uv6swre.zip

enter pdp11-unix-v7;
unzip -u $DIST/uv7swre.zip

