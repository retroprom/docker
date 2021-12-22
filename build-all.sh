#!/bin/sh

# quick builds first
./build-dynamips.sh
./build-klh10.sh
./build-qemu.sh

# longer builds later
./build-hercules.sh
./build-simh.sh
