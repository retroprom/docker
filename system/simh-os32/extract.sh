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

enter os32-v1.1
unzip -u "$DIST/v1.1/os32kit.zip"
