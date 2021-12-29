#!/bin/bash

DEBIAN_DEFAULT="bullseye"
DEBIAN_DISTROS="bullseye"

#time docker build . \
#	 --network host \
#	-f Dockerfile.hercules-alpine \
#	-t "retro-hercules:alpine-latest" \
#	"$@"

for d in ${DEBIAN_DISTROS}; do
	time docker build . \
	     --network host \
	     -f Dockerfile.hercules-debian \
	     -t "retro-hercules:${d}-latest" \
	     --build-arg BASE="debian:${d}" \
	     "$@"
done

docker tag "retro-hercules:${DEBIAN_DEFAULT}-latest" "retro-hercules:latest"
