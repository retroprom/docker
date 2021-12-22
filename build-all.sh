#!/bin/sh

# simple packages first
./build-basilisk.sh
./build-qemu.sh

# then the fast building ones
./build-dynamips.sh
./build-klh10.sh

# finally the slow-building ones
./build-hercules.sh
./build-simx.sh
