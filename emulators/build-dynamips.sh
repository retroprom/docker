#!/bin/bash

DEBIAN_DEFAULT="bullseye"
DEBIAN_DISTROS="bullseye"

#time docker build . \
#	--network host \
#	-f Dockerfile.dynamips-alpine \
#	-t "retro-dynamips:alpine-latest" \
#	"$@"

for d in ${DEBIAN_DISTROS}; do
	time docker build . \
	     --network host \
	     -f Dockerfile.dynamips-debian \
	     -t "retro-dynamips:${d}-latest" \
	     --build-arg BASE="debian:${d}" \
	     "$@"
done

docker tag "retro-dynamips:${DEBIAN_DEFAULT}-latest" "retro-dynamips:latest"
