#!/usr/bin/env bash

set -e

ROOT=$PWD

SYSTEMS="klh10-panda simh-kits"

for system in ${SYSTEMS}; do
	if [ -x $ROOT/system/${system}/build.sh ]; then
		cd $ROOT/system/${system}
		if [ -x download.sh ]; then ./download.sh; fi
		if [ -x extract.sh ]; then ./extract.sh; fi
		./build.sh "$@"
	fi
done
