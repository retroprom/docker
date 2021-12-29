#!/bin/bash

DEBIAN_DEFAULT="bullseye"
DEBIAN_DISTROS="bullseye"

#time docker build . \
#	--network host \
#	-f Dockerfile.gxemul-alpine \
#	-t "retro-gxemul:alpine-latest" \
#	"$@"

for d in ${DEBIAN_DISTROS}; do
	time docker build . \
	     --network host \
	     -f Dockerfile.gxemul-debian \
	     -t "retro-gxemul:${d}-latest" \
	     --build-arg BASE="debian:${d}" \
	     "$@"
done

docker tag "retro-gxemul:${DEBIAN_DEFAULT}-latest" "retro-gxemul:latest"
