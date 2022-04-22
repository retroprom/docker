#!/bin/sh

# simple packages first
./build-basilisk.sh "$@"
./build-bochs.sh "$@"
./build-qemu.sh "$@"

# then the fast building ones
./build-dynamips.sh "$@"
./build-klh10.sh "$@"

# finally the slow-building ones
./build-gxemul.sh "$@"
./build-hercules.sh "$@"
./build-simh.sh "$@"
./build-simx.sh "$@"
