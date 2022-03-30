#!/bin/bash

DEBIAN_DEFAULT="bullseye"
DEBIAN_DISTROS="bullseye"

#time docker build . \
#	--network host \
#	-f Dockerfile.gxemul-alpine \
#	-t "retroprom/emulator-gxemul:alpine-latest" \
#	"$@"

for d in ${DEBIAN_DISTROS}; do
	time docker build . \
	     --network host \
	     -f Dockerfile.gxemul-debian \
	     -t "retroprom/emulator-gxemul:${d}-latest" \
	     --build-arg BASE="debian:${d}" \
	     "$@"
done

docker tag "retroprom/emulator-gxemul:${DEBIAN_DEFAULT}-latest" "retroprom/emulator-gxemul:latest"
