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
#     -t "retro-qemu-${target}:alpine-latest" \
#     --build-arg SIMPLE_PKG="qemu-system-${target}" \
#     "$@"
#done

for t in ${DEBIAN_SOLO_TARGETS}; do
	for d in ${DEBIAN_DISTROS}; do
		time docker build . \
		     --network host \
		     -f Dockerfile.simple-debian \
		     -t "retro-qemu-${t}:${d}-latest" \
		     --build-arg BASE="debian:${d}" \
		     --build-arg SIMPLE_PKG="qemu-system-${t}" \
		     "$@"
	done
	docker tag "retro-qemu-${t}:${DEBIAN_DEFAULT}-latest" "retro-qemu-${t}:latest"
done

for t in ${DEBIAN_MISC_TARGETS}; do
	for d in ${DEBIAN_DISTROS}; do
		docker tag "retro-qemu-misc:${d}-latest" "retro-qemu-${t}:${d}-latest"
	done
	docker tag "retro-qemu-misc:latest" "retro-qemu-${t}:latest"
done
