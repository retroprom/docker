#!/bin/sh

# quick builds first
./build-dynamips.sh
./build-klh10.sh
./build-qemu.sh

# longer builds later
./build-hyperion.sh
./build-simx.sh
