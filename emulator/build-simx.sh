#!/bin/bash

DEBIAN_DEFAULT="bullseye"
DEBIAN_DISTROS="bullseye"

#time docker build . \
#     --network host \
#     -f Dockerfile.simx-alpine \
#     -t "retroprom/emulator-simx:alpine-latest" \
#     "$@"

for d in ${DEBIAN_DISTROS}; do
	time docker build . \
	     --network host \
	     -f Dockerfile.simx-debian \
	     -t "retroprom/emulator-simx:${d}-latest" \
	     --build-arg BASE="debian:${d}" \
	     "$@"
done

docker tag "retroprom/emulator-simx:${DEBIAN_DEFAULT}-latest" "retroprom/emulator-simx:latest"
