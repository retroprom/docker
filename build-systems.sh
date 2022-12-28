#!/usr/bin/env bash

set -e

ROOT=$PWD

SYSTEMS="panda simh"

for system in ${SYSTEMS}; do
	if [ -x system/${system}/build.sh ]; then
		cd $ROOT/system/${system}
		./build.sh
	fi
done
