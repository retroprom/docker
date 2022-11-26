#!/bin/bash

set -e

DEBIAN_DEFAULT="bullseye"
DEBIAN_DISTROS="bullseye"

#docker build dynamips \
#	--network host \
#	-f Dockerfile.dynamips-alpine \
#	-t "retroprom/emulator-dynamips:alpine-latest" \
#	"$@"

for d in ${DEBIAN_DISTROS}; do
	docker build dynamips \
	     --network host \
	     -f dynamips/Dockerfile.debian \
	     -t "retroprom/emulator-dynamips:${d}-latest" \
	     --build-arg BASE="debian:${d}" \
	     "$@"
done

docker tag "retroprom/emulator-dynamips:${DEBIAN_DEFAULT}-latest" "retroprom/emulator-dynamips:latest"
