#!/bin/sh

echo "==== Installing build dependencies"
apk add --update --virtual simh-build ${SIMH_PKG_BUILD}

echo "==== Cloning simh"
git clone --depth 1 ${SIMH_GIT_REPOSITORY} simh

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

