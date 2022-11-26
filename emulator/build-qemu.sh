#!/bin/bash

ALPINE_TARGETS="${DEBIAN_SOLO_TARGETS} ${DEBIAN_MISC_TARGETS}"

DEBIAN_DEFAULT="bullseye"
DEBIAN_DISTROS="bullseye"
DEBIAN_SOLO_TARGETS="ppc sparc x86 misc"
DEBIAN_MISC_TARGETS="alpha hppa s390x"

#for target in ${ALPINE_TARGETS}; do
#time docker build . \
#     --network host \
#     -f Dockerfile.simple-alpine \
#     -t "retroprom/emulator-qemu-${target}:alpine-latest" \
#     --build-arg PACKAGES="qemu-system-${target}" \
#     "$@"
#done

for t in ${DEBIAN_SOLO_TARGETS}; do
	for d in ${DEBIAN_DISTROS}; do
		time docker build generic \
		     --network host \
		     -f generic/Dockerfile.debian \
		     -t "retroprom/emulator-qemu-${t}:${d}-latest" \
		     --build-arg BASE="debian:${d}" \
		     --build-arg PACKAGES="qemu-system-${t}" \
		     "$@"
	done
	docker tag "retroprom/emulator-qemu-${t}:${DEBIAN_DEFAULT}-latest" "retroprom/emulator-qemu-${t}:latest"
done

for t in ${DEBIAN_MISC_TARGETS}; do
	for d in ${DEBIAN_DISTROS}; do
		docker tag "retroprom/emulator-qemu-misc:${d}-latest" "retroprom/emulator-qemu-${t}:${d}-latest"
	done
	docker tag "retroprom/emulator-qemu-misc:latest" "retroprom/emulator-qemu-${t}:latest"
done
