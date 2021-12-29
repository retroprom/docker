#!/bin/bash

DEBIAN_DEFAULT="bullseye"
DEBIAN_DISTROS="bullseye"

#time docker build . \
#	--network host \
#	-f Dockerfile.es40-alpine \
#	-t "retro-es40:alpine-latest" \
#	"$@"

for d in ${DEBIAN_DISTROS}; do
	time docker build . \
	     --network host \
	     -f Dockerfile.es40-debian \
	     -t "retro-es40:${d}-latest" \
	     --build-arg BASE="debian:${d}" \
	     "$@"
done

docker tag "retro-es40:${DEBIAN_DEFAULT}-latest" "retro-es40:latest"
