#!/bin/bash

DEBIAN_DEFAULT="bullseye"
DEBIAN_DISTROS="bullseye"

#time docker build . \
#	 --network host \
#	-f Dockerfile.klh10-alpine \
#	-t "retro-klh10:alpine-latest" \
#	"$@"

for d in ${DEBIAN_DISTROS}; do
	time docker build . \
             --network host \
	     -f Dockerfile.klh10-debian \
	     -t "retro-klh10:${d}-latest" \
	     --build-arg BASE="debian:${d}" \
	     "$@"
done

docker tag "retro-klh10:${DEBIAN_DEFAULT}-latest" "retro-klh10:latest"
