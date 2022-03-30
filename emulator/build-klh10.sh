#!/bin/bash

DEBIAN_DEFAULT="bullseye"
DEBIAN_DISTROS="bullseye"

#time docker build . \
#	 --network host \
#	-f Dockerfile.klh10-alpine \
#	-t "retroprom/emulator-klh10:alpine-latest" \
#	"$@"

for d in ${DEBIAN_DISTROS}; do
	time docker build . \
             --network host \
	     -f Dockerfile.klh10-debian \
	     -t "retroprom/emulator-klh10:${d}-latest" \
	     --build-arg BASE="debian:${d}" \
	     "$@"
done

docker tag "retroprom/emulator-klh10:${DEBIAN_DEFAULT}-latest" "retroprom/emulator-klh10:latest"
