#!/bin/bash

DEBIAN_DEFAULT="bullseye"
DEBIAN_DISTROS="bullseye"

for d in ${DEBIAN_DISTROS}; do
	time docker build . \
	     --network host \
	     -f Dockerfile.simple-debian \
	     -t "retroprom/emulator-basilisk:${d}-latest" \
	     --build-arg BASE="debian:${d}" \
	     --build-arg SIMPLE_PKG="basilisk2" \
	     "$@"
done

docker tag "retroprom/emulator-basilisk:${DEBIAN_DEFAULT}-latest" "retroprom/emulator-basilisk:latest"
