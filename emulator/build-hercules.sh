#!/bin/bash

DEBIAN_DEFAULT="bullseye"
DEBIAN_DISTROS="bullseye"

#time docker build . \
#	 --network host \
#	-f Dockerfile.hercules-alpine \
#	-t "retroprom/emulator-hercules:alpine-latest" \
#	"$@"

for d in ${DEBIAN_DISTROS}; do
	time docker build . \
	     --network host \
	     -f Dockerfile.hercules-debian \
	     -t "retroprom/emulator-hercules:${d}-latest" \
	     --build-arg BASE="debian:${d}" \
	     "$@"
done

docker tag "retroprom/emulator-hercules:${DEBIAN_DEFAULT}-latest" "retroprom/emulator-hercules:latest"
