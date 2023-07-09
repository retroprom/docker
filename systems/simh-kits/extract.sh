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

# DEC PDP-8
enter pdp8-dms
unzip -u -b $DIST/dms8.zip
enter pdp8-focal
tar xfvz $DIST/foclswre.tar.Z
enter pdp8-os8
tar xfvz $DIST/os8swre.tar.Z
enter pdp8-tss8
unzip -u -b $DIST/tss8.zip

# DEC PDP-11
enter pdp11-rsts-v7
tar xfvz $DIST/rstsv7gen.tar.Z
tar xfvz $DIST/rstsv7swre.tar.Z
enter pdp11-rt11-v4
tar xfvz $DIST/rt11swre.tar.Z
enter pdp11-rt11-v5;
tar xfvz $DIST/rtv53swre.tar.Z
enter pdp11-unix-v5;
unzip -u -b $DIST/uv5swre.zip
enter pdp11-unix-v6;
unzip -u -b $DIST/uv6swre.zip
enter pdp11-unix-v7;
unzip -u -b $DIST/uv7swre.zip

# Interdata 32
enter id32-unix-v6
unzip -u -b $DIST/iu6swre.zip
enter id32-unix-v7
unzip -u -b $DIST/iu7swre.zip
