#!/bin/bash

DEBIAN_DEFAULT="bullseye"
DEBIAN_DISTROS="bullseye"

#time docker build es40 \
#	--network host \
#	-f es40/Dockerfile.alpine \
#	-t "retroprom/emulator-es40:alpine-latest" \
#	"$@"

for d in ${DEBIAN_DISTROS}; do
	time docker build es40 \
	     --network host \
	     -f es40/Dockerfile.debian \
	     -t "retroprom/emulator-es40:${d}-latest" \
	     --build-arg BASE="debian:${d}" \
	     "$@"
done

docker tag "retroprom/emulator-es40:${DEBIAN_DEFAULT}-latest" "retroprom/emulator-es40:latest"
