#!/bin/bash

DEBIAN_SOLO_TARGETS="ppc sparc x86 misc"
DEBIAN_MISC_TARGETS="alpha hppa s390x"

ALPINE_TARGETS="${DEBIAN_SOLO_TARGETS} ${DEBIAN_MISC_TARGETS}"

#for target in ${ALPINE_TARGETS}; do
#time docker build . \
	#     -f Dockerfile.qemu-alpine \
	#     -t "retro-qemu-${target}:alpine" \
	#     --network host \
	#     "$@"
#done

for target in ${DEBIAN_SOLO_TARGETS}; do
	time docker build . \
	     -f Dockerfile.qemu-debian \
	     -t "retro-qemu-${target}:debian" \
	     --network host \
	     --build-arg QEMU_TARGET="${target}" \
	     "$@"
done

for target in ${DEBIAN_MISC_TARGETS}; do
	docker tag retro-qemu-misc:debian retro-qemu-${target}:debian
done
