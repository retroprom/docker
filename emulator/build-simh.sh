#!/bin/bash

DEBIAN_DEFAULT="bullseye"
DEBIAN_DISTROS="bullseye"

#time docker build simh \
#     --network host \
#     -f simh/Dockerfile.alpine \
#     -t "retroprom/emulator-simh:alpine-latest" \
#     "$@"

for d in ${DEBIAN_DISTROS}; do
	time docker build simh \
	     --network host \
	     -f simh/Dockerfile.debian \
	     -t "retroprom/emulator-simh:${d}-latest" \
	     --build-arg BASE="debian:${d}" \
	     "$@"
done

docker tag "retroprom/emulator-simh:${DEBIAN_DEFAULT}-latest" "retroprom/emulator-simh:latest"
