#!/bin/bash

DEBIAN_DEFAULT="bullseye"
DEBIAN_DISTROS="bullseye"

for d in ${DEBIAN_DISTROS}; do
	time docker build generic \
	     --network host \
	     -f generic/Dockerfile.debian \
	     -t "retroprom/emulator-basilisk:${d}-latest" \
	     --build-arg BASE="debian:${d}" \
	     --build-arg PACKAGES="basilisk2" \
	     "$@"
done

docker tag "retroprom/emulator-basilisk:${DEBIAN_DEFAULT}-latest" "retroprom/emulator-basilisk:latest"
