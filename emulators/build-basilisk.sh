#!/bin/bash

DEBIAN_DEFAULT="bullseye"
DEBIAN_DISTROS="bullseye"

for d in ${DEBIAN_DISTROS}; do
	time docker build . \
	     --network host \
	     -f Dockerfile.simple-debian \
	     -t "retro-basilisk:${d}-latest" \
	     --build-arg BASE="debian:${d}" \
	     --build-arg SIMPLE_PKG="basilisk2" \
	     "$@"
done

docker tag "retro-basilisk:${DEBIAN_DEFAULT}-latest" "retro-basilisk:latest"
