#!/bin/bash

DEBIAN_DEFAULT="bullseye"
DEBIAN_DISTROS="bullseye"

for d in ${DEBIAN_DISTROS}; do
	time docker build . \
	     --network host \
	     -f Dockerfile.simple-debian \
	     -t "retroprom/emulator-bochs:${d}-latest" \
	     --build-arg BASE="debian:${d}" \
	     --build-arg SIMPLE_PKG="bochs-sdl bochs-term bximage" \
	     "$@"
done

docker tag "retroprom/emulator-bochs:${DEBIAN_DEFAULT}-latest" "retroprom/emulator-bochs:latest"
