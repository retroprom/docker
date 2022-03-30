#!/bin/bash

DEBIAN_DEFAULT="bullseye"
DEBIAN_DISTROS="bullseye"

#time docker build . \
#	--network host \
#	-f Dockerfile.dynamips-alpine \
#	-t "retroprom/emulator-dynamips:alpine-latest" \
#	"$@"

for d in ${DEBIAN_DISTROS}; do
	time docker build . \
	     --network host \
	     -f Dockerfile.dynamips-debian \
	     -t "retroprom/emulator-dynamips:${d}-latest" \
	     --build-arg BASE="debian:${d}" \
	     "$@"
done

docker tag "retroprom/emulator-dynamips:${DEBIAN_DEFAULT}-latest" "retroprom/emulator-dynamips:latest"
