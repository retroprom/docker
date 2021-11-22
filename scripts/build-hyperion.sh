#!/bin/sh

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

