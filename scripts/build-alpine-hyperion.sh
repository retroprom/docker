#!/bin/sh

echo "==== Installing build dependencies"
apk add --update --virtual hyperion-build ${HYPERION_PKG_BUILD}

echo "==== Cloning hyperion"
git clone --depth 1 ${HYPERION_GIT_REPOSITORY} hyperion
git clone --depth 1 ${SOFTFLOAT_GIT_REPOSITORY} sf3a

echo "==== Preparing configure"
cd hyperion
./autogen.sh

echo "==== Creating build directory"
mkdir ../build
cd ../build

echo "==== Configuring hyperion"
../hyperion/configure ${HYPERION_CONFIG}

echo "==== Building hyperion"
make -j4

echo "==== Installing hyperion"
make install

echo "==== Removing build dependencies"
apk del hyperion-build

echo "==== Cleaning up"
cd /
rm -rf /build/hyperion

