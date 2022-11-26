#!/bin/bash

DEBIAN_DEFAULT="bullseye"
DEBIAN_DISTROS="bullseye"

for d in ${DEBIAN_DISTROS}; do
	time docker build generic \
	     --network host \
	     -f generic/Dockerfile.debian \
	     -t "retroprom/emulator-bochs:${d}-latest" \
	     --build-arg BASE="debian:${d}" \
	     --build-arg PACKAGES="bochs-sdl bochs-term bximage" \
	     "$@"
done

docker tag "retroprom/emulator-bochs:${DEBIAN_DEFAULT}-latest" "retroprom/emulator-bochs:latest"
