#!/usr/bin/env bash

set -e

ROOT=$PWD

SYSTEMS="klh10-panda simh-kits"

for system in ${SYSTEMS}; do
	if [ -x system/${system}/build.sh ]; then
		cd $ROOT/system/${system}
		./build.sh
	fi
done
