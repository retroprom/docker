#!/usr/bin/env bash

set -e

ROOT="$PWD"

SYSTEMS="klh10-panda simh-kits simh-os32 hercules-kits"

# Build each system by calling its scripts
for system in ${SYSTEMS}; do
	# Change directory
	cd $ROOT/systems/${system}
	# Perform download if required
	if [ -x download.sh ]; then ./download.sh; fi
	# Perform build
	./build.sh "$@"
done

