#!/bin/sh

echo "==== Creating build directory"
mkdir build
cd build

echo "==== Configuring simh"
cmake \
	-G Ninja \
	${SIMH_CONFIG_BUILD} \
	${SIMH_CONFIG_FEATURES} \
	${SIMH_CONFIG_SIMULATORS} \
	../simh

echo "==== Building simh"
ninja

echo "==== Installing simh"
ninja install

echo "==== Removing build dependencies"
apk del simh-build

echo "==== Cleaning up"
cd /
rm -rf /build/simh

