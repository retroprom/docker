#!/bin/bash

DEBIAN_DEFAULT="bullseye"
DEBIAN_DISTROS="bullseye"

#time docker build . \
#     --network host \
#     -f Dockerfile.simx-alpine \
#     -t "retro-simx:alpine-latest" \
#     "$@"

for d in ${DEBIAN_DISTROS}; do
	time docker build . \
	     --network host \
	     -f Dockerfile.simx-debian \
	     -t "retro-simx:${d}-latest" \
	     --build-arg BASE="debian:${d}" \
	     "$@"
done

docker tag "retro-simx:${DEBIAN_DEFAULT}-latest" "retro-simx:latest"
