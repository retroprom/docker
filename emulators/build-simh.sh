#!/bin/bash

DEBIAN_DEFAULT="bullseye"
DEBIAN_DISTROS="bullseye"

#time docker build . \
#     --network host \
#     -f Dockerfile.simh-alpine \
#     -t "retro-simh:alpine-latest" \
#     "$@"

for d in ${DEBIAN_DISTROS}; do
	time docker build . \
	     --network host \
	     -f Dockerfile.simh-debian \
	     -t "retro-simh:${d}-latest" \
	     --build-arg BASE="debian:${d}" \
	     "$@"
done

docker tag "retro-simh:${DEBIAN_DEFAULT}-latest" "retro-simh:latest"
