#!/bin/bash

DEBIAN_DEFAULT="bullseye"
DEBIAN_DISTROS="bullseye"

#time docker build hercules \
#	 --network host \
#	-f hercules/Dockerfile.alpine \
#	-t "retroprom/emulator-hercules:alpine-latest" \
#	"$@"

for d in ${DEBIAN_DISTROS}; do
	time docker build hercules \
	     --network host \
	     -f hercules/Dockerfile.debian \
	     -t "retroprom/emulator-hercules:${d}-latest" \
	     --build-arg BASE="debian:${d}" \
	     "$@"
done

docker tag "retroprom/emulator-hercules:${DEBIAN_DEFAULT}-latest" "retroprom/emulator-hercules:latest"
